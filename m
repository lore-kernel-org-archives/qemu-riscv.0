Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOX8M-0002bq-I2
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:55:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nOX8K-0002bM-Rx; Sun, 27 Feb 2022 22:55:36 -0500
Received: from [2607:f8b0:4864:20::d33] (port=41869
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nOX8G-0000ZH-Db; Sun, 27 Feb 2022 22:55:35 -0500
Received: by mail-io1-xd33.google.com with SMTP id d19so13391757ioc.8;
 Sun, 27 Feb 2022 19:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bZOwe2tr1Bl6PTrAca3DbRW+BKJJ8mgPjLUUDFvV5q0=;
 b=ADmraMi63VOArzij9T5pikhcct/tUiqFP3sVY+B2ZP+cddLTGe5loqbHfCwQZyUYnl
 MV/KAbvvNYZpmO21smBqADeXja3uVq8NsAEX0bEzcUjdXf91yud8GzG4xkbRaKeR3Nv1
 07pTSywC2DBswRRJSJj6ooHEGmjB31Vw1i2gbhfm6rWFFQfDyvF6faENKk7E9WiFUhxb
 X914k9XoRu5jg3Pa3bil3jBY0FC1QxK1FogdYSn6C7G3vEO40/+iAlfKW5249S91exXL
 odjrLSCUbKN8UpTdzMw+YNZKq3wE7+DDHo3BHgltZd7KF+B1cVKHMH0srqVnR7MqdmHZ
 RHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bZOwe2tr1Bl6PTrAca3DbRW+BKJJ8mgPjLUUDFvV5q0=;
 b=MB9I5bgLFnVT6XC2wU+Ct2yl46LUlYRnK6rmm8Hs/3vXS521qhyWPlzCBJm2fQci7N
 HooOa8K4ZAdG3yAVDjA96UWTNg+Y7QxqcCttGyU9OOpYo7OHpZN539Ob+OAqrq2ccvjN
 PXjCLThsqyFVV+M9nMzWLxM6tEuNCjOtOXOK9yBuWjUVux5RM5+qdjpXPA+xJhMMR+k7
 37xzFYoMonkH/TT/4cSgyxZWZOSlfXuM7xatvIrxyQO55aYa2gnX4u2NhHCahSRsq9R3
 7kgig+cdHHHPO/kQBcWZ1u+u0wT9L6KG1vKQFXTKbUP9YAJ9De39kLv28zR0uB3oI6Kh
 C9lQ==
X-Gm-Message-State: AOAM530tJmzX/FhCsLv2nzmsBxAt0RC8hYV19Gs0hxRo1j/3RslNYWsC
 ofqeVrub/STUiNHnTTV8H79trbW8aLTadedeKEU=
X-Google-Smtp-Source: ABdhPJwl/2idf/K3vi7quaoSbz0O3WOi6KRiEUSgLvwoihfPXdbIBPEt9FhTWYZMq2N6HHI0LbxQ0Gr9z7YORMGn0+k=
X-Received: by 2002:a6b:e707:0:b0:640:7c3f:e93d with SMTP id
 b7-20020a6be707000000b006407c3fe93dmr14048051ioh.114.1646020529329; Sun, 27
 Feb 2022 19:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20220211043920.28981-1-liweiwei@iscas.ac.cn>
 <20220211043920.28981-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20220211043920.28981-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Feb 2022 13:55:02 +1000
Message-ID: <CAKmqyKO5mKdxHM-TYyb=UEhfh6W25m7Ctn1Ny6M5X5Pj7u1vRg@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] target/riscv: add support for zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, ardxwe@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 03:55:37 -0000

