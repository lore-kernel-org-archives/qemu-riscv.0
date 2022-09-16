Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ7Pg-0002kS-FO
	for mharc-qemu-riscv@gnu.org; Fri, 16 Sep 2022 05:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ7PY-0002di-9m; Fri, 16 Sep 2022 05:13:24 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:48608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ7PN-00042R-D4; Fri, 16 Sep 2022 05:13:18 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VPwhKoK_1663319583; 
Received: from 30.225.65.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VPwhKoK_1663319583) by smtp.aliyun-inc.com;
 Fri, 16 Sep 2022 17:13:05 +0800
Message-ID: <c099d830-6c8c-6aad-193f-b191b713a797@linux.alibaba.com>
Date: Fri, 16 Sep 2022 17:12:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 04/11] RISC-V: Adding T-Head Bitmanip instructions
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-5-christoph.muellner@vrull.eu>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220906122243.1243354-5-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
X-Spam_score_int: -116
X-Spam_score: -11.7
X-Spam_bar: -----------
X-Spam_report: (-11.7 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.816, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 16 Sep 2022 09:13:24 -0000


On 2022/9/6 20:22, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the T-Head Bitmanip instructions.
> The patch uses the T-Head specific decoder and translation.
>
> As the instructions are similar to those of Zb*, we can reuse
> a lot of existing infrastructure code.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   target/riscv/cpu.c                         |   3 +
>   target/riscv/cpu.h                         |   3 +
>   target/riscv/insn_trans/trans_xthead.c.inc | 124 +++++++++++++++++++++
>   target/riscv/meson.build                   |   3 +
>   target/riscv/translate.c                   |   9 ++
>   target/riscv/xtheadba.decode               |  46 ++++++++
>   target/riscv/xtheadbb.decode               |  62 +++++++++++
>   target/riscv/xtheadbs.decode               |  32 ++++++
>   8 files changed, 282 insertions(+)
>   create mode 100644 target/riscv/xtheadba.decode
>   create mode 100644 target/riscv/xtheadbb.decode
>   create mode 100644 target/riscv/xtheadbs.decode
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a72722cfa6..d129a6112a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -920,6 +920,9 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>   
>       /* Vendor-specific custom extensions */
> +    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
> +    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
> +    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
>       DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>       DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>       DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4ae22cf529..9e2b3d6f56 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -440,6 +440,9 @@ struct RISCVCPUConfig {
>       uint64_t mimpid;
>   
>       /* Vendor-specific custom extensions */
> +    bool ext_xtheadba;
> +    bool ext_xtheadbb;
> +    bool ext_xtheadbs;
>       bool ext_xtheadcmo;
>       bool ext_xtheadsync;
>       bool ext_XVentanaCondOps;
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
> index 0a6719b2e2..b2d523b905 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -70,3 +70,127 @@ NOP_PRIVCHECK(th_sync_i, REQUIRE_PRIV_MHSU)
>   NOP_PRIVCHECK(th_sync_is, REQUIRE_PRIV_MHSU)
>   NOP_PRIVCHECK(th_sync_s, REQUIRE_PRIV_MHSU)
>   
> +/*
> + * th.addsl is similar to sh[123]add (from Zba), but not an
> + * alternative encoding: while sh[123] applies the shift to rs1,
> + * th.addsl shifts rs2.
> + */
> +
> +#define GEN_TH_ADDSL(SHAMT)                                     \
> +static void gen_th_addsl##SHAMT(TCGv ret, TCGv arg1, TCGv arg2) \
> +{                                                               \
> +    TCGv t = tcg_temp_new();                                    \
> +    tcg_gen_shli_tl(t, arg2, SHAMT);                            \
> +    tcg_gen_add_tl(ret, t, arg1);                               \
> +    tcg_temp_free(t);                                           \
> +}
> +
> +GEN_TH_ADDSL(1)
> +GEN_TH_ADDSL(2)
> +GEN_TH_ADDSL(3)
> +
> +#define GEN_TRANS_TH_ADDSL(SHAMT)                                       \
> +static bool trans_th_addsl##SHAMT(DisasContext *ctx,                    \
> +                                  arg_th_addsl##SHAMT * a)              \
> +{                                                                       \
> +    return gen_arith(ctx, a, EXT_NONE, gen_th_addsl##SHAMT, NULL);      \
> +}
> +
> +GEN_TRANS_TH_ADDSL(1)
> +GEN_TRANS_TH_ADDSL(2)
> +GEN_TRANS_TH_ADDSL(3)
> +
> +
> +/* th.srri is an alternate encoding for rori (from Zbb) */
> +static bool trans_th_srri(DisasContext *ctx, arg_th_srri * a)
> +{
> +    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl, NULL);
> +}
> +

We should ensure that if the instruction only exists when XLEN is 64 or 
it can exist both when XLEN is 32 or 64.

If it can exist both when XLEN is 32 or 64,  we should ensure the 
calculation is right for both. trans_th_srri will not right when XLEN is 
32-bit. Please refer to gen_roriw().

> +/* th.srriw is an alternate encoding for roriw (from Zbb) */
> +static bool trans_th_srriw(DisasContext *ctx, arg_th_srriw *a)
> +{
> +    ctx->ol = MXL_RV32;

And if only exists when XLEN is 64, such as th.srriw, we should check 
the XLEN.

Thanks,
Zhiwei

> +    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
> +}
> +
> +/* th.ext and th.extu perform signed/unsigned bitfield extraction */
> +static bool gen_th_bfextract(DisasContext *ctx, arg_th_bfext *a,
> +                             void (*f)(TCGv, TCGv, unsigned int, unsigned int))
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv source = get_gpr(ctx, a->rs1, EXT_ZERO);
> +
> +    if (a->lsb <= a->msb) {
> +        f(dest, source, a->lsb, a->msb - a->lsb + 1);
> +        gen_set_gpr(ctx, a->rd, dest);
> +    }
> +    return true;
> +}
> +
> +static bool trans_th_ext(DisasContext *ctx, arg_th_ext *a)
> +{
> +    return gen_th_bfextract(ctx, a, tcg_gen_sextract_tl);
> +}
> +
> +static bool trans_th_extu(DisasContext *ctx, arg_th_extu *a)
> +{
> +    return gen_th_bfextract(ctx, a, tcg_gen_extract_tl);
> +}
> +
> +/* th.ff0: find first zero (clz on an inverted input) */
> +static void gen_th_ff0(TCGv ret, TCGv arg1)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_not_tl(t, arg1);
> +    gen_clz(ret, t);
> +    tcg_temp_free(t);
> +}
> +
> +static bool trans_th_ff0(DisasContext *ctx, arg_th_ff0 *a)
> +{
> +    return gen_unary(ctx, a, EXT_NONE, gen_th_ff0);
> +}
> +
> +/* th.ff1 is an alternate encoding for clz (from Zbb) */
> +static bool trans_th_ff1(DisasContext *ctx, arg_th_ff1 *a)
> +{
> +    return gen_unary(ctx, a, EXT_NONE, gen_clz);
> +}
> +
> +/* th.rev is an alternate encoding for the RV64 rev8 (from Zbb) */
> +static bool trans_th_rev(DisasContext *ctx, arg_th_rev *a)
> +{
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
> +}
> +
> +/* th.revw is a sign-extended byte-swap of the lower word */
> +static void gen_th_revw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_bswap_tl(ret, arg1);
> +    tcg_gen_sari_tl(ret, ret, 32);
> +}
> +
> +static bool trans_th_revw(DisasContext *ctx, arg_th_revw *a)
> +{
> +    return gen_unary(ctx, a, EXT_NONE, gen_th_revw);
> +}
> +
> +/* th.tstnbz is equivalent to an orc.b (from Zbb) with inverted result */
> +static void gen_th_tstnbz(TCGv ret, TCGv source1)
> +{
> +    gen_orc_b(ret, source1);
> +    tcg_gen_not_tl(ret, ret);
> +}
> +
> +static bool trans_th_tstnbz(DisasContext *ctx, arg_th_tstnbz *a)
> +{
> +    return gen_unary(ctx, a, EXT_ZERO, gen_th_tstnbz);
> +}
> +
> +/* th.tst is an alternate encoding for bexti (from Zbs) */
> +static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
> +{
> +    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
> +}
> +
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index f201cc6997..5ee37683cb 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -2,6 +2,9 @@
>   gen = [
>     decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
>     decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
> +  decodetree.process('xtheadba.decode', extra_args: '--static-decode=decode_xtheadba'),
> +  decodetree.process('xtheadbb.decode', extra_args: '--static-decode=decode_xtheadbb'),
> +  decodetree.process('xtheadbs.decode', extra_args: '--static-decode=decode_xtheadbs'),
>     decodetree.process('xtheadcmo.decode', extra_args: '--static-decode=decode_xtheadcmo'),
>     decodetree.process('xtheadsync.decode', extra_args: '--static-decode=decode_xtheadsync'),
>     decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index a63cc3de46..f662e403f8 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -132,6 +132,9 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
>           return ctx->cfg_ptr->ext_ ## ext ; \
>       }
>   
> +MATERIALISE_EXT_PREDICATE(xtheadba)
> +MATERIALISE_EXT_PREDICATE(xtheadbb)
> +MATERIALISE_EXT_PREDICATE(xtheadbs)
>   MATERIALISE_EXT_PREDICATE(xtheadcmo)
>   MATERIALISE_EXT_PREDICATE(xtheadsync)
>   MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
> @@ -720,6 +723,9 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
>   #include "decode-insn32.c.inc"
>   
>   /* Include decoders for factored-out extensions */
> +#include "decode-xtheadba.c.inc"
> +#include "decode-xtheadbb.c.inc"
> +#include "decode-xtheadbs.c.inc"
>   #include "decode-xtheadcmo.c.inc"
>   #include "decode-xtheadsync.c.inc"
>   #include "decode-XVentanaCondOps.c.inc"
> @@ -1042,6 +1048,9 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           bool (*decode_func)(DisasContext *, uint32_t);
>       } decoders[] = {
>           { always_true_p,  decode_insn32 },
> +        { has_xtheadba_p, decode_xtheadba },
> +        { has_xtheadbb_p, decode_xtheadbb },
> +        { has_xtheadbs_p, decode_xtheadbs },
>           { has_xtheadcmo_p, decode_xtheadcmo },
>           { has_xtheadsync_p, decode_xtheadsync },
>           { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
> diff --git a/target/riscv/xtheadba.decode b/target/riscv/xtheadba.decode
> new file mode 100644
> index 0000000000..4e5e3f12f0
> --- /dev/null
> +++ b/target/riscv/xtheadba.decode
> @@ -0,0 +1,46 @@
> +#
> +# RISC-V instruction decode for the XTheadBa extension
> +#
> +# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
> +#                    Christoph Muellner, christoph.muellner@vrull.eu
> +#
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +#
> +# The XTheadBa extension provides instructions for address calculations,
> +# implementing the functional equivalent of a subset of Zba.
> +#
> +# It is documented in
> +# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
> +#
> +# The instruction contained in XTheadBb is:
> +# - th.addsl      add rotate-right by immediate
> +#                 (similar to sh[123]add, but with rs1 and rs2 switched)
> +# This instruction reuses an existing instruction format.
> +
> +# Fields
> +%rs2       20:5
> +%rs1       15:5
> +%rd        7:5
> +
> +# Argument sets
> +&r         rd rs1 rs2		!extern
> +
> +# Formats:
> +@r          ....... ..... .....  ... ..... ....... &r %rs2 %rs1 %rd
> +
> +# *** Bitmanip addressing instructions
> +# Instead of defining a new encoding, we simply use the decoder to
> +# extract the imm[0:1] field and dispatch to separate translation
> +# functions (mirroring the `sh[123]add` instructions from Zba and
> +# the regular RVI `add` instruction.
> +#
> +# The only difference between sh[123]add and addsl is that the sohift
> +# is applied to rs1 (for addsl) instead of rs2 (for sh[123]add).
> +#
> +# Note that shift-by-0 is a valid operation according to the manual.
> +# This will be equivalent to a regular add.
> +add              0000000 ..... ..... 001 ..... 0001011 @r
> +th_addsl1        0000001 ..... ..... 001 ..... 0001011 @r
> +th_addsl2        0000010 ..... ..... 001 ..... 0001011 @r
> +th_addsl3        0000011 ..... ..... 001 ..... 0001011 @r
> +
> diff --git a/target/riscv/xtheadbb.decode b/target/riscv/xtheadbb.decode
> new file mode 100644
> index 0000000000..2754a6444b
> --- /dev/null
> +++ b/target/riscv/xtheadbb.decode
> @@ -0,0 +1,62 @@
> +#
> +# RISC-V instruction decode for the XTheadBb extension
> +#
> +# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
> +#                    Christoph Muellner, christoph.muellner@vrull.eu
> +#
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +#
> +# The XTheadBb extension provides basic bit-manipulation instructions,
> +# implementing the functional equivalent of a subset of Zbb.
> +#
> +# It is documented in
> +# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
> +#
> +# The instructions contained in XTheadBb are:
> +# - th.srri       rotate-right by immediate (matches rori)
> +# - th.srriw      rotate-right by immediate, w-form (matches roriw)
> +# - th.rev        byte-reverse register (matches RV64-form of rev8)
> +# - th.revw       byte-reverse low word, sign-extend result (no equivalent)
> +# - th.ext        signed bitfield-extract (no equivalent)
> +# - th.extu       unsigned bitfield-extract (no equivalent)
> +# - th.ff0        find-first zero (equivalent to clz on the inverted operand)
> +# - th.ff1        find-first one (matches clz)
> +# - th.tstnbz     test for zero-bytes (equivalent to the inverted result of orc.b)
> +# - th.tst        test for bit (equivalent to bexti)
> +#
> +# These instructions generally reuse existing instruction formats.
> +# Only the th.ext and th.ext introduce a new, vendor-defined instruction format.
> +
> +# Fields
> +%rs2       20:5
> +%rs1       15:5
> +%rd        7:5
> +%sh5       20:5
> +%sh6       20:6
> +
> +# Argument sets
> +&r2        rd rs1		!extern
> +&shift     shamt rs1 rd		!extern
> +&th_bfext  msb lsb rs1 rd
> +
> +# Formats:
> +@r2         ....... ..... .....  ... ..... ....... &r2 %rs1 %rd
> +@th_bfext   msb:6  lsb:6  .....  ... ..... ....... &th_bfext %rs1 %rd
> +
> +# Formats 64:
> +@sh5        ....... ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
> +
> +# Formats 128:
> +@sh6        ...... ...... .....  ... ..... ....... &shift shamt=%sh6 %rs1 %rd
> +
> +# *** Bitmanip instructions
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
> diff --git a/target/riscv/xtheadbs.decode b/target/riscv/xtheadbs.decode
> new file mode 100644
> index 0000000000..7aa345b207
> --- /dev/null
> +++ b/target/riscv/xtheadbs.decode
> @@ -0,0 +1,32 @@
> +#
> +# RISC-V instruction decode for the XTheadBb extension
> +#
> +# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
> +#                    Christoph Muellner, christoph.muellner@vrull.eu
> +#
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +#
> +# XTheadBs provides basic bit-manipulation instructions,
> +# implementing the functional equivalent of a subset of Zbs.
> +#
> +# It is documented in
> +# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
> +#
> +# The instruction contained in XTheadBb is:
> +# - th.tst        test if bit is set (matches bexti)
> +#
> +# The instruction reuses an existing instruction format.
> +
> +# Fields
> +%rs1       15:5
> +%rd        7:5
> +%sh6       20:6
> +
> +# Argument sets
> +&shift     shamt rs1 rd		!extern
> +
> +# Formats 128:
> +@sh6        ...... ...... .....  ... ..... ....... &shift shamt=%sh6 %rs1 %rd
> +
> +# *** Bitmanip single-bit instructions
> +th_tst           100010 ...... ..... 001 ..... 0001011 @sh6

