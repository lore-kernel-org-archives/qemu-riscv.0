Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNEX-0008MN-Nd
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNEW-0008Lw-LU; Tue, 10 Jan 2023 17:36:40 -0500
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNEA-0001fw-TN; Tue, 10 Jan 2023 17:36:30 -0500
Received: by mail-ua1-x929.google.com with SMTP id f5so658581ual.12;
 Tue, 10 Jan 2023 14:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5o1iM8WV6kYSSryloRh/fSYsaulQuQaXW+NBbzBSQGE=;
 b=MNKZ7Jl13uZCnBg6hE5UvfHWs4K8hMXb3R74dbflfelQrG1Xw5TgMD8iP345nmSG/u
 GAk4PKx1QdISuURWJi5Nip7a8ozvgJqfuGWxPsX2oKqKUpEDT0HeNNXm2Y0ihz0QsHNl
 3E5teLY2S6/OZzSC0ArD+SPP+sWU5UkGvz8wJBzqJkY+GO5o2F5kiPNfDk8l2BRqe/kT
 zsQp1XdRDPePL1uUfIR+Js0fp54TwQ8KQAzuOKFt9/UUYtRISQ57BwjLsmGKJedrBKcD
 IxJC47/gBe/DVY31NHgwoH7x9Aq9f0WTaem570Q3vzIb8OKwzyS7Yw4Ony7EPmdQsz62
 NYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5o1iM8WV6kYSSryloRh/fSYsaulQuQaXW+NBbzBSQGE=;
 b=Jgh+a50MIXFOiKzIe75dAl7un7tQA1icTdjVy00rl0onZ4YAuxbkczwBUcprC+2hXm
 /26F9mSuHPjeefxu3zjBqyYLPVwfQCT6XP47AHz7r4vXozOX3AZLUAZqemtzXMtrj6we
 Ur1f/u4PtxjpRHCAbyDMBswJMdWEOFW1KhUchtLXCfckZRZOIWAOHcPLu9pZKspzBfUz
 5AMoB+tCV01LYRIAihv0k0keB8I0AYJ8lAPtjypnAxaR67ucclc3k75wIc0HU0Ey3nKs
 GFZ4p9dan9+UZpCP+o6AWxy4jPNfPeQsRFrprORtBdfJMSDzgtl7C/C1rfHbV2ijq6pG
 Rh5Q==
X-Gm-Message-State: AFqh2kpdUINz5eMxUQ7CjlAy9z+7XOqLIkEqTeHMl/Mvna9AayvNJCVT
 qZnwtD+Tc2YS1oh7y6kCRtSr/5HSwbQy9ke/APM=
X-Google-Smtp-Source: AMrXdXv0vXkzN8xEU8N/XbLKeySxo2qc+jc0WlPj/Rluah/4nCzaPT+/23zMMxGVE+lyrllJa0x0WrUCKfM+CDcgh4c=
X-Received: by 2002:a9f:3191:0:b0:419:1fa3:9618 with SMTP id
 v17-20020a9f3191000000b004191fa39618mr8644202uad.11.1673390177273; Tue, 10
 Jan 2023 14:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:35:51 +1000
Message-ID: <CAKmqyKOoZr7_KgkZ7Ei_Vz5863_O+dqeBnFu8JH_uFTCu+THbw@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng@tinylab.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:36:41 -0000

