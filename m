Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNoLM-0005T0-BE
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 00:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNoLK-0005SU-Fy; Fri, 03 Feb 2023 00:10:34 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNoLI-0004IQ-Fg; Fri, 03 Feb 2023 00:10:34 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id s24so4215235vsi.12;
 Thu, 02 Feb 2023 21:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mmkeku80xmoKsUkXvVzZlNuLgKuXv6yS5JDoOKA8Nds=;
 b=KMABX7/LknNGPQmaOm/3kOAKKudwk+niDw+40KMo89ZT9P0u+LB7AdhMYgPSGMTymz
 hgSmiLC3Ywj7BF5sCcUvdqyEQg1pJAuGvqk0hm8Xn0nptG0phEC31TisyzUYcXArmJIj
 pckazOrAoW2MCXvELoYOM7Ih9d6jHyyrjMAXC5/jEyfxP4xgrZUlL5IbsIffv5tIyQN/
 sTID1bLF5CvcSquZolzCe2QWUwcjg5h8B371LJRKqZZbFFT1DhHYofoqz+KmGC9AFm32
 2DJrDHF4TNokIDJ6YvzqMaI/j0YEp8Ow0WvdyWw9Vfir5sPVtYBBl8U9nDgq8g8YGw7h
 RsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mmkeku80xmoKsUkXvVzZlNuLgKuXv6yS5JDoOKA8Nds=;
 b=bwJSDPQKH1Qb5+gNK22HDikYqyFeq1N7Ox3caSgTQvDXpObM9JfG/YcPqkr3AAVOcg
 rexQfHi0brWFgGei+jLct/ict7CBmM/Fg3WBm01aUEWJMRSOOdoUerg408HTaeVKuadk
 UxB5ttqzX/wdk1PYn38VevRkz5w9I4YuTU8T6qoBfzBEhYOsCRLdW+sc3UTqDgRURRJM
 gG5sBkJphRQqrn6Ti90ItrUIXFE3RabbCUmmyAHOLOGXRY7XCrUMxYc5MXDkyBz3Purm
 e3ln1xWTngL+x8VizRkv6AeuwHjHkR4eEKZR3QSTLPW0M3d7QNVfExsUkDiTXBpPCnEL
 n/bw==
X-Gm-Message-State: AO0yUKXBqy2Du87vbBfnbjz+mqfa8H7xm1xB+W8C3cp/ag2VfKx0Uofr
 T1qdX9OR0sbuwAc6N8hvN47LIXXM5Oj3mvxemOk=
X-Google-Smtp-Source: AK7set91r6SE1rwr2YahZZEcapir7EhGgUlLESPdewzwMEvZij1VlPwxC8zOzLs1Uw8lSQi3uMD/6P7Rh8z7V3OIR2I=
X-Received: by 2002:a67:e102:0:b0:3f0:89e1:7c80 with SMTP id
 d2-20020a67e102000000b003f089e17c80mr1194603vsl.72.1675401030660; Thu, 02 Feb
 2023 21:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
 <20230202135810.1657792-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230202135810.1657792-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Feb 2023 15:10:04 +1000
Message-ID: <CAKmqyKOTTMBOsmQbn_pN2Nv4oz7JA5RKsku+8sEgCwK0OJHHrQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] hw/riscv: handle 32 bit CPUs kernel_addr in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2023 05:10:34 -0000

On Thu, Feb 2, 2023 at 11:58 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit QEMU
> guest happens to be running in a hypervisor that are using 64 bits to
> encode its address, kernel_entry can be padded with '1's and create
> problems [1].
>
> Using a translate_fn() callback in load_elf_ram_sym() to filter the
> padding from the address doesn't work. A more detailed explanation can
> be found in [2]. The short version is that glue(load_elf, SZ), from
> include/hw/elf_ops.h, will calculate 'pentry' (mapped into the
> 'kernel_load_base' var in riscv_load_Kernel()) before using
> translate_fn(), and will not recalculate it after executing it. This
> means that the callback does not prevent the padding from
> kernel_load_base to appear.
>
> Let's instead use a kernel_low var to capture the 'lowaddr' value from
> load_elf_ram_sim(), and return it when we're dealing with 32 bit CPUs.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg00099.html
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c            | 15 +++++++++++----
>  hw/riscv/microchip_pfsoc.c |  3 ++-
>  hw/riscv/opentitan.c       |  3 ++-
>  hw/riscv/sifive_e.c        |  3 ++-
>  hw/riscv/sifive_u.c        |  3 ++-
>  hw/riscv/spike.c           |  3 ++-
>  hw/riscv/virt.c            |  3 ++-
>  include/hw/riscv/boot.h    |  1 +
>  8 files changed, 24 insertions(+), 10 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index c7e0e50bd8..5ec6d32165 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -174,11 +174,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>  }
>
>  target_ulong riscv_load_kernel(MachineState *machine,
> +                               RISCVHartArrayState *harts,
>                                 target_ulong kernel_start_addr,
>                                 symbol_fn_t sym_cb)
>  {
>      const char *kernel_filename = machine->kernel_filename;
> -    uint64_t kernel_load_base, kernel_entry;
> +    uint64_t kernel_load_base, kernel_entry, kernel_low;
>
>      g_assert(kernel_filename != NULL);
>
> @@ -189,10 +190,16 @@ target_ulong riscv_load_kernel(MachineState *machine,
>       * the (expected) load address load address. This allows kernels to have
>       * separate SBI and ELF entry points (used by FreeBSD, for example).
>       */
> -    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> -                         NULL, &kernel_load_base, NULL, NULL, 0,
> +    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL, NULL,
> +                         &kernel_load_base, &kernel_low, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        return kernel_load_base;
> +        kernel_entry = kernel_load_base;
> +
> +        if (riscv_is_32bit(harts)) {
> +            kernel_entry = kernel_low;
> +        }
> +
> +        return kernel_entry;
>      }
>
>      if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 2b91e49561..712625d2a4 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -629,7 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>                                                           firmware_end_addr);
>
> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
> +        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
> +                                         kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 353f030d80..7fe4fb5628 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machine)
>      }
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
> +        riscv_load_kernel(machine, &s->soc.cpus,
> +                          memmap[IBEX_DEV_RAM].base, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 3e3f4b0088..1a7d381514 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
>                            memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
> +        riscv_load_kernel(machine, &s->soc.cpus,
> +                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index d3ab7a9cda..71be442a50 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -598,7 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>                                                           firmware_end_addr);
>
> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
> +        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
> +                                         kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index cc3f6dac17..1fa91167ab 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -305,7 +305,8 @@ static void spike_board_init(MachineState *machine)
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
>
> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
> +        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
> +                                         kernel_start_addr,
>                                           htif_symbol_callback);
>
>          if (machine->initrd_filename) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a061151a6f..d0531cc641 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1277,7 +1277,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
>
> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
> +        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
> +                                         kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 511390f60e..6295316afb 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
>  target_ulong riscv_load_kernel(MachineState *machine,
> +                               RISCVHartArrayState *harts,
>                                 target_ulong firmware_end_addr,
>                                 symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
> --
> 2.39.1
>
>

