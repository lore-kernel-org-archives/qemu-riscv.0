Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmzDN-0005Cv-Vm
	for mharc-qemu-riscv@gnu.org; Thu, 13 Apr 2023 11:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pmzDM-0005CP-I0
 for qemu-riscv@nongnu.org; Thu, 13 Apr 2023 11:50:24 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pmzDG-0005rD-A4
 for qemu-riscv@nongnu.org; Thu, 13 Apr 2023 11:50:24 -0400
Received: by mail-ej1-x62c.google.com with SMTP id sg7so49962716ejc.9
 for <qemu-riscv@nongnu.org>; Thu, 13 Apr 2023 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1681401014; x=1683993014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BOzitySP30IAfHiTYm5ldy0uz8GAQmqS17h89dSz4X0=;
 b=bgwn0ddAP4erZE5sRSMgBpFmBBA5sHWDnRXd3Je+3B38DFzc4hWM6jeka/sEbbfQ0a
 mM2LAgstOXwEDiVkpyv8/tBd/G6N3DaftS20pImNOG9KohjN/5kfTzeM07KrEXbgyFUz
 Kss6+mwXbR6lU26oeB99I5WC22E5E24yle/D6NO5KzzvtRSV322q/i4fVeQliEU1sC/Z
 t7Ev5NgwuxK3pE/XIki0FHNbF9nXHRJ6NLDDS2v0O8+fH5jdn0TWyab4zrVIQRehhN1p
 G2zXq8uT7bnfyMu9sxGO7PcKH7Lis3wHIETIzm79Nrm83SBikuWPnwI3/KPYzSyHUCBT
 ogxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681401014; x=1683993014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BOzitySP30IAfHiTYm5ldy0uz8GAQmqS17h89dSz4X0=;
 b=g+dpG1AM4CVr4lJnCeK32JT952QOru7X7mmbPWScUEG/FUeE2n3jK/HCAhgLsFLooN
 PXn4NTu8LJoLb9ScuSPtJeMXFFkS9bkF2ky/tEjVKoU8CNEWg9KFWazSlbtal8TYLhaI
 +fTobWH/VkCenvfpScd+glt9tTF6r0GZP3XrUIwUmR9si3WxQ7GImSOjx85nzSil/Uon
 kmJwyyoAYVKOlxgxtwxw2N4mPiG6kcjZx1WMjBVjg0PtFSYgJd9rZvao1HJsHmt+CpEe
 0eWE7dZG2iRUGCp15PZyYGS41Z7PKjSm5DF7NMh6JeBS0TZxqOUhV5BiDXjecros+tnH
 XIdg==
X-Gm-Message-State: AAQBX9f81f1CifL5GRvIedoAE6cMdnGrHBe1ZgZCinceggehZpQ/P1hP
 phLUOTsA0HsZEWuZoQ/kSBOqkGuHZAT3/SjLt1A=
X-Google-Smtp-Source: AKy350YbgTr2AfjEBwvd+xvnOsMC6M/swHiHDTjYlGkPt1z9uwAXn7qEx1RyL9Xntd/Q35dGqBR7sg==
X-Received: by 2002:a17:907:7241:b0:94a:643e:9e26 with SMTP id
 ds1-20020a170907724100b0094a643e9e26mr2643744ejc.14.1681401014154; 
 Thu, 13 Apr 2023 08:50:14 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 oz19-20020a1709077d9300b0094ebd376fadsm516447ejc.144.2023.04.13.08.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 08:50:13 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jeff Law <jeffreyalaw@gmail.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, liweiwei@iscas.ac.cn
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH v3] riscv: Add support for the Zfa extension
Date: Thu, 13 Apr 2023 17:50:10 +0200
Message-Id: <20230413155010.191051-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 13 Apr 2023 15:50:24 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch introduces the RISC-V Zfa extension, which introduces
additional floating-point extensions:
* fli (load-immediate) with pre-defined immediates
* fminm/fmaxm (like fmin/fmax but with different NaN behaviour)
* fround/froundmx (round to integer)
* fcvtmod.w.d (Modular Convert-to-Integer)
* fmv* to access high bits of float register bigger than XLEN
* Quiet comparison instructions (fleq/fltq)

Zfa defines its instructions in combination with the following extensions:
* single-precision floating-point (F)
* double-precision floating-point (D)
* quad-precision floating-point (Q)
* half-precision floating-point (Zfh)

Since QEMU does not support the RISC-V quad-precision floating-point
ISA extension (Q), this patch does not include the instructions that
depend on this extension. All other instructions are included in this
patch.

The Zfa specification is not frozen at the moment (which is why this
patch is RFC) and can be found here:
  https://github.com/riscv/riscv-isa-manual/blob/master/src/zfa.tex

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v3:
* Add disassembler support
* Enable Zfa by default
* Remove forgotten comments in the decoder
* Fix fli translation code (use movi instead of ld)
* Tested against SPEC CPU2017 fprate
* Use floatN_[min|max] for f[min|max]m.* instructions

