Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhhmd-0004P3-Sl
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 21:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhhmc-0004Ld-87; Thu, 21 Apr 2022 21:08:26 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhhma-0000wy-Hx; Thu, 21 Apr 2022 21:08:25 -0400
Received: by mail-il1-x129.google.com with SMTP id y16so4142426ilc.7;
 Thu, 21 Apr 2022 18:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o6WrBiM1wvN5Bwn+GYhalN1wJsxp174U08AteiflAVY=;
 b=Kht520gR9yp1pqiRkKae//23BJvn8DTUGpEAJo8Y5oEQ8ht3WRZMKAbfHBzY75kniD
 EeQRTJ75dnRojMr+v/N5LaT+u8WKfsWqm8zUhBDBtG0nyElL5GSGJZ+RikVJdRWp6loI
 Pngm1e9/+HEjW9V+xDMKWAIGUMbZDWqfqn2x1uF2Wj/oHvQ8exS8H45k7F40BCklosMU
 n6XyRV/UNJVuJFs4SPgU75xlkcSOgzCCH8mYptslxROwxmIHbIzEuE5tGCk5tiotZN/6
 98nP/+2RoAQ7O/iqpaK/8IXcWPadqJ7QWRFxHE3+3Lj1xkX9i/vbTpEJjWKOQU/qedRP
 P86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o6WrBiM1wvN5Bwn+GYhalN1wJsxp174U08AteiflAVY=;
 b=T1LKuADeelw8KROuAiuJB0X39K1RzNKM9Vh/ntycBx/9rmNqFEKvGdCVEOxuZZOo2I
 cArs9jnzNnWlG+p8EcATQz1Nzl31cpKXMjj3hiCwj5stJPIlMQ7lqTfIKjozXueMJRnw
 whm0PsUdOtf97jqpjoQwImhaJpb3iwdPHstLQhxWA/ZWZPo8bNqTQNddiTIbDd+xGy17
 +WIysio/mX4cQDJ0DOzDO1xYkUfN8xHXU1xpZGJcgbkxlrsWphP+DxSu7/V+hCnYFUZB
 HAHauEspLRI6woh+kM6sKEixg6GbA60BHQWLmrqTIBd2BwYFwcUObaRMYAaqY+z3/vY7
 ewGQ==
X-Gm-Message-State: AOAM531BRxcs7A3ctK4/hc4W62ktL+YjmSAq+qWIyXQ9nefuDfOcjuj7
 clDmbMdZoChCZVRKrYh/kUenP50Nbj/pQKd8j+w=
X-Google-Smtp-Source: ABdhPJxfaSXiYrf7V1vPc0I40AufiMsCkNwmst17xf0LjzELTUxJAAK9IwiTTT+ec9aBnuDI8ATKg1H72EMD03TPk6c=
X-Received: by 2002:a92:cda4:0:b0:2cc:14ab:ceb7 with SMTP id
 g4-20020a92cda4000000b002cc14abceb7mr952916ild.55.1650589701979; Thu, 21 Apr
 2022 18:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220421055629.1177285-1-bmeng.cn@gmail.com>
 <20220421055629.1177285-2-bmeng.cn@gmail.com>
In-Reply-To: <20220421055629.1177285-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Apr 2022 11:07:56 +1000
Message-ID: <CAKmqyKO9Sp1HOsvAZjmRQNVztWeH8jnA0hN3BaszR=jF3Lacbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: Don't add empty bootargs to device tree
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Fri, 22 Apr 2022 01:08:26 -0000

On Thu, Apr 21, 2022 at 3:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> 2.25.1
>
>

