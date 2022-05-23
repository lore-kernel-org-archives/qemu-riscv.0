Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nt1en-0002VA-TP
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 02:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nt1ec-0002TW-Cb; Mon, 23 May 2022 02:34:59 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:44708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nt1eY-0004Jx-P9; Mon, 23 May 2022 02:34:56 -0400
Received: by mail-io1-xd30.google.com with SMTP id e194so14263216iof.11;
 Sun, 22 May 2022 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FfcZWKgpoAxs7FqtQNt3Id20uJCMlGfOEIDDDGc46f0=;
 b=RnrVwffzRLT7aUyAfKavEzcbknpYF0TsclpsapHsewo2JKilwrKZ+WIX9RKyE0FQOw
 uzJv9wx3x3tTYZ8zI/FJ8hjkIScOr8EFsq2fZU9kiUrcJ5G95doN0h3Jz1qiq7xn2kdj
 6IOTjePgMHvowx2gtWx0SVspzGR9CVwOnGqUWArd6dzZ4jAIsF9J692Yj8kXov7aOJEB
 T0sz7OzeRPUfL9oZXTOjbgAq3H3nJxoOe1IQ81PWIoTKM0zv1Fcl0p6KW0F38xKq8Mfp
 dsqS0Ah6QmqNmAyNJ2mjnbplpfhbHcisV9qmZzXbFYwMcxnihuMl1MSZD5QKGGF4lZoa
 y/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FfcZWKgpoAxs7FqtQNt3Id20uJCMlGfOEIDDDGc46f0=;
 b=x3GeUxMzOGEUHYtJX2GzRiL8rehv9z8uy/hbEYnFKnDKfrQfarm/a/GHoftDsvmuoh
 AmPMMKkcFvk1Di/itKbzIeBZY9yn3sNiuZLQf/IycwDlLdsTj7FgrNm93quw4+XWerb3
 l/s+PKijgJz2p3YjoXt6/fdZnS8/zPyEGizYJjcG0ypf+yIV0S32NswqJOinDW1DSJJm
 pxoObepNLi58T3sY1k4Brss6hmiAPDZiGU4/G9vmnp0fj+qLQLvj6P1f6Ygm66rS2nF1
 ulXd9DgRBQShc4Our2ay9YMCc936CxL04H3/+yWK1IhhPTxkulMP+NEQZwU1Kc97sNYW
 DCug==
X-Gm-Message-State: AOAM5335VYKZmApVugn2fNKfJXG4C/fxNqz5sAbNAcb7ywe3ytzXVM0W
 ERkRT+U00m0bZkEeFiEpS76Y4+m3iJIWJ+q9Tcw=
X-Google-Smtp-Source: ABdhPJyvVU0ujGFEfFQlwS2fEo2dzt290cexLvURzUCKNebpIB/HenbTgc9yx8ihRpQkC0PIB9NMVDtG+iKI07eJkDQ=
X-Received: by 2002:a05:6638:370b:b0:32e:a6ce:edcf with SMTP id
 k11-20020a056638370b00b0032ea6ceedcfmr6177774jav.267.1653287693012; Sun, 22
 May 2022 23:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220518015316.20504-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220518015316.20504-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 May 2022 16:34:27 +1000
Message-ID: <CAKmqyKNBQo91af1m5t_wDOVMeh=6uYD9Q+KugoTOQYzQJUtf5w@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: add support for zmmul extension v0.1
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 May 2022 06:35:00 -0000

On Wed, May 18, 2022 at 11:54 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - includes all multiplication operations for M extension
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c                      |  2 ++
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
>  3 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e373c61ba2..01b57d3784 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -903,6 +903,7 @@ static Property riscv_cpu_properties[] = {
>
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> +    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),

Is this really experimental?

Alistair

>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> @@ -1027,6 +1028,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>       *    extensions by an underscore.
>       */
>      struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5ff7294c6..68177eae12 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -405,6 +405,7 @@ struct RISCVCPUConfig {
>      bool ext_zhinxmin;
>      bool ext_zve32f;
>      bool ext_zve64f;
> +    bool ext_zmmul;
>
>      uint32_t mvendorid;
>      uint64_t marchid;
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
> index 16b029edf0..ec7f705aab 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -18,6 +18,12 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
> +    if (!ctx->cfg_ptr->ext_zmmul && !has_ext(ctx, RVM)) { \
> +        return false;                                     \
> +    }                                                     \
> +} while (0)
> +
>  static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
>  {
>      TCGv tmpl = tcg_temp_new();
> @@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
>
>  static bool trans_mul(DisasContext *ctx, arg_mul *a)
>  {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
>  }
>
> @@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
>
>  static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>  {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
>                              gen_mulh_i128);
>  }
> @@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
>
>  static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>  {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
>                              gen_mulhsu_i128);
>  }
> @@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
>
>  static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>  {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      /* gen_mulh_w works for either sign as input. */
>      return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
>                              gen_mulhu_i128);
> @@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
>  static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
>  {
>      REQUIRE_64_OR_128BIT(ctx);
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      ctx->ol = MXL_RV32;
>      return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
>  }
> @@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
>  static bool trans_muld(DisasContext *ctx, arg_muld *a)
>  {
>      REQUIRE_128BIT(ctx);
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      ctx->ol = MXL_RV64;
>      return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
>  }
> --
> 2.17.1
>
>

