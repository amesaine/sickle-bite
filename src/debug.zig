const std = @import("std");
const Chunk = @import("chunk.zig");

pub fn disassembleChunk(chunk: *Chunk, name: []const u8) void {
    std.debug.print("== {s} ==\n", .{name});

    var offset: usize = 0;
    while (offset < chunk.code.items.len) {
        offset = disassembleInstruction(chunk, offset);
    }
}

pub fn disassembleInstruction(chunk: *Chunk, offset: usize) usize {
    std.debug.print("{:0>4} ", .{offset});

    const instruction = chunk.code.items[offset];

    switch (instruction) {
        .exit => {
            return simpleInstruction(instruction, offset);
        },
        else => {
            std.debug.print("Unknown opcode {?}", .{instruction});
            return offset + 1;
        },
    }
}

pub fn simpleInstruction(instruction: Chunk.OpCode, offset: usize) usize {
    std.debug.print("{?}", .{instruction});
    return offset + 1;
}
