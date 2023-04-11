Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm5DX-00019X-PA
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5DT-00018D-7I; Tue, 11 Apr 2023 00:02:48 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5DL-0006BG-JV; Tue, 11 Apr 2023 00:02:46 -0400
Received: by mail-ua1-x935.google.com with SMTP id a38so4053378uax.12;
 Mon, 10 Apr 2023 21:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681185757; x=1683777757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJzxAJkxWF/3m1WWYFGYJIxrPaFnB+bLpPQcm5Nrg/k=;
 b=bD9FFLfK56oHll/IZhvwrVrb3A0sIEYvVbNNT9Bxnf153TfUXaJTkC5NQuzYolkTIo
 5zu43rBqHrjGmhnHUcbn5PvWVP1rQf9N/7pDzX1FQ/KfSpuNFOPHaVcotZe6TC4fivEC
 oY7jOfLK3xxhsZY3nmmSewJvBHcSOnn9krzJ3b5jGfdzU3WkiyR1B5n24tvxa/vhCewh
 LsglL//x4bLGITJRIJwxnR4ruAuoKG1cQ1grXFkVAjxCZjhNrvkaAYdvQt4DAk7OPyDC
 52VJagZnfhFRcVbTIZO+55YMn7qbym6iOtGHd6sikWT0PVoF8yE/4kzkG3hoMWJzeBeC
 8ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681185757; x=1683777757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJzxAJkxWF/3m1WWYFGYJIxrPaFnB+bLpPQcm5Nrg/k=;
 b=i8mffgOxLRuYBXI+1sLsr86OQfN0Qp+WqXnuBf7A4fSGdDv8gQhoQ7IBZVfLZQEbWl
 xwt0rESkU3Hy4n9p6+J/mZKT3RFNB1tFWUIQVNKbdXTMbeVY451ibWSD8UasyG10K7nx
 V1M6GFcGKJd2Im5hqtPvgVwizMAAkVqe1v0W5faZAoDqLhfUYbs6/FbXEYrn07wlWvVL
 TTMhy3a5Mnhm7zvTaN9IPWf2PK0wezFodtdKp1JqBM1N09qE20F48TQeiMeiSffOCGMy
 0DqfKJkUrWh+NrtmdqBSDN/dfj/PwHISPLnnkmGzezxrV1bKtg4EWqcUHlkk1oYsnSyV
 TNOw==
X-Gm-Message-State: AAQBX9dTAYVDoWNBxlnu4E3MGAIPT1CbwU3zFYkKqAto3j2i6bebh6GR
 ubskvSf6iLZO3NwjlQ5hEiUtb2JvyjJe3QgU7cM=
X-Google-Smtp-Source: AKy350bs8G3hjyxugWemRP9/WbUi83TeaB+DuBRAvDDSEfJd0uVXgpnyI3n4ch9hj5qCB/ouu56AX0BegzuYbGH5ukI=
X-Received: by 2002:ab0:5b54:0:b0:68b:90f4:1d8c with SMTP id
 v20-20020ab05b54000000b0068b90f41d8cmr701126uae.1.1681185757323; Mon, 10 Apr
 2023 21:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-17-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-17-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:02:11 +1000
Message-ID: <CAKmqyKPu-VtEx__dWFA7m2OHpgRM_PmqcO+97X2SbpcJaU_Sow@mail.gmail.com>
Subject: Re: [PATCH v6 16/25] target/riscv: Set MMU_2STAGE_BIT in
 riscv_cpu_mmu_index
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
X-List-Received-Date: Tue, 11 Apr 2023 04:02:49 -0000

