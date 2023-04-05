Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjw5V-0008T1-8t
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjw5U-0008Sn-7n; Wed, 05 Apr 2023 01:53:40 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjw5R-0002PN-Q7; Wed, 05 Apr 2023 01:53:39 -0400
Received: by mail-ua1-x92f.google.com with SMTP id r7so24867861uaj.2;
 Tue, 04 Apr 2023 22:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680674016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7B7hZN2XTy4tiEx8s6rjSv7dXmsCz/uOAssFkMqy+Kw=;
 b=Y89oxdd3kKtNAIDBlPBM5CLZh/hc/PxZ/Gx3H2xIU2BCPPWwrD/9RocyFBbLqY8LJP
 AwQaSC1Pwf7T3+NDYDEfL7vDRR/mvHOwqAPLvbKUfn25kILbndZsZymARFF9OzVeRQNm
 xTDrqxxMk5YOygoZmwgKjeLREfb5hL07Kw9x13VOYyHcI4p0IxI2WBC9I1u24CrGiIFa
 2UFImplt1Np7YBb8Eaz/xnkysKMg6T342OmuHxn/NXrsyPMGv4SNpePJxIpFCPagUNWy
 401Obx4jBB86leRuHA4tKfrcOdjiIcSNxSlWnYlEwBzj3+1kTvYHSKlgZsrQ8Vkvf0/0
 fCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680674016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7B7hZN2XTy4tiEx8s6rjSv7dXmsCz/uOAssFkMqy+Kw=;
 b=El3CuzG5+x9yeyqTz+d6tVkXjwU2PYXBhmMx6N9mcfToxXKEnh/4ii+qGeqZuDgqAI
 FVC0SR7e76LprbkQjIEF+W/R9b9r8iqhwlKFdRjPuoGaJjgwF6+wfLEQ368B3pqtN+YO
 jsoY2Cu+lzVavKSrvnpnBFBdimo0zPmP6U01p2eku7QA2nW1PvSYJHiA6sJ8UHATHAR9
 Tw+QTLiTcCqg0KF+nZLBVmGfG2Xn9CDzK6qyRVQR9cDuHJ5jz5Y8qGoxxXXYsMu/v2Nw
 ITZhp2pL9wkcGqsrBpIXH0rriRu87Czscq2nBNxV01WILbSqkDcMc775iVtSYqSYpn9s
 0MqA==
X-Gm-Message-State: AAQBX9f7lh/iIVxk6HnlTJw+E1uT8KlcQ2TbtZOkyRSpyq9FUrzqOWTT
 uWJrEuBatfdHj9sdBDjbQxfVG70l28QdSa5UyiY=
X-Google-Smtp-Source: AKy350aQYEw8fW0DNSrincs/tCC3Y5nYTHWUjEMYrhBQHzaUE6ajU1o7wjtZAXA3WkyDM8Bz9lrfEirNvF5BS+L/OFY=
X-Received: by 2002:a05:6122:1801:b0:401:d1f4:bccf with SMTP id
 ay1-20020a056122180100b00401d1f4bccfmr1959234vkb.0.1680674016282; Tue, 04 Apr
 2023 22:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230313021826.6898-1-xuhang@eswincomputing.com>
 <20230313021826.6898-2-xuhang@eswincomputing.com>
In-Reply-To: <20230313021826.6898-2-xuhang@eswincomputing.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:53:10 +1000
Message-ID: <CAKmqyKNuA-4SpfN+RNDo8wOFgVuD-s-tXGOg+1po4KYW8KfhUQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] hw/riscv: Fix max size limit when put initrd to RAM
To: Hang Xu <xuhang@eswincomputing.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@rivosinc.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:53:40 -0000

On Mon, Mar 13, 2023 at 11:12=E2=80=AFPM Hang Xu <xuhang@eswincomputing.com=
> wrote:
>
> Because the starting address of ram is not necessarily 0,
> the remaining free space in ram is
> ram_size - (start - ram_base) instead of ram_size-start.

I think this could be clearer. It's not clear here that you mean the
free space after the kernel (for in the initrd).

