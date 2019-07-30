export class Calculator {
  private greeting: string;

  constructor(message: string) {
    this.greeting = message;
  }

  public greet(): string {
    return `Hello, ${this.greeting}!`;
  }

  public addition(a: number, b: number): number {
    return a + b;
  }

  public substract(a: number, b: number): number {
    return a - b;
  }

  public divid(a: number, b: number): number {
    return a / b;
  }

  public addTwo(x: number): number {
    if (x && x) {
      return x + 2;
    }
    return x;
  }
}
