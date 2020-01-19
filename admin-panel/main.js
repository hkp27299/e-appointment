var firebaseConfig = {
    apiKey: "AIzaSyBwZN-Nyltr0lPPKAvai0MBAaAx5t9QXcU",
    authDomain: "e-appointment-4f33a.firebaseapp.com",
    databaseURL: "https://e-appointment-4f33a.firebaseio.com",
    projectId: "e-appointment-4f33a",
    storageBucket: "e-appointment-4f33a.appspot.com",
    messagingSenderId: "843955706772",
    appId: "1:843955706772:web:b7d8782ff568a388adcd81",
    measurementId: "G-YYPHSZ3VDS"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.analytics();
var db = firebase.database();

let pname;
let gender;
let bgrp;
let ot;
let bldloss;
let des;
let bodypart;

db.ref('patient').on('value',
    function (getdata) {



        console.log(getdata.val());
        let patients = getdata.val();
        let p;

        for (let keys in patients) {
            p = patients[keys];
            pname = p.fullname;
            gender = p.gender;
            bgrp = p.bloodgroup;
            ot = p.otstatus;
            bldloss = p.bloodloss;
            des = p.discription;
            bodypart = p.injuredbodyparts;
        }



        var test = `
        <div id="get-card">
        <div id="info">
        <button class="btn" onclick = closecard()><i class="fa fa-close" style="color: white;"></i></button>
            <div class="textmain" id="pname">Patient Name: ${pname}</div>
            <div class="textmain" id="gender">Gender: ${gender}</div>
            <div class="textmain" id="bgrp">Blood Group: ${bgrp}</div>
            <div class="textmain" id="bldloss">Blood Loss: ${bldloss} %</div>
            <div class="textmain" id="bodypart">Injured Body Parts: ${bodypart}</div>
            <div class="textmain" id="des">Description: ${des}</div>
            <button class="alertbtn" onclick="alertdoc()" id="doctoralrt"><a class="example_c" >Alert Doctor</a></button>
            <button class="alertbtn" onclick="startot()" id="otstart"><a class="example_c" >Start OT</a></button>
        </div>
    </div>
    <hr>`

        document.getElementById("add-to").innerHTML += test;


        // else {
        //     var b = document.getElementById("otstart");
        //     b.setAttribute("name", "startot");
        //     b.setAttribute("disabled", "");
        // }
    });


function alertdoc() {
    let doclist = ['Dr.Rishabh', 'Dr. Solanki', 'Dr. Sachvi', 'Dr. Patel', 'Dr. Mahanta', 'Dr. Savanre'];
    alert(" Send Message To " + doclist[Math.floor(Math.random() * doclist.length)]);
}

function startot() {
    let otlist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    alert(" Prepare Operation Theatre No. " + otlist[Math.floor(Math.random() * otlist.length)])
}

function closecard() {
    var deletecard = document.getElementById("get-card");
    deletecard.parentNode.removeChild(deletecard);
}
