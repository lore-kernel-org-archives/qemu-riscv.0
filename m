Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwlu4-0002W8-4k
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jun 2022 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nwlu3-0002Ub-2W; Thu, 02 Jun 2022 10:34:23 -0400
Received: from gloria.sntech.de ([185.11.138.130]:53194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nwltz-000655-Af; Thu, 02 Jun 2022 10:34:22 -0400
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nwltn-0000TB-Ox; Thu, 02 Jun 2022 16:34:07 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Christoph Muellner <cmuellner@gcc.gnu.org>
Subject: Re: [RFC PATCH v2] RISC-V: Add Zawrs ISA extension support
Date: Thu, 02 Jun 2022 16:34:07 +0200
Message-ID: <9966887.0AQdONaE2F@diego>
In-Reply-To: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
References: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: none client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Jun 2022 14:34:23 -0000

Am Donnerstag, 2. Juni 2022, 15:40:17 CEST schrieb Christoph Muellner:
> From: Christoph Muellner <christoph.muellner@vrull.eu>
> 
> This patch adds support for the Zawrs ISA extension.
> Given the current (incomplete) implementation of reservation sets
> there seems to be no way to provide a full emulation of the WRS
> instruction (wake on reservation set invalidation or timeout or
> interrupt). Therefore, we just pretend that an interrupt occured,
> exit the execution loop and finally continue execution.
> 
> The specification can be found here:
> https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> 
> Note, that the Zawrs extension is not frozen or ratified yet.
> Therefore this patch is an RFC and not intended to get merged.
> 
> Changes since v1:
> * Adding zawrs to the ISA string that is passed to the kernel
> 
> Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>

together with the Linux-kernel patch

Tested-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  target/riscv/cpu.c                          |  2 +
>  target/riscv/cpu.h                          |  1 +
>  target/riscv/insn32.decode                  |  3 ++
>  target/riscv/insn_trans/trans_rvzawrs.c.inc | 48 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  5 files changed, 55 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a91253d4bd..95858f04bd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -877,6 +877,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>  
> +    DEFINE_PROP_BOOL("zawrs", RISCVCPU, cfg.ext_zawrs, true),
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> @@ -1031,6 +1032,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>      struct isa_ext_data isa_edata_arr[] = {
>          ISA_EDATA_ENTRY(zicsr, ext_icsr),
>          ISA_EDATA_ENTRY(zifencei, ext_ifencei),
> +        ISA_EDATA_ENTRY(zawrs, ext_zawrs),
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f08c3e8813..2ef2efe22e 100644
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
> index 4033565393..ce20eab738 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -111,6 +111,9 @@ wfi         0001000    00101 00000 000 00000 1110011
>  sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
>  sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
>  
> +# *** Zawrs Instruction Extension ***
> +wrs         000000010000     ..... 000 00000 1110011 @sfence_vm
> +
>  # *** RV32I Base Instruction Set ***
>  lui      ....................       ..... 0110111 @u
>  auipc    ....................       ..... 0010111 @u
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> new file mode 100644
> index 0000000000..38b71d0085
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> @@ -0,0 +1,48 @@
> +/*
> + * RISC-V translation routines for the RISC-V Zawrs Extension.
> + *
> + * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZAWRS(ctx) do {         \
> +    if (!ctx->cfg_ptr->ext_zawrs) {     \
> +        return false;                   \
> +    }                                   \
> +} while (0)
> +
> +static bool trans_wrs(DisasContext *ctx, arg_sfence_vm *a)
> +{
> +    REQUIRE_ZAWRS(ctx);
> +
> +    /*
> +     * We may continue if one or more of the following conditions are met:
> +     * a) reservation set is invalid
> +     * b) rs1 != 0 and X(rs1) < time CSR
> +     * c) interrupt observed
> +     *
> +     * A reservation set can be invalidated by any store to a reserved
> +     * memory location. However, that's currently not implemented in QEMU.
> +     * So let's just exit the CPU loop and pretend that an interrupt occured.
> +     */
> +
> +    /* Clear the load reservation  (if any).  */
> +    tcg_gen_movi_tl(load_res, -1);
> +
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +
> +    return true;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 55a4713af2..3f0140d124 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1005,6 +1005,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
> +#include "insn_trans/trans_rvzawrs.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> 





