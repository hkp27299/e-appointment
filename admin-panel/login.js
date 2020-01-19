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

const auth = firebase.auth();
var email = document.querySelector('[name="email"]')
var password = document.querySelector('[name="password"]');
const next = auth.signInWithEmailAndPassword(email.value, password.value);


document.querySelector('form').reset();
window.location("main.html");
alert("Everyting worked.");
