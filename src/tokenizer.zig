const std = @import("std");

pub const Token = struct {
    tag: Tag,
    loc: Loc,

    pub const Loc = struct {
        start: usize,
        end: usize,
    };

    pub const keywords = std.StaticStringMap(Tag).initComptime(.{
        .{ "ABORT", .keyword_abort },
        .{ "ACTION", .keyword_action },
        .{ "ADD", .keyword_add },
        .{ "AFTER", .keyword_after },
        .{ "ALL", .keyword_all },
        .{ "ALTER", .keyword_alter },
        .{ "ALWAYS", .keyword_always },
        .{ "ANALYZE", .keyword_analyze },
        .{ "AND", .keyword_and },
        .{ "AS", .keyword_as },
        .{ "ASC", .keyword_asc },
        .{ "ATTACH", .keyword_attach },
        .{ "AUTOINCREMENT", .keyword_autoincrement },
        .{ "BEFORE", .keyword_before },
        .{ "BEGIN", .keyword_begin },
        .{ "BETWEEN", .keyword_between },
        .{ "BY", .keyword_by },
        .{ "CASCADE", .keyword_cascade },
        .{ "CASE", .keyword_case },
        .{ "CAST", .keyword_cast },
        .{ "CHECK", .keyword_check },
        .{ "COLLATE", .keyword_collate },
        .{ "COLUMN", .keyword_column },
        .{ "COMMIT", .keyword_commit },
        .{ "CONFLICT", .keyword_conflict },
        .{ "CONSTRAINT", .keyword_constraint },
        .{ "CREATE", .keyword_create },
        .{ "CROSS", .keyword_cross },
        .{ "CURRENT", .keyword_current },
        .{ "CURRENT_DATE", .keyword_current_date },
        .{ "CURRENT_TIME", .keyword_current_time },
        .{ "CURRENT_TIMESTAMP", .keyword_current_timestamp },
        .{ "DATABASE", .keyword_database },
        .{ "DEFAULT", .keyword_default },
        .{ "DEFERRABLE", .keyword_deferrable },
        .{ "DEFERRED", .keyword_deferred },
        .{ "DELETE", .keyword_delete },
        .{ "DESC", .keyword_desc },
        .{ "DETACH", .keyword_detach },
        .{ "DISTINCT", .keyword_distinct },
        .{ "DO", .keyword_do },
        .{ "DROP", .keyword_drop },
        .{ "EACH", .keyword_each },
        .{ "ELSE", .keyword_else },
        .{ "END", .keyword_end },
        .{ "ESCAPE", .keyword_escape },
        .{ "EXCEPT", .keyword_except },
        .{ "EXCLUDE", .keyword_exclude },
        .{ "EXCLUSIVE", .keyword_exclusive },
        .{ "EXISTS", .keyword_exists },
        .{ "EXPLAIN", .keyword_explain },
        .{ "FAIL", .keyword_fail },
        .{ "FILTER", .keyword_filter },
        .{ "FIRST", .keyword_first },
        .{ "FOLLOWING", .keyword_following },
        .{ "FOR", .keyword_for },
        .{ "FOREIGN", .keyword_foreign },
        .{ "FROM", .keyword_from },
        .{ "FULL", .keyword_full },
        .{ "GENERATED", .keyword_generated },
        .{ "GLOB", .keyword_glob },
        .{ "GROUP", .keyword_group },
        .{ "GROUPS", .keyword_groups },
        .{ "HAVING", .keyword_having },
        .{ "IF", .keyword_if },
        .{ "IGNORE", .keyword_ignore },
        .{ "IMMEDIATE", .keyword_immediate },
        .{ "IN", .keyword_in },
        .{ "INDEX", .keyword_index },
        .{ "INDEXED", .keyword_indexed },
        .{ "INITIALLY", .keyword_initially },
        .{ "INNER", .keyword_inner },
        .{ "INSERT", .keyword_insert },
        .{ "INSTEAD", .keyword_instead },
        .{ "INTERSECT", .keyword_intersect },
        .{ "INTO", .keyword_into },
        .{ "IS", .keyword_is },
        .{ "ISNULL", .keyword_isnull },
        .{ "JOIN", .keyword_join },
        .{ "KEY", .keyword_key },
        .{ "LAST", .keyword_last },
        .{ "LEFT", .keyword_left },
        .{ "LIKE", .keyword_like },
        .{ "LIMIT", .keyword_limit },
        .{ "MATCH", .keyword_match },
        .{ "MATERIALIZED", .keyword_materialized },
        .{ "NATURAL", .keyword_natural },
        .{ "NO", .keyword_no },
        .{ "NOT", .keyword_not },
        .{ "NOTHING", .keyword_nothing },
        .{ "NOTNULL", .keyword_notnull },
        .{ "NULL", .keyword_null },
        .{ "NULLS", .keyword_nulls },
        .{ "OF", .keyword_of },
        .{ "OFFSET", .keyword_offset },
        .{ "ON", .keyword_on },
        .{ "OR", .keyword_or },
        .{ "ORDER", .keyword_order },
        .{ "OTHERS", .keyword_others },
        .{ "OUTER", .keyword_outer },
        .{ "OVER", .keyword_over },
        .{ "PARTITION", .keyword_partition },
        .{ "PLAN", .keyword_plan },
        .{ "PRAGMA", .keyword_pragma },
        .{ "PRECEDING", .keyword_preceding },
        .{ "PRIMARY", .keyword_primary },
        .{ "QUERY", .keyword_query },
        .{ "RAISE", .keyword_raise },
        .{ "RANGE", .keyword_range },
        .{ "RECURSIVE", .keyword_recursive },
        .{ "REFERENCES", .keyword_references },
        .{ "REGEXP", .keyword_regexp },
        .{ "REINDEX", .keyword_reindex },
        .{ "RELEASE", .keyword_release },
        .{ "RENAME", .keyword_rename },
        .{ "REPLACE", .keyword_replace },
        .{ "RESTRICT", .keyword_restrict },
        .{ "RETURNING", .keyword_returning },
        .{ "RIGHT", .keyword_right },
        .{ "ROLLBACK", .keyword_rollback },
        .{ "ROW", .keyword_row },
        .{ "ROWS", .keyword_rows },
        .{ "SAVEPOINT", .keyword_savepoint },
        .{ "SELECT", .keyword_select },
        .{ "SET", .keyword_set },
        .{ "TABLE", .keyword_table },
        .{ "TEMP", .keyword_temp },
        .{ "TEMPORARY", .keyword_temporary },
        .{ "THEN", .keyword_then },
        .{ "TIES", .keyword_ties },
        .{ "TO", .keyword_to },
        .{ "TRANSACTION", .keyword_transaction },
        .{ "TRIGGER", .keyword_trigger },
        .{ "UNBOUNDED", .keyword_unbounded },
        .{ "UNION", .keyword_union },
        .{ "UNIQUE", .keyword_unique },
        .{ "UPDATE", .keyword_update },
        .{ "USING", .keyword_using },
        .{ "VACUUM", .keyword_vacuum },
        .{ "VALUES", .keyword_values },
        .{ "VIEW", .keyword_view },
        .{ "VIRTUAL", .keyword_virtual },
        .{ "WHEN", .keyword_when },
        .{ "WHERE", .keyword_where },
        .{ "WINDOW", .keyword_window },
        .{ "WITH", .keyword_with },
        .{ "WITHOUT", .keyword_without },
    });

    pub fn getKeyword(bytes: []const u8) ?Tag {
        return keywords.get(bytes);
    }

    pub const Tag = enum {
        // Non-printable
        invalid,
        identifier,
        string_literal,
        numeric_literal,
        line_comment_start,
        line_comment,
        mutiline_comment_start,
        multiline_comment,
        eof,

        period,
        comma,
        l_paren,
        r_paren,
        underscore,
        semicolon,

        // Operators
        asterisk,
        equal,
        equal_equal,
        bang_equal,
        minus,
        minus_angle_bracket_right,
        minus_angle_bracket_angle_bracket_right,
        angle_bracket_left,
        angle_bracket_angle_bracket_left,
        angle_bracket_left_equal,
        angle_bracket_right,
        angle_bracket_angle_bracket_right,
        angle_bracket_right_equal,
        angle_bracket_left_angle_bracket_right,
        plus,
        percent,
        ampersand,
        pipe,
        pipe_pipe,
        tilde,
        slash,

        keyword_abort,
        keyword_action,
        keyword_add,
        keyword_after,
        keyword_all,
        keyword_alter,
        keyword_always,
        keyword_analyze,
        keyword_and,
        keyword_as,
        keyword_asc,
        keyword_attach,
        keyword_autoincrement,
        keyword_before,
        keyword_begin,
        keyword_between,
        keyword_by,
        keyword_cascade,
        keyword_case,
        keyword_cast,
        keyword_check,
        keyword_collate,
        keyword_column,
        keyword_commit,
        keyword_conflict,
        keyword_constraint,
        keyword_create,
        keyword_cross,
        keyword_current,
        keyword_current_date,
        keyword_current_time,
        keyword_current_timestamp,
        keyword_database,
        keyword_default,
        keyword_deferrable,
        keyword_deferred,
        keyword_delete,
        keyword_desc,
        keyword_detach,
        keyword_distinct,
        keyword_do,
        keyword_drop,
        keyword_each,
        keyword_else,
        keyword_end,
        keyword_escape,
        keyword_except,
        keyword_exclude,
        keyword_exclusive,
        keyword_exists,
        keyword_explain,
        keyword_fail,
        keyword_filter,
        keyword_first,
        keyword_following,
        keyword_for,
        keyword_foreign,
        keyword_from,
        keyword_full,
        keyword_generated,
        keyword_glob,
        keyword_group,
        keyword_groups,
        keyword_having,
        keyword_if,
        keyword_ignore,
        keyword_immediate,
        keyword_in,
        keyword_index,
        keyword_indexed,
        keyword_initially,
        keyword_inner,
        keyword_insert,
        keyword_instead,
        keyword_intersect,
        keyword_into,
        keyword_is,
        keyword_isnull,
        keyword_join,
        keyword_key,
        keyword_last,
        keyword_left,
        keyword_like,
        keyword_limit,
        keyword_match,
        keyword_materialized,
        keyword_natural,
        keyword_no,
        keyword_not,
        keyword_nothing,
        keyword_notnull,
        keyword_null,
        keyword_nulls,
        keyword_of,
        keyword_offset,
        keyword_on,
        keyword_or,
        keyword_order,
        keyword_others,
        keyword_outer,
        keyword_over,
        keyword_partition,
        keyword_plan,
        keyword_pragma,
        keyword_preceding,
        keyword_primary,
        keyword_query,
        keyword_raise,
        keyword_range,
        keyword_recursive,
        keyword_references,
        keyword_regexp,
        keyword_reindex,
        keyword_release,
        keyword_rename,
        keyword_replace,
        keyword_restrict,
        keyword_returning,
        keyword_right,
        keyword_rollback,
        keyword_row,
        keyword_rows,
        keyword_savepoint,
        keyword_select,
        keyword_set,
        keyword_table,
        keyword_temp,
        keyword_temporary,
        keyword_then,
        keyword_ties,
        keyword_to,
        keyword_transaction,
        keyword_trigger,
        keyword_unbounded,
        keyword_union,
        keyword_unique,
        keyword_update,
        keyword_using,
        keyword_vacuum,
        keyword_values,
        keyword_view,
        keyword_virtual,
        keyword_when,
        keyword_where,
        keyword_window,
        keyword_with,
        keyword_without,

        pub fn lexeme(tag: Tag) ?[]const u8 {
            return switch (tag) {
                .invalid,
                .identifier,
                .string_literal,
                .numeric_literal,
                .blob_literal,
                .eof,
                => null,

                .period => ".",
                .comma => ",",
                .asterisk => "*",
                .l_paren => "(",
                .r_paren => ")",
                .underscore => "_",

                .keyword_abort => "ABORT",
                .keyword_action => "ACTION",
                .keyword_add => "ADD",
                .keyword_after => "AFTER",
                .keyword_all => "ALL",
                .keyword_alter => "ALTER",
                .keyword_always => "ALWAYS",
                .keyword_analyze => "ANALYZE",
                .keyword_and => "AND",
                .keyword_as => "AS",
                .keyword_asc => "ASC",
                .keyword_attach => "ATTACH",
                .keyword_autoincrement => "AUTOINCREMENT",
                .keyword_before => "BEFORE",
                .keyword_begin => "BEGIN",
                .keyword_between => "BETWEEN",
                .keyword_by => "BY",
                .keyword_cascade => "CASCADE",
                .keyword_case => "CASE",
                .keyword_cast => "CAST",
                .keyword_check => "CHECK",
                .keyword_collate => "COLLATE",
                .keyword_column => "COLUMN",
                .keyword_commit => "COMMIT",
                .keyword_conflict => "CONFLICT",
                .keyword_constraint => "CONSTRAINT",
                .keyword_create => "CREATE",
                .keyword_cross => "CROSS",
                .keyword_current => "CURRENT",
                .keyword_current_date => "CURRENT_DATE",
                .keyword_current_time => "CURRENT_TIME",
                .keyword_current_timestamp => "CURRENT_TIMESTAMP",
                .keyword_database => "DATABASE",
                .keyword_default => "DEFAULT",
                .keyword_deferrable => "DEFERRABLE",
                .keyword_deferred => "DEFERRED",
                .keyword_delete => "DELETE",
                .keyword_desc => "DESC",
                .keyword_detach => "DETACH",
                .keyword_distinct => "DISTINCT",
                .keyword_do => "DO",
                .keyword_drop => "DROP",
                .keyword_each => "EACH",
                .keyword_else => "ELSE",
                .keyword_end => "END",
                .keyword_escape => "ESCAPE",
                .keyword_except => "EXCEPT",
                .keyword_exclude => "EXCLUDE",
                .keyword_exclusive => "EXCLUSIVE",
                .keyword_exists => "EXISTS",
                .keyword_explain => "EXPLAIN",
                .keyword_fail => "FAIL",
                .keyword_filter => "FILTER",
                .keyword_first => "FIRST",
                .keyword_following => "FOLLOWING",
                .keyword_for => "FOR",
                .keyword_foreign => "FOREIGN",
                .keyword_from => "FROM",
                .keyword_full => "FULL",
                .keyword_generated => "GENERATED",
                .keyword_glob => "GLOB",
                .keyword_group => "GROUP",
                .keyword_groups => "GROUPS",
                .keyword_having => "HAVING",
                .keyword_if => "IF",
                .keyword_ignore => "IGNORE",
                .keyword_immediate => "IMMEDIATE",
                .keyword_in => "IN",
                .keyword_index => "INDEX",
                .keyword_indexed => "INDEXED",
                .keyword_initially => "INITIALLY",
                .keyword_inner => "INNER",
                .keyword_insert => "INSERT",
                .keyword_instead => "INSTEAD",
                .keyword_intersect => "INTERSECT",
                .keyword_into => "INTO",
                .keyword_is => "IS",
                .keyword_isnull => "ISNULL",
                .keyword_join => "JOIN",
                .keyword_key => "KEY",
                .keyword_last => "LAST",
                .keyword_left => "LEFT",
                .keyword_like => "LIKE",
                .keyword_limit => "LIMIT",
                .keyword_match => "MATCH",
                .keyword_materialized => "MATERIALIZED",
                .keyword_natural => "NATURAL",
                .keyword_no => "NO",
                .keyword_not => "NOT",
                .keyword_nothing => "NOTHING",
                .keyword_notnull => "NOTNULL",
                .keyword_null => "NULL",
                .keyword_nulls => "NULLS",
                .keyword_of => "OF",
                .keyword_offset => "OFFSET",
                .keyword_on => "ON",
                .keyword_or => "OR",
                .keyword_order => "ORDER",
                .keyword_others => "OTHERS",
                .keyword_outer => "OUTER",
                .keyword_over => "OVER",
                .keyword_partition => "PARTITION",
                .keyword_plan => "PLAN",
                .keyword_pragma => "PRAGMA",
                .keyword_preceding => "PRECEDING",
                .keyword_primary => "PRIMARY",
                .keyword_query => "QUERY",
                .keyword_raise => "RAISE",
                .keyword_range => "RANGE",
                .keyword_recursive => "RECURSIVE",
                .keyword_references => "REFERENCES",
                .keyword_regexp => "REGEXP",
                .keyword_reindex => "REINDEX",
                .keyword_release => "RELEASE",
                .keyword_rename => "RENAME",
                .keyword_replace => "REPLACE",
                .keyword_restrict => "RESTRICT",
                .keyword_returning => "RETURNING",
                .keyword_right => "RIGHT",
                .keyword_rollback => "ROLLBACK",
                .keyword_row => "ROW",
                .keyword_rows => "ROWS",
                .keyword_savepoint => "SAVEPOINT",
                .keyword_select => "SELECT",
                .keyword_set => "SET",
                .keyword_table => "TABLE",
                .keyword_temp => "TEMP",
                .keyword_temporary => "TEMPORARY",
                .keyword_then => "THEN",
                .keyword_ties => "TIES",
                .keyword_to => "TO",
                .keyword_transaction => "TRANSACTION",
                .keyword_trigger => "TRIGGER",
                .keyword_unbounded => "UNBOUNDED",
                .keyword_union => "UNION",
                .keyword_unique => "UNIQUE",
                .keyword_update => "UPDATE",
                .keyword_using => "USING",
                .keyword_vacuum => "VACUUM",
                .keyword_values => "VALUES",
                .keyword_view => "VIEW",
                .keyword_virtual => "VIRTUAL",
                .keyword_when => "WHEN",
                .keyword_where => "WHERE",
                .keyword_window => "WINDOW",
                .keyword_with => "WITH",
                .keyword_without => "WITHOUT",
            };
        }

        pub fn symbol(tag: Tag) ?[]const u8 {
            return tag.lexeme() orelse switch (tag) {
                .invalid => "invalid bytes",
                .identifier => "an identifier",
                .string_literal => "a string literal",
                .numeric_literal => "a number literal",
                .blob_literal => "a blob literal",
                .eof => "EOF",
                else => unreachable,
            };
        }
    };
};

