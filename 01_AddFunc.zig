const std = @import("std");
const print = std.debug.print;

fn adiciona(a: i32, b: i32) i32 { //cria uma função add com a e b como entradas inteiras e uma saida inteira
    return a + b; //retorna a+b
}

pub fn main() void {
    const resultado: i32 = adiciona(10, 10); //atribui em uma constante inteira o resultado de 10+10 pela função
    print("resultado: {}\n", .{resultado}); // usa o alias de print e passa o resultado como parâmetro
}
