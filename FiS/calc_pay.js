function interest_debt(sum, year_rate) {
	return sum*year_rate*30/360;
}

function principal_debt(payment, interest_debt){
	return payment-interest_debt;
}

function output_line(month, payment, sum, principal_debt, interest_debt) {
	const sep = " | ";

	console.log(
		month + sep +
		payment.toFixed(2) + sep + 
		principal_debt.toFixed(2) + sep + 
		interest_debt.toFixed(2) + sep + 
		sum.toFixed(2) 
	);
}

function calc_payements(sum, year_rate, num){

	console.log("Сумма кредита: " + sum);
	console.log("Ставка: " + year_rate + "%");
	console.log("Срок: " + num);

	const month_rate = year_rate/(12*100);

	const payment = sum*month_rate*Math.pow(1+month_rate, num)/(Math.pow(1+month_rate, num)-1);

	const table = "Месяц | Ежемесячный платеж | Основной долг | Долг по процентам | Остаток основного долга";

	console.log(table);

	for (var month = 1; month <= num; month++) {
	   
		const interest_debt = (sum*year_rate*30)/(360*100);
		const principal_debt = payment-interest_debt;
		sum = sum - principal_debt;

		output_line(month, payment, sum, principal_debt, interest_debt);

		
	}
}
	z
calc_payements(100000, 13, 12);










