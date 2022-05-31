Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nvpa2-0006Sk-Kc
	for mharc-qemu-riscv@gnu.org; Mon, 30 May 2022 20:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpa1-0006SF-5i; Mon, 30 May 2022 20:17:49 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:36419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpZy-0005He-Si; Mon, 30 May 2022 20:17:48 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 e11-20020a9d6e0b000000b0060afcbafa80so8652940otr.3; 
 Mon, 30 May 2022 17:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hcUgNuzqArG0QGiVAeXGSViI5GFA7PdWmV+WynLyscE=;
 b=RDoJW6zEUuELMA74J8XK6PZKQtDvxQ1DQ4THEIzZzZWW6hXhD8KBHbR19PZ4y/xCWg
 N7qHxSEJhmZYoyOjgRKb3kPw5P/clLPJwkKB6+3JehqZwNlgMrJ74Or3izGYog0CtSEt
 JJEeJO1lYfJdi9+7WamLbETt9Hhhyrfpv+rfLNGFwxYCV0QwJCKufsNvS1cdbH654Yly
 h293x6go7NdipvW1b0Y4iJ6TadNHsFlxF2Zppm0gnngxU9jlzxHPG9XWDNoc5Nkt6Tit
 fRMqMmFaS1s/L+MKrgMpfPRgI7+/yA4Kam5L1lG0NtdYqViCKeCWm025EG1w42SsR7o/
 KoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hcUgNuzqArG0QGiVAeXGSViI5GFA7PdWmV+WynLyscE=;
 b=ehhvVfF2lnJ7LABAvxcTkmYejaG6gEsrTg6MZckBQRQBLmDJgNTcyatelZVgGrz8jU
 aO8bJyWjXfKZo9029D/dOrE9LyEEYRYGN+yrdJLynZ5/IT73b72ogK/26CZ2zbO1zNIU
 +BNvQ3ToJDKaBfFRIUZJvMlmjfgSGv+nLiSS15Qz6Dn/QhIwOFmGQbZtQ+W8wp10yi+X
 kkuDatJ4ZvwCGHDg7Qnzvy45DNXN+Fp4dOdUKEXNVG0tyyZGuf6GLNfcodqQ26/3FsaH
 Zr3RSlCwUH/M4JER4jlcKakd9skoYH+a2IJAE1GAmqq8OnOLl519LtL6WzueaEk6WiMK
 AQMw==
X-Gm-Message-State: AOAM530JUc92S2amlFYygkMbSk8iuCO/bYCk1QesCzcb0ZUsMby80x9n
 Tn05MyFCXWABBiTtSQUI4fV/5oj9Vdct89P/7rI=
X-Google-Smtp-Source: ABdhPJxCm3mEwV/w8YrB2WqRSgacz1XQtnySf2oqKwRw7ZLQO3v1zP8g53wakTRmEhn8ZGk2llhnRyykQd17F8kwi64=
X-Received: by 2002:a05:6830:448e:b0:60b:254e:7439 with SMTP id
 r14-20020a056830448e00b0060b254e7439mr12495066otv.338.1653956265158; Mon, 30
 May 2022 17:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220524045320.18606-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220524045320.18606-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 May 2022 10:17:19 +1000
Message-ID: <CAKmqyKPK9jmBNF_FMw+xGcwDXXkUssw0hV3E7Tw8yd9pLAn4rw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: add support for zmmul extension v0.1
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x331.google.com
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
X-List-Received-Date: Tue, 31 May 2022 00:17:49 -0000

On Tue, May 24, 2022 at 2:54 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - includes all multiplication operations for M extension
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Do you mind rebasing this on the latest master branch and sending a v3?

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

