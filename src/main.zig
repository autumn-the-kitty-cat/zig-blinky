// https://github.com/artemderkach/STM32F446RE-examples-zig/blob/main/021_led_registers/main.zig

const gpio = @import("gpio.zig");
const rcc = @import("rcc.zig");

pub export fn _start() void {
    // Enable clock access
    rcc.RCC.AHB1ENR.GPIOAEN = 1;

    // Set PA_5 to output
    gpio.GPIOA.MODER.MODER5 = gpio.MODE.Output;

    while (true) {
        // Toggle PA_5
        gpio.GPIOA.ODR.ODR5 = ~gpio.GPIOA.ODR.ODR5;
        delay(500000);
    }
}

fn delay(time: u32) void {
    var i: u32 = 0;
    while (i < time) {
        asm volatile ("nop");
        i += 1;
    }
}
