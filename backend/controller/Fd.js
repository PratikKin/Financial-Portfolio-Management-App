const FD = require("../models/fd/fd");
const User = require("../models/user/User");

// Controller function for creating FD
exports.createFD = async (req, res, next) => {
  try {
    const {
      bankName,
      fdType,
      fdName,
      amountdeposited,
      IR,
      investedDate,
      maturityDate,
      totalAmount,
      notes,
    } = req.body;

    const userId = req.params;
    const user = await User.findById(userId.userId);

    if (!user) {
      res.status(404).json({ success: false, message: "User Not Found" });
    }

    // Create a new FD object
    const newFD = new FD({
      bankName,
      fdType,
      fdName,
      amountdeposited,
      IR,
      investedDate,
      maturityDate,
      totalAmount,
      notes,
      //   user:userId.userId
    });

    await newFD.save();

    await User.findByIdAndUpdate(userId.userId, { $push: { fds: newFD._id } });
    res.status(201).json({ success: true, message: "FD created successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: "Internal server error" });
  }
};

// function to update fd
exports.updateFD = async (req, res, next) => {
  try {
    const fdId = req.params;
    const updatedData = req.body;

    // Check if the user owns the FD
    const fd = await FD.findById(fdId.fdId);
    if (!fd) {
      return res.status(404).json({ success: false, message: "FD not found" });
    }

    // Update the FD
    const updatedFd = await FD.findByIdAndUpdate(fdId.fdId, updatedData, {
      new: true,
    });
    if (!updatedFd) {
      return res.status(404).json({ success: false, message: "FD not found" });
    }

    res.status(200).json({
      success: true,
      message: "FD updated successfully",
      //   data: updatedFd
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: "Internal server error" });
  }
};

// get all users fd
exports.getAllFdOfUser = async (req, res, next) => {
  try {
    const { userId } = req.params;

    const user = await User.findById(userId).populate("fds");
    if (!user) {
      res.status(404).json({ success: false, message: "User Not Found" });
    }

    // console.log("getAll1", userId);
    res.status(200).json({ success: true, data: user.fds });
  } catch (error) {
    console.log(error);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

// deletefdById
exports.getFdDetail = async (req, res, next) => {
  try {
    const { userId, fdId } = req.params;
    const user = await User.findById(userId);

    if (!user) {
      res.status(404).json({ success: false, message: "User not Found" });
    }

    const fd = user.fds.find((fd) => fd.equals(fdId));
    if (!fd) {
      return res
        .status(404)
        .json({ success: false, message: "FD not found for the user" });
    }

    const fdDetail = await FD.findById(fd);
    res.status(200).json({ success: true, data: fdDetail });
  } catch (error) {
    console.log(error);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

exports.deleteFdOfUser = async (req, res, next) => {
  try {
    const { userId, fdId } = req.params;
    const user = await User.findById(userId);

    if (!user) {
      res.status(404).json({ success: false, message: "User not Found" });
    }

    const fdIndex = user.fds.indexOf(fdId);

    if (fdIndex == -1) {
      res
        .status(404)
        .json({ success: false, message: "FD not Found for the user" });
    }

    user.fds.splice(fdIndex, 1);
    await user.save();

    await FD.findByIdAndDelete(fdId);
    
    res.status(200).json({ success: true, message: "FD deleted successfully" });
  } catch (error) {
    console.log(error);
    res.status(500).json({ success: false, message: "Internal server Error" });
  }
};
