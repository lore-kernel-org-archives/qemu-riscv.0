Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omnxS-0005yy-SK
	for mharc-qemu-riscv@gnu.org; Sun, 23 Oct 2022 23:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1omnxQ-0005vn-L6; Sun, 23 Oct 2022 23:16:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1omnxN-0006y4-NT; Sun, 23 Oct 2022 23:16:56 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso5357431pjc.0; 
 Sun, 23 Oct 2022 20:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lxzh5LefGuDbVzsrre0X27UzcFf5RnONM/zEXD/f4go=;
 b=F6hXj13BVfwYRJvmEg0/34XIOuy0piOt2rcDsYMuTKYWe4DGyBiZUHEY/oozFQBQvZ
 EIgtr75UAxlKbb2ZEdjxAqcAQe0YserKKbhSiRCpexe4wQVdgmK/EkPUYkEShSizWvXZ
 98tpM1zJXiSR11kNd2nNgD1zsZ6d9vovicGBjByaDphH9CulQdFyf2cMB5w6qZ9ahf2k
 braNLCVgwU0g2fIn6Ss6V96mzVVjZgQVkRWNuiVFJZ8kaNmoFpPSnAcCbn+qLs92HMcf
 b10r4LDpv/DcQTog4qnKM/nUQEN1ow/G3beo5xeS7mNM/9pMMB2OBwaFryC9v3u3Sses
 FEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lxzh5LefGuDbVzsrre0X27UzcFf5RnONM/zEXD/f4go=;
 b=Ibd2NTdZFIaP7/7IWoAGuV7/QoISUmejGdZSno9PgReTknqlyaPsF3xtg07Lkjzvuu
 fnDbvG35FW6crhTDm79fmGPHmVuff9PBgWleTi1Gpvki8+mYOpwj28REg29bJM4RLo+E
 GjfxN13I5RX5SNMGAXURda/om+XZIufj4fl+kMSKmKAQdopdxDPudytoFkDFKlIZr9g7
 yCU0kWdP97uOdWp5DBqX2d1w/QoIvwJMOSWWntJi3gxA0mx65UneFrvWe1BappS9BJrj
 xfy9fTg23nJnPAdk/XSbGXJnanMQvm72lMDcwmPn7cTg5dZ63BFTGpfvlXM16WqzAZSk
 FmBg==
X-Gm-Message-State: ACrzQf1mX176qHeP1nwsqG4fF9XgWE53HvjUjqNE9cWLZzZHMoLdpWtK
 0sY2utfP+0ZRUu0+7HlMFFBO3VbtJu0Ru8aFme4=
X-Google-Smtp-Source: AMsMyM7lfRzYtxvNRs+wjGQEsEqqnewgIGL+ZwwWIamVPKbLbFw8eyBldzZ+8z6he3PaK/RotNIGjKOWD+bTlCzRdMQ=
X-Received: by 2002:a17:90b:314a:b0:20d:904b:18a8 with SMTP id
 ip10-20020a17090b314a00b0020d904b18a8mr70673089pjb.96.1666581409514; Sun, 23
 Oct 2022 20:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221012060016.30856-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221012060016.30856-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Oct 2022 13:16:22 +1000
Message-ID: <CAKmqyKPZRK993u3QeaRBdafNOrUXFu_Q3zzbGrMC7v0ycYzkhA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix PMP propagation for tlb
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 24 Oct 2022 03:16:57 -0000

On Wed, Oct 12, 2022 at 4:01 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
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
> rules. The tlb_sa will be 0x0, and tlb_ea will be 0xfff. If there is
> a pmp rule [0x10, 0x14), it will be misused as it is legal in
> pmp_get_tlb_size.
>
> As we have already known the correct pmp index, just remove the
> remove the pmp_is_range_in_tlb and get tlb size directly from
> pmp_get_tlb_size.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 16 ++++---
>  target/riscv/pmp.c        | 90 +++++++++++++--------------------------
>  target/riscv/pmp.h        |  6 +--
>  3 files changed, 42 insertions(+), 70 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..5d66246c2c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -706,24 +706,26 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
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
> +        target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
> +        target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
> +
> +        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
>      }
>
>      return TRANSLATE_SUCCESS;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 2b43e399b8..d1126a6066 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -292,8 +292,11 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
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
> @@ -305,8 +308,10 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
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
> @@ -333,7 +338,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>          if ((s + e) == 1) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "pmp violation - access is partially inside\n");
> -            ret = 0;
> +            ret = -1;
>              break;
>          }
>
> @@ -436,18 +441,22 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
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
> @@ -586,64 +595,25 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
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
>
> -    if (pmp_sa >= tlb_sa && pmp_ea <= tlb_ea) {
> -        return pmp_ea - pmp_sa + 1;
> -    }
> -
> -    if (pmp_sa >= tlb_sa && pmp_sa <= tlb_ea && pmp_ea >= tlb_ea) {
> -        return tlb_ea - pmp_sa + 1;
> -    }
> -
> -    if (pmp_ea <= tlb_ea && pmp_ea >= tlb_sa && pmp_sa <= tlb_sa) {
> -        return pmp_ea - tlb_sa + 1;
> -    }
> -
> -    return 0;
> -}
> -
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
> +    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
> +        return TARGET_PAGE_SIZE;
> +    } else {
>          /*
> -         * At this point we have a tlb_size that is the smallest possible size
> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
> -         *
> -         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
> -         * This means the result isn't cached in the TLB and is only used for
> -         * a single translation.
> -         */
> -        if (*tlb_size < TARGET_PAGE_SIZE) {
> -            *tlb_size = 1;
> -        }
> -
> -        return true;
> +        * At this point we have a tlb_size that is the smallest possible size
> +        * That fits within a TARGET_PAGE_SIZE and the PMP region.
> +        *
> +        * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
> +        * This means the result isn't cached in the TLB and is only used for
> +        * a single translation.
> +        */
> +        return 1;
>      }
> -
> -    return false;
>  }
>
>  /*
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index a8dd797476..da32c61c85 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -72,11 +72,11 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
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

