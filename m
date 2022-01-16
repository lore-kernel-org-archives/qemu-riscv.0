Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8xBS-0000F5-G8
	for mharc-qemu-riscv@gnu.org; Sat, 15 Jan 2022 23:30:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8xBP-0000Eb-LS
 for qemu-riscv@nongnu.org; Sat, 15 Jan 2022 23:30:25 -0500
Received: from [2a00:1450:4864:20::333] (port=40851
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8xBC-0001xb-6o
 for qemu-riscv@nongnu.org; Sat, 15 Jan 2022 23:30:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so15951061wmo.5
 for <qemu-riscv@nongnu.org>; Sat, 15 Jan 2022 20:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67GYJjFvb45InGhRzz5uLi2aa7ADP/6KYTwdYb8jxVI=;
 b=N3pm5kwX7TZw18Z7xphhGd8JxR1N0Kmw7Dl/PNnGJQkjjY+89J47yU580o1DqgfQ1+
 XQV3GwJpTM3MB/bCbGTk90ZkEYK9u/ucL10zkU5LZVyIgTEC6Indse+7skiGl/9zetnR
 pQB1c/jjZeIGWIeJwhYGAYH1QhN4SISXpcZyylGlyQkfwDnjtJ9M9HS9UdEr28csnc5K
 6tesNerH3kcY7a8QckW4BaR2VAfWXRIP9x+zesF38tckWFFEisHvvPtu2gEAHju1BYO7
 Wcjvl5llVwX0CAX+2Uo5d5eAh3+wRM/K6ZsFJvUo2zQLcTOOWaV/C7WXSqTLLmzEE7O4
 AeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67GYJjFvb45InGhRzz5uLi2aa7ADP/6KYTwdYb8jxVI=;
 b=GAmJvCIcEV1hNtzK0r8vOmmKhT3tQoYN9TVhaIUPpJSaI71kCstivTKeSDY6e0GVXW
 C1X6YgVtxqZfsdY6YIEwpmIgY+gog++zxWvp9FVjQlxDAaAbkVHeT83Vt0gdyEJpz2bq
 1AQZPkp185cSg4lo+xx90GQpB577B6dmBvJr865gOxhMngSPoc8EDylCZpXEkzzb7eQo
 Vg5pNYql559ErFwNljM5MHpoOtGXr1Z/1Rx8mglLOXn49nz8I68vEaOfQwvcz9+L+8za
 VYXEHKPHi3CAD8uW/jpMXClnIg9WUyZLc1idyJ/WCbYZBLSKysEDlwfSoeyQnVH930Bu
 dTSQ==
X-Gm-Message-State: AOAM533wSLHmgNLcxntKy640tkJTYT3XAgjDyMbO7Uo5tL3bD5oL2ZD6
 3JSTgHbmTYh6J5Re4DRNiFbm0iB6JxDYcj5dRLAHSA==
X-Google-Smtp-Source: ABdhPJyQX9bCNk/Tjs3uoJMBH7z1Ozmw7zSLJ+0akJqikyzFkSmaldRWD6twzzQr0cjAICvmmdIAGNWvv9vndx+fMZM=
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr15651637wmj.59.1642307407833; 
 Sat, 15 Jan 2022 20:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20220116025925.29973-1-liweiwei@iscas.ac.cn>
 <20220116025925.29973-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220116025925.29973-3-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 16 Jan 2022 09:59:56 +0530
Message-ID: <CAAhSdy2sZRZ3r8Or_nQFXGzZOQbVaKsM_QLTCBdfgNNCoGC9Xw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] target/riscv: add support for svnapot extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 16 Jan 2022 04:30:25 -0000

On Sun, Jan 16, 2022 at 8:31 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add PTE_N bit
> - add PTE_N bit check for inner PTE
> - update address translation to support 64KiB continuous region (napot_bits = 4)
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  target/riscv/cpu.c        |  2 ++
>  target/riscv/cpu.h        |  1 +
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 22 +++++++++++++++++-----
>  4 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9bc25d3055..ff6c86c85b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -668,6 +668,8 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> +
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4d63086765..d3d17cde82 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -327,6 +327,7 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_svnapot;
>          bool ext_zfh;
>          bool ext_zfhmin;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 5a6d49aa64..bc23e3b523 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -486,6 +486,7 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_N               0x8000000000000000 /* NAPOT translation */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d84cde424d..832a2dd79c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,14 +619,17 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
>
> -        if (!(pte & PTE_V)) {
> +        RISCVCPU *cpu = env_archcpu(env);
> +        if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
> +            return TRANSLATE_FAIL;
> +        } else if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> -            if (pte & (PTE_D | PTE_A | PTE_U)) {
> +            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N)) {
>                  return TRANSLATE_FAIL;
>              }
>              base = ppn << PGSHIFT;
> @@ -702,8 +705,17 @@ restart:
>              /* for superpage mappings, make a fake leaf PTE for the TLB's
>                 benefit. */
>              target_ulong vpn = addr >> PGSHIFT;
> -            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
> -                        (addr & ~TARGET_PAGE_MASK);
> +
> +            int napot_bits = ((pte & PTE_N) ? (ctzl(ppn) + 1) : 0);
> +            if (((pte & PTE_N) && ((ppn == 0) || (i != (levels - 1)))) ||
> +                (napot_bits != 0 && napot_bits != 4)) {
> +                return TRANSLATE_FAIL;
> +            }
> +
> +            *physical = (((ppn & ~(((target_ulong)1 << napot_bits) - 1)) |
> +                          (vpn & (((target_ulong)1 << napot_bits) - 1)) |
> +                          (vpn & (((target_ulong)1 << ptshift) - 1))
> +                        ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>
>              /* set permissions on the TLB entry */
>              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> --
> 2.17.1
>

