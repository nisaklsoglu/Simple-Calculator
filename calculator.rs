use std::io; //user input için kullanılan kütüphane

fn main() {
    //kullanıcıdan girdi alınır
    println!("Enter an arithmetic expression with parentheses (e.g., ( 3 + 4 ) * 2 ): ");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read input");

    //sonuç ekrana yazdırılır
    match eval_expr(&input) {
        Some(result) => println!("The result is: {}", result),
        None => println!("Invalid expression!"),
    }
}

// artimetik ifadeyi işlem önceliğine ve parantezlere göre değerlendiren fonksiyon
fn eval_expr(expr: &str) -> Option<f64> {
    //ifadeyi boşluklardan ayırarak tokenlara dönüştürür
    let tokens: Vec<&str> = expr.trim().split_whitespace().collect();
    let mut numbers = vec![];
    let mut operators = vec![];

    let mut i = 0;
    while i < tokens.len() {
        match tokens[i] {
            "(" => operators.push(tokens[i]), //açılan parantezi stacke ekler
            ")" => {
                while !operators.is_empty() && operators[operators.len() - 1] != "(" {
                    if !apply_operation(&mut numbers, operators.pop().unwrap()) {
                        return None;
                    }
                } //kapanan parantez bulana kadar işlem devam eder
                operators.pop(); // pop the '(' parenthesis
            }
            token if token.parse::<f64>().is_ok() => numbers.push(token.parse::<f64>().unwrap()),
            token => {
                //operatör önceliğine göre işlemler yapılır
                while !operators.is_empty() && precedence(operators[operators.len() - 1]) >= precedence(token) {
                    if !apply_operation(&mut numbers, operators.pop().unwrap()) {
                        return None;
                    }
                }
                operators.push(token);
            }
        }
        i += 1;
    }

    //kalan tüm operatörler işlenir
    while !operators.is_empty() {
        if !apply_operation(&mut numbers, operators.pop().unwrap()) {
            return None;
        }
    }

    numbers.pop()
}

// aritmetik işlemler uygulanır
fn apply_operation(numbers: &mut Vec<f64>, operator: &str) -> bool {
    if numbers.len() < 2 {
        return false;
    }

    let b = numbers.pop().unwrap();
    let a = numbers.pop().unwrap();

    numbers.push(match operator {
        "+" => a + b,
        "-" => a - b,
        "*" => a * b,
        "/" => a / b,
        _ => return false,
    });

    true
}

// işlem önceliği 
fn precedence(op: &str) -> u8 {
    match op {
        "*" | "/" => 2,
        "+" | "-" => 1,
        _ => 0,
    }
}





