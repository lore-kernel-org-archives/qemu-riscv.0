Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nonc3-0002DG-Pe
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 10:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbz-0002A9-8t
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbv-0001DN-Ng
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:45 -0400
Received: by mail-pl1-x631.google.com with SMTP id d22so2083044plr.9
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Go2jxZt8elsB9r6l3tGnek7Fd4marzz+WCLSlSSvUUA=;
 b=JfMNFDH2e6QOry+TtyLxJuzLZIGFW/WGxwgMzE2vfwnJtAxrvHeYnPpyIE0Phe1Z3m
 4MtUXnCfTDQkvymEao1eW4gpTewjWZjKNpEdTsa4wQwNNhZhKo3mpdWQ7GhKGrQA2AyY
 FnZ64sOfZv3ZH3o48brL/nDkYj18aqSJWIqSfcRatKl/Lx0At4Mywa7HdtUfV1hs4DoS
 tF+APL0PUzRi6JmQV5rTK+w1gEvA74Za10wQBeEt6r0HDLP94KeaoJz1byEZH2cZEkdC
 xGUdctrlrz1i62o1hEIe94qq7iRK7WfWfBCpJVDINSFYBSWE5uNOyzzogXcBeAEdr6It
 ruhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Go2jxZt8elsB9r6l3tGnek7Fd4marzz+WCLSlSSvUUA=;
 b=uK2kdo/DZgerTmCdCq4A13pu+47jS5V7rIDPazuIinQ3DXjmEuk7MGw4faX7cxc2kC
 NJylab8CPsc69Yh4f/QsjPDc6sZf8tTDJyq/6OkPjOTq4qwq0AV7sACB3xQEJ0fvlHhs
 Rs+sfZ90HEbVafdjtc72JaxCS/ynMhOTXh1f2F08nKwXStjK8p9v6VSwhbG9wAR2rFk9
 vA8YnrsVqnNe1w0l1yvczkEm9Yh72G7DBnTsLB2TMxASRFo2aa0qvDMQS7woniQQw5uG
 HDcv9e2EknrZ6zmaoZBBnb5fDdZQWj7+MuIjE7tt+v/GRQFlryan6I/r93NItVKPXXDO
 Igcg==
X-Gm-Message-State: AOAM530x71iVICXgpyxz/KX4cIthwH5eFt9hHqB6nvPt6prCIpd7yZdM
 oSNEK57PBDCQ8CcaGuxdT+T6FQ==
X-Google-Smtp-Source: ABdhPJy/ZQNpaWg1FF8O1v74bdNEKIksFbrrf0CM0nLx3usScKJA5rW3w71FhnEAzMGDJ3LKE3VNrg==
X-Received: by 2002:a17:90a:db51:b0:1dc:9da2:793b with SMTP id
 u17-20020a17090adb5100b001dc9da2793bmr5697308pjx.77.1652280402343; 
 Wed, 11 May 2022 07:46:42 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:41 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 4/8] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
Date: Wed, 11 May 2022 20:15:24 +0530
Message-Id: <20220511144528.393530-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Wed, 11 May 2022 14:46:48 -0000

We should write transformed instruction encoding of the trapped
instruction in [m|h]tinst CSR at time of taking trap as defined
by the RISC-V privileged specification v1.12.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 168 +++++++++++++++++++++++++++++++++++++-
 target/riscv/instmap.h    |  41 ++++++++++
 2 files changed, 205 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d99fac9d2d..b24652eb8d 100644
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
@@ -1318,6 +1319,158 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 }
 #endif /* !CONFIG_USER_ONLY */
 
