const bookModel = require("../models/bookModel")

class bookServices{
    static async bookRoom(userId,roomNumber,purpose,clubName){
        const createRequest = new bookModel({userId,roomNumber,purpose,clubName});
        return await createRequest.save();
    }

    static async viewBook(userID){
        return await bookModel.find({"userId":userID}).exec();
    }
};

module.exports = bookServices;