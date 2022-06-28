Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o67z5-0003mZ-H1
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 05:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o67z4-0003mJ-Jt
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 05:58:14 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o67z0-0004Cb-0k
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 05:58:12 -0400
Received: by mail-lj1-x22d.google.com with SMTP id a11so14251297ljb.5
 for <qemu-riscv@nongnu.org>; Tue, 28 Jun 2022 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0DiarCBzhtTL7N1+gUQp/79d8obSOe9Ma9ICQ8j5vVo=;
 b=LwLT1xHPZhAb+c/sfR1d1A/pnX3DqUXrwOJkY1kEm06CcoMWy6qedQ89GvR9LKPFDD
 klZwgPwkGI+YsMQ0Jxi7zP7KbRYSCxeavXGuxAVCMO4JsZHgxokCd4NTpjxIU5hde5LS
 k2mfa0vyAK3sQqZv/HjQcFvFHg0mfJzxQ58eA7B9nFeVfD6EOwXds+bOtSRINs0MVARL
 a1Z8hgmWV5Xo7flGG8fGHimpqDRhE8mIM8K2DUhWZsSX2kAWGconjfI/+WHCd52087oK
 5OZnC+OY3jdqhnwxhkMZwwYl9FjFc3ocFl1+TkcvnQr9QRNZYsXamnWtk1/syXdPUgla
 1NaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0DiarCBzhtTL7N1+gUQp/79d8obSOe9Ma9ICQ8j5vVo=;
 b=oqqYVnjwRy9xOSDHcV5WgbSZ/2Y67Hs4GBBFzg9pbKVYvFRZLBAoxzGeNLPkb9QelH
 AWs6VUEWpdJrGth8RmhMYdJl30AfWWRN8o8vrNzLthu871zwX6Xm+v7uR9CFkeL96pzg
 znqXTD6MN4IpAohg45iq4XtEjgxhbszBfl7aLpFR7eji+HbnWkMGqOq0EGflLbyXhKO/
 a5XSeXXvmK/uflz0SZMR4wWK215rXHkygZLNB/bwFe62NqqoaRm2cWLztfTVkaf0OYQc
 a5DQ3+RfupnBLZM8oNOaIiuTuuyRygeaP5TkLyeGpSF0n4qUmwbETucCTaXNUIAUvnKK
 IP1Q==
X-Gm-Message-State: AJIora+q9HOL0R8o9oisKuNEwifj3tExb1s61G+jUURHgMLiy4WmS/ab
 waaTUu1G/N8frcsJVVKZPGK7/UPa5lSjYFvS0HAVdw==
X-Google-Smtp-Source: AGRyM1tBYwgdRt1nPXnTPrIEYxfx6Eg9hJs2lRZX3Y8HLbX8MoOUQx8pSXlrg1IVEqjt+TPbr+MB3f5M51++91eNNAI=
X-Received: by 2002:a2e:9e44:0:b0:25a:74ff:a5c8 with SMTP id
 g4-20020a2e9e44000000b0025a74ffa5c8mr9344697ljk.364.1656410287974; Tue, 28
 Jun 2022 02:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220611080107.391981-1-apatel@ventanamicro.com>
 <20220611080107.391981-4-apatel@ventanamicro.com>
 <CAKmqyKNYDFAiG86EwqYkFe33UcmejkEKm_7ak47wgA06dS4f-Q@mail.gmail.com>
 <TYYP286MB14391905A7D0800E56D52D86C6B99@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYYP286MB14391905A7D0800E56D52D86C6B99@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Jun 2022 15:27:56 +0530
Message-ID: <CAK9=C2WL=cQteRPEgVrbWhPbb0B1T=yMxcpzKDek+2iZ4qwbUQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
To: dramforever <dramforever@live.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=apatel@ventanamicro.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 28 Jun 2022 09:58:14 -0000

