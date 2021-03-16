Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMFui-0005RZ-Bk
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 16:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFug-0005OI-Ai; Tue, 16 Mar 2021 16:03:34 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFuZ-0003SI-Eu; Tue, 16 Mar 2021 16:03:33 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id t5so275495qvs.5;
 Tue, 16 Mar 2021 13:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+9Zc4+fAGPJPl57TXCZNB/5ect5Oigz89/uDOo3nsY=;
 b=EW1cKz3xu1BJussiUEq/6JXP5kXpJos3dvSgP0cyUpfdVQmPWUTcUMJU6nhlaS1cAL
 1+lVz4zIhdbrnMY2WRfFH2mOzJp1urcdINGuEA/omC9Ln3UOk5iq9wXXIBuhMsQzMlMQ
 a5Rc0j13rx7NwT8Ky0dvR5Rtp/ZmXlFaWDp2CsrPaWqqUH+0AW4mgfm3KXRxjgHAjCzi
 Uo7jTay5buRIPtqb+KBHdmED0B5JTD5uaFG4KkE9aDheJpqmkRNMofY2XRFsQFsBln6r
 5xDScJrNrF3EFr15DEUvajKWD6qVCckG4yNj53WO21+ATt9Z4dIbvqOSHgr+L4i5w9DN
 oOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+9Zc4+fAGPJPl57TXCZNB/5ect5Oigz89/uDOo3nsY=;
 b=ED2Dx7tL65168A9mtbG9YHwht6VtGaH3q6pKcE+rBvt/2YNEQNHkCeU3V9lYUStW9p
 OdntP0nUBycQxHyhJG8Dy70+DWwsGZPGBDvdcjrXVpKMFH/vpIPEFg7flKc8QmQLohVx
 quMwNgymuyYGsviw9WRTy4JqslobqREJ4L3IXTKKwmTvn8kaeBHZvJgozSFiktrSf4L4
 t9ZZCKhXoWOegolUgqYEV1xs+lElJuGzlOUfmTD+nCHrnCpydUqwlhGeFOPkg566pr3j
 Li2srfx/SYwhOrrJKCdErEfKx0AUR0jVM2Qp1sjE7bhS4QiemAbK4PqhjvQZ5XaBOzYg
 jorg==
X-Gm-Message-State: AOAM53167+RVY+W99zMvjyzMn/pg+na4mz2Y1bURnwdu40THyFTu5SGR
 2xK/0275mVxW5zq3gV/0cN4CrwqAC1SYFlbF0AE=
X-Google-Smtp-Source: ABdhPJxsBGCKq6WZ2B1nSHPPxlK4NIJq4L8lPxKpp8iZnk57WGnJHorehypYsweceipYaysme+WGlwBrYojD+q4YTLg=
X-Received: by 2002:a0c:9a04:: with SMTP id p4mr1597375qvd.38.1615925005722;
 Tue, 16 Mar 2021 13:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
 <1613916082-19528-2-git-send-email-cwshu@andestech.com>
In-Reply-To: <1613916082-19528-2-git-send-email-cwshu@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 16:01:49 -0400
Message-ID: <CAKmqyKOmQ2we5SqLnDk1HUSESA_eQdTt2swcLU=HvTp4qFH4sw@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: propagate PMP permission to TLB page
To: Jim Shu <cwshu@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=alistair23@gmail.com; helo=mail-qv1-xf2e.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 20:03:34 -0000

