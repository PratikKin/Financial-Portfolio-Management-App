const bcrypt = require("bcrypt"); // password handler uses to encrypt/decrypt password
// const randomString = require("randomstring");

// user model for mongodb
const User = require("../models/user/User");

//user verification model
const UserVerification = require("../models/user/UserVerification");

//user verification model
const PasswordReset = require("../models/user/PasswordReset");

// email handler-- use to send email to application
const nodemailer = require("nodemailer");

// unique id handler
const { v4: uuidv4 } = require("uuid");

// env variable
require("dotenv").config();

//path for static verified page;
const path = require("path");
const Wallet = require("../models/wallet/wallet");
// const { PassThrough } = require("nodemailer/lib/xoauth2");

// nodemailer transporter
let transporter = nodemailer.createTransport({
  service: "gmail",
  secureConnection: false,
  auth: {
    user: process.env.AUTH_EMAIL,
    pass: process.env.AUTH_PASS,
  },
});

transporter.verify((error, success) => {
  if (error) {
    console.log(error);
  } else {
    console.log("Ready for message");
    console.log(success);
  }
});

exports.getUser = async (req, res, next) => {
  let name = req.body.name;
  let email = req.body.email;
  let password = req.body.password;

  if (name == "" || email == "" || password == "") {
    res.json({
      status: "Failed",
      message: "Empty input field",
    });
  } else if (!/^[a-zA-Z ]*$/.test(name)) {
    res.json({
      status: "Failed",
      message: "Invalid name is entered",
    });
  } else if (password < 8) {
    res.json({
      message: "Password Must be 8 character",
    });
  } else {
    const existingUser = await User.findOne({ email });
    if (existingUser) {
        return res.status(400).json({ error: 'Email is already registered' });
    }
    // create wallet
    const wallet = new Wallet();
    await wallet.save();
    
    //checking user already exits
    User.find({ email })
      .then((result) => {
        if (result.length) {
          // if user already exit
          res.json({
            status: "Failed",
            message: "User with this email already exist",
          });
        } else {
          // Try to create new user
          const saltRounds = 10;
          bcrypt
            .hash(password, saltRounds)
            .then((hashpassword) => {
              const newUser = new User({
                name,
                email,
                password: hashpassword,
                // dob,
                verified: false,
                wallet: wallet._id,
              });

              newUser
                .save()
                .then((result) => {
                  sendVerificationEmail(result, res);
                })
                .catch((err) => {
                  console.log(err);
                  res.json({
                    status: "Failed",
                    message: "Error while creating new user",
                  });
                });
            })
            .catch((err) => {
              console.log(err);
              res.json({
                status: "Failed",
                message: "Error while hashing the password",
              });
            });
        }
      })
      .catch((err) => {
        console.log(err);
        res.json({
          status: "Failed",
          message: "Error while checking existing User",
        });
      });
  }
};

// send verification Email
const sendVerificationEmail = ({ _id, email }, res) => {
  // url to be used in email
  const currentUrl = "http://10.0.1.211:5000/";

  const uniqueString = uuidv4() + _id;

  //mailOption
  const mailOptions = {
    from: process.env.AUTH_EMAIL,
    to: email,
    subject: "Verify Your Email",
    html: `<p>Verify your email to complete signup and login in your account.</p><p>
        This Link will <b>expires in 6 hours</b></p><p>Click <a href=${
          currentUrl + "user/verify/" + _id + "/" + uniqueString
        }>here</a> to proceed.</p>`,
  };

  // hash the unique string

  const saltRounds = 10;
  bcrypt
    .hash(uniqueString, saltRounds)
    .then((hashedUniqueString) => {
      // set values in user verification collection
      const newVerification = new UserVerification({
        userId: _id,
        uniqueString: hashedUniqueString,
        createdAt: Date.now(),
        expiredAt: Date.now() + 21600000,
      });

      newVerification
        .save()
        .then(() => {
          transporter
            .sendMail(mailOptions)
            .then(() => {
              // email send and verification data saved
              res.json({
                status: "Pending",
                message: "Email verification sent",
              });
            })
            .catch((error) => {
              console.log(error);
              res.json({
                status: "Failed",
                message: "verification email failed",
              });
            });
        })
        .catch((error) => {
          console.log(error);
          res.json({
            status: "Failed",
            message: "couldn't save user verification data",
          });
        });
    })
    .catch((error) => {
      console.log(error);
      res.json({
        status: "Failed",
        message: "An error ocuured while hasing Unique string.",
      });
    });
};

