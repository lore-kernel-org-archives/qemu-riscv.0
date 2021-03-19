Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNFNJ-0003F0-SM
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNFNI-0003BG-40; Fri, 19 Mar 2021 09:41:12 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:42793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNFND-0003g9-Ux; Fri, 19 Mar 2021 09:41:11 -0400
Received: by mail-il1-x134.google.com with SMTP id l5so8046097ilv.9;
 Fri, 19 Mar 2021 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VDhVdjrIeJL/fx+Wr0yCVN5yD3Au/UgAMX3yD0ckpd8=;
 b=WuWxJg104dXPdluLvIDZ2MLxNf7t5iJ9NdcpNEYGPcvS3ns/jVRckp5dluu0HJLV+J
 J7HWpB1XdYEDAwW2vxJdFNzWIEFfc9dQgFh/uAgaMI/StQC/TqXXq6j8Ftqd7dzcF/kQ
 VT1WyJO8Scyzfzr4zfJOQg3b2uSVW7ue58sEEfnzh2e0X2fW8rsB6iRsGHSloLUkZRwr
 2w8pnxm95fAzfzCU6x9/oGLDxAByI9eWPOpUOl+NceMhM3KJ6WxpNT56JPpXn1vft30/
 QI+EmsBC1V+C1jtqstbze186RlG93XaFl0GyYbd3boyBSJb8NKZsy/7avB/YV3TFARqt
 dQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VDhVdjrIeJL/fx+Wr0yCVN5yD3Au/UgAMX3yD0ckpd8=;
 b=KS/Xf+LyQyqLBQIjQVkblHgkT4Yk9khU1oGCjd5bKFlW3LM0UGpbHtBgEsr1/zfKuM
 NUYdH3xeKkkoF74H30g/FB3Tzm6ysf4ERKOLRc28oVkRaC29hKUyAOTKzzIpuSfG45AI
 yKMJIWwzhq/N4i9UkDG8/kLyx8BKQt1ywQnXwyS7wILMqNU6HywW4cRKSF50M0ZDUacE
 nnwBEAb8VGy3ELnOz8kV0GIrdsKU5xlWLfhIapVO7O0DELL/iGB/oi8JRm2S9Jvi/Q9m
 o7cgcQp1MaycYtJaIGtcG9uPch2CmcANi2knI6gftp444cn79NfXkaxJNJEa/GBSOxpd
 dCoA==
X-Gm-Message-State: AOAM531ZyffAO6HxRiDET3I3cn/fn2WY6E2MEnpffQ8YLA9Y/PqHG5Pn
 +Hw5omC93cpJWJrXQKAWI3k0bWlcao9f4FYVKI4=
X-Google-Smtp-Source: ABdhPJzaQcJZaVOHHo8c317Ur4YbkQFqbQD8gP5dr0SqOGoQNUCuV9j9za8FGJxeK4fc0rKHqFgcqpV6ZeNN2A50P+c=
X-Received: by 2002:a05:6e02:218c:: with SMTP id
 j12mr2843645ila.177.1616161266124; 
 Fri, 19 Mar 2021 06:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210314083936.76269-1-vijai@behindbytes.com>
 <20210314083936.76269-2-vijai@behindbytes.com>
In-Reply-To: <20210314083936.76269-2-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:39:17 -0400
Message-ID: <CAKmqyKOt5M9M6ftNxZ_6tBEq5txM3ivWbKwLEZ8UA1tEkX3TJg@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Add initial support for Shakti C class
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Mar 2021 13:41:12 -0000

