/**
 * 
 */
const table = document.querySelector("table");
const $section = $("#order");
const $orderForm = $("#order-form");

let text = ``;
products.forEach(product => {
	text += `<tr>`;
	text += `<td><input type="radio" name="productId" value="` + product.id + `"</td>`;
	text += `<td>` + product.id + `</td>`;
	text += `<td><a href="/mvc/read.product?id=` + product.id + `">` + product.productName + `</a></td>`;
	text += `<td>` + product.productPrice + `</td>`;
	text += `<td>` + product.productStock + `</td>`;
	text += `</tr>`;
});
table.innerHTML += text;

$(table).on("click", "input[type='radio']", function(){
	const i = $("input[type='radio']").index(this);
	if(products[i].productStock === 0){
		$("input[type='radio']").prop('checked', false);
		$orderForm.find("button").hide();
		$section.html("");
		alert("상품 품절");
		return;
	}
	text += `
		<table id="order">
			<tr>
				<th>상품 번호</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>수량</th>
			</tr>
	`;
	text += `<tr>`;
	text += `<td>` + products[i].id + `</td>`;
	text += `<td>` + products[i].productName + `</td>`;
	text += `<td>` + products[i].productPrice + `</td>`;
	text += `<td><input type="text" name="productCount" placeholder="주문 수량 입력"></td>`;
	text += `</tr>`;
	text += `</table>`;
	$section.html(text);
	
	$orderForm.find("input[name='productId']").val(products[i].id);
	$orderForm.find("button").show();
});

$orderForm.find("button").on("click", function(e){
	e.preventDefault();
	$orderForm.find("input[name='productCount']").val($("td input[name='productCount']").val());
	$orderForm.submit();
});


















