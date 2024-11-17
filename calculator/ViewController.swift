import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputbox: UITextField!
    
    var currentInput: String = "0"
    var firstOperand: Double?
    var secondOperand: Double?
    var operation: String?
    var disp: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        inputbox.text = "0"
    }
    
    @IBAction func btn1(_ sender: Any) { appendToInput("1") }
    @IBAction func btn2(_ sender: Any) { appendToInput("2") }
    @IBAction func btn3(_ sender: Any) { appendToInput("3") }
    @IBAction func btn4(_ sender: Any) { appendToInput("4") }
    @IBAction func btn5(_ sender: Any) { appendToInput("5") }
    @IBAction func btn6(_ sender: Any) { appendToInput("6") }
    @IBAction func btn7(_ sender: Any) { appendToInput("7") }
    @IBAction func btn8(_ sender: Any) { appendToInput("8") }
    @IBAction func btn9(_ sender: Any) { appendToInput("9") }
    @IBAction func btn0(_ sender: Any) { appendToInput("0") }
    
    @IBAction func btnEqual(_ sender: Any) {
        guard let firstOperand = firstOperand,
              let operation = operation,
              let secondOperand = Double(currentInput) else {
            print("Calculation Error: Missing operands or operation")
            return
        }
        
        let result = calculate(firstOperand: firstOperand, secondOperand: secondOperand, operation: operation)
        inputbox.text = "\(result)"
        
        self.firstOperand = result
        currentInput = ""
        self.operation = nil
        
    }
    
    @IBAction func btnClear(_ sender: Any) {
        resetCalculator()
        inputbox.text = "0"
    }
    
    @IBAction func add(_ sender: Any) { setOperation("+") }
    @IBAction func subtract(_ sender: Any) { setOperation("-") }
    @IBAction func multiply(_ sender: Any) { setOperation("*") }
    @IBAction func divide(_ sender: Any) { setOperation("/") }
    
    private func appendToInput(_ value: String) {
        if currentInput == "0" {
            currentInput = value
        } else {
            currentInput += value
        }
                displayExpression()
    }
    
    private func setOperation(_ op: String) {
        if let firstOperand = firstOperand, !currentInput.isEmpty, let secondOperand = Double(currentInput), let currentOperation = operation {
            let result = calculate(firstOperand: firstOperand, secondOperand: secondOperand, operation: currentOperation)
            self.firstOperand = result
            inputbox.text = "\(result)"
        } else if let firstOperand = Double(currentInput) {
            self.firstOperand = firstOperand
        }
        
    
        self.operation = op
        currentInput = ""
        displayExpression()
    }
    private func displayExpression() {
        var expression = ""
        
        if let firstOperand = firstOperand {
            expression += "\(firstOperand)"
        }
        
        if let operation = operation {
            expression += " \(operation) "
        }
        
        expression += currentInput
        
        inputbox.text = expression.isEmpty ? "0" : expression
    }
    
    private func calculate(firstOperand: Double, secondOperand: Double, operation: String) -> Double {
        switch operation {
        case "+": return firstOperand + secondOperand
        case "-": return firstOperand - secondOperand
        case "*": return firstOperand * secondOperand
        case "/": return firstOperand / secondOperand
        default: return 0
        }
    }
    
    private func resetCalculator() {
        currentInput = "0"
        firstOperand = nil
        secondOperand = nil
        operation = nil
        disp = nil
        inputbox.text = "0"
        print("Successcull")
    }
}
