Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0qkL-0000zs-U4
	for mharc-qemu-riscv@gnu.org; Sat, 16 Jan 2021 13:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0qkJ-0000yf-5v; Sat, 16 Jan 2021 13:56:23 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:33360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0qkH-0005Au-Bx; Sat, 16 Jan 2021 13:56:22 -0500
Received: by mail-io1-xd33.google.com with SMTP id w18so24885240iot.0;
 Sat, 16 Jan 2021 10:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h3URErZ8pWkw1q1U5FxbwJRWBDKKcdPl/JbDymZQkPY=;
 b=eFpZZ9dwKvmNAyluxJ4TgmOdfPyw+Be2imCPvO6G45/GDFb4e+LymAsmAdSIJkeYRf
 dlvPR1JoW1/OudA2HIeGoQKZtHdIFyAzZauxGxusgbZq6LFCsOTZpd8MddibQioXivSm
 s6uw9vsPaf3D6zWMm0ND4dQJgK5Q95tF33XE5/ImK+Da5d7t2BQ4G6RV3ycGmvmkNDSW
 hh3N1X5ZsKtP7iQRAlz0XEq0jm49KqiOrm7vg6HYaa/Qy9Vte+JP8QFj9U7kT94G8cEl
 I5MOdLA6dKYUuqTwz1b6dyhJoo4Pqf1bV+hgiSRHBc0YMImj4btKcX1y+Ud9w39hXEEQ
 IAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h3URErZ8pWkw1q1U5FxbwJRWBDKKcdPl/JbDymZQkPY=;
 b=chjYuosHeF6T3xsBcd+Rcfp04nne8tH+RmkUxHc7S6GpJA2HkvR9GvQPpqxGKx7ZKD
 mdmcbMr1kEFdvI+92pOUNtFHVRl8kZPgMccBRUz2GKaei2CoL+YkFuapcJIja48j6I4B
 wuRZP5pDcqd+pwu7Y32julZcvGGnNJ2HUPAy+yPGjplXL2YpnysoCSrJeNB3VlnkJT/d
 gj+GHXDRoys5xD6RTTQa/vyGLO4v6pgJiGdgmEigmA2z8kOoKgdNpsXcnny/aRn/ehHt
 A8GGZH/MTWFUxPCYsycxGhu2B26Hs+l0B2bgtWbyyg0cmpZJ7QIsD6HCmjoZI6DjVbov
 IV7g==
X-Gm-Message-State: AOAM532AliO0+L7rZtixRTqZa8OAi04P2FeJss2jzp/iUkPAX1RZeh1R
 Hw2QVK5le4Ee4g9CTd33JyzBZ03bznq7IMa67CE=
X-Google-Smtp-Source: ABdhPJwYdqoOFgPNXofHwGDhlgSGZpmoqAnaBp7m4oDf0zIJhCLKWlJARdqCsCQUfe417lOTq18ElwEH9My/cPoHkDk=
X-Received: by 2002:a5d:9514:: with SMTP id d20mr11093921iom.118.1610823379716; 
 Sat, 16 Jan 2021 10:56:19 -0800 (PST)
MIME-Version: 1.0
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
In-Reply-To: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 16 Jan 2021 10:55:52 -0800
Message-ID: <CAKmqyKMwK6xEo3tFkffrDD0_Es2DRZiUr33K=UjR0sovsSJ7QA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Sat, 16 Jan 2021 18:56:24 -0000

On Fri, Jan 15, 2021 at 3:00 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> We were accidently passing RISCVHartArrayState by value instead of
> pointer. The type is 824 bytes long so let's correct that and pass it by
> pointer instead.
>
> Fixes: Coverity CID 1438099
> Fixes: Coverity CID 1438100
> Fixes: Coverity CID 1438101
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

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
> --
> 2.29.2
>

