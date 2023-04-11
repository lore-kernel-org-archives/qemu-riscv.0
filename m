Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3M2-0007P6-OF
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 22:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3M0-0007N2-9M; Mon, 10 Apr 2023 22:03:28 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Ly-0006w5-Aw; Mon, 10 Apr 2023 22:03:28 -0400
Received: by mail-ua1-x92f.google.com with SMTP id z23so4642421uav.8;
 Mon, 10 Apr 2023 19:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681178605; x=1683770605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKd5M9JLByYl6hyWfJ4f1LV397kr4rD2AQihZjQr6aY=;
 b=Py9W7S95F+LaFRm694z2Zbn/DQQJXh+TBZVkLvuoLuRLyxEtb1MraUIt5SAakrlsSP
 4FBSGbCAQDkNfQQI6NHC65qXZc0pA1IgMqIDXlKTQfOwaVA+fiT9WNasZrh2EskdOmgI
 0F5x36N5gk7nQXmFIF4YYHKZRi2/xQzQSMO361JccyPbyvwYEqNrr51DGuwIu3x66CxW
 akmND3i5hYiysJQiqbAXRgLaEeY0VFkLehL7iv9MbGtXIffOiCN3g39FRkT7pDMpp5+4
 vm7gGcnO7A3iRVE429F45Et3b4p05kdglXImsnwEdZyIHoBAzVqsuae8wl2TrkjZklhh
 /z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681178605; x=1683770605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pKd5M9JLByYl6hyWfJ4f1LV397kr4rD2AQihZjQr6aY=;
 b=bwAWHnlMTZ+G9dPBkcoAoeL3ZP7r7Vq6p+5Fpm78NawWOaCfmVFzhXe8lBGK7OWRtN
 /f2RRmeOjeVDK55xOHc6Hah2ce6Uds/+0Laz34bE/hDpgiSsmy2fZhNQlCzEB7iZuSzE
 oZVmAJReoNeReJGmmUFHRhs3/pfe17nodwcvahbCgRRfwFI1BU4wJ9adOf+li4c0Mwk/
 YAYwnCW5Ewj7Jd981t3tFp0KgrLxj2u1HG58UJc2HClT/nWOBz9l7532DlyFgvLr1JYK
 zZcUVWMHEneDZHVLNHD7hKd5nZ2OTi/SuKTsynurYUUEFluutT5LC92ByH2sVtwyiGOU
 z7ew==
X-Gm-Message-State: AAQBX9cEN2b2Tbm69iuzM4eRqx29cE9YE6STJmFAU/5j9qUfk23912RZ
 kgH6D7tr0K8d8V9chp3UqCY3Nz9pQRlzU6SKgFw=
X-Google-Smtp-Source: AKy350apon8c9o0nc56J70b3yhAy6NdU1GlHB7nN0CyFgYAXPVFYLPkhmc8tUIIMwzpH99HopY+oPUSdzad0/+7BvoY=
X-Received: by 2002:ab0:5b8c:0:b0:765:c225:c914 with SMTP id
 y12-20020ab05b8c000000b00765c225c914mr7869136uae.1.1681178604693; Mon, 10 Apr
 2023 19:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-5-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-5-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 12:02:58 +1000
Message-ID: <CAKmqyKNL4T0K+izrvmwXKwZVdiTrcY3ZqnozwmDPyjRnMuvaJw@mail.gmail.com>
Subject: Re: [PATCH v6 04/25] target/riscv: Remove mstatus_hs_{fs,
 vs} from tb_flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 02:03:28 -0000

