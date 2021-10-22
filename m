Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdqFD-0000OX-Qc
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 04:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdqFC-0000N7-Fq; Fri, 22 Oct 2021 04:49:42 -0400
Received: from exmail.andestech.com ([60.248.187.195]:59744
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdqF8-0001In-CJ; Fri, 22 Oct 2021 04:49:41 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19M8mwVe019332;
 Fri, 22 Oct 2021 16:48:58 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from ruinland-x1c (192.168.21.142) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 22 Oct 2021
 16:48:54 +0800
Date: Fri, 22 Oct 2021 16:48:54 +0800
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>, 
 <ycliang@andestech.com>, <alankao@andestech.com>,
 <dylan@andestech.com>, <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: Re: [RFC PATCH v1 2/2] Enable custom instruction suport for Andes
 A25 and AX25 CPU model
Message-ID: <YXJ69gaslRMnOSHm@ruinland-x1c>
References: <20211021151136.721746-1-ruinland@andestech.com>
 <20211021151136.721746-2-ruinland@andestech.com>
 <00563f20-1867-6a4e-e9ea-a33ff85f058e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <00563f20-1867-6a4e-e9ea-a33ff85f058e@linaro.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
X-Originating-IP: [192.168.21.142]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19M8mwVe019332
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 22 Oct 2021 08:49:42 -0000

On Thu, Oct 21, 2021 at 12:17:47PM -0700, Richard Henderson wrote:
> On 10/21/21 8:11 AM, Ruinland Chuan-Tzu Tsai wrote:
> > In this patch, we demonstrate how Andes Performance Extension(c) insn :
> > bfos and bfoz could be used with Andes CoDense : exec.it.
> > 
> > By doing so, an Andes vendor designed CSR : uitb must be used.
> > 
> > Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
> > ---
> >   target/riscv/andes_codense.decode         |  23 +++++
> >   target/riscv/andes_custom_rv32.decode     |  27 +++++
> >   target/riscv/andes_custom_rv64.decode     |  27 +++++
> >   target/riscv/andes_helper.c               |  49 +++++++++
> >   target/riscv/andes_helper.h               |   1 +
> >   target/riscv/cpu.c                        |   8 ++
> >   target/riscv/helper.h                     |   2 +
> >   target/riscv/insn_trans/trans_andes.c.inc | 115 ++++++++++++++++++++++
> >   target/riscv/meson.build                  |  13 +++
> >   target/riscv/translate.c                  |  12 +++
> >   10 files changed, 277 insertions(+)
> >   create mode 100644 target/riscv/andes_codense.decode
> >   create mode 100644 target/riscv/andes_custom_rv32.decode
> >   create mode 100644 target/riscv/andes_custom_rv64.decode
> >   create mode 100644 target/riscv/andes_helper.c
> >   create mode 100644 target/riscv/andes_helper.h
> >   create mode 100644 target/riscv/insn_trans/trans_andes.c.inc
> > 
> > diff --git a/target/riscv/andes_codense.decode b/target/riscv/andes_codense.decode
> > new file mode 100644
> > index 0000000000..639d22ac67
> > --- /dev/null
> > +++ b/target/riscv/andes_codense.decode
> > @@ -0,0 +1,23 @@
> > +#
> > +# RISC-V translation routines for the RVXI Base Integer Instruction Set.
> > +#
> > +# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
> > +#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
> > +#
> > +# This program is free software; you can redistribute it and/or modify it
> > +# under the terms and conditions of the GNU General Public License,
> > +# version 2 or later, as published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope it will be useful, but WITHOUT
> > +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > +# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > +# more details.
> > +#
> > +# You should have received a copy of the GNU General Public License along with
> > +# this program.  If not, see <http://www.gnu.org/licenses/>.
> > +
> > +
> > +%imm_ex10 8:s1 12:1 3:1 9:1 5:2 2:1 10:2 4:1
> > +&codense imm_codense
> > +@ex10     ... .... . . ..... .. &codense imm_codense=%imm_ex10
> > +execit    100 .... . 0 ..... 00 @ex10
> 
> It would probably be a bit clearer without the argument set and format,
> which in this case are used exactly once, so there's no actual savings.
> 
> execit    100 ..... 0 ..... 00   imm=%imm_ex10
> 
> 
> > +++ b/target/riscv/andes_custom_rv32.decode
> ...
> > +++ b/target/riscv/andes_custom_rv64.decode
> 
> Note that we're moving toward a single riscv64 executable, and so these two
> files should be combined.  In this case, just taking the rv64 file will work
> for RV32, with an extra check during translate.
> 
> > +# Fields:
> > +%rs1       15:5
> > +%rd        7:5
> > +## Similar to I-Type
> > +%mbfob    26:6
> > +%lbfob    20:6
> > +&i_b mbfob lbfob rs1 rd
> > +@i_bfo    . ..... . ..... ..... ... ..... .......  &i_b %mbfob %lbfob %rs1 %rd
> 
> Better as
> 
> @i_bfo       msb:6 lsb:6 rs1:5 ... rd:5 .......   &i_bfo
> 
> There's quite a lot of riscv code that could be cleaned up like this.
> 
> > +++ b/target/riscv/andes_helper.c
> > @@ -0,0 +1,49 @@
> > +#include "qemu/osdep.h"
> 
> All new files must have copyright boilerplate.
> That said...

I deeply apologize for that.
Was way too fatigued last night.

> 
> > +#include "cpu.h"
> > +#include "qemu/host-utils.h"
> > +#include "exec/exec-all.h"
> > +#include "exec/helper-proto.h"
> > +#include "fpu/softfloat.h"
> > +#include "internals.h"
> > +typedef int (*test_function)(uint8_t a, uint8_t b);
> > +target_ulong helper_andes_v5_bfo_x(target_ulong rd, target_ulong rs1,
> > +                                   target_ulong insn)
> 
> Never pass the instruction to a helper. This is an indication that you
> should have done more work during translate.
> 
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_andes.c.inc
> > @@ -0,0 +1,115 @@
> > +#define GP 3
> 
> Again, boilerplate.

Wilco.

> 
> > +#define ANDES_V5_CODE_DENSE_MASK (0xe083)
> > +#define ANDES_V5_CODE_DENSE_ID(x) ((x)&ANDES_V5_CODE_DENSE_MASK)
> > +#define ANDES_V5_CODE_DENSE_IMM11(x) (     \
> > +    (extract32(x, 4, 1) << 2) |   \
> > +    (extract32(x, 10, 2) << 3) |  \
> > +    (extract32(x, 2, 1) << 5) |   \
> > +    (extract32(x, 5, 2) << 6) |   \
> > +    (extract32(x, 9, 1) << 8) |   \
> > +    (extract32(x, 3, 1) << 9) |   \
> > +    (extract32(x, 12, 1) << 10) | \
> > +    (extract64(x, 8, 1) << 11) | \
> > +    0)
> > +
> > +#define ANDES_V5_GET_JAL_UIMM(inst) ((extract32(inst, 21, 10) << 1) \
> > +                           | (extract32(inst, 20, 1) << 11) \
> > +                           | (extract32(inst, 12, 8) << 12) \
> > +                           | (extract32(inst, 31, 1) << 20))
> > +
> > +
> > +enum andes_v5_inst_id
> > +{
> > +    /* Code Dense Extension */
> > +    EXEC_IT = (0x8000),
> > +    /* custom 2 */
> > +    BFOS = 0x03,
> > +    BFOZ = 0x02,
> > +};
> 
> Left over from something else?
> This all looks like something that should be handled by decodetree.

