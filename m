Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcG4Q-0006nR-Ik
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 20:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG4O-0006mo-So; Sun, 17 Oct 2021 20:00:00 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:40539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG4I-0007dX-WD; Sun, 17 Oct 2021 20:00:00 -0400
Received: by mail-il1-x12f.google.com with SMTP id k3so2705804ilo.7;
 Sun, 17 Oct 2021 16:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rxSNBNb8MpMT7uzpY5b02jno4lxLH4d8XGUoB/PPu7A=;
 b=q3jftqfxPK0XttIjD+GkXw8IaTFfOTIZReCM+qOKru6ZUvpHdPt7ao9lJluPSmTA0z
 U4Mr4cufp2o+rBXKtD0mdEBGuxkybxH9rmT6skjFJYHSd7NGv4U0U5xxt230mkedmhTH
 4y/ZrhXcnHwQMVJaxTk3ppfoXK7/cqyEupZ54bE6cgBXXbIvI9ASNrT179fbh4MnHmwB
 fo+D3c+1+GtM6zE2BTmnjjtoeTRWqT+Vhrum00nOwQuEgGATklKTLF4cHi545e8TZLvK
 b5GI7A6C9SxCcslf9F7P6mPxVWLw4GGjemP+GwgUoIJbgzFraKNC9DJAE2LsJXeAaj5m
 qSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rxSNBNb8MpMT7uzpY5b02jno4lxLH4d8XGUoB/PPu7A=;
 b=7KjX6il1/4+oxeCjh5nHhXY/m6/Mcgr0vbsEf2derz4lhXayLI1YkqqT3DwL8uOdYC
 n8VKFnD8P9VVpxWRy06VLWnKAiptJv/vVudH5vcXZJmbFJApnkw4lky+he8ND2G75ckE
 Gp+F9+8GAQf9sXdQbUFfQGNqMkh6VFjYaO6dReyBpzzqVG7z+4/rjYjT1GI+WmKiiUd+
 CBFJOpScvpPVXHgVziPHsVrOPuNssOcWT6MhEXcPdMFd3geF7rXt9k6xA7eM6NLH+s8D
 1+5HnJwiIxWYeWHlhA8L5SZ4A1GkWNhoWok4R7tnPiamMNmgJk4ELi/Gi2B8CHLoYNA8
 urJg==
X-Gm-Message-State: AOAM533EOGajImgC4erVftDv/lmnEa0AsUhk/xRM9rzoXS5B5Cjbg5td
 DHwWb2PcPXY53RIY5jkEdm7IYfVJYVxcctfdBF0=
X-Google-Smtp-Source: ABdhPJzkukaGjHLZ3i8vWrh9OmlL0hXyxVhTpcnZxcXqKEzn36bDhxQq1wnFpk1C4Fa9r1umlYcTqQDXy8EhW66pJKg=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr12296105ilo.208.1634515193353; 
 Sun, 17 Oct 2021 16:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-4-frank.chang@sifive.com>
In-Reply-To: <20211016090742.3034669-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 09:59:26 +1000
Message-ID: <CAKmqyKNb6_b+fS3Ofi1U7wiUwhnwa_0P5G3Go0UFA-ZqSO+yeQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/riscv: zfh: half-precision convert and move
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 00:00:01 -0000

