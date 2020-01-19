var firebaseConfig = {
    apiKey: "AIzaSyBwZN-Nyltr0lPPKAvai0MBAaAx5t9QXcU",
    authDomain: "e-appointment-4f33a.firebaseapp.com",
    databaseURL: "https://e-appointment-4f33a.firebaseio.com",
    projectId: "e-appointment-4f33a",
    storageBucket: "e-appointment-4f33a.appspot.com",
    appId: "1:843955706772:web:b7d8782ff568a388adcd81"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);
let success = `<div class="cardbg"></div>`;

const logbtn = document.getElementById("logbtn");
const btnlogout = document.getElementById("btnlogout");

logbtn.addEventListener('click', e => {
    const auth = firebase.auth();
    const email = document.querySelector('[name="email"]');
    const password = document.querySelector('[name="password"]');
    auth.signInWithEmailAndPassword(email.value, password.value);
    firebase.auth().onAuthStateChanged(firebaseUser => {
        if (firebaseUser) {
            console.log(firebaseUser);
            //btnlogout.classList.remove('hide');
            // alert("Login Successfull!!!!" + "\n" +
            //     "Proceed Along");
        }
        else {
            console.log("Signed out");
            //btnlogout.classList.add('hide');
        }
    });
})

btnlogout.addEventListener('click', e => {
    firebase.auth().signOut();
})

function startrun() {
    setInterval(function () {
        window.location = "main.html";
    }, 10);
}
// document.querySelector('form').reset();
