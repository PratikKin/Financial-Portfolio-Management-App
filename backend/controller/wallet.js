const  User = require("../models/user/User")

exports.getUserWallet = async (req, res, next) => {
    try {
        const { userId } = req.params;

        // Find the user by ID and populate the 'wallet' field
        const user = await User.findById(userId).populate('wallet');

        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        // Extract the populated wallet from the user object
        const userWallet = user.wallet;

        res.status(200).json({ success: true, data: userWallet });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    }
};