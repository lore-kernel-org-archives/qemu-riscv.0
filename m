Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm5eR-0000fV-KF
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5eM-0000f2-Qy; Tue, 11 Apr 2023 00:30:36 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5eK-0003Sc-Pj; Tue, 11 Apr 2023 00:30:34 -0400
Received: by mail-ua1-x935.google.com with SMTP id ba16so4747404uab.4;
 Mon, 10 Apr 2023 21:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681187430; x=1683779430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zez0jlLHsXJR3aS7cVReFdg1SBX/dB9n/Xqt1jMOJbw=;
 b=D4CsN2WEFqNpJM6qAZsdYJibJ7CKlGkId8bkR/D5uuRRAKGeyF/ahleUR3WJ5XRmit
 MgRAfr3c3oKJbKaBwR7cX9tQRK4LD4t1NA0Xpu9kkHBYKL11g+Uk+nOyna4VMYG1YPPN
 5k5AvzTUHVlfKD03XebY+A/XmAxtnPVJFoC+BlpzSIJrRRfI+xnmQpC+PG8XRb/9TnMW
 HE1Me860UPwqBWBPgTlZSjr2UU3yox/tO2aBYWHkP5ETK2jp3edNkD+p73or11CX+x9p
 vtQ++eRgl6nIcm0354vpA+D0LC4f1KD7h9k+IuNsTb1Hca14KPQ5LXsuFNdxV90/Tkhc
 j2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681187430; x=1683779430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zez0jlLHsXJR3aS7cVReFdg1SBX/dB9n/Xqt1jMOJbw=;
 b=6NaIBFaGxrou6lQsa3F9QjRnPHCdf38sz2a8leARv1VkJ4LsEYrKQmW8fIgq6Iy2HQ
 5oz3FAVQTaIFOFHcb/E6IgjAXjJi8F/hJvNpl9xG9jkhve0k/akyX7vARhZJW9YuKfP3
 f6P2Y6ucJthzlyRsH5wEdYweBV1LKTwDCRFZY9TuvlfzuwUE0ArBS01mCua3Emr3xRSf
 SvPoN1mmVFNz0Onnom3GRjMFvxxmS2XRU1vDOGsL1Ez1CeuYpoli3cBtdfNaCHNvEENQ
 6HcSwofKA7KuKHBUMpN27srKbdwA5siKyzSPoJFiECkvA+nZbOMSnk+uabztAL9di4Q5
 giiw==
X-Gm-Message-State: AAQBX9e5HBlFGGCZKr240lEPryVuo8AUL5oR6MWBAkgC40nEv2CFIQqK
 pSFOKrnlJWYxkaX/FZ5qkWiVZyXJXSOEyjQe4fA=
X-Google-Smtp-Source: AKy350ZKzsPianDCfjm5VzhJOMWy2MFahXo8t/tncBso8DLVOP9MNT3KHWSHR4SNkF0AYVBI8rco63+6kf/lL+z8gC0=
X-Received: by 2002:a1f:1d47:0:b0:43c:3dd6:5535 with SMTP id
 d68-20020a1f1d47000000b0043c3dd65535mr7093277vkd.0.1681187430086; Mon, 10 Apr
 2023 21:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-21-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-21-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:30:04 +1000
Message-ID: <CAKmqyKMmhY6GGVy00N1Q1yxZjieWacL83RqLotVgXsqyQ6CMHg@mail.gmail.com>
Subject: Re: [PATCH v6 20/25] target/riscv: Move leaf pte processing out of
 level loop
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 04:30:38 -0000

