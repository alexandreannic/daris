<script>

<%-- Retenir les elements pour ne pas avoir à reparcourir le DOM --%>
var signup_dialog = $("#signup-dialog");
var btn_signup = $("#btn-signup");


signup_dialog.dialog({
	width: 500,
	buttons: {
		" ": function() {
		},
		"": function() {
			$(this).dialog("close");
		}
	},			
	open: function(event, ui) {
		$(".validateTips").hide();
	}
});

btn_signup.click(function() {
	signup_dialog.dialog("open");
});
	

</script>