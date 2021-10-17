Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcFwB-0002Kt-BK
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 19:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcFw9-0002Hw-Jw; Sun, 17 Oct 2021 19:51:29 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcFw6-0007HJ-Mf; Sun, 17 Oct 2021 19:51:29 -0400
Received: by mail-io1-xd36.google.com with SMTP id n7so14274553iod.0;
 Sun, 17 Oct 2021 16:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5qJL6OhBa2EWZrBpGnAacRzS+DmA1OFEQAk6YcSZsm4=;
 b=aCaguBfsW17WEP9BOL7hCwiaKOHR1clgu7s3fwiH8sbP+QlgxHwCtKyBZ/mGmiR2tg
 Juf27KV7CP8hjcv+ZKGb6UVgaSrcUiF/gEBrYUU6vXbcMm1d/yOD4XdV4xL4bD048ECo
 7aJ3+euLFSs9ZTInC1+r6AE3M1eaCKWsMC44Ql5Y2I9FLZAdThexfCFZTWfGGe12y5Tf
 gVyz4YAbPgbGLESGoK1s+KKJzgndlUuzY6PDS16H9lECMWhdVUCvkcb1v75+8Y4h2KRT
 niylKjN8FUXy3Z1FbECLAGzz06vQBrqL7p0j0Y4cc0zpjCH2rdASHAPmA7oycrpsRoJQ
 ENjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5qJL6OhBa2EWZrBpGnAacRzS+DmA1OFEQAk6YcSZsm4=;
 b=sAw6xoAYRO5EJ7Z5hcMKGFslDNZEKCe9bZA1AU0WDY1/5/LGN+sF3ONNfYig6lP8hp
 +0gp24D5v39KmJ+InZVjIM0SkHuAK6sEoDhlOqrYMe0kU0/s2Qbd1e3AW0p93O+OkhPq
 D+UYSMkqxgfo/+1LJXDHZ5tP3s/4oWQQEFH0PDAdqjkSTAyx/+iK2tX3nc0Ogc9Zf7jU
 UTAsaLXFJkNHfypaBo/P3iiHgWMOih+pRL3K4Nr22pbZ8XSx08qtTNEJpuLRp4RYkKuW
 mnnTx6xGp1PixqDu5gWVjMjKbxv0ruBNzwDGIfI68R1f7uIwxp/DDmArWpsmdIdjmq6W
 M3/Q==
X-Gm-Message-State: AOAM533bb8K1uOxXWjlSVD7IaTqvDiLvN5aHBtrcTkDBWsNtCsRBVNbJ
 UkUbSjUN6iFHBV/mQ/fhGrDd8SnNQbgJjgFf+7c=
X-Google-Smtp-Source: ABdhPJzyNuqnkqlMk5e23aTws851EsfVJ0h4y85Clg+Q+1dTi5UwkLuTnKmJ9iNG//f/XdGpAermCG4YZTK62ufUl+U=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr11815385ioq.57.1634514685139; 
 Sun, 17 Oct 2021 16:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-3-frank.chang@sifive.com>
In-Reply-To: <20211016090742.3034669-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 09:50:58 +1000
Message-ID: <CAKmqyKMtbKO5sqYUpB10CRUvn990=yGrxs=vuKm8WkrKnY3-iw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] target/riscv: zfh: half-precision computational
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 23:51:30 -0000

