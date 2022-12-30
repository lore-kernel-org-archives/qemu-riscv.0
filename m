Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pBBLA-0006p2-0P
	for mharc-qemu-riscv@gnu.org; Fri, 30 Dec 2022 04:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pBBL7-0006mF-0C; Fri, 30 Dec 2022 04:06:09 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pBBL1-0002tY-1A; Fri, 30 Dec 2022 04:06:08 -0500
Received: by mail-ed1-x536.google.com with SMTP id i9so29724521edj.4;
 Fri, 30 Dec 2022 01:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCZmz2Zuj8kmhT/YOCtHqF0c18b39aX+GartBp26qCE=;
 b=LU5M6ZeKLAs3lMvDwljxs+OzJW/VRChj4pb5n6k2EKJfPseU25tbFcwPEh8LjoD6Pw
 MFxviNa4U9J8Smimr+TlzQaJLuTX142+QQvhYBJD1R09M/xSOK6mVF+YoH+FfHYTSB6R
 KBdXG9bkSn8R1FxAWSf6VZbdMk6exO9iH2vpMuwUo2sl1JKm4qfVvsq0VfT/XDUqx7EY
 lNDGAGyJaSlZ+dmunVIA4oQqnCSITw4iqTshMDE4CZ8Kv5184dnUWrYalqV9kt5QY+Li
 TmQNhQiBg3WukDE3gO1Rek7N4UtQadvDHZy6DKiTYuMW3nuEgQ9lswYXX2JG8O1ySlxW
 vg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCZmz2Zuj8kmhT/YOCtHqF0c18b39aX+GartBp26qCE=;
 b=3Ins5sZqERrbRqx+aiLZs5jKSvBvKF6ITjfwtXIu1wt0FlDOIUTvOLmJcsjpj47Swa
 O2hncGQC+u7OSV3/WMEkVvEIvYJLdZ16ZPbJVHndFd7tgXV7UP1wsNzs9E74SWRPwDZf
 Bx25k2DRz4AwcTyT9wjg9WrKEhWzIJRmDluHrKEWORk7zrjbNNs+mhiWZPpqCnJA11pG
 ePWZ353XwG6hQWXOOQGRMhy/l6IWbbxEFHd8AlPIStXnO6UYqqr8RGW5b77D2cahAXOQ
 qyi4ywkAR1h5ZpGa6OXVP/QRUy7iyk5Lw8w0jfDz1vCEjJDYg9VMHTwYjZ5Pm94tC+5D
 Puhg==
X-Gm-Message-State: AFqh2kpGetdZ5OoAW2uqrL829ZXNvGUwkl25fRUbRwBsUquaESBKhopF
 GnPcRiyFXjxW7oggGmtzBkxqPxim3wwBP4RJ9RQ=
X-Google-Smtp-Source: AMrXdXsxB/lyPRYA7DEPWUYDtQebVMuojzzJoDBMorPVa2IExQEHkTwjUjQnHOCwqGJXJiTuNz3GYbaiSvXdDGiCnYc=
X-Received: by 2002:aa7:cb52:0:b0:484:93ac:33a6 with SMTP id
 w18-20020aa7cb52000000b0048493ac33a6mr1382866edt.81.1672391160864; Fri, 30
 Dec 2022 01:06:00 -0800 (PST)
MIME-Version: 1.0
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-11-dbarboza@ventanamicro.com>
In-Reply-To: <20221229181135.270661-11-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Dec 2022 17:05:50 +0800
Message-ID: <CAEUhbmVa8g-s0wD+EE6iZNXBfjD+M6edgq9vk7GdG2sx12J6Gg@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] hw/riscv/boot.c: introduce
 riscv_load_kernel_and_initrd()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Fri, 30 Dec 2022 09:06:09 -0000

