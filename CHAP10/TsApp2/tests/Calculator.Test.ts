//import Calculator from '../src/Calculator';
import * as Calculator from '../src/Calculator'


it("Addition should return '6' for 5+1", () => {
    let calc = new Calculator.Calculator()
    expect(calc.addition(1,5)).toBe(6);
})