Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxYrX-00017A-1J
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jan 2021 12:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxYrU-00011c-FI; Thu, 07 Jan 2021 12:14:12 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxYrS-0001uR-Nt; Thu, 07 Jan 2021 12:14:12 -0500
Received: by mail-il1-x12a.google.com with SMTP id n9so7464416ili.0;
 Thu, 07 Jan 2021 09:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CsY937zNikLFI8/eQaFn4+ntRoKacSOmhDOC4WYtSJY=;
 b=jv4lrxA5iwPlf9hlKYAXNsgpUsc+6v7sG44hB8C+KVikv1buv3p69sRJYAK907uIA3
 YSTFIdmFr648FIYkVMm/IXBW9VbQmBNlX7mfmhBn/TdiVi9OUFD977f2wQ4VkatrXvh3
 d9okSflqMbfoUR/j7IaLLIF7OM6sso5M7IQAXYWnWDnmhvoEAk4tozygMDH/RzuL6GOM
 cTNss/0lhKO6kMAuQsKIW1ZmUiOHkocR1iFo11j5ls8mz9LyXqFHa6R3QAPd6CZsGeq4
 9VnUCtw5acDGtFqUVza6kGR+tfbxb7dbOPWeMXrTc9Vk01WTzoLF3l04sqD1zIICuiwN
 87yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CsY937zNikLFI8/eQaFn4+ntRoKacSOmhDOC4WYtSJY=;
 b=BFm8Q5Tp5uGTdQWk2nXSQOolZqo0PE+EOYe1cSbUOVLKCXSMkWDMyv4+30bCgs61ax
 +mXn0ku3xWS3IsD+XhGcJcbHInL2iGtN6Toc/glpJDF0rUOI5hr+4jszgaMK4+kyFfxK
 ao7zZrIqlDamJUU7JrqsRGdDKWqRR+oxuwFVusCaZZhZzcpCxixHOvBA4CjQ6UWleuM7
 yJCJFYjWMVKwBK7IsMVFzu8MK5ItELLONxcJeELLjd5bFBT9N3XDSKp3Jyf7g9kKhHtw
 kMnZGb/X4hkgjScL7ueRpENSC4NYB2mEx7F8HBN0V4I5ZZqVBpF5x+MhpLFoIgj7uGEe
 x4Mw==
X-Gm-Message-State: AOAM530cwPbXmB/G1IdTKIk5cNEvDw6W+iNF4TYTwaH76MKozqbL7wuz
 rxCt7QSN+6XcSDYSeWiXgnXhVBgp6NuQ4NDWiLc=
X-Google-Smtp-Source: ABdhPJzV99gxITny2DN2PNx8OYDV8tHIs7Bs8ILIJstyEn/WiPH7d5bvFA5HjLrPdzxutlHyTL8+jZl9QEWR4IM7HJ0=
X-Received: by 2002:a05:6e02:ca5:: with SMTP id 5mr9909621ilg.40.1610039649317; 
 Thu, 07 Jan 2021 09:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20210107091127.3407870-1-atish.patra@wdc.com>
In-Reply-To: <20210107091127.3407870-1-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Jan 2021 09:13:42 -0800
Message-ID: <CAKmqyKPKDx9oW0k_TEPHVtBGW+9-BvWzaq19ug+jgsBOG9LT_g@mail.gmail.com>
Subject: Re: [v2 PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jan 2021 17:14:13 -0000

On Thu, Jan 7, 2021 at 1:11 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
> lesser. However, Linux kernel can address only 1GB of memory for RV32.
> Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
> As a result, it can not process DT and panic if opensbi dynamic firmware
> is used. While at it, place the DTB further away to avoid in memory placement
> issues in future.
>
> Fix this by placing the DTB at 16MB from 3GB or end of DRAM whichever is lower.
>
> Fixes: 66b1205bc5ab ("RISC-V: Copy the fdt in dram instead of ROM")
>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Tested-by: Bin Meng <bin.meng@windriver.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes from v2->v1
> 1. Added the fixes tag and updated aligned down address to 16MB.
> ---
>  hw/riscv/boot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index d62f3dc7581e..2ed23c7e9849 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -202,11 +202,11 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>      /*
>       * We should put fdt as far as possible to avoid kernel/initrd overwriting
>       * its content. But it should be addressable by 32 bit system as well.
> -     * Thus, put it at an aligned address that less than fdt size from end of
> -     * dram or 4GB whichever is lesser.
> +     * Thus, put it at an 16MB aligned address that less than fdt size from the
> +     * end of dram or 3GB whichever is lesser.
>       */
> -    temp = MIN(dram_end, 4096 * MiB);
> -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> +    temp = MIN(dram_end, 3072 * MiB);
> +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
>
>      fdt_pack(fdt);
>      /* copy in the device tree */
> --
> 2.25.1
>
>