On Mon, Jan 2, 2023 at 9:54 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_load_initrd() returns the initrd end addr while also writing a
> 'start' var to mark the addr start. These informations are being used
> just to write the initrd FDT node. Every existing caller of
> riscv_load_initrd() is writing the FDT in the same manner.
>
> We can simplify things by writing the FDT inside riscv_load_initrd(),
> sparing callers from having to manage start/end addrs to write the FDT
> themselves.
>
> An 'if (fdt)' check is already inserted at the end of the function
> because we'll end up using it later on with other boards that doesn=C2=B4=
t
> have a FDT.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c            | 18 ++++++++++++------
>  hw/riscv/microchip_pfsoc.c | 10 ++--------
>  hw/riscv/sifive_u.c        | 10 ++--------
>  hw/riscv/spike.c           | 10 ++--------
>  hw/riscv/virt.c            | 10 ++--------
>  include/hw/riscv/boot.h    |  4 ++--
>  6 files changed, 22 insertions(+), 40 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 31aa3385a0..6b948d1c9e 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -208,9 +208,10 @@ target_ulong riscv_load_kernel(const char *kernel_fi=
lename,
>      exit(1);
>  }
>
> -hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
> -                         uint64_t kernel_entry, hwaddr *start)
> +void riscv_load_initrd(const char *filename, uint64_t mem_size,
> +                       uint64_t kernel_entry, void *fdt)
>  {
> +    hwaddr start, end;
>      ssize_t size;
>
>      g_assert(filename !=3D NULL);
> @@ -226,18 +227,23 @@ hwaddr riscv_load_initrd(const char *filename, uint=
64_t mem_size,
>       * halfway into RAM, and for boards with 256MB of RAM or more we put
>       * the initrd at 128MB.
>       */
> -    *start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
> +    start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
>
> -    size =3D load_ramdisk(filename, *start, mem_size - *start);
> +    size =3D load_ramdisk(filename, start, mem_size - start);
>      if (size =3D=3D -1) {
> -        size =3D load_image_targphys(filename, *start, mem_size - *start=
);
> +        size =3D load_image_targphys(filename, start, mem_size - start);
>          if (size =3D=3D -1) {
>              error_report("could not load ramdisk '%s'", filename);
>              exit(1);
>          }
>      }
>
> -    return *start + size;
> +    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
> +    if (fdt) {
> +        end =3D start + size;
> +        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", star=
t);
> +        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
> +    }
>  }
>
>  uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index b10321b564..593a799549 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -633,14 +633,8 @@ static void microchip_icicle_kit_machine_init(Machin=
eState *machine)
>                                           kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
> -            hwaddr start;
> -            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
> -                                           machine->ram_size, kernel_ent=
ry,
> -                                           &start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> -                                  "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> -                                  "linux,initrd-end", end);
> +            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
> +                              kernel_entry, machine->fdt);
>          }
>
>          if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ddceb750ea..37f5087172 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -608,14 +608,8 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
>                                           kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
> -            hwaddr start;
> -            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
> -                                           machine->ram_size, kernel_ent=
ry,
> -                                           &start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> -                                  "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
> -                                  end);
> +            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
> +                              kernel_entry, machine->fdt);
>          }
>      } else {
>         /*
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 004dfb2d5b..5668fe0694 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -316,14 +316,8 @@ static void spike_board_init(MachineState *machine)
>                                           htif_symbol_callback);
>
>          if (machine->initrd_filename) {
> -            hwaddr start;
> -            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
> -                                           machine->ram_size, kernel_ent=
ry,
> -                                           &start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> -                                  "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
> -                                  end);
> +            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
> +                              kernel_entry, machine->fdt);
>          }
>      } else {
>         /*
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 408f7a2256..5967b136b4 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1291,14 +1291,8 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>                                           kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
> -            hwaddr start;
> -            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
> -                                           machine->ram_size, kernel_ent=
ry,
> -                                           &start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> -                                  "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
> -                                  end);
> +            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
> +                              kernel_entry, machine->fdt);
>          }
>      } else {
>         /*
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index b273ab22f7..e37e1d1238 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -46,8 +46,8 @@ target_ulong riscv_load_firmware(const char *firmware_f=
ilename,
>  target_ulong riscv_load_kernel(const char *kernel_filename,
>                                 target_ulong firmware_end_addr,
>                                 symbol_fn_t sym_cb);
> -hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
> -                         uint64_t kernel_entry, hwaddr *start);
> +void riscv_load_initrd(const char *filename, uint64_t mem_size,
> +                       uint64_t kernel_entry, void *fdt);
>  uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
>                                 hwaddr saddr,
> --
> 2.39.0
>
>

