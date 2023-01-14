Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGgm0-0001GJ-Cx
	for mharc-qemu-riscv@gnu.org; Sat, 14 Jan 2023 08:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pGgly-0001Fn-D8; Sat, 14 Jan 2023 08:40:38 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pGglw-0006GC-9J; Sat, 14 Jan 2023 08:40:38 -0500
Received: by mail-ej1-x633.google.com with SMTP id v6so15276948ejg.6;
 Sat, 14 Jan 2023 05:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMvzyRM6/5uu6DpAx4FxW5Cqn1agv6Ixap7GKd+WQDk=;
 b=RPj1H9OSzwsCheDKp6dFePj4zrjS1G14sMU42HkTDHxUAVn71J8DSKydiYOKdICl2I
 5AZLyFWY9c3Omna+fzXU7DKz+GfRVipk14bb5yNp1auYWPIugUbFkfvM52kuO6BuoPXF
 yFOF7eqCZX33NjLY0sLNIdaLTH/gTQpNq/FfsyYhAeTbmsa0rtqeeBxZfzMas4AkmQWe
 L8VQ05yzcWo4OHsoOmnWXnHapcXibqyhZswH+HcBB4V03WSfy7NLuS9oQsnYBVKdppZv
 jishHU6XhhngrCckWPcZg5CrUF0hg7Y1BOY/tjWeC25SPhuZl6BKWjRoJNJ2PCpgoknB
 v8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMvzyRM6/5uu6DpAx4FxW5Cqn1agv6Ixap7GKd+WQDk=;
 b=PfRiR3+EzQiFTw+5vSi6ECCYJp9J38D31hzkj4zfBNjLN4se879Z0ckK/pFWqMyGcB
 NqRXq+3l+Fn/fQOlENA5AzHe66tuFymzrPLFiI3TbfocqS3WbBixWz5gtLNyX7itxNh9
 mLYI0HFdtZ3ah7R76s1mvOPSz9lnsZhndkMlbnsUJ4vpzIVPRUmVqmtdElDv8WEbUKlG
 VFYsKnz96UEEaj/+JxU5PaPfF49Zl6cfPnBLU50z8o/zLj8AOgY7pN2e9hVHwXXwcVlN
 JwUfdL3FhSypSolxv4ieibzHGXv4Rhrp4sd8Ie2QS7obcSoEjNhG28DVkftPMYO3xwzr
 Rt1w==
X-Gm-Message-State: AFqh2kqhbLMh06eQgGNDk73uX9fY3t4zVZ3ZLLunYqX4mH08VgYBvOk1
 Nw1oUVG2q1ZkkBaGuWvZt8LhNQDZjAqOHuK7R9A=
X-Google-Smtp-Source: AMrXdXuCXE1Ih3+cr/RUv0m2quyHglD+ibVbpna6JWQI7F5Sfxgd0kfDGv1Wd2jO1CpclH8hKHPVeQQ97rRpRQ0lnHM=
X-Received: by 2002:a17:907:8d0f:b0:84d:47e2:da9c with SMTP id
 tc15-20020a1709078d0f00b0084d47e2da9cmr2773419ejc.337.1673703633876; Sat, 14
 Jan 2023 05:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
 <20230113171805.470252-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230113171805.470252-4-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 14 Jan 2023 21:40:23 +0800
Message-ID: <CAEUhbmUKEHX5bQ2=7GfgjPY1YVFs-5MqzkbwEy_SgG43WdeAfg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 14 Jan 2023 13:40:38 -0000

On Sat, Jan 14, 2023 at 1:18 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Recent hw/risc/boot.c changes caused a regression in an use case with
> the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> stopped working. The reason seems to be that Xvisor is using 64 bit to
> encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> sign-extending the result with '1's [1].

I would say it's not a regression of QEMU but something weird happened
to Alistair's 32-bit Xvisor image.