pub const Tokenizer = struct {
    buffer: [:0]const u8,
    index: usize,
    pending_invalid_token: ?Token,

    /// For debugging purposes
    pub fn dump(self: *Tokenizer, token: *const Token) void {
        std.debug.print("{s} \"{s}\"\n", .{
            @tagName(token.tag),
            self.buffer[token.loc.start..token.loc.end],
        });
    }

    pub fn init(buffer: [:0]const u8) Tokenizer {
        // Skip the UTF-8 BOM if present
        const src_start: usize = if (std.mem.startsWith(u8, buffer, "\xEF\xBB\xBF")) 3 else 0;
        return Tokenizer{
            .buffer = buffer,
            .index = src_start,
            .pending_invalid_token = null,
        };
    }

    const State = enum {
        start,

        identifier,

        // numeric literals
        int,
        int_period,
        int_exponent,
        float,
        float_exponent,

        string_literal,

        // operators
        bang,
        equal,
        angle_bracket_left,
        angle_bracket_right,
        minus,
        minus_angle_bracket_right,
    };

    pub fn next(self: *Tokenizer) Token {
        if (self.pending_invalid_token) |token| {
            self.pending_invalid_token = null;
            return token;
        }
        var state: State = .start;
        var result = Token{
            .tag = .eof,
            .loc = .{
                .start = self.index,
                .end = undefined,
            },
        };

        while (true) : (self.index += 1) {
            const c = self.buffer[self.index];
            switch (state) {
                .start => switch (c) {
                    0 => {
                        if (self.index != self.buffer.len) {
                            result.tag = .invalid;
                            result.loc.start = self.index;
                            self.index += 1;
                            result.loc.end = self.index;
                            return result;
                        }
                        break;
                    },
                    ' ', '\n', '\t', '\r' => {
                        result.loc.start = self.index + 1;
                    },
                    'a'...'z', 'A'...'Z' => {
                        state = .identifier;
                        result.tag = .identifier;
                    },
                    '0'...'9' => {
                        state = .int;
                        result.tag = .numeric_literal;
                    },
                    '\'' => {
                        state = .string_literal;
                        result.tag = .string_literal;
                    },
                    '.' => {
                        result.tag = .period;
                        self.index += 1;
                        break;
                    },
                    ',' => {
                        result.tag = .comma;
                        self.index += 1;
                        break;
                    },
                    ';' => {
                        result.tag = .semicolon;
                        self.index += 1;
                        break;
                    },
                    '&' => {
                        result.tag = .ampersand;
                        self.index += 1;
                        break;
                    },
                    '+' => {
                        result.tag = .plus;
                        self.index += 1;
                        break;
                    },
                    '*' => {
                        result.tag = .asterisk;
                        self.index += 1;
                        break;
                    },
                    '/' => {
                        result.tag = .slash;
                        self.index += 1;
                        break;
                    },
                    '%' => {
                        result.tag = .percent;
                        self.index += 1;
                        break;
                    },
                    '-' => state = .minus,
                    '!' => state = .bang,
                    '=' => state = .equal,
                    '<' => state = .angle_bracket_left,
                    '>' => state = .angle_bracket_right,
                    '|' => state = .pipe,
                    else => {
                        result.tag = .invalid;
                        result.loc.end = self.index;
                        self.index += 1;
                        return result;
                    },
                },
                .identifier => switch (c) {
                    'a'...'z', 'A'...'Z', '0'...'9', '_' => {},
                    else => {
                        if (Token.getKeyword(self.buffer[result.loc.start..self.index])) |tag| {
                            result.tag = tag;
                        }
                        break;
                    },
                },
                .int => switch (c) {
                    '.' => state = .int_period,
                    '_', 'a'...'d', 'f'...'z', 'A'...'D', 'F'...'Z', '0'...'9' => {},
                    'e', 'E' => state = .int_exponent,
                    else => break,
                },
                .int_exponent => switch (c) {
                    '-', '+' => state = .float,
                    else => {
                        self.index -= 1;
                        state = .int;
                    },
                },
                .int_period => switch (c) {
                    '_', 'a'...'d', 'f'...'z', 'A'...'D', 'F'...'Z', '0'...'9' => state = .float,
                    'e', 'E' => state = .float_exponent,
                    else => {
                        self.index -= 1;
                        break;
                    },
                },
                .float => switch (c) {
                    '_', 'a'...'d', 'f'...'z', 'A'...'D', 'F'...'Z', '0'...'9' => {},
                    'e', 'E' => state = .float_exponent,
                    else => break,
                },
                .float_exponent => switch (c) {
                    '-', '+' => state = .float,
                    else => {
                        self.index -= 1;
                        state = .float;
                    },
                },
                .string_literal => switch (c) {
                    '\'' => {
                        self.index += 1;
                        break;
                    },
                    0 => {
                        if (self.index == self.buffer.len) {
                            result.tag = .invalid;
                            break;
                        } else {
                            self.checkLiteralCharacter();
                        }
                    },
                    '\n' => {
                        result.tag = .invalid;
                        break;
                    },
                    else => self.checkLiteralCharacter(),
                },
                .minus => switch (c) {
                    '>' => state = .minus_angle_bracket_right,
                    else => {
                        result.tag = .minus;
                        break;
                    },
                },
                .minus_angle_bracket_right => switch (c) {
                    '>' => {
                        result.tag = .minus_angle_bracket_angle_bracket_right;
                        self.index += 1;
                        break;
                    },
                    else => {
                        result.tag = .minus_angle_bracket_right;
                        break;
                    },
                },
                .bang => switch (c) {
                    '=' => {
                        result.tag = .bang_equal;
                        self.index += 1;
                        break;
                    },
                    else => {
                        result.tag = .invalid;
                        break;
                    },
                },
                .equal => switch (c) {
                    '=' => {
                        result.tag = .equal_equal;
                        self.index += 1;
                        break;
                    },
                    else => {
                        result.tag = .equal;
                        break;
                    },
                },
                .angle_bracket_left => switch (c) {
                    '<' => {
                        result.tag = .angle_bracket_angle_bracket_left;
                        self.index += 1;
                        break;
                    },
                    '>' => {
                        result.tag = .angle_bracket_left_angle_bracket_right;
                        self.index += 1;
                        break;
                    },
                    '=' => {
                        result.tag = .angle_bracket_left_equal;
                        self.index += 1;
                        break;
                    },
                    else => {
                        result.tag = .angle_bracket_left;
                        break;
                    },
                },
                .angle_bracket_right => switch (c) {
                    '>' => {
                        result.tag = .angle_bracket_angle_bracket_right;
                        self.index += 1;
                        break;
                    },
                    '=' => {
                        result.tag = .angle_bracket_right_equal;
                        self.index += 1;
                        break;
                    },
                    else => {
                        result.tag = .angle_bracket_right;
                        break;
                    },
                },
                .pipe => switch (c) {
                    '|' => {
                        result.tag = .pipe_pipe;
                        self.index += 1;
                        break;
                    },
                    else => {
                        result.tag = .pipe;
                        break;
                    },
                },
                // else => {
                //     result.tag = .invalid;
                //     result.loc.end = self.index;
                //     self.index += 1;
                //     return result;
                // },
            }
        }

        if (result.tag == .eof) {
            if (self.pending_invalid_token) |token| {
                self.pending_invalid_token = null;
                return token;
            }
            result.loc.start = self.index;
        }
        result.loc.end = self.index;
        return result;
    }

    fn checkLiteralCharacter(self: *Tokenizer) void {
        if (self.pending_invalid_token != null) return;
        const invalid_length = self.getInvalidCharacterLength();
        if (invalid_length == 0) return;
        self.pending_invalid_token = .{
            .tag = .invalid,
            .loc = .{
                .start = self.index,
                .end = self.index + invalid_length,
            },
        };
    }

    fn getInvalidCharacterLength(self: *Tokenizer) u3 {
        const c0 = self.buffer[self.index];
        if (std.ascii.isASCII(c0)) {
            if (c0 == '\r') {
                if (self.index + 1 < self.buffer.len and self.buffer[self.index + 1] == '\n') {
                    // Carriage returns are *only* allowed just before a linefeed as part of a CRLF pair, otherwise
                    // they constitute an illegal byte!
                    return 0;
                } else {
                    return 1;
                }
            } else if (std.ascii.isControl(c0)) {
                // ascii control codes are never allowed
                // (note that \n was checked before we got here)
                return 1;
            }
            // looks fine to me.
            return 0;
        } else {
            // check utf8-encoded character.
            const length = std.unicode.utf8ByteSequenceLength(c0) catch return 1;
            if (self.index + length > self.buffer.len) {
                return @as(u3, @intCast(self.buffer.len - self.index));
            }
            const bytes = self.buffer[self.index .. self.index + length];
            switch (length) {
                2 => {
                    const value = std.unicode.utf8Decode2(bytes) catch return length;
                    if (value == 0x85) return length; // U+0085 (NEL)
                },
                3 => {
                    const value = std.unicode.utf8Decode3(bytes) catch return length;
                    if (value == 0x2028) return length; // U+2028 (LS)
                    if (value == 0x2029) return length; // U+2029 (PS)
                },
                4 => {
                    _ = std.unicode.utf8Decode4(bytes) catch return length;
                },
                else => unreachable,
            }
            self.index += length - 1;
            return 0;
        }
    }
};

