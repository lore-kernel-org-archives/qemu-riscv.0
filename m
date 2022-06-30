Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6nQ7-0002yp-6A
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jun 2022 02:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o6nQ2-0002wJ-4U
 for qemu-riscv@nongnu.org; Thu, 30 Jun 2022 02:12:50 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o6nPw-0000AB-T3
 for qemu-riscv@nongnu.org; Thu, 30 Jun 2022 02:12:46 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 145so3417199pga.12
 for <qemu-riscv@nongnu.org>; Wed, 29 Jun 2022 23:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s5A23qnBk4qw918Czdd0JAuAUtWoLa9kDyNXYGcZMrI=;
 b=T/bfovaKSXUrmxfCogoznxr4tj7qhcmeDfSGVpwTxD69G5SieDJ7WAbDND0GsDlm6R
 6S9orR+yXIwMzvr9OnLT/mZ3TJMRDi4LdDwM+mrIi+Iq6XpgTd44/aT13WqbCWU6kUAc
 /B1ljGwIUiKJb8u+KbD4VVZpJWqvzuiyyp795qsIIL8fPEMJIwwyP9aHKWQoLCGuRhZ0
 XlOkcwfJmMRp0JJc6m8mLX8DzOqL/skqiZaIBnwkgeZbPAQrICGp0HJeiOghKMSJ1K+G
 CHLe2bXCFjo5CPTkwQkzqwVayBeDnEiV1nocnPNYhH+tIK/6fJi4730zrQG+LC+u5BkJ
 A7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5A23qnBk4qw918Czdd0JAuAUtWoLa9kDyNXYGcZMrI=;
 b=HhVg++Ptj4oI2BEGDW4p1tFoXxt//62K60ux2HfFyYwJsncw4iPQM5ueY2y6ZTUUiu
 vyZ9Nh4PZh/klp6Z3DQkk1R2A+uOvCSRrng5+gPHfRq9GKBmlAebkHmSu5ppZq00MAv2
 DfJ4ThfWGc5YYfjlOSgpDVT8ERRKRbxx65UNxc1lCD6uL0PcZWgngz5KkIEZGcmplNfM
 NB1NSsagOEMqhVYdRbqvbIGkEeGM1C1xtyVne8qShCBNenzwIFtJ3qTMgBA4SZUxmpeq
 qkkC31kTO4SL/e19oLVvdgICquHeD32aKkzxQAznw3ZBxhOt4pavh11UWudL9GicbK3j
 O2zA==
X-Gm-Message-State: AJIora/FklD6Cho6nBPk1sLD5YyraQSs51EcwZooeLUlg601MzIfNajv
 KE/zXjFyTl4NpgxConkjwNZmZA==
X-Google-Smtp-Source: AGRyM1u+AwhZOeEui89TxdN39S9GtPNf0YbEerD9+7R5KiLM4jfmarPB/vnQf025EXQ6GqplLmhBrg==
X-Received: by 2002:a63:ef0b:0:b0:40d:287d:71e1 with SMTP id
 u11-20020a63ef0b000000b0040d287d71e1mr6248752pgh.330.1656569563342; 
 Wed, 29 Jun 2022 23:12:43 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([223.226.107.19])
 by smtp.gmail.com with ESMTPSA id
 a25-20020aa79719000000b0052551c1a413sm12647618pfg.204.2022.06.29.23.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 23:12:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v9 1/2] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
Date: Thu, 30 Jun 2022 11:41:49 +0530
Message-Id: <20220630061150.905174-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220630061150.905174-1-apatel@ventanamicro.com>
References: <20220630061150.905174-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Thu, 30 Jun 2022 06:12:50 -0000

