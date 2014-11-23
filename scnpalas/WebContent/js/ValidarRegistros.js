function puedoBorrar(entidadValidar){
	var xRequest;
	if (entidadValidar == ""){
		return null;
	}
	if (window.XMLHttpRequest){
		xRequest=new XMLHttpRequest();
	}else{
		xRequest=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xRequest.onreadystatechange = function() {
		if(xRequest.readyState == 4 && xRequest.status == 200){
			resultado = xRequest.responseText;
		}
	}
	xRequest.open("get",entidadValidar,ident,"true");
	xRequest.send();
}