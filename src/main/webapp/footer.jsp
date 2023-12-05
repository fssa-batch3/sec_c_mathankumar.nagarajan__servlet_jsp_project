
<a class="back-to-top" href="#">BACK TO TOP</a>
<footer>
	<img id="footer-logo" src="https://iili.io/HyZG4yP.png" alt="logo">
	<div class="footer">
		<div>
			<h3>
				Thanks For Visiting <br>Our Website
			</h3>
		</div>
		<div>
			<a href="#" class="footer-h3">
				<h4>Home</h4>
			</a> <a href="#" class="footer-h3">
				<h4>Stores</h4>
			</a> <a href="#" class="footer-h3">
				<h4>Foodcourt</h4>
			</a> <a href="#" class="footer-h3">
				<h4>Entertainment</h4>
			</a> <a href="#" class="footer-h3">
				<h4>Offers</h4>
			</a> <a href="#" class="footer-h3">
				<h4>Services</h4>
			</a>

		</div>
		<div>
			<h3>
				Signup Offers & Events<br> Updates
			</h3>
			<label style="display:flex; align-items:center;"> <input id="footer-email" name="email" type="email"
				placeholder="hello@gmail.com" required>
				<button type="button" onclick="email()" id="footer-button"><span class="material-symbols-outlined">send</span></button>
			</label>
			</div>
		<div>
			<h3>Follow Us</h3>
			<img class="footer-icon" src="https://iili.io/J9aEyn1.png"
				alt="facebook icon"> <img class="footer-icon"
				src="https://iili.io/J9aEbwB.png" alt="twitter icon">
			<img class="footer-icon" src="https://iili.io/J9aEmZP.png"
				alt="instagran icon"> <img class="footer-icon"
				src="https://iili.io/J9aG9MF.png" alt="youtube icon">
		</div>
	</div>

</footer>



<script src="https://smtpjs.com/v3/smtp.js"></script>

    <script>        
    	
    function email() {
        const email_btn = document.getElementById("footer-email").value;

        // e.preventDefault();

        // console.log("Email");

        Email.send({
            Host: "smtp.elasticemail.com",
            Username: "spartansmarkettown@gmail.com",
            Password: "91D930B237E09E2FC1BD214D354EBEEEC50F",
            To: email_btn,
            From: "spartansmarkettown@gmail.com",
            Subject: "SpartansMT Offers Updates",
            Body: ""
        }).then(
            message => alert("Successfully Send Mail Please Check Email Spam folder or Other folders.")
        );
    }
    
	</script>