We should write transformed instruction encoding of the trapped
instruction in [m|h]tinst CSR at time of taking trap as defined
by the RISC-V privileged specification v1.12.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.h        |   5 +
 target/riscv/cpu_helper.c | 252 +++++++++++++++++++++++++++++++++++++-
 target/riscv/instmap.h    |  45 +++++++
 3 files changed, 296 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055a..ffb1a18873 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -285,6 +285,11 @@ struct CPUArchState {
     /* Signals whether the current exception occurred with two-stage address
        translation active. */
     bool two_stage_lookup;
+    /*
+     * Signals whether the current exception occurred while doing two-stage
+     * address translation for the VS-stage page table walk.
+     */
+    bool two_stage_indirect_lookup;
 
     target_ulong scounteren;
     target_ulong mcounteren;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index be28615e23..c59cfddac2 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -22,6 +22,7 @@
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "instmap.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
@@ -1057,7 +1058,8 @@ restart:
 
 static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
                                 MMUAccessType access_type, bool pmp_violation,
-                                bool first_stage, bool two_stage)
+                                bool first_stage, bool two_stage,
+                                bool two_stage_indirect)
 {
     CPUState *cs = env_cpu(env);
     int page_fault_exceptions, vm;
@@ -1107,6 +1109,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     }
     env->badaddr = address;
     env->two_stage_lookup = two_stage;
+    env->two_stage_indirect_lookup = two_stage_indirect;
 }
 
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
@@ -1152,6 +1155,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
+    env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
 
@@ -1177,6 +1181,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
+    env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
 
@@ -1192,6 +1197,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     bool pmp_violation = false;
     bool first_stage_error = true;
     bool two_stage_lookup = false;
+    bool two_stage_indirect_error = false;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
     /* default TLB page size */
@@ -1229,6 +1235,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
          */
         if (ret == TRANSLATE_G_STAGE_FAIL) {
             first_stage_error = false;
+            two_stage_indirect_error = true;
             access_type = MMU_DATA_LOAD;
         }
 
@@ -1312,12 +1319,218 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error,
                             riscv_cpu_virt_enabled(env) ||
-                                riscv_cpu_two_stage_lookup(mmu_idx));
+                                riscv_cpu_two_stage_lookup(mmu_idx),
+                            two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
     }
 
     return true;
 }