>
> Signed-off-by: Hang Xu <xuhang@eswincomputing.com>
> ---
>  hw/riscv/boot.c            | 19 +++++++++++++------
>  hw/riscv/microchip_pfsoc.c |  5 ++++-
>  hw/riscv/opentitan.c       |  2 +-
>  hw/riscv/sifive_e.c        |  2 +-
>  hw/riscv/sifive_u.c        |  5 ++++-
>  hw/riscv/spike.c           |  5 ++++-
>  hw/riscv/virt.c            |  5 ++++-
>  include/hw/riscv/boot.h    |  2 ++
>  8 files changed, 33 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 52bf8e67de..cfbc376a82 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -173,13 +173,14 @@ target_ulong riscv_load_firmware(const char *firmwa=
re_filename,
>      exit(1);
>  }
>
> -static void riscv_load_initrd(MachineState *machine, uint64_t kernel_ent=
ry)
> +static void riscv_load_initrd(MachineState *machine, uint64_t kernel_ent=
ry,
> +                              uint64_t ram_base, uint64_t ram_size)
>  {
>      const char *filename =3D machine->initrd_filename;
> -    uint64_t mem_size =3D machine->ram_size;
>      void *fdt =3D machine->fdt;
>      hwaddr start, end;
>      ssize_t size;
> +    uint64_t max_initrd;
>
>      g_assert(filename !=3D NULL);
>
> @@ -193,12 +194,16 @@ static void riscv_load_initrd(MachineState *machine=
, uint64_t kernel_entry)
>       * So for boards with less  than 256MB of RAM we put the initrd
>       * halfway into RAM, and for boards with 256MB of RAM or more we put
>       * the initrd at 128MB.
> +     * A ram_size =3D=3D 0, usually from a MemMapEntry[].size element,
> +     * means that the RAM block goes all the way to ms->ram_size.
>       */
> -    start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
> +    ram_size =3D ram_size ? MIN(machine->ram_size, ram_size) : machine->=
ram_size;

This doesn't seem right. If machine->ram_size is greater then the
board can support we should tell the user and have them set a correct
size

> +    start =3D kernel_entry + MIN(ram_size / 2, 128 * MiB);
> +    max_initrd =3D ram_size - (start - ram_base);

Good catch. Passing the base address of memory is a good move here.

Alistair

>
> -    size =3D load_ramdisk(filename, start, mem_size - start);
> +    size =3D load_ramdisk(filename, start, max_initrd);
>      if (size =3D=3D -1) {
> -        size =3D load_image_targphys(filename, start, mem_size - start);
> +        size =3D load_image_targphys(filename, start, max_initrd);
>          if (size =3D=3D -1) {
>              error_report("could not load ramdisk '%s'", filename);
>              exit(1);
> @@ -217,6 +222,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                 RISCVHartArrayState *harts,
>                                 target_ulong kernel_start_addr,
>                                 bool load_initrd,
> +                               uint64_t ram_base,
> +                               uint64_t ram_size,
>                                 symbol_fn_t sym_cb)
>  {
>      const char *kernel_filename =3D machine->kernel_filename;
> @@ -263,7 +270,7 @@ out:
>      }
>
>      if (load_initrd && machine->initrd_filename) {
> -        riscv_load_initrd(machine, kernel_entry);
> +        riscv_load_initrd(machine, kernel_entry, ram_base, ram_size);
>      }
>
>      if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index e81bbd12df..b42d90b89e 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -630,7 +630,10 @@ static void microchip_icicle_kit_machine_init(Machin=
eState *machine)
>                                                           firmware_end_ad=
dr);
>
>          kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> -                                         kernel_start_addr, true, NULL);
> +                                         kernel_start_addr, true,
> +                                         memmap[MICROCHIP_PFSOC_DRAM_LO]=
.base,
> +                                         memmap[MICROCHIP_PFSOC_DRAM_LO]=
.size,
> +                                         NULL);
>
>          /* Compute the fdt load address in dram */
>          fdt_load_addr =3D riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_=
DRAM_LO].base,
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index b06944d382..bb663523d5 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -103,7 +103,7 @@ static void opentitan_board_init(MachineState *machin=
e)
>      if (machine->kernel_filename) {
>          riscv_load_kernel(machine, &s->soc.cpus,
>                            memmap[IBEX_DEV_RAM].base,
> -                          false, NULL);
> +                          false, 0, 0, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 04939b60c3..5b47d539a6 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -116,7 +116,7 @@ static void sifive_e_machine_init(MachineState *machi=
ne)
>      if (machine->kernel_filename) {
>          riscv_load_kernel(machine, &s->soc.cpus,
>                            memmap[SIFIVE_E_DEV_DTIM].base,
> -                          false, NULL);
> +                          false, 0, 0, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 35a335b8d0..b45fdc968c 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -599,7 +599,10 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
>                                                           firmware_end_ad=
dr);
>
>          kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> -                                         kernel_start_addr, true, NULL);
> +                                         kernel_start_addr, true,
> +                                         memmap[SIFIVE_U_DEV_DRAM].base,
> +                                         memmap[SIFIVE_U_DEV_DRAM].size,
> +                                         NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index a584d5b3a2..e322ed8506 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -307,7 +307,10 @@ static void spike_board_init(MachineState *machine)
>
>          kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
>                                           kernel_start_addr,
> -                                         true, htif_symbol_callback);
> +                                         true,
> +                                         memmap[SPIKE_DRAM].base,
> +                                         memmap[SPIKE_DRAM].size,
> +                                         htif_symbol_callback);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..11f26b0dc0 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1287,7 +1287,10 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>                                                           firmware_end_ad=
dr);
>
>          kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
> -                                         kernel_start_addr, true, NULL);
> +                                         kernel_start_addr, true,
> +                                         memmap[VIRT_DRAM].base,
> +                                         memmap[VIRT_DRAM].size,
> +                                         NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next=
 mode
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index a2e4ae9cb0..987e1add38 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -47,6 +47,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                 RISCVHartArrayState *harts,
>                                 target_ulong firmware_end_addr,
>                                 bool load_initrd,
> +                               uint64_t ram_base,
> +                               uint64_t ram_size,
>                                 symbol_fn_t sym_cb);
>  uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
>                                  MachineState *ms);
> --
> 2.17.1
>
>