exports.getVerify = (req, res, next) => {
  let { userId, uniqueString } = req.params;

  UserVerification.find({ userId })
    .then((result) => {
      //user verification record found so we proceed
      if (result.length > 0) {
        let { expiredAt } = result[0];
        const hashedUniqueString = result[0].uniqueString;

        //checking for expired uniqueString
        if (expiredAt < Date.now()) {
          //record has expired so we delete it

          UserVerification.deleteOne({ userId })
            .then((result) => {
              User.deleteOne({ _id: userId })
                .then(() => {
                  let message = "Link is expired. Please signUp again.";
                  res.redirect(
                    `/user/verified/error=true & message = ${message}`
                  );
                })
                .catch((error) => {
                  console.log(error);
                  let message =
                    "clearing User with expired unique string failed";
                  res.redirect(
                    `/user/verified/error=true & message = ${message}`
                  );
                });
            })
            .catch((error) => {
              console.log(error);
              let message =
                "An error occurred while deleting expired unique string";
              res.redirect(`/user/verified/error=true & message = ${message}`);
            });
        } else {
          // valid record exist so we validate user string
          // first compare hashed unique string
          bcrypt
            .compare(uniqueString, hashedUniqueString)
            .then((result) => {
              if (result) {
                User.updateOne({ _id: userId }, { verified: true })
                  .then(() => {
                    UserVerification.deleteOne({ userId })
                      .then(() => {
                        res.sendFile(
                          path.join(__dirname, "./../views/verified.html")
                        );
                      })
                      .catch((error) => {
                        console.log(error);
                        let message =
                          "An error occurred while updating user detail to show verified.";
                        res.redirect(
                          `/user/verified?error=true&message=${message}`
                        );
                      });
                  })
                  .catch((error) => {
                    console.log(error);
                    let message =
                      "An error occurred while updating user detail to show verified.";
                    res.redirect(
                      `/user/verified?error=true&message=${message}`
                    );
                  });
              } else {
                // exsting user record but invalid detail passed
                let message =
                  "Invalid verification deatil passed. Please check mail.";
                res.redirect(`/user/verified?error=true&message=${message}`);
              }
            })
            .catch((error) => {
              console.log(error);
              let message =
                "An error is occurred while comparing unique string";
              res.redirect(`/user/verified?error=true&message=${message}`);
            });
        }
      } else {
        // user verification record doesn't exist
        console.log(error);
        let message =
          "Account doesn't exist or verified earlier. Please Login or signUp";
        res.redirect(`/user/verified?error=true&message=${message}`);
      }
    })
    .catch((error) => {
      let message =
        "An error occurred while checking for existing user verification record.";
      res.redirect(`/user/verified?error=true&message=${message}`);
    });
};

// verified page
exports.verified = (req, res, next) => {
  res.sendFile(path.join(__dirname, "./../views/verified.html"));
};

// get New Password
exports.getNewPassword = (req, res, nest) => {
  let { userId, resetString, newPassword } = req.body;

  PasswordReset.find({ userId })
    .then((result) => {
      if (result.length > 0) {
        // password reset record found so we proceed

        let { expiredAt } = result[0];
        const hashedResetString = result[0].resetString;

        // checking for password reset string;
        if (expiredAt < Date.now()) {
          PasswordReset.deleteOne({ userId })
            .then(() => {
              // reset record deleted successfully
              res.json({
                status: "Success",
                message: "Password reset Link expired successfully. ",
              });
            })
            .catch((error) => {
              // deletion of password reset link failed
              console.log(error);
              res.json({
                status: "Failed",
                message: "clearing of password reset record failed",
              });
            });
        } else {
          // valid reset record found so we validate reset string
          // first compare the hashed reset string

          bcrypt
            .compare(resetString, hashedResetString)
            .then((result) => {
              if (result) {
                // string matched
                // hashed new password

                const saltRounds = 10;

                bcrypt
                  .hash(newPassword, saltRounds)
                  .then((hashedNewPassword) => {
                    // update user password
                    User.updateOne(
                      { _id: userId },
                      { password: hashedNewPassword }
                    )
                      .then(() => {
                        // update complete now. delete reset password string
                        PasswordReset.deleteOne({ userId })
                          .then(() => {
                            // both user record and user record updated
                            res.json({
                              status: "Success",
                              message: "Password has been reset successfully.",
                            });
                          })
                          .catch((error) => {
                            console.log(error);
                            res.json({
                              status: "Failed",
                              message:
                                "An error occurred while finalizing reset password.",
                            });
                          });
                      })
                      .catch((error) => {
                        console.log(error);
                        res.json({
                          status: "Failed",
                          message:
                            "An error occurred while hashing updating newPassword.",
                        });
                      });
                  })
                  .catch((error) => {
                    console.log(error);
                    res.json({
                      status: "Failed",
                      message: "An error occurred while hashing new password.",
                    });
                  });
              } else {
                // existing record but invalid reset string
                res.json({
                  status: "Failed",
                  message: "Invalid reset string passed",
                });
              }
            })
            .catch((error) => {
              console.log(error);
              res.json({
                status: "Failed",
                message: "An error occurred while comparing reset string",
              });
            });
        }
      } else {
        //password reset record doesn't exist
        res.json({
          status: "Failed",
          message: "password reset recorde doesn't exist ",
        });
      }
    })
    .catch((error) => {
      console.log(error);
      res.json({
        status: "Failed",
        message: "Checking existing password to reset record failed ",
      });
    });
};

