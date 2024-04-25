const express = require("express");
const router = express.Router();

const FDController = require("../controller/Fd")

// create fd
router.post('/:userId/create_fd',FDController.createFD);

// update
router.put('/:userId/fds/:fdId', FDController.updateFD);

// getAllFd
router.get('/:userId/fds',FDController.getAllFdOfUser);

// fd details
router.get('/:userId/fds/:fdId',FDController.getFdDetail);

// delete fd
router.delete('/:userId/fds/:fdId',FDController.deleteFdOfUser)

module.exports = router;