Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcG5X-0007Z1-Ha
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 20:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG5R-0007Y9-Ng; Sun, 17 Oct 2021 20:01:07 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG5O-0000ET-Al; Sun, 17 Oct 2021 20:01:04 -0400
Received: by mail-io1-xd36.google.com with SMTP id x1so14194365iof.7;
 Sun, 17 Oct 2021 17:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qt9xw5izasJUpHw5h/Jyxw51tRlSV/stjHgTxWj2Bbo=;
 b=ZD5I6c1SZBOIC2iVW8UkeWR2mPZuN5yniiowHtYg3T78vZjTpaFS6K3ynZwSXe4iVx
 ILcKwEJxZ7ZpDsBEtdLx8nALqFmxPWVM7zXoRnQfnud+o5b5B2lbIJ4L6iXdWh/hrwoz
 DkBO89fC408KcFP9WihZ31xzR7WRtQWq0GWdGI4NPCkOx6DJmUuMuziJGm+pzelKysSe
 /lGdQ+3VqLkaIl34QqT7BGgtyUL0w4yixfAGAW6gmo5LKkyRgPaswXWA/9l0Py+wnyrs
 iwAwFOn1GdPVrwar2ZBvleza0Yydup+u7pb0IdWqRI/qqXm4coqFONoDTT1eKO7DxVG3
 ZWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qt9xw5izasJUpHw5h/Jyxw51tRlSV/stjHgTxWj2Bbo=;
 b=xYAm+2CSW1pdxMW9VY5ppCGArxRc+kufK/f28qYKD2ctWs3tMQw0Twdz4uwxZHKS0v
 98bW3M23TvYM0cm8A2U1ApOw3n9fTsmn9UneMYCuBceUEdYX70tHN+wbPXy06VYi4x4R
 FSBhXKQJ4zCLuni+4FSH98oGDcK6tZpO2pWkDfhqn4M5pcj/gY/9Bhg5G2G0Mif5IvuZ
 aqnwGu/e2VqQ41RHcJUI9+FUaS9SUrumn41ELQTLkSZpNSKW736dVtUJ/kkKDvOS1+ua
 fSzDhcwPylDiLx4mzXFPeEOr10TU3FzJaoD+vazz7gbZ3pdLb5uMHEahDfCikk77eZ31
 riDg==
X-Gm-Message-State: AOAM530kw5gjmdHfxuMC0G1Eg2UZyo6C98Zb/gqjUJsTjHdWJrxmZ9Bv
 dG5Ec7I6fWAW2arQiQ55J0VoQGUgAclJBGQxATg=
X-Google-Smtp-Source: ABdhPJwuj66V0xx0WaWp/EiPRACZisAa6gI1tXPkfyL9k1nqrIFY9xr2Pi2wk8CH/AFCDGbG54xE5NlQkN3qYqkOsxA=
X-Received: by 2002:a05:6602:2bf7:: with SMTP id
 d23mr10024656ioy.187.1634515260908; 
 Sun, 17 Oct 2021 17:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-5-frank.chang@sifive.com>
In-Reply-To: <20211016090742.3034669-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 10:00:34 +1000
Message-ID: <CAKmqyKNpD_AEzVo9soEJYt=A2_uWJW-cv7NFao1YCuw-_tUz4Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] target/riscv: zfh: half-precision floating-point
 compare
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
X-List-Received-Date: Mon, 18 Oct 2021 00:01:07 -0000

On Sat, Oct 16, 2021 at 7:12 PM <frank.chang@sifive.com> wrote:
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
>  target/riscv/fpu_helper.c                 | 21 +++++++++++++
>  target/riscv/helper.h                     |  3 ++
>  target/riscv/insn32.decode                |  3 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 37 +++++++++++++++++++++++
>  4 files changed, 64 insertions(+)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 2ed9b03193c..ec2009ee65b 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -461,6 +461,27 @@ uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
>      return nanbox_h(float16_sqrt(frs1, &env->fp_status));
>  }
>
> +target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return float16_le(frs1, frs2, &env->fp_status);
> +}
> +
> +target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return float16_lt(frs1, frs2, &env->fp_status);
> +}
> +
> +target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    float16 frs2 = check_nanbox_h(rs2);
> +    return float16_eq_quiet(frs1, frs2, &env->fp_status);
> +}
> +
>  target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
>  {
>      float16 frs1 = check_nanbox_h(rs1);
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index b50672d1684..9c89521d4ad 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -74,6 +74,9 @@ DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>  DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>  DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
>  DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
> +DEF_HELPER_FLAGS_3(fle_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> +DEF_HELPER_FLAGS_3(flt_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> +DEF_HELPER_FLAGS_3(feq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
>  DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
>  DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
>  DEF_HELPER_FLAGS_2(fcvt_d_h, TCG_CALL_NO_RWG, i64, env, i64)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index ba40f3e7f89..3906c9fb201 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -751,6 +751,9 @@ fcvt_d_h   0100001  00010 ..... ... ..... 1010011 @r2_rm
>  fcvt_w_h   1100010  00000 ..... ... ..... 1010011 @r2_rm
>  fcvt_wu_h  1100010  00001 ..... ... ..... 1010011 @r2_rm
>  fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
> +feq_h      1010010  ..... ..... 010 ..... 1010011 @r
> +flt_h      1010010  ..... ..... 001 ..... 1010011 @r
> +fle_h      1010010  ..... ..... 000 ..... 1010011 @r
>  fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
>  fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index d1250257666..8d0959a6671 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -335,6 +335,43 @@ static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
>      return true;
>  }
>
> +static bool trans_feq_h(DisasContext *ctx, arg_feq_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_helper_feq_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_flt_h(DisasContext *ctx, arg_flt_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_helper_flt_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_helper_fle_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
>  static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
>  {
>      REQUIRE_FPU;
> --
> 2.25.1
>
>

