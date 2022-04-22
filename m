Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni2Jt-0002Pc-H0
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 19:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni2Js-0002PQ-EQ; Fri, 22 Apr 2022 19:04:08 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni2Jl-0001jS-Bg; Fri, 22 Apr 2022 19:04:02 -0400
Received: by mail-io1-xd30.google.com with SMTP id c125so10097032iof.9;
 Fri, 22 Apr 2022 16:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CCIWU3bBn/dtAiKJ8DuH4biuB0J0cPEXMVE8azYGF0E=;
 b=mE6xsf7vgvd2aVP1z2ObpqXxdIsRnf/ImtMjEa0tjupFljUFMxvO0zWhfh3HteM+TO
 Awn8Y97SQ4V516gcLyIfrWNvqEF0OI+TCZQ5XiCoRXLuUWszQHwtrtpilIct8v3xSSiN
 2ndBt28rNicC2mP9AAQqCFKyCN/9dGABJ2bb5Qpp67rkhbcQy/gELe1Ly7LJU6umZd0S
 IH1lQfXA7Y0VISI6vNndOWpFx1A4ROYLf2FjV3KnbILYZj9pxBPhrhOxygaS6ahQkR1R
 peGosf/Aoyi5DqMOK/z4ZpcmThl5+FcVaAnhU351uJYW6T4mfCPahyihuvK9XH1adqjz
 uTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CCIWU3bBn/dtAiKJ8DuH4biuB0J0cPEXMVE8azYGF0E=;
 b=IRDOq7lMR53LRBdh5SALpQBDHmklpMA+XA9xvPfFKBrtLf/LPnH9edvNCf9E8GPN/A
 NjJjkgJ46PoRGoOgCeDON+kimqNVRW0N9jjr5g1/FTHHiJRQOTnlBI0asbMYJW6zPks5
 8KDcnQ7d5FRlEkB539YHhS1aTT10HkicnHn9Sq5Rt3b2kgDLgPi7nq9HsDToD1PxVadc
 DCluFY6vz8cWRAtbIeZ5L8aqznG1GOcORSJsRW5Vay21V/1ZKhyy5E45sq3ZDjHWZh2t
 PiXPlKNbuxOjHKFrws5tmg9o7/DD5YYqOKoBzvpJ7D2I/nHupCsViBuR3dFsz4gkUoZg
 Nraw==
X-Gm-Message-State: AOAM533A56syNIQdr52Wsq65GkuH22FRejS8aa61Hjw7lYUwGP38ii6Z
 DCqL03ePZVHr+Vh3nGMMXGrDawlKLZ2G60UN0xYPKBeocUSetshx
X-Google-Smtp-Source: ABdhPJxYHCtIg+tH2rXd0o6Rtk2uBC7zusVsRPHltrUUJUSxx2qIruwXMBrJPHDVBajOYD6CB+naywWV3AyF7QHKWxs=
X-Received: by 2002:a05:6638:3724:b0:32a:ab86:3f9 with SMTP id
 k36-20020a056638372400b0032aab8603f9mr3258461jav.267.1650668639869; Fri, 22
 Apr 2022 16:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220421055629.1177285-1-bmeng.cn@gmail.com>
 <20220421055629.1177285-2-bmeng.cn@gmail.com>
In-Reply-To: <20220421055629.1177285-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 23 Apr 2022 09:03:33 +1000
Message-ID: <CAKmqyKPgrutUF8+uD0fW7xv=2pWBAvTs4hnp7NsLxPuW4t+uaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: Don't add empty bootargs to device tree
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Fri, 22 Apr 2022 23:04:08 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

