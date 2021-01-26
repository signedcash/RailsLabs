var data = new Array();
var i = 0;

function isNumber(str)
{
	for(var j in str)
	{
		if (str[i] < '0' || str[i] > '9')
			return (false);
	}
	return (true);
}

function AddNote(){
	elem = {
		name: document.forms["adding"].elements["n"].value,
		price: document.forms["adding"].elements["c"].value
	}
	if (elem.name != "" && elem.price != "" && isNumber(elem.price)) {
		data[data.length] = JSON.stringify(elem);
		SaveData();
		document.forms["adding"].elements["n"].value = "";
		document.forms["adding"].elements["c"].value = "";
		CreateTable();
	}
	else
		alert("Ошибка ввода");
}

function CalculateAll(){
	var result = 0;
	for (var j = 0; j < data.length; j++){
		elem = JSON.parse(data[j]);
		result += parseFloat(elem.price);
	}
	alert("Общая сумма заказа: " + result);
}

function SetCookie (name, value)
{
	var cookieString = name + "=" + escape(value);
	document.cookie = cookieString;
	alert("Товар добавлен в корзину");
}

function CreateTable() {
	if (localStorage.getItem("data")) {
		data = JSON.parse(localStorage.getItem("data"));
		localStorage.removeItem('data');
		var result = "";
		for (var j = 0; j < data.length; j++) {
			elem = JSON.parse(data[j]);
			console.log(j + " " + elem.name + " " + elem.price)
			result = result + "<tr>\n<td> " + (j + 1) + " </td>\n<td> " + elem.name + " </td>\n<td class='price'> " + elem.price + " </td>\n</tr>\n";
		}
		document.getElementById("table").innerHTML = '<div id = "table">\n<table>\n<tr id="header">\n<td> № </td>\n<td> Наименование </td>\n<td> Стоимость </td>\n</tr>' + result + "</table>\n</div>";

	}
}

function SetData()
{
	if (localStorage.getItem("data")) {
		data = JSON.parse(localStorage.getItem("data"));
		i = data.length;
	}
}

function SaveData()
{
	localStorage.setItem("data", JSON.stringify(data));
}

function AddData(event){
	var table = document.getElementById('tr'+event),
		cells = table.getElementsByTagName('td');
	elem = {
		name: cells[1].innerText,
		price: cells[2].innerText
	}
	data[i] = JSON.stringify(elem);
	i++;
}
