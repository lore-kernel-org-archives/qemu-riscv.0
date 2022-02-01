Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEmZA-0001Cl-Ji
	for mharc-qemu-riscv@gnu.org; Tue, 01 Feb 2022 01:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEmZ8-0001Bu-Td; Tue, 01 Feb 2022 01:22:58 -0500
Received: from [2607:f8b0:4864:20::12b] (port=44631
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEmZ7-0005tr-Af; Tue, 01 Feb 2022 01:22:58 -0500
Received: by mail-il1-x12b.google.com with SMTP id q11so5263341ild.11;
 Mon, 31 Jan 2022 22:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aa4ZdSlgRZ8MhLbGVS9JTsBuvPwZ0tX7KIRYiE7d8JI=;
 b=hO5EM8hAyjTtmJRri57jwpXjgfMfaDCLfMDLeeu/qK25ETFPr3QuchCIMZ8wNcdy87
 3pyt9kg5YE7expeP6MbBIcLr00fyrAUs1kqka4nd3kBPVjG44zdM/s1W9TMNoTRn+NwZ
 Xe+4sh0jqm1QF9H0DbgdweZphGWtPqEBGSZXnvKEHuyixT1FBCj66RGYJbhbXB0fTWcG
 jshNBA3QKKDHDyCAM8Dr1A0HwEpkZhDytvZ83uShaSy3BFNZ7RuwbbRXavhH8lvP+y0c
 GmnPRod1hq+0DL8bPwsuL5U/QKyo7acX7vvadhrWpW6hsaqEba6i7Y1Y/huN/iQZOouS
 3heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aa4ZdSlgRZ8MhLbGVS9JTsBuvPwZ0tX7KIRYiE7d8JI=;
 b=eTZOqbpCfz9anm+y2GtLm9VXry4pK0KIYRKj8QcxfussWRrT83ThJCfn4WJMpORVDV
 ayda/PxA++jWHTcyo3R2hISVfAAPU1dXu8G35CljhXK3lbAdXgjSlivy5GNHKBQHMNjW
 Z6n2zMBNlJEaIfuRxxoo06wYVZABfOTYoMiqS2hyVAOuU9KXMJRcQ5MhGtcDNsGaCSyZ
 yWbY+TR648NNEXfIVSIWEElX98k7IW1Gkks1KRDZ8mhTafil2Fyd3GjZ6P+BA0TAciFa
 /LHQ8CkB/gIDndt0SkIjh4+QMK0+tDnacWHPByOAce6wNgjLc4AR92YRCdjfxXLykWkO
 Z4vA==
X-Gm-Message-State: AOAM5309BXTwlQaCBD0xkTPPpVYBT5Zl4G+sAuGeYZ4y8uDLWAN+e6nY
 BaXotc2W7bfrebKgtcjCq9rm6yumOlTUdATOHAE=
X-Google-Smtp-Source: ABdhPJzz0qZbPcrLCgsflC8UeAba5kwD4vRoLQscbAelORTLss+4uJe4pWxkJI2gjPqM1dFbtnv8IPvtMerFm3Jneik=
X-Received: by 2002:a05:6e02:1307:: with SMTP id
 g7mr3335619ilr.46.1643696575491; 
 Mon, 31 Jan 2022 22:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20220128085501.8014-1-liweiwei@iscas.ac.cn>
 <20220128085501.8014-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20220128085501.8014-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 16:22:28 +1000
Message-ID: <CAKmqyKN_iCjfhk=pb1uP=j1=H_Y2FZRmoWoahj5d9_RRYoFpvw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] target/riscv: add support for svnapot extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Tue, 01 Feb 2022 06:22:59 -0000

On Fri, Jan 28, 2022 at 6:57 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
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
>  target/riscv/cpu_helper.c | 17 ++++++++++++++---
>  3 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1cb0436187..8752fa1544 100644
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
> index 6ea3944423..f6ff1c5012 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -489,6 +489,7 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_N               0x8000000000000000 /* NAPOT translation */

This should be 0x8000000000000000ULL to avoid casting

>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b820166dc5..6262d157e2 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -641,7 +641,7 @@ restart:
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> -            if (pte & (PTE_D | PTE_A | PTE_U)) {
> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
>                  return TRANSLATE_FAIL;
>              }
>              base = ppn << PGSHIFT;
> @@ -717,8 +717,19 @@ restart:
>              /* for superpage mappings, make a fake leaf PTE for the TLB's
>                 benefit. */
>              target_ulong vpn = addr >> PGSHIFT;
> -            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
> -                        (addr & ~TARGET_PAGE_MASK);
> +
> +            int napot_bits = 0;
> +            if (cpu->cfg.ext_svnapot && (pte & (target_ulong)PTE_N)) {
> +                napot_bits = ctzl(ppn) + 1;
> +                if ((i != (levels - 1)) || (napot_bits != 4)) {
> +                    return TRANSLATE_FAIL;
> +                }
> +            }
> +
> +            *physical = (((ppn & ~(((target_ulong)1 << napot_bits) - 1)) |

It might be clearer to create the mask as a variable, there are a lot
of brackets here :)

Alistair

> +                          (vpn & (((target_ulong)1 << napot_bits) - 1)) |
> +                          (vpn & (((target_ulong)1 << ptshift) - 1))
> +                        ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>
>              /* set permissions on the TLB entry */
>              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> --
> 2.17.1
>
>

