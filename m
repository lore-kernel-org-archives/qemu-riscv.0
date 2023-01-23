Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJkHV-0007uN-Gi
	for mharc-qemu-riscv@gnu.org; Sun, 22 Jan 2023 19:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJkHT-0007tu-VN; Sun, 22 Jan 2023 19:01:47 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJkHR-0006mP-RO; Sun, 22 Jan 2023 19:01:47 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id q21so5226631vka.3;
 Sun, 22 Jan 2023 16:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NBcqqjcEF0dc5fWct4sV6OKuKM5spyiDbli2Qgd4Ow=;
 b=JJ8V89sGhdj5qNJkNNpRwykGvSyUULXVv7IJJOuiBA0/aTw26k7cMutyJxl7lQBxO5
 091NyHgocD/6u+gFtxEL9GvVOMijUPFmVVNYzvu2GrGl6Ki98w8eL7OozPJkVPAD+Q7N
 AHxCTjRDoSBtp1HSJ9H20ojoW+ngAZjSeJ28mSCHMy5lvoJ9vQK8/FRIpmd78UmlapV9
 8QCFSTGch8cxle21kWCjU6AdID3/6JxFx0xzEZVdg9D/4/5lIiHURAMd6I+/g1IBWd25
 pbytGPZfwWOy6TSjXxrP+x4T7qkj2JixHCtlnXpmrM/iUTi0TR4gl+xw/dbGF0+WKN9I
 bHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NBcqqjcEF0dc5fWct4sV6OKuKM5spyiDbli2Qgd4Ow=;
 b=KG+Zj/n5jjNzVpmj7sekEJVmmyVvR+R5U8O74R0aX7bVKUE6uggAlb7LHJpCodMIP0
 0/NKOy8wG9fEw4q8EhldgLGpKorMQf0L2b1iFrUaOOnaN8jjKqx4SLpgYtFpA7V9/6EQ
 cxnq/mgwmCHirVOtc3DU1EbTWuHbCcPrAl/knh0DJC0Nyft9MQRS8NOCFGFaWQg8Edcj
 GBt9w6hWohw4kG0r/qk/aJRXs/Fr+XM8odKF9p+NkhoErFplX1a/fL7utm4NukTeerjP
 OGqS4IlggpKyyxk6UvhQ9iEhMuxUu06NWgCdKqT3em48ulvCPfsvzlu2DEr0PvBOC7uG
 D52w==
X-Gm-Message-State: AFqh2kq/USzqIo1TbgtmGvdnclaJ6wlRcebqpLcaUDLELQcL6NSX9U+c
 4BiMBekrZw2IjTKrTZOgRUUshC6xZBxE/GcQVHs=
X-Google-Smtp-Source: AMrXdXse0v/P04PggFKeZOl8SgzuHXzgx8pftcoqT5cBcIAcJCNBL3nL1eKcqd2NoKP5194p21b/G+YIt13zZxV6LMk=
X-Received: by 2002:a1f:2c0c:0:b0:3e1:7e08:a117 with SMTP id
 s12-20020a1f2c0c000000b003e17e08a117mr2969781vks.34.1674432104307; Sun, 22
 Jan 2023 16:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20230119213707.651533-1-dbarboza@ventanamicro.com>
 <20230119213707.651533-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230119213707.651533-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 10:01:18 +1000
Message-ID: <CAKmqyKPpUo-ZXVLJuUh5ZrXmvfoh69D+wXfjsdTP=TMa5J2nAw@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] hw/riscv: clear kernel_entry higher bits from
 load_elf_ram_sym()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 00:01:48 -0000

On Fri, Jan 20, 2023 at 7:38 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit
> QEMU guest happens to be running in a hypervisor that are using 64
> bits to encode its address, kernel_entry can be padded with '1's
> and create problems [1].
>
> Use a translate_fn() callback to be called by load_elf_ram_sym() and
> return only the 32 bits address if we're running a 32 bit CPU.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c            | 20 +++++++++++++++++++-
>  hw/riscv/microchip_pfsoc.c |  3 ++-
>  hw/riscv/opentitan.c       |  3 ++-
>  hw/riscv/sifive_e.c        |  3 ++-
>  hw/riscv/sifive_u.c        |  3 ++-
>  hw/riscv/spike.c           |  3 ++-
>  hw/riscv/virt.c            |  3 ++-
>  include/hw/riscv/boot.h    |  1 +
>  8 files changed, 32 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..46fc7adccf 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -173,7 +173,24 @@ target_ulong riscv_load_firmware(const char *firmwar=
e_filename,
>      exit(1);
>  }
>
> +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> +{
> +    RISCVHartArrayState *harts =3D opaque;
> +
> +    if (riscv_is_32bit(harts)) {
> +        /*
> +         * For 32 bit CPUs, kernel_load_base is sign-extended
> +         * (i.e. it can be padded with '1's) by load_elf().
> +         * Remove the sign extension by truncating to 32-bit.
> +         */
> +        return extract64(addr, 0, 32);
> +    }
> +
> +    return addr;
> +}
> +
>  target_ulong riscv_load_kernel(MachineState *machine,
> +                               RISCVHartArrayState *harts,
>                                 target_ulong kernel_start_addr,
>                                 symbol_fn_t sym_cb)
>  {
> @@ -189,7 +206,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>       * the (expected) load address load address. This allows kernels to =
have
>       * separate SBI and ELF entry points (used by FreeBSD, for example).
>       */
> -    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> +    if (load_elf_ram_sym(kernel_filename, NULL,
> +                         translate_kernel_address, harts,
>                           NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>          return kernel_load_base;
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 82ae5e7023..bdefeb3cbb 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -629,7 +629,8 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> +                                         kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 64d5d435b9..2731138c41 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machin=
e)
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
> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machi=
ne)
>                            memmap[SIFIVE_E_DEV_MROM].base, &address_space=
_memory);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL)=
;
> +        riscv_load_kernel(machine, &s->soc.cpus,
> +                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 2fb6ee231f..83dfe09877 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -598,7 +598,8 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> +                                         kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index badc11ec43..2bcc50d90d 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -305,7 +305,8 @@ static void spike_board_init(MachineState *machine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
> +                                         kernel_start_addr,
>                                           htif_symbol_callback);
>
>          if (machine->initrd_filename) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a11b4b010..ac173a6ed6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1274,7 +1274,8 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
> +                                         kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index f94653a09b..105706bf25 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_f=
ilename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
>  target_ulong riscv_load_kernel(MachineState *machine,
> +                               RISCVHartArrayState *harts,
>                                 target_ulong firmware_end_addr,
>                                 symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
> --
> 2.39.0
>
>

