Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSRf9-000829-EP
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 18:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSRf7-00081n-Oj
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 18:58:09 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSRf3-0006xJ-W8
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 18:58:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id he33so1050821ejc.11
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 15:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yf3eqI8Dk7tNgbydEgJ+IldmAPREgkHbFGnfLT5h+10=;
 b=MJ6kk1zQjXJO+NLeQGFc3VhpXHvqxPajmQcSi6g2W/6JOSTyLVFmtsYcykTaSyKWfC
 wdilgEIJEfkpJWTB1iYVBRR93isU3LeQh7wYgdsXu1lvQO0rJY61qYLwE4lpkTsGKAWk
 cpPIkvRPRDwhWtzDAAefE/YPJC10EPh83mNFiB8zJgT+9D7elWRi8eWjSRy9Ri3IEn/V
 1zHN7DpUPtDgoSCSNQJ9EpTFowWfAoxdbV6+KrCDwDx/qLCpIUwO47Gf4+fZ3KwNAUlq
 9xR5zyhrOWSZvznp77H0L/IWMF7HaUP+SOlsvPTWT6JD0n/MIP1tmWFg+Gjo/EzPjrKy
 bLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yf3eqI8Dk7tNgbydEgJ+IldmAPREgkHbFGnfLT5h+10=;
 b=qAAd2uADY7u8ZwWit+yVHECtPYwKsd2KxMEYW/bJftZM+1ID8EPcNeYiZNT1OrT/xg
 JXwcg4lUzRERN0uMD5yuR/M63YDfNGQaJp0CasDGJG6BkINvdMd6Ye68rcWecHP8mpcb
 Pte1kdDCd4IzBVzIxXa7vfygh2FELkKf3BfywpwXu2Um5uTtK+SAqYj0IDq+b/Xrb7oI
 5dGNSLHtLrEXjqqZz1zw2W6ULWnIOeJB4ivMyNZ8KYShmdvLnH1V1G/HhKBlKuK6XVDz
 9zkbbXsLiRyypHS5Fpu/fnu2clDInBSGYRf4mCStZhsm7rgl5ZquBMs3av5UvCM2x4ln
 rYyA==
X-Gm-Message-State: AO0yUKX8u+6/NCJ+Wt3Po+g1bzb0d73uYzjkK351pKFqY9gTD4vPG9qT
 HRlwynI+CTzySuJ9lj+cCI2UCCCdKPEC05+Wy/qmqw==
X-Google-Smtp-Source: AK7set+h9y0ng5LgzKXShf3Y4wYtAsssVdAFCoJci8G0/8ph3ML+M8GExaCDU6f4mbD27h4hxfSBO/K9If6ZzyjyRx8=
X-Received: by 2002:a17:906:cc88:b0:878:4a24:1a5c with SMTP id
 oq8-20020a170906cc8800b008784a241a5cmr1976811ejb.6.1676505483962; Wed, 15 Feb
 2023 15:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-7-debug@rivosinc.com>
 <172dbd60-55f4-6f2c-5d90-84d07851429d@linux.alibaba.com>
In-Reply-To: <172dbd60-55f4-6f2c-5d90-84d07851429d@linux.alibaba.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 15:57:44 -0800
Message-ID: <CAKC1njQ=P9XwyA5-jJ4__zKPrFtSREwkEGnoTMTeSMV2yF5s3w@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 6/9] target/riscv: MMU changes for back
 cfi's shadow stack
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, 
 Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=debug@rivosinc.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 15 Feb 2023 23:58:10 -0000

