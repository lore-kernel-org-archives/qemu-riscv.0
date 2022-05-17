Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqpUT-0006Fa-Dl
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 01:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqpUR-0006FF-A5; Tue, 17 May 2022 01:11:23 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:37839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqpUN-00027b-V2; Tue, 17 May 2022 01:11:21 -0400
Received: by mail-il1-x130.google.com with SMTP id b11so7977308ilr.4;
 Mon, 16 May 2022 22:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZFTQvbetuWmYEJUeSWZwOVPRghVvSd1OOQDdPcub4E=;
 b=RgIy0pghNYTPUw6cd2zu0WAi1oqfB3KfJrGvNizh4p6FimjoSYyE4vHNMZHAAjeBz1
 MOL7hNrRuaLhNdF15FRY+CPckETU+REF6X6WEtPh9xQuRz2cBWElmjApN9hnFTY6aGFk
 3iJcDAJpdKkG+GpguabRuLG5hJdPQ4XCnSUcwNM6V31Hrsk6vT0kVCH2S57+ZE2F2cYM
 myWf5X0+Ov4bGIdHhJnkkld2xzx8/E8+n+bu/OELqlSaqOwQn7KPyVnFlsvwcuK7fZ1w
 PbYU47PYT+Q8vbobMaBq7wAMbrpL1cQXLLHBNhaCEWeO9XVLWi0DUOIsGHdrZOd0bDCC
 DVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZFTQvbetuWmYEJUeSWZwOVPRghVvSd1OOQDdPcub4E=;
 b=KnuXeZCclbax/c2/ihu2/pERO1EkuVLfZidfBC4zxzcjducMC4/W32QRL2Hkuik78v
 5s/qI5M44KL9nvweD96+cI4AISgu/CRjfZpMxY84GODcHhSeaqVtr9DPBtK6/AVBL9Uz
 PB8yYVc9LezVlGeAcIDRviv1QauDEenaLp135O3Cm/jLXPn+PUJwa2v1EXFqTBUiUihS
 DjbCuEooM3UyBG0UfdKcTp8Swe+ETckMFV/O162SwSr9v/CICvf5ukcRnExHZVzKHNn2
 UrUIzLS2EgsRSmW4xv6IK1XG/BmMJBcyo+LrJ+Lloh+LP4kwBzaKny3gJrJPQCZdg3Nz
 eGjw==
X-Gm-Message-State: AOAM530xcwPhwZGrxEKF4kwlrUUvtqJfe/6YqXdqIGRGNZF6Rz6rdh1T
 fM/iM/erVC6++wkWdn1FrDfc0AsxTC8MUcYFnq8=
X-Google-Smtp-Source: ABdhPJzaZ/S/v1IyT2hc+iWSGcNw2RAjhNeM7rU5sUZKPWEwNZLSt8uIzz6ZchQ7pKu45NAcJv+gK/koBONG1eNCXlk=
X-Received: by 2002:a05:6e02:188f:b0:2d1:58f:41a6 with SMTP id
 o15-20020a056e02188f00b002d1058f41a6mr8062377ilu.86.1652764278287; Mon, 16
 May 2022 22:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220512182103.408627-1-dgreid@rivosinc.com>
In-Reply-To: <20220512182103.408627-1-dgreid@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 15:10:52 +1000
Message-ID: <CAKmqyKP0yxJ7TbRHUGKZdND7_qDyLSe5zBiw3ON5i1iLa0qwDQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Avoid double FDT platform node
To: Dylan Reid <dylan@rivosinc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Dylan Reid <dgreid@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Tue, 17 May 2022 05:11:23 -0000

On Fri, May 13, 2022 at 5:12 AM Dylan Reid <dylan@rivosinc.com> wrote:
>
> When starting the virt machine with `-machine virt,aia=aplic-imsic`,
> both the imsic and aplic init code will add platform fdt nodes by
> calling `platform_bus_add_all_fdt_nodes`. This leads to an error at
> startup:
> ```
> qemu_fdt_add_subnode: Failed to create subnode /platform@4000000: FDT_ERR_EXISTS
> ```
>
> The call from `create_fdt_imsic` is not needed as an imsic is currently
> always combined with an aplic that will create the nodes.
>
> Fixes: 3029fab64309 ("hw/riscv: virt: Add support for generating platform FDT entries")
> Signed-off-by: Dylan Reid <dgreid@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/virt.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3326f4db96..d625f776a6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -561,11 +561,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>      }
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
>
> -    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
> -                                   memmap[VIRT_PLATFORM_BUS].base,
> -                                   memmap[VIRT_PLATFORM_BUS].size,
> -                                   VIRT_PLATFORM_BUS_IRQ);
> -
>      g_free(imsic_name);
>
>      /* S-level IMSIC node */
> --
> 2.30.2
>
>