Changes in v2:
* Remove calls to mark_fs_dirty() in comparison trans functions
* Rewrite fround(nx) using float*_round_to_int()
* Move fli* to translation unit and fix NaN-boxing of NaN values
* Reimplement FCVTMOD.W.D
* Add use of second register in trans_fmvp_d_x()

 disas/riscv.c                             | 155 ++++++-
 target/riscv/cpu.c                        |   8 +
 target/riscv/cpu.h                        |   1 +
 target/riscv/fpu_helper.c                 | 222 +++++++++
 target/riscv/helper.h                     |  19 +
 target/riscv/insn32.decode                |  26 ++
 target/riscv/insn_trans/trans_rvzfa.c.inc | 529 ++++++++++++++++++++++
 target/riscv/translate.c                  |   1 +
 8 files changed, 959 insertions(+), 2 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzfa.c.inc

diff --git a/disas/riscv.c b/disas/riscv.c
index d6b0fbe5e8..defbcfa9c2 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -163,6 +163,7 @@ typedef enum {
     rv_codec_v_i,
     rv_codec_vsetvli,
     rv_codec_vsetivli,
+    rv_codec_fli,
 } rv_codec;
 
 typedef enum {
@@ -935,6 +936,39 @@ typedef enum {
     rv_op_vsetvli = 766,
     rv_op_vsetivli = 767,
     rv_op_vsetvl = 768,
+    rv_op_fli_s = 769,
+    rv_op_fli_d = 770,
+    rv_op_fli_q = 771,
+    rv_op_fli_h = 772,
+    rv_op_fminm_s = 773,
+    rv_op_fmaxm_s = 774,
+    rv_op_fminm_d = 775,
+    rv_op_fmaxm_d = 776,
+    rv_op_fminm_q = 777,
+    rv_op_fmaxm_q = 778,
+    rv_op_fminm_h = 779,
+    rv_op_fmaxm_h = 780,
+    rv_op_fround_s = 781,
+    rv_op_froundnx_s = 782,
+    rv_op_fround_d = 783,
+    rv_op_froundnx_d = 784,
+    rv_op_fround_q = 785,
+    rv_op_froundnx_q = 786,
+    rv_op_fround_h = 787,
+    rv_op_froundnx_h = 788,
+    rv_op_fcvtmod_w_d = 789,
+    rv_op_fmvh_x_d = 790,
+    rv_op_fmvp_d_x = 791,
+    rv_op_fmvh_x_q = 792,
+    rv_op_fmvp_q_x = 793,
+    rv_op_fleq_s = 794,
+    rv_op_fltq_s = 795,
+    rv_op_fleq_d = 796,
+    rv_op_fltq_d = 797,
+    rv_op_fleq_q = 798,
+    rv_op_fltq_q = 799,
+    rv_op_fleq_h = 800,
+    rv_op_fltq_h = 801,
 } rv_op;
 
 /* structures */
@@ -1003,6 +1037,24 @@ static const char rv_vreg_name_sym[32][4] = {
     "v24", "v25", "v26", "v27", "v28", "v29", "v30", "v31"
 };
 
+/* The FLI.[HSDQ] numeric constants (0.0 for symbolic constants).
+ * The constants use the hex floating-point literal representation
+ * that is printed when using the printf %a format specifier,
+ * which matches the output that is generated by the disassembler.
+ */
+static const char rv_fli_name_const[32][9] =
+{
+    "0x1p+0", "min", "0x1p-16", "0x1p-15",
+    "0x1p-8", "0x1p-7", "0x1p-4", "0x1p-3",
+    "0x1p-2", "0x1.4p-2", "0x1.8p-2", "0x1.cp-2",
+    "0x1p-1", "0x1.4p-1", "0x1.8p-1", "0x1.cp-1",
+    "0x1p+0", "0x1.4p+0", "0x1.8p+0", "0x1.cp+0",
+    "0x1p+1", "0x1.4p+1", "0x1.8p+1", "0x1p+2",
+    "0x1p+3", "0x1p+4", "0x1p+7", "0x1p+8",
+    "0x1p+15", "0x1p+16", "inf", "nan"
+};
+
+
 /* instruction formats */
 
 #define rv_fmt_none                   "O\t"
@@ -1014,6 +1066,7 @@ static const char rv_vreg_name_sym[32][4] = {
 #define rv_fmt_rd_offset              "O\t0,o"
 #define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
 #define rv_fmt_frd_rs1                "O\t3,1"
+#define rv_fmt_frd_rs1_rs2            "O\t3,1,2"
 #define rv_fmt_frd_frs1               "O\t3,4"
 #define rv_fmt_rd_frs1                "O\t0,4"
 #define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
@@ -1071,6 +1124,7 @@ static const char rv_vreg_name_sym[32][4] = {
 #define rv_fmt_vd_vm                  "O\tDm"
 #define rv_fmt_vsetvli                "O\t0,1,v"
 #define rv_fmt_vsetivli               "O\t0,u,v"
+#define rv_fmt_fli                    "O\t3,h"
 
 /* pseudo-instruction constraints */
 
@@ -2066,7 +2120,40 @@ const rv_opcode_data opcode_data[] = {
     { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
     { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
     { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
-    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
+    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
+    { "fli.s", rv_codec_fli, rv_fmt_fli, NULL, 0, 0, 0 },
+    { "fli.d", rv_codec_fli, rv_fmt_fli, NULL, 0, 0, 0 },
+    { "fli.q", rv_codec_fli, rv_fmt_fli, NULL, 0, 0, 0 },
+    { "fli.h", rv_codec_fli, rv_fmt_fli, NULL, 0, 0, 0 },
+    { "fminm.s", rv_codec_r, rv_fmt_frd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fmaxm.s", rv_codec_r, rv_fmt_frd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fminm.d", rv_codec_r, rv_fmt_frd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fmaxm.d", rv_codec_r, rv_fmt_frd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fminm.q", rv_codec_r, rv_fmt_frd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fmaxm.q", rv_codec_r, rv_fmt_frd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fminm.h", rv_codec_r, rv_fmt_frd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fmaxm.h", rv_codec_r, rv_fmt_frd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fround.s", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "froundnx.s", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "fround.d", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "froundnx.d", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "fround.q", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "froundnx.q", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "fround.h", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "froundnx.h", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "fcvtmod.w.d", rv_codec_r_m, rv_fmt_rm_rd_frs1, NULL, 0, 0, 0 },
+    { "fmvh.x.d", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
+    { "fmvp.d.x", rv_codec_r, rv_fmt_frd_rs1_rs2, NULL, 0, 0, 0 },
+    { "fmvh.x.q", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
+    { "fmvp.q.x", rv_codec_r, rv_fmt_frd_rs1_rs2, NULL, 0, 0, 0 },
+    { "fleq.s", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fltq.s", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fleq.d", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fltq.d", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fleq.q", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fltq.q", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fleq.h", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
+    { "fltq.h", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -2923,36 +3010,60 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 switch (((inst >> 12) & 0b111)) {
                 case 0: op = rv_op_fmin_s; break;
                 case 1: op = rv_op_fmax_s; break;
+                case 2: op = rv_op_fminm_s; break;
+                case 3: op = rv_op_fmaxm_s; break;
                 }
                 break;
             case 21:
                 switch (((inst >> 12) & 0b111)) {
                 case 0: op = rv_op_fmin_d; break;
                 case 1: op = rv_op_fmax_d; break;
+                case 2: op = rv_op_fminm_d; break;
+                case 3: op = rv_op_fmaxm_d; break;
+                }
+                break;
+            case 22:
+                switch (((inst >> 12) & 0b111)) {
+                case 2: op = rv_op_fminm_h; break;
+                case 3: op = rv_op_fmaxm_h; break;
                 }
                 break;
             case 23:
                 switch (((inst >> 12) & 0b111)) {
                 case 0: op = rv_op_fmin_q; break;
                 case 1: op = rv_op_fmax_q; break;
+                case 2: op = rv_op_fminm_q; break;
+                case 3: op = rv_op_fmaxm_q; break;
                 }
                 break;
             case 32:
                 switch (((inst >> 20) & 0b11111)) {
                 case 1: op = rv_op_fcvt_s_d; break;
                 case 3: op = rv_op_fcvt_s_q; break;
+                case 4: op = rv_op_fround_s; break;
+                case 5: op = rv_op_froundnx_s; break;
                 }
                 break;
             case 33:
                 switch (((inst >> 20) & 0b11111)) {
                 case 0: op = rv_op_fcvt_d_s; break;
                 case 3: op = rv_op_fcvt_d_q; break;
+                case 4: op = rv_op_fround_d; break;
+                case 5: op = rv_op_froundnx_d; break;
+                }
+                break;
+            case 34:
+                switch (((inst >> 20) & 0b11111)) {
+                case 4: op = rv_op_fround_h; break;
+                case 5: op = rv_op_froundnx_h; break;
                 }
                 break;
             case 35:
                 switch (((inst >> 20) & 0b11111)) {
                 case 0: op = rv_op_fcvt_q_s; break;
                 case 1: op = rv_op_fcvt_q_d; break;
+                case 4: op = rv_op_fround_q; break;
+                case 5: op = rv_op_froundnx_q; break;
                 }
                 break;
             case 44:
@@ -2975,6 +3086,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 0: op = rv_op_fle_s; break;
                 case 1: op = rv_op_flt_s; break;
                 case 2: op = rv_op_feq_s; break;
+                case 4: op = rv_op_fleq_s; break;
+                case 5: op = rv_op_fltq_s; break;
                 }
                 break;
             case 81:
@@ -2982,13 +3095,33 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 0: op = rv_op_fle_d; break;
                 case 1: op = rv_op_flt_d; break;
                 case 2: op = rv_op_feq_d; break;
+                case 4: op = rv_op_fleq_d; break;
+                case 5: op = rv_op_fltq_d; break;
+                }
+                break;
+            case 82:
+                switch (((inst >> 12) & 0b111)) {
+                case 4: op = rv_op_fleq_h; break;
+                case 5: op = rv_op_fltq_h; break;
                 }
                 break;
-            case 83:
+             case 83:
                 switch (((inst >> 12) & 0b111)) {
                 case 0: op = rv_op_fle_q; break;
                 case 1: op = rv_op_flt_q; break;
                 case 2: op = rv_op_feq_q; break;
+                case 4: op = rv_op_fleq_q; break;
+                case 5: op = rv_op_fltq_q; break;
+                }
+                break;
+            case 89:
+		switch (((inst >> 12) & 0b111)) {
+                case 0: op = rv_op_fmvp_d_x; break;
+                }
+                break;
+            case 91:
+		switch (((inst >> 12) & 0b111)) {
+                case 0: op = rv_op_fmvp_q_x; break;
                 }
                 break;
             case 96:
@@ -3005,6 +3138,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 1: op = rv_op_fcvt_wu_d; break;
                 case 2: op = rv_op_fcvt_l_d; break;
                 case 3: op = rv_op_fcvt_lu_d; break;
+                case 8: op = rv_op_fcvtmod_w_d; break;
                 }
                 break;
             case 99:
@@ -3049,27 +3183,37 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_x_d; break;
                 case 1: op = rv_op_fclass_d; break;
+                case 8: op = rv_op_fmvh_x_d; break;
                 }
                 break;
             case 115:
                 switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_x_q; break;
                 case 1: op = rv_op_fclass_q; break;
+                case 8: op = rv_op_fmvh_x_q; break;
                 }
                 break;
             case 120:
                 switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_s_x; break;
+                case 8: op = rv_op_fli_s; break;
                 }
                 break;
             case 121:
                 switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_d_x; break;
+                case 8: op = rv_op_fli_d; break;
+                }
+                break;
+            case 122:
+                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
+                case 8: op = rv_op_fli_h; break;
                 }
                 break;
             case 123:
                 switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_q_x; break;
+                case 8: op = rv_op_fli_q; break;
                 }
                 break;
             }
@@ -4200,6 +4344,10 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
         dec->imm = operand_vimm(inst);
         dec->vzimm = operand_vzimm10(inst);
         break;
+    case rv_codec_fli:
+        dec->rd = operand_rd(inst);
+        dec->imm = operand_rs1(inst);
+        break;
     };
 }
 
