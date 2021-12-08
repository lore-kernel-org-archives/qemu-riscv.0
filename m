Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1munYl-000755-36
	for mharc-qemu-riscv@gnu.org; Tue, 07 Dec 2021 22:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1munYj-00074M-FI; Tue, 07 Dec 2021 22:23:57 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=35508
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1munYh-0003SA-Ad; Tue, 07 Dec 2021 22:23:57 -0500
Received: by mail-io1-xd2f.google.com with SMTP id 14so1404505ioe.2;
 Tue, 07 Dec 2021 19:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CgMj6dhwS+A8k13CeJBFh6LRffAllydxMjAnGRt/ZGk=;
 b=gjbZPCPhJq41SN2Vx9GvK03CuzDKTxF6meuEQGOv7K8ixdmY53Ux34TDgaMAF0FBpb
 /BKSvyz8cgfZC14WB+R4+bysQRpxidiJJ3Sb8rjUiNEHeUEj/RSXWr7fmFnnOz1QPdrG
 x7s6Wxo3CT6/tIraDmWl6xS+PMBV8OBTuVxkh2fJ60vAD27otr0HPKJoCGI2l4wrvVBY
 mEd2LboHj/MvgzvQsTvp5O/io+GvpGYC4bhCY/RiMu/OgQt8CaEQuMEYB/gjG5+ou5FY
 paWUFIA0ETTjO0A9BKAZzl9sLM4VCS/JisGMquLxQD5itNQcYdASXGsyT9K5vPzTGSzZ
 epIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CgMj6dhwS+A8k13CeJBFh6LRffAllydxMjAnGRt/ZGk=;
 b=BBXQ1NGzcd1tMcjS1O2iM469aIS7w1FtINSt33dOlNzCKGUBLM/6HHiRQORCnt6HQ+
 TbZaSZghImA5o0f+ebBxkFezLgppqTAIHt/F/s0faS5+mHkS9FJRjuLiPuEIJ0P0TL+S
 SorXTaIgD3imVUG+CxLAElyP2Ppt9XwXFUDrc/XZ6MK9YXiMRmfe5iyL1F0+VfO1v8cZ
 fF/AKEQhF90kqYTJBeqCK8P/BEZichygf/1H8GnCqlGmXe49I/LRGQZ3dqzrAeMVH+rN
 HlkQT//Wef9tsuizP1uX4bwjLe3koy2UIsrSVz3t98e24FvBYGIPnfYGvAxcrQpfRM/M
 X1Kw==
X-Gm-Message-State: AOAM530e6cpULmHqbf77nU4NAArPd8kg9cuwGkwX7Rjzf6Milox9xmc9
 tcxN2iu541RKJryQXleR1AWlPUOL8qjDw7Jgmjg=
X-Google-Smtp-Source: ABdhPJzFAXa2NOcVjtzh9plp8uQMq7b9PpXoix19E9RpH23cvxnAStrnhbPugpZy36576eEKUAGtJNXnFFzoLF38z/U=
X-Received: by 2002:a6b:6802:: with SMTP id d2mr3596027ioc.187.1638933833846; 
 Tue, 07 Dec 2021 19:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20211123090902.23321-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20211123090902.23321-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Dec 2021 13:23:27 +1000
Message-ID: <CAKmqyKOD0JSY3FFBOt6L3=JwRVOsf35eCkpHrB4GvzsTUsOypw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: Fix PMP propagation for tlb
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Wed, 08 Dec 2021 03:23:57 -0000