Oops, sorry for that. This part was cutting out from our inhouse code.

> 
> > +static bool trans_bfos(DisasContext *ctx, arg_bfos *a)
> > +{
> > +    TCGv v0, v1, v2;
> > +    v2 = tcg_const_tl(ctx->opcode);
> > +    v0 = get_gpr(ctx, a->rs1, EXT_NONE);
> > +    v1 = get_gpr(ctx, a->rd, EXT_NONE);
> > +    gen_helper_andes_v5_bfo_x(v1, v1, v0, v2);
> > +    gen_set_gpr(ctx, a->rd, v1);
> > +    tcg_temp_free(v2);
> > +    return true;
> > +}
> > +
> > +static bool trans_bfoz(DisasContext *ctx, arg_bfoz *a)
> > +{
> > +    TCGv v0, v1, v2;
> > +    v2 = tcg_const_tl(ctx->opcode);
> > +    v0 = get_gpr(ctx, a->rs1, EXT_NONE);
> > +    v1 = get_gpr(ctx, a->rd,  EXT_NONE);
> > +    gen_helper_andes_v5_bfo_x(v1, v1, v0, v2);
> > +    gen_set_gpr(ctx, a->rd, v1);
> > +    tcg_temp_free(v2);
> > +    return true;
> > +}
> 
> So, you've just passed off everything to the helper.  Not good.
> 
> First, these two instructions are so close we add a common helper.
> 
> static bool do_bfox(DisasContext *ctx, arg_i_bfo *a, bool is_signed)
> {
>     ...
> }
> 
> static bool trans_bfos(DisasContext *ctx, arg_i_bfo *a)
> {
>     return do_bfox(ctx, a, true);
> }
> 
> static bool trans_bfoz(DisasContext *ctx, arg_i_bfo *a)
> {
>     return do_bfox(ctx, a, false);
> }
> 
> Second, re the RV32/RV64 merge, range check the bits:
> 
>     if (a->msb >= get_xlen(ctx) || a->lsb >= get_xlen(ctx)) {
>         return false;
>     }

