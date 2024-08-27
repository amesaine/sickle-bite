const std = @import("std");
const io = std.io;
const mem = std.mem;
const heap = std.heap;

const Chunk = @import("chunk.zig");
const dbg = @import("debug.zig");
const tokenizer = @import("tokenizer.zig");

var scratch_buf: [3000]u8 = undefined;

const stdout = io.getStdIn().writer();
const stdin = io.getStdIn().reader();

pub fn main() !void {
    const name = "sikolayt";
    var t = tokenizer.Tokenizer.init(name);
    _ = t.next();
}

pub fn startRepl() !void {
    printIntro();
    while (true) {
        scratch_buf = undefined;

        printPrompt();

        const input = try stdin.readUntilDelimiter(&scratch_buf, '\n');

        if (mem.eql(u8, input, ".exit")) {
            std.process.cleanExit();
        }
    }
}

pub fn printPrompt() !void {
    stdout.writeAll("scklbte>");
}

pub fn printIntro() !void {
    const intro =
        \\SQLite version 3.40.1 2022-12-28 14:03:47
        \\Enter ".help" for usage hints.
        \\Connected to a transient in-memory database.
        \\Use ".open FILENAME" to reopen on a persistent database.
        \\
    ;
    stdout.writeAll(intro);
}
