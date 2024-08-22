const std = @import("std");
const Allocator = std.mem.Allocator;

const Chunk = @This();

pub const value = i32;

code: std.ArrayList(OpCode),
values: std.ArrayList(i32),

pub fn init(allocator: Allocator) Chunk {
    return .{
        .code = std.ArrayList(OpCode).init(allocator),
        .values = std.ArrayList(value).init(allocator),
    };
}

pub fn deinit(self: *Chunk) void {
    self.code.deinit();
    self.values.deinit();
}

pub const OpCode = enum {
    exit,
    select,
    insert,
    constant,
};
