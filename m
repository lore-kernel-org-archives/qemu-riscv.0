Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipN8l-0001kI-BU
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 21:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipN8d-0001hA-1g
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:01:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipN8X-0002od-Ur
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:01:30 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:38219)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipN8V-0002eK-Ta
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:01:24 -0500
Received: by mail-pj1-x1041.google.com with SMTP id l35so422542pje.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 18:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=IP0neH8dc4ycnxW+MO7dFXfxdneeYWShlkCN/+oKbjU=;
 b=JsNE4ZeVnbfeeEVU4UUvKhAS/c2jgo2rIfUTUP+R9UewurMM3g9U/RuptIHJKVlsjd
 sdhSb604WBYNXR3Y2LKOClwsqUnZBFVxWJLaY+gt3OtnvLd0XQi5bO1WwnGsN3Q1McHo
 swtcfchXUoY1ttt0Pvq1QQQr8HmltV4hyKGM1JTGS/TGPU5sj5kjMPKyFUlC9gNv/6Gt
 I+MCcTqPCBVcK5NrILzrzVJ2kcMe6WlNMYFpNYWOfX26LiTh3VW8ddCfecNVK/mBbIAN
 yLjSucBPWbnYNyqTxR1S157fnWdMFOC/g64Eruwz/9AC5Hrg+NFCv4ivbW+yyIWXlO2p
 nNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=IP0neH8dc4ycnxW+MO7dFXfxdneeYWShlkCN/+oKbjU=;
 b=nInJ+nq8US9W8+FT9w5hf2klwHaVALqzR7adClszFRA9h9aZDXlQc2tk0jyNmjxqmv
 +Yt7MyrhW1wHJFlyz0gWTX9ir/soPLHZZbSW9BOMc9m/xfzOZC2qBAfrdOale/rWxb84
 WnlfiwLbQFZjjV8LC3Pf2+O7rMAwQ0j1iL9z+KgtfQgLNfVQ+m6xC3AMRJFHt/uOHWaz
 e+izIE3yHrNUpEnoAxmf+XUKz3SrDVeT20LQMjBwfclFVzvtXc/n/K2K0hGI5pp0rX7v
 ADYBkjQUJ/sE/MwfzcWcUuJtTUyyOU6Q4N+0swOrvg4yGlH2du6MifMgane+th3MzTDE
 WvLw==
X-Gm-Message-State: APjAAAWuWykdDp+RHURROcCktzzPldKhTsUmLmOOfoIqAbxApTfRhmWP
 WS8B+T4c0DDHKgpCndqnoDQHEA==
X-Google-Smtp-Source: APXvYqyYbNJblKfAToTzV6E5dA7RLkb5AvovXIYcBvPc62m7dVt+H9lNEjxsV4ips48dfvEDRwWPGg==
X-Received: by 2002:a17:902:7602:: with SMTP id
 k2mr8941532pll.34.1578535276912; 
 Wed, 08 Jan 2020 18:01:16 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id j94sm578602pje.8.2020.01.08.18.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 18:01:16 -0800 (PST)
Date: Wed, 08 Jan 2020 18:01:16 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 18:01:10 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 31/36] target/riscv: Implement second stage MMU
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <a40c558e15a57e8d4a15fe7ef3860018d0b8ab11.1575914822.git.alistair.francis@wdc.com>
References: <a40c558e15a57e8d4a15fe7ef3860018d0b8ab11.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-91300844-abd3-4b6c-be7c-2bbb8fc06e98@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-List-Received-Date: Thu, 09 Jan 2020 02:01:38 -0000

