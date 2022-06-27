Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5d7r-0001Hs-MR
	for mharc-qemu-riscv@gnu.org; Sun, 26 Jun 2022 21:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5d7l-0001FF-Oo; Sun, 26 Jun 2022 21:01:11 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5d7j-00082Z-1J; Sun, 26 Jun 2022 21:01:09 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 c6-20020a17090abf0600b001eee794a478so117332pjs.1; 
 Sun, 26 Jun 2022 18:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6KtL9979lnSQ3cWb+YtuvYXs4jAa/Y1nP+KXS+LUJ0=;
 b=Wjt5W8CWZHMxKVI1FeqZLj/huE/ZAvNBbgfF+U/NGUj08GbfUuwpH3NKxwESn+0Z3L
 ZOkwiFdVposAmeJMQzEXvrTfZ5vzaBpaXo6NpttEvpWlTPS3didE5AQK6FM8s2BPc7z/
 SgQ3G+aI4kvjqKWCnmzy3Q08YQAtkDszlxJsYVkf9sToTG0UbZYWYR1WO1drla0Fw6h1
 FAdNdOydt4UnJC/Vea1T6LFINpx8n6j1ySv9lg697klsz+nVUe/xVgV6zfTHaB0XQDWr
 egPluCZgXgz/ipabxVr4sr47oPR4xz0o9Sqw8x8vZUYoha54umFeIF4apt4Ro2EBzpWn
 M0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6KtL9979lnSQ3cWb+YtuvYXs4jAa/Y1nP+KXS+LUJ0=;
 b=wZFBdJNfXg9mFclqSwYpMQCShYzrQ/bimTyuU1gHysNEX0Ej/oL3WAKG7p1Sqzwz49
 dwTOT9KbrVqx+Vk6V5sN4dbK84sMPOC3sRg2EIz4FAETkwF58uaz5vl89ajiUwrjLQWW
 RytF49UdmwXumj6bFmS2lLBmxEjZzOVOElS1l4QSsHL/DLgH/Id54b4zqACPGUFuxaoA
 j1wy5ETYV9dLp4/zmoa+Pzz82fZss8PrjyzHbZzILVW6+akx+4lD6rC58RwvthvZtx88
 AHITq5XxJWCvceCVh1jJL8PmBKAy89R46KFKtJ+Ber4EoegZsEsASl1abJrSzrEHmw3n
 PZ0w==
X-Gm-Message-State: AJIora9aBVORzE3is6y7DqTi6DzRhOFvJaLEVh+LoRKlUju2PGoAvQRQ
 ki7HZ1LrzhEpoWgw/mmOKyMmZMAiNivVrFE7U+o=
X-Google-Smtp-Source: AGRyM1ujgCzGYDZI2mnRianP1+WfAW/ZmhL6RbSyhYI97v5cTiqMjlGMpGS60H69wEGTJthhBb60cOgbFBHmodUKo/A=
X-Received: by 2002:a17:903:2284:b0:16a:6ffa:c674 with SMTP id
 b4-20020a170903228400b0016a6ffac674mr11895805plh.121.1656291665205; Sun, 26
 Jun 2022 18:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220611080107.391981-1-apatel@ventanamicro.com>
 <20220611080107.391981-4-apatel@ventanamicro.com>
In-Reply-To: <20220611080107.391981-4-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jun 2022 11:00:38 +1000
Message-ID: <CAKmqyKNYDFAiG86EwqYkFe33UcmejkEKm_7ak47wgA06dS4f-Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Mon, 27 Jun 2022 01:01:11 -0000

