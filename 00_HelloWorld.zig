const std = @import("std"); // import da biblioteca standard do zig, usa @ para chamar a função própria import, que retorna um struct com o conteúdo

const print = std.debug.print; // uso de um alias "print" para chamar a função print de debug da biblioteca

pub fn main() void { // função main, que retorna void
    print("Opa!", .{}); // faz o print de "Opa!" no terminal, e não passa nada como argumento
}
