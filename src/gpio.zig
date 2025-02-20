/// These bits are written by software to configure the I/O direction mode.
pub const MODE = enum(u2) {
    Input,
    Output,
    Alternate,
    Analog,
};

/// These bits are written by software to configure the output type of the I/O port.
pub const OTYPE = enum(u1) {
    PushPull,
    OpenDrain,
};

/// These bits are written by software to configure the I/O output speed.
pub const OSPEED = enum(u2) {
    LowSpeed,
    MediumSpeed,
    FastSpeed,
    HighSpeed,
};

/// These bits are written by software to configure the I/O pull-up or pull-down
pub const PUPD = enum(u2) {
    NoPUPD,
    PullUp,
    PullDown,
};

pub const LCKK = enum(u1) {
    NotLocked,
    Locked,
};

pub const AFR = enum(u4) {
    AF0,
    AF1,
    AF2,
    AF3,
    AF4,
    AF5,
    AF6,
    AF7,
    AF8,
    AF9,
    AF10,
    AF11,
    AF12,
    AF13,
    AF14,
    AF15,
};

const GPIO_t = packed struct {
    MODER: packed struct {
        MODER0: MODE,
        MODER1: MODE,
        MODER2: MODE,
        MODER3: MODE,
        MODER4: MODE,
        MODER5: MODE,
        MODER6: MODE,
        MODER7: MODE,
        MODER8: MODE,
        MODER9: MODE,
        MODER10: MODE,
        MODER11: MODE,
        MODER12: MODE,
        MODER13: MODE,
        MODER14: MODE,
        MODER15: MODE,
    },

    OTYPER: packed struct {
        OT0: OTYPE,
        OT1: OTYPE,
        OT2: OTYPE,
        OT3: OTYPE,
        OT4: OTYPE,
        OT5: OTYPE,
        OT6: OTYPE,
        OT7: OTYPE,
        OT8: OTYPE,
        OT9: OTYPE,
        OT10: OTYPE,
        OT11: OTYPE,
        OT12: OTYPE,
        OT13: OTYPE,
        OT14: OTYPE,
        OT15: OTYPE,
        __reserved0: u16,
    },

    OSPEEDR: packed struct {
        OSPEEDR0: OSPEED,
        OSPEEDR1: OSPEED,
        OSPEEDR2: OSPEED,
        OSPEEDR3: OSPEED,
        OSPEEDR4: OSPEED,
        OSPEEDR5: OSPEED,
        OSPEEDR6: OSPEED,
        OSPEEDR7: OSPEED,
        OSPEEDR8: OSPEED,
        OSPEEDR9: OSPEED,
        OSPEEDR10: OSPEED,
        OSPEEDR11: OSPEED,
        OSPEEDR12: OSPEED,
        OSPEEDR13: OSPEED,
        OSPEEDR14: OSPEED,
        OSPEEDR15: OSPEED,
    },

    PUPDR: packed struct {
        PUPDR0: PUPD,
        PUPDR1: PUPD,
        PUPDR2: PUPD,
        PUPDR3: PUPD,
        PUPDR4: PUPD,
        PUPDR5: PUPD,
        PUPDR6: PUPD,
        PUPDR7: PUPD,
        PUPDR8: PUPD,
        PUPDR9: PUPD,
        PUPDR10: PUPD,
        PUPDR11: PUPD,
        PUPDR12: PUPD,
        PUPDR13: PUPD,
        PUPDR14: PUPD,
        PUPDR15: PUPD,
    },

    IDR: packed struct {
        IDR0: u1,
        IDR1: u1,
        IDR2: u1,
        IDR3: u1,
        IDR4: u1,
        IDR5: u1,
        IDR6: u1,
        IDR7: u1,
        IDR8: u1,
        IDR9: u1,
        IDR10: u1,
        IDR11: u1,
        IDR12: u1,
        IDR13: u1,
        IDR14: u1,
        IDR15: u1,
        __reserved0: u16,
    },

    ODR: packed struct {
        ODR0: u1,
        ODR1: u1,
        ODR2: u1,
        ODR3: u1,
        ODR4: u1,
        ODR5: u1,
        ODR6: u1,
        ODR7: u1,
        ODR8: u1,
        ODR9: u1,
        ODR10: u1,
        ODR11: u1,
        ODR12: u1,
        ODR13: u1,
        ODR14: u1,
        ODR15: u1,
        __reserved0: u16,
    },

    BSSR: packed struct {
        BS0: u1,
        BS1: u1,
        BS2: u1,
        BS3: u1,
        BS4: u1,
        BS5: u1,
        BS6: u1,
        BS7: u1,
        BS8: u1,
        BS9: u1,
        BS10: u1,
        BS11: u1,
        BS12: u1,
        BS13: u1,
        BS14: u1,
        BS15: u1,
        BR0: u1,
        BR1: u1,
        BR2: u1,
        BR3: u1,
        BR4: u1,
        BR5: u1,
        BR6: u1,
        BR7: u1,
        BR8: u1,
        BR9: u1,
        BR10: u1,
        BR11: u1,
        BR12: u1,
        BR13: u1,
        BR14: u1,
        BR15: u1,
    },

    LCKR: packed struct {
        LCKK0: LCKK,
        LCKK1: LCKK,
        LCKK2: LCKK,
        LCKK3: LCKK,
        LCKK4: LCKK,
        LCKK5: LCKK,
        LCKK6: LCKK,
        LCKK7: LCKK,
        LCKK8: LCKK,
        LCKK9: LCKK,
        LCKK10: LCKK,
        LCKK11: LCKK,
        LCKK12: LCKK,
        LCKK13: LCKK,
        LCKK14: LCKK,
        LCKK15: LCKK,
        LCKK16: LCKK,
        __reserved0: u15,
    },

    AFRL: packed struct {
        AFRL0: AFR,
        AFRL1: AFR,
        AFRL2: AFR,
        AFRL3: AFR,
        AFRL4: AFR,
        AFRL5: AFR,
        AFRL6: AFR,
        AFRL7: AFR,
    },

    AFRH: packed struct {
        AFRH8: AFR,
        AFRH9: AFR,
        AFRH10: AFR,
        AFRH11: AFR,
        AFRH12: AFR,
        AFRH13: AFR,
        AFRH14: AFR,
        AFRH15: AFR,
    },
};

pub const GPIOA: *volatile GPIO_t = @ptrFromInt(@as(u32, 0x40020000));
pub const GPIOB: *volatile GPIO_t = @ptrFromInt(@as(u32, 0x40020400));
pub const GPIOC: *volatile GPIO_t = @ptrFromInt(@as(u32, 0x40020800));
pub const GPIOD: *volatile GPIO_t = @ptrFromInt(@as(u32, 0x40020C00));
pub const GPIOE: *volatile GPIO_t = @ptrFromInt(@as(u32, 0x40021000));
pub const GPIOF: *volatile GPIO_t = @ptrFromInt(@as(u32, 0x40021400));
pub const GPIOG: *volatile GPIO_t = @ptrFromInt(@as(u32, 0x40021800));
pub const GPIOH: *volatile GPIO_t = @ptrFromInt(@as(u32, 0x40021C00));