On Sat, Jun 11, 2022 at 6:06 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should write transformed instruction encoding of the trapped
> instruction in [m|h]tinst CSR at time of taking trap as defined
> by the RISC-V privileged specification v1.12.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu.h        |   3 +
>  target/riscv/cpu_helper.c | 214 ++++++++++++++++++++++++++++++++++++--
>  target/riscv/instmap.h    |  45 ++++++++
>  3 files changed, 256 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7d6397acdf..cac9e1876c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -271,6 +271,9 @@ struct CPUArchState {
>      /* Signals whether the current exception occurred with two-stage address
>         translation active. */
>      bool two_stage_lookup;
> +    /* Signals whether the current exception occurred while doing two-stage
> +       address translation for the VS-stage page table walk. */

Wrong comment style, otherwise

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

I can fix this up when I apply the series (unless you need to spin a
new version)

Alistair

> +    bool two_stage_indirect_lookup;
>
>      target_ulong scounteren;
>      target_ulong mcounteren;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4a6700c890..3c8ebecf84 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -22,6 +22,7 @@
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
> +#include "instmap.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
>  #include "semihosting/common-semi.h"
> @@ -1057,7 +1058,8 @@ restart:
>
>  static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>                                  MMUAccessType access_type, bool pmp_violation,
> -                                bool first_stage, bool two_stage)
> +                                bool first_stage, bool two_stage,
> +                                bool two_stage_indirect)
>  {
>      CPUState *cs = env_cpu(env);
>      int page_fault_exceptions, vm;
> @@ -1107,6 +1109,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>      }
>      env->badaddr = address;
>      env->two_stage_lookup = two_stage;
> +    env->two_stage_indirect_lookup = two_stage_indirect;
>  }
>
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> @@ -1152,6 +1155,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>      env->badaddr = addr;
>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
> +    env->two_stage_indirect_lookup = false;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
>
> @@ -1177,6 +1181,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      env->badaddr = addr;
>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
> +    env->two_stage_indirect_lookup = false;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
>
> @@ -1192,6 +1197,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      bool pmp_violation = false;
>      bool first_stage_error = true;
>      bool two_stage_lookup = false;
> +    bool two_stage_indirect_error = false;
>      int ret = TRANSLATE_FAIL;
>      int mode = mmu_idx;
>      /* default TLB page size */
> @@ -1229,6 +1235,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           */
>          if (ret == TRANSLATE_G_STAGE_FAIL) {
>              first_stage_error = false;
> +            two_stage_indirect_error = true;
>              access_type = MMU_DATA_LOAD;
>          }
>
> @@ -1312,12 +1319,182 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          raise_mmu_exception(env, address, access_type, pmp_violation,
>                              first_stage_error,
>                              riscv_cpu_virt_enabled(env) ||
> -                                riscv_cpu_two_stage_lookup(mmu_idx));
> +                                riscv_cpu_two_stage_lookup(mmu_idx),
> +                            two_stage_indirect_error);
>          cpu_loop_exit_restore(cs, retaddr);
>      }
>
>      return true;
>  }
> +
> +static target_ulong riscv_transformed_insn(CPURISCVState *env,
> +                                           target_ulong insn,
> +                                           bool addr_offset_nonzero,
> +                                           target_ulong taddr)
> +{
> +    target_ulong xinsn = 0, xinsn_access_bits = 0;
> +
> +    /*
> +     * Only Quadrant 0 and Quadrant 2 of RVC instruction space need to
> +     * be uncompressed. The Quadrant 1 of RVC instruction space need
> +     * not be transformed because these instructions won't generate
> +     * any load/store trap.
> +     */
> +
> +    if ((insn & 0x3) != 0x3) {
> +        /* Transform 16bit instruction into 32bit instruction */
> +        switch (GET_C_OP(insn)) {
> +        case OPC_RISC_C_OP_QUAD0: /* Quadrant 0 */
> +            switch (GET_C_FUNC(insn)) {
> +            case OPC_RISC_C_FUNC_FLD_LQ:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FLD (RV32/64) */
> +                    xinsn = OPC_RISC_FLD;
> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_bits = 3;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_LW: /* C.LW */
> +                xinsn = OPC_RISC_LW;
> +                xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                xinsn_access_bits = 2;
> +                break;
> +            case OPC_RISC_C_FUNC_FLW_LD:
> +                if (riscv_cpu_xlen(env) == 32) { /* C.FLW (RV32) */
> +                    xinsn = OPC_RISC_FLW;
> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_bits = 2;
> +                } else { /* C.LD (RV64/RV128) */
> +                    xinsn = OPC_RISC_LD;
> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_bits = 3;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_FSD_SQ:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FSD (RV32/64) */
> +                    xinsn = OPC_RISC_FSD;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_bits = 3;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_SW: /* C.SW */
> +                xinsn = OPC_RISC_SW;
> +                xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> +                xinsn_access_bits = 2;
> +                break;
> +            case OPC_RISC_C_FUNC_FSW_SD:
> +                if (riscv_cpu_xlen(env) == 32) { /* C.FSW (RV32) */
> +                    xinsn = OPC_RISC_FSW;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_bits = 2;
> +                } else { /* C.SD (RV64/RV128) */
> +                    xinsn = OPC_RISC_SD;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_bits = 3;
> +                }
> +                break;
> +            default:
> +                break;
> +            }
> +            break;
> +        case OPC_RISC_C_OP_QUAD2: /* Quadrant 2 */
> +            switch (GET_C_FUNC(insn)) {
> +            case OPC_RISC_C_FUNC_FLDSP_LQSP:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FLDSP (RV32/64) */
> +                    xinsn = OPC_RISC_FLD;
> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> +                    xinsn_access_bits = 3;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_LWSP: /* C.LWSP */
> +                xinsn = OPC_RISC_LW;
> +                xinsn = SET_RD(xinsn, GET_C_RD(insn));
> +                xinsn_access_bits = 2;
> +                break;
> +            case OPC_RISC_C_FUNC_FLWSP_LDSP:
> +                if (riscv_cpu_xlen(env) == 32) { /* C.FLWSP (RV32) */
> +                    xinsn = OPC_RISC_FLW;
> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> +                    xinsn_access_bits = 2;
> +                } else { /* C.LDSP (RV64/RV128) */
> +                    xinsn = OPC_RISC_LD;
> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> +                    xinsn_access_bits = 3;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_FSDSP_SQSP:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FSDSP (RV32/64) */
> +                    xinsn = OPC_RISC_FSD;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> +                    xinsn_access_bits = 3;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_SWSP: /* C.SWSP */
> +                xinsn = OPC_RISC_SW;
> +                xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> +                xinsn_access_bits = 2;
> +                break;
> +            case 7:
> +                if (riscv_cpu_xlen(env) == 32) { /* C.FSWSP (RV32) */
> +                    xinsn = OPC_RISC_FSW;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> +                    xinsn_access_bits = 2;
> +                } else { /* C.SDSP (RV64/RV128) */
> +                    xinsn = OPC_RISC_SD;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> +                    xinsn_access_bits = 3;
> +                }
> +                break;
> +            default:
> +                break;
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +
> +        /*
> +         * Clear Bit1 of transformed instruction to indicate that
> +         * original insruction was a 16bit instruction
> +         */
> +        xinsn &= ~((target_ulong)0x2);
> +    } else {
> +        /* Transform 32bit (or wider) instructions */
> +        switch (MASK_OP_MAJOR(insn)) {
> +        case OPC_RISC_ATOMIC:
> +             xinsn = insn;
> +             xinsn_access_bits = GET_FUNCT3(xinsn);
> +             break;
> +        case OPC_RISC_LOAD:
> +        case OPC_RISC_FP_LOAD:
> +             xinsn = insn;
> +             xinsn_access_bits = GET_FUNCT3(xinsn);
> +             xinsn = SET_I_IMM(xinsn, 0);
> +             break;
> +        case OPC_RISC_STORE:
> +        case OPC_RISC_FP_STORE:
> +             xinsn = insn;
> +             xinsn_access_bits = GET_FUNCT3(xinsn);
> +             xinsn = SET_S_IMM(xinsn, 0);
> +             break;
> +        case OPC_RISC_SYSTEM:
> +             if (MASK_OP_SYSTEM(insn) == OPC_RISC_HLVHSV) {
> +                 xinsn = insn;
> +                 xinsn_access_bits = 1 << ((GET_FUNCT7(xinsn) >> 1) & 0x3);
> +             }
> +             break;
> +        default:
> +             break;
> +        }
> +    }
> +
> +    if (addr_offset_nonzero) {
> +        xinsn = SET_RS1(xinsn, taddr & ((1 << xinsn_access_bits) - 1));
> +    } else {
> +        xinsn = SET_RS1(xinsn, 0);
> +    }
> +
> +    return xinsn;
> +}
>  #endif /* !CONFIG_USER_ONLY */
>
>  /*
> @@ -1342,6 +1519,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
>      uint64_t deleg = async ? env->mideleg : env->medeleg;
>      target_ulong tval = 0;
> +    target_ulong tinst = 0;
>      target_ulong htval = 0;
>      target_ulong mtval2 = 0;
>
> @@ -1357,18 +1535,39 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
>          switch (cause) {
> -        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> -        case RISCV_EXCP_INST_ADDR_MIS:
> -        case RISCV_EXCP_INST_ACCESS_FAULT:
>          case RISCV_EXCP_LOAD_ADDR_MIS:
>          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
>          case RISCV_EXCP_LOAD_ACCESS_FAULT:
>          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
> -        case RISCV_EXCP_INST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_PAGE_FAULT:
>          case RISCV_EXCP_STORE_PAGE_FAULT:
> +            write_gva = env->two_stage_lookup;
> +            tval = env->badaddr;
> +            if (env->two_stage_indirect_lookup) {
> +                /*
> +                 * special pseudoinstruction for G-stage fault taken while
> +                 * doing VS-stage page table walk.
> +                 */
> +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> +            } else {
> +                /*
> +                 * The "Addr. Offset" field in transformed instruction is
> +                 * non-zero only for misaligned load/store traps.
> +                 */
> +                if (cause == RISCV_EXCP_LOAD_ADDR_MIS ||
> +                    cause == RISCV_EXCP_STORE_AMO_ACCESS_FAULT) {
> +                    tinst = riscv_transformed_insn(env, env->bins, true, tval);
> +                } else {
> +                    tinst = riscv_transformed_insn(env, env->bins, false, tval);
> +                }
> +            }
> +            break;
> +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> +        case RISCV_EXCP_INST_ADDR_MIS:
> +        case RISCV_EXCP_INST_ACCESS_FAULT:
> +        case RISCV_EXCP_INST_PAGE_FAULT:
>              write_gva = env->two_stage_lookup;
>              tval = env->badaddr;
>              break;
> @@ -1450,6 +1649,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->sepc = env->pc;
>          env->stval = tval;
>          env->htval = htval;
> +        env->htinst = tinst;
>          env->pc = (env->stvec >> 2 << 2) +
>              ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
>          riscv_cpu_set_mode(env, PRV_S);
> @@ -1480,6 +1680,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->mepc = env->pc;
>          env->mtval = tval;
>          env->mtval2 = mtval2;
> +        env->mtinst = tinst;
>          env->pc = (env->mtvec >> 2 << 2) +
>              ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
>          riscv_cpu_set_mode(env, PRV_M);
> @@ -1492,6 +1693,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       */
>
>      env->two_stage_lookup = false;
> +    env->two_stage_indirect_lookup = false;
>  #endif
>      cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
>  }
> diff --git a/target/riscv/instmap.h b/target/riscv/instmap.h
> index 40b6d2b64d..f877530576 100644
> --- a/target/riscv/instmap.h
> +++ b/target/riscv/instmap.h
> @@ -184,6 +184,8 @@ enum {
>      OPC_RISC_CSRRWI      = OPC_RISC_SYSTEM | (0x5 << 12),
>      OPC_RISC_CSRRSI      = OPC_RISC_SYSTEM | (0x6 << 12),
>      OPC_RISC_CSRRCI      = OPC_RISC_SYSTEM | (0x7 << 12),
> +
> +    OPC_RISC_HLVHSV      = OPC_RISC_SYSTEM | (0x4 << 12),
>  };
>
>  #define MASK_OP_FP_LOAD(op)   (MASK_OP_MAJOR(op) | (op & (0x7 << 12)))
> @@ -310,12 +312,20 @@ enum {
>                             | (extract32(inst, 12, 8) << 12) \
>                             | (sextract64(inst, 31, 1) << 20))
>
> +#define GET_FUNCT3(inst) extract32(inst, 12, 3)
> +#define GET_FUNCT7(inst) extract32(inst, 25, 7)
>  #define GET_RM(inst)   extract32(inst, 12, 3)
>  #define GET_RS3(inst)  extract32(inst, 27, 5)
>  #define GET_RS1(inst)  extract32(inst, 15, 5)
>  #define GET_RS2(inst)  extract32(inst, 20, 5)
>  #define GET_RD(inst)   extract32(inst, 7, 5)
>  #define GET_IMM(inst)  sextract64(inst, 20, 12)
> +#define SET_RS1(inst, val)  deposit32(inst, 15, 5, val)
> +#define SET_RS2(inst, val)  deposit32(inst, 20, 5, val)
> +#define SET_RD(inst, val)   deposit32(inst, 7, 5, val)
> +#define SET_I_IMM(inst, val)  deposit32(inst, 20, 12, val)
> +#define SET_S_IMM(inst, val)  \
> +    deposit32(deposit32(inst, 7, 5, val), 25, 7, (val) >> 5)
>
>  /* RVC decoding macros */
>  #define GET_C_IMM(inst)             (extract32(inst, 2, 5) \
> @@ -346,6 +356,8 @@ enum {
>                                      | (extract32(inst, 5, 1) << 6))
>  #define GET_C_LD_IMM(inst)          ((extract16(inst, 10, 3) << 3) \
>                                      | (extract16(inst, 5, 2) << 6))
> +#define GET_C_SW_IMM(inst)          GET_C_LW_IMM(inst)
> +#define GET_C_SD_IMM(inst)          GET_C_LD_IMM(inst)
>  #define GET_C_J_IMM(inst)           ((extract32(inst, 3, 3) << 1) \
>                                      | (extract32(inst, 11, 1) << 4) \
>                                      | (extract32(inst, 2, 1) << 5) \
> @@ -366,4 +378,37 @@ enum {
>  #define GET_C_RS1S(inst)            (8 + extract16(inst, 7, 3))
>  #define GET_C_RS2S(inst)            (8 + extract16(inst, 2, 3))
>
> +#define GET_C_FUNC(inst)           extract32(inst, 13, 3)
> +#define GET_C_OP(inst)             extract32(inst, 0, 2)
> +
> +enum {
> +    /* RVC Quadrants */
> +    OPC_RISC_C_OP_QUAD0 = 0x0,
> +    OPC_RISC_C_OP_QUAD1 = 0x1,
> +    OPC_RISC_C_OP_QUAD2 = 0x2
> +};
> +
> +enum {
> +    /* RVC Quadrant 0 */
> +    OPC_RISC_C_FUNC_ADDI4SPN = 0x0,
> +    OPC_RISC_C_FUNC_FLD_LQ = 0x1,
> +    OPC_RISC_C_FUNC_LW = 0x2,
> +    OPC_RISC_C_FUNC_FLW_LD = 0x3,
> +    OPC_RISC_C_FUNC_FSD_SQ = 0x5,
> +    OPC_RISC_C_FUNC_SW = 0x6,
> +    OPC_RISC_C_FUNC_FSW_SD = 0x7
> +};
> +
> +enum {
> +    /* RVC Quadrant 2 */
> +    OPC_RISC_C_FUNC_SLLI_SLLI64 = 0x0,
> +    OPC_RISC_C_FUNC_FLDSP_LQSP = 0x1,
> +    OPC_RISC_C_FUNC_LWSP = 0x2,
> +    OPC_RISC_C_FUNC_FLWSP_LDSP = 0x3,
> +    OPC_RISC_C_FUNC_JR_MV_EBREAK_JALR_ADD = 0x4,
> +    OPC_RISC_C_FUNC_FSDSP_SQSP = 0x5,
> +    OPC_RISC_C_FUNC_SWSP = 0x6,
> +    OPC_RISC_C_FUNC_FSWSP_SDSP = 0x7
> +};
> +
>  #endif
> --
> 2.34.1
>
>

