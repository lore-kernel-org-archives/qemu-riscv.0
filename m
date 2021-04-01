Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lS0y4-0004ua-LB
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 13:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lS0y2-0004t1-EA; Thu, 01 Apr 2021 13:18:50 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lS0xr-0005UY-8H; Thu, 01 Apr 2021 13:18:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617297506; cv=none; d=zohomail.in; s=zohoarc; 
 b=aJgYB6reTMZgDETjLu8M6z8sEE/PwEfdnem7zKIZEygOsYSI9HqeWpWBarS83QbUJ8eFWCndc9BEq38qGBviE1nYG/tccgaMKQ/84qIYNNVl/2v8eqUyAS1VnJa1iAtXtNsryhX07GAg6pR7ogiik62eM9COvU1skIRL78x/o2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1617297506;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=l23kWWEsZgjJg5fGvov83H3v5E5k+w5gNbLgU9dgprQ=; 
 b=BKQSRUWwMn62ZIS2o5IdHGiX1pvzYs/zlacAEocjsJ59QB89yGOIt3DifOnI84iQJDalOJEptMxxBogE8yJTWZp+LooNu1TDurA3QDfbwxvtMIsRgogVZWlxWWqfx40Wt5tGxA+rS0bLUnY3xgnsT6IxMrkZ9TKB0k46i5bwhls=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617297506; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=l23kWWEsZgjJg5fGvov83H3v5E5k+w5gNbLgU9dgprQ=;
 b=UaIN3cdMSF4I5e3x7r1EcNuxw9xqFakG9FaAH6mEtbCt/zCWPz14HrniLuxImcmj
 vlujmccH49L9oPI+jYX1GYtNy8jJk2550NudHMJWcDmsJq7sORFzc90Q1jYSeQ2v9ae
 VOnNeVd5TwtdiBAXyo9JJWRsg/QzyDzYv6eqIjuI=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1617297504069995.7481271373672;
 Thu, 1 Apr 2021 22:48:24 +0530 (IST)
Date: Thu, 01 Apr 2021 22:48:24 +0530
From: Vijai Kumar K <vijai@behindbytes.com>
To: "Alistair Francis" <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Message-ID: <1788e717742.b23f5ec42963.7150229126692558445@behindbytes.com>
In-Reply-To: <CAKmqyKPu44=w=upUxv=4JMjoF1vY4dXwFSFmPMA7FOZgY82d+g@mail.gmail.com>
References: <20210321050917.24621-1-vijai@behindbytes.com>
 <20210321050917.24621-3-vijai@behindbytes.com>
 <CAKmqyKPu44=w=upUxv=4JMjoF1vY4dXwFSFmPMA7FOZgY82d+g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: Add initial support for Shakti C machine
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 01 Apr 2021 17:18:50 -0000




