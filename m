Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNFz-00011D-Kd
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNFw-00010t-Rk; Tue, 10 Jan 2023 17:38:09 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNFu-0001rb-1Z; Tue, 10 Jan 2023 17:38:08 -0500
Received: by mail-vs1-xe32.google.com with SMTP id a64so13887079vsc.2;
 Tue, 10 Jan 2023 14:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYdpJOpxbBLbVLXBmTQTT+U5cGXwPphZ/MPhhaenHnk=;
 b=pDZM55E0xYKy4OD1y/zluk6CEzsWb5JGaKQMai5vE4ak3tZCrTI17fy2vqglx0aL+n
 JefRmjI0UEpkXGcbH5dNSnBi/CXUvln5+IbcfQqXgD1JPBg0R+hbasXoKHvvH0qCS6Xa
 qe0d4ssHEZi584AHWwDqteZ5l8KyrPjvCsmzVlU3YlwApSw13aQKNBCotRyXw84Dqfki
 bKfJDfvIVQYH1sKCZNN2rIoMR1EBkT5UtAaI7PtcTniZXNhI8K/nOnNG4kR34pceG3QI
 UTQhBFwnzWTHEOibqC26JChwwa81VpETSvCyEloQy2ReRrwo8kpHXZ5uw+UMW/KzenXP
 NttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYdpJOpxbBLbVLXBmTQTT+U5cGXwPphZ/MPhhaenHnk=;
 b=WaEjjyEO9rMfNmhQn9PDhewXZgDRi3t+YRsozK8JstshM32NmqHCAR/orQ8EK2XwBH
 N/RaJ/qC+NoQzYaPOkBBM2R22Q7ViPed0ESp5neuWfHbx2Dm5m8IMakhSnjETNONvvJG
 pQ37DemYVbQbihQUYl8M3BGEeO1Yp83fm83xV5NpDRZRUBftBIUXFzW1KVcj0M+yQN3g
 04ZxKqX5fw+MiIqdCEdskXzBM7hPbRlwnaeWwImnLlmcvL1lQ4J8h1kPiY6216UyDTET
 zxFKwRtU9FKiRWoAq6tsiZbzwZtJJdITuWlOZbzLiKvFgrdQWRAmimhQwgXm7RY8cidi
 KbQQ==
X-Gm-Message-State: AFqh2koJDCIxd0/C8aa+5etS/yC6WcNn0iAVtKSaA3pJ0KgAZvadwTZm
 fh0FGLBlRSRRy66gSZm91a5cp/g2VQykyHbl92I=
X-Google-Smtp-Source: AMrXdXvXL6sUt9scn22Y3mSAFAwlQ51U8Y7wFx8jx/8f4Dl5XHMmSsXPT2l7W+6RZwdoCIpKDysMwxDA+LebdZxKlGU=
X-Received: by 2002:a67:6582:0:b0:3d0:d7ce:b383 with SMTP id
 z124-20020a676582000000b003d0d7ceb383mr123658vsb.72.1673390284741; Tue, 10
 Jan 2023 14:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-8-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:37:38 +1000
Message-ID: <CAKmqyKOvBk1oX7fenBWiK1Mo0OmpAtZoWiOhyOD+WF5pO=Yurg@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] hw/riscv: write bootargs 'chosen' FDT after
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng@tinylab.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:38:10 -0000

On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The sifive_u, spike and virt machines are writing the 'bootargs' FDT
> node during their respective create_fdt().
>
> Given that bootargs is written only when '-append' is used, and this
> option is only allowed with the '-kernel' option, which in turn is
> already being check before executing riscv_load_kernel(), write
> 'bootargs' in the same code path as riscv_load_kernel().
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 11 +++++------
>  hw/riscv/spike.c    |  9 +++++----
>  hw/riscv/virt.c     | 11 +++++------
>  3 files changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 37f5087172..3e6df87b5b 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -117,7 +117,6 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
> -        goto update_bootargs;
>      } else {
>          fdt =3D ms->fdt =3D create_device_tree(&fdt_size);
>          if (!fdt) {
> @@ -510,11 +509,6 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>      qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
>
>      g_free(nodename);
> -
> -update_bootargs:
> -    if (cmdline && *cmdline) {
> -        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> -    }
>  }
>
>  static void sifive_u_machine_reset(void *opaque, int n, int level)
> @@ -611,6 +605,11 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
>              riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
>                                kernel_entry, machine->fdt);
>          }
> +
> +        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> +            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> +                                    machine->kernel_cmdline);
> +        }
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 5668fe0694..60e2912be5 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -179,10 +179,6 @@ static void create_fdt(SpikeState *s, const MemMapEn=
try *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
> -
> -    if (cmdline && *cmdline) {
> -        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> -    }
>  }
>
>  static bool spike_test_elf_image(char *filename)
> @@ -319,6 +315,11 @@ static void spike_board_init(MachineState *machine)
>              riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
>                                kernel_entry, machine->fdt);
>          }
> +
> +        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> +            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> +                                    machine->kernel_cmdline);
> +        }
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5967b136b4..6c946b6def 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1012,7 +1012,6 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap,
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
> -        goto update_bootargs;
>      } else {
>          mc->fdt =3D create_device_tree(&s->fdt_size);
>          if (!mc->fdt) {
> @@ -1050,11 +1049,6 @@ static void create_fdt(RISCVVirtState *s, const Me=
mMapEntry *memmap,
>      create_fdt_fw_cfg(s, memmap);
>      create_fdt_pmu(s);
>
> -update_bootargs:
> -    if (cmdline && *cmdline) {
> -        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline)=
;
> -    }
> -
>      /* Pass seed to RNG */
>      qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
>      qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rn=
g_seed));
> @@ -1294,6 +1288,11 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>              riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
>                                kernel_entry, machine->fdt);
>          }
> +
> +        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> +            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> +                                    machine->kernel_cmdline);
> +        }
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> --
> 2.39.0
>
>

