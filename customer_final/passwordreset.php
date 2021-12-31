<?php
include("include/header.php");

$id = $_GET['id'];
$token = $GET['token'];
if($id == '' || $id == null) {
    header('location: index.php');
}
else {
    $query=mysqli_query($conn, 'SELECT * FROM tbl_account WHERE accountID = '.$id.' AND passwordToken = '.$token.'');
    if($query) {
        if(mysqli_num_rows($query) > 0) {
            if(isset($_POST['submit'])) {
                $passN = $_POST['passN'];
                $passC = $_POST['passC'];

                if($passN != $passC) {
                    echo "<script>alert('Password does not match')</script>";
                }
                else {
                    $pass_query = mysqli_query($conn, "UPDATE tbl_account SET accountPassword = '".password_hash($passN, PASSWORD_DEFAULT)."' AND passwordToken = '".$token."' WHERE accountID = '".$id."'");
                    if($pass_query) {
                        echo "<script>alert('Your password has been updated')</script>";
                        echo "<script>window.open('index.php','_self')</script>";
                    }
                }
            }
        }
        else {
            echo "<script>alert('No info found')</script>";
        }
    }
	else {
		echo "<script>alert(Cannot find your account')</script>";
	}
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
					<li>Password Reset</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //page -->
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Password Reset
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
								<input type="password" name="passN" placeholder="New Password" required="">
							</div>
							<div class="">
								<input type="password" name="passC" placeholder="Confirm Password" required="">
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