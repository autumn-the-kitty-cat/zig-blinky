const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{ .default_target = .{
        .cpu_arch = .thumb,
        .os_tag = .freestanding,
        .cpu_model = .{ .explicit = &std.Target.Cpu.Model{
            .name = "cortex_m4",
            .features = std.Target.Cpu.Feature.Set.empty,
            .llvm_name = "cortex-m4",
        } },
    } });
    const optimize = b.standardOptimizeOption(.{ .preferred_optimize_mode = .ReleaseSmall });

    const firmware = b.addExecutable(.{
        .name = "firmware.elf",
        .root_source_file = b.path("src/main.zig"),
        .optimize = optimize,
        .target = target,
        .strip = true,
    });

    firmware.bundle_compiler_rt = false;
    firmware.entry = .disabled;

    firmware.addAssemblyFile(b.path("statup.s"));
    firmware.setLinkerScript(b.path("src/linker.ld"));

    b.installArtifact(firmware);

    const run = b.addSystemCommand(&.{
        "openocd",
        "-f",
        "board/st_nucleo_f4.cfg",
        "-c",
        "program zig-out/bin/firmware.elf verify reset exit",
    });
    run.has_side_effects = true;

    const runStep = b.step("run", "Run firmware on target");
    runStep.dependOn(b.getInstallStep());
    runStep.dependOn(&run.step);
}
