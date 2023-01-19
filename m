Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIIfi-00072N-FC
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 19:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pIIfg-000718-JO; Wed, 18 Jan 2023 19:20:48 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pIIfe-0008QV-Bl; Wed, 18 Jan 2023 19:20:48 -0500
Received: by mail-ej1-x632.google.com with SMTP id vm8so1595119ejc.2;
 Wed, 18 Jan 2023 16:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4muWt7+KHIeYRqY0rLGpjneuhy1mnH2URYWVZbVF0o=;
 b=XCGuxh1ThPmujO7BrmtChkgejUb2vEbz8TGUoDhKzIp/T7pPrXNdVw1H85sDfXEHYD
 eQC1L0xu9S7CBrY/xLnJEpO2gvbR15twClU5sryNU2OtIdEgtLpW0O0Kr5dZlQ4fizlZ
 mcjamD1slv40xQ4xFnLK1IH36zyE+olb8OvScI71y0vMYkTFUszvVRBiBiol6LKDECs3
 D7GKzD5ncp9pQM5GKzZX7rnDjXeBHOhRSn+fLTsXQXDVN3qb7Tn6x30SzCvJHkiOq4XG
 jOGbHt6ipWaM1QFQ9/IRnrT1VRX/qP1fohXDUhHo+sBXOY2z7dckueQDWAKwwtFE2lQF
 mjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4muWt7+KHIeYRqY0rLGpjneuhy1mnH2URYWVZbVF0o=;
 b=3xLPnga9VzjYuky4MMFc+UjC5ge+Uor52AdA7gMaGOhpP2VQOVrptf/R9ohxF7pKw7
 BGZFcAtRJuchRmP1uXJLpOWePp5ZHJ1T2DPzaVXcZUD4QVX03Mrg/HIGiAPVbBSDOnkc
 HEnCQfad9mYGeIQzN5OzNisTDVn5oyBfuimU32s06NU4JtOIL7wqItpXfOPlyGDeIzLJ
 h7iQBqw0/k3+AwdkqJfSyjgM3bF2WpNMUWYrxbK8yO16kKnvYN2ly1b4LjKTCXXvFK1O
 o6aH11Svx2NEcTl9cAkxGcNBOPeanfANkMKME5IwXcDOCgaZ4pENRvdOA0oOAmMbqbfH
 K1QA==
X-Gm-Message-State: AFqh2kqeSrlm3mPYOe6m0+Zm324jZ6nEpiqLd1NNGYruSrTx16c6Lw4J
 XFDAfWp7n91yKYjr0xhQwWe3C5nrEz6qOglxc0gcuwXV
X-Google-Smtp-Source: AMrXdXsrBZ8xuUG6e2mIgVx6vxmP3nvZxXoA7GtGORbO9ZjE1CWbe8D/kCUzjYEZ7kOFZNLvhdBpx5m8E3Jwnvfn6Vk=
X-Received: by 2002:a17:906:944:b0:86f:f270:b832 with SMTP id
 j4-20020a170906094400b0086ff270b832mr1033688ejd.26.1674087621683; Wed, 18 Jan
 2023 16:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
 <20230116122948.757515-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230116122948.757515-4-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Jan 2023 08:20:15 +0800
Message-ID: <CAEUhbmXr+YsOibVRipr+ge0R1SrBT-44WqiM1kp=7+4FKijAgA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 00:20:49 -0000

On Mon, Jan 16, 2023 at 8:30 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Recent hw/risc/boot.c changes caused a regression in an use case with
> the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> stopped working. The reason seems to be that Xvisor is using 64 bit to
> encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> sign-extending the result with '1's [1].
>
> Use a translate_fn() callback to be called by load_elf_ram_sym() and
> return only the 32 bits address if we're running a 32 bit CPU.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 20 +++++++++++++++++++-
>  hw/riscv/microchip_pfsoc.c |  4 ++--
>  hw/riscv/opentitan.c       |  3 ++-
>  hw/riscv/sifive_e.c        |  3 ++-
>  hw/riscv/sifive_u.c        |  4 ++--
>  hw/riscv/spike.c           |  2 +-
>  hw/riscv/virt.c            |  4 ++--
>  include/hw/riscv/boot.h    |  1 +
>  target/riscv/cpu_bits.h    |  1 +
>  9 files changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index e868fb6ade..0fd39df7f3 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -213,7 +213,24 @@ static void riscv_load_initrd(MachineState *machine,=
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
> +     * it can be padded with '1's) if the hypervisor is using
> +     * 64 bit addresses with 32 bit guests.

This comment is not accurate. It has nothing to do with the hypervisor
using a 64-bit address. It's the ELF loader that is sign-extending the
32-bit address.

> +     */
> +    if (riscv_is_32bit(harts)) {
> +        return extract64(addr, 0, RV32_KERNEL_ADDR_LEN);
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
> @@ -231,7 +248,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
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
> index ccad386920..b0b3e6f03a 100644
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
> index 91bf194ec1..3c0ac916c0 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -305,7 +305,7 @@ static void spike_board_init(MachineState *machine)
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
> index e374b58f89..cf64da65bf 100644
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
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 8b0d7e20ea..8fcaeae342 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -751,6 +751,7 @@ typedef enum RISCVException {
>  #define MENVCFG_STCE                       (1ULL << 63)
>
>  /* For RV32 */
> +#define RV32_KERNEL_ADDR_LEN               32
>  #define MENVCFGH_PBMTE                     BIT(30)
>  #define MENVCFGH_STCE                      BIT(31)
>
> --

Regards,
Bin

