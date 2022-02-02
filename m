Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFO5E-00063D-MS
	for mharc-qemu-riscv@gnu.org; Wed, 02 Feb 2022 17:26:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFO5D-0005zR-3Z; Wed, 02 Feb 2022 17:26:35 -0500
Received: from [2607:f8b0:4864:20::12c] (port=43746
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFO55-0002xH-RR; Wed, 02 Feb 2022 17:26:30 -0500
Received: by mail-il1-x12c.google.com with SMTP id d3so579225ilr.10;
 Wed, 02 Feb 2022 14:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d59NW68X7p/w5KkKVH+M/3fV0X4MobPPYVl4bxV2RUk=;
 b=N+7zSsGszQrS4k8jgdUDaaZXigyzxWL3MuT8rmQckgFRgFdUiNTXuE1+CR1sRS1R+6
 gMPQ4+9ez2OIa8uEZIHPekhJrx2AW0ZgdaFa9XRDMBFLhHPLn0HYLxQ0RPbOkl7HS7kn
 TDIohxhm23HZoqTEtG+t/Oj1jg8JsgQP1tuOavOc5zggmW7PtcRhaz4nSluMG03NXFOK
 6SgkxgQtawbNIbGaYxlOt65hhKYVFrgPJu+CD1fjXZvTsv81g3JdW+ke5qPTF/3u0I8s
 tlf0CBvPWtNn9sTE07Iuq+wBIiGFhBYv1GBiyC8Zt1ke4bFoE7ipmzWtpbRANQWa9JCd
 qxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d59NW68X7p/w5KkKVH+M/3fV0X4MobPPYVl4bxV2RUk=;
 b=SPY19kGzUYfQGSfMrZyoFhNAV/dQBztf9ycuFUZpjRkjmdNnMLa9Hn1g/Ei24ocU72
 ebZ7pWR37nUwevB6xr5lf8PyP1O+5r74romc77H5K4pT4M+tZo9nQWpTKKCe7txcTAH3
 ayLIIorxLZzWtLW29+i7D2YAPIGfGyQBUWFzgL8sGFx35N4vonIOGLYnkd0wv1Me8+rv
 Vhj6gJJ4ebiQFdwVtXCjrCGSP08l98bTcdMyOcUM7ogyaxAgg1c1Pb5TfKZmXE3Umj3u
 ywBkPVhSspsOQZgr3QyjWfe7IEv+slNG7BU/zh5MNyCbyeFSwDik1II510pKkdeX2n8W
 wQ2Q==
X-Gm-Message-State: AOAM532OE4SULo+0a9LRF1FJRl7dhxNm2QuQNFagLzbqeqwM9gDSqFsd
 +AmOiwM5cBchrFLWU6jz6gFN+GIpr0UxjU4SGUA=
X-Google-Smtp-Source: ABdhPJyG3qeLIvI0Zmh1HMwPaTB/89V52SE/yQhaZHdA9D3HZZzlFzP5cxtqbfkcM2wgO8huAmC8vviI5AIo1fGbMWg=
X-Received: by 2002:a05:6e02:1307:: with SMTP id
 g7mr7887018ilr.46.1643840781109; 
 Wed, 02 Feb 2022 14:26:21 -0800 (PST)
MIME-Version: 1.0
References: <20220201142415.29980-1-liweiwei@iscas.ac.cn>
 <20220201142415.29980-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20220201142415.29980-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Feb 2022 08:25:54 +1000
Message-ID: <CAKmqyKNp-D5ijraM+-r7ZU3eYzZ7Wf_kViAjc_7GW=RUp28V-Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] target/riscv: add support for svnapot extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Wed, 02 Feb 2022 22:26:35 -0000

On Wed, Feb 2, 2022 at 3:24 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add PTE_N bit
> - add PTE_N bit check for inner PTE
> - update address translation to support 64KiB continuous region (napot_bits = 4)
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  target/riscv/cpu.c        |  2 ++
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 18 +++++++++++++++---
>  3 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6df07b8289..cfaccdfc72 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -729,6 +729,8 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> +
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 6ea3944423..7abe9607ff 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -489,6 +489,7 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_N               0x8000000000000000ULL /* NAPOT translation */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 61c3a9a4ad..77b263c37e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -456,6 +456,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>      bool use_background = false;
>      hwaddr ppn;
>      RISCVCPU *cpu = env_archcpu(env);
> +    int napot_bits = 0;
> +    target_ulong napot_mask;
>
>      /*
>       * Check if we should use the background registers for the two
> @@ -640,7 +642,7 @@ restart:
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> -            if (pte & (PTE_D | PTE_A | PTE_U)) {
> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {

You shouldn't need this cast

>                  return TRANSLATE_FAIL;
>              }
>              base = ppn << PGSHIFT;
> @@ -716,8 +718,18 @@ restart:
>              /* for superpage mappings, make a fake leaf PTE for the TLB's
>                 benefit. */
>              target_ulong vpn = addr >> PGSHIFT;
> -            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
> -                        (addr & ~TARGET_PAGE_MASK);
> +
> +            if (cpu->cfg.ext_svnapot && (pte & (target_ulong)PTE_N)) {

Same here

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +                napot_bits = ctzl(ppn) + 1;
> +                if ((i != (levels - 1)) || (napot_bits != 4)) {
> +                    return TRANSLATE_FAIL;
> +                }
> +            }
> +
> +            napot_mask = (1 << napot_bits) - 1;
> +            *physical = (((ppn & ~napot_mask) | (vpn & napot_mask) |
> +                          (vpn & (((target_ulong)1 << ptshift) - 1))
> +                         ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>
>              /* set permissions on the TLB entry */
>              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> --
> 2.17.1
>
>