On Sun, Mar 14, 2021 at 5:10 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> C-Class is a member of the SHAKTI family of processors from Indian
> Institute of Technology - Madras(IIT-M).
> It is an extremely configurable and commercial-grade 5-stage in-order
> core supporting the standard RV64GCSUN ISA extensions.
>
> Add support for emulating Shakti SoC based on C-class running on arty-100T
> platform.
>
> https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.rst
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
> ---
>  MAINTAINERS                                 |   7 +
>  default-configs/devices/riscv64-softmmu.mak |   1 +
>  hw/riscv/Kconfig                            |  10 ++
>  hw/riscv/meson.build                        |   1 +
>  hw/riscv/shakti_c.c                         | 178 ++++++++++++++++++++
>  include/hw/riscv/shakti_c.h                 |  74 ++++++++
>  target/riscv/cpu.c                          |   9 +
>  target/riscv/cpu.h                          |   1 +
>  8 files changed, 281 insertions(+)
>  create mode 100644 hw/riscv/shakti_c.c
>  create mode 100644 include/hw/riscv/shakti_c.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e9f0d591e..9f71c4cc3f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1380,6 +1380,13 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
>  F: include/hw/misc/mchp_pfsoc_ioscb.h
>  F: include/hw/misc/mchp_pfsoc_sysreg.h
>
> +Shakti C class SoC
> +M: Vijai Kumar K <vijai@behindbytes.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: hw/riscv/shakti_c.c
> +F: include/hw/riscv/shakti_c.h
> +
>  SiFive Machines
>  M: Alistair Francis <Alistair.Francis@wdc.com>
>  M: Bin Meng <bin.meng@windriver.com>
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
> index d5eec75f05..bc69301fa4 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -13,3 +13,4 @@ CONFIG_SIFIVE_E=y
>  CONFIG_SIFIVE_U=y
>  CONFIG_RISCV_VIRT=y
>  CONFIG_MICROCHIP_PFSOC=y
> +CONFIG_SHAKTI_C=y
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index d139074b02..92a62b5ce9 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -19,6 +19,16 @@ config OPENTITAN
>      select IBEX
>      select UNIMP
>
> +config SHAKTI
> +    bool
> +
> +config SHAKTI_C
> +    bool
> +    select UNIMP
> +    select SHAKTI
> +    select SIFIVE_CLINT
> +    select SIFIVE_PLIC
> +
>  config RISCV_VIRT
>      bool
>      imply PCI_DEVICES
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index 275c0f7eb7..a97454661c 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -4,6 +4,7 @@ riscv_ss.add(files('numa.c'))
>  riscv_ss.add(files('riscv_hart.c'))
>  riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
>  riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
> +riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
>  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> new file mode 100644
> index 0000000000..e96436a3bf
> --- /dev/null
> +++ b/hw/riscv/shakti_c.c
> @@ -0,0 +1,178 @@
> +/*
> + * Shakti C-class SoC emulation
> + *
> + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/boards.h"
> +#include "hw/riscv/shakti_c.h"
> +#include "qapi/error.h"
> +#include "hw/intc/sifive_plic.h"
> +#include "hw/intc/sifive_clint.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/qdev-properties.h"
> +#include "exec/address-spaces.h"
> +#include "hw/riscv/boot.h"
> +
> +#define DEBUG_SHAKTI_C 0
> +#define DPRINTF(fmt, args...) \
> +    do { \
> +        if (DEBUG_SHAKTI_C) { \
> +            fprintf(stderr, "[%s]%s: " fmt , TYPE_RISCV_SHAKTI_SOC, \
> +                                             __func__, ##args); \
> +        } \
> +    } while (0)

This doesn't seem to be used, can you remove it?

> +
> +static const struct MemmapEntry {
> +    hwaddr base;
> +    hwaddr size;
> +} shakti_c_memmap[] = {
> +    [SHAKTI_C_ROM]   =  {  0x00001000,  0x2000   },
> +    [SHAKTI_C_RAM]   =  {  0x80000000,  0x0      },
> +    [SHAKTI_C_UART]  =  {  0x00011300,  0x00040  },
> +    [SHAKTI_C_GPIO]  =  {  0x020d0000,  0x00100  },
> +    [SHAKTI_C_PLIC]  =  {  0x0c000000,  0x20000  },
> +    [SHAKTI_C_CLINT] =  {  0x02000000,  0xc0000  },
> +    [SHAKTI_C_DEBUG] =  {  0x00000000,  0x00010  },
> +    [SHAKTI_C_I2C]   =  {  0x20c00000,  0x00100  },
> +};
> +
> +static void shakti_c_machine_state_init(MachineState *mstate)
> +{
> +    ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
> +    MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> +    int i;
> +
> +    /* Initialize SoC */
> +    object_initialize_child(OBJECT(mstate), "soc", &sms->soc,
> +                            TYPE_RISCV_SHAKTI_SOC);
> +    qdev_realize(DEVICE(&sms->soc), NULL, &error_abort);
> +
> +    /* register RAM */
> +    memory_region_init_ram(main_mem, NULL, "riscv.shakti.c.ram",
> +                           mstate->ram_size, &error_fatal);
> +    memory_region_add_subregion(system_memory,
> +                                shakti_c_memmap[SHAKTI_C_RAM].base,
> +                                main_mem);
> +
> +    /* ROM reset vector */
> +    uint32_t reset_vec[3];
> +
> +    reset_vec[0] = 0x080002b7;      /*  lui     t0,0x08000  */
> +    reset_vec[1] = 0x00429293;      /*  slli    t0,t0,4     */
> +    reset_vec[2] = 0x00028067;      /*  jr      t0          */