test "numeric literals decimal" {
    try testTokenize("0", &.{.numeric_literal});
    try testTokenize("1", &.{.numeric_literal});
    try testTokenize("2", &.{.numeric_literal});
    try testTokenize("3", &.{.numeric_literal});
    try testTokenize("4", &.{.numeric_literal});
    try testTokenize("5", &.{.numeric_literal});
    try testTokenize("6", &.{.numeric_literal});
    try testTokenize("7", &.{.numeric_literal});
    try testTokenize("8", &.{.numeric_literal});
    try testTokenize("9", &.{.numeric_literal});
    try testTokenize("0a", &.{.numeric_literal});
    try testTokenize("9b", &.{.numeric_literal});
    try testTokenize("1z", &.{.numeric_literal});
    try testTokenize("1z_1", &.{.numeric_literal});
    try testTokenize("9z3", &.{.numeric_literal});

    try testTokenize("0_0", &.{.numeric_literal});
    try testTokenize("0001", &.{.numeric_literal});
    try testTokenize("01234567890", &.{.numeric_literal});
    try testTokenize("012_345_6789_0", &.{.numeric_literal});
    try testTokenize("0_1_2_3_4_5_6_7_8_9_0", &.{.numeric_literal});

    try testTokenize("00_", &.{.numeric_literal});
    try testTokenize("0_0_", &.{.numeric_literal});
    try testTokenize("0__0", &.{.numeric_literal});
    try testTokenize("0_0f", &.{.numeric_literal});
    try testTokenize("0_0_f", &.{.numeric_literal});
    try testTokenize("0_0_f_00", &.{.numeric_literal});
    try testTokenize("1_,", &.{ .numeric_literal, .comma });

    try testTokenize("0.0", &.{.numeric_literal});
    try testTokenize("1.0", &.{.numeric_literal});
    try testTokenize("10.0", &.{.numeric_literal});
    try testTokenize("0e0", &.{.numeric_literal});
    try testTokenize("1e0", &.{.numeric_literal});
    try testTokenize("1e100", &.{.numeric_literal});
    try testTokenize("1.0e100", &.{.numeric_literal});
    try testTokenize("1.0e+100", &.{.numeric_literal});
    try testTokenize("1.0e-100", &.{.numeric_literal});
    try testTokenize("1_0_0_0.0_0_0_0_0_1e1_0_0_0", &.{.numeric_literal});

    try testTokenize("1.", &.{ .numeric_literal, .period });
    try testTokenize("1e", &.{.numeric_literal});
    try testTokenize("1.e100", &.{.numeric_literal});
    try testTokenize("1.0e1f0", &.{.numeric_literal});
    try testTokenize("1.0p100", &.{.numeric_literal});
    try testTokenize("1.0p1f0", &.{.numeric_literal});
    try testTokenize("1.0_,", &.{ .numeric_literal, .comma });
    try testTokenize("1_.0", &.{.numeric_literal});
    try testTokenize("1._", &.{.numeric_literal});
    try testTokenize("1.a", &.{.numeric_literal});
    try testTokenize("1.z", &.{.numeric_literal});
    try testTokenize("1._0", &.{.numeric_literal});
    try testTokenize("1.+", &.{ .numeric_literal, .period, .plus });
    try testTokenize("1._+", &.{ .numeric_literal, .plus });
    try testTokenize("1._e", &.{.numeric_literal});
    try testTokenize("1.0e", &.{.numeric_literal});
    try testTokenize("1.0e,", &.{ .numeric_literal, .comma });
    try testTokenize("1.0e_", &.{.numeric_literal});
    try testTokenize("1.0e+_", &.{.numeric_literal});
    try testTokenize("1.0e-_", &.{.numeric_literal});
    try testTokenize("1.0e0_+", &.{ .numeric_literal, .plus });
}

