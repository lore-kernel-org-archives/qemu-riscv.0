Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEjtI-0008KH-Uy
	for mharc-qemu-riscv@gnu.org; Mon, 31 Jan 2022 22:31:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjtG-0008K3-TG; Mon, 31 Jan 2022 22:31:34 -0500
Received: from [2607:f8b0:4864:20::d35] (port=36847
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjtE-0008Dp-Ss; Mon, 31 Jan 2022 22:31:34 -0500
Received: by mail-io1-xd35.google.com with SMTP id h7so19590662iof.3;
 Mon, 31 Jan 2022 19:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V0QSVD8ojTAjvmDylhl+15sXSkNe5SD/D1FU/s/Zqpc=;
 b=mVocFcybaQscQBnpRgIZvo7gWiT+XVDVL0G9xAZrT6qNn015t2Ffl90oRjMi1umP6l
 j+KoPpJ0Ge3uIix4I9j/Px0bjGbk/Gd/yUxSraHf+Z7kZWsumT9I1JlH0ItCb7UJ9QP7
 adC9A33gsXwdcyjTEzpf7JLZzdUDWJbTwr6P9Kf2WTMKKgdSxI51vHvcyjc3eOVn/pzr
 gM/Va8FYuzqWctBs4Boc3qIu3xCcBU4RyB/TFxCXO6u7J49t56qXqjHlVHjnd41dh4CO
 eMwnOygThtkqbavE99AwuyZQ0E/jydl9vBriKb3jc6p2m1CJYZDashkGUUz1L1Y9lb0Y
 cpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V0QSVD8ojTAjvmDylhl+15sXSkNe5SD/D1FU/s/Zqpc=;
 b=i+3FkE1t23VF7lm/7rSYcfcy4dDB6pM3oLe0/5NRBQg30iy/LLHNVNnGnDFUsI3ud7
 igEQQtKQG8x+9NhYq+rI3rwdoDPHoPA2nOHPuec079vZ/yzjNE7spTNahldnI/BlSNph
 hx2lGqnl0khIUArzYdH2quetp67WJhUC7QQ62byZFI1s+nbXqBqYm4IzYi13t4O0HoyS
 KlnnbSiV3J1OtgjPAuhxABI+Y7eLYSlPsJ2DsPYZNLAgHW1DWpX2VZu18DS5XsO0v9Px
 1I366E4EYhBGZpbHxm4jXMhQn+T8B5Xc1cXCcl1mnA6GMC/by/GVYQXpVPfrm75+83vX
 jCCQ==
X-Gm-Message-State: AOAM532zt6WPG2L7vcGvO5e9A3eQbHFkUyTLDHIhIps8NnNW1a8bwsXi
 fLIBfVXwthmxNiIxEq9xsHJd2kczhNP1Q3keg9k=
X-Google-Smtp-Source: ABdhPJw2yudJL169kP1FrtvQp6ZfBx2zVbifCnnhYaLDSEatLPTZVbx5x9qUWNrfiiJJBAeh1BHKpUGTV/15FPQdMjg=
X-Received: by 2002:a6b:4406:: with SMTP id r6mr12473923ioa.57.1643686291591; 
 Mon, 31 Jan 2022 19:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20220128085501.8014-1-liweiwei@iscas.ac.cn>
 <20220128085501.8014-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220128085501.8014-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 13:31:05 +1000
Message-ID: <CAKmqyKO4KS-=1mENTOAOMJ4soo+cWoMVVzCMn=AuuS_PPWijfg@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Feb 2022 03:31:35 -0000

On Fri, Jan 28, 2022 at 7:11 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> From: Guo Ren <ren_guo@c-sky.com>
>
> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> need to ignore them. They cannot be a part of ppn.
>
> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>
> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> Cc: Bin Meng <bmeng.cn@gmail.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        | 15 +++++++++++++++
>  target/riscv/cpu_bits.h   |  3 +++
>  target/riscv/cpu_helper.c | 14 +++++++++++++-
>  3 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 55635d68d5..336fe8e3d5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -341,6 +341,8 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_svnapot;
> +        bool ext_svpbmt;
>          bool ext_zfh;
>          bool ext_zfhmin;
>          bool ext_zve32f;

Hello, thanks for the patches.

This looks good, but you might need to rebase it as there are patches
on list that move this into a different struct.

> @@ -495,6 +497,19 @@ static inline int riscv_cpu_xlen(CPURISCVState *env)
>      return 16 << env->xl;
>  }
>
> +#ifdef TARGET_RISCV32
> +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
> +#else
> +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return env->misa_mxl;
> +#else
> +    return get_field(env->mstatus, MSTATUS64_SXL);
> +#endif
> +}
> +#endif
> +
>  /*
>   * Encode LMUL to lmul as follows:
>   *     LMUL    vlmul    lmul
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7c87433645..6ea3944423 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -493,6 +493,9 @@ typedef enum {
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
>
> +/* Page table PPN mask */
> +#define PTE_PPN_MASK        0x3FFFFFFFFFFC00ULL
> +
>  /* Leaf page shift amount */
>  #define PGSHIFT             12
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 327a2c4f1d..5a1c0e239e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -622,7 +622,19 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> +        hwaddr ppn;
> +        RISCVCPU *cpu = env_archcpu(env);

I know there is existing code in this function that does this, but
please don't initiate variables mid function. Can you move this to the
top of the function?

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +
> +        if (riscv_cpu_sxl(env) == MXL_RV32) {
> +            ppn = pte >> PTE_PPN_SHIFT;
> +        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
> +            ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> +        } else {
> +            ppn = pte >> PTE_PPN_SHIFT;
> +            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
> +                return TRANSLATE_FAIL;
> +            }
> +        }
>
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
> --
> 2.17.1
>
>

