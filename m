Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcGA4-0004WO-Co
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 20:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcGA2-0004R3-2K; Sun, 17 Oct 2021 20:05:50 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:36732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG9z-0002X2-1f; Sun, 17 Oct 2021 20:05:49 -0400
Received: by mail-io1-xd34.google.com with SMTP id e144so14250562iof.3;
 Sun, 17 Oct 2021 17:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZB43uKfstQ7ZXVFdXTfvP9ADk5Qu/E7xwF9+go0gA8=;
 b=lBVIS/vYsXlTphQSqU3ffRQTAx+0reKZ1BnVKzjPRLgxAF/p9wcByALiR5DE/5WgLd
 B2wQQqWmI5V+zVlyWhsdGF1hAzHzXoRz8i93P95LwJso+3MFvZos4YN0AEt5WnWVN4Df
 AwkOUPcblqIVcMIpW3hgZl/5ZtJoBmALUs5NeDT0A5/bTepv6xlf9i2xqWrKP7PdIUvk
 7+tgs3FUJ3/+6gLNxuXPrnYmTXIWstIHzaxdy8bKiLQxhxAdZFNZawFliuY3SvxdzF5b
 MCyAac+a5ZGORg7Uurg6QgtNmMgC5uYwcc6rKSgncEz8+s7ULfhNFGZ8/qAoBxql5Yx2
 bi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZB43uKfstQ7ZXVFdXTfvP9ADk5Qu/E7xwF9+go0gA8=;
 b=Vo7ZVxqMG1n4GRCLKW7oj5tiQ4kVL3K0OCUhByVuRVe/ouwt9YXySh5Jr6Dr517TOF
 4Bffabu4Im+Zh4P1bXtyzaEVQzFH8gw9CC3efX3j07PYn77b4cpLyqf6mkP0T9dpLhis
 3mH1vCZp4ulG2Yvd5CH1qg/tGllFe8jmI2VZYP9BwIqL+lADCZLnT3XzmXDbwycH8H30
 YYQg6YLgHhjNmGPkcp6fA6T0AtM8jaVuyLdn3JmNWm4hXvsA5z7cPo8016pASbHdfHqI
 pMJsW+ny7qlLXossArzRdOMTZq9g7Lj5R7im1m4GgbQm+PkIx6v64HrZNJx56e+EmDFi
 1Yuw==
X-Gm-Message-State: AOAM533elcGClHZ595hBcN4xRoBqGzR80horaz7FVlwQrVGssfsP5QJR
 /dVgMaGGTJ4VYW3kt8V69sZfHP9y2yyVWy435Q94+7os2sDyMixf
X-Google-Smtp-Source: ABdhPJwuM3HwaiRoedaOZifDKverbyx2NRXDNQrNQ6NE+3JMqF+ZlIfcfUqXBzf+LSpe3CSqCFx1EcjfK5avboyy3LI=
X-Received: by 2002:a02:2124:: with SMTP id e36mr16182058jaa.35.1634515545480; 
 Sun, 17 Oct 2021 17:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-7-frank.chang@sifive.com>
In-Reply-To: <20211016090742.3034669-7-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 10:05:19 +1000
Message-ID: <CAKmqyKMrdrhh+dSKexN5OgiVqT=U=8rkB95rS-0uUb8UZ8fRQA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] target/riscv: zfh: implement zfhmin extension
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 00:05:50 -0000

On Sat, Oct 16, 2021 at 7:13 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Zfhmin extension is a subset of Zfh extension, consisting only of data
> transfer and conversion instructions.
>
> If enabled, only the following instructions from Zfh extension are
> included:
>   * flh, fsh, fmv.x.h, fmv.h.x, fcvt.s.h, fcvt.h.s
>   * If D extension is present: fcvt.d.h, fcvt.h.d
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                        |  1 +
>  target/riscv/cpu.h                        |  1 +
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 22 ++++++++++++++--------
>  target/riscv/translate.c                  |  2 ++
>  4 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8c579dc297b..4c0e6532164 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -602,6 +602,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> +    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 88684e72be1..d70f63ddfe6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -298,6 +298,7 @@ struct RISCVCPU {
>          bool ext_ifencei;
>          bool ext_icsr;
>          bool ext_zfh;
> +        bool ext_zfhmin;
>
>          char *priv_spec;
>          char *user_spec;
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 0549e25fb45..5a7cac89585 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -22,13 +22,19 @@
>      }                         \
>  } while (0)
>
> +#define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> +    if (!(ctx->ext_zfh || ctx->ext_zfhmin)) { \
> +        return false;                         \
> +    }                                         \
> +} while (0)
> +
>  static bool trans_flh(DisasContext *ctx, arg_flh *a)
>  {
>      TCGv_i64 dest;
>      TCGv t0;
>
>      REQUIRE_FPU;
> -    REQUIRE_ZFH(ctx);
> +    REQUIRE_ZFH_OR_ZFHMIN(ctx);
>
>      t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>      if (a->imm) {
> @@ -50,7 +56,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>      TCGv t0;
>
>      REQUIRE_FPU;
> -    REQUIRE_ZFH(ctx);
> +    REQUIRE_ZFH_OR_ZFHMIN(ctx);
>
>      t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>      if (a->imm) {
> @@ -283,7 +289,7 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
>  static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_ZFH(ctx);
> +    REQUIRE_ZFH_OR_ZFHMIN(ctx);
>
>      gen_set_rm(ctx, a->rm);
>      gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> @@ -296,7 +302,7 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
>  static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_ZFH(ctx);
> +    REQUIRE_ZFH_OR_ZFHMIN(ctx);
>      REQUIRE_EXT(ctx, RVD);
>
>      gen_set_rm(ctx, a->rm);
> @@ -311,7 +317,7 @@ static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
>  static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_ZFH(ctx);
> +    REQUIRE_ZFH_OR_ZFHMIN(ctx);
>
>      gen_set_rm(ctx, a->rm);
>      gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> @@ -324,7 +330,7 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
>  static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_ZFH(ctx);
> +    REQUIRE_ZFH_OR_ZFHMIN(ctx);
>      REQUIRE_EXT(ctx, RVD);
>
>      gen_set_rm(ctx, a->rm);
> @@ -441,7 +447,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
>  static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_ZFH(ctx);
> +    REQUIRE_ZFH_OR_ZFHMIN(ctx);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
>
> @@ -461,7 +467,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
>  static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_ZFH(ctx);
> +    REQUIRE_ZFH_OR_ZFHMIN(ctx);
>
>      TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 442ef42f441..f23bc919c08 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -70,6 +70,7 @@ typedef struct DisasContext {
>      bool virt_enabled;
>      bool ext_ifencei;
>      bool ext_zfh;
> +    bool ext_zfhmin;
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> @@ -559,6 +560,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
>      ctx->ext_zfh = cpu->cfg.ext_zfh;
> +    ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
>      ctx->vlen = cpu->cfg.vlen;
>      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
>      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
> --
> 2.25.1
>
>