I just built a 32-bit Xvisor image from the latest Xvisor head
following the instructions provided in its source tree. With the
mainline QEMU only BIN file boots, but ELF does not. My 32-bit Xvisor
image has an address of 0x10000000. Apparently this address is not
correct, and the issue I saw is different from Alistair's. Alistair,
could you investigate why your 32-bit Xvisor ELF image has an address
of 0xffffffff80000000 set to kernel_load_base?

>
> This can very well be an issue with Xvisor, but since it's not hard to
> amend it in our side we're going for it. Use a translate_fn() callback
> to be called by load_elf_ram_sym() and clear the higher bits of the
> result if we're running a 32 bit CPU.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 23 ++++++++++++++++++++++-
>  hw/riscv/microchip_pfsoc.c |  4 ++--
>  hw/riscv/opentitan.c       |  3 ++-
>  hw/riscv/sifive_e.c        |  3 ++-
>  hw/riscv/sifive_u.c        |  4 ++--
>  hw/riscv/spike.c           |  2 +-
>  hw/riscv/virt.c            |  4 ++--
>  include/hw/riscv/boot.h    |  1 +
>  8 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index e868fb6ade..7f8295bf5e 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -213,7 +213,27 @@ static void riscv_load_initrd(MachineState *machine,=
 uint64_t kernel_entry)
>      }
>  }
>
> +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> +{
> +    RISCVHartArrayState *harts =3D opaque;
> +
> +    /*
> +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
> +     * it can be padded with '1's) if the hypervisor, for some
> +     * reason, is using 64 bit addresses with 32 bit guests.
> +     *
> +     * Clear the higher bits to avoid the padding if we're
> +     * running a 32 bit CPU.
> +     */
> +    if (riscv_is_32bit(harts)) {
> +        return addr & 0x0fffffff;
> +    }
> +
> +    return addr;
> +}
> +
>  target_ulong riscv_load_kernel(MachineState *machine,
> +                               RISCVHartArrayState *harts,
>                                 target_ulong kernel_start_addr,
>                                 bool load_initrd,
>                                 symbol_fn_t sym_cb)
> @@ -231,7 +251,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>       * the (expected) load address load address. This allows kernels to =
have
>       * separate SBI and ELF entry points (used by FreeBSD, for example).
>       */
> -    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> +    if (load_elf_ram_sym(kernel_filename, NULL,
> +                         translate_kernel_address, NULL,
>                           NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>          kernel_entry =3D kernel_load_base;
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index c45023a2b1..b7e171b605 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -629,8 +629,8 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> -                                         true, NULL);
> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> +                                         kernel_start_addr, true, NULL);
>
>          /* Compute the fdt load address in dram */
>          fdt_load_addr =3D riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO]=
.base,
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index f6fd9725a5..1404a52da0 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machin=
e)
>      }
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, false, NUL=
L);
> +        riscv_load_kernel(machine, &s->soc.cpus,
> +                          memmap[IBEX_DEV_RAM].base, false, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 6835d1c807..04939b60c3 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machi=
ne)
>                            memmap[SIFIVE_E_DEV_MROM].base, &address_space=
_memory);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base,
> +        riscv_load_kernel(machine, &s->soc.cpus,
> +                          memmap[SIFIVE_E_DEV_DTIM].base,
>                            false, NULL);
>      }
>  }
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 9a75d4aa62..214430d40c 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -598,8 +598,8 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> -                                         true, NULL);
> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> +                                         kernel_start_addr, true, NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index c517885e6e..b3aac2178b 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -307,7 +307,7 @@ static void spike_board_init(MachineState *machine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc[0], kernel_s=
tart_addr,
>                                           true, htif_symbol_callback);
>      } else {
>         /*
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a931ed05ab..60c8729b5f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1281,8 +1281,8 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> -                                         true, NULL);
> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
> +                                         kernel_start_addr, true, NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index cbd131bad7..bc9faed397 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_f=
ilename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
>  target_ulong riscv_load_kernel(MachineState *machine,
> +                               RISCVHartArrayState *harts,
>                                 target_ulong firmware_end_addr,
>                                 bool load_initrd,
>                                 symbol_fn_t sym_cb);

Regards,
Bin

