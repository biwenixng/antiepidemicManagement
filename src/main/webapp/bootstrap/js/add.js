$(function() {
	$("#addForm div > input,#addForm div > textarea").focus(function() {
		$("#msg").text("");
	});
	
	var $productNameFlag;
	var $priceFlag;
	var $inventoryFlag;
	var $synopsisFlag;
	var $weightFlag;
	var $expirationDateFlag;
	$("#productName").blur(function() {
		var $patt = /^[\u4E00-\u9FA50-9]{1,10}$/;
		if($patt.test($("#productName").val())) {
			$productNameFlag = true;
		} else {
			$productNameFlag = false;
		}

		if($productNameFlag == false) {
			$("#addForm div:eq(0) > span").text("商品名称不符合规范");
		} else {
			$("#addForm div:eq(0) > span").text("");
		}
	});
	
	$("#price").blur(function() {
		var $patt = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
		if($patt.test($("#price").val())) {
			$priceFlag = true;
		} else {
			$priceFlag = false;
		}

		if($priceFlag == false) {
			$("#addForm div:eq(1) > span").text("价格不符合规范");
		} else {
			$("#addForm div:eq(1) > span").text("");
		}
	});
	
	$("#inventory").blur(function() {
		var $patt = /^[1-9][0-9]{1,2}$/;
		if($patt.test($("#inventory").val())) {
			$inventoryFlag = true;
		} else {
			$inventoryFlag = false;
		}

		if($inventoryFlag == false) {
			$("#addForm div:eq(2) > span").text("库存不符合规范");
		} else {
			$("#addForm div:eq(2) > span").text("");
		}
	});

	$("#synopsis").blur(function() {
		var $patt = /^[\u4E00-\u9FA5\W]{20,100}$/;
		if($patt.test($("#synopsis").val())) {
			$synopsisFlag = true;
		} else {
			$synopsisFlag = false;
		}

		if($synopsisFlag == false) {
			$("#addForm div:eq(5) > span").text("商品简介不符合规范");
		} else {
			$("#addForm div:eq(5) > span").text("");
		}
	});
	
	$("#weight").blur(function() {
		var $patt = /^[1-9][0-9]{2,3}$/;
		if($patt.test($("#weight").val())) {
			$weightFlag = true;
		} else {
			$weightFlag = false;
		}

		if($weightFlag == false) {
			$("#addForm div:eq(7) > span").text("重量不符合规范");
		} else {
			$("#addForm div:eq(7) > span").text("");
		}
	});
	
	$("#expirationDate").blur(function() {
		var $patt = /^([1-3]{1}\u5e74)|([1-9]{1,2}\u4e2a\u6708)$/;
		if($patt.test($("#expirationDate").val())) {
			$expirationDateFlag = true;
		} else {
			$expirationDateFlag = false;
		}

		if($expirationDateFlag == false) {
			$("#addForm div:eq(8) > span").text("有效期不符合规范");
		} else {
			$("#addForm div:eq(8) > span").text("");
		}
	});
	
	$("#addProduct").click(function() {
		if(!$productNameFlag) {
			$("#addForm div:eq(0) > span").text("商品名称不符合规范");
		}
		
		if(!$priceFlag) {
			$("#addForm div:eq(1) > span").text("价格不符合规范");
		}
		
		if(!$inventoryFlag) {
			$("#addForm div:eq(2) > span").text("库存不符合规范");
		}
		
		if(!$synopsisFlag) {
			$("#addForm div:eq(5) > span").text("商品简介不符合规范");
		}
		
		if(!$weightFlag) {
			$("#addForm div:eq(7) > span").text("重量不符合规范");
		}
		
		if(!$expirationDateFlag) {
			$("#addForm div:eq(8) > span").text("有效期不符合规范");
		}

		if($productNameFlag && $priceFlag
			&& $inventoryFlag && $synopsisFlag
			&& $weightFlag && $expirationDateFlag) {
			
		} else {
			alert("请按要求填写信息");
			return false;
		}
	});
});