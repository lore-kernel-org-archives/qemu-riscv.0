Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5jY-0001i8-Oq
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 17:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5jX-0001hd-9T; Mon, 23 Jan 2023 17:56:11 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5jU-0007Me-8F; Mon, 23 Jan 2023 17:56:10 -0500
Received: by mail-vs1-xe34.google.com with SMTP id t10so14733415vsr.3;
 Mon, 23 Jan 2023 14:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N06NnhVaUdYbKzeB4vHXnuqqpbV1u/Omrk1hGgWoqyM=;
 b=aOntVV81Vw+x134/OxQyOS+NhJ9tpZ9iqTef7L7KZ50V7YjQq/J3KXGt4U0OamlIS5
 eFToU7IB5MgNa1N5QXb20YkOAKEgA3075XI3UM8vfrVTQgyRiFL0DFCCzDqMo6VIuiMl
 GrRaipxKfdbJJ99N/rZuhmhKJvGM4Izw3n85pB5KsXK2G9cjid3DbUBjMQfn/wJtLFAN
 PEC4X6etXrjwn52kcUYz47TMDQFf14TQ0P3ijgjof8MbS4qYFQEXv/kuORSKPIOA+ZgP
 lQM7+lUJHopzjU/zusBr8yYvEm48/kdit253JtWt4/hYcxORXYQ0DvTElxAPr15L5KR3
 bGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N06NnhVaUdYbKzeB4vHXnuqqpbV1u/Omrk1hGgWoqyM=;
 b=pZhpcXXuaVOXBkbaaPYzQVnupKznuMUD0QySPHIw40aEpVRVc4hmZ9WEFQFAasbtsC
 7yxb9AxyEKsIgQKfLAXa+TS9JfXwOPJyvmm0tpHeToaCwKa0ZWfrCv3H4WZaIpO8wF/O
 nklFIpf+IPJXpiOJouAHewZfLdwcjBvE+2QLzJsHZqbAZjIQ42H84UA921z3s1r1udV2
 dggXrVUebXVKttubFlrZHCGhCcnOpOxwPo2EQ35Zv3coUmaHrbO3S1hTtsuz7slExnzO
 MMvAhp/w7Zxz513lGUFAtEW64aQglEB5dQAvtECMBuPrKZJjft1FPj0vRvvoZ7zG9ANo
 nFKA==
X-Gm-Message-State: AFqh2kr0lIjL1W+REoCx5SSpY2YeNFa8Tv2OCoWf4k9z7qZ2R83ezMxm
 KeS+gymZdXgCX+GaSLz1UXM27FSTZzH+EW5ADCk=
X-Google-Smtp-Source: AMrXdXttXD1j+4NR3ZS+a3NiB3FnQskcbRkEoNYjks5dANytIxTJpKPnr2KgiPfbmJsKSUhrfxznFVQwW4tY0v4w7vw=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr3745508vso.73.1674514566982; Mon, 23
 Jan 2023 14:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-4-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-4-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 08:55:40 +1000
Message-ID: <CAKmqyKMemiY6PN_LMz4jGd0GfxTRENhV+HGVA2USfaZB+seDKA@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] RISC-V: Adding XTheadBa ISA extension
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 22:56:11 -0000

