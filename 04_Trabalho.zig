const std = @import("std");
const print = std.debug.print;

const structTeste = struct { x: i32, y: i32, flo: f32 };

fn formatacaoJson(allocator: std.mem.Allocator, structVar: anytype) ![]u8 {
    const tipo = @TypeOf(structVar);
    if (@typeInfo(tipo) != .@"struct")
        @compileError("O valor passado não é um struct.");

    const chaves = std.meta.fields(tipo);
    var json: std.ArrayList(u8) = .empty;
    try json.append(allocator, '{');

    inline for (chaves, 0..) |chave, i| {
        if (i > 0)
            try json.append(allocator, ',');

        try json.append(allocator, '"');
        try json.appendSlice(allocator, chave.name);
        try json.append(allocator, '"');
        try json.append(allocator, ':');

        const valor = @field(structVar, chave.name);
        const tipo_valor = @typeInfo(@TypeOf(valor));

        if (tipo_valor == .int or tipo_valor == .float or tipo_valor == .bool) {
            try std.fmt.format(json.writer(allocator), "{}", .{valor});
        } else {
            @compileError("Apenas Int Float e Bool nessa implementação.");
        }
    }

    try json.append(allocator, '}');
    return json.toOwnedSlice(allocator);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const instancia = structTeste{ .x = 10, .y = 5, .flo = 0.0 };

    const result: []const u8 = try formatacaoJson(allocator, instancia);
    print("Struct em JSON: {s}\n", .{result});
    defer allocator.free(result);
}
