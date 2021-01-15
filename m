Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0Y8Z-0002Lm-Kh
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 18:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l0Y8R-0002J7-IK
 for qemu-riscv@nongnu.org; Fri, 15 Jan 2021 18:04:08 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l0Y8G-000264-1m
 for qemu-riscv@nongnu.org; Fri, 15 Jan 2021 18:04:03 -0500
Received: by mail-pl1-x62c.google.com with SMTP id be12so5469550plb.4
 for <qemu-riscv@nongnu.org>; Fri, 15 Jan 2021 15:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ny6yCuzAh45/P52gTzra8NwAP8rfm3rnZPgYk1259no=;
 b=aLJAQIGdBBk503kBo3iq7YTdrnPJILyUD5ygWBLRwj1hcdr+yMnRkApw2Eb8izTDEj
 Zksj1h/ZPSa2PHy7w64y99ItRSOOkhzZE70TUnKVNufVfROs8opt8icgtc40aduh3PAN
 bayAWP8JSl9mPByEuPrMmdoY09j15aKXDxnoY2uyplhlU8mhycZ/pN08fse44a7gcJ3k
 BdednBX8MMYrhCLKThe9V5Th76Y4tukp1a8R0nkWIXpNz+Wmpe5uia3RLE0DDTgL2QHv
 TtlNighlvWgtaTbAcD0XLdUshy/QnWaay6RAwOnL7JPV+L/0Evs16QZFZhN+llzQlnAM
 5QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ny6yCuzAh45/P52gTzra8NwAP8rfm3rnZPgYk1259no=;
 b=BN+UF9EJxcBmcuEJLP0PFUUrLLrrzWvFcjOTY9aHp20+2CFxKztmUzhr7UOwJ2CGWg
 GFvbJNgILfs1gglHelB4zd2YLbVcLssnI9UP7ss6Jk0R08d0u6cDfh682E0NfYHpRGXm
 +DZwJgRrR7p2O+3lKlWYAcyl8Yf5EJdQAUzpkR94Qn0Lh4I+DvJwBsv2b8JFeTXuSrkX
 aF0XgTmcNW3LFm6MM42hPpBj5YzdtP0QzI1rma+Es4cUdGFXOaZymiH8wc0FL0+eoqCb
 GDE9ryH9VaWaldteTJ5WdLjJuRVldvn6tjkWAuJMppV7KwSV229IY7FnLHu4GFUgQMlC
 0ydg==
X-Gm-Message-State: AOAM532SMMIfHi9hvsqLQcuh8MUauPpm8povGXPo3W34jEir8qNZnEeB
 K4aLc3PR6jGvWtHdJ1vFPoYEdw==
X-Google-Smtp-Source: ABdhPJz3f81Z/rDy4wjZ6vUNOPoSII9OEyuv8XrR+rI0eKjva/gTLgWiBoinSwaHTVr5bMALxEfrLA==
X-Received: by 2002:a17:902:9009:b029:dc:52a6:575 with SMTP id
 a9-20020a1709029009b02900dc52a60575mr14428438plp.57.1610751822830; 
 Fri, 15 Jan 2021 15:03:42 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p8sm9025456pjf.11.2021.01.15.15.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 15:03:42 -0800 (PST)
Date: Fri, 15 Jan 2021 15:03:42 -0800 (PST)
X-Google-Original-Date: Fri, 15 Jan 2021 15:03:34 PST (-0800)
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
In-Reply-To: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-a17abc78-14f3-4e8e-a63a-21e0c98078d6@penguin>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Jan 2021 23:04:08 -0000

