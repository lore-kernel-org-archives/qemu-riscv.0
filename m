Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF172C7EE43
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:12:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8fRk-0001fz-Jc; Mon, 12 Jun 2023 07:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRf-0001d8-1P
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:48 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRc-0002MG-4i
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:46 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-977e7d6945aso760376166b.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1686568242; x=1689160242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bsXcpezHijXoj1/n4fYMdKNvLEOwn1zoedPcHw9pg2k=;
 b=VbedI0qcbWDspXM818Vuel2aZZq9fRqcqmukgADF1hOVISEgQ8aNERl7U9sBfFnVj0
 w7pfZhz0epzbjcG4cgJ1dXynmqDK60xJElM34GRNkRwRmy2n5KthBYCAbnMDmN2WNadZ
 s8hbV0uOuKBARslyoXsvKYYvzo5uCxpOit/4SW3GiFDTXrzwWX9Ru0rsNslmk8u4Hjs3
 HmnXQEW/KS53O0ITeygcnMyUKdWwPOETuG9guyS8Ax2cL/aAiPGQDGoab1ZGY3sWdUZ0
 aPvPkKGX69WyeApy5toHQA9obE+Wdg4hi7UK9z6s7iuW8VpJOZLC2DD6nakCZ/0Aqx9A
 TivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686568242; x=1689160242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsXcpezHijXoj1/n4fYMdKNvLEOwn1zoedPcHw9pg2k=;
 b=CA1P8k4EsTfpKAFsYQQctydDE0H59/ht1MFy01dFTnojsK3BOvmNEcqmL1hZ+QVX4N
 bBdY0Vj3kYJMqpDnKUPJ8TqqEHOSniZL1hPRNy5FxdQ3iCDUtum0Et1fy0oBFujZQUed
 do1yqdqYUky5euK/LFPuAcwKau29mCFJcg0ZzrrS3Qfxgd2Dp2e4lDEF94xHnB97Nzzw
 adkLeSGFnGL93Bu7IeQU0uGd778LxOMVOWzNd9V4jjL991VGobuBhT8iMmDQQ/k0BFHj
 Rmf8V36PcQyVeH4LwI5Zvnw3+T+l2UNYtFjbA9peCysda8qEuDajiCjAq/LSbjve6OSN
 LLmQ==
X-Gm-Message-State: AC+VfDxmqo3c7pKcrxTY3edtj1xz1ijmW5nEApsIt0jtaRIwnK6uc214
 /GYXCF1f13+fEhwzQBypzcmYPY0KD5VlkCBV4UU=
X-Google-Smtp-Source: ACHHUZ6NbCanFIVEgQmEEiLMWr8LYab6zBy/qsOA3Qd/JPfdz56iPiSGSU8JCXXa7Z1nNDxPUOkHpw==
X-Received: by 2002:a17:907:748:b0:974:5ce6:f9f6 with SMTP id
 xc8-20020a170907074800b009745ce6f9f6mr9906177ejb.10.1686568242001; 
 Mon, 12 Jun 2023 04:10:42 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1709064a1700b00978723f594bsm5000948eju.101.2023.06.12.04.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 04:10:41 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 3/8] disas/riscv: Move types/constants to new header file
Date: Mon, 12 Jun 2023 13:10:29 +0200
Message-Id: <20230612111034.3955227-4-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
References: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Christoph Müllner <christoph.muellner@vrull.eu>

In order to enable vendor disassembler support, we need to
move types and constants into a header file so that other
compilation units can use them as well.

This patch does not introduce any functional changes.

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 disas/riscv.c | 270 +----------------------------------------------
 disas/riscv.h | 282 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 283 insertions(+), 269 deletions(-)
 create mode 100644 disas/riscv.h

