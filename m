Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C283EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 01:03:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIfJ6-00018x-48; Sun, 09 Jul 2023 21:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfJ4-00018S-0e; Sun, 09 Jul 2023 21:03:14 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfJ2-00070c-ER; Sun, 09 Jul 2023 21:03:13 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4718ddce780so1267226e0c.1; 
 Sun, 09 Jul 2023 18:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688950990; x=1691542990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQ8VGyo7rbevvz9o+xjc4ARJjjyoIa4GgjpLc1rXlI0=;
 b=DLHpS6duPyTRhuSt84OOQ0jEEeN3MdzbIcsyoa7bFJ4a7PIyNgkfaF0JfI4r0r4o/T
 iVlQZLR99wa0AiRyQzH79O3434i2e/zptMAi76bKwhWHEkoXxhbcugAtZjMKaUWdvG/C
 H2uW+8XzwWz39oX96SVkufFRR9JahKagvQPD7aO+zB7mGH7aiqoUlmRBrUKxnhRDrxnp
 NaCLFZUVCpzRCti1nloeA0M6R7XSLNmVHzD/JwSTfc89XK6XS0XCln1ZdMWpj22QhjfU
 x+P8Z8kaJ+7Hvgq4/WW2wiG4xSbktEqfQNmKg0zLiOGx0JPJ4ZLJrFuTjjSIZIX42WUQ
 a1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688950990; x=1691542990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQ8VGyo7rbevvz9o+xjc4ARJjjyoIa4GgjpLc1rXlI0=;
 b=ekufiM0JCzYgcORnDSntooRGHnB/3FuBtEYZ5eXrxZMOgOrtVdjuNgf3/7ArGHz/fb
 QaicJwj2+ERDWWiiA9QNiOxLBNqReddBNeewnWwUZihM8up2zxR9SPPtm93YHvR+aUeQ
 52SIhLdD+LCIwSGx9mjfBeKMgeD9DrFSsCaYEVLXl2YwpXOzUouTqjnryqiQNQNJir+z
 g5oHGHYIyZVX5WD1sDvYEvLjLbFaTfI9c3wWHA6SAnhWAQesK+mDHxmVQRCwkwVMnjF2
 K+4x7sjavlGfqN9h45n8qqtLxMVBCkj0OwDb245IQ+YN4eMlLXxRXBz3vOBFkZOsSMu0
 TlPw==
X-Gm-Message-State: ABy/qLYTqPF/EX7f1Lc9rAq0i4QfxQxAJOG7SFcMrY/FeGLlNLeqhRUh
 73t+eBcvVTxKNmP5zCUXI/QkofNTGSHWLT/hxB8=
X-Google-Smtp-Source: APBJJlHzZwx171MPKNw75GE7NyNuV4O9ptOnQ41dKELOSbXGwK9rQx8try1LDHqVrf+9XgxMkEUPyj9vLT9vTj0Uzl4=
X-Received: by 2002:a1f:d0c2:0:b0:471:b3f3:9bf9 with SMTP id
 h185-20020a1fd0c2000000b00471b3f39bf9mr5188349vkg.6.1688950990266; Sun, 09
 Jul 2023 18:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230706035937.1870483-1-linux@roeck-us.net>
In-Reply-To: <20230706035937.1870483-1-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 11:02:44 +1000
Message-ID: <CAKmqyKNTywcdGAxfbh4UvPL_ZHYkw77ns-yGS-fBMWVWAavwBw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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

Thanks!

Applied to riscv-to-apply.next

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

