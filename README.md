This app uses Flutter for Frontend, Nodejs for Backend and MongoDb for database.
The frontend doesn't have a register section, the idea was to allow only a few selected people to use the app. We could give those user their usernames and passwords seperately.
You have to add your own username and password to mongodb.

About the backend:
There are 6 main files:

i) app.js: The server is created here.

ii) config(directory) => db.js - The connection to mongoDb is made here.

iii) models(directory) => bookModel.js - The Data schema of storing the booking information.
                       => loginModel.js - The Data schema of storing the login(username and password) information.

iv) routes(directory) => bookRoutes.js - The routes for all requests for booking a room and viewing book is made here.
                      => loginRoutes.js - The routes for request to login is made here.
                      
v) controller(directory)=> bookController.js - The functions to be called when some route in bookRoutes.js is called is written here.
                        => loginController.js - The functions to be called when some route in login.js is called is written here.
  
vi) services(directory)=> loginservices - Consists of some functions that are used in loginController.js (Fumctions that get data from mongoDb)
                       => bookservies - Consists of some functions that are used in bookController.js (Fumctions that get data from mongoDb)


To add you username and password:
1) Add to the loginModel.js the following code:
   const user = new loginModel({"your username","your password"});
   user.save();
2) Then start the server and close it after some time.
3) Now you username and password will be added.
4) Then remove the code we added in the first step.