On Sat, Oct 16, 2021 at 7:09 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/fpu_helper.c                 |  67 +++++
>  target/riscv/helper.h                     |  12 +
>  target/riscv/insn32.decode                |  19 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 288 ++++++++++++++++++++++
>  target/riscv/translate.c                  |  10 +
>  5 files changed, 396 insertions(+)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 20bb89ad14f..2ed9b03193c 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -460,3 +460,70 @@ uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
>      float16 frs1 = check_nanbox_h(rs1);
>      return nanbox_h(float16_sqrt(frs1, &env->fp_status));
>  }
> +
> +target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    return float16_to_int32(frs1, &env->fp_status);
> +}
> +
> +target_ulong helper_fcvt_wu_h(CPURISCVState *env, uint64_t rs1)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    return (int32_t)float16_to_uint32(frs1, &env->fp_status);
> +}
> +
> +target_ulong helper_fcvt_l_h(CPURISCVState *env, uint64_t rs1)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    return float16_to_int64(frs1, &env->fp_status);
> +}
> +
> +target_ulong helper_fcvt_lu_h(CPURISCVState *env, uint64_t rs1)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    return float16_to_uint64(frs1, &env->fp_status);
> +}
> +
> +uint64_t helper_fcvt_h_w(CPURISCVState *env, target_ulong rs1)
> +{
> +    return nanbox_h(int32_to_float16((int32_t)rs1, &env->fp_status));
> +}
> +
> +uint64_t helper_fcvt_h_wu(CPURISCVState *env, target_ulong rs1)
> +{
> +    return nanbox_h(uint32_to_float16((uint32_t)rs1, &env->fp_status));
> +}
> +
> +uint64_t helper_fcvt_h_l(CPURISCVState *env, target_ulong rs1)
> +{
> +    return nanbox_h(int64_to_float16(rs1, &env->fp_status));
> +}
> +
> +uint64_t helper_fcvt_h_lu(CPURISCVState *env, target_ulong rs1)
> +{
> +    return nanbox_h(uint64_to_float16(rs1, &env->fp_status));
> +}
> +
> +uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
> +{
> +    float32 frs1 = check_nanbox_s(rs1);
> +    return nanbox_h(float32_to_float16(frs1, true, &env->fp_status));
> +}
> +
> +uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    return nanbox_s(float16_to_float32(frs1, true, &env->fp_status));
> +}
> +
> +uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
> +{
> +    return nanbox_h(float64_to_float16(rs1, true, &env->fp_status));
> +}
> +
> +uint64_t helper_fcvt_d_h(CPURISCVState *env, uint64_t rs1)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    return float16_to_float64(frs1, true, &env->fp_status);
> +}
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c6c0323fafc..b50672d1684 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -74,6 +74,18 @@ DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>  DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>  DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>  DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_d_h, TCG_CALL_NO_RWG, i64, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_h_d, TCG_CALL_NO_RWG, i64, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_w_h, TCG_CALL_NO_RWG, tl, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_wu_h, TCG_CALL_NO_RWG, tl, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_l_h, TCG_CALL_NO_RWG, tl, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_lu_h, TCG_CALL_NO_RWG, tl, env, i64)
> +DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
> +DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
> +DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
> +DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
>
>  /* Special functions */
>  DEF_HELPER_2(csrr, tl, env, int)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 66c231a3010..ba40f3e7f89 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -739,5 +739,24 @@ fsub_h     0000110  ..... ..... ... ..... 1010011 @r_rm
>  fmul_h     0001010  ..... ..... ... ..... 1010011 @r_rm
>  fdiv_h     0001110  ..... ..... ... ..... 1010011 @r_rm
>  fsqrt_h    0101110  00000 ..... ... ..... 1010011 @r2_rm
> +fsgnj_h    0010010  ..... ..... 000 ..... 1010011 @r
> +fsgnjn_h   0010010  ..... ..... 001 ..... 1010011 @r
> +fsgnjx_h   0010010  ..... ..... 010 ..... 1010011 @r
>  fmin_h     0010110  ..... ..... 000 ..... 1010011 @r
>  fmax_h     0010110  ..... ..... 001 ..... 1010011 @r
> +fcvt_h_s   0100010  00000 ..... ... ..... 1010011 @r2_rm
> +fcvt_s_h   0100000  00010 ..... ... ..... 1010011 @r2_rm
> +fcvt_h_d   0100010  00001 ..... ... ..... 1010011 @r2_rm
> +fcvt_d_h   0100001  00010 ..... ... ..... 1010011 @r2_rm
> +fcvt_w_h   1100010  00000 ..... ... ..... 1010011 @r2_rm
> +fcvt_wu_h  1100010  00001 ..... ... ..... 1010011 @r2_rm
> +fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
> +fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
> +fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
> +fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
> +
> +# *** RV64 Zfh Extension (in addition to RV32 Zfh) ***
> +fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
> +fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
> +fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
> +fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 9764d76f8bc..d1250257666 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -171,6 +171,93 @@ static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
>      return true;
>  }
>
> +static bool trans_fsgnj_h(DisasContext *ctx, arg_fsgnj_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    if (a->rs1 == a->rs2) { /* FMOV */
> +        gen_check_nanbox_h(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
> +    } else {
> +        TCGv_i64 rs1 = tcg_temp_new_i64();
> +        TCGv_i64 rs2 = tcg_temp_new_i64();
> +
> +        gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
> +        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
> +
> +        /* This formulation retains the nanboxing of rs2. */
> +        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 15);
> +        tcg_temp_free_i64(rs1);
> +        tcg_temp_free_i64(rs2);
> +    }
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
> +{
> +    TCGv_i64 rs1, rs2, mask;
> +
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    rs1 = tcg_temp_new_i64();
> +    gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
> +
> +    if (a->rs1 == a->rs2) { /* FNEG */
> +        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(15, 1));
> +    } else {
> +        rs2 = tcg_temp_new_i64();
> +        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
> +
> +        /*
> +         * Replace bit 15 in rs1 with inverse in rs2.
> +         * This formulation retains the nanboxing of rs1.
> +         */
> +        mask = tcg_const_i64(~MAKE_64BIT_MASK(15, 1));
> +        tcg_gen_not_i64(rs2, rs2);
> +        tcg_gen_andc_i64(rs2, rs2, mask);
> +        tcg_gen_and_i64(rs1, mask, rs1);
> +        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
> +
> +        tcg_temp_free_i64(mask);
> +        tcg_temp_free_i64(rs2);
> +    }
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fsgnjx_h(DisasContext *ctx, arg_fsgnjx_h *a)
> +{
> +    TCGv_i64 rs1, rs2;
> +
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    rs1 = tcg_temp_new_i64();
> +    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
> +
> +    if (a->rs1 == a->rs2) { /* FABS */
> +        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(15, 1));
> +    } else {
> +        rs2 = tcg_temp_new_i64();
> +        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
> +
> +        /*
> +         * Xor bit 15 in rs1 with that in rs2.
> +         * This formulation retains the nanboxing of rs1.
> +         */
> +        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(15, 1));
> +        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
> +
> +        tcg_temp_free_i64(rs2);
> +    }
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
>  static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
>  {
>      REQUIRE_FPU;
> @@ -192,3 +279,204 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
>      mark_fs_dirty(ctx);
>      return true;
>  }
> +
> +static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +
> +    mark_fs_dirty(ctx);
> +
> +    return true;
> +}
> +
> +static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_d_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +
> +    mark_fs_dirty(ctx);
> +
> +
> +    return true;
> +}
> +
> +static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +
> +    mark_fs_dirty(ctx);
> +
> +    return true;
> +}
> +
> +static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_h_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +
> +    mark_fs_dirty(ctx);
> +
> +    return true;
> +}
> +
> +static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_w_h(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_fcvt_wu_h(DisasContext *ctx, arg_fcvt_wu_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_wu_h(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_fcvt_h_w(DisasContext *ctx, arg_fcvt_h_w *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_h_w(cpu_fpr[a->rd], cpu_env, t0);
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_h_wu(cpu_fpr[a->rd], cpu_env, t0);
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +#if defined(TARGET_RISCV64)
> +    /* 16 bits -> 64 bits */
> +    tcg_gen_ext16s_tl(dest, cpu_fpr[a->rs1]);
> +#else
> +    /* 16 bits -> 32 bits */
> +    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
> +    tcg_gen_ext16s_tl(dest, dest);
> +#endif

Can we use is_32bit(ctx) instead?

Alistair