---- On Wed, 31 Mar 2021 21:05:47 +0530 Alistair Francis <alistair23@gmail.com> wrote ----

 > On Sun, Mar 21, 2021 at 1:09 AM Vijai Kumar K <vijai@behindbytes.com> wrote: 
 > > 
 > > Add support for emulating Shakti reference platform based on C-class 
 > > running on arty-100T board. 
 > > 
 > > https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.rst 
 > > 
 > > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com> 
 > > --- 
 > >  MAINTAINERS                                 |   7 + 
 > >  default-configs/devices/riscv64-softmmu.mak |   1 + 
 > >  hw/riscv/Kconfig                            |  10 ++ 
 > >  hw/riscv/meson.build                        |   1 + 
 > >  hw/riscv/shakti_c.c                         | 171 ++++++++++++++++++++ 
 > >  include/hw/riscv/shakti_c.h                 |  74 +++++++++ 
 > >  6 files changed, 264 insertions(+) 
 > >  create mode 100644 hw/riscv/shakti_c.c 
 > >  create mode 100644 include/hw/riscv/shakti_c.h 
 > > 
 > > diff --git a/MAINTAINERS b/MAINTAINERS 
 > > index 8e9f0d591e..9f71c4cc3f 100644 
 > > --- a/MAINTAINERS 
 > > +++ b/MAINTAINERS 
 > > @@ -1380,6 +1380,13 @@ F: include/hw/misc/mchp_pfsoc_dmc.h 
 > >  F: include/hw/misc/mchp_pfsoc_ioscb.h 
 > >  F: include/hw/misc/mchp_pfsoc_sysreg.h 
 > > 
 > > +Shakti C class SoC 
 > > +M: Vijai Kumar K <vijai@behindbytes.com> 
 > > +L: qemu-riscv@nongnu.org 
 > > +S: Supported 
 > > +F: hw/riscv/shakti_c.c 
 > > +F: include/hw/riscv/shakti_c.h 
 > > + 
 > >  SiFive Machines 
 > >  M: Alistair Francis <Alistair.Francis@wdc.com> 
 > >  M: Bin Meng <bin.meng@windriver.com> 
 > > diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak 
 > > index d5eec75f05..bc69301fa4 100644 
 > > --- a/default-configs/devices/riscv64-softmmu.mak 
 > > +++ b/default-configs/devices/riscv64-softmmu.mak 
 > > @@ -13,3 +13,4 @@ CONFIG_SIFIVE_E=y 
 > >  CONFIG_SIFIVE_U=y 
 > >  CONFIG_RISCV_VIRT=y 
 > >  CONFIG_MICROCHIP_PFSOC=y 
 > > +CONFIG_SHAKTI_C=y 
 > > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig 
 > > index d139074b02..92a62b5ce9 100644 
 > > --- a/hw/riscv/Kconfig 
 > > +++ b/hw/riscv/Kconfig 
 > > @@ -19,6 +19,16 @@ config OPENTITAN 
 > >      select IBEX 
 > >      select UNIMP 
 > > 
 > > +config SHAKTI 
 > > +    bool 
 > > + 
 > > +config SHAKTI_C 
 > > +    bool 
 > > +    select UNIMP 
 > > +    select SHAKTI 
 > > +    select SIFIVE_CLINT 
 > > +    select SIFIVE_PLIC 
 > > + 
 > >  config RISCV_VIRT 
 > >      bool 
 > >      imply PCI_DEVICES 
 > > diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build 
 > > index 275c0f7eb7..a97454661c 100644 
 > > --- a/hw/riscv/meson.build 
 > > +++ b/hw/riscv/meson.build 
 > > @@ -4,6 +4,7 @@ riscv_ss.add(files('numa.c')) 
 > >  riscv_ss.add(files('riscv_hart.c')) 
 > >  riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c')) 
 > >  riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c')) 
 > > +riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c')) 
 > >  riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c')) 
 > >  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c')) 
 > >  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c')) 
 > > diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c 
 > > new file mode 100644 
 > > index 0000000000..45d0eedabd 
 > > --- /dev/null 
 > > +++ b/hw/riscv/shakti_c.c 
 > > @@ -0,0 +1,171 @@ 
 > > +/* 
 > > + * Shakti C-class SoC emulation 
 > > + * 
 > > + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com> 
 > > + * 
 > > + * This program is free software; you can redistribute it and/or modify it 
 > > + * under the terms and conditions of the GNU General Public License, 
 > > + * version 2 or later, as published by the Free Software Foundation. 
 > > + * 
 > > + * This program is distributed in the hope it will be useful, but WITHOUT 
 > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
 > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for 
 > > + * more details. 
 > > + * 
 > > + * You should have received a copy of the GNU General Public License along with 
 > > + * this program.  If not, see <http://www.gnu.org/licenses/>. 
 > > + */ 
 > > + 
 > > +#include "qemu/osdep.h" 
 > > +#include "hw/boards.h" 
 > > +#include "hw/riscv/shakti_c.h" 
 > > +#include "qapi/error.h" 
 > > +#include "hw/intc/sifive_plic.h" 
 > > +#include "hw/intc/sifive_clint.h" 
 > > +#include "sysemu/sysemu.h" 
 > > +#include "hw/qdev-properties.h" 
 > > +#include "exec/address-spaces.h" 
 > > +#include "hw/riscv/boot.h" 
 > > + 
 > > + 
 > > +static const struct MemmapEntry { 
 > > +    hwaddr base; 
 > > +    hwaddr size; 
 > > +} shakti_c_memmap[] = { 
 > > +    [SHAKTI_C_ROM]   =  {  0x00001000,  0x2000   }, 
 > > +    [SHAKTI_C_RAM]   =  {  0x80000000,  0x0      }, 
 > > +    [SHAKTI_C_UART]  =  {  0x00011300,  0x00040  }, 
 > > +    [SHAKTI_C_GPIO]  =  {  0x020d0000,  0x00100  }, 
 > > +    [SHAKTI_C_PLIC]  =  {  0x0c000000,  0x20000  }, 
 > > +    [SHAKTI_C_CLINT] =  {  0x02000000,  0xc0000  }, 
 > > +    [SHAKTI_C_DEBUG] =  {  0x00000000,  0x00010  }, 
 >  
 > What is this debug used for? 

I could not find the answer in docs. I got in touch with the developer and this is the response I got.

"It where the debug self-loop lies. When halted by a debugger, the core executes a loop of [nop; j nop]. This loop is placed at the debug_loop location."

This has no purpose in QEMU. It is there for sake of completion.

Thanks,
Vijai Kumar K

 >  
 > Alistair 
 >  
 > > +    [SHAKTI_C_I2C]   =  {  0x20c00000,  0x00100  }, 
 > > +}; 
 > > + 
 > > +static void shakti_c_machine_state_init(MachineState *mstate) 
 > > +{ 
 > > +    ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate); 
 > > +    MemoryRegion *system_memory = get_system_memory(); 
 > > +    MemoryRegion *main_mem = g_new(MemoryRegion, 1); 
 > > + 
 > > +    /* Allow only Shakti C CPU for this platform */ 
 > > +    if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) { 
 > > +        error_report("This board can only be used with Shakti C CPU"); 
 > > +        exit(1); 
 > > +    } 
 > > + 
 > > +    /* Initialize SoC */ 
 > > +    object_initialize_child(OBJECT(mstate), "soc", &sms->soc, 
 > > +                            TYPE_RISCV_SHAKTI_SOC); 
 > > +    qdev_realize(DEVICE(&sms->soc), NULL, &error_abort); 
 > > + 
 > > +    /* register RAM */ 
 > > +    memory_region_init_ram(main_mem, NULL, "riscv.shakti.c.ram", 
 > > +                           mstate->ram_size, &error_fatal); 
 > > +    memory_region_add_subregion(system_memory, 
 > > +                                shakti_c_memmap[SHAKTI_C_RAM].base, 
 > > +                                main_mem); 
 > > + 
 > > +    /* ROM reset vector */ 
 > > +    riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus, 
 > > +                              shakti_c_memmap[SHAKTI_C_RAM].base, 
 > > +                              shakti_c_memmap[SHAKTI_C_ROM].base, 
 > > +                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0, 
 > > +                              NULL); 
 > > +    riscv_load_firmware(mstate->firmware, shakti_c_memmap[SHAKTI_C_RAM].base, 
 > > +                        NULL); 
 > > +} 
 > > + 
 > > +static void shakti_c_machine_instance_init(Object *obj) 
 > > +{ 
 > > +} 
 > > + 
 > > +static void shakti_c_machine_class_init(ObjectClass *klass, void *data) 
 > > +{ 
 > > +    MachineClass *mc = MACHINE_CLASS(klass); 
 > > +    mc->desc = "RISC-V Board compatible with Shakti SDK"; 
 > > +    mc->init = shakti_c_machine_state_init; 
 > > +    mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C; 
 > > +} 
 > > + 
 > > +static const TypeInfo shakti_c_machine_type_info = { 
 > > +    .name = TYPE_RISCV_SHAKTI_MACHINE, 
 > > +    .parent = TYPE_MACHINE, 
 > > +    .class_init = shakti_c_machine_class_init, 
 > > +    .instance_init = shakti_c_machine_instance_init, 
 > > +    .instance_size = sizeof(ShaktiCMachineState), 
 > > +}; 
 > > + 
 > > +static void shakti_c_machine_type_info_register(void) 
 > > +{ 
 > > +    type_register_static(&shakti_c_machine_type_info); 
 > > +} 
 > > +type_init(shakti_c_machine_type_info_register) 
 > > + 
 > > +static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp) 
 > > +{ 
 > > +    ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev); 
 > > +    MemoryRegion *system_memory = get_system_memory(); 
 > > + 
 > > +    sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort); 
 > > + 
 > > +    sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base, 
 > > +        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0, 
 > > +        SHAKTI_C_PLIC_NUM_SOURCES, 
 > > +        SHAKTI_C_PLIC_NUM_PRIORITIES, 
 > > +        SHAKTI_C_PLIC_PRIORITY_BASE, 
 > > +        SHAKTI_C_PLIC_PENDING_BASE, 
 > > +        SHAKTI_C_PLIC_ENABLE_BASE, 
 > > +        SHAKTI_C_PLIC_ENABLE_STRIDE, 
 > > +        SHAKTI_C_PLIC_CONTEXT_BASE, 
 > > +        SHAKTI_C_PLIC_CONTEXT_STRIDE, 
 > > +        shakti_c_memmap[SHAKTI_C_PLIC].size); 
 > > + 
 > > +    sifive_clint_create(shakti_c_memmap[SHAKTI_C_CLINT].base, 
 > > +        shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1, 
 > > +        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, 
 > > +        SIFIVE_CLINT_TIMEBASE_FREQ, false); 
 > > + 
 > > +    /* ROM */ 
 > > +    memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom", 
 > > +                           shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal); 
 > > +    memory_region_add_subregion(system_memory, 
 > > +        shakti_c_memmap[SHAKTI_C_ROM].base, &sss->rom); 
 > > +} 
 > > + 
 > > +static void shakti_c_soc_class_init(ObjectClass *klass, void *data) 
 > > +{ 
 > > +    DeviceClass *dc = DEVICE_CLASS(klass); 
 > > +    dc->realize = shakti_c_soc_state_realize; 
 > > +} 
 > > + 
 > > +static void shakti_c_soc_instance_init(Object *obj) 
 > > +{ 
 > > +    ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj); 
 > > + 
 > > +    object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY); 
 > > + 
 > > +    /* 
 > > +     * CPU type is fixed and we are not supporting passing from commandline yet. 
 > > +     * So let it be in instance_init. When supported should use ms->cpu_type 
 > > +     * instead of TYPE_RISCV_CPU_SHAKTI_C 
 > > +     */ 
 > > +    object_property_set_str(OBJECT(&sss->cpus), "cpu-type", 
 > > +                            TYPE_RISCV_CPU_SHAKTI_C, &error_abort); 
 > > +    object_property_set_int(OBJECT(&sss->cpus), "num-harts", 1, 
 > > +                            &error_abort); 
 > > +} 
 > > + 
 > > +static const TypeInfo shakti_c_type_info = { 
 > > +    .name = TYPE_RISCV_SHAKTI_SOC, 
 > > +    .parent = TYPE_DEVICE, 
 > > +    .class_init = shakti_c_soc_class_init, 
 > > +    .instance_init = shakti_c_soc_instance_init, 
 > > +    .instance_size = sizeof(ShaktiCSoCState), 
 > > +}; 
 > > + 
 > > +static void shakti_c_type_info_register(void) 
 > > +{ 
 > > +    type_register_static(&shakti_c_type_info); 
 > > +} 
 > > +type_init(shakti_c_type_info_register) 
 > > diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h 
 > > new file mode 100644 
 > > index 0000000000..6c66a160f5 
 > > --- /dev/null 
 > > +++ b/include/hw/riscv/shakti_c.h 
 > > @@ -0,0 +1,74 @@ 
 > > +/* 
 > > + * Shakti C-class SoC emulation 
 > > + * 
 > > + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com> 
 > > + * 
 > > + * This program is free software; you can redistribute it and/or modify it 
 > > + * under the terms and conditions of the GNU General Public License, 
 > > + * version 2 or later, as published by the Free Software Foundation. 
 > > + * 
 > > + * This program is distributed in the hope it will be useful, but WITHOUT 
 > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
 > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for 
 > > + * more details. 
 > > + * 
 > > + * You should have received a copy of the GNU General Public License along with 
 > > + * this program.  If not, see <http://www.gnu.org/licenses/>. 
 > > + */ 
 > > + 
 > > +#ifndef HW_SHAKTI_H 
 > > +#define HW_SHAKTI_H 
 > > + 
 > > +#include "hw/riscv/riscv_hart.h" 
 > > +#include "hw/boards.h" 
 > > + 
 > > +#define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc" 
 > > +#define RISCV_SHAKTI_SOC(obj) \ 
 > > +    OBJECT_CHECK(ShaktiCSoCState, (obj), TYPE_RISCV_SHAKTI_SOC) 
 > > + 
 > > +typedef struct ShaktiCSoCState { 
 > > +    /*< private >*/ 
 > > +    DeviceState parent_obj; 
 > > + 
 > > +    /*< public >*/ 
 > > +    RISCVHartArrayState cpus; 
 > > +    DeviceState *plic; 
 > > +    MemoryRegion rom; 
 > > + 
 > > +} ShaktiCSoCState; 
 > > + 
 > > +#define TYPE_RISCV_SHAKTI_MACHINE MACHINE_TYPE_NAME("shakti_c") 
 > > +#define RISCV_SHAKTI_MACHINE(obj) \ 
 > > +    OBJECT_CHECK(ShaktiCMachineState, (obj), TYPE_RISCV_SHAKTI_MACHINE) 
 > > +typedef struct ShaktiCMachineState { 
 > > +    /*< private >*/ 
 > > +    MachineState parent_obj; 
 > > + 
 > > +    /*< public >*/ 
 > > +    ShaktiCSoCState soc; 
 > > +} ShaktiCMachineState; 
 > > + 
 > > +enum { 
 > > +    SHAKTI_C_ROM, 
 > > +    SHAKTI_C_RAM, 
 > > +    SHAKTI_C_UART, 
 > > +    SHAKTI_C_GPIO, 
 > > +    SHAKTI_C_PLIC, 
 > > +    SHAKTI_C_CLINT, 
 > > +    SHAKTI_C_DEBUG, 
 > > +    SHAKTI_C_I2C, 
 > > +}; 
 > > + 
 > > +#define SHAKTI_C_PLIC_HART_CONFIG "MS" 
 > > +/* Including Interrupt ID 0 (no interrupt)*/ 
 > > +#define SHAKTI_C_PLIC_NUM_SOURCES 28 
 > > +/* Excluding Priority 0 */ 
 > > +#define SHAKTI_C_PLIC_NUM_PRIORITIES 2 
 > > +#define SHAKTI_C_PLIC_PRIORITY_BASE 0x04 
 > > +#define SHAKTI_C_PLIC_PENDING_BASE 0x1000 
 > > +#define SHAKTI_C_PLIC_ENABLE_BASE 0x2000 
 > > +#define SHAKTI_C_PLIC_ENABLE_STRIDE 0x80 
 > > +#define SHAKTI_C_PLIC_CONTEXT_BASE 0x200000 
 > > +#define SHAKTI_C_PLIC_CONTEXT_STRIDE 0x1000 
 > > + 
 > > +#endif 
 > > -- 
 > > 2.25.1 
 > > 
 > > 
 > 

