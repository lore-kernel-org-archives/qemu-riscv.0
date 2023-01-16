Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHFfX-0001Gd-8C
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 21:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFfV-0001GO-QO; Sun, 15 Jan 2023 21:56:17 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFfU-0001SH-6J; Sun, 15 Jan 2023 21:56:17 -0500
Received: by mail-vs1-xe31.google.com with SMTP id o63so27752714vsc.10;
 Sun, 15 Jan 2023 18:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yb3gZmrf+v4Ba0K6ZEkHww3+50rssjbTaGOUxxpOU2s=;
 b=BjS3TfjPiFSRiAdsXPn06PYOJVrpAZwHl1Ryfia+pNTxZVLJjvpHkPmkqLz3x/IUix
 uXHp1N6JHldTmxiElufUGww8QYFrLffUgPAlIVzYjYYiGJGKNEY6DZSswVbye1OErNSg
 RUt6YJaAiJcrl1FLi4pMvCw9lmbUwRQ6K535mbuDOkzTOjJPdCKdOyJFZmfLGhpBgbo1
 +NRodYCIRcmRGFA5/XOgzMP+S4ZY0apqG/SaSNbnwT/Rj4MM80HuSJiJYJAhmOjgDUrL
 BID9YO5aghr33hwxQYdsuPIHeB7NSdQA3jNQMj51DZDS5Tj0750I9FaasligwokypfiO
 vsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yb3gZmrf+v4Ba0K6ZEkHww3+50rssjbTaGOUxxpOU2s=;
 b=MLaJozEo7ULhI1givm+8aBzuBCy5MB0Mn8YWuVkoxpm6Y8SivSVFk7pb0LXOBoNz+e
 AlEiOjRoHqoXU4RtXgp+T60u/AwWm8d2+7EqqvuY4zgwix/ujr5cUxz733kERts+H4dz
 Z2r+cOfX+BRfPN7Qh/tf6wIuqQ8pbjEXAAmkx4yOwUngc3nw4zC6+wSNfkNjwF8tAyeT
 UDP6w2C0HeKBhZdz8fviOK8EuyDRO70ZZXbfU3nz6aRR3z9ZSZVrkafhXEDtRTV4LUvO
 wvQ9MH7CdiKK3g0ASYTpcAWTFxlYu30y2Yg2GQQ/z3Tk6G5UZLgBxo9HT6TEZ5euhVOG
 dQ9g==
X-Gm-Message-State: AFqh2kruBDGEr+T5IQPuFeuKi5fgiWrhfQ1TjjrnSjya+Py4DNPlg55y
 need0A7NKyj+etSw2VbglfybdAX4ydIksEPcmfM=
X-Google-Smtp-Source: AMrXdXshapRqyZPBjzSsNd6H2uSXZIVTsCQzp0VjwdkTpI29/vbIUdwmbUVVVWZUMskuSwDUCkHbBS3HlStn/jeUqEs=
X-Received: by 2002:a67:e052:0:b0:3d0:c2e9:cb77 with SMTP id
 n18-20020a67e052000000b003d0c2e9cb77mr3003019vsl.54.1673837774674; Sun, 15
 Jan 2023 18:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
 <20230113171805.470252-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230113171805.470252-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 12:55:48 +1000
Message-ID: <CAKmqyKOgn3a_Fe7sr75iVsJTMUehRWLTLH0e89vKS--TA2Je2g@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hw/riscv/boot.c: make riscv_load_initrd() static
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 02:56:18 -0000

On Sat, Jan 14, 2023 at 3:39 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The only remaining caller is riscv_load_kernel_and_initrd() which
> belongs to the same file.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c         | 80 ++++++++++++++++++++---------------------
>  include/hw/riscv/boot.h |  1 -
>  2 files changed, 40 insertions(+), 41 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 4888d5c1e0..e868fb6ade 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -173,6 +173,46 @@ target_ulong riscv_load_firmware(const char *firmwar=
e_filename,
>      exit(1);
>  }
>
> +static void riscv_load_initrd(MachineState *machine, uint64_t kernel_ent=
ry)
> +{
> +    const char *filename =3D machine->initrd_filename;
> +    uint64_t mem_size =3D machine->ram_size;
> +    void *fdt =3D machine->fdt;
> +    hwaddr start, end;
> +    ssize_t size;
> +
> +    g_assert(filename !=3D NULL);
> +
> +    /*
> +     * We want to put the initrd far enough into RAM that when the
> +     * kernel is uncompressed it will not clobber the initrd. However
> +     * on boards without much RAM we must ensure that we still leave
> +     * enough room for a decent sized initrd, and on boards with large
> +     * amounts of RAM we must avoid the initrd being so far up in RAM
> +     * that it is outside lowmem and inaccessible to the kernel.
> +     * So for boards with less  than 256MB of RAM we put the initrd
> +     * halfway into RAM, and for boards with 256MB of RAM or more we put
> +     * the initrd at 128MB.
> +     */
> +    start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
> +
> +    size =3D load_ramdisk(filename, start, mem_size - start);
> +    if (size =3D=3D -1) {
> +        size =3D load_image_targphys(filename, start, mem_size - start);
> +        if (size =3D=3D -1) {
> +            error_report("could not load ramdisk '%s'", filename);
> +            exit(1);
> +        }
> +    }
> +
> +    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
> +    if (fdt) {
> +        end =3D start + size;
> +        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", star=
t);
> +        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
> +    }
> +}
> +
>  target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong kernel_start_addr,
>                                 bool load_initrd,
> @@ -225,46 +265,6 @@ out:
>      return kernel_entry;
>  }
>
> -void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
> -{
> -    const char *filename =3D machine->initrd_filename;
> -    uint64_t mem_size =3D machine->ram_size;
> -    void *fdt =3D machine->fdt;
> -    hwaddr start, end;
> -    ssize_t size;
> -
> -    g_assert(filename !=3D NULL);
> -
> -    /*
> -     * We want to put the initrd far enough into RAM that when the
> -     * kernel is uncompressed it will not clobber the initrd. However
> -     * on boards without much RAM we must ensure that we still leave
> -     * enough room for a decent sized initrd, and on boards with large
> -     * amounts of RAM we must avoid the initrd being so far up in RAM
> -     * that it is outside lowmem and inaccessible to the kernel.
> -     * So for boards with less  than 256MB of RAM we put the initrd
> -     * halfway into RAM, and for boards with 256MB of RAM or more we put
> -     * the initrd at 128MB.
> -     */
> -    start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
> -
> -    size =3D load_ramdisk(filename, start, mem_size - start);
> -    if (size =3D=3D -1) {
> -        size =3D load_image_targphys(filename, start, mem_size - start);
> -        if (size =3D=3D -1) {
> -            error_report("could not load ramdisk '%s'", filename);
> -            exit(1);
> -        }
> -    }
> -
> -    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
> -    if (fdt) {
> -        end =3D start + size;
> -        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", star=
t);
> -        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
> -    }
> -}
> -
>  uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>  {
>      uint64_t temp, fdt_addr;
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index c3de897371..cbd131bad7 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -47,7 +47,6 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong firmware_end_addr,
>                                 bool load_initrd,
>                                 symbol_fn_t sym_cb);
> -void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>  uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
>                                 hwaddr saddr,
> --
> 2.39.0
>
>

