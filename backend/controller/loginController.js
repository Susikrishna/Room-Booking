const loginServices = require("../services/loginservice");

exports.login = async (req,res,next) => {
    try{
        const {username,password} = req.body;
        
        let found = await loginServices.findUser(username);
        console.log((found["password"]===password));
        if(found){
            if(found["password"]===password){
                res.status(200).json({"status":true});
            }
            else{
                res.status(400).json({"status":false});
            }
        }
        else{
            res.status(400).json({"status":false});
        }
    }
    catch(err){
        if(err){
            console.log(err);
        }
        next(err);
    }
}