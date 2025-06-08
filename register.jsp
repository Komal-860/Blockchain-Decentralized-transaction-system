<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Bank</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
html,body{
    background-image: url(images/img.gif);
}
</style>
<script type="text/JavaScript">

</script>
<script>
var stateObject = {
"Pre-Primary Class": {
"Pre-KG": ["", ""],
"KG": ["", ""],
"Upper-KG": ["", ""],
},
"Primary Class": {
	"1": ["", ""],
	"2": ["", ""],
	"3": ["", ""],
	"4": ["", ""],
	"5": ["", ""],
	"6": ["", ""],
	"7": ["", ""],
	"8": ["", ""],

	
}, "Secondary Class": {
"9": ["", ""],
"10": ["", ""],

},

 "Higher_Secondary Class": {
	"11": ["", ""],
	"12": ["", ""],

	},
}
window.onload = function () {
var countySel = document.getElementById("countySel"),
stateSel = document.getElementById("stateSel"),
districtSel = document.getElementById("districtSel");
for (var country in stateObject) {
	countySel.options[countySel.options.length] = new Option(country, country);
	}
	countySel.onchange = function () {
	stateSel.length = 1; // remove all options bar first
	
	if (this.selectedIndex < 1) return; // done 
	for (var state in stateObject[this.value]) {
	stateSel.options[stateSel.options.length] = new Option(state, state);
	}
	}
	countySel.onchange(); // reset in case page is reloaded
	stateSel.onchange = function () {
	
	if (this.selectedIndex < 1) return; // done 
	var district = stateObject[countySel.value][this.value];
	for (var i = 0; i < district.length; i++) {
	
	}
	}
	}
	</script>
</head>

<body>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" style="font-weight:normal; background-color:#FFFFFF">
  <tr>
    <th colspan="3" scope="col" style="height:90px; background-color:#2175bc;"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="900" height="90">
      <param name="movie" value="images/banks.swf" />
      <param name="quality" value="high" />
      <embed src="images/banks.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="900" height="90"></embed>
    </object></th>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
<td>
 <table width="98%" border="1" align="center" cellpadding="1" cellspacing="0" style="margin-right: 40%">
      <tr>
        <th colspan="2" scope="col"><div class="box1">
          <marquee>
            <h2><font color="#FF0000">Online Bank.</font></h2>
            </marquee>
        </div></th>
        </tr>
      <tr>
	  
        <th colspan="2" scope="col">
        <form id="form1" name="form1" method="post" action="dbRegister">
          <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2" style="border:#000000 solid 2px;padding:5px;">
            <tr>
              <th colspan="3" bgcolor="#000000" scope="col" style="height:20px;"><font color="#FFFFFF">Customer Registration For new Account</font></th>
              </tr>
            <tr>
              <td width="28%" rowspan="12"><div align="center"><img src="images/kdmconfig.png" width="48" height="48" /></div></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="24%"><div align="left">Username:</div></td>
              <td width="48%"><label>
                <div align="left">
                  <input name="username" type="text" id="username" required/>
                  </div>
              </label></td>
            </tr>
            <tr>
              <td><div align="left">Password:</div></td>
              <td><div align="left">
                <input name="password" type="password" id="password" required />
              </div></td>
            </tr>
            <tr>
              <td><div align="left">Security Question: </div></td>
              <td><div align="left">
                <select name="question" required>
                <option value="">Select Security Question?</option>
                  <option value="Your First School Name">Your First School Name?</option>
                  <option value="Your Car Number">Your Car Number?</option>
                  <option value="Your Mothers Name">Your Mothers Name?</option>
                  <option value="Favorite Color">Favorite Color?</option>
                </select>
              </div></td>
            </tr>
            <tr>
              <td><div align="left">Answer:</div></td>
              <td><div align="left">
                <input name="answer" type="text" id="answer" size="30" required/>
              </div></td>
            </tr>
            <tr>
              <td><div align="left">Address:</div></td>
              <td><div align="left">
                <textarea name="address" id="address" required></textarea>
              </div></td>
            </tr>
            <tr>
              <td><div align="left">E-mail:</div></td>
              <td><div align="left">
                <input name="email" type="text" id="email" required  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
                 />
              </div></td>
            </tr>
            <tr>
              <td><div align="left">Mobile:</div></td>
              <td><div align="left">
                <input name="mobile" type="text" id="mobile"  required pattern="[7-9]{1}[0-9]{9}"  maxlength="10"/>
              </div></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
    
            <tr>
             
              <td colspan="2"><label>
                
                    <div align="left">
                      <input name="Submit" type="submit"  value="Create Account"  />
                    </div>
                  </label></td>
              </tr>
              <tr>
              <td colspan="3">Want to Login Account? <a href="index.jsp">Click Here</a> </td>
              </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
                </form>        </th>
                
        </tr>
        
      <tr>
        <td width="50%">&nbsp;</td>
        <td width="50%">&nbsp;</td>
      </tr>
    </table>

</td>
  </tr>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
