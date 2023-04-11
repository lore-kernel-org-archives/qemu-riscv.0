Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm4mr-0000UL-0l
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4mp-0000Tk-1j; Mon, 10 Apr 2023 23:35:15 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4mm-0008L1-7Z; Mon, 10 Apr 2023 23:35:14 -0400
Received: by mail-ua1-x932.google.com with SMTP id k20so4779711ual.2;
 Mon, 10 Apr 2023 20:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681184110; x=1683776110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NM7k0UOe6sIU6ofN9Jk6LaET4jDP9WxOrKZp5/pq2JI=;
 b=iktRrxPZINGvDLncjSLUkKUaRa5w9U4t525dhOBw16v/GVP6yqfQhpw3vj3zoluG5g
 IQoSenMRoD+5LW5TF/GYiN7YtLwxsZYPSJ528lzs8ufHM838dwHeH1v1eh+DG/m7RobH
 c7pG+b6+62kvWZoXR+7HTGFaJmBEZ7WRF2WjqrpxVGqqbugjehDQLOKPJ9qPWRUz7d7E
 vQjMpwiuBAa55Hu2StotVXVEVhQPmshMU0kJeiaLyXTgFQPfVpUsQBdZhxoi7GxQ5tF7
 o9aW9fArQAm67A7GqLnX6Lo0Q+HwfFPb1U+gs0b8iDIAxG53oPTcUuKec7IlOtAUwDGZ
 howg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681184110; x=1683776110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NM7k0UOe6sIU6ofN9Jk6LaET4jDP9WxOrKZp5/pq2JI=;
 b=Sm9rd6RghrCWvbgzGOT2+cQNTOinaX9lHPzjmuJG3U+ELo0qDU/XfXEG5hNONyBkUY
 TleMBpghmitDEzflHQCKsBqEOCy07SnDPft6FDc+vYIkaBaccxJZbkTWIYV+LeBy6fUi
 ytSG+YkH9brcVjF2TDze6DZtCvnfIlWV5L8Nnsn+SiWryEToSVcSRb67SQY30pYqflrv
 shquCuxUuWlihgXPaGY825C+KfBKdFMGwhzM+paL/SL4k7NlsVruG6zeFxxamxbf+FTw
 Fj1McqfRqmla9K9QqPLNppcelwzra908y5rK3K3OwJShQ6JPXtAkhB+q1aS8TTmCJXMt
 KBRA==
X-Gm-Message-State: AAQBX9f+d09zCieGwFE/EQv3AEJxBuVSc29iKr1qwv/VJ+f3f++cLtBY
 1FZQylQ1Q/n8bFwb1QSjanKORsSnEVaHdVD6wPw=
X-Google-Smtp-Source: AKy350YcMbCH7a7Y1aOhXWKoLZjk0Hwm2RiY38Z1Uq8AqTSnRWVaoo9sbfLoVWGfAZ1DcXX5qAu7iyRLtI5/7+lgY4w=
X-Received: by 2002:a1f:2489:0:b0:43b:ff63:e79a with SMTP id
 k131-20020a1f2489000000b0043bff63e79amr711571vkk.0.1681184110171; Mon, 10 Apr
 2023 20:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-11-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-11-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 13:34:44 +1000
Message-ID: <CAKmqyKO=aiE_hnEhQtLzic+hkQufa=q_2Lw-S5gBz9dWdpzwyw@mail.gmail.com>
Subject: Re: [PATCH v6 10/25] target/riscv: Handle HLV, HSV via helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 03:35:15 -0000

