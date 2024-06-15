const router = require("express").Router();
const bookController = require("../controller/bookController")

router.post('/book-room',bookController.book);
router.post('/view-bookings',bookController.viewBook);

module.exports = router;