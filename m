Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5lP-0002g0-3j
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 17:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5lN-0002fm-Op; Mon, 23 Jan 2023 17:58:05 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5lL-0007eG-Bt; Mon, 23 Jan 2023 17:58:05 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id z3so4670331vkb.11;
 Mon, 23 Jan 2023 14:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nl8tqwQCulwVqfCovP/d/Eb0W/DrOm67y8uH1PYUEgA=;
 b=Vo9k2oHkzbAhVzLOVHyvNjUy4sXCgdIFbGIkdaNoZNu5HIglKAPYbRYB8q/AuzEnhA
 l42YJyjsZIOmy65xs/vRCe0TSk5jVpIKw6l4X/G3PVbeCa5C0qhZnkjdPlg07x903D5j
 oilouEGIymSbkRWRH2frNIPDEIDztxtw/IPOAkmEwdxbkHqWHaTFKcskdj2bNhbL30+3
 gR58GDRv05KY05p+l19bpUVOD30Ztb4KOE37/ouw9lxOrCTWjvVKO8DljNaJ8pjYLW5u
 lGhw6TyjOWkF6EbSdY7eJBmaruwb1cxD1vy+aukqVpacXvLI3TGuHjRlyApRCCc9iLkQ
 91Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nl8tqwQCulwVqfCovP/d/Eb0W/DrOm67y8uH1PYUEgA=;
 b=S4FdD0YHU2UM9z1ga9itOOcYi1oS3enslEKz1n/ZhjYA5AFVXOXKXVL0lqj9K3WCkW
 ZBw0SeU9WlEYFs/A0j2MejM1UL4BQGW/NUC1Bz+pNlEwxNQq629pythd7BjoYw07Pu86
 eYTDdZlSiEinGQ/dS8zKYtN8spYA/DCU2ABnigmjNVOlFJjELZtZYCade1+dXT82hPnO
 Iykc/RXB9NcCxdu64nGj/VoeB3iWFpf5OICpVCbWcvXYcUgyrLabW1P93xLCeIHzGrQc
 IrRvnVcxmUjeZaAmbY1dl/yiep7xuYPn/eKuijKtdZ1KNyU4Uxv828lNoqezrMNZSYIT
 AaMg==
X-Gm-Message-State: AFqh2kpBh6dYjxNeEl/zMT9HPSfqqb4xy+bTnZXpD7HqbFJbkRPz63mC
 nKah9j8+eLSJRClWTUrNajxeitDsa6/DiFs89qQ=
X-Google-Smtp-Source: AMrXdXslLlOfPP88F3Mkk3xhYPrZ8lrjJg8WVfrG7Ck84+eef6NjlnhhKENaA6UOmSV/SN8U+6eDPhskVkAt5aWW7sM=
X-Received: by 2002:a1f:c847:0:b0:3e1:fea5:1dc6 with SMTP id
 y68-20020a1fc847000000b003e1fea51dc6mr1675520vkf.26.1674514682095; Mon, 23
 Jan 2023 14:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-5-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-5-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 08:57:35 +1000
Message-ID: <CAKmqyKPWPy0UrWOdnGj_PZ-p+WughcfUGKap0dExcZnpBPO9nw@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] RISC-V: Adding XTheadBb ISA extension
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 22:58:06 -0000