`On Wed, Feb 15, 2023 at 12:43 AM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
>
> On 2023/2/9 14:24, Deepak Gupta wrote:
> > zisslpcfi protects returns(back cfi) using shadow stack. If compiled with
> > enabled compiler, function prologs will have `sspush ra` instruction to
> > push return address on shadow stack and function epilogs will have
> > `sspop t0; sschckra` instruction sequences. `sspop t0` will pop the
> > value from top of the shadow stack in t0. `sschckra` will compare `t0`
> > and `x1` and if they don't match then hart will raise an illegal
> > instruction exception.
> >
> > Shadow stack is read-only memory except stores can be performed via
> > `sspush` and `ssamoswap` instructions. This requires new PTE encoding for
> > shadow stack. zisslpcfi uses R=0, W=1, X=0 (an existing reserved encoding
> > ) to encode a shadow stack. If backward cfi is not enabled for current
> > mode, shadow stack PTE encodings remain reserved. Regular stores to
> > shadow stack raise AMO/store access fault. Shadow stack loads/stores on
> > regular memory raise load access/store access fault.
> >
> > This patch creates a new MMU TLB index for shadow stack and flushes TLB
> > for shadow stack on privileges changes. This patch doesn't implement
> > `Smepmp` related enforcement on shadow stack pmp entry. Reason being qemu
> > doesn't have `Smepmp` implementation yet.
> I don't know that the Smepmp means here. QEMU has supported the epmp.

https://github.com/riscv/riscv-tee/blob/main/Smepmp/Smepmp.pdf

> >   `Smepmp` enforcement should come
> > whenever it is implemented.
> >
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > Signed-off-by: Kip Walker  <kip@rivosinc.com>
> > ---
> >   target/riscv/cpu-param.h  |   1 +
> >   target/riscv/cpu.c        |   2 +
> >   target/riscv/cpu.h        |   3 ++
> >   target/riscv/cpu_helper.c | 107 +++++++++++++++++++++++++++++++-------
> >   4 files changed, 94 insertions(+), 19 deletions(-)
> >
> > diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
> > index ebaf26d26d..a1e379beb7 100644
> > --- a/target/riscv/cpu-param.h
> > +++ b/target/riscv/cpu-param.h
> > @@ -25,6 +25,7 @@
> >    *  - M mode 0b011
> >    *  - U mode HLV/HLVX/HSV 0b100
> >    *  - S mode HLV/HLVX/HSV 0b101
> > + *  - BCFI shadow stack   0b110
> >    *  - M mode HLV/HLVX/HSV 0b111
> >    */
> >   #define NB_MMU_MODES 8
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 6b4e90eb91..14cfb93288 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -584,6 +584,8 @@ static void riscv_cpu_reset_hold(Object *obj)
> >       }
> >       /* mmte is supposed to have pm.current hardwired to 1 */
> >       env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> > +    /* Initialize ss_priv to current priv. */
> > +    env->ss_priv = env->priv;
> >   #endif
> >       env->xl = riscv_cpu_mxl(env);
> >       riscv_cpu_update_mask(env);
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index d14ea4f91d..8803ea6426 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -379,6 +379,7 @@ struct CPUArchState {
> >       uint64_t sstateen[SMSTATEEN_MAX_COUNT];
> >       target_ulong senvcfg;
> >       uint64_t henvcfg;
> > +    target_ulong ss_priv;
> >   #endif
> >       target_ulong cur_pmmask;
> >       target_ulong cur_pmbase;
> > @@ -617,6 +618,8 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
> >   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> >   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
> >   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
> > +/* TLB MMU index for shadow stack accesses */
> > +#define MMU_IDX_SS_ACCESS    6
> >
> >   #include "exec/cpu-all.h"
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index fc188683c9..63377abc2f 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -657,7 +657,8 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
> >
> >   bool riscv_cpu_two_stage_lookup(int mmu_idx)
> >   {
> > -    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> > +    return (mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK) &&
> > +           (mmu_idx != MMU_IDX_SS_ACCESS);
> >   }
> >
> >   int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> > @@ -745,6 +746,38 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
> >        * preemptive context switch. As a result, do both.
> >        */
> >       env->load_res = -1;
> > +
> > +    if (cpu_get_bcfien(env) && (env->priv != env->ss_priv)) {
> > +        /*
> > +         * If backward CFI is enabled in the new privilege state, the
> > +         * shadow stack TLB needs to be flushed - unless the most recent
> > +         * use of the SS TLB was for the same privilege mode.
> > +         */
> > +        tlb_flush_by_mmuidx(env_cpu(env), 1 << MMU_IDX_SS_ACCESS);
> > +        /*
> > +         * Ignoring env->virt here since currently every time it flips,
> > +         * all TLBs are flushed anyway.
> > +         */
> > +        env->ss_priv = env->priv;
> > +    }
> > +}
> > +
> > +typedef enum {
> > +    SSTACK_NO,          /* Access is not for a shadow stack instruction */
> > +    SSTACK_YES,         /* Access is for a shadow stack instruction */
> > +    SSTACK_DC           /* Don't care about SS attribute in PMP */
> > +} SStackPmpMode;
> > +
> > +static bool legal_sstack_access(int access_type, bool sstack_inst,
> > +                                bool sstack_attribute)
> > +{
> > +    /*
> > +     * Read/write/execution permissions are checked as usual. Shadow
> > +     * stack enforcement is just that (1) instruction type must match
> > +     * the attribute unless (2) a non-SS load to an SS region.
> > +     */
> > +    return (sstack_inst == sstack_attribute) ||
> > +        ((access_type == MMU_DATA_LOAD) && sstack_attribute);
> >   }
> >
> >   /*
> > @@ -764,7 +797,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
> >   static int get_physical_address_pmp(CPURISCVState *env, int *prot,
> >                                       target_ulong *tlb_size, hwaddr addr,
> >                                       int size, MMUAccessType access_type,
> > -                                    int mode)
> > +                                    int mode, SStackPmpMode sstack)
> Why this parameter if you don't use it?
> >   {
> >       pmp_priv_t pmp_priv;
> >       int pmp_index = -1;
> > @@ -812,13 +845,16 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
> >    *               Second stage is used for hypervisor guest translation
> >    * @two_stage: Are we going to perform two stage translation
> >    * @is_debug: Is this access from a debugger or the monitor?
> > + * @sstack: Is this access for a shadow stack? Passed by reference so
> > +            it can be forced to SSTACK_DC when the SS check is completed
> > +            based on a PTE - so the PMP SS attribute will be ignored.
> >    */
> >   static int get_physical_address(CPURISCVState *env, hwaddr *physical,
> >                                   int *prot, target_ulong addr,
> >                                   target_ulong *fault_pte_addr,
> >                                   int access_type, int mmu_idx,
> >                                   bool first_stage, bool two_stage,
> > -                                bool is_debug)
> > +                                bool is_debug, SStackPmpMode *sstack)
> >   {
> >       /* NOTE: the env->pc value visible here will not be
> >        * correct, but the value visible to the exception handler
> > @@ -830,6 +866,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
> >       hwaddr ppn;
> >       RISCVCPU *cpu = env_archcpu(env);
> >       int napot_bits = 0;
> > +    bool is_sstack = (sstack != NULL) && (*sstack == SSTACK_YES);
> >       target_ulong napot_mask;
> >
> >       /*
> > @@ -851,6 +888,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
> >           if (get_field(env->mstatus, MSTATUS_MPRV)) {
> >               mode = get_field(env->mstatus, MSTATUS_MPP);
> >           }
> > +    } else if (mmu_idx == MMU_IDX_SS_ACCESS) {
> > +        mode = env->priv;
> >       }
> >
> >       if (first_stage == false) {
> > @@ -966,7 +1005,7 @@ restart:
> >               int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
> >                                                    base, NULL, MMU_DATA_LOAD,
> >                                                    mmu_idx, false, true,
> > -                                                 is_debug);
> > +                                                 is_debug, NULL);
> >
> >               if (vbase_ret != TRANSLATE_SUCCESS) {
> >                   if (fault_pte_addr) {
> > @@ -983,7 +1022,7 @@ restart:
> >           int pmp_prot;
> >           int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, pte_addr,
> >                                                  sizeof(target_ulong),
> > -                                               MMU_DATA_LOAD, PRV_S);
> > +                                               MMU_DATA_LOAD, PRV_S, SSTACK_NO);
> >           if (pmp_ret != TRANSLATE_SUCCESS) {
> >               return TRANSLATE_PMP_FAIL;
> >           }
> > @@ -1010,6 +1049,18 @@ restart:
> >               }
> >           }
> >
> > +        /*
> > +         * When backward CFI is enabled, the R=0, W=1, X=0 reserved encoding
> > +         * is used to mark Shadow Stack (SS) pages. If back CFI enabled, allow
> > +         * normal loads on SS pages, regular stores raise store access fault
> > +         * and avoid hitting the reserved-encoding case. Only shadow stack
> > +         * stores are allowed on SS pages. Shadow stack loads and stores on
> > +         * regular memory (non-SS) raise load and store/AMO access fault.
> > +         * Second stage translations don't participate in Shadow Stack.
> > +         */
> > +        bool sstack_page = (cpu_get_bcfien(env) && first_stage &&
> > +                            ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W));
> > +
> >           if (!(pte & PTE_V)) {
> >               /* Invalid PTE */
> >               return TRANSLATE_FAIL;
> > @@ -1021,7 +1072,7 @@ restart:
> >                   return TRANSLATE_FAIL;
> >               }
> >               base = ppn << PGSHIFT;
> > -        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
> > +        } else if (((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) && !sstack_page) {
> >               /* Reserved leaf PTE flags: PTE_W */
> >               return TRANSLATE_FAIL;
> >           } else if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
> > @@ -1038,16 +1089,21 @@ restart:
> >           } else if (ppn & ((1ULL << ptshift) - 1)) {
> >               /* Misaligned PPN */
> >               return TRANSLATE_FAIL;
> > -        } else if (access_type == MMU_DATA_LOAD && !((pte & PTE_R) ||
> > -                   ((pte & PTE_X) && mxr))) {
> > +        } else if (access_type == MMU_DATA_LOAD && !(((pte & PTE_R) ||
> > +                   sstack_page) || ((pte & PTE_X) && mxr))) {
> >               /* Read access check failed */
> >               return TRANSLATE_FAIL;
> > -        } else if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
> > +        } else if ((access_type == MMU_DATA_STORE && !is_sstack) &&
> > +                   !(pte & PTE_W)) {
> Why limit to !is_sstack? Even is_sstack, we should make sure
>
> (access_type == MMU_DATA_STORE && !(pte & PTE_W)
>
> fails.

As per spec if a shadow stack store happens to a memory which is not a
shadow stack memory then cpu must raise
access store fault. This failure here converts to a page fault.
TRANSLATE_PMP_FAIL is the one which converts to
access faults.  So this check here ensures that legacy behavior is
maintained i.e.
"all store accesses which are not shadow stack stores and if W is not
set then they convert to store page faults"

Few lines down there is a call to `legal_sstack_access` which actually
does the logic check of
"If a regular store happened on shadow stack memory, returns false"
"If a shadow stack access happened on regular memory, returns false"
And this check returns PMP_TRANSLATE_FAIL which converts to access faults.

On a very high level, shadow stack accesses (sspush/sspop/ssamoswap)
to regular memory result in access faults.
Regular store to shadow stack memory result in store/AMO access fault.
Regular load to shadow stack memory is allowed.

Let me know if this was clear.

> >               /* Write access check failed */
> >               return TRANSLATE_FAIL;
> >           } else if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
> >               /* Fetch access check failed */
> >               return TRANSLATE_FAIL;
> > +        } else if (!legal_sstack_access(access_type, is_sstack,
> > +                                        sstack_page)) {
> > +            /* Illegal combo of instruction type and page attribute */
> > +            return TRANSLATE_PMP_FAIL;
> Not sure about this. Does the cfi escape the pmp check?
> >           } else {
> >               /* if necessary, set accessed and dirty bits. */
> >               target_ulong updated_pte = pte | PTE_A |
> > @@ -1107,18 +1163,27 @@ restart:
> >                            ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
> >
> >               /* set permissions on the TLB entry */
> > -            if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> > +            if ((pte & PTE_R) || ((pte & PTE_X) && mxr) || sstack_page) {
>
> I see that we should add the PAGE_READ for sstack_page, such as for a
> no-SS load.

I didn't get this comment. Can you clarify a bit more?

>
> Zhiwei
>
> >                   *prot |= PAGE_READ;
> >               }
> >               if ((pte & PTE_X)) {
> >                   *prot |= PAGE_EXEC;
> >               }
> > -            /* add write permission on stores or if the page is already dirty,
> > -               so that we TLB miss on later writes to update the dirty bit */
> > +            /*
> > +             * add write permission on stores or if the page is already dirty,
> > +             * so that we TLB miss on later writes to update the dirty bit
> > +             */
> >               if ((pte & PTE_W) &&
> >                       (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
> >                   *prot |= PAGE_WRITE;
> >               }
> > +            if (sstack) {
> > +                /*
> > +                 * Tell the caller to skip the SS bit in the PMP since we
> > +                 * resolved the attributes via the page table.
> > +                 */
> > +                *sstack = SSTACK_DC;
> > +            }
> >               return TRANSLATE_SUCCESS;
> >           }
> >       }
> > @@ -1190,13 +1255,13 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> >       int mmu_idx = cpu_mmu_index(&cpu->env, false);
> >
> >       if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
> > -                             true, riscv_cpu_virt_enabled(env), true)) {
> > +                             true, riscv_cpu_virt_enabled(env), true, NULL)) {
> >           return -1;
> >       }
> >
> >       if (riscv_cpu_virt_enabled(env)) {
> >           if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
> > -                                 0, mmu_idx, false, true, true)) {
> > +                                 0, mmu_idx, false, true, true, NULL)) {
> >               return -1;
> >           }
> >       }
> > @@ -1291,6 +1356,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >       bool two_stage_indirect_error = false;
> >       int ret = TRANSLATE_FAIL;
> >       int mode = mmu_idx;
> > +    bool sstack = (mmu_idx == MMU_IDX_SS_ACCESS);
> > +    SStackPmpMode ssmode = sstack ? SSTACK_YES : SSTACK_NO;
> >       /* default TLB page size */
> >       target_ulong tlb_size = TARGET_PAGE_SIZE;
> >
> > @@ -1318,7 +1385,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >           /* Two stage lookup */
> >           ret = get_physical_address(env, &pa, &prot, address,
> >                                      &env->guest_phys_fault_addr, access_type,
> > -                                   mmu_idx, true, true, false);
> > +                                   mmu_idx, true, true, false, &ssmode);
> >
> >           /*
> >            * A G-stage exception may be triggered during two state lookup.
> > @@ -1342,7 +1409,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >
> >               ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
> >                                          access_type, mmu_idx, false, true,
> > -                                       false);
> > +                                       false, NULL);
> >
> >               qemu_log_mask(CPU_LOG_MMU,
> >                       "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
> > @@ -1353,7 +1420,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >
> >               if (ret == TRANSLATE_SUCCESS) {
> >                   ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> > -                                               size, access_type, mode);
> > +                                               size, access_type, mode,
> > +                                               SSTACK_NO);
> >
> >                   qemu_log_mask(CPU_LOG_MMU,
> >                                 "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
> > @@ -1377,7 +1445,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >       } else {
> >           /* Single stage lookup */
> >           ret = get_physical_address(env, &pa, &prot, address, NULL,
> > -                                   access_type, mmu_idx, true, false, false);
> > +                                   access_type, mmu_idx, true, false,
> > +                                   false, &ssmode);
> >
> >           qemu_log_mask(CPU_LOG_MMU,
> >                         "%s address=%" VADDR_PRIx " ret %d physical "
> > @@ -1386,7 +1455,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >
> >           if (ret == TRANSLATE_SUCCESS) {
> >               ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> > -                                           size, access_type, mode);
> > +                                           size, access_type, mode, ssmode);
> >
> >               qemu_log_mask(CPU_LOG_MMU,
> >                             "%s PMP address=" HWADDR_FMT_plx " ret %d prot"