On Fri, Feb 11, 2022 at 2:41 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>   - update extension check REQUIRE_ZFINX_OR_F
>   - update single float point register read/write
>   - disable nanbox_s check
>
> Co-authored-by: ardxwe <ardxwe@gmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/fpu_helper.c               |  89 +++----
>  target/riscv/helper.h                   |   2 +-
>  target/riscv/insn_trans/trans_rvf.c.inc | 314 ++++++++++++++++--------
>  target/riscv/internals.h                |  16 +-
>  target/riscv/translate.c                |  93 ++++++-
>  5 files changed, 369 insertions(+), 145 deletions(-)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 4a5982d594..63ca703459 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -98,10 +98,11 @@ static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
>  static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
>                             uint64_t rs3, int flags)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> -    float32 frs3 = check_nanbox_s(rs3);
> -    return nanbox_s(float32_muladd(frs1, frs2, frs3, flags, &env->fp_status));
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    float32 frs3 = check_nanbox_s(env, rs3);
> +    return nanbox_s(env, float32_muladd(frs1, frs2, frs3, flags,
> +                                        &env->fp_status));
>  }
>
>  uint64_t helper_fmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
> @@ -183,124 +184,124 @@ uint64_t helper_fnmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
>
>  uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_add(frs1, frs2, &env->fp_status));
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    return nanbox_s(env, float32_add(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fsub_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_sub(frs1, frs2, &env->fp_status));
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    return nanbox_s(env, float32_sub(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fmul_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_mul(frs1, frs2, &env->fp_status));
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    return nanbox_s(env, float32_mul(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_div(frs1, frs2, &env->fp_status));
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    return nanbox_s(env, float32_div(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    return nanbox_s(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
>                      float32_minnum(frs1, frs2, &env->fp_status) :
>                      float32_minimum_number(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +    return nanbox_s(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
>                      float32_maxnum(frs1, frs2, &env->fp_status) :
>                      float32_maximum_number(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    return nanbox_s(float32_sqrt(frs1, &env->fp_status));
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    return nanbox_s(env, float32_sqrt(frs1, &env->fp_status));
>  }
>
>  target_ulong helper_fle_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
>      return float32_le(frs1, frs2, &env->fp_status);
>  }
>
>  target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
>      return float32_lt(frs1, frs2, &env->fp_status);
>  }
>
>  target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> -    float32 frs2 = check_nanbox_s(rs2);
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
>      return float32_eq_quiet(frs1, frs2, &env->fp_status);
>  }
>
>  target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs1 = check_nanbox_s(env, rs1);
>      return float32_to_int32(frs1, &env->fp_status);
>  }
>
>  target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs1 = check_nanbox_s(env, rs1);
>      return (int32_t)float32_to_uint32(frs1, &env->fp_status);
>  }
>
>  target_ulong helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs1 = check_nanbox_s(env, rs1);
>      return float32_to_int64(frs1, &env->fp_status);
>  }
>
>  target_ulong helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs1 = check_nanbox_s(env, rs1);
>      return float32_to_uint64(frs1, &env->fp_status);
>  }
>
>  uint64_t helper_fcvt_s_w(CPURISCVState *env, target_ulong rs1)
>  {
> -    return nanbox_s(int32_to_float32((int32_t)rs1, &env->fp_status));
> +    return nanbox_s(env, int32_to_float32((int32_t)rs1, &env->fp_status));
>  }
>
>  uint64_t helper_fcvt_s_wu(CPURISCVState *env, target_ulong rs1)
>  {
> -    return nanbox_s(uint32_to_float32((uint32_t)rs1, &env->fp_status));
> +    return nanbox_s(env, uint32_to_float32((uint32_t)rs1, &env->fp_status));
>  }
>
>  uint64_t helper_fcvt_s_l(CPURISCVState *env, target_ulong rs1)
>  {
> -    return nanbox_s(int64_to_float32(rs1, &env->fp_status));
> +    return nanbox_s(env, int64_to_float32(rs1, &env->fp_status));
>  }
>
>  uint64_t helper_fcvt_s_lu(CPURISCVState *env, target_ulong rs1)
>  {
> -    return nanbox_s(uint64_to_float32(rs1, &env->fp_status));
> +    return nanbox_s(env, uint64_to_float32(rs1, &env->fp_status));
>  }
>
> -target_ulong helper_fclass_s(uint64_t rs1)
> +target_ulong helper_fclass_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs1 = check_nanbox_s(env, rs1);
>      return fclass_s(frs1);
>  }
>
> @@ -340,12 +341,12 @@ uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>
>  uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
>  {
> -    return nanbox_s(float64_to_float32(rs1, &env->fp_status));
> +    return nanbox_s(env, float64_to_float32(rs1, &env->fp_status));
>  }
>
>  uint64_t helper_fcvt_d_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs1 = check_nanbox_s(env, rs1);
>      return float32_to_float64(frs1, &env->fp_status);
>  }
>
> @@ -539,14 +540,14 @@ uint64_t helper_fcvt_h_lu(CPURISCVState *env, target_ulong rs1)
>
>  uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs1 = check_nanbox_s(env, rs1);
>      return nanbox_h(float32_to_float16(frs1, true, &env->fp_status));
>  }
>
>  uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
>  {
>      float16 frs1 = check_nanbox_h(rs1);
> -    return nanbox_s(float16_to_float32(frs1, true, &env->fp_status));
> +    return nanbox_s(env, float16_to_float32(frs1, true, &env->fp_status));
>  }
>
>  uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 72cc2582f4..89195aad9d 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -38,7 +38,7 @@ DEF_HELPER_FLAGS_2(fcvt_s_w, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
> -DEF_HELPER_FLAGS_1(fclass_s, TCG_CALL_NO_RWG_SE, tl, i64)
> +DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, tl, env, i64)
>
>  /* Floating Point - Double Precision */
>  DEF_HELPER_FLAGS_3(fadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index 0aac87f7db..a1d3eb52ad 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -20,7 +20,14 @@
>
>  #define REQUIRE_FPU do {\
>      if (ctx->mstatus_fs == 0) \
> -        return false;                       \
> +        if (!ctx->cfg_ptr->ext_zfinx) \
> +            return false; \
> +} while (0)
> +
> +#define REQUIRE_ZFINX_OR_F(ctx) do {\
> +    if (!ctx->cfg_ptr->ext_zfinx) { \
> +        REQUIRE_EXT(ctx, RVF); \
> +    } \
>  } while (0)
>
>  static bool trans_flw(DisasContext *ctx, arg_flw *a)
> @@ -55,10 +62,16 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>  static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fmadd_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    gen_helper_fmadd_s(dest, cpu_env, src1, src2, src3);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -66,10 +79,16 @@ static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
>  static bool trans_fmsub_s(DisasContext *ctx, arg_fmsub_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fmsub_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    gen_helper_fmsub_s(dest, cpu_env, src1, src2, src3);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -77,10 +96,16 @@ static bool trans_fmsub_s(DisasContext *ctx, arg_fmsub_s *a)
>  static bool trans_fnmsub_s(DisasContext *ctx, arg_fnmsub_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fnmsub_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    gen_helper_fnmsub_s(dest, cpu_env, src1, src2, src3);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -88,10 +113,16 @@ static bool trans_fnmsub_s(DisasContext *ctx, arg_fnmsub_s *a)
>  static bool trans_fnmadd_s(DisasContext *ctx, arg_fnmadd_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fnmadd_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    gen_helper_fnmadd_s(dest, cpu_env, src1, src2, src3);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -99,11 +130,15 @@ static bool trans_fnmadd_s(DisasContext *ctx, arg_fnmadd_s *a)
>  static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fadd_s(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_fadd_s(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -111,11 +146,15 @@ static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s *a)
>  static bool trans_fsub_s(DisasContext *ctx, arg_fsub_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fsub_s(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_fsub_s(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -123,11 +162,15 @@ static bool trans_fsub_s(DisasContext *ctx, arg_fsub_s *a)
>  static bool trans_fmul_s(DisasContext *ctx, arg_fmul_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fmul_s(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_fmul_s(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -135,11 +178,15 @@ static bool trans_fmul_s(DisasContext *ctx, arg_fmul_s *a)
>  static bool trans_fdiv_s(DisasContext *ctx, arg_fdiv_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fdiv_s(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_fdiv_s(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -147,10 +194,14 @@ static bool trans_fdiv_s(DisasContext *ctx, arg_fdiv_s *a)
>  static bool trans_fsqrt_s(DisasContext *ctx, arg_fsqrt_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fsqrt_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fsqrt_s(dest, cpu_env, src1);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -158,22 +209,37 @@ static bool trans_fsqrt_s(DisasContext *ctx, arg_fsqrt_s *a)
>  static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
>      if (a->rs1 == a->rs2) { /* FMOV */
> -        gen_check_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
> +        if (!ctx->cfg_ptr->ext_zfinx) {
> +            gen_check_nanbox_s(dest, src1);
> +        } else {
> +            tcg_gen_ext32s_i64(dest, src1);
> +        }
>      } else { /* FSGNJ */
> -        TCGv_i64 rs1 = tcg_temp_new_i64();
> -        TCGv_i64 rs2 = tcg_temp_new_i64();
> -
> -        gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
> -        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
> -
> -        /* This formulation retains the nanboxing of rs2. */
> -        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 31);
> -        tcg_temp_free_i64(rs1);
> -        tcg_temp_free_i64(rs2);
> +        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +
> +        if (!ctx->cfg_ptr->ext_zfinx) {
> +            TCGv_i64 rs1 = tcg_temp_new_i64();
> +            TCGv_i64 rs2 = tcg_temp_new_i64();
> +            gen_check_nanbox_s(rs1, src1);
> +            gen_check_nanbox_s(rs2, src2);
> +
> +            /* This formulation retains the nanboxing of rs2 in normal 'F'. */
> +            tcg_gen_deposit_i64(dest, rs2, rs1, 0, 31);
> +
> +            tcg_temp_free_i64(rs1);
> +            tcg_temp_free_i64(rs2);
> +        } else {
> +            tcg_gen_deposit_i64(dest, src2, src1, 0, 31);
> +            tcg_gen_ext32s_i64(dest, dest);
> +        }
>      }
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -183,16 +249,27 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
>      TCGv_i64 rs1, rs2, mask;
>
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
> -    rs1 = tcg_temp_new_i64();
> -    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
> +    rs1 = tcg_temp_new_i64();
> +    if (!ctx->cfg_ptr->ext_zfinx) {
> +        gen_check_nanbox_s(rs1, src1);
> +    } else {
> +        tcg_gen_mov_i64(rs1, src1);
> +    }
>      if (a->rs1 == a->rs2) { /* FNEG */
> -        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(31, 1));
> +        tcg_gen_xori_i64(dest, rs1, MAKE_64BIT_MASK(31, 1));
>      } else {
> +        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>          rs2 = tcg_temp_new_i64();
> -        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
> +        if (!ctx->cfg_ptr->ext_zfinx) {
> +            gen_check_nanbox_s(rs2, src2);
> +        } else {
> +            tcg_gen_mov_i64(rs2, src2);
> +        }
>
>          /*
>           * Replace bit 31 in rs1 with inverse in rs2.
> @@ -200,13 +277,17 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
>           */
>          mask = tcg_constant_i64(~MAKE_64BIT_MASK(31, 1));
>          tcg_gen_nor_i64(rs2, rs2, mask);
> -        tcg_gen_and_i64(rs1, mask, rs1);
> -        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
> +        tcg_gen_and_i64(dest, mask, rs1);
> +        tcg_gen_or_i64(dest, dest, rs2);
>
>          tcg_temp_free_i64(rs2);
>      }
> +    /* signed-extended intead of nanboxing for result if enable zfinx */
> +    if (ctx->cfg_ptr->ext_zfinx) {
> +        tcg_gen_ext32s_i64(dest, dest);
> +    }
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      tcg_temp_free_i64(rs1);
> -
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -216,28 +297,45 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
>      TCGv_i64 rs1, rs2;
>
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>      rs1 = tcg_temp_new_i64();
> -    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
> +
> +    if (!ctx->cfg_ptr->ext_zfinx) {
> +        gen_check_nanbox_s(rs1, src1);
> +    } else {
> +        tcg_gen_mov_i64(rs1, src1);
> +    }
>
>      if (a->rs1 == a->rs2) { /* FABS */
> -        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(31, 1));
> +        tcg_gen_andi_i64(dest, rs1, ~MAKE_64BIT_MASK(31, 1));
>      } else {
> +        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>          rs2 = tcg_temp_new_i64();
> -        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
> +
> +        if (!ctx->cfg_ptr->ext_zfinx) {
> +            gen_check_nanbox_s(rs2, src2);
> +        } else {
> +            tcg_gen_mov_i64(rs2, src2);
> +        }
>
>          /*
>           * Xor bit 31 in rs1 with that in rs2.
>           * This formulation retains the nanboxing of rs1.
>           */
> -        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(31, 1));
> -        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
> +        tcg_gen_andi_i64(dest, rs2, MAKE_64BIT_MASK(31, 1));
> +        tcg_gen_xor_i64(dest, rs1, dest);
>
>          tcg_temp_free_i64(rs2);
>      }
> +    /* signed-extended intead of nanboxing for result if enable zfinx */
> +    if (ctx->cfg_ptr->ext_zfinx) {
> +        tcg_gen_ext32s_i64(dest, dest);
> +    }
>      tcg_temp_free_i64(rs1);
> -
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -245,10 +343,14 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
>  static bool trans_fmin_s(DisasContext *ctx, arg_fmin_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
> -    gen_helper_fmin_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                      cpu_fpr[a->rs2]);
> +    gen_helper_fmin_s(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -256,10 +358,14 @@ static bool trans_fmin_s(DisasContext *ctx, arg_fmin_s *a)
>  static bool trans_fmax_s(DisasContext *ctx, arg_fmax_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
> -    gen_helper_fmax_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                      cpu_fpr[a->rs2]);
> +    gen_helper_fmax_s(dest, cpu_env, src1, src2);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -267,12 +373,13 @@ static bool trans_fmax_s(DisasContext *ctx, arg_fmax_s *a)
>  static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_w_s(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fcvt_w_s(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -280,12 +387,13 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
>  static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_wu_s(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fcvt_wu_s(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -294,14 +402,14 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
>  {
>      /* NOTE: This was FMV.X.S in an earlier version of the ISA spec! */
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> -
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>  #if defined(TARGET_RISCV64)
> -    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
> +    tcg_gen_ext32s_tl(dest, src1);
>  #else
> -    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
> +    tcg_gen_extrl_i64_i32(dest, src1);
>  #endif
>
>      gen_set_gpr(ctx, a->rd, dest);
> @@ -311,11 +419,13 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
>  static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
> -    gen_helper_feq_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_feq_s(dest, cpu_env, src1, src2);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -323,11 +433,13 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
>  static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
> -    gen_helper_flt_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_flt_s(dest, cpu_env, src1, src2);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -335,11 +447,13 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
>  static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>
> -    gen_helper_fle_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_fle_s(dest, cpu_env, src1, src2);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -347,11 +461,12 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
>  static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
> -    gen_helper_fclass_s(dest, cpu_fpr[a->rs1]);
> +    gen_helper_fclass_s(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -359,13 +474,14 @@ static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
>  static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, src);
> -
> +    gen_helper_fcvt_s_w(dest, cpu_env, src);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -373,13 +489,14 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
>  static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, src);
> -
> +    gen_helper_fcvt_s_wu(dest, cpu_env, src);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -388,13 +505,14 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
>  {
>      /* NOTE: This was FMV.S.X in an earlier version of the ISA spec! */
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
> -    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], src);
> -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
> -
> +    tcg_gen_extu_tl_i64(dest, src);
> +    gen_nanbox_s(dest, dest);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -403,12 +521,13 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_l_s(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fcvt_l_s(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -417,12 +536,13 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_lu_s(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fcvt_lu_s(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -431,13 +551,14 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, src);
> -
> +    gen_helper_fcvt_s_l(dest, cpu_env, src);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -446,13 +567,14 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, src);
> -
> +    gen_helper_fcvt_s_lu(dest, cpu_env, src);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 065e8162a2..6237bb3115 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -46,13 +46,23 @@ enum {
>      RISCV_FRM_ROD = 8,  /* Round to Odd */
>  };
>
> -static inline uint64_t nanbox_s(float32 f)
> +static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
>  {
> -    return f | MAKE_64BIT_MASK(32, 32);
> +    /* the value is sign-extended instead of NaN-boxing for zfinx */
> +    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +        return (int32_t)f;
> +    } else {
> +        return f | MAKE_64BIT_MASK(32, 32);
> +    }
>  }
>
> -static inline float32 check_nanbox_s(uint64_t f)
> +static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
>  {
> +    /* Disable NaN-boxing check when enable zfinx */
> +    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +        return (uint32_t)f;
> +    }
> +
>      uint64_t mask = MAKE_64BIT_MASK(32, 32);
>
>      if (likely((f & mask) == mask)) {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index c7232de326..10cf37be41 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -101,6 +101,9 @@ typedef struct DisasContext {
>      TCGv zero;
>      /* Space for 3 operands plus 1 extra for address computation. */
>      TCGv temp[4];
> +    /* Space for 4 operands(1 dest and <=3 src) for float point computation */
> +    TCGv_i64 ftemp[4];
> +    uint8_t nftemp;
>      /* PointerMasking extension */
>      bool pm_mask_enabled;
>      bool pm_base_enabled;
> @@ -380,6 +383,86 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
>      }
>  }
>
> +static TCGv_i64 ftemp_new(DisasContext *ctx)
> +{
> +    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
> +    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
> +}
> +
> +static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
> +{
> +    if (!ctx->cfg_ptr->ext_zfinx) {
> +        return cpu_fpr[reg_num];
> +    }
> +
> +    if (reg_num == 0) {
> +        return tcg_constant_i64(0);
> +    }
> +    switch (get_xl(ctx)) {
> +    case MXL_RV32:
> +#ifdef TARGET_RISCV32
> +    {
> +        TCGv_i64 t = ftemp_new(ctx);
> +        tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
> +        return t;
> +    }
> +#else
> +    /* fall through */
> +    case MXL_RV64:
> +        return cpu_gpr[reg_num];
> +#endif
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
> +{
> +    if (!ctx->cfg_ptr->ext_zfinx) {
> +        return cpu_fpr[reg_num];
> +    }
> +
> +    if (reg_num == 0) {
> +        return ftemp_new(ctx);
> +    }
> +
> +    switch (get_xl(ctx)) {
> +    case MXL_RV32:
> +        return ftemp_new(ctx);
> +#ifdef TARGET_RISCV64
> +    case MXL_RV64:
> +        return cpu_gpr[reg_num];
> +#endif
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +/* assume t is nanboxing (for normal) or sign-extended (for zfinx) */
> +static void gen_set_fpr_hs(DisasContext *ctx, int reg_num, TCGv_i64 t)
> +{
> +    if (!ctx->cfg_ptr->ext_zfinx) {
> +        tcg_gen_mov_i64(cpu_fpr[reg_num], t);
> +        return;
> +    }
> +    if (reg_num != 0) {
> +        switch (get_xl(ctx)) {
> +        case MXL_RV32:
> +#ifdef TARGET_RISCV32
> +            tcg_gen_extrl_i64_i32(cpu_gpr[reg_num], t);
> +            break;
> +#else
> +        /* fall through */
> +        case MXL_RV64:
> +            tcg_gen_mov_i64(cpu_gpr[reg_num], t);
> +            break;
> +#endif
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +}
> +
>  static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>  {
>      target_ulong next_pc;
> @@ -955,6 +1038,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->cs = cs;
>      ctx->ntemp = 0;
>      memset(ctx->temp, 0, sizeof(ctx->temp));
> +    ctx->nftemp = 0;
> +    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
>      ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>      ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>      ctx->zero = tcg_constant_tl(0);
> @@ -976,16 +1061,22 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>      CPURISCVState *env = cpu->env_ptr;
>      uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
> +    int i;
>
>      ctx->ol = ctx->xl;
>      decode_opc(env, ctx, opcode16);
>      ctx->base.pc_next = ctx->pc_succ_insn;
>
> -    for (int i = ctx->ntemp - 1; i >= 0; --i) {
> +    for (i = ctx->ntemp - 1; i >= 0; --i) {
>          tcg_temp_free(ctx->temp[i]);
>          ctx->temp[i] = NULL;
>      }
>      ctx->ntemp = 0;
> +    for (i = ctx->nftemp - 1; i >= 0; --i) {
> +        tcg_temp_free_i64(ctx->ftemp[i]);
> +        ctx->ftemp[i] = NULL;
> +    }
> +    ctx->nftemp = 0;
>
>      if (ctx->base.is_jmp == DISAS_NEXT) {
>          target_ulong page_start;
> --
> 2.17.1
>
>