On Fri, Dec 30, 2022 at 2:47 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> the same steps when '-kernel' is used:
>
> - execute load_kernel()
> - load init_rd()
> - write kernel_cmdline in the fdt
>
> Let's fold everything inside riscv_load_kernel() to avoid code
> repetition. Every other board that uses riscv_load_kernel() will have
> this same behavior, including boards that doesn't have a valid FDT, so
> we need to take care to not do FDT operations without checking it first.
>
> Since we're now doing way more than just loading the kernel, rename
> riscv_load_kernel() to riscv_load_kernel_and_initrd().
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 27 +++++++++++++++++++++------
>  hw/riscv/microchip_pfsoc.c | 12 ++----------
>  hw/riscv/opentitan.c       |  2 +-
>  hw/riscv/sifive_e.c        |  3 ++-
>  hw/riscv/sifive_u.c        | 12 ++----------
>  hw/riscv/spike.c           | 14 +++-----------
>  hw/riscv/virt.c            | 12 ++----------
>  include/hw/riscv/boot.h    |  6 +++---
>  8 files changed, 36 insertions(+), 52 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 5606ea6f43..d18262c302 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -171,12 +171,13 @@ target_ulong riscv_load_firmware(const char *firmwa=
re_filename,
>      exit(1);
>  }
>
> -target_ulong riscv_load_kernel(MachineState *machine,
> -                               target_ulong kernel_start_addr,
> -                               symbol_fn_t sym_cb)
> +target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
> +                                          target_ulong kernel_start_addr=
,
> +                                          symbol_fn_t sym_cb)

How about we keep the riscv_load_kernel() API, in case there is a need
for machines that just want to load kernel only?

Then introduce a new API riscv_load_kernel_and_initrd() to do both
kernel and initrd loading?

>  {
>      const char *kernel_filename =3D machine->kernel_filename;
>      uint64_t kernel_load_base, kernel_entry;
> +    void *fdt =3D machine->fdt;
>
>      g_assert(kernel_filename !=3D NULL);
>
> @@ -190,21 +191,35 @@ target_ulong riscv_load_kernel(MachineState *machin=
e,
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                           NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        return kernel_load_base;
> +        kernel_entry =3D kernel_load_base;
> +        goto out;
>      }
>
>      if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
>                         NULL, NULL, NULL) > 0) {
> -        return kernel_entry;
> +        goto out;
>      }
>
>      if (load_image_targphys_as(kernel_filename, kernel_start_addr,
>                                 current_machine->ram_size, NULL) > 0) {
> -        return kernel_start_addr;
> +        kernel_entry =3D kernel_start_addr;
> +        goto out;
>      }
>
>      error_report("could not load kernel '%s'", kernel_filename);
>      exit(1);
> +
> +out:
> +    if (machine->initrd_filename) {
> +        riscv_load_initrd(machine, kernel_entry);
> +    }
> +
> +    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> +                                machine->kernel_cmdline);
> +    }
> +
> +    return kernel_entry;
>  }
>
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 82ae5e7023..b64631f166 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -629,16 +629,8 @@ static void microchip_icicle_kit_machine_init(Machin=
eState *machine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen",
> -                                    "bootargs", machine->kernel_cmdline)=
;
> -        }
> +        kernel_entry =3D riscv_load_kernel_and_initrd(machine, kernel_st=
art_addr,
> +                                                    NULL);
>
>          /* Compute the fdt load address in dram */
>          fdt_load_addr =3D riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO]=
.base,
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 64d5d435b9..0818d9610c 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -101,7 +101,7 @@ static void opentitan_board_init(MachineState *machin=
e)
>      }
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
> +        riscv_load_kernel_and_initrd(machine, memmap[IBEX_DEV_RAM].base,=
 NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 3e3f4b0088..e22628b623 100644
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
> +        riscv_load_kernel_and_initrd(machine, memmap[SIFIVE_E_DEV_DTIM].=
base,
> +                                     NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index bac394c959..b6fb715a9f 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -598,16 +598,8 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> -                                    machine->kernel_cmdline);
> -        }
> +        kernel_entry =3D riscv_load_kernel_and_initrd(machine, kernel_st=
art_addr,
> +                                                    NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index bff9475686..cccfeb4fce 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -307,17 +307,9 @@ static void spike_board_init(MachineState *machine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> -                                         htif_symbol_callback);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> -                                    machine->kernel_cmdline);
> -        }
> +        kernel_entry =3D riscv_load_kernel_and_initrd(machine,
> +                                                    kernel_start_addr,
> +                                                    htif_symbol_callback=
);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c8e35f861e..eadf057940 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1281,16 +1281,8 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> -                                    machine->kernel_cmdline);
> -        }
> +        kernel_entry =3D riscv_load_kernel_and_initrd(machine, kernel_st=
art_addr,
> +                                                    NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index f94653a09b..16b86450d3 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -43,9 +43,9 @@ char *riscv_find_firmware(const char *firmware_filename=
,
>  target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
> -target_ulong riscv_load_kernel(MachineState *machine,
> -                               target_ulong firmware_end_addr,
> -                               symbol_fn_t sym_cb);
> +target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
> +                                          target_ulong firmware_end_addr=
,
> +                                          symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>  uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
> --

Regards,
Bin

