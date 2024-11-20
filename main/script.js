const getUserData = () => {
    const userNameEl = document.getElementById('username').value;
    const emailEl = document.getElementById('email').value;
    const passwordEl = document.getElementById('password').value;
    const secondPasswordEl = document.getElementById('passwordCheck').value;

    if (!emailEl.includes('@') || !emailEl.includes('.')) {
        alert('kiritgan emailingiz ozida "@" va "." ishtirok etirishi kerak. Masalan:example@gmail.com!');
        return;
    }

    if (userNameEl && emailEl && passwordEl && secondPasswordEl) {
        if (passwordEl === secondPasswordEl) {
            console.log(`Name: ${userNameEl}\nEmail address: ${emailEl}\nPassword: ${passwordEl}\nPassword verification: ${secondPasswordEl}`);
            alert("Siz tizimga kiritildingiz!");
            location.reload();
            return;
        } else {
            alert("siz passwordni xato kiritdingiz!");
            return;
        }
    } else {
        alert("Iltimos to'liq registratsiyadan o'ting!");
        return;
    };

};


const buttonRegister = document.getElementById('register');
buttonRegister.addEventListener('click', getUserData);
