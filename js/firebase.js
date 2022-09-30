// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCD8ewSSJJj4ObxH8weA4xlcahYM2VG5HY",
  authDomain: "jobbers-e873c.firebaseapp.com",
  projectId: "jobbers-e873c",
  storageBucket: "jobbers-e873c.appspot.com",
  messagingSenderId: "629919119020",
  appId: "1:629919119020:web:20adc5841fca21dd359109",
  measurementId: "G-MH0RGPL7D8"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);