On Mon, Jun 27, 2022 at 10:25 PM dramforever <dramforever@live.com> wrote:
>
> On 6/27/22 09:00, Alistair Francis wrote:
> > On Sat, Jun 11, 2022 at 6:06 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >> We should write transformed instruction encoding of the trapped
> >> instruction in [m|h]tinst CSR at time of taking trap as defined
> >> by the RISC-V privileged specification v1.12.
> >>
> >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >> ---
> >>  target/riscv/cpu.h        |   3 +
> >>  target/riscv/cpu_helper.c | 214 ++++++++++++++++++++++++++++++++++++--
> >>  target/riscv/instmap.h    |  45 ++++++++
> >>  3 files changed, 256 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index 7d6397acdf..cac9e1876c 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -271,6 +271,9 @@ struct CPUArchState {
> >>      /* Signals whether the current exception occurred with two-stage address
> >>         translation active. */
> >>      bool two_stage_lookup;
> >> +    /* Signals whether the current exception occurred while doing two-stage
> >> +       address translation for the VS-stage page table walk. */
> > Wrong comment style, otherwise
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > I can fix this up when I apply the series (unless you need to spin a
> > new version)
> >
> > Alistair
>
> Hi Anup Patel and Alistair Francis,
>
> I still have some concerns about this patch. Can you please take a look
> before this goes to master?
>
> >> +    bool two_stage_indirect_lookup;
> >>
> >>      target_ulong scounteren;
> >>      target_ulong mcounteren;
> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> index 4a6700c890..3c8ebecf84 100644
> >> --- a/target/riscv/cpu_helper.c
> >> +++ b/target/riscv/cpu_helper.c
> >> @@ -22,6 +22,7 @@
> >>  #include "qemu/main-loop.h"
> >>  #include "cpu.h"
> >>  #include "exec/exec-all.h"
> >> +#include "instmap.h"
> >>  #include "tcg/tcg-op.h"
> >>  #include "trace.h"
> >>  #include "semihosting/common-semi.h"
> >> @@ -1057,7 +1058,8 @@ restart:
> >>
> >>  static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
> >>                                  MMUAccessType access_type, bool pmp_violation,
> >> -                                bool first_stage, bool two_stage)
> >> +                                bool first_stage, bool two_stage,
> >> +                                bool two_stage_indirect)
> >>  {
> >>      CPUState *cs = env_cpu(env);
> >>      int page_fault_exceptions, vm;
> >> @@ -1107,6 +1109,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
> >>      }
> >>      env->badaddr = address;
> >>      env->two_stage_lookup = two_stage;
> >> +    env->two_stage_indirect_lookup = two_stage_indirect;
> >>  }
> >>
> >>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> >> @@ -1152,6 +1155,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> >>      env->badaddr = addr;
> >>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> >>                              riscv_cpu_two_stage_lookup(mmu_idx);
> >> +    env->two_stage_indirect_lookup = false;
> >>      cpu_loop_exit_restore(cs, retaddr);
> >>  }
> >>
> >> @@ -1177,6 +1181,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> >>      env->badaddr = addr;
> >>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> >>                              riscv_cpu_two_stage_lookup(mmu_idx);
> >> +    env->two_stage_indirect_lookup = false;
> >>      cpu_loop_exit_restore(cs, retaddr);
> >>  }
> >>
> >> @@ -1192,6 +1197,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >>      bool pmp_violation = false;
> >>      bool first_stage_error = true;
> >>      bool two_stage_lookup = false;
> >> +    bool two_stage_indirect_error = false;
> >>      int ret = TRANSLATE_FAIL;
> >>      int mode = mmu_idx;
> >>      /* default TLB page size */
> >> @@ -1229,6 +1235,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >>           */
> >>          if (ret == TRANSLATE_G_STAGE_FAIL) {
> >>              first_stage_error = false;
> >> +            two_stage_indirect_error = true;
> >>              access_type = MMU_DATA_LOAD;
> >>          }
> >>
> >> @@ -1312,12 +1319,182 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >>          raise_mmu_exception(env, address, access_type, pmp_violation,
> >>                              first_stage_error,
> >>                              riscv_cpu_virt_enabled(env) ||
> >> -                                riscv_cpu_two_stage_lookup(mmu_idx));
> >> +                                riscv_cpu_two_stage_lookup(mmu_idx),
> >> +                            two_stage_indirect_error);
> >>          cpu_loop_exit_restore(cs, retaddr);
> >>      }
> >>
> >>      return true;
> >>  }
> >> +
> >> +static target_ulong riscv_transformed_insn(CPURISCVState *env,
> >> +                                           target_ulong insn,
> >> +                                           bool addr_offset_nonzero,
> >> +                                           target_ulong taddr)
> >> +{
> >> +    target_ulong xinsn = 0, xinsn_access_bits = 0;
> >> +
> >> +    /*
> >> +     * Only Quadrant 0 and Quadrant 2 of RVC instruction space need to
> >> +     * be uncompressed. The Quadrant 1 of RVC instruction space need
> >> +     * not be transformed because these instructions won't generate
> >> +     * any load/store trap.
> >> +     */
> >> +
> >> +    if ((insn & 0x3) != 0x3) {
> >> +        /* Transform 16bit instruction into 32bit instruction */
> >> +        switch (GET_C_OP(insn)) {
> >> +        case OPC_RISC_C_OP_QUAD0: /* Quadrant 0 */
> >> +            switch (GET_C_FUNC(insn)) {
> >> +            case OPC_RISC_C_FUNC_FLD_LQ:
> >> +                if (riscv_cpu_xlen(env) != 128) { /* C.FLD (RV32/64) */
> >> +                    xinsn = OPC_RISC_FLD;
> >> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> >> +                    xinsn_access_bits = 3;
> >> +                }
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_LW: /* C.LW */
> >> +                xinsn = OPC_RISC_LW;
> >> +                xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> >> +                xinsn_access_bits = 2;
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_FLW_LD:
> >> +                if (riscv_cpu_xlen(env) == 32) { /* C.FLW (RV32) */
> >> +                    xinsn = OPC_RISC_FLW;
> >> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> >> +                    xinsn_access_bits = 2;
> >> +                } else { /* C.LD (RV64/RV128) */
> >> +                    xinsn = OPC_RISC_LD;
> >> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> >> +                    xinsn_access_bits = 3;
> >> +                }
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_FSD_SQ:
> >> +                if (riscv_cpu_xlen(env) != 128) { /* C.FSD (RV32/64) */
> >> +                    xinsn = OPC_RISC_FSD;
> >> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> >> +                    xinsn_access_bits = 3;
> >> +                }
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_SW: /* C.SW */
> >> +                xinsn = OPC_RISC_SW;
> >> +                xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> >> +                xinsn_access_bits = 2;
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_FSW_SD:
> >> +                if (riscv_cpu_xlen(env) == 32) { /* C.FSW (RV32) */
> >> +                    xinsn = OPC_RISC_FSW;
> >> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> >> +                    xinsn_access_bits = 2;
> >> +                } else { /* C.SD (RV64/RV128) */
> >> +                    xinsn = OPC_RISC_SD;
> >> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> >> +                    xinsn_access_bits = 3;
> >> +                }
> >> +                break;
> >> +            default:
> >> +                break;
> >> +            }
> >> +            break;
> >> +        case OPC_RISC_C_OP_QUAD2: /* Quadrant 2 */
> >> +            switch (GET_C_FUNC(insn)) {
> >> +            case OPC_RISC_C_FUNC_FLDSP_LQSP:
> >> +                if (riscv_cpu_xlen(env) != 128) { /* C.FLDSP (RV32/64) */
> >> +                    xinsn = OPC_RISC_FLD;
> >> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> >> +                    xinsn_access_bits = 3;
> >> +                }
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_LWSP: /* C.LWSP */
> >> +                xinsn = OPC_RISC_LW;
> >> +                xinsn = SET_RD(xinsn, GET_C_RD(insn));
> >> +                xinsn_access_bits = 2;
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_FLWSP_LDSP:
> >> +                if (riscv_cpu_xlen(env) == 32) { /* C.FLWSP (RV32) */
> >> +                    xinsn = OPC_RISC_FLW;
> >> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> >> +                    xinsn_access_bits = 2;
> >> +                } else { /* C.LDSP (RV64/RV128) */
> >> +                    xinsn = OPC_RISC_LD;
> >> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> >> +                    xinsn_access_bits = 3;
> >> +                }
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_FSDSP_SQSP:
> >> +                if (riscv_cpu_xlen(env) != 128) { /* C.FSDSP (RV32/64) */
> >> +                    xinsn = OPC_RISC_FSD;
> >> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> >> +                    xinsn_access_bits = 3;
> >> +                }
> >> +                break;
> >> +            case OPC_RISC_C_FUNC_SWSP: /* C.SWSP */
> >> +                xinsn = OPC_RISC_SW;
> >> +                xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> >> +                xinsn_access_bits = 2;
> >> +                break;
> >> +            case 7:
> >> +                if (riscv_cpu_xlen(env) == 32) { /* C.FSWSP (RV32) */
> >> +                    xinsn = OPC_RISC_FSW;
> >> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> >> +                    xinsn_access_bits = 2;
> >> +                } else { /* C.SDSP (RV64/RV128) */
> >> +                    xinsn = OPC_RISC_SD;
> >> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> >> +                    xinsn_access_bits = 3;
> >> +                }
> >> +                break;
> >> +            default:
> >> +                break;
> >> +            }
> >> +            break;
> >> +        default:
> >> +            break;
> >> +        }
> >> +
> >> +        /*
> >> +         * Clear Bit1 of transformed instruction to indicate that
> >> +         * original insruction was a 16bit instruction
> >> +         */
> >> +        xinsn &= ~((target_ulong)0x2);
> >> +    } else {
> >> +        /* Transform 32bit (or wider) instructions */
> >> +        switch (MASK_OP_MAJOR(insn)) {
> >> +        case OPC_RISC_ATOMIC:
> >> +             xinsn = insn;
> >> +             xinsn_access_bits = GET_FUNCT3(xinsn);
> >> +             break;
> >> +        case OPC_RISC_LOAD:
> >> +        case OPC_RISC_FP_LOAD:
> >> +             xinsn = insn;
> >> +             xinsn_access_bits = GET_FUNCT3(xinsn);
> >> +             xinsn = SET_I_IMM(xinsn, 0);
> >> +             break;
> >> +        case OPC_RISC_STORE:
> >> +        case OPC_RISC_FP_STORE:
> >> +             xinsn = insn;
> >> +             xinsn_access_bits = GET_FUNCT3(xinsn);
> >> +             xinsn = SET_S_IMM(xinsn, 0);
> >> +             break;
> >> +        case OPC_RISC_SYSTEM:
> >> +             if (MASK_OP_SYSTEM(insn) == OPC_RISC_HLVHSV) {
> >> +                 xinsn = insn;
> >> +                 xinsn_access_bits = 1 << ((GET_FUNCT7(xinsn) >> 1) & 0x3);
> >> +             }
> >> +             break;
> >> +        default:
> >> +             break;
> >> +        }
> >> +    }
> >> +
> >> +    if (addr_offset_nonzero) {
> >> +        xinsn = SET_RS1(xinsn, taddr & ((1 << xinsn_access_bits) - 1));
> >> +    } else {
> >> +        xinsn = SET_RS1(xinsn, 0);
> >> +    }
> >> +
> >> +    return xinsn;
> >> +}
> >>  #endif /* !CONFIG_USER_ONLY */
> >>
> >>  /*
> >> @@ -1342,6 +1519,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >>      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
> >>      uint64_t deleg = async ? env->mideleg : env->medeleg;
> >>      target_ulong tval = 0;
> >> +    target_ulong tinst = 0;
> >>      target_ulong htval = 0;
> >>      target_ulong mtval2 = 0;
> >>
> >> @@ -1357,18 +1535,39 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >>      if (!async) {
> >>          /* set tval to badaddr for traps with address information */
> >>          switch (cause) {
> >> -        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> >>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
> >>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> >> -        case RISCV_EXCP_INST_ADDR_MIS:
> >> -        case RISCV_EXCP_INST_ACCESS_FAULT:
> >>          case RISCV_EXCP_LOAD_ADDR_MIS:
> >>          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
> >>          case RISCV_EXCP_LOAD_ACCESS_FAULT:
> >>          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
> >> -        case RISCV_EXCP_INST_PAGE_FAULT:
> >>          case RISCV_EXCP_LOAD_PAGE_FAULT:
> >>          case RISCV_EXCP_STORE_PAGE_FAULT:
> >> +            write_gva = env->two_stage_lookup;
> >> +            tval = env->badaddr;
> >> +            if (env->two_stage_indirect_lookup) {
> >> +                /*
> >> +                 * special pseudoinstruction for G-stage fault taken while
> >> +                 * doing VS-stage page table walk.
> >> +                 */
> >> +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> >> +            } else {
> >> +                /*
> >> +                 * The "Addr. Offset" field in transformed instruction is
> >> +                 * non-zero only for misaligned load/store traps.
> >> +                 */
> >> +                if (cause == RISCV_EXCP_LOAD_ADDR_MIS ||
> >> +                    cause == RISCV_EXCP_STORE_AMO_ACCESS_FAULT) {
> >> +                    tinst = riscv_transformed_insn(env, env->bins, true, tval);
> >> +                } else {
> >> +                    tinst = riscv_transformed_insn(env, env->bins, false, tval);
> >> +                }
>
> This doesn't match what I expect.
>
> The privileged spec says the Addr. Offset field should be 'the positive
> difference between the faulting virtual address (written to mtval or
> stval) and the original virtual address,' and that 'this difference can
> be nonzero only for a misaligned memory access.'
>
> To me this means that the memory access is misaligned *and* faults in
> the middle of the access. Addr. Offset should then be how many bytes
> into the access that it fails. For misaligned address *exceptions* the
> access always faults right at the start and nothing is performed, so
> Addr. Offset should be zero. This patch does something complete unrelated.
>
> I had raised this point in my comment on the v5 patch, with this
> example: For example, if an ld instruction reads 8 bytes starting from
> 0xa00ffe, and the page 0xa00000 to 0xa00fff is mapped, but 0xa01000 to
> 0xa01fff is not, a load page fault is raised with [m|s]tval = 0xa01000,
> while the original virtual address of the access is 0xa00ffe. The 'Addr.
> Offset' in this case is 2, i.e. the difference calculated with (0xa01000
> - 0xa00ffe).
>
> In any case I think this is all extremely confusing and a clarification
> from the spec authors would be better. I had asked on the GitHub
> repository about this[1], but did not receive any response.

Indeed this is very confusing. Your example above is quite useful.

>
> [1]: https://github.com/riscv/riscv-isa-manual/issues/853
>
> >> +            }
> >> +            break;
> >> +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> >> +        case RISCV_EXCP_INST_ADDR_MIS:
> >> +        case RISCV_EXCP_INST_ACCESS_FAULT:
> >> +        case RISCV_EXCP_INST_PAGE_FAULT:
> >>              write_gva = env->two_stage_lookup;
> >>              tval = env->badaddr;
> >>              break;
>
> In case of an Instruction Guest-page Fault due to VS-stage address
> translation, i.e. env->two_stage_indirect_lookup is true, htinst should
> be a pseudoinstruction instead of zero.
>
> This was raised in a comment in v5 too (where I had mistakenly written
> two_stage_lookup instead of two_stage_indirect_lookup), and is still not
> fixed in v6.

