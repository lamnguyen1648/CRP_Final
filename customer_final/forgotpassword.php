<?php
include("include/header.php");
if(isset($_POST['submit'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $query = mysqli_query($conn, 'SELECT * FROM tbl_account WHERE accountUsername = '.$name.' AND accountEmail = '.$email.'');
    if($query) {
        if(mysqli_num_rows($query) > 0) {
            $token = md5(rand());
            $token_query = mysqli_query($conn, 'UPDATE tbl_account SET passwordToken = '.$token.' WHERE accountID = '.$query['accountID'].'');
            if($token_query) {
                $subject = 'Password Recovery';
                $content = '
                Please click the following link to recover your account:
                http://localhost/crp/customer_final/passwordreset.php?id='.$query['accountID'].'&token='.$token.'
                ';
				$sender = "From:lamsubaruotaku2k1@gmail.com";
                if(mail($email, $subject, $content, $sender)) {
                    echo "<script>alert('Please check your email to continue the recovery process')</script>";
                    echo "<script>window.open('index.php','_self')</script>";
                }
				else {
					echo "<script>alert('Error while sending email, please contact customer service to recover your password')</script>";
				}
            }
            else {
                echo "<script>alert('Something went wrong')</script>";
            }
        }
        else {
            echo "<script>alert('No info matched')</script>";
        }
    }
    echo "<script>alert('Something went wrong with the verifying process')</script>";
}
?>
	<!-- page -->
	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">
			<div class="container">
				<ul class="w3_short">
					<li>
						<a href="index.php">Home</a>
						<i>|</i>
					</li>
					<li>Forgot Password</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //page -->
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Forgot Password
				<span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
			</h3>
			<!-- //tittle heading -->
			<!-- contact -->
			<div class="contact agileits">
				<div class="contact-agileinfo">
					<div class="contact-form wthree">
						<form method="post">
							<div class="">
								<input type="text" name="name" placeholder="Username" required="">
							</div>
							<div class="">
								<input type="email" name="email" placeholder="Email" required="">
							</div>
							<input type="submit" value="Submit">
						</form>
					</div>
				</div>
			</div>
			<!-- //contact -->
		</div>
	</div>
	<!-- map -->
	<!-- <div class="map w3layouts">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d55565170.29301636!2d-132.08532758867793!3d31.786060306224!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2sUnited+States!5e0!3m2!1sen!2sin!4v1512365940398"
		    allowfullscreen></iframe>
	</div> -->
	<!-- //map -->
<?php 
include("include/footer.php");
?>