+
+static target_ulong riscv_transformed_insn(CPURISCVState *env,
+                                           target_ulong insn,
+                                           target_ulong taddr)
+{
+    target_ulong xinsn = 0;
+    target_ulong access_rs1 = 0, access_imm = 0, access_size = 0;
+
+    /*
+     * Only Quadrant 0 and Quadrant 2 of RVC instruction space need to
+     * be uncompressed. The Quadrant 1 of RVC instruction space need
+     * not be transformed because these instructions won't generate
+     * any load/store trap.
+     */
+
+    if ((insn & 0x3) != 0x3) {
+        /* Transform 16bit instruction into 32bit instruction */
+        switch (GET_C_OP(insn)) {
+        case OPC_RISC_C_OP_QUAD0: /* Quadrant 0 */
+            switch (GET_C_FUNC(insn)) {
+            case OPC_RISC_C_FUNC_FLD_LQ:
+                if (riscv_cpu_xlen(env) != 128) { /* C.FLD (RV32/64) */
+                    xinsn = OPC_RISC_FLD;
+                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
+                    access_rs1 = GET_C_RS1S(insn);
+                    access_imm = GET_C_LD_IMM(insn);
+                    access_size = 8;
+                }
+                break;
+            case OPC_RISC_C_FUNC_LW: /* C.LW */
+                xinsn = OPC_RISC_LW;
+                xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
+                access_rs1 = GET_C_RS1S(insn);
+                access_imm = GET_C_LW_IMM(insn);
+                access_size = 4;
+                break;
+            case OPC_RISC_C_FUNC_FLW_LD:
+                if (riscv_cpu_xlen(env) == 32) { /* C.FLW (RV32) */
+                    xinsn = OPC_RISC_FLW;
+                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
+                    access_rs1 = GET_C_RS1S(insn);
+                    access_imm = GET_C_LW_IMM(insn);
+                    access_size = 4;
+                } else { /* C.LD (RV64/RV128) */
+                    xinsn = OPC_RISC_LD;
+                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
+                    access_rs1 = GET_C_RS1S(insn);
+                    access_imm = GET_C_LD_IMM(insn);
+                    access_size = 8;
+                }
+                break;
+            case OPC_RISC_C_FUNC_FSD_SQ:
+                if (riscv_cpu_xlen(env) != 128) { /* C.FSD (RV32/64) */
+                    xinsn = OPC_RISC_FSD;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
+                    access_rs1 = GET_C_RS1S(insn);
+                    access_imm = GET_C_SD_IMM(insn);
+                    access_size = 8;
+                }
+                break;
+            case OPC_RISC_C_FUNC_SW: /* C.SW */
+                xinsn = OPC_RISC_SW;
+                xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
+                access_rs1 = GET_C_RS1S(insn);
+                access_imm = GET_C_SW_IMM(insn);
+                access_size = 4;
+                break;
+            case OPC_RISC_C_FUNC_FSW_SD:
+                if (riscv_cpu_xlen(env) == 32) { /* C.FSW (RV32) */
+                    xinsn = OPC_RISC_FSW;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
+                    access_rs1 = GET_C_RS1S(insn);
+                    access_imm = GET_C_SW_IMM(insn);
+                    access_size = 4;
+                } else { /* C.SD (RV64/RV128) */
+                    xinsn = OPC_RISC_SD;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
+                    access_rs1 = GET_C_RS1S(insn);
+                    access_imm = GET_C_SD_IMM(insn);
+                    access_size = 8;
+                }
+                break;
+            default:
+                break;
+            }
+            break;
+        case OPC_RISC_C_OP_QUAD2: /* Quadrant 2 */
+            switch (GET_C_FUNC(insn)) {
+            case OPC_RISC_C_FUNC_FLDSP_LQSP:
+                if (riscv_cpu_xlen(env) != 128) { /* C.FLDSP (RV32/64) */
+                    xinsn = OPC_RISC_FLD;
+                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
+                    access_rs1 = 2;
+                    access_imm = GET_C_LDSP_IMM(insn);
+                    access_size = 8;
+                }
+                break;
+            case OPC_RISC_C_FUNC_LWSP: /* C.LWSP */
+                xinsn = OPC_RISC_LW;
+                xinsn = SET_RD(xinsn, GET_C_RD(insn));
+                access_rs1 = 2;
+                access_imm = GET_C_LWSP_IMM(insn);
+                access_size = 4;
+                break;
+            case OPC_RISC_C_FUNC_FLWSP_LDSP:
+                if (riscv_cpu_xlen(env) == 32) { /* C.FLWSP (RV32) */
+                    xinsn = OPC_RISC_FLW;
+                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
+                    access_rs1 = 2;
+                    access_imm = GET_C_LWSP_IMM(insn);
+                    access_size = 4;
+                } else { /* C.LDSP (RV64/RV128) */
+                    xinsn = OPC_RISC_LD;
+                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
+                    access_rs1 = 2;
+                    access_imm = GET_C_LDSP_IMM(insn);
+                    access_size = 8;
+                }
+                break;
+            case OPC_RISC_C_FUNC_FSDSP_SQSP:
+                if (riscv_cpu_xlen(env) != 128) { /* C.FSDSP (RV32/64) */
+                    xinsn = OPC_RISC_FSD;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
+                    access_rs1 = 2;
+                    access_imm = GET_C_SDSP_IMM(insn);
+                    access_size = 8;
+                }
+                break;
+            case OPC_RISC_C_FUNC_SWSP: /* C.SWSP */
+                xinsn = OPC_RISC_SW;
+                xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
+                access_rs1 = 2;
+                access_imm = GET_C_SWSP_IMM(insn);
+                access_size = 4;
+                break;
+            case 7:
+                if (riscv_cpu_xlen(env) == 32) { /* C.FSWSP (RV32) */
+                    xinsn = OPC_RISC_FSW;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
+                    access_rs1 = 2;
+                    access_imm = GET_C_SWSP_IMM(insn);
+                    access_size = 4;
+                } else { /* C.SDSP (RV64/RV128) */
+                    xinsn = OPC_RISC_SD;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
+                    access_rs1 = 2;
+                    access_imm = GET_C_SDSP_IMM(insn);
+                    access_size = 8;
+                }
+                break;
+            default:
+                break;
+            }
+            break;
+        default:
+            break;
+        }
+
+        /*
+         * Clear Bit1 of transformed instruction to indicate that
+         * original insruction was a 16bit instruction
+         */
+        xinsn &= ~((target_ulong)0x2);
+    } else {
+        /* Transform 32bit (or wider) instructions */
+        switch (MASK_OP_MAJOR(insn)) {
+        case OPC_RISC_ATOMIC:
+            xinsn = insn;
+            access_rs1 = GET_RS1(insn);
+            access_size = 1 << GET_FUNCT3(insn);
+            break;
+        case OPC_RISC_LOAD:
+        case OPC_RISC_FP_LOAD:
+            xinsn = SET_I_IMM(insn, 0);
+            access_rs1 = GET_RS1(insn);
+            access_imm = GET_IMM(insn);
+            access_size = 1 << GET_FUNCT3(insn);
+            break;
+        case OPC_RISC_STORE:
+        case OPC_RISC_FP_STORE:
+            xinsn = SET_S_IMM(insn, 0);
+            access_rs1 = GET_RS1(insn);
+            access_imm = GET_STORE_IMM(insn);
+            access_size = 1 << GET_FUNCT3(insn);
+            break;
+        case OPC_RISC_SYSTEM:
+            if (MASK_OP_SYSTEM(insn) == OPC_RISC_HLVHSV) {
+                xinsn = insn;
+                access_rs1 = GET_RS1(insn);
+                access_size = 1 << ((GET_FUNCT7(insn) >> 1) & 0x3);
+                access_size = 1 << access_size;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    if (access_size) {
+        xinsn = SET_RS1(xinsn, (taddr - (env->gpr[access_rs1] + access_imm)) &
+                               (access_size - 1));
+    }
+
+    return xinsn;
+}
 #endif /* !CONFIG_USER_ONLY */
 
 /*
@@ -1342,6 +1555,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     uint64_t deleg = async ? env->mideleg : env->medeleg;
     target_ulong tval = 0;
+    target_ulong tinst = 0;
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
 
@@ -1357,20 +1571,43 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
-        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
         case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
-        case RISCV_EXCP_INST_ADDR_MIS:
-        case RISCV_EXCP_INST_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
         case RISCV_EXCP_STORE_AMO_ADDR_MIS:
         case RISCV_EXCP_LOAD_ACCESS_FAULT:
         case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
-        case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
             write_gva = env->two_stage_lookup;
             tval = env->badaddr;
+            if (env->two_stage_indirect_lookup) {
+                /*
+                 * special pseudoinstruction for G-stage fault taken while
+                 * doing VS-stage page table walk.
+                 */
+                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
+            } else {
+                /*
+                 * The "Addr. Offset" field in transformed instruction is
+                 * non-zero only for misaligned access.
+                 */
+                tinst = riscv_transformed_insn(env, env->bins, tval);
+            }
+            break;
+        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
+        case RISCV_EXCP_INST_ADDR_MIS:
+        case RISCV_EXCP_INST_ACCESS_FAULT:
+        case RISCV_EXCP_INST_PAGE_FAULT:
+            write_gva = env->two_stage_lookup;
+            tval = env->badaddr;
+            if (env->two_stage_indirect_lookup) {
+                /*
+                 * special pseudoinstruction for G-stage fault taken while
+                 * doing VS-stage page table walk.
+                 */
+                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
+            }
             break;
         case RISCV_EXCP_ILLEGAL_INST:
         case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
@@ -1450,6 +1687,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->sepc = env->pc;
         env->stval = tval;
         env->htval = htval;
+        env->htinst = tinst;
         env->pc = (env->stvec >> 2 << 2) +
             ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_S);
@@ -1480,6 +1718,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mepc = env->pc;
         env->mtval = tval;
         env->mtval2 = mtval2;
+        env->mtinst = tinst;
         env->pc = (env->mtvec >> 2 << 2) +
             ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_M);