On Sun, Feb 21, 2021 at 10:35 AM Jim Shu <cwshu@andestech.com> wrote:
>
> Currently, PMP permission checking of TLB page is bypassed if TLB hits
> Fix it by propagating PMP permission to TLB page permission.
>
> PMP permission checking also use MMU-style API to change TLB permission
> and size.
>
> Signed-off-by: Jim Shu <cwshu@andestech.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 84 +++++++++++++++++++++++++++++----------
>  target/riscv/pmp.c        | 80 +++++++++++++++++++++++++++----------
>  target/riscv/pmp.h        |  4 +-
>  3 files changed, 125 insertions(+), 43 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2f43939fb6..f6ac63bf0e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -280,6 +280,49 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>      env->load_res = -1;
>  }
>
> +/*
> + * get_physical_address_pmp - check PMP permission for this physical address
> + *
> + * Match the PMP region and check permission for this physical address and it's
> + * TLB page. Returns 0 if the permission checking was successful
> + *
> + * @env: CPURISCVState
> + * @prot: The returned protection attributes
> + * @tlb_size: TLB page size containing addr. It could be modified after PMP
> + *            permission checking. NULL if not set TLB page for addr.
> + * @addr: The physical address to be checked permission
> + * @access_type: The type of MMU access
> + * @mode: Indicates current privilege level.
> + */
> +static int get_physical_address_pmp(CPURISCVState *env, int *prot,
> +                                    target_ulong *tlb_size, hwaddr addr,
> +                                    int size, MMUAccessType access_type,
> +                                    int mode)
> +{
> +    pmp_priv_t pmp_priv;
> +    target_ulong tlb_size_pmp = 0;
> +
> +    if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        return TRANSLATE_SUCCESS;
> +    }
> +
> +    if (!pmp_hart_has_privs(env, addr, size, 1 << access_type, &pmp_priv,
> +                            mode)) {
> +        *prot = 0;
> +        return TRANSLATE_PMP_FAIL;
> +    }
> +
> +    *prot = pmp_priv_to_page_prot(pmp_priv);
> +    if (tlb_size != NULL) {
> +        if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_pmp)) {
> +            *tlb_size = tlb_size_pmp;
> +        }
> +    }
> +
> +    return TRANSLATE_SUCCESS;
> +}
> +
>  /* get_physical_address - get the physical address for this virtual address
>   *
>   * Do a page table walk to obtain the physical address corresponding to a
> @@ -442,9 +485,11 @@ restart:
>              pte_addr = base + idx * ptesize;
>          }
>
> -        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> -            !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
> -            1 << MMU_DATA_LOAD, PRV_S)) {
> +        int pmp_prot;
> +        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, pte_addr,
> +                                               sizeof(target_ulong),
> +                                               MMU_DATA_LOAD, PRV_S);
> +        if (pmp_ret != TRANSLATE_SUCCESS) {
>              return TRANSLATE_PMP_FAIL;
>          }
>
> @@ -682,13 +727,14 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>  #ifndef CONFIG_USER_ONLY
>      vaddr im_address;
>      hwaddr pa = 0;
> -    int prot, prot2;
> +    int prot, prot2, prot_pmp;
>      bool pmp_violation = false;
>      bool first_stage_error = true;
>      bool two_stage_lookup = false;
>      int ret = TRANSLATE_FAIL;
>      int mode = mmu_idx;
> -    target_ulong tlb_size = 0;
> +    /* default TLB page size */
> +    target_ulong tlb_size = TARGET_PAGE_SIZE;
>
>      env->guest_phys_fault_addr = 0;
>
> @@ -745,10 +791,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>
>              prot &= prot2;
>
> -            if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> -                (ret == TRANSLATE_SUCCESS) &&
> -                !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
> -                ret = TRANSLATE_PMP_FAIL;
> +            if (ret == TRANSLATE_SUCCESS) {
> +                ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> +                                               size, access_type, mode);
> +                prot &= prot_pmp;
>              }
>
>              if (ret != TRANSLATE_SUCCESS) {
> @@ -771,25 +817,21 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        "%s address=%" VADDR_PRIx " ret %d physical "
>                        TARGET_FMT_plx " prot %d\n",
>                        __func__, address, ret, pa, prot);
> -    }
>
> -    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> -        (ret == TRANSLATE_SUCCESS) &&
> -        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
> -        ret = TRANSLATE_PMP_FAIL;
> +        if (ret == TRANSLATE_SUCCESS) {
> +            ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> +                                           size, access_type, mode);
> +            prot &= prot_pmp;
> +        }
>      }
> +
>      if (ret == TRANSLATE_PMP_FAIL) {
>          pmp_violation = true;
>      }
>
>      if (ret == TRANSLATE_SUCCESS) {
> -        if (pmp_is_range_in_tlb(env, pa & TARGET_PAGE_MASK, &tlb_size)) {
> -            tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
> -                         prot, mmu_idx, tlb_size);
> -        } else {
> -            tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
> -                         prot, mmu_idx, TARGET_PAGE_SIZE);
> -        }
> +        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
> +                     prot, mmu_idx, tlb_size);
>          return true;
>      } else if (probe) {
>          return false;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 80d0334e1b..ebd874cde3 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -217,6 +217,35 @@ static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
>      return result;
>  }
>
> +/*
> + * Check if the address has required RWX privs when no PMP entry is matched.
> + */
> +static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
> +    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
> +    target_ulong mode)
> +{
> +    bool ret;
> +
> +    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
> +        /*
> +         * Privileged spec v1.10 states if HW doesn't implement any PMP entry
> +         * or no PMP entry matches an M-Mode access, the access succeeds.
> +         */
> +        ret = true;
> +        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +    } else {
> +        /*
> +         * Other modes are not allowed to succeed if they don't * match a rule,
> +         * but there are rules. We've checked for no rule earlier in this
> +         * function.
> +         */
> +        ret = false;
> +        *allowed_privs = 0;
> +    }
> +
> +    return ret;
> +}
> +
>
>  /*
>   * Public Interface
> @@ -226,18 +255,19 @@ static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
>   * Check if the address has required RWX privs to complete desired operation
>   */
>  bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> -    target_ulong size, pmp_priv_t privs, target_ulong mode)
> +    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
> +    target_ulong mode)
>  {
>      int i = 0;
>      int ret = -1;
>      int pmp_size = 0;
>      target_ulong s = 0;
>      target_ulong e = 0;
> -    pmp_priv_t allowed_privs = 0;
>
>      /* Short cut if no rules */
>      if (0 == pmp_get_num_rules(env)) {
> -        return (env->priv == PRV_M) ? true : false;
> +        return pmp_hart_has_privs_default(env, addr, size, privs,
> +                                          allowed_privs, mode);
>      }
>
>      if (size == 0) {
> @@ -277,37 +307,25 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>           * check
>           */
>          if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
> -            allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
>              if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> -                allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> +                *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
>              }
>
> -            if ((privs & allowed_privs) == privs) {
> -                ret = 1;
> -                break;
> -            } else {
> -                ret = 0;
> -                break;
> -            }
> +            ret = ((privs & *allowed_privs) == privs);
> +            break;
>          }
>      }
>
>      /* No rule matched */
>      if (ret == -1) {
> -        if (mode == PRV_M) {
> -            ret = 1; /* Privileged spec v1.10 states if no PMP entry matches an
> -                      * M-Mode access, the access succeeds */
> -        } else {
> -            ret = 0; /* Other modes are not allowed to succeed if they don't
> -                      * match a rule, but there are rules.  We've checked for
> -                      * no rule earlier in this function. */
> -        }
> +        return pmp_hart_has_privs_default(env, addr, size, privs,
> +                                          allowed_privs, mode);
>      }
>
>      return ret == 1 ? true : false;
>  }
>
> -
>  /*
>   * Handle a write to a pmpcfg CSP
>   */
> @@ -442,3 +460,23 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
>
>      return false;
>  }
> +
> +/*
> + * Convert PMP privilege to TLB page privilege.
> + */
> +int pmp_priv_to_page_prot(pmp_priv_t pmp_priv)
> +{
> +    int prot = 0;
> +
> +    if (pmp_priv & PMP_READ) {
> +        prot |= PAGE_READ;
> +    }
> +    if (pmp_priv & PMP_WRITE) {
> +        prot |= PAGE_WRITE;
> +    }
> +    if (pmp_priv & PMP_EXEC) {
> +        prot |= PAGE_EXEC;
> +    }
> +
> +    return prot;
> +}
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index c8d5ef4a69..b82a30f0d5 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -59,11 +59,13 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>      target_ulong val);
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
>  bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> -    target_ulong size, pmp_priv_t priv, target_ulong mode);
> +    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
> +    target_ulong mode);
>  bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
>                           target_ulong *tlb_size);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
>  uint32_t pmp_get_num_rules(CPURISCVState *env);
> +int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
>
>  #endif
> --
> 2.30.1
>
>

