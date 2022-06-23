Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o4Pq1-0001LZ-7Z
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jun 2022 12:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1o4Ppz-0001LJ-DG; Thu, 23 Jun 2022 12:37:47 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1o4Ppu-0003c4-Rk; Thu, 23 Jun 2022 12:37:47 -0400
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1o4Ppp-00030R-0m; Thu, 23 Jun 2022 18:37:37 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>
Subject: Re: [RFC PATCH v3] RISC-V: Add Zawrs ISA extension support
Date: Thu, 23 Jun 2022 18:37:36 +0200
Message-ID: <3680193.kQq0lBPeGt@diego>
In-Reply-To: <20220623152907.1606964-1-christoph.muellner@vrull.eu>
References: <20220623152907.1606964-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jun 2022 16:37:47 -0000

Am Donnerstag, 23. Juni 2022, 17:29:07 CEST schrieb Christoph Muellner:
> This patch adds support for the Zawrs ISA extension.
> Given the current (incomplete) implementation of reservation sets
> there seems to be no way to provide a full emulation of the WRS
> instruction (wake on reservation set invalidation or timeout or
> interrupt). Therefore, we just pretend that an interrupt occured,
> exit the execution loop and finally continue execution.
>=20
> The specification can be found here:
> https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
>=20
> Note, that the Zawrs extension is not frozen or ratified yet.
> Therefore this patch is an RFC and not intended to get merged.
>=20
> Changes since v2:
> * Adjustments according to a specification change
> * Inline REQUIRE_ZAWRS() since it has only one user
>=20
> Changes since v1:
> * Adding zawrs to the ISA string that is passed to the kernel
>=20
> Signed-off-by: Christoph M=FCllner <christoph.muellner@vrull.eu>

on both rv64 and rv32
Tested-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  target/riscv/cpu.c                          |  2 +
>  target/riscv/cpu.h                          |  1 +
>  target/riscv/insn32.decode                  |  4 ++
>  target/riscv/insn_trans/trans_rvzawrs.c.inc | 54 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  5 files changed, 62 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
>=20
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 05e6521351..6cb00fadff 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -882,6 +882,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zawrs", RISCVCPU, cfg.ext_zawrs, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> @@ -1075,6 +1076,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zicsr, ext_icsr),
>          ISA_EDATA_ENTRY(zifencei, ext_ifencei),
>          ISA_EDATA_ENTRY(zmmul, ext_zmmul),
> +        ISA_EDATA_ENTRY(zawrs, ext_zawrs),
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7d6397acdf..a22bc0fa09 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -380,6 +380,7 @@ struct RISCVCPUConfig {
>      bool ext_h;
>      bool ext_j;
>      bool ext_v;
> +    bool ext_zawrs;
>      bool ext_zba;
>      bool ext_zbb;
>      bool ext_zbc;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4033565393..513ea227fe 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -711,6 +711,10 @@ vsetvli         0 ........... ..... 111 ..... 101011=
1  @r2_zimm11
>  vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> =20
> +# *** Zawrs Standard Extension ***
> +wrs_nto    000000001101 00000 000 00000 1110011
> +wrs_sto    000000011101 00000 000 00000 1110011
> +
>  # *** RV32 Zba Standard Extension ***
>  sh1add     0010000 .......... 010 ..... 0110011 @r
>  sh2add     0010000 .......... 100 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/i=
nsn_trans/trans_rvzawrs.c.inc
> new file mode 100644
> index 0000000000..d0df56378e
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> @@ -0,0 +1,54 @@
> +/*
> + * RISC-V translation routines for the RISC-V Zawrs Extension.
> + *
> + * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +static bool trans_wrs(DisasContext *ctx)
> +{
> +    if (!ctx->cfg_ptr->ext_zawrs) {
> +        return false;
> +    }
> +
> +    /*
> +     * We may continue if one or more of the following conditions are me=
t:
> +     * a) The reservation set is invalid
> +     * b) If WRS.STO, a short time since start of stall has elapsed
> +     * c) An interrupt is observed
> +     *
> +     * A reservation set can be invalidated by any store to a reserved
> +     * memory location. However, that's currently not implemented in QEM=
U.
> +     * So let's just exit the CPU loop and pretend that an interrupt occ=
ured.
> +     */
> +
> +    /* Clear the load reservation  (if any).  */
> +    tcg_gen_movi_tl(load_res, -1);
> +
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
> +
> +    return true;
> +}
> +
> +#define GEN_TRANS_WRS(insn)						\
> +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)		\
> +{									\
> +	(void)a;							\
> +	return trans_wrs(ctx);						\
> +}
> +
> +GEN_TRANS_WRS(wrs_nto)
> +GEN_TRANS_WRS(wrs_sto)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b151c20674..a4f07d5166 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
> +#include "insn_trans/trans_rvzawrs.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>=20