@@ -4542,6 +4690,9 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
             append(buf, vma, buflen);
             break;
         }
+        case 'h':
+            append(buf, rv_fli_name_const[dec->imm], buflen);
+            break;
         default:
             break;
         }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..cda150b558 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -83,6 +83,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
+    ISA_EXT_DATA_ENTRY(zfa, true, PRIV_VERSION_1_12_0, ext_zfa),
     ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
@@ -404,6 +405,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     cpu->cfg.ext_u = true;
     cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zfa = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
@@ -865,6 +867,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zfa && !cpu->cfg.ext_f) {
+        error_setg(errp, "Zfa extension requires F extension");
+        return;
+    }
+
     if (cpu->cfg.ext_zfh) {
         cpu->cfg.ext_zfhmin = true;
     }
@@ -1381,6 +1388,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
     DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
+    DEFINE_PROP_BOOL("Zfa", RISCVCPU, cfg.ext_zfa, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..deae410fc2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -462,6 +462,7 @@ struct RISCVCPUConfig {
     bool ext_svpbmt;
     bool ext_zdinx;
     bool ext_zawrs;
+    bool ext_zfa;
     bool ext_zfh;
     bool ext_zfhmin;
     bool ext_zfinx;
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 449d236df6..a79f03b8b9 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -252,6 +252,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
                     float32_minimum_number(frs1, frs2, &env->fp_status));
 }
 