Ahh, I see.

>
> dramforever
>
> >> @@ -1450,6 +1649,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >>          env->sepc = env->pc;
> >>          env->stval = tval;
> >>          env->htval = htval;
> >> +        env->htinst = tinst;
> >>          env->pc = (env->stvec >> 2 << 2) +
> >>              ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
> >>          riscv_cpu_set_mode(env, PRV_S);
> >> @@ -1480,6 +1680,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >>          env->mepc = env->pc;
> >>          env->mtval = tval;
> >>          env->mtval2 = mtval2;
> >> +        env->mtinst = tinst;
> >>          env->pc = (env->mtvec >> 2 << 2) +
> >>              ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
> >>          riscv_cpu_set_mode(env, PRV_M);
> >> @@ -1492,6 +1693,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >>       */
> >>
> >>      env->two_stage_lookup = false;
> >> +    env->two_stage_indirect_lookup = false;
> >>  #endif
> >>      cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
> >>  }
> >> diff --git a/target/riscv/instmap.h b/target/riscv/instmap.h
> >> index 40b6d2b64d..f877530576 100644
> >> --- a/target/riscv/instmap.h
> >> +++ b/target/riscv/instmap.h
> >> @@ -184,6 +184,8 @@ enum {
> >>      OPC_RISC_CSRRWI      = OPC_RISC_SYSTEM | (0x5 << 12),
> >>      OPC_RISC_CSRRSI      = OPC_RISC_SYSTEM | (0x6 << 12),
> >>      OPC_RISC_CSRRCI      = OPC_RISC_SYSTEM | (0x7 << 12),
> >> +
> >> +    OPC_RISC_HLVHSV      = OPC_RISC_SYSTEM | (0x4 << 12),
> >>  };
> >>
> >>  #define MASK_OP_FP_LOAD(op)   (MASK_OP_MAJOR(op) | (op & (0x7 << 12)))
> >> @@ -310,12 +312,20 @@ enum {
> >>                             | (extract32(inst, 12, 8) << 12) \
> >>                             | (sextract64(inst, 31, 1) << 20))
> >>
> >> +#define GET_FUNCT3(inst) extract32(inst, 12, 3)
> >> +#define GET_FUNCT7(inst) extract32(inst, 25, 7)
> >>  #define GET_RM(inst)   extract32(inst, 12, 3)
> >>  #define GET_RS3(inst)  extract32(inst, 27, 5)
> >>  #define GET_RS1(inst)  extract32(inst, 15, 5)
> >>  #define GET_RS2(inst)  extract32(inst, 20, 5)
> >>  #define GET_RD(inst)   extract32(inst, 7, 5)
> >>  #define GET_IMM(inst)  sextract64(inst, 20, 12)
> >> +#define SET_RS1(inst, val)  deposit32(inst, 15, 5, val)
> >> +#define SET_RS2(inst, val)  deposit32(inst, 20, 5, val)
> >> +#define SET_RD(inst, val)   deposit32(inst, 7, 5, val)
> >> +#define SET_I_IMM(inst, val)  deposit32(inst, 20, 12, val)
> >> +#define SET_S_IMM(inst, val)  \
> >> +    deposit32(deposit32(inst, 7, 5, val), 25, 7, (val) >> 5)
> >>
> >>  /* RVC decoding macros */
> >>  #define GET_C_IMM(inst)             (extract32(inst, 2, 5) \
> >> @@ -346,6 +356,8 @@ enum {
> >>                                      | (extract32(inst, 5, 1) << 6))
> >>  #define GET_C_LD_IMM(inst)          ((extract16(inst, 10, 3) << 3) \
> >>                                      | (extract16(inst, 5, 2) << 6))
> >> +#define GET_C_SW_IMM(inst)          GET_C_LW_IMM(inst)
> >> +#define GET_C_SD_IMM(inst)          GET_C_LD_IMM(inst)
> >>  #define GET_C_J_IMM(inst)           ((extract32(inst, 3, 3) << 1) \
> >>                                      | (extract32(inst, 11, 1) << 4) \
> >>                                      | (extract32(inst, 2, 1) << 5) \
> >> @@ -366,4 +378,37 @@ enum {
> >>  #define GET_C_RS1S(inst)            (8 + extract16(inst, 7, 3))
> >>  #define GET_C_RS2S(inst)            (8 + extract16(inst, 2, 3))
> >>
> >> +#define GET_C_FUNC(inst)           extract32(inst, 13, 3)
> >> +#define GET_C_OP(inst)             extract32(inst, 0, 2)
> >> +
> >> +enum {
> >> +    /* RVC Quadrants */
> >> +    OPC_RISC_C_OP_QUAD0 = 0x0,
> >> +    OPC_RISC_C_OP_QUAD1 = 0x1,
> >> +    OPC_RISC_C_OP_QUAD2 = 0x2
> >> +};
> >> +
> >> +enum {
> >> +    /* RVC Quadrant 0 */
> >> +    OPC_RISC_C_FUNC_ADDI4SPN = 0x0,
> >> +    OPC_RISC_C_FUNC_FLD_LQ = 0x1,
> >> +    OPC_RISC_C_FUNC_LW = 0x2,
> >> +    OPC_RISC_C_FUNC_FLW_LD = 0x3,
> >> +    OPC_RISC_C_FUNC_FSD_SQ = 0x5,
> >> +    OPC_RISC_C_FUNC_SW = 0x6,
> >> +    OPC_RISC_C_FUNC_FSW_SD = 0x7
> >> +};
> >> +
> >> +enum {
> >> +    /* RVC Quadrant 2 */
> >> +    OPC_RISC_C_FUNC_SLLI_SLLI64 = 0x0,
> >> +    OPC_RISC_C_FUNC_FLDSP_LQSP = 0x1,
> >> +    OPC_RISC_C_FUNC_LWSP = 0x2,
> >> +    OPC_RISC_C_FUNC_FLWSP_LDSP = 0x3,
> >> +    OPC_RISC_C_FUNC_JR_MV_EBREAK_JALR_ADD = 0x4,
> >> +    OPC_RISC_C_FUNC_FSDSP_SQSP = 0x5,
> >> +    OPC_RISC_C_FUNC_SWSP = 0x6,
> >> +    OPC_RISC_C_FUNC_FSWSP_SDSP = 0x7
> >> +};
> >> +
> >>  #endif
> >> --
> >> 2.34.1
> >>
> >>
> >

I will quickly send v8.

Thanks,
Anup