@@ -1492,6 +1731,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
 
     env->two_stage_lookup = false;
+    env->two_stage_indirect_lookup = false;
 #endif
     cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
 }
diff --git a/target/riscv/instmap.h b/target/riscv/instmap.h
index 40b6d2b64d..f877530576 100644
--- a/target/riscv/instmap.h
+++ b/target/riscv/instmap.h
@@ -184,6 +184,8 @@ enum {
     OPC_RISC_CSRRWI      = OPC_RISC_SYSTEM | (0x5 << 12),
     OPC_RISC_CSRRSI      = OPC_RISC_SYSTEM | (0x6 << 12),
     OPC_RISC_CSRRCI      = OPC_RISC_SYSTEM | (0x7 << 12),
+
+    OPC_RISC_HLVHSV      = OPC_RISC_SYSTEM | (0x4 << 12),
 };
 
 #define MASK_OP_FP_LOAD(op)   (MASK_OP_MAJOR(op) | (op & (0x7 << 12)))
@@ -310,12 +312,20 @@ enum {
                            | (extract32(inst, 12, 8) << 12) \
                            | (sextract64(inst, 31, 1) << 20))
 
+#define GET_FUNCT3(inst) extract32(inst, 12, 3)
+#define GET_FUNCT7(inst) extract32(inst, 25, 7)
 #define GET_RM(inst)   extract32(inst, 12, 3)
 #define GET_RS3(inst)  extract32(inst, 27, 5)
 #define GET_RS1(inst)  extract32(inst, 15, 5)
 #define GET_RS2(inst)  extract32(inst, 20, 5)
 #define GET_RD(inst)   extract32(inst, 7, 5)
 #define GET_IMM(inst)  sextract64(inst, 20, 12)