+uint64_t helper_fminm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    float32 ret = float32_min(frs1, frs2, &env->fp_status);
+    return nanbox_s(env, ret);
+}
+
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(env, rs1);
@@ -261,6 +269,14 @@ uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
                     float32_maximum_number(frs1, frs2, &env->fp_status));
 }
 
+uint64_t helper_fmaxm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    float32 ret = float32_max(frs1, frs2, &env->fp_status);
+    return nanbox_s(env, ret);
+}
+
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 = check_nanbox_s(env, rs1);
@@ -274,6 +290,13 @@ target_ulong helper_fle_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float32_le(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fleq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    return float32_le_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(env, rs1);
@@ -281,6 +304,13 @@ target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float32_lt(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fltq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    return float32_lt_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(env, rs1);
@@ -338,6 +368,30 @@ target_ulong helper_fclass_s(CPURISCVState *env, uint64_t rs1)
     return fclass_s(frs1);
 }
 
+uint64_t helper_fround_s(CPURISCVState *env, uint64_t rs1)
+{
+    float_status *fs = &env->fp_status;
+    uint16_t nx_old = get_float_exception_flags(fs) & float_flag_inexact;
+    float32 frs1 = check_nanbox_s(env, rs1);
+
+    frs1 = float32_round_to_int(frs1, fs);
+
+    /* Restore the original NX flag. */
+    uint16_t flags = get_float_exception_flags(fs);
+    flags &= ~float_flag_inexact;
+    flags |= nx_old;
+    set_float_exception_flags(flags, fs);
+
+    return nanbox_s(env, frs1);
+}
+
+uint64_t helper_froundnx_s(CPURISCVState *env, uint64_t rs1)
+{
+    float32 frs1 = check_nanbox_s(env, rs1);
+    frs1 = float32_round_to_int(frs1, &env->fp_status);
+    return nanbox_s(env, frs1);
+}
+
 uint64_t helper_fadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
     return float64_add(frs1, frs2, &env->fp_status);
@@ -365,6 +419,11 @@ uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
             float64_minimum_number(frs1, frs2, &env->fp_status);
 }
 
+uint64_t helper_fminm_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+{
+    return float64_min(frs1, frs2, &env->fp_status);
+}
+
 uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
     return env->priv_ver < PRIV_VERSION_1_11_0 ?
@@ -372,6 +431,11 @@ uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
             float64_maximum_number(frs1, frs2, &env->fp_status);
 }
 