On Sat, Oct 16, 2021 at 7:08 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/fpu_helper.c                 |  86 +++++++++++++++
>  target/riscv/helper.h                     |  13 +++
>  target/riscv/insn32.decode                |  11 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 129 ++++++++++++++++++++++
>  target/riscv/internals.h                  |  16 +++
>  5 files changed, 255 insertions(+)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index d62f4709002..20bb89ad14f 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -81,6 +81,15 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
>      set_float_rounding_mode(softrm, &env->fp_status);
>  }
>
> +static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
> +                           uint64_t rs3, int flags)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    float16 frs3 = check_nanbox_h(rs3);
> +    return nanbox_h(float16_muladd(frs1, frs2, frs3, flags, &env->fp_status));
> +}
> +
>  static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
>                             uint64_t rs3, int flags)
>  {
> @@ -102,6 +111,12 @@ uint64_t helper_fmadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
>      return float64_muladd(frs1, frs2, frs3, 0, &env->fp_status);
>  }
>
> +uint64_t helper_fmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
> +                        uint64_t frs3)
> +{
> +    return do_fmadd_h(env, frs1, frs2, frs3, 0);
> +}
> +
>  uint64_t helper_fmsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
>                          uint64_t frs3)
>  {
> @@ -115,6 +130,12 @@ uint64_t helper_fmsub_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
>                            &env->fp_status);
>  }
>
> +uint64_t helper_fmsub_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
> +                        uint64_t frs3)
> +{
> +    return do_fmadd_h(env, frs1, frs2, frs3, float_muladd_negate_c);
> +}
> +
>  uint64_t helper_fnmsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
>                           uint64_t frs3)
>  {
> @@ -128,6 +149,12 @@ uint64_t helper_fnmsub_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
>                            &env->fp_status);
>  }
>
> +uint64_t helper_fnmsub_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
> +                         uint64_t frs3)
> +{
> +    return do_fmadd_h(env, frs1, frs2, frs3, float_muladd_negate_product);
> +}
> +
>  uint64_t helper_fnmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
>                           uint64_t frs3)
>  {
> @@ -142,6 +169,13 @@ uint64_t helper_fnmadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
>                            float_muladd_negate_product, &env->fp_status);
>  }
>
> +uint64_t helper_fnmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
> +                         uint64_t frs3)
> +{
> +    return do_fmadd_h(env, frs1, frs2, frs3,
> +                      float_muladd_negate_c | float_muladd_negate_product);
> +}
> +
>  uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
> @@ -374,3 +408,55 @@ target_ulong helper_fclass_d(uint64_t frs1)
>  {
>      return fclass_d(frs1);
>  }
> +
> +uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return nanbox_h(float16_add(frs1, frs2, &env->fp_status));
> +}
> +
> +uint64_t helper_fsub_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return nanbox_h(float16_sub(frs1, frs2, &env->fp_status));
> +}
> +
> +uint64_t helper_fmul_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return nanbox_h(float16_mul(frs1, frs2, &env->fp_status));
> +}
> +
> +uint64_t helper_fdiv_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return nanbox_h(float16_div(frs1, frs2, &env->fp_status));
> +}
> +
> +uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +                    float16_minnum(frs1, frs2, &env->fp_status) :
> +                    float16_minimum_number(frs1, frs2, &env->fp_status));
> +}
> +
> +uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +                    float16_maxnum(frs1, frs2, &env->fp_status) :
> +                    float16_maximum_number(frs1, frs2, &env->fp_status));
> +}
> +
> +uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    return nanbox_h(float16_sqrt(frs1, &env->fp_status));
> +}
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c7a53762277..c6c0323fafc 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -7,12 +7,16 @@ DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
>  /* Floating Point - fused */
>  DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
>  DEF_HELPER_FLAGS_4(fmadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
> +DEF_HELPER_FLAGS_4(fmadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
>  DEF_HELPER_FLAGS_4(fmsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
>  DEF_HELPER_FLAGS_4(fmsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
> +DEF_HELPER_FLAGS_4(fmsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
>  DEF_HELPER_FLAGS_4(fnmsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
>  DEF_HELPER_FLAGS_4(fnmsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
> +DEF_HELPER_FLAGS_4(fnmsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
>  DEF_HELPER_FLAGS_4(fnmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
>  DEF_HELPER_FLAGS_4(fnmadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
> +DEF_HELPER_FLAGS_4(fnmadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
>
>  /* Floating Point - Single Precision */
>  DEF_HELPER_FLAGS_3(fadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> @@ -62,6 +66,15 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
>  DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
> +/* Floating Point - Half Precision */
> +DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fmul_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
> +
>  /* Special functions */
>  DEF_HELPER_2(csrr, tl, env, int)
>  DEF_HELPER_3(csrw, void, env, int, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index b36a3d8dbf8..66c231a3010 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -730,3 +730,14 @@ bseti      00101. ........... 001 ..... 0010011 @sh
>  # *** RV32 Zfh Extension ***
>  flh        ............   ..... 001 ..... 0000111 @i
>  fsh        .......  ..... ..... 001 ..... 0100111 @s
> +fmadd_h    ..... 10 ..... ..... ... ..... 1000011 @r4_rm
> +fmsub_h    ..... 10 ..... ..... ... ..... 1000111 @r4_rm
> +fnmsub_h   ..... 10 ..... ..... ... ..... 1001011 @r4_rm
> +fnmadd_h   ..... 10 ..... ..... ... ..... 1001111 @r4_rm
> +fadd_h     0000010  ..... ..... ... ..... 1010011 @r_rm
> +fsub_h     0000110  ..... ..... ... ..... 1010011 @r_rm
> +fmul_h     0001010  ..... ..... ... ..... 1010011 @r_rm
> +fdiv_h     0001110  ..... ..... ... ..... 1010011 @r_rm
> +fsqrt_h    0101110  00000 ..... ... ..... 1010011 @r2_rm
> +fmin_h     0010110  ..... ..... 000 ..... 1010011 @r
> +fmax_h     0010110  ..... ..... 001 ..... 1010011 @r
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index dad1d703d72..9764d76f8bc 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -63,3 +63,132 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>
>      return true;
>  }
> +
> +static bool trans_fmadd_h(DisasContext *ctx, arg_fmadd_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> +                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fmsub_h(DisasContext *ctx, arg_fmsub_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> +                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fnmsub_h(DisasContext *ctx, arg_fnmsub_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fnmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> +                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fnmadd_h(DisasContext *ctx, arg_fnmadd_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fnmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> +                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fadd_h(DisasContext *ctx, arg_fadd_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fadd_h(cpu_fpr[a->rd], cpu_env,
> +                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fsub_h(DisasContext *ctx, arg_fsub_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fsub_h(cpu_fpr[a->rd], cpu_env,
> +                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fmul_h(DisasContext *ctx, arg_fmul_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fmul_h(cpu_fpr[a->rd], cpu_env,
> +                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fdiv_h(DisasContext *ctx, arg_fdiv_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fdiv_h(cpu_fpr[a->rd], cpu_env,
> +                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fsqrt_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_helper_fmin_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> +                      cpu_fpr[a->rs2]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_helper_fmax_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> +                      cpu_fpr[a->rs2]);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b15ad394bb9..bce91da11a4 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -58,4 +58,20 @@ static inline float32 check_nanbox_s(uint64_t f)
>      }
>  }
>
> +static inline uint64_t nanbox_h(float16 f)
> +{
> +    return f | MAKE_64BIT_MASK(16, 48);
> +}
> +
> +static inline float16 check_nanbox_h(uint64_t f)
> +{
> +    uint64_t mask = MAKE_64BIT_MASK(16, 48);
> +
> +    if (likely((f & mask) == mask)) {
> +        return (uint16_t)f;
> +    } else {
> +        return 0x7E00u; /* default qnan */
> +    }
> +}
> +
>  #endif
> --
> 2.25.1
>
>