test "newline in string literal" {
    try testTokenize(
        \\"
        \\"
    , &.{ .invalid, .invalid });
}

test "keywords" {
    try testTokenize("FILTER ABORT CURRENT_TIMESTAMP", &.{
        .keyword_filter,
        .keyword_abort,
        .keyword_current_timestamp,
    });
}

test "string identifier" {
    try testTokenize(
        \\SELECT * FROM users;
    , &.{
        .keyword_select,
        .asterisk,
        .keyword_from,
        .identifier,
        .semicolon,
    });

    try testTokenize(
        \\UPDATE users SET name = 'Jane Doe' WHERE id = 1;
    , &.{
        .keyword_update,
        .identifier,
        .keyword_set,
        .identifier,
        .equal,
        .string_literal,
        .keyword_where,
        .identifier,
        .equal,
        .numeric_literal,
        .semicolon,
    });
}

fn testTokenize(source: [:0]const u8, expected: []const Token.Tag) !void {
    var tokenizer = Tokenizer.init(source);
    for (expected) |expected_token_tag| {
        const token = tokenizer.next();
        try std.testing.expectEqual(expected_token_tag, token.tag);
    }
    const last_token = tokenizer.next();
    try std.testing.expectEqual(Token.Tag.eof, last_token.tag);
    try std.testing.expectEqual(source.len, last_token.loc.start);
    try std.testing.expectEqual(source.len, last_token.loc.end);
}