On Sat, Mar 25, 2023 at 9:53=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement these instructions via helpers, in expectation
> of determining the mmu_idx to use at runtime.  This allows
> the permission check to also be moved out of line, which
> allows HLSX to be removed from TB_FLAGS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      |   6 +-
>  target/riscv/helper.h                   |  12 ++-
>  target/riscv/cpu_helper.c               |  26 ++---
>  target/riscv/op_helper.c                |  99 +++++++++++++++--
>  target/riscv/translate.c                |   2 -
>  target/riscv/insn_trans/trans_rvh.c.inc | 135 ++++++++++--------------
>  6 files changed, 169 insertions(+), 111 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5e589db106..f03ff1f10c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -641,8 +641,7 @@ FIELD(TB_FLAGS, LMUL, 7, 3)
>  FIELD(TB_FLAGS, SEW, 10, 3)
>  FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
>  FIELD(TB_FLAGS, VILL, 14, 1)
> -/* Is a Hypervisor instruction load/store allowed? */
> -FIELD(TB_FLAGS, HLSX, 15, 1)
> +FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
>  /* The combination of MXL/SXL/UXL that applies to the current cpu mode. =
*/
>  FIELD(TB_FLAGS, XL, 16, 2)
>  /* If PointerMasking should be applied */
> @@ -654,8 +653,7 @@ FIELD(TB_FLAGS, VMA, 21, 1)
>  FIELD(TB_FLAGS, ITRIGGER, 22, 1)
>  /* Virtual mode enabled */
>  FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
> -FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
> -FIELD(TB_FLAGS, PRIV, 25, 2)
> +FIELD(TB_FLAGS, PRIV, 24, 2)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 37b54e0991..be60bd1525 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -123,8 +123,16 @@ DEF_HELPER_1(itrigger_match, void, env)
>  #ifndef CONFIG_USER_ONLY
>  DEF_HELPER_1(hyp_tlb_flush, void, env)
>  DEF_HELPER_1(hyp_gvma_tlb_flush, void, env)
> -DEF_HELPER_2(hyp_hlvx_hu, tl, env, tl)
> -DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
> +DEF_HELPER_FLAGS_2(hyp_hlv_bu, TCG_CALL_NO_WG, tl, env, tl)
> +DEF_HELPER_FLAGS_2(hyp_hlv_hu, TCG_CALL_NO_WG, tl, env, tl)
> +DEF_HELPER_FLAGS_2(hyp_hlv_wu, TCG_CALL_NO_WG, tl, env, tl)
> +DEF_HELPER_FLAGS_2(hyp_hlv_d, TCG_CALL_NO_WG, tl, env, tl)
> +DEF_HELPER_FLAGS_2(hyp_hlvx_hu, TCG_CALL_NO_WG, tl, env, tl)
> +DEF_HELPER_FLAGS_2(hyp_hlvx_wu, TCG_CALL_NO_WG, tl, env, tl)
> +DEF_HELPER_FLAGS_3(hyp_hsv_b, TCG_CALL_NO_WG, void, env, tl, tl)
> +DEF_HELPER_FLAGS_3(hyp_hsv_h, TCG_CALL_NO_WG, void, env, tl, tl)
> +DEF_HELPER_FLAGS_3(hyp_hsv_w, TCG_CALL_NO_WG, void, env, tl, tl)
> +DEF_HELPER_FLAGS_3(hyp_hsv_d, TCG_CALL_NO_WG, void, env, tl, tl)
>  #endif
>
>  /* Vector functions */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 052fdd2d9d..9bb84be4e1 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -102,24 +102,16 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, targe=
t_ulong *pc,
>      fs =3D get_field(env->mstatus, MSTATUS_FS);
>      vs =3D get_field(env->mstatus, MSTATUS_VS);
>
> -    if (riscv_has_ext(env, RVH)) {
> -        if (env->priv =3D=3D PRV_M ||
> -            (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env)) ||
> -            (env->priv =3D=3D PRV_U && !riscv_cpu_virt_enabled(env) &&
> -                get_field(env->hstatus, HSTATUS_HU))) {
> -            flags =3D FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
> -        }
> -
> -        if (riscv_cpu_virt_enabled(env)) {
> -            flags =3D FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
> -            /*
> -             * Merge DISABLED and !DIRTY states using MIN.
> -             * We will set both fields when dirtying.
> -             */
> -            fs =3D MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
> -            vs =3D MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
> -        }
> +    if (riscv_cpu_virt_enabled(env)) {
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
> +        /*
> +         * Merge DISABLED and !DIRTY states using MIN.
> +         * We will set both fields when dirtying.
> +         */
> +        fs =3D MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
> +        vs =3D MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
>      }
> +
>      if (cpu->cfg.debug && !icount_enabled()) {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_en=
abled);
>      }
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index b2169a99ff..0f81645adf 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -427,6 +427,91 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
>      helper_hyp_tlb_flush(env);
>  }
>
> +static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
> +{
> +    if (env->priv =3D=3D PRV_M) {
> +        /* always allowed */
> +    } else if (riscv_cpu_virt_enabled(env)) {
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra=
);
> +    } else if (env->priv =3D=3D PRV_U && !get_field(env->hstatus, HSTATU=
S_HU)) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> +    }
> +
> +    return cpu_mmu_index(env, x) | MMU_HYP_ACCESS_BIT;
> +}
> +
> +target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
> +{
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, false, ra);
> +    MemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
> +
> +    return cpu_ldb_mmu(env, addr, oi, ra);
> +}
> +
> +target_ulong helper_hyp_hlv_hu(CPURISCVState *env, target_ulong addr)
> +{
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, false, ra);
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUW, mmu_idx);
> +
> +    return cpu_ldw_mmu(env, addr, oi, ra);
> +}
> +
> +target_ulong helper_hyp_hlv_wu(CPURISCVState *env, target_ulong addr)
> +{
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, false, ra);
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUL, mmu_idx);
> +
> +    return cpu_ldl_mmu(env, addr, oi, ra);
> +}
> +
> +target_ulong helper_hyp_hlv_d(CPURISCVState *env, target_ulong addr)
> +{
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, false, ra);
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUQ, mmu_idx);
> +
> +    return cpu_ldq_mmu(env, addr, oi, ra);
> +}
> +
> +void helper_hyp_hsv_b(CPURISCVState *env, target_ulong addr, target_ulon=
g val)
> +{
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, false, ra);
> +    MemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
> +
> +    cpu_stb_mmu(env, addr, val, oi, ra);
> +}
> +
> +void helper_hyp_hsv_h(CPURISCVState *env, target_ulong addr, target_ulon=
g val)
> +{
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, false, ra);
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUW, mmu_idx);
> +
> +    cpu_stw_mmu(env, addr, val, oi, ra);
> +}
> +
> +void helper_hyp_hsv_w(CPURISCVState *env, target_ulong addr, target_ulon=
g val)
> +{
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, false, ra);
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUL, mmu_idx);
> +
> +    cpu_stl_mmu(env, addr, val, oi, ra);
> +}
> +
> +void helper_hyp_hsv_d(CPURISCVState *env, target_ulong addr, target_ulon=
g val)
> +{
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, false, ra);
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUQ, mmu_idx);
> +
> +    cpu_stq_mmu(env, addr, val, oi, ra);
> +}
> +
>  /*
>   * TODO: These implementations are not quite correct.  They perform the
>   * access using execute permission just fine, but the final PMP check
> @@ -434,20 +519,22 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
>   * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
>   * which would imply that exact check in tlb_fill.
>   */
> -target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address=
)
> +target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong addr)
>  {
> -    int mmu_idx =3D cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, true, ra);
>      MemOpIdx oi =3D make_memop_idx(MO_TEUW, mmu_idx);
>
> -    return cpu_ldw_code_mmu(env, address, oi, GETPC());
> +    return cpu_ldw_code_mmu(env, addr, oi, GETPC());
>  }
>
> -target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address=
)
> +target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong addr)
>  {
> -    int mmu_idx =3D cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
> +    uintptr_t ra =3D GETPC();
> +    int mmu_idx =3D check_access_hlsv(env, true, ra);
>      MemOpIdx oi =3D make_memop_idx(MO_TEUL, mmu_idx);
>
> -    return cpu_ldl_code_mmu(env, address, oi, GETPC());
> +    return cpu_ldl_code_mmu(env, addr, oi, ra);
>  }
>
>  #endif /* !CONFIG_USER_ONLY */
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index abfc152553..5282588247 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -78,7 +78,6 @@ typedef struct DisasContext {
>      bool virt_inst_excp;
>      bool virt_enabled;
>      const RISCVCPUConfig *cfg_ptr;
> -    bool hlsx;
>      /* vector extension */
>      bool vill;
>      /*
> @@ -1150,7 +1149,6 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      ctx->misa_ext =3D env->misa_ext;
>      ctx->frm =3D -1;  /* unknown rounding mode */
>      ctx->cfg_ptr =3D &(cpu->cfg);
> -    ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
>      ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>      ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>      ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3)=
;
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_=
trans/trans_rvh.c.inc
> index 15842f4282..3e9322130f 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -16,156 +16,131 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#ifndef CONFIG_USER_ONLY
> -static bool check_access(DisasContext *ctx)
> -{
> -    if (!ctx->hlsx) {
> -        if (ctx->virt_enabled) {
> -            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
> -        } else {
> -            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
> -        }
> -        return false;
> -    }
> -    return true;
> -}
> -#endif
> -
> -static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
> -{
>  #ifdef CONFIG_USER_ONLY
> -    return false;
> +#define do_hlv(ctx, a, func)  false
> +#define do_hsv(ctx, a, func)  false
>  #else
> -    decode_save_opc(ctx);
> -    if (check_access(ctx)) {
> -        TCGv dest =3D dest_gpr(ctx, a->rd);
> -        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> -        int mem_idx =3D ctx->mem_idx | MMU_HYP_ACCESS_BIT;
> -        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
> -        gen_set_gpr(ctx, a->rd, dest);
> -    }
> -    return true;
> -#endif
> +static void gen_helper_hyp_hlv_b(TCGv r, TCGv_env e, TCGv a)
> +{
> +    gen_helper_hyp_hlv_bu(r, e, a);
> +    tcg_gen_ext8s_tl(r, r);
>  }
>
> +static void gen_helper_hyp_hlv_h(TCGv r, TCGv_env e, TCGv a)
> +{
> +    gen_helper_hyp_hlv_hu(r, e, a);
> +    tcg_gen_ext16s_tl(r, r);
> +}
> +
> +static void gen_helper_hyp_hlv_w(TCGv r, TCGv_env e, TCGv a)
> +{
> +    gen_helper_hyp_hlv_wu(r, e, a);
> +    tcg_gen_ext32s_tl(r, r);
> +}
> +
> +static bool do_hlv(DisasContext *ctx, arg_r2 *a,
> +                   void (*func)(TCGv, TCGv_env, TCGv))
> +{
> +    TCGv dest =3D dest_gpr(ctx, a->rd);
> +    TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    decode_save_opc(ctx);
> +    func(dest, cpu_env, addr);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool do_hsv(DisasContext *ctx, arg_r2_s *a,
> +                   void (*func)(TCGv_env, TCGv, TCGv))
> +{
> +    TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    decode_save_opc(ctx);
> +    func(cpu_env, addr, data);
> +    return true;
> +}
> +#endif /* CONFIG_USER_ONLY */
> +
>  static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hlv(ctx, a, MO_SB);
> +    return do_hlv(ctx, a, gen_helper_hyp_hlv_b);
>  }
>
>  static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hlv(ctx, a, MO_TESW);
> +    return do_hlv(ctx, a, gen_helper_hyp_hlv_h);
>  }
>
>  static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hlv(ctx, a, MO_TESL);
> +    return do_hlv(ctx, a, gen_helper_hyp_hlv_w);
>  }
>
>  static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hlv(ctx, a, MO_UB);
> +    return do_hlv(ctx, a, gen_helper_hyp_hlv_bu);
>  }
>
>  static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hlv(ctx, a, MO_TEUW);
> -}
> -
> -static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
> -{
> -#ifdef CONFIG_USER_ONLY
> -    return false;
> -#else
> -    decode_save_opc(ctx);
> -    if (check_access(ctx)) {
> -        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> -        TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
> -        int mem_idx =3D ctx->mem_idx | MMU_HYP_ACCESS_BIT;
> -        tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
> -    }
> -    return true;
> -#endif
> +    return do_hlv(ctx, a, gen_helper_hyp_hlv_hu);
>  }
>
>  static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hsv(ctx, a, MO_SB);
> +    return do_hsv(ctx, a, gen_helper_hyp_hsv_b);
>  }
>
>  static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hsv(ctx, a, MO_TESW);
> +    return do_hsv(ctx, a, gen_helper_hyp_hsv_h);
>  }
>
>  static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hsv(ctx, a, MO_TESL);
> +    return do_hsv(ctx, a, gen_helper_hyp_hsv_w);
>  }
>
>  static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hlv(ctx, a, MO_TEUL);
> +    return do_hlv(ctx, a, gen_helper_hyp_hlv_wu);
>  }
>
>  static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hlv(ctx, a, MO_TEUQ);
> +    return do_hlv(ctx, a, gen_helper_hyp_hlv_d);
>  }
>
>  static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hsv(ctx, a, MO_TEUQ);
> +    return do_hsv(ctx, a, gen_helper_hyp_hsv_d);
>  }
>
> -#ifndef CONFIG_USER_ONLY
> -static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
> -                    void (*func)(TCGv, TCGv_env, TCGv))
> -{
> -    decode_save_opc(ctx);
> -    if (check_access(ctx)) {
> -        TCGv dest =3D dest_gpr(ctx, a->rd);
> -        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> -        func(dest, cpu_env, addr);
> -        gen_set_gpr(ctx, a->rd, dest);
> -    }
> -    return true;
> -}
> -#endif
> -
>  static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
> -#else
> -    return false;
> -#endif
> +    return do_hlv(ctx, a, gen_helper_hyp_hlvx_hu);
>  }
>
>  static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_wu);
> -#else
> -    return false;
> -#endif
> +    return do_hlv(ctx, a, gen_helper_hyp_hlvx_wu);
>  }
>
>  static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
> --
> 2.34.1
>
>

