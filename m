Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nuPPP-000895-Fp
	for mharc-qemu-riscv@gnu.org; Thu, 26 May 2022 22:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nuPPM-00085a-I9; Thu, 26 May 2022 22:08:56 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:45948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nuPPJ-0000Pl-Sf; Thu, 26 May 2022 22:08:56 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 h9-20020a056830400900b0060b03bfe792so2106838ots.12; 
 Thu, 26 May 2022 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zkuD7A6Yj6XwFSiOczQv/QSOCUu/ayENq2NzEM/YnBo=;
 b=q5EEPdHyRpH7UzWNt+Lt2AtLVhNybjw9gZHKID0H00ILCMl1bwgi16z0/hY6EkOvTt
 +avfT+Jl0gKq+K1G3VQkIFKN7NCX8t+z+izk6DejxGsbstT+FR7P0Cv//SgCl97SFI1P
 jXA9QayLj2nRPUIS1xpxzFgObmeat2u4b3F0hbfICmALqLMVceFa5smU5QBdOALgQcNT
 PhuCb3vwPLkazvQtYVnjIcyJkA9TWS3RvvCi/r+OpOJ8szjXkn4s+QQkDWA1WhfzXHO2
 Y/pjSzi3b9dbtF4vC4M10ejuz8xtG2NvCCRPB88FMIruyVnUL4tP1zNWRY3xwazVauef
 zFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zkuD7A6Yj6XwFSiOczQv/QSOCUu/ayENq2NzEM/YnBo=;
 b=uaJGVffptJInSniFuL8RP5AGaewE5UyDlR9XSnUmJGTTgt4WuilXJTZAWz9KCLEEt1
 A2dQh4ButL/OJ1YykVQ4jqztlncS7xNZhal1XWhpxwCk89K4Xkb2BVCZ+/mQUg89oczs
 b0l1pGWH2s+0P7HV3a/zVFOIfUiNrtbGb2V/Sltd9+adA0hY83UxZe1agi1kmu7HYzv+
 kqr+X9ycI3L/MNm36LyvOwkU/g1pAA05/lU56HGJP53s++vwIcc9DDcJyqY7ZckLnuqy
 DYmQzaX3kNH7LQhqJG2wNRlRY6e9Rr02ZZWlJCcQ8AWT0652z+ysy77nogwYDNd/aj+O
 wL8g==
X-Gm-Message-State: AOAM533ylz+Edy8g+xEZedIODgVY3IjEzmHumWwl08rTzyMUFvQ/koyd
 8bU/+6w4YcP87UerQ7rDou32sg11fjG2SKfTnRQ=
X-Google-Smtp-Source: ABdhPJzp8xrihSrB4kJIJDiczeJ5Eb8NTI7Qpsj/A60d/q4jXLPLbAUjYTnIJZXVKWQ0qtv0D8mRixRzdiGzyPMzFdI=
X-Received: by 2002:a05:6830:18dc:b0:60a:e7a3:dbe7 with SMTP id
 v28-20020a05683018dc00b0060ae7a3dbe7mr14428752ote.186.1653617332278; Thu, 26
 May 2022 19:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220524045320.18606-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220524045320.18606-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 May 2022 12:08:26 +1000
Message-ID: <CAKmqyKNcHUtDPKu=SSZxY3uc7=bsAZG3q7iL+2rjqV3RyaXu5w@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: add support for zmmul extension v0.1
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x32d.google.com
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
X-List-Received-Date: Fri, 27 May 2022 02:08:57 -0000

On Tue, May 24, 2022 at 2:54 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - includes all multiplication operations for M extension
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> v2:
> * disable M when both M and Zmmul are enabled
>
> ---
>  target/riscv/cpu.c                      |  7 +++++++
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
>  3 files changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e373c61ba2..aec6882c5f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -598,6 +598,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_ifencei = true;
>          }
>
> +        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
> +            warn_report("Zmmul will override M");
> +            cpu->cfg.ext_m = false;
> +        }
> +
>          if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>              error_setg(errp,
>                         "I and E extensions are incompatible");
> @@ -903,6 +908,7 @@ static Property riscv_cpu_properties[] = {
>
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> +    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> @@ -1027,6 +1033,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
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

