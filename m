Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNJS-0002vU-14
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNJR-0002vE-5K; Tue, 10 Jan 2023 17:41:45 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNJP-0002Wl-Ai; Tue, 10 Jan 2023 17:41:44 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id l129so5518424vkh.6;
 Tue, 10 Jan 2023 14:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKOdxVMmtDFqqhlfcceVsvXkQ422/uCyCvoV+jCVD8k=;
 b=FPVW+4knTh4AdwlAdBOZuh9SjcAEsvLQlKokMHKyuljk/oVpe/LscZPtzIdF2i/t1w
 R35JpiwFAgjYISx7PWs7g8laI++RJzjr0ue38XkweZcTSMBtiORxf2pXOWPZQYQfpMzT
 GLPsu5OOdrTqZhRTItKTPr7YzRLT3NKFs89jsY5nF5RS1uqb3nAJCobtYfMzYLZNA974
 yNFza0NUUYWYA24eJxHFo1FZUzx6F09okxVtCvLYU66mV3hhiQ+o1e6t23CFQqxA6Xod
 5ipXYHzxHC4ijMI9P5YG1v2lHoQr9y0sqsIpKDrkoqyAkM43tsN3FLHL/J6ymAJjn+pt
 C58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bKOdxVMmtDFqqhlfcceVsvXkQ422/uCyCvoV+jCVD8k=;
 b=4MrNOdR73I6wtXqmu7OVZkFzuPE4bsETQgu68Mn3t+R5xARJozHUPEiGLnVLsIuc8G
 5YJHBZ5SFYesjDsKpSmtK9Ld3vNCJnZiby+fWrTNFYijf+06Byx46+SAjNZz2bP91oQ+
 lF6qk9mcftDGMpaL2m4XXiHUEQ2iJVztDXEsBCMO/0MG63thOC7eY4ihErPqmd78/BR7
 L1Tn315sq2mbgb8X47Cwxoc91ieUrmyZDNWB2eKk2Ura04ea323hVmPwOMWNTDNJLfd2
 8LdEQHKa6RyPKsMBfFJS118RR63bGffk6lNBnyrhagcmnME9D5mk2EEgu3QW8t4bzN6+
 BUCQ==
X-Gm-Message-State: AFqh2kr+KtJeDeu6v1M9rFa+2cChvHRXZKDTOJ8GV54niAvkgef/jZRk
 6dOvY3cGDrGIhe1i/JO4J8eFhlwvtXu1jQnK+FU=
X-Google-Smtp-Source: AMrXdXv6cdbXYBFvPtVFb5LVazfHkq42rX7PoXHDgaUyNe7usvkjamv4FRP0Za6cGhqyBLP3B7Zb+F2FrBGbC1WtCAw=
X-Received: by 2002:a1f:3215:0:b0:3d5:86ff:6638 with SMTP id
 y21-20020a1f3215000000b003d586ff6638mr6753799vky.30.1673390502097; Tue, 10
 Jan 2023 14:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:41:15 +1000
Message-ID: <CAKmqyKMeSU=V9-wP4EFtawwbWri+OHUq70WU=5KF-gVPXF5+9A@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] hw/riscv/boot.c: make riscv_load_initrd() static
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:41:45 -0000

On Mon, Jan 2, 2023 at 9:57 PM Daniel Henrique Barboza
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

