const bookServices = require("../services/bookservice");

exports.book = async (req,res,next) => {
    try{
        const{userId,roomNumber,purpose,clubName} = req.body;
        let dummy = await bookServices.bookRoom(userId,roomNumber,purpose,clubName);
        res.json({status: true, success:dummy});
    }
    catch(err){
        console.log(err);
        next(err);
    }
};

exports.viewBook = async (req,res,next) => {
    const {userId} = req.body;
    let allBookings = await bookServices.viewBook(userId);
    res.json({status: true, success: allBookings});
}