+static target_ulong riscv_transformed_insn(CPURISCVState *env,
+                                           target_ulong insn)
+{
+    target_ulong xinsn = 0;
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
+                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
+                    xinsn = SET_I_IMM(xinsn, GET_C_LD_IMM(insn));
+                }
+                break;
+            case OPC_RISC_C_FUNC_LW: /* C.LW */
+                xinsn = OPC_RISC_LW;
+                xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
+                xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
+                xinsn = SET_I_IMM(xinsn, GET_C_LW_IMM(insn));
+                break;
+            case OPC_RISC_C_FUNC_FLW_LD:
+                if (riscv_cpu_xlen(env) == 32) { /* C.FLW (RV32) */
+                    xinsn = OPC_RISC_FLW;
+                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
+                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
+                    xinsn = SET_I_IMM(xinsn, GET_C_LW_IMM(insn));
+                } else { /* C.LD (RV64/RV128) */
+                    xinsn = OPC_RISC_LD;
+                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
+                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
+                    xinsn = SET_I_IMM(xinsn, GET_C_LD_IMM(insn));
+                }
+                break;
+            case OPC_RISC_C_FUNC_FSD_SQ:
+                if (riscv_cpu_xlen(env) != 128) { /* C.FSD (RV32/64) */
+                    xinsn = OPC_RISC_FSD;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
+                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
+                    xinsn = SET_S_IMM(xinsn, GET_C_SD_IMM(insn));
+                }
+                break;
+            case OPC_RISC_C_FUNC_SW: /* C.SW */
+                xinsn = OPC_RISC_SW;
+                xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
+                xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
+                xinsn = SET_S_IMM(xinsn, GET_C_SW_IMM(insn));
+                break;
+            case OPC_RISC_C_FUNC_FSW_SD:
+                if (riscv_cpu_xlen(env) == 32) { /* C.FSW (RV32) */
+                    xinsn = OPC_RISC_FSW;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
+                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
+                    xinsn = SET_S_IMM(xinsn, GET_C_SW_IMM(insn));
+                } else { /* C.SD (RV64/RV128) */
+                    xinsn = OPC_RISC_SD;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
+                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
+                    xinsn = SET_S_IMM(xinsn, GET_C_SD_IMM(insn));
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
+                    xinsn = SET_RS1(xinsn, 2);
+                    xinsn = SET_I_IMM(xinsn, GET_C_LDSP_IMM(insn));
+                }
+                break;
+            case OPC_RISC_C_FUNC_LWSP: /* C.LWSP */
+                xinsn = OPC_RISC_LW;
+                xinsn = SET_RD(xinsn, GET_C_RD(insn));
+                xinsn = SET_RS1(xinsn, 2);
+                xinsn = SET_I_IMM(xinsn, GET_C_LWSP_IMM(insn));
+                break;
+            case OPC_RISC_C_FUNC_FLWSP_LDSP:
+                if (riscv_cpu_xlen(env) == 32) { /* C.FLWSP (RV32) */
+                    xinsn = OPC_RISC_FLW;
+                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
+                    xinsn = SET_RS1(xinsn, 2);
+                    xinsn = SET_I_IMM(xinsn, GET_C_LWSP_IMM(insn));
+                } else { /* C.LDSP (RV64/RV128) */
+                    xinsn = OPC_RISC_LD;
+                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
+                    xinsn = SET_RS1(xinsn, 2);
+                    xinsn = SET_I_IMM(xinsn, GET_C_LDSP_IMM(insn));
+                }
+                break;
+            case OPC_RISC_C_FUNC_FSDSP_SQSP:
+                if (riscv_cpu_xlen(env) != 128) { /* C.FSDSP (RV32/64) */
+                    xinsn = OPC_RISC_FSD;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
+                    xinsn = SET_RS1(xinsn, 2);
+                    xinsn = SET_S_IMM(xinsn, GET_C_SDSP_IMM(insn));
+                }
+                break;
+            case OPC_RISC_C_FUNC_SWSP: /* C.SWSP */
+                xinsn = OPC_RISC_SW;
+                xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
+                xinsn = SET_RS1(xinsn, 2);
+                xinsn = SET_S_IMM(xinsn, GET_C_SWSP_IMM(insn));
+                break;
+            case 7:
+                if (riscv_cpu_xlen(env) == 32) { /* C.FSWSP (RV32) */
+                    xinsn = OPC_RISC_FSW;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
+                    xinsn = SET_RS1(xinsn, 2);
+                    xinsn = SET_S_IMM(xinsn, GET_C_SWSP_IMM(insn));
+                } else { /* C.SDSP (RV64/RV128) */
+                    xinsn = OPC_RISC_SD;
+                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
+                    xinsn = SET_RS1(xinsn, 2);
+                    xinsn = SET_S_IMM(xinsn, GET_C_SDSP_IMM(insn));
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
+        /* No need to transform 32bit (or wider) instructions */
+        xinsn = insn;
+    }
+
+    return xinsn;
+}
+
 /*
  * Handle Traps
  *
@@ -1340,6 +1493,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     uint64_t deleg = async ? env->mideleg : env->medeleg;
     target_ulong tval = 0;
+    target_ulong tinst = 0;
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
 
@@ -1355,18 +1509,22 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
+            write_gva = env->two_stage_lookup;
+            tval = env->badaddr;
+            tinst = riscv_transformed_insn(env, env->bins);
+            break;
+        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
+        case RISCV_EXCP_INST_ADDR_MIS:
+        case RISCV_EXCP_INST_ACCESS_FAULT:
+        case RISCV_EXCP_INST_PAGE_FAULT:
             write_gva = env->two_stage_lookup;
             tval = env->badaddr;
             break;
@@ -1448,6 +1606,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->sepc = env->pc;
         env->stval = tval;
         env->htval = htval;
+        env->htinst = tinst;
         env->pc = (env->stvec >> 2 << 2) +
             ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_S);
@@ -1478,6 +1637,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mepc = env->pc;
         env->mtval = tval;
         env->mtval2 = mtval2;
+        env->mtinst = tinst;
         env->pc = (env->mtvec >> 2 << 2) +
             ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_M);
diff --git a/target/riscv/instmap.h b/target/riscv/instmap.h
index 40b6d2b64d..f4ee686c78 100644
--- a/target/riscv/instmap.h
+++ b/target/riscv/instmap.h
@@ -316,6 +316,12 @@ enum {
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
@@ -346,6 +352,8 @@ enum {
                                     | (extract32(inst, 5, 1) << 6))
 #define GET_C_LD_IMM(inst)          ((extract16(inst, 10, 3) << 3) \
                                     | (extract16(inst, 5, 2) << 6))
+#define GET_C_SW_IMM(inst)          GET_C_LW_IMM(inst)
+#define GET_C_SD_IMM(inst)          GET_C_LD_IMM(inst)
 #define GET_C_J_IMM(inst)           ((extract32(inst, 3, 3) << 1) \
                                     | (extract32(inst, 11, 1) << 4) \
                                     | (extract32(inst, 2, 1) << 5) \
@@ -366,4 +374,37 @@ enum {
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


