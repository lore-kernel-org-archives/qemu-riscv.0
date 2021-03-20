Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNYC5-0002H4-BB
	for mharc-qemu-riscv@gnu.org; Sat, 20 Mar 2021 05:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNYC3-0002Fj-M3; Sat, 20 Mar 2021 05:46:51 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNYBy-00044S-QD; Sat, 20 Mar 2021 05:46:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616233598; cv=none; d=zohomail.in; s=zohoarc; 
 b=RvM7D9a22jRWDj1sU18/FbdH2qMrOB0l3Spgj10UsTb2sjrRRinNhBO33W2MRBX97elR5xTpinM1lHGf+xXHM8qJNqOJvEHDjatXkpywQk40BgGlc/53wJaabmloCa0Y5d4CUrcLGUNuzXAj52ZMVXSyi4iPyfhTJasaqJvCp1c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1616233598;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=XH1xMSdxHuB+I1k9uBDenD1r+HLSeZDYsQfMTEWmgNQ=; 
 b=NW9jqVEU3dKY6VoZMRqmzgJxDmGacjOP0pNDjf8zNfEsp8X39WeCIGiivXdQfFld1szivR7bBnBZPlvMRdOwPdcIk1dMKS/1+9A/DBKqZeH/uTMFpAL5dFV/58N0A3Pa1mDWBUlh7vGf4p3SCJ+bfcQPT3wt5k2JRgo54K4EVyQ=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616233598; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=XH1xMSdxHuB+I1k9uBDenD1r+HLSeZDYsQfMTEWmgNQ=;
 b=CAuJIM6ytdCKzJOCy08Ppqg+z24KZU0WsG70o/FiXCqZu4fA/3xJwb1thED4uZZI
 uvv7v8fu+f2aUoWL54qBmhUtk9/bVVAG52V0QLyeo3E28n0UqLUsBYna9043DKgKE/9
 z5uAvVsp06SqEZq/iA6UbOIZ8vPpCOJhJbIGEpLc=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1616233597252902.3515271894969;
 Sat, 20 Mar 2021 15:16:37 +0530 (IST)
Date: Sat, 20 Mar 2021 15:16:37 +0530
From: Vijai Kumar K <vijai@behindbytes.com>
To: "Alistair Francis" <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Message-ID: <1784f078941.65f532b741531.6774835282988031497@behindbytes.com>
In-Reply-To: <CAKmqyKOt5M9M6ftNxZ_6tBEq5txM3ivWbKwLEZ8UA1tEkX3TJg@mail.gmail.com>
References: <20210314083936.76269-1-vijai@behindbytes.com>
 <20210314083936.76269-2-vijai@behindbytes.com>
 <CAKmqyKOt5M9M6ftNxZ_6tBEq5txM3ivWbKwLEZ8UA1tEkX3TJg@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Add initial support for Shakti C class
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
X-List-Received-Date: Sat, 20 Mar 2021 09:46:51 -0000




---- On Fri, 19 Mar 2021 19:09:17 +0530 Alistair Francis <alistair23@gmail.com> wrote ----

 > On Sun, Mar 14, 2021 at 5:10 AM Vijai Kumar K <vijai@behindbytes.com> wrote: 
 > > 
 > > C-Class is a member of the SHAKTI family of processors from Indian 
 > > Institute of Technology - Madras(IIT-M). 
 > > It is an extremely configurable and commercial-grade 5-stage in-order 
 > > core supporting the standard RV64GCSUN ISA extensions. 
 > > 
 > > Add support for emulating Shakti SoC based on C-class running on arty-100T 
 > > platform. 
 > > 
 > > https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.rst 
 > > 
 > > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com> 
 > > --- 
 > >  MAINTAINERS                                 |   7 + 
 > >  default-configs/devices/riscv64-softmmu.mak |   1 + 
 > >  hw/riscv/Kconfig                            |  10 ++ 
 > >  hw/riscv/meson.build                        |   1 + 
 > >  hw/riscv/shakti_c.c                         | 178 ++++++++++++++++++++ 
 > >  include/hw/riscv/shakti_c.h                 |  74 ++++++++ 
 > >  target/riscv/cpu.c                          |   9 + 
 > >  target/riscv/cpu.h                          |   1 + 
 > >  8 files changed, 281 insertions(+) 
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
 > > index 0000000000..e96436a3bf 
 > > --- /dev/null 
 > > +++ b/hw/riscv/shakti_c.c 
 > > @@ -0,0 +1,178 @@ 
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
 > > +#define DEBUG_SHAKTI_C 0 
 > > +#define DPRINTF(fmt, args...) \ 
 > > +    do { \ 
 > > +        if (DEBUG_SHAKTI_C) { \ 
 > > +            fprintf(stderr, "[%s]%s: " fmt , TYPE_RISCV_SHAKTI_SOC, \ 
 > > +                                             __func__, ##args); \ 
 > > +        } \ 
 > > +    } while (0) 
 >  
 > This doesn't seem to be used, can you remove it? 
 >  

Sure. Will drop it in V2.

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
 > > +    [SHAKTI_C_I2C]   =  {  0x20c00000,  0x00100  }, 
 > > +}; 
 > > + 
 > > +static void shakti_c_machine_state_init(MachineState *mstate) 
 > > +{ 
 > > +    ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate); 
 > > +    MemoryRegion *system_memory = get_system_memory(); 
 > > +    MemoryRegion *main_mem = g_new(MemoryRegion, 1); 
 > > +    int i; 
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
 > > +    uint32_t reset_vec[3]; 
 > > + 
 > > +    reset_vec[0] = 0x080002b7;      /*  lui     t0,0x08000  */ 
 > > +    reset_vec[1] = 0x00429293;      /*  slli    t0,t0,4     */ 
 > > +    reset_vec[2] = 0x00028067;      /*  jr      t0          */ 
 >  
 > Is there a reason you can't use riscv_setup_rom_reset_vec()? 

