require('dotenv').config()
const path = require('path');
const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken');
const authMiddleware = require ('./middleware/auth-middleware');
const authorizationMiddleware = require ('./middleware/authorization-middleware');
const swaggerUi = require('swagger-ui-express');
const yaml = require('yaml');
const fs =  require('fs')
//const { JWT_SIGN } = require('../config/jwt.js');
const openApiPath = './doc/openapi.yaml';
const OpenApiValidator = require('express-openapi-validator');
const file = fs.readFileSync(openApiPath, 'utf8');
const swaggerDocument = yaml.parse(file);


const app = express(); 


app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// app.use(OpenApiValidator.middleware({
//     apiSpec: openApiPath,
//     validateRequest:true
// }));

app.use(express.json());

const blogRoutes = require('./routes/blog');
const userRoutes = require('./routes/user');

const commonResponse = function(data, error){
    if (error){
        return {
            success : false,
            error : error
        }
    }

    return {
            success: true,
            data : data
    }

}

app.use((err, req, res, next) => {
    res.status(err.status || 500).json({
        message: err.message,
        errors: err.message
    })
})



app.set('views', 'views');



app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));


// const authenticationMiddleware = (request, response, next) => {
//     const authHeader = request.headers['authorization'];

//     if (!authHeader) {
//         response.status(401).json(commonResponse(null, "Unauthorized"));
//         return;
//     }

//     const token = authHeader.split(' ')[1]; 
//     if (!token) {
//         response.status(401).json(commonResponse(null, "Unauthorized"));
//         return;
//     }

//         try {
//             const decodedToken = jwt.verify(token, 'your-secret-keys');
           
//             next(); 
//         } catch (error) {
//             response.status(401).json(commonResponse(null, "Unauthorized"));
//         }
// }



const mysqlCon = mysql.createConnection({
    host: 'localhost',
    port:3306,
    user:'root',
    password:'',
    database:'2023_blogs',
})

app.use(bodyParser.json())

app.use(blogRoutes);
app.use(userRoutes);




app.post('/register', (request, response) => {
    const body = request.body;
    
    mysqlCon.query(
        `SELECT * FROM 2023_blogs.users WHERE username = ?`,
        [body.username],
        (err, result, fields) => {
            if (err) {
                response.status(500).json(commonResponse(null, "server error"));
                response.end();
                return;
            }

            if (result.length > 0) {
                response.status(400).json(commonResponse(null, "Username already exists"));
                response.end();
                return;
            }

            bcrypt.hash(body.password, 10, (hashErr, hashedPassword) => {
                if (hashErr) {
                    response.status(500).json(commonResponse(null, "Hashing error"));
                    response.end();
                    return;
                }

                mysqlCon.query(
                    `INSERT INTO 2023_blogs.users (username, password, role) VALUES (?, ?, ?)`,
                    [body.username, hashedPassword, body.role],
                    (insertErr, insertResult, insertFields) => {
                        if (insertErr) {
                            response.status(500).json(commonResponse(null, "Server error"));
                            response.end();
                            return;
                        }

                        response.status(200).json(commonResponse(insertResult, null));
                        response.end();
                    }
                );
            });
        }
    );
});


app.post('/login', (request, response) => {
    const body = request.body;
    
    mysqlCon.query(
        `SELECT * FROM 2023_blogs.users WHERE username = ?`,
        [body.username],
        (err, result, fields) => {
            if (err) {
                response.status(500).json(commonResponse(null, "Server error"));
                response.end();
                return;
            }

            if (result.length === 0) {
                response.status(401).json(commonResponse(null, "Invalid username or password"));
                response.end();
                return;
            }

            const user = result[0];
            bcrypt.compare(body.password, user.password, (compareErr, isMatch) => {
                if (compareErr || !isMatch) {
                    response.status(401).json(commonResponse(null, "Invalid username or password"));
                    response.end();
                    return;
                }

                const payload = {
                    userId: user.id,
                    username: user.username
                };

                const secretKey = 'your-secret-key'; // Replace with your actual secret key
                // const options = {
                //     expiresIn: '1h' // Token expiration time
                // };

                //const token = jwt.sign(payload, secretKey, options, my_sign);
                const token = jwt.sign({ username: user.username, id: user.id, role: user.role}, 'my_sign');

                response.status(200).json(commonResponse(token, null));
                response.end();
            });
        }
    );
});



app.listen(3000, () => {
    console.log("running in 3000")
})