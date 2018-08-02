function check(){
	
	if($.trim($("#INFO_DOC_SUB").val())==""){
		alert("서류명을 입력하세요!");
		$("#INFO_DOC_SUB").val("").focus();
		return false;
	}
	
}
function fileshow(){
	if($("#filevalue").text()==""){
		$("#close").css('display','none');
	}else{
		$("#close").css('display','inline');
	}
}

$(function(){
	fileshow();
	$("#upfile").change(function(){
		$('#filevalue').text('');
		//$(this).val() => c:/fakepath/image1.png
		var inputfile=$(this).val().split('\\'); //C:,fakepath,image1.png
		$('#filevalue').text(inputfile[inputfile.length-1]);
		fileshow();
	});
	
	$("#close").click(function(){
		$('#filevalue').text('');
		$(this).css('display','none');
		
	})
	
})