On Mon, 09 Dec 2019 10:12:01 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |   1 +
>  target/riscv/cpu_helper.c | 193 ++++++++++++++++++++++++++++++++++----
>  2 files changed, 175 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index eb089fbdb6..b411a1f900 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -104,6 +104,7 @@ struct CPURISCVState {
>      target_ulong frm;
>
>      target_ulong badaddr;
> +    target_ulong guest_phys_fault_addr;
>
>      target_ulong priv_ver;
>      target_ulong misa;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 8b234790a7..8667e5ffce 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -287,11 +287,12 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>   * @mmu_idx: Indicates current privilege level
>   * @first_stage: Are we in first stage translation?
>   *               Second stage is used for hypervisor guest translation
> + * @two_stage: Are we going to perform two stage translation
>   */
>  static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>                                  int *prot, target_ulong addr,
>                                  int access_type, int mmu_idx,
> -                                bool first_stage)
> +                                bool first_stage, bool two_stage)
>  {
>      /* NOTE: the env->pc value visible here will not be
>       * correct, but the value visible to the exception handler
> @@ -299,13 +300,40 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>      MemTxResult res;
>      MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>      int mode = mmu_idx;
> +    bool use_background = false;
>
> +    /*
> +     * Check if we should use the background registers for the two
> +     * stage translation. We don't need to check if we actually need
> +     * two stage translation as that happened before this function
> +     * was called. Background registers will be used if the guest has
> +     * forced a two stage translation to be on (in HS or M mode).
> +     */
>      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
>          if (get_field(*env->mstatus, MSTATUS_MPRV)) {
>              mode = get_field(*env->mstatus, MSTATUS_MPP);
> +
> +            if (riscv_has_ext(env, RVH) &&
> +                get_field(*env->mstatus, MSTATUS_MPV)) {
> +                use_background = true;
> +            }
> +        }
> +    }
> +
> +    if (mode == PRV_S && access_type != MMU_INST_FETCH &&
> +        riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
> +        if (get_field(env->hstatus, HSTATUS_SPRV)) {
> +            mode = get_field(*env->mstatus, SSTATUS_SPP);
> +            use_background = true;
>          }
>      }
>
> +    if (first_stage == false) {
> +        /* We are in stage 2 translation, this is similar to stage 1. */
> +        /* Stage 2 is always taken as U-mode */
> +        mode = PRV_U;
> +    }
> +
>      if (mode == PRV_M || !riscv_feature(env, RISCV_FEATURE_MMU)) {
>          *physical = addr;
>          *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> @@ -315,13 +343,30 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>      *prot = 0;
>
>      hwaddr base;
> -    int levels, ptidxbits, ptesize, vm, sum;
> -    int mxr = get_field(*env->mstatus, MSTATUS_MXR);
> +    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
> +
> +    if (first_stage == true) {
> +        mxr = get_field(*env->mstatus, MSTATUS_MXR);
> +    } else {
> +        mxr = get_field(env->vsstatus, MSTATUS_MXR);
> +    }
>
>      if (env->priv_ver >= PRIV_VERSION_1_10_0) {
> -        base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
> +        if (first_stage == true) {
> +            if (use_background) {
> +                base = (hwaddr)get_field(env->vsatp, SATP_PPN) << PGSHIFT;
> +                vm = get_field(env->vsatp, SATP_MODE);
> +            } else {
> +                base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
> +                vm = get_field(env->satp, SATP_MODE);
> +            }
> +            widened = 0;
> +        } else {
> +            base = (hwaddr)get_field(env->hgatp, HGATP_PPN) << PGSHIFT;
> +            vm = get_field(env->hgatp, HGATP_MODE);
> +            widened = 2;
> +        }
>          sum = get_field(*env->mstatus, MSTATUS_SUM);
> -        vm = get_field(env->satp, SATP_MODE);
>          switch (vm) {
>          case VM_1_10_SV32:
>            levels = 2; ptidxbits = 10; ptesize = 4; break;
> @@ -339,6 +384,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>            g_assert_not_reached();
>          }
>      } else {
> +        widened = 0;
>          base = (hwaddr)(env->sptbr) << PGSHIFT;
>          sum = !get_field(*env->mstatus, MSTATUS_PUM);
>          vm = get_field(*env->mstatus, MSTATUS_VM);
> @@ -359,9 +405,16 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>      }
>
>      CPUState *cs = env_cpu(env);
> -    int va_bits = PGSHIFT + levels * ptidxbits;
> -    target_ulong mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> -    target_ulong masked_msbs = (addr >> (va_bits - 1)) & mask;
> +    int va_bits = PGSHIFT + levels * ptidxbits + widened;
> +    target_ulong mask, masked_msbs;
> +
> +    if (TARGET_LONG_BITS > (va_bits - 1)) {
> +        mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +    } else {
> +        mask = 0;
> +    }
> +    masked_msbs = (addr >> (va_bits - 1)) & mask;
> +
>      if (masked_msbs != 0 && masked_msbs != mask) {
>          return TRANSLATE_FAIL;
>      }
> @@ -373,11 +426,29 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>  restart:
>  #endif
>      for (i = 0; i < levels; i++, ptshift -= ptidxbits) {
> -        target_ulong idx = (addr >> (PGSHIFT + ptshift)) &
> +        target_ulong idx;
> +        if (i == 0) {
> +            idx = (addr >> (PGSHIFT + ptshift)) &
> +                           ((1 << (ptidxbits + widened)) - 1);
> +        } else {
> +            idx = (addr >> (PGSHIFT + ptshift)) &
>                             ((1 << ptidxbits) - 1);
> +        }
>
>          /* check that physical address of PTE is legal */
> -        hwaddr pte_addr = base + idx * ptesize;
> +        hwaddr pte_addr;
> +
> +        if (two_stage && first_stage) {
> +            hwaddr vbase;
> +
> +            /* Do the second stage translation on the base PTE address. */
> +            get_physical_address(env, &vbase, prot, base, access_type,
> +                                 mmu_idx, false, true);
> +
> +            pte_addr = vbase + idx * ptesize;
> +        } else {
> +            pte_addr = base + idx * ptesize;
> +        }
>
>          if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>              !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
> @@ -474,7 +545,12 @@ restart:
>              /* for superpage mappings, make a fake leaf PTE for the TLB's
>                 benefit. */
>              target_ulong vpn = addr >> PGSHIFT;
> -            *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
> +            if (i == 0) {
> +                *physical = (ppn | (vpn & ((1L << (ptshift + widened)) - 1))) <<
> +                             PGSHIFT;
> +            } else {
> +                *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
> +            }
>
>              /* set permissions on the TLB entry */
>              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> @@ -533,14 +609,23 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
>      hwaddr phys_addr;
>      int prot;
>      int mmu_idx = cpu_mmu_index(&cpu->env, false);
>
> -    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx,
> -                             true)) {
> +    if (get_physical_address(env, &phys_addr, &prot, addr, 0, mmu_idx,
> +                             true, riscv_cpu_virt_enabled(env))) {
>          return -1;
>      }
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        if (get_physical_address(env, &phys_addr, &prot, phys_addr,
> +                                 0, mmu_idx, false, true)) {
> +            return -1;
> +        }
> +    }
> +
>      return phys_addr;
>  }
>
> @@ -594,17 +679,37 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
>  #ifndef CONFIG_USER_ONLY
> +    vaddr im_address;
>      hwaddr pa = 0;
>      int prot;
>      bool pmp_violation = false;
> +    bool m_mode_two_stage = false;
> +    bool hs_mode_two_stage = false;
> +    bool first_stage_error = true;
>      int ret = TRANSLATE_FAIL;
>      int mode = mmu_idx;
>
> +    env->guest_phys_fault_addr = 0;
> +
>      qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                    __func__, address, access_type, mmu_idx);
>
> -    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx,
> -                               true);
> +    /*
> +     * Determine if we are in M mode and MPRV is set or in HS mode and SPRV is
> +     * set and we want to access a virtulisation address.
> +     */
> +    if (riscv_has_ext(env, RVH)) {
> +        m_mode_two_stage = env->priv == PRV_M &&
> +                           access_type != MMU_INST_FETCH &&
> +                           get_field(*env->mstatus, MSTATUS_MPRV) &&
> +                           get_field(*env->mstatus, MSTATUS_MPV);
> +
> +        hs_mode_two_stage = env->priv == PRV_S &&
> +                            !riscv_cpu_virt_enabled(env) &&
> +                            access_type != MMU_INST_FETCH &&
> +                            get_field(env->hstatus, HSTATUS_SPRV) &&
> +                            get_field(env->hstatus, HSTATUS_SPV);
> +    }
>
>      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
>          if (get_field(*env->mstatus, MSTATUS_MPRV)) {
> @@ -612,9 +717,55 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          }
>      }
>
> -    qemu_log_mask(CPU_LOG_MMU,
> -                  "%s address=%" VADDR_PRIx " ret %d physical " TARGET_FMT_plx
> -                  " prot %d\n", __func__, address, ret, pa, prot);
> +    if (riscv_cpu_virt_enabled(env) || m_mode_two_stage || hs_mode_two_stage) {
> +        /* Two stage lookup */
> +        ret = get_physical_address(env, &pa, &prot, address, access_type,
> +                                   mmu_idx, true, true);
> +
> +        qemu_log_mask(CPU_LOG_MMU,
> +                      "%s 1st-stage address=%" VADDR_PRIx " ret %d physical "
> +                      TARGET_FMT_plx " prot %d\n",
> +                      __func__, address, ret, pa, prot);
> +
> +        if (ret != TRANSLATE_FAIL) {
> +            /* Second stage lookup */
> +            im_address = pa;
> +
> +            ret = get_physical_address(env, &pa, &prot, im_address,
> +                                       access_type, mmu_idx, false, true);
> +
> +            qemu_log_mask(CPU_LOG_MMU,
> +                    "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
> +                    TARGET_FMT_plx " prot %d\n",
> +                    __func__, im_address, ret, pa, prot);
> +
> +            if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> +                (ret == TRANSLATE_SUCCESS) &&
> +                !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
> +                ret = TRANSLATE_PMP_FAIL;
> +            }
> +
> +            if (ret != TRANSLATE_SUCCESS) {
> +                /*
> +                 * Guest physical address translation failed, this is a HS
> +                 * level exception
> +                 */
> +                first_stage_error = false;
> +                env->guest_phys_fault_addr = (im_address |
> +                                              (address &
> +                                               (TARGET_PAGE_SIZE - 1))) >> 2;
> +            }
> +        }
> +    } else {
> +        /* Single stage lookup */
> +        ret = get_physical_address(env, &pa, &prot, address, access_type,
> +                                   mmu_idx, true, false);
> +
> +        qemu_log_mask(CPU_LOG_MMU,
> +                      "%s address=%" VADDR_PRIx " ret %d physical "
> +                      TARGET_FMT_plx " prot %d\n",
> +                      __func__, address, ret, pa, prot);
> +    }
>
>      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>          (ret == TRANSLATE_SUCCESS) &&
> @@ -624,6 +775,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      if (ret == TRANSLATE_PMP_FAIL) {
>          pmp_violation = true;
>      }
> +
>      if (ret == TRANSLATE_SUCCESS) {
>          tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
>                       prot, mmu_idx, TARGET_PAGE_SIZE);
> @@ -631,9 +783,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      } else if (probe) {
>          return false;
>      } else {
> -        raise_mmu_exception(env, address, access_type, pmp_violation, true);
> +        raise_mmu_exception(env, address, access_type, pmp_violation, first_stage_error);
>          riscv_raise_exception(env, cs->exception_index, retaddr);
>      }
> +
> +    return true;
> +
>  #else
>      switch (access_type) {
>      case MMU_INST_FETCH:

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

