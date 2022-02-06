<html>
<head>
<title>my website</title>
<link href="web1.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/javascript" align="left">

var image1=new Image();
image1.src="IMG/main1.jpg";
var image2=new Image();
image2.src="IMG/main2.jpg";
var image3=new Image();
image3.src="IMG/main3.jfif";
var image4=new Image();
image4.src="IMG/main4.jpg";
var image5=new Image();
image5.src="IMG/main5.png";
</script>
<img src="" name="slide" width="1690px" height="500">
<script type="text/javascript">

var step=1;
function slideit(){
document.images.slide.src=eval("image"+step+".src");
if(step<5)
step++;
else
step=1;
setTimeout("slideit()",3000);
}
slideit();

</script>

<div id="d">
<h2>Welcome to RecruMax</h2>
<p>This website will provide you to take exam online and thus saves your time to go far away. There are different kind of
subjects are provided for exam purpose. Candidate can select any subject for which he/she wants to take exam and then
he/she can start their exam. System provides the facility to check attempted papers by candidates automatically and shows 
result after paper submitting.<p>
</div>
<div id="nav"><center>
<ul>
<li><a href="index.jsp">Home</a></li>
<li><a href="login.jsp">Login</a></li>
<li><a href="contactuspage.html">Contact Us</a></li>
</ul></center>
</div>
<div id="footer">
    <center>Contact us: <br> Fayeka Masoodha (2019103518) <br> Vishnupriya N (2019103599)</center>
</div>
</body>
</html>