On Fri, 15 Jan 2021 15:00:27 PST (-0800), Alistair Francis wrote:
> We were accidently passing RISCVHartArrayState by value instead of
> pointer. The type is 824 bytes long so let's correct that and pass it by
> pointer instead.
>
> Fixes: Coverity CID 1438099
> Fixes: Coverity CID 1438100
> Fixes: Coverity CID 1438101
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  6 +++---
>  hw/riscv/boot.c         |  8 ++++----
>  hw/riscv/sifive_u.c     | 10 +++++-----
>  hw/riscv/spike.c        |  8 ++++----
>  hw/riscv/virt.c         |  8 ++++----
>  5 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 20ff5fe5e5..11a21dd584 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -24,9 +24,9 @@
>  #include "hw/loader.h"
>  #include "hw/riscv/riscv_hart.h"
>
> -bool riscv_is_32bit(RISCVHartArrayState harts);
> +bool riscv_is_32bit(RISCVHartArrayState *harts);
>
> -target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
> +target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
>                                            target_ulong firmware_end_addr);
>  target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            const char *default_machine_firmware,
> @@ -42,7 +42,7 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
>  hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
>                           uint64_t kernel_entry, hwaddr *start);
>  uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
> -void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
> +void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr saddr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 83586aef41..acf77675b2 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -33,14 +33,14 @@
>
>  #include <libfdt.h>
>
> -bool riscv_is_32bit(RISCVHartArrayState harts)
> +bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    RISCVCPU hart = harts.harts[0];
> +    RISCVCPU hart = harts->harts[0];
>
>      return riscv_cpu_is_32bit(&hart.env);
>  }
>
> -target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
> +target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
>                                            target_ulong firmware_end_addr) {
>      if (riscv_is_32bit(harts)) {
>          return QEMU_ALIGN_UP(firmware_end_addr, 4 * MiB);
> @@ -247,7 +247,7 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
>                             &address_space_memory);
>  }
>
> -void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
> +void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr start_addr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index f5c400dd44..d23f349b4e 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -466,7 +466,7 @@ static void sifive_u_machine_init(MachineState *machine)
>
>      /* create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(s->soc.u_cpus));
> +               riscv_is_32bit(&s->soc.u_cpus));
>
>      if (s->start_in_flash) {
>          /*
> @@ -495,7 +495,7 @@ static void sifive_u_machine_init(MachineState *machine)
>          break;
>      }
>
> -    if (riscv_is_32bit(s->soc.u_cpus)) {
> +    if (riscv_is_32bit(&s->soc.u_cpus)) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
>                                      "opensbi-riscv32-generic-fw_dynamic.bin",
>                                      start_addr, NULL);
> @@ -506,7 +506,7 @@ static void sifive_u_machine_init(MachineState *machine)
>      }
>
>      if (machine->kernel_filename) {
> -        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc.u_cpus,
> +        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>                                                           firmware_end_addr);
>
>          kernel_entry = riscv_load_kernel(machine->kernel_filename,
> @@ -533,7 +533,7 @@ static void sifive_u_machine_init(MachineState *machine)
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
>                                     machine->ram_size, s->fdt);
> -    if (!riscv_is_32bit(s->soc.u_cpus)) {
> +    if (!riscv_is_32bit(&s->soc.u_cpus)) {
>          start_addr_hi32 = (uint64_t)start_addr >> 32;
>      }
>
> @@ -552,7 +552,7 @@ static void sifive_u_machine_init(MachineState *machine)
>          0x00000000,
>                                         /* fw_dyn: */
>      };
> -    if (riscv_is_32bit(s->soc.u_cpus)) {
> +    if (riscv_is_32bit(&s->soc.u_cpus)) {
>          reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
>          reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
>      } else {
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index e723ca0ac9..56986ecfe0 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -244,7 +244,7 @@ static void spike_board_init(MachineState *machine)
>
>      /* create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(s->soc[0]));
> +               riscv_is_32bit(&s->soc[0]));
>
>      /* boot rom */
>      memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
> @@ -257,7 +257,7 @@ static void spike_board_init(MachineState *machine)
>       * keeping ELF files here was intentional because BIN files don't work
>       * for the Spike machine as HTIF emulation depends on ELF parsing.
>       */
> -    if (riscv_is_32bit(s->soc[0])) {
> +    if (riscv_is_32bit(&s->soc[0])) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
>                                      "opensbi-riscv32-generic-fw_dynamic.elf",
>                                      memmap[SPIKE_DRAM].base,
> @@ -270,7 +270,7 @@ static void spike_board_init(MachineState *machine)
>      }
>
>      if (machine->kernel_filename) {
> -        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc[0],
> +        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
>
>          kernel_entry = riscv_load_kernel(machine->kernel_filename,
> @@ -299,7 +299,7 @@ static void spike_board_init(MachineState *machine)
>      fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
>                                     machine->ram_size, s->fdt);
>      /* load the reset vector */
> -    riscv_setup_rom_reset_vec(machine, s->soc[0], memmap[SPIKE_DRAM].base,
> +    riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
>                                memmap[SPIKE_MROM].base,
>                                memmap[SPIKE_MROM].size, kernel_entry,
>                                fdt_load_addr, s->fdt);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 8de4c35c9d..2299b3a6be 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -601,7 +601,7 @@ static void virt_machine_init(MachineState *machine)
>
>      /* create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(s->soc[0]));
> +               riscv_is_32bit(&s->soc[0]));
>
>      /* boot rom */
>      memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> @@ -609,7 +609,7 @@ static void virt_machine_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
>                                  mask_rom);
>
> -    if (riscv_is_32bit(s->soc[0])) {
> +    if (riscv_is_32bit(&s->soc[0])) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
>                                      "opensbi-riscv32-generic-fw_dynamic.bin",
>                                      start_addr, NULL);
> @@ -620,7 +620,7 @@ static void virt_machine_init(MachineState *machine)
>      }
>
>      if (machine->kernel_filename) {
> -        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc[0],
> +        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
>
>          kernel_entry = riscv_load_kernel(machine->kernel_filename,
> @@ -656,7 +656,7 @@ static void virt_machine_init(MachineState *machine)
>      fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
>                                     machine->ram_size, s->fdt);
>      /* load the reset vector */
> -    riscv_setup_rom_reset_vec(machine, s->soc[0], start_addr,
> +    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
>                                virt_memmap[VIRT_MROM].base,
>                                virt_memmap[VIRT_MROM].size, kernel_entry,
>                                fdt_load_addr, s->fdt);

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

