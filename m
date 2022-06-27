Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5y5m-0006i7-6i
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 19:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5y5l-0006gc-2l; Mon, 27 Jun 2022 19:24:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5y5j-0005Ma-Dg; Mon, 27 Jun 2022 19:24:28 -0400
Received: by mail-pl1-x62b.google.com with SMTP id k14so9528660plh.4;
 Mon, 27 Jun 2022 16:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l0YpxGFZJMAMogybF7xqgDnL4HPwkkrDPNVjgXkpUoY=;
 b=DHUWZZs4W2fOIdeDiKIyykX2qMr+iJrRApKyqk9WUtr4qPH1SBlnDMrwRU2BVNBHFZ
 FDkDr0q6s03RjQ6e43zRuLtY1H5t/CQ0yVxEi9XOnzrw2xjHL6DLPw+/RifFD7RYYYSD
 SBD9QX+EzyVszu6uj+jXjMPgxwbCFDpSK+5+41OTIsCpRsAtTU5vLnjaaDJzJzlNZlCU
 Q7XJXFcsywYIE+g4M8eBKErH333h0TLA+PoFe8o5lG9IPGgYvgB9ox4Mx4euWhnV7kQr
 qdvCuzINrZFv7D0ol2gXNr2tyye3bRLRFRrl929zFVkrZN+EWzyHsk0DAIxyiT0ONgpt
 JTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l0YpxGFZJMAMogybF7xqgDnL4HPwkkrDPNVjgXkpUoY=;
 b=PbSkRlDPVzgGnjlIth0XSGERcQdIkpTjDuM/ls1/NYjuz/FHEScvj7CFPgKPeamTdm
 /h4zQmT+KVQf5sAYfNNKOpqdBBqDw27xFCjNBEJVOTbxWkxb5g+MgBbW4QgIMGkaVmgb
 f6C3bYP6LWf6zoVzEnWjjxZTX96xGzOcTgxCQtveuQHYp9tlPQm9Dgnn3/QueJXzgXdI
 Js2RlJCadH/82sNMlzgiixEq8HDRXwoZYvy9c2mk71zhrVcy+k0PtuFdr1Tp7oj9S8ZC
 pbQGcZR1GibA4CVJN7Hiz9Vgy5QFhNNFfELmompX3xgkZvbC6Pzv5zxjumUgpoc4Fqcc
 ypLA==
X-Gm-Message-State: AJIora/sdlRNLBOmBEn56jkZN1GYC2MgKKufd1O1IaSTILkNdMp0s69X
 U66lWypHvYoWWwxcspfmNf12Y2JIpm8kMzAeBx8=
X-Google-Smtp-Source: AGRyM1vblD/FYf45nDUqiffvgSRC4+bQgyijXWbHtTbivMwPVuCvkE03IJzoxu5GDi2WeTsAtsMuWHZIybeBYXmRkhM=
X-Received: by 2002:a17:902:bc4c:b0:16a:4849:ddbe with SMTP id
 t12-20020a170902bc4c00b0016a4849ddbemr1738641plz.25.1656372263612; Mon, 27
 Jun 2022 16:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Jun 2022 09:23:57 +1000
Message-ID: <CAKmqyKP8Wq=qLe6fTFJ3-aV1daRq-DPib2sX9jnpH6uAPO-K1g@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Mon, 27 Jun 2022 23:24:29 -0000

On Wed, Jun 8, 2022 at 4:20 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> We previously stored the device tree at a 16MB alignment from the end of
> memory (or 3GB). This means we need at least 16MB of memory to be able
> to do this. We don't actually need the FDT to be 16MB aligned, so let's
> drop it down to 2MB so that we can support systems with less memory,
> while also allowing FDT size expansion.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 57a41df8e9..e476d8f491 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -226,11 +226,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>      /*
>       * We should put fdt as far as possible to avoid kernel/initrd overwriting
>       * its content. But it should be addressable by 32 bit system as well.
> -     * Thus, put it at an 16MB aligned address that less than fdt size from the
> +     * Thus, put it at an 2MB aligned address that less than fdt size from the
>       * end of dram or 3GB whichever is lesser.
>       */
>      temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
> +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>
>      ret = fdt_pack(fdt);
>      /* Should only fail if we've built a corrupted tree */
> --
> 2.36.1
>