Is there a reason you can't use riscv_setup_rom_reset_vec()?

> +
> +    /* copy in the reset vector in little_endian byte order */
> +    for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
> +        reset_vec[i] = cpu_to_le32(reset_vec[i]);
> +    }
> +    rom_add_blob_fixed_as("rom.reset", reset_vec, sizeof(reset_vec),
> +                          shakti_c_memmap[SHAKTI_C_ROM].base,
> +                          &address_space_memory);
> +    riscv_load_firmware(mstate->firmware, shakti_c_memmap[SHAKTI_C_RAM].base,
> +                        NULL);
> +}
> +
> +static void shakti_c_machine_instance_init(Object *obj)
> +{
> +}
> +
> +static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(klass);
> +    mc->desc = "RISC-V Board compatible with Shakti SDK";
> +    mc->init = shakti_c_machine_state_init;
> +    mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
> +}
> +
> +static const TypeInfo shakti_c_machine_type_info = {
> +    .name = TYPE_RISCV_SHAKTI_MACHINE,
> +    .parent = TYPE_MACHINE,
> +    .class_init = shakti_c_machine_class_init,
> +    .instance_init = shakti_c_machine_instance_init,
> +    .instance_size = sizeof(ShaktiCMachineState),
> +};
> +
> +static void shakti_c_machine_type_info_register(void)
> +{
> +    type_register_static(&shakti_c_machine_type_info);
> +}
> +type_init(shakti_c_machine_type_info_register)
> +
> +static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
> +{
> +    ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev);
> +    MemoryRegion *system_memory = get_system_memory();

Can you add a newline here.

> +    sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);

and here

> +    sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
> +        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0,
> +        SHAKTI_C_PLIC_NUM_SOURCES,
> +        SHAKTI_C_PLIC_NUM_PRIORITIES,
> +        SHAKTI_C_PLIC_PRIORITY_BASE,
> +        SHAKTI_C_PLIC_PENDING_BASE,
> +        SHAKTI_C_PLIC_ENABLE_BASE,
> +        SHAKTI_C_PLIC_ENABLE_STRIDE,
> +        SHAKTI_C_PLIC_CONTEXT_BASE,
> +        SHAKTI_C_PLIC_CONTEXT_STRIDE,
> +        shakti_c_memmap[SHAKTI_C_PLIC].size);

and here

> +    sifive_clint_create(shakti_c_memmap[SHAKTI_C_CLINT].base,
> +        shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1,
> +        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> +        SIFIVE_CLINT_TIMEBASE_FREQ, false);

and here

> +    /* ROM */
> +    memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
> +                           shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
> +    memory_region_add_subregion(system_memory,
> +        shakti_c_memmap[SHAKTI_C_ROM].base, &sss->rom);
> +}
> +
> +static void shakti_c_soc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->realize = shakti_c_soc_state_realize;
> +}
> +
> +static void shakti_c_soc_instance_init(Object *obj)
> +{
> +    ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj);
> +
> +    object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY);
> +
> +    /*
> +     * CPU type is fixed and we are not supporting passing from commandline yet.
> +     * So let it be in instance_init. When supported should use ms->cpu_type
> +     * instead of TYPE_RISCV_CPU_SHAKTI_C
> +     */

You need to return an error then if the user tries to change the
number or type of CPU instead of ignoring it.