+uint64_t helper_fmaxm_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+{
+    return float64_max(frs1, frs2, &env->fp_status);
+}
+
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
 {
     return nanbox_s(env, float64_to_float32(rs1, &env->fp_status));
@@ -393,11 +457,21 @@ target_ulong helper_fle_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
     return float64_le(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fleq_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+{
+    return float64_le_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_flt_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
     return float64_lt(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fltq_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+{
+    return float64_lt_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_feq_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
     return float64_eq_quiet(frs1, frs2, &env->fp_status);
@@ -408,6 +482,79 @@ target_ulong helper_fcvt_w_d(CPURISCVState *env, uint64_t frs1)
     return float64_to_int32(frs1, &env->fp_status);
 }
 
+/*
+ * Implement float64 to int32_t conversion without saturation;
+ * the result is supplied modulo 2^32.
+ * Rounding mode is RTZ.
+ * Flag behaviour identical to fcvt.w.d (see F specification).
+ *
+ * Similar conversion of this function can be found in
+ * target/arm/vfp_helper.c (fjcvtzs): f64->i32 with other fflag behaviour, and
+ * target/alpha/fpu_helper.c (do_cvttq): f64->i64 with support for several
+ * rounding modes and different fflag behaviour.
+ */
+uint64_t helper_fcvtmod_w_d(CPURISCVState *env, uint64_t value)
+{
+    float_status *status = &env->fp_status;
+    uint32_t sign = extract64(value, 63, 1);
+    uint32_t exp = extract64(value, 52, 11);
+    uint64_t frac = extract64(value, 0, 52);
+
+    /* Handle the special cases first. */
+    if (exp == 0) {
+        if (unlikely(frac != 0)) {
+            /* Subnormal numbers. */
+            float_raise(float_flag_inexact, status);
+            return 0;
+        } else {
+            /* +0 or -0 */
+            return 0;
+	}
+    } else if (exp == 0x7ff) {
+        /* NaN (frac != 0) or INF (frac == 0). */
+        float_raise(float_flag_invalid, status);
+	return 0;
+    }
+
+    /* Normal value. */
+    int true_exp = exp - 1023;
+    int shift = true_exp - 52;
+    uint64_t true_frac = frac | 1ull << 52;
+    uint64_t ret;
+
+    /* Shift the fraction into place and set NX flag. */
+    if (shift >= 64 || shift <= -64) {
+            /* The fraction is shifted out entirely. */
+            ret = 0;
+            float_raise(float_flag_inexact, status);
+    } else if (shift >= 0) {
+        ret = true_frac << shift;
+        /* Raise NX if bit 52 got shifted out. */
+        if (shift >= 12)
+            float_raise(float_flag_inexact, status);
+    } else { /* shift < 0 */
+        ret = true_frac >> -shift;
+        /* Raise NX if bits got shifted out. */
+        if ((ret << -shift) != true_frac)
+            float_raise(float_flag_inexact, status);
+    }
+
+    /* Honor the sign bit. */
+    if (sign) {
+        ret = -ret;
+    }
+
+    /* Truncate to 32-bits. */
+    int32_t ret32 = (int32_t)ret;
+
+    /* If the truncation drops bits then raise NV. */
+    if ((uint64_t)ret32 != ret)
+        float_raise(float_flag_invalid, status);
+
+    /* Sign-extend to int64 and return. */
+    return ret32;
+}
+
 target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
 {
     return (int32_t)float64_to_uint32(frs1, &env->fp_status);
@@ -448,6 +595,27 @@ target_ulong helper_fclass_d(uint64_t frs1)
     return fclass_d(frs1);
 }
 
+uint64_t helper_fround_d(CPURISCVState *env, uint64_t frs1)
+{
+    float_status *fs = &env->fp_status;
+    uint16_t nx_old = get_float_exception_flags(fs) & float_flag_inexact;
+
+    frs1 = float64_round_to_int(frs1, fs);
+
+    /* Restore the original NX flag. */
+    uint16_t flags = get_float_exception_flags(fs);
+    flags &= ~float_flag_inexact;
+    flags |= nx_old;
+    set_float_exception_flags(flags, fs);
+
+    return frs1;
+}
+
+uint64_t helper_froundnx_d(CPURISCVState *env, uint64_t frs1)
+{
+    return float64_round_to_int(frs1, &env->fp_status);
+}
+
 uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float16 frs1 = check_nanbox_h(env, rs1);
@@ -485,6 +653,14 @@ uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
                     float16_minimum_number(frs1, frs2, &env->fp_status));
 }
 
+uint64_t helper_fminm_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    float16 ret = float16_min(frs1, frs2, &env->fp_status);
+    return nanbox_h(env, ret);
+}
+
 uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float16 frs1 = check_nanbox_h(env, rs1);
@@ -494,6 +670,14 @@ uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
                     float16_maximum_number(frs1, frs2, &env->fp_status));
 }
 
+uint64_t helper_fmaxm_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    float16 ret = float16_max(frs1, frs2, &env->fp_status);
+    return nanbox_h(env, ret);
+}
+
 uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(env, rs1);