On Sat, Mar 25, 2023 at 9:58=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Incorporate the virt_enabled and MPV checks into the cpu_mmu_index
> function, so we don't have to keep doing it within tlb_fill and
> subroutines.  This also elides a flush on changes to MPV.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 50 +++++++++++++--------------------------
>  target/riscv/csr.c        |  6 +----
>  2 files changed, 18 insertions(+), 38 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 0adfd4a12b..6c42f9c6fd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -37,19 +37,21 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifet=
ch)
>  #ifdef CONFIG_USER_ONLY
>      return 0;
>  #else
> -    if (ifetch) {
> -        return env->priv;
> -    }
> +    bool virt =3D riscv_cpu_virt_enabled(env);
> +    int mode =3D env->priv;
>
>      /* All priv -> mmu_idx mapping are here */
> -    int mode =3D env->priv;
> -    if (mode =3D=3D PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
> -        mode =3D get_field(env->mstatus, MSTATUS_MPP);
> +    if (!ifetch) {
> +        if (mode =3D=3D PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) =
{
> +            mode =3D get_field(env->mstatus, MSTATUS_MPP);
> +            virt =3D get_field(env->mstatus, MSTATUS_MPV);
> +        }
> +        if (mode =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
> +            mode =3D MMUIdx_S_SUM;
> +        }
>      }
> -    if (mode =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
> -        return MMUIdx_S_SUM;
> -    }
> -    return mode;
> +
> +    return mode | (virt ? MMU_2STAGE_BIT : 0);
>  #endif
>  }
>
> @@ -1165,8 +1167,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, =
hwaddr physaddr,
>      }
>
>      env->badaddr =3D addr;
> -    env->two_stage_lookup =3D riscv_cpu_virt_enabled(env) ||
> -                            mmuidx_2stage(mmu_idx);
> +    env->two_stage_lookup =3D mmuidx_2stage(mmu_idx);
>      env->two_stage_indirect_lookup =3D false;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> @@ -1191,8 +1192,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, va=
ddr addr,
>          g_assert_not_reached();
>      }
>      env->badaddr =3D addr;
> -    env->two_stage_lookup =3D riscv_cpu_virt_enabled(env) ||
> -                            mmuidx_2stage(mmu_idx);
> +    env->two_stage_lookup =3D mmuidx_2stage(mmu_idx);
>      env->two_stage_indirect_lookup =3D false;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> @@ -1230,7 +1230,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>      int prot, prot2, prot_pmp;
>      bool pmp_violation =3D false;
>      bool first_stage_error =3D true;
> -    bool two_stage_lookup =3D false;
> +    bool two_stage_lookup =3D mmuidx_2stage(mmu_idx);
>      bool two_stage_indirect_error =3D false;
>      int ret =3D TRANSLATE_FAIL;
>      int mode =3D mmu_idx;
> @@ -1242,22 +1242,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr addres=
s, int size,
>      qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n=
",
>                    __func__, address, access_type, mmu_idx);
>
> -    /* MPRV does not affect the virtual-machine load/store
> -       instructions, HLV, HLVX, and HSV. */
> -    if (mmuidx_2stage(mmu_idx)) {
> -        ;
> -    } else if (mode =3D=3D PRV_M && access_type !=3D MMU_INST_FETCH &&
> -               get_field(env->mstatus, MSTATUS_MPRV)) {
> -        mode =3D get_field(env->mstatus, MSTATUS_MPP);
> -        if (riscv_has_ext(env, RVH) && get_field(env->mstatus, MSTATUS_M=
PV)) {
> -            two_stage_lookup =3D true;
> -        }
> -    }
> -
>      pmu_tlb_fill_incr_ctr(cpu, access_type);
> -    if (riscv_cpu_virt_enabled(env) ||
> -        ((mmuidx_2stage(mmu_idx) || two_stage_lookup) &&
> -         access_type !=3D MMU_INST_FETCH)) {
> +    if (two_stage_lookup) {
>          /* Two stage lookup */
>          ret =3D get_physical_address(env, &pa, &prot, address,
>                                     &env->guest_phys_fault_addr, access_t=
ype,
> @@ -1352,9 +1338,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>          return false;
>      } else {
>          raise_mmu_exception(env, address, access_type, pmp_violation,
> -                            first_stage_error,
> -                            riscv_cpu_virt_enabled(env) ||
> -                                mmuidx_2stage(mmu_idx),
> +                            first_stage_error, two_stage_lookup,
>                              two_stage_indirect_error);
>          cpu_loop_exit_restore(cs, retaddr);
>      }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index b79758a606..1b635373c6 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1246,7 +1246,7 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
>      RISCVMXL xl =3D riscv_cpu_mxl(env);
>
>      /* flush tlb on mstatus fields that affect VM */
> -    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
> +    if ((val ^ mstatus) & MSTATUS_MXR) {
>          tlb_flush(env_cpu(env));
>      }
>      mask =3D MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
> @@ -1294,10 +1294,6 @@ static RISCVException write_mstatush(CPURISCVState=
 *env, int csrno,
>      uint64_t valh =3D (uint64_t)val << 32;
>      uint64_t mask =3D MSTATUS_MPV | MSTATUS_GVA;
>
> -    if ((valh ^ env->mstatus) & (MSTATUS_MPV)) {
> -        tlb_flush(env_cpu(env));
> -    }
> -
>      env->mstatus =3D (env->mstatus & ~mask) | (valh & mask);
>
>      return RISCV_EXCP_NONE;
> --
> 2.34.1
>
>

