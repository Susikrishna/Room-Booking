const loginModel = require("../models/loginModel");

class loginServices{
    static async findUser(username){
        try{
            return await loginModel.findOne({"username":username}).exec(); 
        }
        catch(err){
            console.log(err);
        }
    }
}

module.exports = loginServices;