#lang racket

(define (calculator)
  (display "Enter an arithmetic expression (with parentheses and operators + - * /): ")
  (flush-output) ;; çıktıyı hemen ekrana yaz
  (define expr (read)) ;; kullanıcıdan girdi al
  
  (define (evaluate expr)
    (cond
      ((number? expr) expr)
      ((list? expr)
       (let ((op (car expr))
             (args (map evaluate (cdr expr))))
         (case op
           ((+) (apply + args))
           ((-) (apply - args))
           ((*) (apply * args))
           ((/) (if (member 0 (cdr args))
                    (error "Division by zero")
                    (apply / args)))
           (else (error "Unknown operator")))))
      (else (error "Invalid expression"))))

  (define result
    (with-handlers ((exn:fail? (lambda (e) (exn-message e))))
      (evaluate expr)))

  (display "Result: ")
  (display result)
  (newline)
)

;; Fonksiyonu çağır ve çalıştır
;; işlemleri scheme diline göre yapar normal matematiksel ifade şeklinde değil. 
;; Örneğin (+ 2 (* 3 4)) = 14
(calculator)