I did a quick try and seems I can. Thanks for the pointer. I will use that API.


 >  
 > > + 
 > > +    /* copy in the reset vector in little_endian byte order */ 
 > > +    for (i = 0; i < ARRAY_SIZE(reset_vec); i++) { 
 > > +        reset_vec[i] = cpu_to_le32(reset_vec[i]); 
 > > +    } 
 > > +    rom_add_blob_fixed_as("rom.reset", reset_vec, sizeof(reset_vec), 
 > > +                          shakti_c_memmap[SHAKTI_C_ROM].base, 
 > > +                          &address_space_memory); 
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
 >  
 > Can you add a newline here. 

Will fix the formatting.

 >  
 > > +    sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort); 
 >  
 > and here 
 >  
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
 >  
 > and here 
 >  
 > > +    sifive_clint_create(shakti_c_memmap[SHAKTI_C_CLINT].base, 
 > > +        shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1, 
 > > +        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, 
 > > +        SIFIVE_CLINT_TIMEBASE_FREQ, false); 
 >  
 > and here 
 >  
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
 >  
 > You need to return an error then if the user tries to change the 
 > number or type of CPU instead of ignoring it. 

Sure. Will handle it.

 >  
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
 > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c 
 > > index 2a990f6253..618d203aa0 100644 
 > > --- a/target/riscv/cpu.c 
 > > +++ b/target/riscv/cpu.c 
 > > @@ -159,6 +159,14 @@ static void rv64_base_cpu_init(Object *obj) 
 > >      set_misa(env, RV64); 
 > >  } 
 > > 
 > > +static void rv64_shakti_c_cpu_init(Object *obj) 
 > > +{ 
 > > +    CPURISCVState *env = &RISCV_CPU(obj)->env; 
 > > +    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU); 
 >  
 > Don't use RVXLEN, this is a 64-bit CPU right? 
 >  
 > This is also exactly the same as the rv64_sifive_u_cpu_init() can we 
 > just use an existing CPU instead of adding a new one? 

Will reuse the sifive_u_cpu_init()

 >  
 > > +    set_priv_version(env, PRIV_VERSION_1_10_0); 
 > > +    set_resetvec(env, DEFAULT_RSTVEC); 
 > > +} 
 > > + 
 > >  static void rv64_sifive_u_cpu_init(Object *obj) 
 > >  { 
 > >      CPURISCVState *env = &RISCV_CPU(obj)->env; 
 > > @@ -707,6 +715,7 @@ static const TypeInfo riscv_cpu_type_infos[] = { 
 > >      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init), 
 > >      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init), 
 > >      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init), 
 > > +    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_shakti_c_cpu_init), 
 > >  #endif 
 > >  }; 
 > > 
 > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h 
 > > index 0edb2826a2..ebbf15fb1c 100644 
 > > --- a/target/riscv/cpu.h 
 > > +++ b/target/riscv/cpu.h 
 > > @@ -38,6 +38,7 @@ 
 > >  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32") 
 > >  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64") 
 > >  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex") 
 > > +#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c") 
 >  
 > Can you add the CPU in a separate patch? 
 >  
 > Alistair 

I guess I can. Let me check.

Thanks,
Vijai Kumar K

 >  
 > >  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31") 
 > >  #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34") 
 > >  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51") 
 > > -- 
 > > 2.25.1 
 > > 
 > > 
 > > 
 > 

