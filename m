Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296CCEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 01:01:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIfGT-0007sE-A3; Sun, 09 Jul 2023 21:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfGR-0007rd-Aa; Sun, 09 Jul 2023 21:00:31 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfGP-0006aF-Qz; Sun, 09 Jul 2023 21:00:31 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-47191280066so1088221e0c.2; 
 Sun, 09 Jul 2023 18:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688950828; x=1691542828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCvl53mZt1YlEmKIWcisZI2/WxRRdYo6CtFITNYzZJ8=;
 b=TL5lHUzMSQgkvH+dpcwX7XQXNW3dBBR2HDEcQjd8D0ucryYE513Ac5CUsDy7LbgGlg
 eo3eNwuWizbgQfedMya0Q5g5bC9mC1qqpw4h6bFNSkmCK1P0W+COdFv0F+VIWfzTIGn0
 Ugif8OrFPKsx60KTn1nIP9kULRCtEu+D5Z2sW3hCi2R5ourdvCJJww+YuFATZxmxynix
 BJFkh3cQJF9onzbf27QQo6jhlkTQr0pY/Ee3oPlWoObWAmuniCi3tafqFP8HFiSwnE2F
 xf0ZoQaEfV8HZHBQYlU9UjdQ5Z7QGMeTY2s5dQRnqke0ce/vaR9yoWyUxj60lF7go6q3
 c8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688950828; x=1691542828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCvl53mZt1YlEmKIWcisZI2/WxRRdYo6CtFITNYzZJ8=;
 b=k5t13ZD+y31V/fl/WoVjZLAaBXdn9Z6N3rZlek+1Bm/96dDrbkvKc2IDkF5XU01edx
 vzSJlG8wOtTGjb5vp/8BH16TRhEd247B1QtlJ7Fy5zJktjkj+RD9oCplVYydCWzsiL51
 Ux56GMBI08x3qZPnhZil1iNsZHRqk5a5D06G/cSIvj0QGp41RpGJWvOfPt65IYzMVM49
 uskWc2UBwPTvtuUceI0/7gbnqomzdDmwGKaJGOv4NUrdVATvBc88gx3o3hPG3uWUG4uV
 7p5DH7VH6cHVHbdKpRay5hnW5j2Q+dunUtIf4Nf5p5lOZ06VQPxD0Xsvss4AhvcwoyqT
 MPfw==
X-Gm-Message-State: ABy/qLYUuXWgfo08B/de1O+mspk5ITGOk0pnytcjJ+3ZZjXDfh0ABzyh
 ZO7GYVPP0Ygeov7nudisbtt+PZ8LcUWci4KerRg=
X-Google-Smtp-Source: APBJJlG4MGPe2c7TG12VkLkm0ynTC7zY2cvu+Qa+EmUT+RSSBIB578DRANV8zfJSr2x5K3t7+QPFJQFIxEw2w1jPnUc=
X-Received: by 2002:a67:fd91:0:b0:445:23e7:767f with SMTP id
 k17-20020a67fd91000000b0044523e7767fmr4052221vsq.28.1688950828292; Sun, 09
 Jul 2023 18:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230706035937.1870483-1-linux@roeck-us.net>
In-Reply-To: <20230706035937.1870483-1-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 11:00:02 +1000
Message-ID: <CAKmqyKMFOHd3+YgyUfZBzv+bycWdEq8ckGmN_FOBNeki-eaAeQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Generate devicetree only after machine
 initialization is complete
To: Guenter Roeck <linux@roeck-us.net>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jul 6, 2023 at 1:59=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> If the devicetree is created before machine initialization is complete,
> it misses dynamic devices. Specifically, the tpm device is not added
> to the devicetree file and is therefore not instantiated in Linux.
> Load/create devicetree in virt_machine_done() to solve the problem.
>
> Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Cc: Alistair Francis <alistair23@gmail.com>
> Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.c>
> Fixes: 325b7c4e75 hw/riscv: Enable TPM backends
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Handle devicetree (load & create) entirely in machine_done function.
>
>  hw/riscv/virt.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ed4c27487e..1c4bd823df 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1248,6 +1248,17 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>      uint64_t kernel_entry =3D 0;
>      BlockBackend *pflash_blk0;
>
> +    /* load/create device tree */
> +    if (machine->dtb) {
> +        machine->fdt =3D load_device_tree(machine->dtb, &s->fdt_size);
> +        if (!machine->fdt) {
> +            error_report("load_device_tree() failed");
> +            exit(1);
> +        }
> +    } else {
> +        create_fdt(s, memmap);
> +    }
> +
>      /*
>       * Only direct boot kernel is currently supported for KVM VM,
>       * so the "-bios" parameter is not supported when KVM is enabled.
> @@ -1508,17 +1519,6 @@ static void virt_machine_init(MachineState *machin=
e)
>      }
>      virt_flash_map(s, system_memory);
>
> -    /* load/create device tree */
> -    if (machine->dtb) {
> -        machine->fdt =3D load_device_tree(machine->dtb, &s->fdt_size);
> -        if (!machine->fdt) {
> -            error_report("load_device_tree() failed");
> -            exit(1);
> -        }
> -    } else {
> -        create_fdt(s, memmap);
> -    }
> -
>      s->machine_done.notify =3D virt_machine_done;
>      qemu_add_machine_init_done_notifier(&s->machine_done);
>  }
> --
> 2.39.2
>