Okay, that's new to me.

> 
> Third, TCG can easily handle extract/deposit inline:
> 
>     dest = dest_gpr(ctx, a->rd);
>     src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>     if (a->msb >= a->lsb) {
>         len = a->msb - a->lsb + 1;
>         if (is_signed) {
>             tcg_gen_sextract_tl(dest, src1, a->lsb, len);
>         } else {
>             tcg_gen_extract_tl(dest, src1, a->lsb, len);
>         }
>     } else {
>         len = a->lsb - a->msb + 1;
>         if (is_signed) {
>             tcg_gen_sextract_tl(dest, src1, 0, len);
>         } else {
>             tcg_gen_extract_tl(dest, src1, 0, len);
>         }
>         tcg_gen_shli_tl(dest, dest, a->msb);
>     }
>     gen_set_gpr(ctx, a->rd, dest);
> 
> 
> > +static int andes_v5_gen_codense_exec_it(CPURISCVState *env, DisasContext *ctx, arg_execit *a)
> > +{
> > +    uint32_t insn;
> > +    uint32_t imm_ex10 = a->imm_codense;
> > +    target_ulong uitb_val = 0;
> > +    riscv_csrrw(env, 0x800, &uitb_val, 0, 0);
> 
> This won't work -- you can't access env during translation.  So all this
> faff around passing env through HartState is for naught.

Sorry, please elaborate me a little bit more. 

> 
> Having a look through the rest of this:
> 
> > +
> > +    if (extract32(uitb_val, 0, 1)) { /* UTIB.HW == 1 */
> > +        qemu_log_mask(LOG_GUEST_ERROR, "exec.it: UITB.HW == 1 is not supported by now!\n");
> > +        gen_exception_illegal(ctx);
> > +
> > +        uint32_t instruction_table[0];
> > +        insn = instruction_table[imm_ex10 >> 2];
> > +
> > +        return false;
> > +    } else { /* UTIB.HW == 0 */
> > +        target_ulong vaddr = (uitb_val & ~0x3) + (imm_ex10<<2);
> > +        insn = cpu_ldl_code(env, vaddr);
> > +    }
> > +
> > +/*  Execute(insn)
> > + *  do as the replaced instruction, even exceptions,
> > + *  except ctx->pc_succ_insn value (2).
> > + */
> > +        uint32_t op = MASK_OP_MAJOR(insn);
> > +        if (op == OPC_RISC_JAL) {
> > +            /* implement this by hack imm */
> > +            int rd = GET_RD(ctx->opcode);
> > +            target_long imm = ANDES_V5_GET_JAL_UIMM(ctx->opcode);
> > +            target_ulong next_pc = (ctx->base.pc_next >> 21 << 21) | imm;
> > +            imm = next_pc - ctx->base.pc_next;
> > +            gen_jal(ctx, rd, imm);
> > +        } else {
> > +            /* JARL done as SPEC already */
> > +            /* presume ctx->pc_succ_insn not changed in any ISA extension */
> > +            decode_opc_andes(env, ctx, insn);
> > +        }
> > +
> > +    return true;
> > +}
> 
> This looks quite a lot like the S390X EXECUTE instruction.  It's hard to
> suggest exactly how to structure this, because I can't find documentation,
> and thus the edge cases are unknown.

Sorry for the inconvience, I'll try harder to make the spec to be publicily
accessible.

> 
> Because of the .HW check, I would expect all of this do be in a helper
> function.  The qemu_log_mask would be followed by riscv_raise_exception.

The HW instruction table is a feature we still have no idea how to implement
in QEMU, it was meant to be a security extension that rogue users couldn't
copy out vendor kept code - - the only permission is execution, no read
access on that region.

> 
> As for the actual execute, I'd suggest following the lead of s390x and
> utilize the cs_base field of cpu_get_tb_cpu_state to hold the opcode to be
> executed.  You'd load the opcode in the helper, install the proper state
> into env, and end the current TranslationBlock.  The next TranslationBlock
> will find the opcode and decode it in the normal way.
> 
> Have a look at target/s390x/tcg/mem_helper.c, HELPER(ex), where we load the
> opcode and store state.  Then translate.c, extract_insn, where we consume
> the state.
> 
> 
> r~

