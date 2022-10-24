Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omnGj-0004KJ-0u
	for mharc-qemu-riscv@gnu.org; Sun, 23 Oct 2022 22:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1omnGh-0004IH-5u; Sun, 23 Oct 2022 22:32:47 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1omnGf-0005lH-6U; Sun, 23 Oct 2022 22:32:46 -0400
Received: by mail-pl1-x636.google.com with SMTP id d24so7376568pls.4;
 Sun, 23 Oct 2022 19:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=33s9cQDAPNtuorchMImNfkxlqecMZ2Ez5W0PIC2X2FI=;
 b=aeXksI3j8hDSqAem2NAbP7PgIv0W3YYeqcMUjQKSQbmaVTXv9OwW8SC+W2zjqXYD24
 siixeMgmy2eAc1ItVsHwiVbSdJiyAo142IS9iErb022XWW2Fg6jdcXK7BCWTN1jTIZFr
 enX7bohth5NRq97zTI12h3ZnPoxThG5wcMOVhfN+tSEEp6mZGWRCpGQuTLOjAAmEUvHT
 ESTjdrs7osPZ8+9TtoT1KdEvs/TguyB0wnyPsNl6ksUL4ZqaQEuQkDLPhHfv++x/TaU4
 o1v3rIbE+eB0H/t6txhC0HgKU96ZwSZntmKFbzRY3pWL0yQkuARxkgufPRN8lhC92qdH
 7f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33s9cQDAPNtuorchMImNfkxlqecMZ2Ez5W0PIC2X2FI=;
 b=al6Aw4Ovhk7fZEZmn4FTGNMJ6lrvpfLZPdlcx6oTjjtIbxAKAOmFWtFMfl9Qgm9xx1
 ZtAGBaH29eKTsf0nk3TlVPwcGAaZjA/dwASmUdwVfrZCFgk6bCfdVmcWLUKSVEdgkjBk
 BE882nzJIy8pa7yR9UwFaQzdl9zH52GmRlIePd06HicchOZsjV/kOBme+gkgIrnWItsS
 oNz/uOmfnxWuFv1zOzepaBcqE8xwoCIpzfm9aOa2/65H/YFfhE+UTMmezPokKTxeD4qy
 WiyfSCPPmMrqPPzEy0mn5lZs/Dis4BlBtwakz5/sTXV+4rCiJ5sCwkzSkHEkjYvjv2pC
 a/Dg==
X-Gm-Message-State: ACrzQf0ps3kJhulUuBdDEKwn6vDDGXXKniXQfjfjyCYjlebYCk9BIvtA
 yKX9zY7/n+zlJlQTY9uMCUnrlzO0nfOil2bhFo4=
X-Google-Smtp-Source: AMsMyM6yc0+onMRsDvmXQ3921faHP0SoaoJKDj0sRnqN5HmvknmLrObk+mCnbnfF7/kl60+MLiXCsBac5tjFxjMBHkc=
X-Received: by 2002:a17:903:32cd:b0:185:5421:a5d6 with SMTP id
 i13-20020a17090332cd00b001855421a5d6mr31458494plr.99.1666578754157; Sun, 23
 Oct 2022 19:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221012060016.30856-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221012060016.30856-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Oct 2022 12:32:07 +1000
Message-ID: <CAKmqyKPMkk0U=JGQB-QVcDNeH8xSKDn0Ratcm5KFA+mrvmvOow@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix PMP propagation for tlb
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Mon, 24 Oct 2022 02:32:47 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