On Sat, Mar 25, 2023 at 10:36=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Merge with mstatus_{fs,vs}.  We might perform a redundant
> assignment to one or the other field, but it's a trivial
> and saves 4 bits from TB_FLAGS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        | 16 +++++++---------
>  target/riscv/cpu_helper.c | 34 ++++++++++++++++------------------
>  target/riscv/translate.c  | 32 ++++++++++----------------------
>  3 files changed, 33 insertions(+), 49 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f787145a21..d9e0eaaf9b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -646,19 +646,17 @@ FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
>  FIELD(TB_FLAGS, VILL, 14, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
>  FIELD(TB_FLAGS, HLSX, 15, 1)
> -FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
> -FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
>  /* The combination of MXL/SXL/UXL that applies to the current cpu mode. =
*/
> -FIELD(TB_FLAGS, XL, 20, 2)
> +FIELD(TB_FLAGS, XL, 16, 2)
>  /* If PointerMasking should be applied */
> -FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
> -FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
> -FIELD(TB_FLAGS, VTA, 24, 1)
> -FIELD(TB_FLAGS, VMA, 25, 1)
> +FIELD(TB_FLAGS, PM_MASK_ENABLED, 18, 1)
> +FIELD(TB_FLAGS, PM_BASE_ENABLED, 19, 1)
> +FIELD(TB_FLAGS, VTA, 20, 1)
> +FIELD(TB_FLAGS, VMA, 21, 1)
>  /* Native debug itrigger */
> -FIELD(TB_FLAGS, ITRIGGER, 26, 1)
> +FIELD(TB_FLAGS, ITRIGGER, 22, 1)
>  /* Virtual mode enabled */
> -FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
> +FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1e7ee9aa30..4fdd6fe021 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -45,7 +45,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
>  {
>      CPUState *cs =3D env_cpu(env);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> -
> +    RISCVExtStatus fs, vs;
>      uint32_t flags =3D 0;
>
>      *pc =3D env->xl =3D=3D MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
> @@ -79,18 +79,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
>      }
>
>  #ifdef CONFIG_USER_ONLY
> -    flags =3D FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
> -    flags =3D FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
> +    fs =3D EXT_STATUS_DIRTY;
> +    vs =3D EXT_STATUS_DIRTY;
>  #else
>      flags |=3D cpu_mmu_index(env, 0);
> -    if (riscv_cpu_fp_enabled(env)) {
> -        flags =3D  FIELD_DP32(flags, TB_FLAGS, FS,
> -                            get_field(env->mstatus,  MSTATUS_FS));
> -    }
> -    if (riscv_cpu_vector_enabled(env)) {
> -        flags =3D  FIELD_DP32(flags, TB_FLAGS, VS,
> -                            get_field(env->mstatus, MSTATUS_VS));
> -    }
> +    fs =3D get_field(env->mstatus, MSTATUS_FS);
> +    vs =3D get_field(env->mstatus, MSTATUS_VS);
>
>      if (riscv_has_ext(env, RVH)) {
>          if (env->priv =3D=3D PRV_M ||
> @@ -100,19 +94,23 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target=
_ulong *pc,
>              flags =3D FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>          }
>
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
> -                           get_field(env->mstatus_hs, MSTATUS_FS));
> -
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
> -                           get_field(env->mstatus_hs, MSTATUS_VS));
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED,
> -                           get_field(env->virt, VIRT_ONOFF));
> +        if (riscv_cpu_virt_enabled(env)) {
> +            flags =3D FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
> +            /*
> +             * Merge DISABLED and !DIRTY states using MIN.
> +             * We will set both fields when dirtying.
> +             */
> +            fs =3D MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
> +            vs =3D MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
> +        }
>      }
>      if (cpu->cfg.debug && !icount_enabled()) {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_en=
abled);
>      }
>  #endif
>
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, FS, fs);
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);
>      flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
>      if (env->cur_pmmask < (env->xl =3D=3D MXL_RV32 ? UINT32_MAX : UINT64=
_MAX)) {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b897bf6006..74d0b9889d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -66,8 +66,6 @@ typedef struct DisasContext {
>      uint32_t opcode;
>      RISCVExtStatus mstatus_fs;
>      RISCVExtStatus mstatus_vs;
> -    RISCVExtStatus mstatus_hs_fs;
> -    RISCVExtStatus mstatus_hs_vs;
>      uint32_t mem_idx;
>      /* Remember the rounding mode encoded in the previous fp instruction=
,
>         which we have already installed into env->fp_status.  Or -1 for
> @@ -618,16 +616,12 @@ static void mark_fs_dirty(DisasContext *ctx)
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>          tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>          tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -    }
>
> -    if (ctx->virt_enabled && ctx->mstatus_hs_fs !=3D EXT_STATUS_DIRTY) {
> -        /* Remember the stage change for the rest of the TB. */
> -        ctx->mstatus_hs_fs =3D EXT_STATUS_DIRTY;
> -
> -        tmp =3D tcg_temp_new();
> -        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> -        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
> +        if (ctx->virt_enabled) {
> +            tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_=
hs));
> +            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> +            tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_=
hs));
> +        }
>      }
>  }
>  #else
> @@ -651,16 +645,12 @@ static void mark_vs_dirty(DisasContext *ctx)
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>          tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
>          tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -    }
>
> -    if (ctx->virt_enabled && ctx->mstatus_hs_vs !=3D EXT_STATUS_DIRTY) {
> -        /* Remember the stage change for the rest of the TB. */
> -        ctx->mstatus_hs_vs =3D EXT_STATUS_DIRTY;
> -
> -        tmp =3D tcg_temp_new();
> -        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
> -        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
> +        if (ctx->virt_enabled) {
> +            tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_=
hs));
> +            tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
> +            tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_=
hs));
> +        }
>      }
>  }
>  #else
> @@ -1158,8 +1148,6 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      ctx->misa_ext =3D env->misa_ext;
>      ctx->frm =3D -1;  /* unknown rounding mode */
>      ctx->cfg_ptr =3D &(cpu->cfg);
> -    ctx->mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS)=
;
> -    ctx->mstatus_hs_vs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS)=
;
>      ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
>      ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>      ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
> --
> 2.34.1
>
>

