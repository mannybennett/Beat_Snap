const express = require("express");
const AWS = require('aws-sdk');
require("dotenv").config();
const app = express();
const port = process.env.PORT || 4001;
// const usersRouter = require('./routers/users');

app.use(express.json());
// app.use('/users', usersRouter)

//********************** */

AWS.config.update({
  accessKeyId: KEY,
  secretAccessKey: S_KEY
});

const s3 = new AWS.S3({params: {Bucket: BUCKET}});

const filePath = '<file-path>';

const uploadParams = {
  Bucket: BUCKET,
  Key: KEY,
  Body: fs.createReadStream(filePath)
};

const downloadParams = {
  Bucket: BUCKET,
  Key: KEY,
};

s3.upload(uploadParams, (err, data) => {
  if (err) {
    console.error(err);
  } else {
    console.log(`File uploaded successfully. ${data.Location}`);
  }
});

s3.getObject(downloadParams, (err, data) => {
  if (err) {
    console.error(err);
  } else {
    console.log(`File downloaded successfully. ${data.Body.toString()}`);
  }
});

//********************** */

app.listen(port, () => {
 console.log(`Web server is listening on port ${port}!`);
});