On Sat, Dec 24, 2022 at 4:02 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the XTheadBb ISA extension.
> The patch uses the T-Head specific decoder and translation.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Split XtheadB* extension into individual commits
> - Make implementation compatible with RV32.
> - Use single decoder for XThead extensions
>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |   2 +
>  target/riscv/cpu.h                         |   1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 124 +++++++++++++++++++++
>  target/riscv/translate.c                   |   4 +-
>  target/riscv/xthead.decode                 |  20 ++++
>  5 files changed, 149 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 809b6eb4ed..b5285fb7a7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -109,6 +109,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
>      ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba=
),
> +    ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb=
),
>      ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
>      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
> @@ -1064,6 +1065,7 @@ static Property riscv_cpu_extensions[] =3D {
>
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
> +    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ec2588a0f0..0ac1d3f5ef 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -466,6 +466,7 @@ struct RISCVCPUConfig {
>
>      /* Vendor-specific custom extensions */
>      bool ext_xtheadba;
> +    bool ext_xtheadbb;
>      bool ext_xtheadcmo;
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 79e1f5bde9..a55d1491fa 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -22,6 +22,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADBB(ctx) do {               \
> +    if (!ctx->cfg_ptr->ext_xtheadbb) {           \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADCMO(ctx) do {              \
>      if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
>          return false;                            \
> @@ -67,6 +73,124 @@ GEN_TRANS_TH_ADDSL(1)
>  GEN_TRANS_TH_ADDSL(2)
>  GEN_TRANS_TH_ADDSL(3)
>
> +/* XTheadBb */
> +
> +/* th.srri is an alternate encoding for rori (from Zbb) */
> +static bool trans_th_srri(DisasContext *ctx, arg_th_srri * a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
> +                                   tcg_gen_rotri_tl, gen_roriw, NULL);
> +}
> +
> +/* th.srriw is an alternate encoding for roriw (from Zbb) */
> +static bool trans_th_srriw(DisasContext *ctx, arg_th_srriw *a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +    REQUIRE_64BIT(ctx);
> +    ctx->ol =3D MXL_RV32;
> +    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
> +}
> +
> +/* th.ext and th.extu perform signed/unsigned bitfield extraction */
> +static bool gen_th_bfextract(DisasContext *ctx, arg_th_bfext *a,
> +                             void (*f)(TCGv, TCGv, unsigned int, unsigne=
d int))
> +{
> +    TCGv dest =3D dest_gpr(ctx, a->rd);
> +    TCGv source =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> +
> +    if (a->lsb <=3D a->msb) {
> +        f(dest, source, a->lsb, a->msb - a->lsb + 1);
> +        gen_set_gpr(ctx, a->rd, dest);
> +    }
> +    return true;
> +}
> +
> +static bool trans_th_ext(DisasContext *ctx, arg_th_ext *a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +    return gen_th_bfextract(ctx, a, tcg_gen_sextract_tl);
> +}
> +
> +static bool trans_th_extu(DisasContext *ctx, arg_th_extu *a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +    return gen_th_bfextract(ctx, a, tcg_gen_extract_tl);
> +}
> +
> +/* th.ff0: find first zero (clz on an inverted input) */
> +static bool gen_th_ff0(DisasContext *ctx, arg_th_ff0 *a, DisasExtend ext=
)
> +{
> +    TCGv dest =3D dest_gpr(ctx, a->rd);
> +    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
> +
> +    int olen =3D get_olen(ctx);
> +    TCGv t =3D tcg_temp_new();
> +
> +    tcg_gen_not_tl(t, src1);
> +    if (olen !=3D TARGET_LONG_BITS) {
> +        if (olen =3D=3D 32) {
> +            gen_clzw(dest, t);
> +        } else {
> +            g_assert_not_reached();
> +        }
> +    } else {
> +        gen_clz(dest, t);
> +    }
> +
> +    tcg_temp_free(t);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +static bool trans_th_ff0(DisasContext *ctx, arg_th_ff0 *a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +    return gen_th_ff0(ctx, a, EXT_NONE);
> +}
> +
> +/* th.ff1 is an alternate encoding for clz (from Zbb) */
> +static bool trans_th_ff1(DisasContext *ctx, arg_th_ff1 *a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +    return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
> +}
> +
> +static void gen_th_revw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_bswap32_tl(ret, arg1, TCG_BSWAP_OS);
> +}
> +
> +/* th.rev is an alternate encoding for the RV64 rev8 (from Zbb) */
> +static bool trans_th_rev(DisasContext *ctx, arg_th_rev *a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +
> +    return gen_unary_per_ol(ctx, a, EXT_NONE, tcg_gen_bswap_tl, gen_th_r=
evw);
> +}
> +
> +/* th.revw is a sign-extended byte-swap of the lower word */
> +static bool trans_th_revw(DisasContext *ctx, arg_th_revw *a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_unary(ctx, a, EXT_NONE, gen_th_revw);
> +}
> +
> +/* th.tstnbz is equivalent to an orc.b (from Zbb) with inverted result *=
/
> +static void gen_th_tstnbz(TCGv ret, TCGv source1)
> +{
> +    gen_orc_b(ret, source1);
> +    tcg_gen_not_tl(ret, ret);
> +}
> +
> +static bool trans_th_tstnbz(DisasContext *ctx, arg_th_tstnbz *a)
> +{
> +    REQUIRE_XTHEADBB(ctx);
> +    return gen_unary(ctx, a, EXT_ZERO, gen_th_tstnbz);
> +}
> +
>  /* XTheadCmo */
>
>  static inline int priv_level(DisasContext *ctx)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 7b35f1d71b..8439ff0bf4 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -127,8 +127,8 @@ static bool always_true_p(DisasContext *ctx  __attrib=
ute__((__unused__)))
>
>  static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
>  {
> -    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadcmo ||
> -           ctx->cfg_ptr->ext_xtheadsync;
> +    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
> +           ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index b149f13018..8cd140891b 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -13,14 +13,23 @@
>  %rd        7:5
>  %rs1       15:5
>  %rs2       20:5
> +%sh5       20:5
> +%sh6       20:6
>
>  # Argument sets
>  &r         rd rs1 rs2                               !extern
> +&r2        rd rs1                                   !extern
> +&shift     shamt rs1 rd                             !extern
> +&th_bfext  msb lsb rs1 rd
>
>  # Formats
>  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
>  @rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
>  @r          ....... ..... .....  ... ..... .......  &r %rs2 %rs1 %rd
> +@r2         ....... ..... .....  ... ..... .......  &r2 %rs1 %rd
> +@th_bfext   msb:6  lsb:6  .....  ... ..... .......  &th_bfext %rs1 %rd
> +@sh5        ....... ..... .....  ... ..... .......  &shift  shamt=3D%sh5=
      %rs1 %rd
> +@sh6        ...... ...... .....  ... ..... .......  &shift shamt=3D%sh6 =
%rs1 %rd
>
>  # XTheadBa
>  # Instead of defining a new encoding, we simply use the decoder to
> @@ -38,6 +47,17 @@ th_addsl1        0000001 ..... ..... 001 ..... 0001011=
 @r
>  th_addsl2        0000010 ..... ..... 001 ..... 0001011 @r
>  th_addsl3        0000011 ..... ..... 001 ..... 0001011 @r
>
> +# XTheadBb
> +th_ext           ...... ...... ..... 010 ..... 0001011 @th_bfext
> +th_extu          ...... ...... ..... 011 ..... 0001011 @th_bfext
> +th_ff0           1000010 00000 ..... 001 ..... 0001011 @r2
> +th_ff1           1000011 00000 ..... 001 ..... 0001011 @r2
> +th_srri          000100 ...... ..... 001 ..... 0001011 @sh6
> +th_srriw         0001010 ..... ..... 001 ..... 0001011 @sh5
> +th_rev           1000001 00000 ..... 001 ..... 0001011 @r2
> +th_revw          1001000 00000 ..... 001 ..... 0001011 @r2
> +th_tstnbz        1000000 00000 ..... 001 ..... 0001011 @r2
> +
>  # XTheadCmo
>  th_dcache_call   0000000 00001 00000 000 00000 0001011
>  th_dcache_ciall  0000000 00011 00000 000 00000 0001011
> --
> 2.38.1
>
>