> +    object_property_set_str(OBJECT(&sss->cpus), "cpu-type",
> +                            TYPE_RISCV_CPU_SHAKTI_C, &error_abort);
> +    object_property_set_int(OBJECT(&sss->cpus), "num-harts", 1,
> +                            &error_abort);
> +}
> +
> +static const TypeInfo shakti_c_type_info = {
> +    .name = TYPE_RISCV_SHAKTI_SOC,
> +    .parent = TYPE_DEVICE,
> +    .class_init = shakti_c_soc_class_init,
> +    .instance_init = shakti_c_soc_instance_init,
> +    .instance_size = sizeof(ShaktiCSoCState),
> +};
> +
> +static void shakti_c_type_info_register(void)
> +{
> +    type_register_static(&shakti_c_type_info);
> +}
> +type_init(shakti_c_type_info_register)
> diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
> new file mode 100644
> index 0000000000..6c66a160f5
> --- /dev/null
> +++ b/include/hw/riscv/shakti_c.h
> @@ -0,0 +1,74 @@
> +/*
> + * Shakti C-class SoC emulation
> + *
> + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_SHAKTI_H
> +#define HW_SHAKTI_H
> +
> +#include "hw/riscv/riscv_hart.h"
> +#include "hw/boards.h"
> +
> +#define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
> +#define RISCV_SHAKTI_SOC(obj) \
> +    OBJECT_CHECK(ShaktiCSoCState, (obj), TYPE_RISCV_SHAKTI_SOC)
> +
> +typedef struct ShaktiCSoCState {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +
> +    /*< public >*/
> +    RISCVHartArrayState cpus;
> +    DeviceState *plic;
> +    MemoryRegion rom;
> +
> +} ShaktiCSoCState;
> +
> +#define TYPE_RISCV_SHAKTI_MACHINE MACHINE_TYPE_NAME("shakti_c")
> +#define RISCV_SHAKTI_MACHINE(obj) \
> +    OBJECT_CHECK(ShaktiCMachineState, (obj), TYPE_RISCV_SHAKTI_MACHINE)
> +typedef struct ShaktiCMachineState {
> +    /*< private >*/
> +    MachineState parent_obj;
> +
> +    /*< public >*/
> +    ShaktiCSoCState soc;
> +} ShaktiCMachineState;
> +
> +enum {
> +    SHAKTI_C_ROM,
> +    SHAKTI_C_RAM,
> +    SHAKTI_C_UART,
> +    SHAKTI_C_GPIO,
> +    SHAKTI_C_PLIC,
> +    SHAKTI_C_CLINT,
> +    SHAKTI_C_DEBUG,
> +    SHAKTI_C_I2C,
> +};
> +
> +#define SHAKTI_C_PLIC_HART_CONFIG "MS"
> +/* Including Interrupt ID 0 (no interrupt)*/
> +#define SHAKTI_C_PLIC_NUM_SOURCES 28
> +/* Excluding Priority 0 */
> +#define SHAKTI_C_PLIC_NUM_PRIORITIES 2
> +#define SHAKTI_C_PLIC_PRIORITY_BASE 0x04
> +#define SHAKTI_C_PLIC_PENDING_BASE 0x1000
> +#define SHAKTI_C_PLIC_ENABLE_BASE 0x2000
> +#define SHAKTI_C_PLIC_ENABLE_STRIDE 0x80
> +#define SHAKTI_C_PLIC_CONTEXT_BASE 0x200000
> +#define SHAKTI_C_PLIC_CONTEXT_STRIDE 0x1000
> +
> +#endif
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2a990f6253..618d203aa0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -159,6 +159,14 @@ static void rv64_base_cpu_init(Object *obj)
>      set_misa(env, RV64);
>  }
>
> +static void rv64_shakti_c_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);

Don't use RVXLEN, this is a 64-bit CPU right?

This is also exactly the same as the rv64_sifive_u_cpu_init() can we
just use an existing CPU instead of adding a new one?

> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_resetvec(env, DEFAULT_RSTVEC);
> +}
> +
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -707,6 +715,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_shakti_c_cpu_init),
>  #endif
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb2826a2..ebbf15fb1c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -38,6 +38,7 @@
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
> +#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")

Can you add the CPU in a separate patch?

Alistair

>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>  #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
>  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
> --
> 2.25.1
>
>
>

