fn VetorFixo(comptime T: type, comptime tamanho: usize) type {
    return struct {
        dados: [tamanho]T,
        len: usize,

        const Self = @This();

        pub fn init() Self {
            return .{
                .dados = undefined,
                .len = 0,
            };
        }
        pub fn adicionar(self: *Self, valor: T) !void {
            if (self.len >= tamanho) return error.Cheio;
            self.dados[self.len] = valor;
            self.len += 1;
        }
    };
}

const vetorInteiro = VetorFixo(i32, 10);
pub fn main() void {
    var vec = vetorInteiro.init();
    try vec.adicionar(42);
}

test "vetor fixo" {
    var vec = VetorFixo(u32, 10).init();
    try vec.adicionar(42);
    try vec.adicionar(99);
}