On Tue, Nov 23, 2021 at 7:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Only the pmp index that be checked by pmp_hart_has_privs can be used
> by pmp_get_tlb_size to avoid an error pmp index.
>
> Before modification, we may use an error pmp index. For example,
> we check address 0x4fc, and the size 0x4 in pmp_hart_has_privs. If there
> is an pmp rule, valid range is [0x4fc, 0x500), then pmp_hart_has_privs
> will return true;
>
> However, this checked pmp index is discarded as pmp_hart_has_privs
> return bool value. In pmp_is_range_in_tlb, it will traverse all pmp
> rules. The tlb_sa will be 0x0, and tlb_ea will be 0x4fff. If there is
> a pmp rule [0x10, 0x4]. It will be misused as it is legal in
> pmp_get_tlb_size.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 16 ++++++-----
>  target/riscv/pmp.c        | 56 +++++++++++++--------------------------
>  target/riscv/pmp.h        |  6 ++---
>  3 files changed, 31 insertions(+), 47 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9eeed38c7e..4239bd2ca5 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -362,24 +362,26 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>                                      int mode)
>  {
>      pmp_priv_t pmp_priv;
> -    target_ulong tlb_size_pmp = 0;
> +    int pmp_index = -1;
>
>      if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
>          *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>          return TRANSLATE_SUCCESS;
>      }
>
> -    if (!pmp_hart_has_privs(env, addr, size, 1 << access_type, &pmp_priv,
> -                            mode)) {
> +    pmp_index = pmp_hart_has_privs(env, addr, size, 1 << access_type,
> +                                   &pmp_priv, mode);
> +    if (pmp_index < 0) {
>          *prot = 0;
>          return TRANSLATE_PMP_FAIL;
>      }
>
>      *prot = pmp_priv_to_page_prot(pmp_priv);
> -    if (tlb_size != NULL) {
> -        if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_pmp)) {
> -            *tlb_size = tlb_size_pmp;
> -        }
> +    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
> +        target_ulong tlb_sa = addr & ~(*tlb_size - 1);
> +        target_ulong tlb_ea = tlb_sa + *tlb_size - 1;
> +
> +        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
>      }
>
>      return TRANSLATE_SUCCESS;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 54abf42583..1172142e34 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -297,8 +297,11 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>
>  /*
>   * Check if the address has required RWX privs to complete desired operation
> + * Return PMP rule index if a pmp rule match
> + * Return MAX_RISCV_PMPS if default match
> + * Return negtive value if no match
>   */
> -bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> +int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>      target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
>      target_ulong mode)
>  {
> @@ -310,8 +313,10 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>
>      /* Short cut if no rules */
>      if (0 == pmp_get_num_rules(env)) {
> -        return pmp_hart_has_privs_default(env, addr, size, privs,
> -                                          allowed_privs, mode);
> +        if (pmp_hart_has_privs_default(env, addr, size, privs,
> +                                       allowed_privs, mode)) {
> +            ret = MAX_RISCV_PMPS;
> +        }
>      }
>
>      if (size == 0) {
> @@ -338,7 +343,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>          if ((s + e) == 1) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "pmp violation - access is partially inside\n");
> -            ret = 0;
> +            ret = -1;
>              break;
>          }
>
> @@ -441,18 +446,22 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                  }
>              }
>
> -            ret = ((privs & *allowed_privs) == privs);
> +            if ((privs & *allowed_privs) == privs) {
> +                ret = i;
> +            }
>              break;
>          }
>      }
>
>      /* No rule matched */
>      if (ret == -1) {
> -        return pmp_hart_has_privs_default(env, addr, size, privs,
> -                                          allowed_privs, mode);
> +        if (pmp_hart_has_privs_default(env, addr, size, privs,
> +                                       allowed_privs, mode)) {
> +            ret = MAX_RISCV_PMPS;
> +        }
>      }
>
> -    return ret == 1 ? true : false;
> +    return ret;
>  }
>
>  /*
> @@ -595,8 +604,8 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>   * Calculate the TLB size if the start address or the end address of
>   * PMP entry is presented in the TLB page.
>   */
> -static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> -                                     target_ulong tlb_sa, target_ulong tlb_ea)
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> +                              target_ulong tlb_sa, target_ulong tlb_ea)
>  {
>      target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
>      target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
> @@ -616,33 +625,6 @@ static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>      return 0;
>  }
>
> -/*
> - * Check is there a PMP entry which range covers this page. If so,
> - * try to find the minimum granularity for the TLB size.
> - */
> -bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> -                         target_ulong *tlb_size)
> -{
> -    int i;
> -    target_ulong val;
> -    target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
> -
> -    for (i = 0; i < MAX_RISCV_PMPS; i++) {
> -        val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
> -        if (val) {
> -            if (*tlb_size == 0 || *tlb_size > val) {
> -                *tlb_size = val;
> -            }
> -        }
> -    }
> -
> -    if (*tlb_size != 0) {
> -        return true;
> -    }
> -
> -    return false;
> -}
> -
>  /*
>   * Convert PMP privilege to TLB page privilege.
>   */
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index a9a0b363a7..94c0b960fb 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -68,11 +68,11 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>      target_ulong val);
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
> -bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> +int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>      target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
>      target_ulong mode);
> -bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> -                         target_ulong *tlb_size);
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> +                              target_ulong tlb_sa, target_ulong tlb_ea);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
>  uint32_t pmp_get_num_rules(CPURISCVState *env);
> --
> 2.25.1
>
>