exports.logInUser = (req, res, next) => {
  let email = req.body.email;
  let password = req.body.password;
  
  if (email == "" || password == "") {
    res.json({
      status: "Failed",
      message: "Empty Credential",
    });
  } else {
    // if user exists

    User.find({ email })
      .then((data) => {
        // user exist
        if (data.length) {
          // check if user is verified
          if (!data[0].verified) {
            res.json({
              status: "Success",
              message: "Email hasn't be verified please check your mail",
            });
          } else {
            const hashpassword = data[0].password;
            bcrypt
              .compare(password, hashpassword)
              .then((result) => {
                if (result) {
                  res.json({
                    status: "Success",
                    message: "Signin Successfully",
                    data: data,
                  });
                } else {
                  res.json({
                    status: "Failed",
                    message: "Invalid Credential",
                  });
                }
              })
              .catch((err) => {
                console.log(err);
                res.json({
                  status: "Failed",
                  message: "An error while comparing password",
                });
              });
          }
        } else {
          res.json({
            status: "Failed",
            message: "Invalid Credentials",
          });
        }
      })
      .catch((err) => {
        console.log(err);
        res.json({
          status: "Failed",
          message: "An error occurred while finding existing user",
        });
      });
  }
};

// Password Reset Stuff
exports.getPasswordReset = (req, res, next) => {
  let { email, redirectUrl } = req.body;

  // check if email exist

  User.find({ email })
    .then((data) => {
      if (data.length > 0) {
        // email exist

        // check email is verified

        if (!data[0].verified) {
          res.json({
            status: "Failed",
            message: "Email is not verified Please check verify your email.",
          });
        } else
          [
            // proceed with email to reset password
            sendResetEmail(data[0], redirectUrl, res),
          ];
      } else {
        res.json({
          status: "Failed",
          message: "No account exist with entered email exist.",
        });
      }
    })
    .catch((err) => {
      console.log(err);
      res.json({
        status: "Failed",
        message: "An error occurred while finding existing user",
      });
    });
};

// send reset Email
const sendResetEmail = ({ _id, email }, redirectUrl, res) => {
  const resetString = uuidv4() + _id;

  PasswordReset.deleteMany({ userId: _id })
    .then((result) => {
      //reset record deleted successfully
      // now send email

      const mailOptions = {
        from: process.env.AUTH_EMAIL,
        to: email,
        subject: "Password Reset",
        html: `<p>We heared you have lost your password.</p><p>Don't worry, use the below link to reset it </p><p>This Link will <b>expires in 60 minutes</b></p><p>Click <a href=${
          redirectUrl + "/" + _id + "/" + resetString
        }>here</a> to proceed.</p>`,
      };

      // hashed the reset string

      const saltRounds = 10;
      bcrypt
        .hash(resetString, saltRounds)
        .then((hashedResetString) => {
          // save the value in password reset collection.

          const newPasswordReset = new PasswordReset({
            userId: _id,
            resetString: hashedResetString,
            createdAt: Date.now(),
            expiredAt: Date.now() + 3600000,
          });

          newPasswordReset
            .save()
            .then(() => {
              transporter
                .sendMail(mailOptions)
                .then(() => {
                  res.json({
                    status: "Pending",
                    message: "Password Reset Email send Successfully",
                  });
                })
                .catch((err) => {
                  console.log(err);
                  res.json({
                    status: "Failed",
                    message: "Password reset email failed",
                  });
                });
            })
            .catch((err) => {
              console.log(err);
              res.json({
                status: "Failed",
                message: "couldn't save password reset data",
              });
            });
        })
        .catch((err) => {
          console.log(err);
          res.json({
            status: "Failed",
            message: "An error occurred while hashing password reset data",
          });
        });
    })
    .catch((err) => {
      // error while clearing existing record
      console.log(err);
      res.json({
        status: "Failed",
        message: "clearing existing reset record failed",
      });
    });
};
