const express=require("express");
const app=express();
const port=3000;
const apikey="hjysgt87e-andcommparent-84376-mcb-dt34986tj";
const { v4: uuidv4 } = require("uuid");


    function api_check(req,res,next){
    const api_key=req.headers['x-api-key'] || req.body.apikey;
    if (api_key!=apikey){
    return res.status(401).json(
    {
        status:"failed",
        message:"Invalid api_key",
    }
         );
    }
    next();
    }

    app.get("/",(req,res)=>{
        res.send("server is running");
    })

    app.post("/login",api_check,async(req,res)=>{
    try{
        const{
            username
            ,pass,
            device_id
        }=req.body;

    if(username=="GayathriChowdaryVadlamudi" && pass=="514233241"){
    return res.json({
    status:1,
    response:{
    userData:{
            username:username,
            password:pass,
            userID:uuidv4(),
            },
            AccessToken:"12345", //used to acess api's,Sent with every request,  Checked by backend
            IdentityToken:"i_12345",
            RefreshToken:"r_12345", //Used to get new access token


    }
    });
    }
    else{
    return res.json({
    status:0,
    message:"Invalid username or password",
    });
    }
    }
    catch(e){
    console.log(e);
    return res.status(500).json({
    status:"failed",
    message:"server error",
    })

    }

    });
    app.listen(port,()=>{
    console.log(`Server is running at ${port}`)})