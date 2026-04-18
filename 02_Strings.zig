const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const slice: []const u8 = "String"; // cria uma string através de um slice, com cada caracter tendo o tamanho de 1 byte (unsigned 8 bits)
    const tamanho: usize = slice.len; // extrai o tamanho do conteúdo do slice e salva em uma constante tamanho

    print("String em numeros: {any}\n", .{slice}); // printa a string com o formatador n, exibindo o valor numérico de cada byte
    print("String em caracteres: {s}\n", .{slice}); // printa a string com o formatador s, exibindo como caracter
    print("Tamanho da string: {}\n", .{tamanho}); // printa o tamanho da string
}