+#define SET_RS1(inst, val)  deposit32(inst, 15, 5, val)
+#define SET_RS2(inst, val)  deposit32(inst, 20, 5, val)
+#define SET_RD(inst, val)   deposit32(inst, 7, 5, val)
+#define SET_I_IMM(inst, val)  deposit32(inst, 20, 12, val)
+#define SET_S_IMM(inst, val)  \
+    deposit32(deposit32(inst, 7, 5, val), 25, 7, (val) >> 5)
 
 /* RVC decoding macros */
 #define GET_C_IMM(inst)             (extract32(inst, 2, 5) \
@@ -346,6 +356,8 @@ enum {
                                     | (extract32(inst, 5, 1) << 6))
 #define GET_C_LD_IMM(inst)          ((extract16(inst, 10, 3) << 3) \
                                     | (extract16(inst, 5, 2) << 6))
+#define GET_C_SW_IMM(inst)          GET_C_LW_IMM(inst)
+#define GET_C_SD_IMM(inst)          GET_C_LD_IMM(inst)
 #define GET_C_J_IMM(inst)           ((extract32(inst, 3, 3) << 1) \
                                     | (extract32(inst, 11, 1) << 4) \
                                     | (extract32(inst, 2, 1) << 5) \
@@ -366,4 +378,37 @@ enum {
 #define GET_C_RS1S(inst)            (8 + extract16(inst, 7, 3))
 #define GET_C_RS2S(inst)            (8 + extract16(inst, 2, 3))
 
+#define GET_C_FUNC(inst)           extract32(inst, 13, 3)
+#define GET_C_OP(inst)             extract32(inst, 0, 2)
+
+enum {
+    /* RVC Quadrants */
+    OPC_RISC_C_OP_QUAD0 = 0x0,
+    OPC_RISC_C_OP_QUAD1 = 0x1,
+    OPC_RISC_C_OP_QUAD2 = 0x2
+};
+
+enum {
+    /* RVC Quadrant 0 */
+    OPC_RISC_C_FUNC_ADDI4SPN = 0x0,
+    OPC_RISC_C_FUNC_FLD_LQ = 0x1,
+    OPC_RISC_C_FUNC_LW = 0x2,
+    OPC_RISC_C_FUNC_FLW_LD = 0x3,
+    OPC_RISC_C_FUNC_FSD_SQ = 0x5,
+    OPC_RISC_C_FUNC_SW = 0x6,
+    OPC_RISC_C_FUNC_FSW_SD = 0x7
+};
+
+enum {
+    /* RVC Quadrant 2 */
+    OPC_RISC_C_FUNC_SLLI_SLLI64 = 0x0,
+    OPC_RISC_C_FUNC_FLDSP_LQSP = 0x1,
+    OPC_RISC_C_FUNC_LWSP = 0x2,
+    OPC_RISC_C_FUNC_FLWSP_LDSP = 0x3,
+    OPC_RISC_C_FUNC_JR_MV_EBREAK_JALR_ADD = 0x4,
+    OPC_RISC_C_FUNC_FSDSP_SQSP = 0x5,
+    OPC_RISC_C_FUNC_SWSP = 0x6,
+    OPC_RISC_C_FUNC_FSWSP_SDSP = 0x7
+};
+
 #endif
-- 
2.34.1