@@ -507,6 +691,13 @@ target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float16_le(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fleq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    return float16_le_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float16 frs1 = check_nanbox_h(env, rs1);
@@ -514,6 +705,13 @@ target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float16_lt(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fltq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    return float16_lt_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float16 frs1 = check_nanbox_h(env, rs1);
@@ -527,6 +725,30 @@ target_ulong helper_fclass_h(CPURISCVState *env, uint64_t rs1)
     return fclass_h(frs1);
 }
 
+uint64_t helper_fround_h(CPURISCVState *env, uint64_t rs1)
+{
+    float_status *fs = &env->fp_status;
+    uint16_t nx_old = get_float_exception_flags(fs) & float_flag_inexact;
+    float16 frs1 = check_nanbox_h(env, rs1);
+
+    frs1 = float16_round_to_int(frs1, fs);
+
+    /* Restore the original NX flag. */
+    uint16_t flags = get_float_exception_flags(fs);
+    flags &= ~float_flag_inexact;
+    flags |= nx_old;
+    set_float_exception_flags(flags, fs);
+
+    return nanbox_h(env, frs1);
+}
+
+uint64_t helper_froundnx_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_s(env, rs1);
+    frs1 = float16_round_to_int(frs1, &env->fp_status);
+    return nanbox_h(env, frs1);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(env, rs1);
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 37b54e0991..4acb7cf124 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -25,10 +25,14 @@ DEF_HELPER_FLAGS_3(fsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmul_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fdiv_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmin_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fminm_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmax_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmaxm_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(fsqrt_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_3(fle_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(fleq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(flt_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(fltq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_w_s, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_wu_s, TCG_CALL_NO_RWG, tl, env, i64)
@@ -39,6 +43,8 @@ DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, tl, env, i64)
+DEF_HELPER_FLAGS_2(fround_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
+DEF_HELPER_FLAGS_2(froundnx_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 /* Floating Point - Double Precision */
 DEF_HELPER_FLAGS_3(fadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
@@ -46,14 +52,19 @@ DEF_HELPER_FLAGS_3(fsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmul_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fdiv_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmin_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fminm_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmax_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmaxm_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_d, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_d_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fsqrt_d, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_3(fle_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(fleq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(flt_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(fltq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_w_d, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvtmod_w_d, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_wu_d, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, tl, env, i64)
@@ -62,6 +73,8 @@ DEF_HELPER_FLAGS_2(fcvt_d_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
+DEF_HELPER_FLAGS_2(fround_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
+DEF_HELPER_FLAGS_2(froundnx_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
@@ -78,10 +91,14 @@ DEF_HELPER_FLAGS_3(fsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmul_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fminm_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmaxm_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_3(fle_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(fleq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(flt_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(fltq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
@@ -96,6 +113,8 @@ DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
+DEF_HELPER_FLAGS_2(fround_h, TCG_CALL_NO_RWG_SE, i64, env, i64)
+DEF_HELPER_FLAGS_2(froundnx_h, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 /* Cache-block operations */
 DEF_HELPER_2(cbo_clean_flush, void, env, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 73d5d1b045..facf730c2a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -821,6 +821,32 @@ binvi      01101. ........... 001 ..... 0010011 @sh
 bset       0010100 .......... 001 ..... 0110011 @r
 bseti      00101. ........... 001 ..... 0010011 @sh
 
+# *** Zfa Standard Extension ***
+fli_s       1111000 00001 ..... 000 ..... 1010011 @r2
+fli_d       1111001 00001 ..... 000 ..... 1010011 @r2
+fli_h       1111010 00001 ..... 000 ..... 1010011 @r2
+fminm_s     0010100 ..... ..... 010 ..... 1010011 @r
+fmaxm_s     0010100 ..... ..... 011 ..... 1010011 @r
+fminm_d     0010101 ..... ..... 010 ..... 1010011 @r
+fmaxm_d     0010101 ..... ..... 011 ..... 1010011 @r
+fminm_h     0010110 ..... ..... 010 ..... 1010011 @r
+fmaxm_h     0010110 ..... ..... 011 ..... 1010011 @r
+fround_s    0100000 00100 ..... ... ..... 1010011 @r2_rm
+froundnx_s  0100000 00101 ..... ... ..... 1010011 @r2_rm
+fround_d    0100001 00100 ..... ... ..... 1010011 @r2_rm
+froundnx_d  0100001 00101 ..... ... ..... 1010011 @r2_rm
+fround_h    0100010 00100 ..... ... ..... 1010011 @r2_rm
+froundnx_h  0100010 00101 ..... ... ..... 1010011 @r2_rm
+fcvtmod_w_d 1100001 01000 ..... 001 ..... 1010011 @r2
+fmvh_x_d    1110001 00001 ..... 000 ..... 1010011 @r2
+fmvp_d_x    1011001 ..... ..... 000 ..... 1010011 @r
+fleq_s      1010000 ..... ..... 100 ..... 1010011 @r
+fltq_s      1010000 ..... ..... 101 ..... 1010011 @r
+fleq_d      1010001 ..... ..... 100 ..... 1010011 @r
+fltq_d      1010001 ..... ..... 101 ..... 1010011 @r
+fleq_h      1010010 ..... ..... 100 ..... 1010011 @r
+fltq_h      1010010 ..... ..... 101 ..... 1010011 @r
+
 # *** RV32 Zfh Extension ***
 flh        ............   ..... 001 ..... 0000111 @i
 fsh        .......  ..... ..... 001 ..... 0100111 @s
diff --git a/target/riscv/insn_trans/trans_rvzfa.c.inc b/target/riscv/insn_trans/trans_rvzfa.c.inc
new file mode 100644
index 0000000000..6028bfe803
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzfa.c.inc
@@ -0,0 +1,529 @@
+/*
+ * RISC-V translation routines for the Zfa Standard Extension.
+ *
+ * Copyright (c) 2023 Christoph Müllner, christoph.muellner@vrull.eu
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_ZFA(ctx) do {     \
+    if (!ctx->cfg_ptr->ext_zfa) { \
+        return false;             \
+    }                             \
+} while (0)
+
+#define REQUIRE_ZFH(ctx) do {     \
+    if (!ctx->cfg_ptr->ext_zfh) { \
+        return false;             \
+    }                             \
+} while (0)
+
+static bool trans_fli_s(DisasContext *ctx, arg_fli_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVF);
+
+    /* Values below are NaN-boxed to avoid a gen_nanbox_s(). */
+    static const uint64_t fli_s_table[] = {
+        0xffffffffbf800000,  /* -1.0 */
+        0xffffffff00800000,  /* minimum positive normal */
+        0xffffffff37800000,  /* 1.0 * 2^-16 */
+        0xffffffff38000000,  /* 1.0 * 2^-15 */
+        0xffffffff3b800000,  /* 1.0 * 2^-8  */
+        0xffffffff3c000000,  /* 1.0 * 2^-7  */
+        0xffffffff3d800000,  /* 1.0 * 2^-4  */
+        0xffffffff3e000000,  /* 1.0 * 2^-3  */
+        0xffffffff3e800000,  /* 0.25 */
+        0xffffffff3ea00000,  /* 0.3125 */
+        0xffffffff3ec00000,  /* 0.375 */
+        0xffffffff3ee00000,  /* 0.4375 */
+        0xffffffff3f000000,  /* 0.5 */
+        0xffffffff3f200000,  /* 0.625 */
+        0xffffffff3f400000,  /* 0.75 */
+        0xffffffff3f600000,  /* 0.875 */
+        0xffffffff3f800000,  /* 1.0 */
+        0xffffffff3fa00000,  /* 1.25 */
+        0xffffffff3fc00000,  /* 1.5 */
+        0xffffffff3fe00000,  /* 1.75 */
+        0xffffffff40000000,  /* 2.0 */
+        0xffffffff40200000,  /* 2.5 */
+        0xffffffff40400000,  /* 3 */
+        0xffffffff40800000,  /* 4 */
+        0xffffffff41000000,  /* 8 */
+        0xffffffff41800000,  /* 16 */
+        0xffffffff43000000,  /* 2^7 */
+        0xffffffff43800000,  /* 2^8 */
+        0xffffffff47000000,  /* 2^15 */
+        0xffffffff47800000,  /* 2^16 */
+        0xffffffff7f800000,  /* +inf */
+        0xffffffff7fc00000,  /* Canonical NaN */
+    };
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    tcg_gen_movi_i64(dest, fli_s_table[a->rs1]);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fli_d(DisasContext *ctx, arg_fli_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    static const uint64_t fli_d_table[] = {
+        0xbff0000000000000,  /* -1.0 */
+        0x0010000000000000,  /* minimum positive normal */
+        0x3ef0000000000000,  /* 1.0 * 2^-16 */
+        0x3f00000000000000,  /* 1.0 * 2^-15 */
+        0x3f70000000000000,  /* 1.0 * 2^-8  */
+        0x3f80000000000000,  /* 1.0 * 2^-7  */
+        0x3fb0000000000000,  /* 1.0 * 2^-4  */
+        0x3fc0000000000000,  /* 1.0 * 2^-3  */
+        0x3fd0000000000000,  /* 0.25 */
+        0x3fd4000000000000,  /* 0.3125 */
+        0x3fd8000000000000,  /* 0.375 */
+        0x3fdc000000000000,  /* 0.4375 */
+        0x3fe0000000000000,  /* 0.5 */
+        0x3fe4000000000000,  /* 0.625 */
+        0x3fe8000000000000,  /* 0.75 */
+        0x3fec000000000000,  /* 0.875 */
+        0x3ff0000000000000,  /* 1.0 */
+        0x3ff4000000000000,  /* 1.25 */
+        0x3ff8000000000000,  /* 1.5 */
+        0x3ffc000000000000,  /* 1.75 */
+        0x4000000000000000,  /* 2.0 */
+        0x4004000000000000,  /* 2.5 */
+        0x4008000000000000,  /* 3 */
+        0x4010000000000000,  /* 4 */
+        0x4020000000000000,  /* 8 */
+        0x4030000000000000,  /* 16 */
+        0x4060000000000000,  /* 2^7 */
+        0x4070000000000000,  /* 2^8 */
+        0x40e0000000000000,  /* 2^15 */
+        0x40f0000000000000,  /* 2^16 */
+        0x7ff0000000000000,  /* +inf */
+        0x7ff8000000000000,  /* Canonical NaN */
+    };
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    tcg_gen_movi_i64(dest, fli_d_table[a->rs1]);
+    gen_set_fpr_d(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fli_h(DisasContext *ctx, arg_fli_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_ZFH(ctx);
+
+    /* Values below are NaN-boxed to avoid a gen_nanbox_h(). */
+    const uint64_t fli_h_table[] = {
+        0xffffffffffffbc00,  /* -1.0 */
+        0xffffffffffff0400,  /* minimum positive normal */
+        0xffffffffffff0100,  /* 1.0 * 2^-16 */
+        0xffffffffffff0200,  /* 1.0 * 2^-15 */
+        0xffffffffffff1c00,  /* 1.0 * 2^-8  */
+        0xffffffffffff2000,  /* 1.0 * 2^-7  */
+        0xffffffffffff2c00,  /* 1.0 * 2^-4  */
+        0xffffffffffff3000,  /* 1.0 * 2^-3  */
+        0xffffffffffff3400,  /* 0.25 */
+        0xffffffffffff3500,  /* 0.3125 */
+        0xffffffffffff3600,  /* 0.375 */
+        0xffffffffffff3700,  /* 0.4375 */
+        0xffffffffffff3800,  /* 0.5 */
+        0xffffffffffff3900,  /* 0.625 */
+        0xffffffffffff3a00,  /* 0.75 */
+        0xffffffffffff3b00,  /* 0.875 */
+        0xffffffffffff3c00,  /* 1.0 */
+        0xffffffffffff3d00,  /* 1.25 */
+        0xffffffffffff3e00,  /* 1.5 */
+        0xffffffffffff3f00,  /* 1.75 */
+        0xffffffffffff4000,  /* 2.0 */
+        0xffffffffffff4100,  /* 2.5 */
+        0xffffffffffff4200,  /* 3 */
+        0xffffffffffff4400,  /* 4 */
+        0xffffffffffff4800,  /* 8 */
+        0xffffffffffff4c00,  /* 16 */
+        0xffffffffffff5800,  /* 2^7 */
+        0xffffffffffff5c00,  /* 2^8 */
+        0xffffffffffff7800,  /* 2^15 */
+        0xffffffffffff7c00,  /* 2^16 */
+        0xffffffffffff7c00,  /* +inf */
+        0xffffffffffff7e00,  /* Canonical NaN */
+    };
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    tcg_gen_movi_i64(dest, fli_h_table[a->rs1]);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fminm_s(DisasContext *ctx, arg_fminm_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fminm_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmaxm_s(DisasContext *ctx, arg_fmaxm_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fmaxm_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fminm_d(DisasContext *ctx, arg_fminm_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+
+    gen_helper_fminm_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmaxm_d(DisasContext *ctx, arg_fmaxm_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+
+    gen_helper_fmaxm_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fminm_h(DisasContext *ctx, arg_fminm_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fminm_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmaxm_h(DisasContext *ctx, arg_fmaxm_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fmaxm_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fround_s(DisasContext *ctx, arg_fround_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fround_s(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_froundnx_s(DisasContext *ctx, arg_froundnx_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_froundnx_s(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fround_d(DisasContext *ctx, arg_fround_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fround_d(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_froundnx_d(DisasContext *ctx, arg_froundnx_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_froundnx_d(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fround_h(DisasContext *ctx, arg_fround_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fround_h(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_froundnx_h(DisasContext *ctx, arg_froundnx_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_froundnx_h(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+bool trans_fcvtmod_w_d(DisasContext *ctx, arg_fcvtmod_w_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv dst = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 t1 = tcg_temp_new_i64();
+
+    /* Rounding mode is RTZ. */
+    gen_set_rm(ctx, RISCV_FRM_RTZ);
+    gen_helper_fcvtmod_w_d(t1, cpu_env, src1);
+    tcg_gen_trunc_i64_tl(dst, t1);
+    gen_set_gpr(ctx, a->rd, dst);
+
+    return true;
+}
+
+bool trans_fmvh_x_d(DisasContext *ctx, arg_fmvh_x_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_32BIT(ctx);
+
+    TCGv dst = dest_gpr(ctx, a->rd);
+    TCGv_i64 t1 = tcg_temp_new_i64();
+
+    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
+    tcg_gen_trunc_i64_tl(dst, t1);
+    gen_set_gpr(ctx, a->rd, dst);
+    return true;
+}
+
+bool trans_fmvp_d_x(DisasContext *ctx, arg_fmvp_d_x *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_32BIT(ctx);
+
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_ZERO);
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_ext_tl_i64(t1, src1);
+    tcg_gen_ext_tl_i64(t2, src2);
+    tcg_gen_shli_i64(t2, t2, 32);
+    tcg_gen_or_i64(t2, t2, t1);
+    tcg_gen_mov_i64(cpu_fpr[a->rd], t2);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+bool trans_fleq_s(DisasContext *ctx, arg_fleq_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fleq_s(dest, cpu_env, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+bool trans_fltq_s(DisasContext *ctx, arg_fltq_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fltq_s(dest, cpu_env, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+bool trans_fleq_d(DisasContext *ctx, arg_fleq_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fltq_s(dest, cpu_env, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+bool trans_fltq_d(DisasContext *ctx, arg_fltq_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fltq_s(dest, cpu_env, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+bool trans_fleq_h(DisasContext *ctx, arg_fleq_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fleq_h(dest, cpu_env, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+bool trans_fltq_h(DisasContext *ctx, arg_fltq_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFA(ctx);
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fltq_h(dest, cpu_env, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..0e61e31d9f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1081,6 +1081,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvzicond.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzicbo.c.inc"
+#include "insn_trans/trans_rvzfa.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
-- 
2.39.2


