Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhQ53-0004x4-Ju
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 02:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhQ4s-0004uV-3F; Thu, 21 Apr 2022 02:14:06 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:40752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhQ4k-0004T9-01; Thu, 21 Apr 2022 02:14:05 -0400
Received: by mail-yb1-xb29.google.com with SMTP id i20so6898835ybj.7;
 Wed, 20 Apr 2022 23:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=87F1HA5AqBw8geHwdp8upQOGJhzil6Vrc0L6+d1cQvI=;
 b=eaDtBeOr7S9K+DVR7DsWh/i5cXmJmUd2YkCCzV7JEBozOaeGQhLrMdRphQx/mvotVJ
 I7+P3oPYroeVsu1iz3U4wwM/c6yfYirU6TfrO3cGkpI051w4XkUp9SIwFlp7b70ZLNP7
 O58bnNbzoDiICV37ZoMGMsiEK23hTp0OK7Cpr46fqCITwoIwD08b/6/+9X6OV+LWnAPZ
 Yr0/Cp3+i2yZKofjL89ReP/nIeG4s9499brm6Sn5EegSAU8XbGBDJhVY2b+SXmxVH02E
 /iGLIRF3vyVM04o0MvXsNhYmOBuJ0pSnLPH/diLNRTuLvZ26JJ+JTSlE9aAvFXGRmZU0
 9SRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87F1HA5AqBw8geHwdp8upQOGJhzil6Vrc0L6+d1cQvI=;
 b=a68ZQWEZgoABz5lmxMLrRUdFVqAIa0Kg4ZUFKcOM/FlocaMSRzRNS615oWL3cREH0Z
 AIQs5UxqdtkClp3y2+RiufLladnGWESW90+KZn5aVOg/8w1/1m6cf6K1lwbIevSKqTf0
 UkUfxplaYVEXlR1Y21bBIWn9JxoC8viDzazLaOQed3IZO7ENWqLAhZ9LWXwXsGey6afE
 UmPkGZPXOk0d+/iUjhTffqgSPKxHARo1k5rYQMh2XcapjtjZB6NP7tuISRk1dESIzvBy
 ebBAWHzcqHYlwUrVaUjMYm0y+S4vG7pm4zcMR7G9RUNAQIoHsAksVWVSmcnEFmw07tzq
 Yy6A==
X-Gm-Message-State: AOAM533B8MhUWnAvvyFrLzw4oE9X25NunchV3T0vC56pVWehXS1D0VoV
 5HNNOMEX2QRvSGmui7CFT0qi56Z9pSIu4Wzhc6w/5XNSPLQ=
X-Google-Smtp-Source: ABdhPJwbCKxxG+iBb2mITXd1aAVrozdYsrPm5lL/7ICma927RGsPQp8Bmsynw6hMfrw0ojlUMMYeBx2Tf7ATe4GOa3A=
X-Received: by 2002:a05:6902:532:b0:644:b35d:a27 with SMTP id
 y18-20020a056902053200b00644b35d0a27mr22421751ybs.579.1650521636159; Wed, 20
 Apr 2022 23:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220421055629.1177285-1-bmeng.cn@gmail.com>
 <20220421055629.1177285-2-bmeng.cn@gmail.com>
In-Reply-To: <20220421055629.1177285-2-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 14:13:45 +0800
Message-ID: <CAEUhbmXtfKg55viU=-jKZksWmLTguAN+8qSHzquU_896NC10Yw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: Don't add empty bootargs to device tree
To: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Apr 2022 06:14:07 -0000

+ Philippe's another email address as the redhat one is unreachable

On Thu, Apr 21, 2022 at 1:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Commit 7c28f4da20e5 ("RISC-V: Don't add NULL bootargs to device-tree")
> tried to avoid adding *NULL* bootargs to device tree, but unfortunately
> the changes were entirely useless, due to MachineState::kernel_cmdline
> can't be NULL at all as the default value is given as an empty string.
> (see hw/core/machine.c::machine_initfn()).
>
> Note the wording of *NULL* bootargs is wrong. It can't be NULL otherwise
> a segfault had already been observed by dereferencing the NULL pointer.
> It should be worded as *empty" bootargs.
>
> Fixes: 7c28f4da20e5 ("RISC-V: Don't add NULL bootargs to device-tree")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/riscv/microchip_pfsoc.c | 2 +-
>  hw/riscv/sifive_u.c        | 2 +-
>  hw/riscv/spike.c           | 2 +-
>  hw/riscv/virt.c            | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index cafd1fc9ae..10a5d0e501 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -571,7 +571,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>                                    "linux,initrd-end", end);
>          }
>
> -        if (machine->kernel_cmdline) {
> +        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>              qemu_fdt_setprop_string(machine->fdt, "/chosen",
>                                      "bootargs", machine->kernel_cmdline);
>          }
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7fbc7dea42..cc8c7637cb 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -511,7 +511,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      g_free(nodename);
>
>  update_bootargs:
> -    if (cmdline) {
> +    if (cmdline && *cmdline) {
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
>  }
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 1562b000bb..068ba3493e 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -177,7 +177,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
>
> -    if (cmdline) {
> +    if (cmdline && *cmdline) {
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
>  }
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..a628a3abdf 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -998,7 +998,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      create_fdt_flash(s, memmap);
>
>  update_bootargs:
> -    if (cmdline) {
> +    if (cmdline && *cmdline) {
>          qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
>      }
>  }
> --

Regards,
Bin

