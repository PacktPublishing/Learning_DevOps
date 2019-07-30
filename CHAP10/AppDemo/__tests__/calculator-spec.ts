import { Calculator } from '../src/calculator';

test('Should greet with message', () => {
  const calc = new Calculator('friend');
  expect(calc.greet()).toBe('Hello, friend!');
});