diff --git a/disas/riscv.c b/disas/riscv.c
index 5005364aba..4a55348267 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -20,157 +20,7 @@
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 #include "target/riscv/cpu_cfg.h"
-
-/* types */
-
-typedef uint64_t rv_inst;
-typedef uint16_t rv_opcode;
-
-/* enums */
-
-typedef enum {
-    rv32,
-    rv64,
-    rv128
-} rv_isa;
-
-typedef enum {
-    rv_rm_rne = 0,
-    rv_rm_rtz = 1,
-    rv_rm_rdn = 2,
-    rv_rm_rup = 3,
-    rv_rm_rmm = 4,
-    rv_rm_dyn = 7,
-} rv_rm;
-
-typedef enum {
-    rv_fence_i = 8,
-    rv_fence_o = 4,
-    rv_fence_r = 2,
-    rv_fence_w = 1,
-} rv_fence;
-
-typedef enum {
-    rv_ireg_zero,
-    rv_ireg_ra,
-    rv_ireg_sp,
-    rv_ireg_gp,
-    rv_ireg_tp,
-    rv_ireg_t0,
-    rv_ireg_t1,
-    rv_ireg_t2,
-    rv_ireg_s0,
-    rv_ireg_s1,
-    rv_ireg_a0,
-    rv_ireg_a1,
-    rv_ireg_a2,
-    rv_ireg_a3,
-    rv_ireg_a4,
-    rv_ireg_a5,
-    rv_ireg_a6,
-    rv_ireg_a7,
-    rv_ireg_s2,
-    rv_ireg_s3,
-    rv_ireg_s4,
-    rv_ireg_s5,
-    rv_ireg_s6,
-    rv_ireg_s7,
-    rv_ireg_s8,
-    rv_ireg_s9,
-    rv_ireg_s10,
-    rv_ireg_s11,
-    rv_ireg_t3,
-    rv_ireg_t4,
-    rv_ireg_t5,
-    rv_ireg_t6,
-} rv_ireg;
-
-typedef enum {
-    rvc_end,
-    rvc_rd_eq_ra,
-    rvc_rd_eq_x0,
-    rvc_rs1_eq_x0,
-    rvc_rs2_eq_x0,
-    rvc_rs2_eq_rs1,
-    rvc_rs1_eq_ra,
-    rvc_imm_eq_zero,
-    rvc_imm_eq_n1,
-    rvc_imm_eq_p1,
-    rvc_csr_eq_0x001,
-    rvc_csr_eq_0x002,
-    rvc_csr_eq_0x003,
-    rvc_csr_eq_0xc00,
-    rvc_csr_eq_0xc01,
-    rvc_csr_eq_0xc02,
-    rvc_csr_eq_0xc80,
-    rvc_csr_eq_0xc81,
-    rvc_csr_eq_0xc82,
-} rvc_constraint;
-
-typedef enum {
-    rv_codec_illegal,
-    rv_codec_none,
-    rv_codec_u,
-    rv_codec_uj,
-    rv_codec_i,
-    rv_codec_i_sh5,
-    rv_codec_i_sh6,
-    rv_codec_i_sh7,
-    rv_codec_i_csr,
-    rv_codec_s,
-    rv_codec_sb,
-    rv_codec_r,
-    rv_codec_r_m,
-    rv_codec_r4_m,
-    rv_codec_r_a,
-    rv_codec_r_l,
-    rv_codec_r_f,
-    rv_codec_cb,
-    rv_codec_cb_imm,
-    rv_codec_cb_sh5,
-    rv_codec_cb_sh6,
-    rv_codec_ci,
-    rv_codec_ci_sh5,
-    rv_codec_ci_sh6,
-    rv_codec_ci_16sp,
-    rv_codec_ci_lwsp,
-    rv_codec_ci_ldsp,
-    rv_codec_ci_lqsp,
-    rv_codec_ci_li,
-    rv_codec_ci_lui,
-    rv_codec_ci_none,
-    rv_codec_ciw_4spn,
-    rv_codec_cj,
-    rv_codec_cj_jal,
-    rv_codec_cl_lw,
-    rv_codec_cl_ld,
-    rv_codec_cl_lq,
-    rv_codec_cr,
-    rv_codec_cr_mv,
-    rv_codec_cr_jalr,
-    rv_codec_cr_jr,
-    rv_codec_cs,
-    rv_codec_cs_sw,
-    rv_codec_cs_sd,
-    rv_codec_cs_sq,
-    rv_codec_css_swsp,
-    rv_codec_css_sdsp,
-    rv_codec_css_sqsp,
-    rv_codec_k_bs,
-    rv_codec_k_rnum,
-    rv_codec_v_r,
-    rv_codec_v_ldst,
-    rv_codec_v_i,
-    rv_codec_vsetvli,
-    rv_codec_vsetivli,
-    rv_codec_zcb_ext,
-    rv_codec_zcb_mul,
-    rv_codec_zcb_lb,
-    rv_codec_zcb_lh,
-    rv_codec_zcmp_cm_pushpop,
-    rv_codec_zcmp_cm_mv,
-    rv_codec_zcmt_jt,
-} rv_codec;
+#include "disas/riscv.h"
 
 typedef enum {
     rv_op_illegal = 0,
@@ -966,51 +816,6 @@ typedef enum {
     rv_op_czero_nez = 790,
 } rv_op;
 
-/* structures */
-
-typedef struct {
-    RISCVCPUConfig *cfg;
-    uint64_t  pc;
-    uint64_t  inst;
-    int32_t   imm;
-    uint16_t  op;
-    uint8_t   codec;
-    uint8_t   rd;
-    uint8_t   rs1;
-    uint8_t   rs2;
-    uint8_t   rs3;
-    uint8_t   rm;
-    uint8_t   pred;
-    uint8_t   succ;
-    uint8_t   aq;
-    uint8_t   rl;
-    uint8_t   bs;
-    uint8_t   rnum;
-    uint8_t   vm;
-    uint32_t  vzimm;
-    uint8_t   rlist;
-} rv_decode;
-
-typedef struct {
-    const int op;
-    const rvc_constraint *constraints;
-} rv_comp_data;
-
-enum {
-    rvcd_imm_nz = 0x1
-};
-
-typedef struct {
-    const char * const name;
-    const rv_codec codec;
-    const char * const format;
-    const rv_comp_data *pseudo;
-    const short decomp_rv32;
-    const short decomp_rv64;
-    const short decomp_rv128;
-    const short decomp_data;
-} rv_opcode_data;
-
 /* register names */
 
 static const char rv_ireg_name_sym[32][5] = {
@@ -1034,79 +839,6 @@ static const char rv_vreg_name_sym[32][4] = {
     "v24", "v25", "v26", "v27", "v28", "v29", "v30", "v31"
 };
 
-/* instruction formats */
-
-#define rv_fmt_none                   "O\t"
-#define rv_fmt_rs1                    "O\t1"
-#define rv_fmt_offset                 "O\to"
-#define rv_fmt_pred_succ              "O\tp,s"
-#define rv_fmt_rs1_rs2                "O\t1,2"
-#define rv_fmt_rd_imm                 "O\t0,i"
-#define rv_fmt_rd_offset              "O\t0,o"
-#define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
-#define rv_fmt_frd_rs1                "O\t3,1"
-#define rv_fmt_frd_frs1               "O\t3,4"
-#define rv_fmt_rd_frs1                "O\t0,4"
-#define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
-#define rv_fmt_frd_frs1_frs2          "O\t3,4,5"
-#define rv_fmt_rm_frd_frs1            "O\tr,3,4"
-#define rv_fmt_rm_frd_rs1             "O\tr,3,1"
-#define rv_fmt_rm_rd_frs1             "O\tr,0,4"
-#define rv_fmt_rm_frd_frs1_frs2       "O\tr,3,4,5"
-#define rv_fmt_rm_frd_frs1_frs2_frs3  "O\tr,3,4,5,6"
-#define rv_fmt_rd_rs1_imm             "O\t0,1,i"
-#define rv_fmt_rd_rs1_offset          "O\t0,1,i"
-#define rv_fmt_rd_offset_rs1          "O\t0,i(1)"
-#define rv_fmt_frd_offset_rs1         "O\t3,i(1)"
-#define rv_fmt_rd_csr_rs1             "O\t0,c,1"
-#define rv_fmt_rd_csr_zimm            "O\t0,c,7"
-#define rv_fmt_rs2_offset_rs1         "O\t2,i(1)"
-#define rv_fmt_frs2_offset_rs1        "O\t5,i(1)"
-#define rv_fmt_rs1_rs2_offset         "O\t1,2,o"
-#define rv_fmt_rs2_rs1_offset         "O\t2,1,o"
-#define rv_fmt_aqrl_rd_rs2_rs1        "OAR\t0,2,(1)"
-#define rv_fmt_aqrl_rd_rs1            "OAR\t0,(1)"
-#define rv_fmt_rd                     "O\t0"
-#define rv_fmt_rd_zimm                "O\t0,7"
-#define rv_fmt_rd_rs1                 "O\t0,1"
-#define rv_fmt_rd_rs2                 "O\t0,2"
-#define rv_fmt_rs1_offset             "O\t1,o"
-#define rv_fmt_rs2_offset             "O\t2,o"
-#define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
-#define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
-#define rv_fmt_ldst_vd_rs1_vm         "O\tD,(1)m"
-#define rv_fmt_ldst_vd_rs1_rs2_vm     "O\tD,(1),2m"
-#define rv_fmt_ldst_vd_rs1_vs2_vm     "O\tD,(1),Fm"
-#define rv_fmt_vd_vs2_vs1             "O\tD,F,E"
-#define rv_fmt_vd_vs2_vs1_vl          "O\tD,F,El"
-#define rv_fmt_vd_vs2_vs1_vm          "O\tD,F,Em"
-#define rv_fmt_vd_vs2_rs1_vl          "O\tD,F,1l"
-#define rv_fmt_vd_vs2_fs1_vl          "O\tD,F,4l"
-#define rv_fmt_vd_vs2_rs1_vm          "O\tD,F,1m"
-#define rv_fmt_vd_vs2_fs1_vm          "O\tD,F,4m"
-#define rv_fmt_vd_vs2_imm_vl          "O\tD,F,il"
-#define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
-#define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
-#define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
-#define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
-#define rv_fmt_vd_fs1_vs2_vm          "O\tD,4,Fm"
-#define rv_fmt_vd_vs1                 "O\tD,E"
-#define rv_fmt_vd_rs1                 "O\tD,1"
-#define rv_fmt_vd_fs1                 "O\tD,4"
-#define rv_fmt_vd_imm                 "O\tD,i"
-#define rv_fmt_vd_vs2                 "O\tD,F"
-#define rv_fmt_vd_vs2_vm              "O\tD,Fm"
-#define rv_fmt_rd_vs2_vm              "O\t0,Fm"
-#define rv_fmt_rd_vs2                 "O\t0,F"
-#define rv_fmt_fd_vs2                 "O\t3,F"
-#define rv_fmt_vd_vm                  "O\tDm"
-#define rv_fmt_vsetvli                "O\t0,1,v"
-#define rv_fmt_vsetivli               "O\t0,u,v"
-#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
-#define rv_fmt_push_rlist             "O\tx,-i"
-#define rv_fmt_pop_rlist              "O\tx,i"
-#define rv_fmt_zcmt_index             "O\ti"
-
 /* pseudo-instruction constraints */
 
 static const rvc_constraint rvcc_jal[] = { rvc_rd_eq_ra, rvc_end };
diff --git a/disas/riscv.h b/disas/riscv.h
new file mode 100644
index 0000000000..9288255915
--- /dev/null
+++ b/disas/riscv.h
@@ -0,0 +1,282 @@
+/*
+ * QEMU disassembler -- RISC-V specific header.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef DISAS_RISCV_H
+#define DISAS_RISCV_H
+
+#include "qemu/osdep.h"
+#include "target/riscv/cpu_cfg.h"
+
+/* types */
+
+typedef uint64_t rv_inst;
+typedef uint16_t rv_opcode;
+
+/* enums */
+
+typedef enum {
+    rv32,
+    rv64,
+    rv128
+} rv_isa;
+
+typedef enum {
+    rv_rm_rne = 0,
+    rv_rm_rtz = 1,
+    rv_rm_rdn = 2,
+    rv_rm_rup = 3,
+    rv_rm_rmm = 4,
+    rv_rm_dyn = 7,
+} rv_rm;
+
+typedef enum {
+    rv_fence_i = 8,
+    rv_fence_o = 4,
+    rv_fence_r = 2,
+    rv_fence_w = 1,
+} rv_fence;
+
+typedef enum {
+    rv_ireg_zero,
+    rv_ireg_ra,
+    rv_ireg_sp,
+    rv_ireg_gp,
+    rv_ireg_tp,
+    rv_ireg_t0,
+    rv_ireg_t1,
+    rv_ireg_t2,
+    rv_ireg_s0,
+    rv_ireg_s1,
+    rv_ireg_a0,
+    rv_ireg_a1,
+    rv_ireg_a2,
+    rv_ireg_a3,
+    rv_ireg_a4,
+    rv_ireg_a5,
+    rv_ireg_a6,
+    rv_ireg_a7,
+    rv_ireg_s2,
+    rv_ireg_s3,
+    rv_ireg_s4,
+    rv_ireg_s5,
+    rv_ireg_s6,
+    rv_ireg_s7,
+    rv_ireg_s8,
+    rv_ireg_s9,
+    rv_ireg_s10,
+    rv_ireg_s11,
+    rv_ireg_t3,
+    rv_ireg_t4,
+    rv_ireg_t5,
+    rv_ireg_t6,
+} rv_ireg;
+
+typedef enum {
+    rvc_end,
+    rvc_rd_eq_ra,
+    rvc_rd_eq_x0,
+    rvc_rs1_eq_x0,
+    rvc_rs2_eq_x0,
+    rvc_rs2_eq_rs1,
+    rvc_rs1_eq_ra,
+    rvc_imm_eq_zero,
+    rvc_imm_eq_n1,
+    rvc_imm_eq_p1,
+    rvc_csr_eq_0x001,
+    rvc_csr_eq_0x002,
+    rvc_csr_eq_0x003,
+    rvc_csr_eq_0xc00,
+    rvc_csr_eq_0xc01,
+    rvc_csr_eq_0xc02,
+    rvc_csr_eq_0xc80,
+    rvc_csr_eq_0xc81,
+    rvc_csr_eq_0xc82,
+} rvc_constraint;
+
+typedef enum {
+    rv_codec_illegal,
+    rv_codec_none,
+    rv_codec_u,
+    rv_codec_uj,
+    rv_codec_i,
+    rv_codec_i_sh5,
+    rv_codec_i_sh6,
+    rv_codec_i_sh7,
+    rv_codec_i_csr,
+    rv_codec_s,
+    rv_codec_sb,
+    rv_codec_r,
+    rv_codec_r_m,
+    rv_codec_r4_m,
+    rv_codec_r_a,
+    rv_codec_r_l,
+    rv_codec_r_f,
+    rv_codec_cb,
+    rv_codec_cb_imm,
+    rv_codec_cb_sh5,
+    rv_codec_cb_sh6,
+    rv_codec_ci,
+    rv_codec_ci_sh5,
+    rv_codec_ci_sh6,
+    rv_codec_ci_16sp,
+    rv_codec_ci_lwsp,
+    rv_codec_ci_ldsp,
+    rv_codec_ci_lqsp,
+    rv_codec_ci_li,
+    rv_codec_ci_lui,
+    rv_codec_ci_none,
+    rv_codec_ciw_4spn,
+    rv_codec_cj,
+    rv_codec_cj_jal,
+    rv_codec_cl_lw,
+    rv_codec_cl_ld,
+    rv_codec_cl_lq,
+    rv_codec_cr,
+    rv_codec_cr_mv,
+    rv_codec_cr_jalr,
+    rv_codec_cr_jr,
+    rv_codec_cs,
+    rv_codec_cs_sw,
+    rv_codec_cs_sd,
+    rv_codec_cs_sq,
+    rv_codec_css_swsp,
+    rv_codec_css_sdsp,
+    rv_codec_css_sqsp,
+    rv_codec_k_bs,
+    rv_codec_k_rnum,
+    rv_codec_v_r,
+    rv_codec_v_ldst,
+    rv_codec_v_i,
+    rv_codec_vsetvli,
+    rv_codec_vsetivli,
+    rv_codec_zcb_ext,
+    rv_codec_zcb_mul,
+    rv_codec_zcb_lb,
+    rv_codec_zcb_lh,
+    rv_codec_zcmp_cm_pushpop,
+    rv_codec_zcmp_cm_mv,
+    rv_codec_zcmt_jt,
+} rv_codec;
+
+/* structures */
+
+typedef struct {
+    RISCVCPUConfig *cfg;
+    uint64_t  pc;
+    uint64_t  inst;
+    int32_t   imm;
+    uint16_t  op;
+    uint8_t   codec;
+    uint8_t   rd;
+    uint8_t   rs1;
+    uint8_t   rs2;
+    uint8_t   rs3;
+    uint8_t   rm;
+    uint8_t   pred;
+    uint8_t   succ;
+    uint8_t   aq;
+    uint8_t   rl;
+    uint8_t   bs;
+    uint8_t   rnum;
+    uint8_t   vm;
+    uint32_t  vzimm;
+    uint8_t   rlist;
+} rv_decode;
+
+typedef struct {
+    const int op;
+    const rvc_constraint *constraints;
+} rv_comp_data;
+
+enum {
+    rvcd_imm_nz = 0x1
+};
+
+typedef struct {
+    const char * const name;
+    const rv_codec codec;
+    const char * const format;
+    const rv_comp_data *pseudo;
+    const short decomp_rv32;
+    const short decomp_rv64;
+    const short decomp_rv128;
+    const short decomp_data;
+} rv_opcode_data;
+
+/* instruction formats */
+
+#define rv_fmt_none                   "O\t"
+#define rv_fmt_rs1                    "O\t1"
+#define rv_fmt_offset                 "O\to"
+#define rv_fmt_pred_succ              "O\tp,s"
+#define rv_fmt_rs1_rs2                "O\t1,2"
+#define rv_fmt_rd_imm                 "O\t0,i"
+#define rv_fmt_rd_offset              "O\t0,o"
+#define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
+#define rv_fmt_frd_rs1                "O\t3,1"
+#define rv_fmt_frd_frs1               "O\t3,4"
+#define rv_fmt_rd_frs1                "O\t0,4"
+#define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
+#define rv_fmt_frd_frs1_frs2          "O\t3,4,5"
+#define rv_fmt_rm_frd_frs1            "O\tr,3,4"
+#define rv_fmt_rm_frd_rs1             "O\tr,3,1"
+#define rv_fmt_rm_rd_frs1             "O\tr,0,4"
+#define rv_fmt_rm_frd_frs1_frs2       "O\tr,3,4,5"
+#define rv_fmt_rm_frd_frs1_frs2_frs3  "O\tr,3,4,5,6"
+#define rv_fmt_rd_rs1_imm             "O\t0,1,i"
+#define rv_fmt_rd_rs1_offset          "O\t0,1,i"
+#define rv_fmt_rd_offset_rs1          "O\t0,i(1)"
+#define rv_fmt_frd_offset_rs1         "O\t3,i(1)"
+#define rv_fmt_rd_csr_rs1             "O\t0,c,1"
+#define rv_fmt_rd_csr_zimm            "O\t0,c,7"
+#define rv_fmt_rs2_offset_rs1         "O\t2,i(1)"
+#define rv_fmt_frs2_offset_rs1        "O\t5,i(1)"
+#define rv_fmt_rs1_rs2_offset         "O\t1,2,o"
+#define rv_fmt_rs2_rs1_offset         "O\t2,1,o"
+#define rv_fmt_aqrl_rd_rs2_rs1        "OAR\t0,2,(1)"
+#define rv_fmt_aqrl_rd_rs1            "OAR\t0,(1)"
+#define rv_fmt_rd                     "O\t0"
+#define rv_fmt_rd_zimm                "O\t0,7"
+#define rv_fmt_rd_rs1                 "O\t0,1"
+#define rv_fmt_rd_rs2                 "O\t0,2"
+#define rv_fmt_rs1_offset             "O\t1,o"
+#define rv_fmt_rs2_offset             "O\t2,o"
+#define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
+#define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
+#define rv_fmt_ldst_vd_rs1_vm         "O\tD,(1)m"
+#define rv_fmt_ldst_vd_rs1_rs2_vm     "O\tD,(1),2m"
+#define rv_fmt_ldst_vd_rs1_vs2_vm     "O\tD,(1),Fm"
+#define rv_fmt_vd_vs2_vs1             "O\tD,F,E"
+#define rv_fmt_vd_vs2_vs1_vl          "O\tD,F,El"
+#define rv_fmt_vd_vs2_vs1_vm          "O\tD,F,Em"
+#define rv_fmt_vd_vs2_rs1_vl          "O\tD,F,1l"
+#define rv_fmt_vd_vs2_fs1_vl          "O\tD,F,4l"
+#define rv_fmt_vd_vs2_rs1_vm          "O\tD,F,1m"
+#define rv_fmt_vd_vs2_fs1_vm          "O\tD,F,4m"
+#define rv_fmt_vd_vs2_imm_vl          "O\tD,F,il"
+#define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
+#define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
+#define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
+#define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
+#define rv_fmt_vd_fs1_vs2_vm          "O\tD,4,Fm"
+#define rv_fmt_vd_vs1                 "O\tD,E"
+#define rv_fmt_vd_rs1                 "O\tD,1"
+#define rv_fmt_vd_fs1                 "O\tD,4"
+#define rv_fmt_vd_imm                 "O\tD,i"
+#define rv_fmt_vd_vs2                 "O\tD,F"
+#define rv_fmt_vd_vs2_vm              "O\tD,Fm"
+#define rv_fmt_rd_vs2_vm              "O\t0,Fm"
+#define rv_fmt_rd_vs2                 "O\t0,F"
+#define rv_fmt_fd_vs2                 "O\t3,F"
+#define rv_fmt_vd_vm                  "O\tDm"
+#define rv_fmt_vsetvli                "O\t0,1,v"
+#define rv_fmt_vsetivli               "O\t0,u,v"
+#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
+#define rv_fmt_push_rlist             "O\tx,-i"
+#define rv_fmt_pop_rlist              "O\tx,i"
+#define rv_fmt_zcmt_index             "O\ti"
+
+#endif /* DISAS_RISCV_H */
-- 
2.40.1