On Sun, Mar 26, 2023 at 2:03=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the code that never loops outside of the loop.
> Unchain the if-return-else statements.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 234 +++++++++++++++++++++-----------------
>  1 file changed, 127 insertions(+), 107 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 00f70a3dd5..ce12dcec1d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -879,6 +879,8 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>      }
>
>      int ptshift =3D (levels - 1) * ptidxbits;
> +    target_ulong pte;
> +    hwaddr pte_addr;
>      int i;
>
>  #if !TCG_OVERSIZED_GUEST
> @@ -895,7 +897,6 @@ restart:
>          }
>
>          /* check that physical address of PTE is legal */
> -        hwaddr pte_addr;
>
>          if (two_stage && first_stage) {
>              int vbase_prot;
> @@ -927,7 +928,6 @@ restart:
>              return TRANSLATE_PMP_FAIL;
>          }
>
> -        target_ulong pte;
>          if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
>              pte =3D address_space_ldl(cs->as, pte_addr, attrs, &res);
>          } else {
> @@ -952,120 +952,140 @@ restart:
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
> -        } else if (!pbmte && (pte & PTE_PBMT)) {
> +        }
> +        if (pte & (PTE_R | PTE_W | PTE_X)) {
> +            goto leaf;
> +        }
> +
> +        /* Inner PTE, continue walking */
> +        if (pte & (PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
>              return TRANSLATE_FAIL;
> -        } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
> -            /* Inner PTE, continue walking */
> -            if (pte & (PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
> -                return TRANSLATE_FAIL;
> -            }
> -            base =3D ppn << PGSHIFT;
> -        } else if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D PTE_W) {
> -            /* Reserved leaf PTE flags: PTE_W */
> -            return TRANSLATE_FAIL;
> -        } else if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D (PTE_W | PTE_X=
)) {
> -            /* Reserved leaf PTE flags: PTE_W + PTE_X */
> -            return TRANSLATE_FAIL;
> -        } else if ((pte & PTE_U) && ((mode !=3D PRV_U) &&
> -                   (!sum || access_type =3D=3D MMU_INST_FETCH))) {
> -            /* User PTE flags when not U mode and mstatus.SUM is not set=
,
> -               or the access type is an instruction fetch */
> -            return TRANSLATE_FAIL;
> -        } else if (!(pte & PTE_U) && (mode !=3D PRV_S)) {
> -            /* Supervisor PTE flags when not S mode */
> -            return TRANSLATE_FAIL;
> -        } else if (ppn & ((1ULL << ptshift) - 1)) {
> -            /* Misaligned PPN */
> -            return TRANSLATE_FAIL;
> -        } else if (access_type =3D=3D MMU_DATA_LOAD && !((pte & PTE_R) |=
|
> -                   ((pte & PTE_X) && mxr))) {
> -            /* Read access check failed */
> -            return TRANSLATE_FAIL;
> -        } else if (access_type =3D=3D MMU_DATA_STORE && !(pte & PTE_W)) =
{
> -            /* Write access check failed */
> -            return TRANSLATE_FAIL;
> -        } else if (access_type =3D=3D MMU_INST_FETCH && !(pte & PTE_X)) =
{
> -            /* Fetch access check failed */
> -            return TRANSLATE_FAIL;
> -        } else {
> -            /* if necessary, set accessed and dirty bits. */
> -            target_ulong updated_pte =3D pte | PTE_A |
> +        }
> +        base =3D ppn << PGSHIFT;
> +    }
> +
> +    /* No leaf pte at any translation level. */
> +    return TRANSLATE_FAIL;
> +
> + leaf:
> +    if (ppn & ((1ULL << ptshift) - 1)) {
> +        /* Misaligned PPN */
> +        return TRANSLATE_FAIL;
> +    }
> +    if (!pbmte && (pte & PTE_PBMT)) {
> +        /* Reserved without Svpbmt. */
> +        return TRANSLATE_FAIL;
> +    }
> +    if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D PTE_W) {
> +        /* Reserved leaf PTE flags: PTE_W */
> +        return TRANSLATE_FAIL;
> +    }
> +    if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D (PTE_W | PTE_X)) {
> +        /* Reserved leaf PTE flags: PTE_W + PTE_X */
> +        return TRANSLATE_FAIL;
> +    }
> +    if ((pte & PTE_U) &&
> +        ((mode !=3D PRV_U) && (!sum || access_type =3D=3D MMU_INST_FETCH=
))) {
> +        /*
> +         * User PTE flags when not U mode and mstatus.SUM is not set,
> +         * or the access type is an instruction fetch.
> +         */
> +        return TRANSLATE_FAIL;
> +    }
> +    if (!(pte & PTE_U) && (mode !=3D PRV_S)) {
> +        /* Supervisor PTE flags when not S mode */
> +        return TRANSLATE_FAIL;
> +    }
> +    if (access_type =3D=3D MMU_DATA_LOAD &&
> +        !((pte & PTE_R) || ((pte & PTE_X) && mxr))) {
> +        /* Read access check failed */
> +        return TRANSLATE_FAIL;
> +    }
> +    if (access_type =3D=3D MMU_DATA_STORE && !(pte & PTE_W)) {
> +        /* Write access check failed */
> +        return TRANSLATE_FAIL;
> +    }
> +    if (access_type =3D=3D MMU_INST_FETCH && !(pte & PTE_X)) {
> +        /* Fetch access check failed */
> +        return TRANSLATE_FAIL;
> +    }
> +
> +    /* If necessary, set accessed and dirty bits. */
> +    target_ulong updated_pte =3D pte | PTE_A |
>                  (access_type =3D=3D MMU_DATA_STORE ? PTE_D : 0);
>
> -            /* Page table updates need to be atomic with MTTCG enabled *=
/
> -            if (updated_pte !=3D pte) {
> -                if (!hade) {
> -                    return TRANSLATE_FAIL;
> -                }
> +    /* Page table updates need to be atomic with MTTCG enabled */
> +    if (updated_pte !=3D pte) {
> +        if (!hade) {
> +            return TRANSLATE_FAIL;
> +        }
>
> -                /*
> -                 * - if accessed or dirty bits need updating, and the PT=
E is
> -                 *   in RAM, then we do so atomically with a compare and=
 swap.
> -                 * - if the PTE is in IO space or ROM, then it can't be =
updated
> -                 *   and we return TRANSLATE_FAIL.
> -                 * - if the PTE changed by the time we went to update it=
, then
> -                 *   it is no longer valid and we must re-walk the page =
table.
> -                 */
> -                MemoryRegion *mr;
> -                hwaddr l =3D sizeof(target_ulong), addr1;
> -                mr =3D address_space_translate(cs->as, pte_addr,
> -                    &addr1, &l, false, MEMTXATTRS_UNSPECIFIED);
> -                if (memory_region_is_ram(mr)) {
> -                    target_ulong *pte_pa =3D
> -                        qemu_map_ram_ptr(mr->ram_block, addr1);
> +        /*
> +         * - if accessed or dirty bits need updating, and the PTE is
> +         *   in RAM, then we do so atomically with a compare and swap.
> +         * - if the PTE is in IO space or ROM, then it can't be updated
> +         *   and we return TRANSLATE_FAIL.
> +         * - if the PTE changed by the time we went to update it, then
> +         *   it is no longer valid and we must re-walk the page table.
> +         */
> +        MemoryRegion *mr;
> +        hwaddr l =3D sizeof(target_ulong), addr1;
> +        mr =3D address_space_translate(cs->as, pte_addr, &addr1, &l, fal=
se,
> +                                     MEMTXATTRS_UNSPECIFIED);
> +        if (memory_region_is_ram(mr)) {
> +            target_ulong *pte_pa =3D qemu_map_ram_ptr(mr->ram_block, add=
r1);
>  #if TCG_OVERSIZED_GUEST
> -                    /* MTTCG is not enabled on oversized TCG guests so
> -                     * page table updates do not need to be atomic */
> -                    *pte_pa =3D pte =3D updated_pte;
> +            /*
> +             * MTTCG is not enabled on oversized TCG guests so
> +             * page table updates do not need to be atomic.
> +             */
> +            *pte_pa =3D pte =3D updated_pte;
>  #else
> -                    target_ulong old_pte =3D
> -                        qatomic_cmpxchg(pte_pa, pte, updated_pte);
> -                    if (old_pte !=3D pte) {
> -                        goto restart;
> -                    } else {
> -                        pte =3D updated_pte;
> -                    }
> +            target_ulong old_pte =3D qatomic_cmpxchg(pte_pa, pte, update=
d_pte);
> +            if (old_pte !=3D pte) {
> +                goto restart;
> +            }
> +            pte =3D updated_pte;
>  #endif
> -                } else {
> -                    /* misconfigured PTE in ROM (AD bits are not preset)=
 or
> -                     * PTE is in IO space and can't be updated atomicall=
y */
> -                    return TRANSLATE_FAIL;
> -                }
> -            }
> -
> -            /* for superpage mappings, make a fake leaf PTE for the TLB'=
s
> -               benefit. */
> -            target_ulong vpn =3D addr >> PGSHIFT;
> -
> -            if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
> -                napot_bits =3D ctzl(ppn) + 1;
> -                if ((i !=3D (levels - 1)) || (napot_bits !=3D 4)) {
> -                    return TRANSLATE_FAIL;
> -                }
> -            }
> -
> -            napot_mask =3D (1 << napot_bits) - 1;
> -            *physical =3D (((ppn & ~napot_mask) | (vpn & napot_mask) |
> -                          (vpn & (((target_ulong)1 << ptshift) - 1))
> -                         ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
> -
> -            /* set permissions on the TLB entry */
> -            if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> -                *prot |=3D PAGE_READ;
> -            }
> -            if ((pte & PTE_X)) {
> -                *prot |=3D PAGE_EXEC;
> -            }
> -            /* add write permission on stores or if the page is already =
dirty,
> -               so that we TLB miss on later writes to update the dirty b=
it */
> -            if ((pte & PTE_W) &&
> -                    (access_type =3D=3D MMU_DATA_STORE || (pte & PTE_D))=
) {
> -                *prot |=3D PAGE_WRITE;
> -            }
> -            return TRANSLATE_SUCCESS;
> +        } else {
> +            /*
> +             * Misconfigured PTE in ROM (AD bits are not preset) or
> +             * PTE is in IO space and can't be updated atomically.
> +             */
> +            return TRANSLATE_FAIL;
>          }
>      }
> -    return TRANSLATE_FAIL;
> +
> +    /* For superpage mappings, make a fake leaf PTE for the TLB's benefi=
t. */
> +    target_ulong vpn =3D addr >> PGSHIFT;
> +
> +    if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
> +        napot_bits =3D ctzl(ppn) + 1;
> +        if ((i !=3D (levels - 1)) || (napot_bits !=3D 4)) {
> +            return TRANSLATE_FAIL;
> +        }
> +    }
> +
> +    napot_mask =3D (1 << napot_bits) - 1;
> +    *physical =3D (((ppn & ~napot_mask) | (vpn & napot_mask) |
> +                  (vpn & (((target_ulong)1 << ptshift) - 1))
> +                 ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
> +
> +    /* set permissions on the TLB entry */
> +    if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> +        *prot |=3D PAGE_READ;
> +    }
> +    if (pte & PTE_X) {
> +        *prot |=3D PAGE_EXEC;
> +    }
> +    /*
> +     * Add write permission on stores or if the page is already dirty,
> +     * so that we TLB miss on later writes to update the dirty bit.
> +     */
> +    if ((pte & PTE_W) && (access_type =3D=3D MMU_DATA_STORE || (pte & PT=
E_D))) {
> +        *prot |=3D PAGE_WRITE;
> +    }
> +    return TRANSLATE_SUCCESS;
>  }
>
>  static void raise_mmu_exception(CPURISCVState *env, target_ulong address=
,
> --
> 2.34.1
>
>