On Sat, Dec 24, 2022 at 4:10 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the XTheadBa ISA extension.
> The patch uses the T-Head specific decoder and translation.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Split XtheadB* extension into individual commits
> - Use single decoder for XThead extensions
>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |  2 ++
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 39 ++++++++++++++++++++++
>  target/riscv/translate.c                   |  3 +-
>  target/riscv/xthead.decode                 | 22 ++++++++++++
>  5 files changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a848836d2e..809b6eb4ed 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -108,6 +108,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba=
),
>      ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
>      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
> @@ -1062,6 +1063,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>
>      /* Vendor-specific custom extensions */
> +    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4d3da2acfa..ec2588a0f0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -465,6 +465,7 @@ struct RISCVCPUConfig {
>      uint64_t mimpid;
>
>      /* Vendor-specific custom extensions */
> +    bool ext_xtheadba;
>      bool ext_xtheadcmo;
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 6009d61c81..79e1f5bde9 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -16,6 +16,12 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#define REQUIRE_XTHEADBA(ctx) do {               \
> +    if (!ctx->cfg_ptr->ext_xtheadba) {           \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADCMO(ctx) do {              \
>      if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
>          return false;                            \
> @@ -28,6 +34,39 @@
>      }                                            \
>  } while (0)
>
> +/* XTheadBa */
> +
> +/*
> + * th.addsl is similar to sh[123]add (from Zba), but not an
> + * alternative encoding: while sh[123] applies the shift to rs1,
> + * th.addsl shifts rs2.
> + */
> +
> +#define GEN_TH_ADDSL(SHAMT)                                     \
> +static void gen_th_addsl##SHAMT(TCGv ret, TCGv arg1, TCGv arg2) \
> +{                                                               \
> +    TCGv t =3D tcg_temp_new();                                    \
> +    tcg_gen_shli_tl(t, arg2, SHAMT);                            \
> +    tcg_gen_add_tl(ret, t, arg1);                               \
> +    tcg_temp_free(t);                                           \
> +}
> +
> +GEN_TH_ADDSL(1)
> +GEN_TH_ADDSL(2)
> +GEN_TH_ADDSL(3)
> +
> +#define GEN_TRANS_TH_ADDSL(SHAMT)                                       =
\
> +static bool trans_th_addsl##SHAMT(DisasContext *ctx,                    =
\
> +                                  arg_th_addsl##SHAMT * a)              =
\
> +{                                                                       =
\
> +    REQUIRE_XTHEADBA(ctx);                                              =
\
> +    return gen_arith(ctx, a, EXT_NONE, gen_th_addsl##SHAMT, NULL);      =
\
> +}
> +
> +GEN_TRANS_TH_ADDSL(1)
> +GEN_TRANS_TH_ADDSL(2)
> +GEN_TRANS_TH_ADDSL(3)
> +
>  /* XTheadCmo */
>
>  static inline int priv_level(DisasContext *ctx)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index c40617662a..7b35f1d71b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -127,7 +127,8 @@ static bool always_true_p(DisasContext *ctx  __attrib=
ute__((__unused__)))
>
>  static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
>  {
> -    return ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
> +    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadcmo ||
> +           ctx->cfg_ptr->ext_xtheadsync;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index 1d86f3a012..b149f13018 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -2,6 +2,7 @@
>  # Translation routines for the instructions of the XThead* ISA extension=
s
>  #
>  # Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
> +#                    Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
>  #
>  # SPDX-License-Identifier: LGPL-2.1-or-later
>  #
> @@ -9,12 +10,33 @@
>  #   https://github.com/T-head-Semi/thead-extension-spec/releases/latest
>
>  # Fields:
> +%rd        7:5
>  %rs1       15:5
>  %rs2       20:5
>
> +# Argument sets
> +&r         rd rs1 rs2                               !extern
> +
>  # Formats
>  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
>  @rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
> +@r          ....... ..... .....  ... ..... .......  &r %rs2 %rs1 %rd
> +
> +# XTheadBa
> +# Instead of defining a new encoding, we simply use the decoder to
> +# extract the imm[0:1] field and dispatch to separate translation
> +# functions (mirroring the `sh[123]add` instructions from Zba and
> +# the regular RVI `add` instruction.
> +#
> +# The only difference between sh[123]add and addsl is that the shift
> +# is applied to rs1 (for addsl) instead of rs2 (for sh[123]add).
> +#
> +# Note that shift-by-0 is a valid operation according to the manual.
> +# This will be equivalent to a regular add.
> +add              0000000 ..... ..... 001 ..... 0001011 @r
> +th_addsl1        0000001 ..... ..... 001 ..... 0001011 @r
> +th_addsl2        0000010 ..... ..... 001 ..... 0001011 @r
> +th_addsl3        0000011 ..... ..... 001 ..... 0001011 @r
>
>  # XTheadCmo
>  th_dcache_call   0000000 00001 00000 000 00000 0001011
> --
> 2.38.1
>
>

