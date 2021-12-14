Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxG8m-0002pm-Lj
	for mharc-qemu-riscv@gnu.org; Tue, 14 Dec 2021 17:19:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mxG8l-0002pY-Ao; Tue, 14 Dec 2021 17:19:19 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=39881
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mxG8j-0001CH-1i; Tue, 14 Dec 2021 17:19:18 -0500
Received: by mail-io1-xd2c.google.com with SMTP id c3so26881312iob.6;
 Tue, 14 Dec 2021 14:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jEVjzENtxHAv5iTm51KWK2yi/DGicjeKnxOZbjNNoQU=;
 b=Nm3MYCWAHSqrXtQSPd0kPEQ9F0EaDWJpfKf2MZDRKyAJg+ZxZc6Urh6lF3S9QO88b8
 mbWiB0izskBIcUaxGC7b+eqbGr41OTdKqC2SHVvzultIa9nVWlhrVyBiz+RubZh//eiG
 0aHPnPO9Pf8X/ONpGU4K+oNQ873FgkuuI5H5yUxst71sjKrrEXb4br40wR0TLQq8Av2T
 4vTS1t6wNMenZMyzrwHjeWb0AGa/aGpbSxkgNCpJ1t53XmMBIUJCOXZ1WK6Hrfs4K7Rx
 Z7azDeL7B7kqx/7a6tizThY2+V7pnU2HBPJlYK4p+qqZtrLEJODvS4tJJlPAYln+S9kO
 swKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jEVjzENtxHAv5iTm51KWK2yi/DGicjeKnxOZbjNNoQU=;
 b=2RNXtB/4BF0jzFe170CfPnt1NfZt6WSyMj9nnPrixwyq3E0tkJurF1pUTurAC/+Ch3
 KNxfQwhr6O9VuLJD3mnyEPrWq63U/8sGoezNBoIrZFF9tjLSREF+S9mVvIHbM9pC/iUl
 swsGvGQEVYjvG05BaceI0cP9sOOhrD6m9VrmG/vYTGZmuKIV0DnsN89RjcWPwGfBGLWe
 F5I8q3aKDovMKteQB6WHZFU2PsAr5hzTfygZoGZTocZkTR48bXBDSmTbxiK9pdMwRk1/
 LzobR72mZ66ahWMchbBIyr3GFXPAyNKnDu5mq5yVSGCW1GO5Cej8BtIg2BG+azp3TIak
 YATA==
X-Gm-Message-State: AOAM531X/j35M/BCVWn4TGpIfc1ln3B1GBUPP4zslFXNwaSwasclTZZT
 zgXrZZHFZ3Lrrw/U+RFEBlxK0KNR8qADbMnH1no=
X-Google-Smtp-Source: ABdhPJx/RsajC+XaAYsu7YxKnBfyP2skMhlRAkJW6rmPdacGWq06DtWjP0j9ZZuNm0bSE6pm7jz0wfmOEQ5M0akOukY=
X-Received: by 2002:a02:854c:: with SMTP id g70mr4608031jai.756.1639520355074; 
 Tue, 14 Dec 2021 14:19:15 -0800 (PST)
MIME-Version: 1.0
References: <20211128135255.22089-1-liweiwei@iscas.ac.cn>
 <20211128135255.22089-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20211128135255.22089-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Dec 2021 08:18:48 +1000
Message-ID: <CAKmqyKONSekj-WQ_HegL+JesGrPD=KRQnFTtW7y=ks4SKQMaow@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] target/riscv: add support for svnapot extension
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 14 Dec 2021 22:19:19 -0000

On Sun, Nov 28, 2021 at 11:54 PM liweiwei <liweiwei@iscas.ac.cn> wrote:
>

Can you add a commit message that describes what you are changing?

Alistair

> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 18 ++++++++++++------
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 9913fa9f77..70391424b0 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -473,6 +473,7 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_N               0x8000000000000000
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9eeed38c7e..e68db3e119 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -588,7 +588,7 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
>
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
> @@ -668,8 +668,17 @@ restart:
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
> @@ -856,7 +865,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          ret = get_physical_address(env, &pa, &prot, address,
>                                     &env->guest_phys_fault_addr, access_type,
>                                     mmu_idx, true, true, false);
> -
>          /*
>           * A G-stage exception may be triggered during two state lookup.
>           * And the env->guest_phys_fault_addr has already been set in
> @@ -879,7 +887,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
>                                         access_type, mmu_idx, false, true,
>                                         false);
> -
>              qemu_log_mask(CPU_LOG_MMU,
>                      "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
>                      TARGET_FMT_plx " prot %d\n",
> @@ -914,7 +921,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          /* Single stage lookup */
>          ret = get_physical_address(env, &pa, &prot, address, NULL,
>                                     access_type, mmu_idx, true, false, false);
> -
>          qemu_log_mask(CPU_LOG_MMU,
>                        "%s address=%" VADDR_PRIx " ret %d physical "
>                        TARGET_FMT_plx " prot %d\n",
> --
> 2.17.1
>
>

