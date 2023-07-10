Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89158EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 07:13:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIl4q-0008Gm-Pl; Mon, 10 Jul 2023 03:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qIl4p-0008G7-By
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 03:12:55 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qIl4k-0007F5-0e
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 03:12:55 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9922d6f003cso555836666b.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Jul 2023 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1688973168; x=1691565168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nYLks6qwB9rmPC4eKa54oNllx8i0BKWVIZeeWVe0VY8=;
 b=GZblo+IaEDy5v6dv/cGrV0L5SvXej1amaZgilsM09/C7lDhtEexwCM7o12Uyb1y2mE
 HJFbcHVgLT2QA/AfU1o7kO6Bo8I0eu59nzqMd9paXMRTYz1/BAVzN2Gi8lM+5+MwyFFr
 A1fsDZ4K/zKfdaspe1NMU68Ce0pVQK3x2eUL/XVwdkX8WrFiaVtyF4JaQ9yK9bF4BJgk
 yLmsblcNywZMIKscfBJPTktPClXf4OlHvxamfHrDjtqtMB8pV1RC76vEgp7S1OJd+iva
 99IsoO++lgCbqKBO8QRv4dggSr7ZmSPuOgoyxhBl9VPsBAtNBCovflH8HMBqsNF5JT0H
 WYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688973168; x=1691565168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nYLks6qwB9rmPC4eKa54oNllx8i0BKWVIZeeWVe0VY8=;
 b=fGSMrJOJuHzJy1m0PD+ilX/06lbhL3gdw5VAzMjR+45vW2N3v8jKThRuNXq5b/0AlK
 0BEgozzNjkpRfeomEg+mUdZP2cjwirUZr2/RG3j7zhq8APQXuPH1pvB+uyzUFbhfTPhc
 JQ4tEHbO3P5lmzO/RUYsU+AnS/Uum6WPYVoWfxuumcKoip33Gk3GjTLrP+4dFMztT/fj
 kYK7KnjEgKYAeMR+J/1Q7MwPd7dz0LHBDaLcSMPW91TJzvE45UHFGpO2GWH0T97QFdMM
 iNI6Il3n4tTD8yXvf9kM4ltGGMie8i/8ZNzIO7bmJmkmhwVUbcYPluoEo/mDO34tY32D
 684w==
X-Gm-Message-State: ABy/qLZH9baA2Acpr7tJ7+GJ4+nUJB+RslUeRa5Eax+JTqSh+4ovNn+h
 AcmOvitsXZhhyQsnDlmwsE6eDEec8zsLZ1/0dyA=
X-Google-Smtp-Source: APBJJlHOFbQxbGPzTfcs94pQ+P6Z88GsyoThcFSnaNpwz9JQKBkVFh7IvWqcRNJBhBpGXvf728hUkA==
X-Received: by 2002:a17:907:9005:b0:989:74a:39ff with SMTP id
 ay5-20020a170907900500b00989074a39ffmr10791147ejc.49.1688973166928; 
 Mon, 10 Jul 2023 00:12:46 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v27-20020a170906339b00b0098654d3c270sm5633780eja.52.2023.07.10.00.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 00:12:46 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jeff Law <jeffreyalaw@gmail.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, liweiwei@iscas.ac.cn,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v8] riscv: Add support for the Zfa extension
Date: Mon, 10 Jul 2023 09:12:43 +0200
Message-ID: <20230710071243.282464-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch introduces the RISC-V Zfa extension, which introduces
additional floating-point instructions:
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

The Zfa specification can be found here:
  https://github.com/riscv/riscv-isa-manual/blob/master/src/zfa.tex
The Zfa specifciation is frozen and is in public review since May 3, 2023:
  https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/SED4ntBkabg

The patch also includes a TCG test for the fcvtmod.w.d instruction.
The test cases test for correct results and flag behaviour.
Note, that the Zfa specification requires fcvtmod's flag behaviour
to be identical to a fcvt with the same operands (which is also
tested).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>

---

Changes in v8:
* Rebase on alistair23/riscv-to-apply.next and resolve conflicts

Changes in v7:
* Rebase on alistair23/riscv-to-apply.next and resolve conflicts

Changes in v6:
* Address issues in trans_fmvp_d_x() and trans_fmvh_x_d()

Changes in v5:
* Merge all three commits
* Address issues reported by Richard

Changes in v4:
* Rebase and resolve conflicts
* Fix whitespace issue (thanks Rob)
* Add patch to implemnt fcvtmod.w.d using float64_to_int64_modulo()
* Add (demo) test for fcvtmod.w.d

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

 disas/riscv.c                             | 139 ++++++
 disas/riscv.h                             |   3 +
 target/riscv/cpu.c                        |   8 +
 target/riscv/cpu_cfg.h                    |   1 +
 target/riscv/fpu_helper.c                 | 154 +++++++
 target/riscv/helper.h                     |  19 +
 target/riscv/insn32.decode                |  26 ++
 target/riscv/insn_trans/trans_rvzfa.c.inc | 521 ++++++++++++++++++++++
 target/riscv/translate.c                  |   1 +
 tests/tcg/riscv64/Makefile.target         |   6 +
 tests/tcg/riscv64/test-fcvtmod.c          | 345 ++++++++++++++
 11 files changed, 1223 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfa.c.inc
 create mode 100644 tests/tcg/riscv64/test-fcvtmod.c

diff --git a/disas/riscv.c b/disas/riscv.c
index 9f0195be30..cd7b6e86a7 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -829,6 +829,39 @@ typedef enum {
     rv_op_fsh = 798,
     rv_op_fmv_h_x = 799,
     rv_op_fmv_x_h = 800,
+    rv_op_fli_s = 801,
+    rv_op_fli_d = 802,
+    rv_op_fli_q = 803,
+    rv_op_fli_h = 804,
+    rv_op_fminm_s = 805,
+    rv_op_fmaxm_s = 806,
+    rv_op_fminm_d = 807,
+    rv_op_fmaxm_d = 808,
+    rv_op_fminm_q = 809,
+    rv_op_fmaxm_q = 810,
+    rv_op_fminm_h = 811,
+    rv_op_fmaxm_h = 812,
+    rv_op_fround_s = 813,
+    rv_op_froundnx_s = 814,
+    rv_op_fround_d = 815,
+    rv_op_froundnx_d = 816,
+    rv_op_fround_q = 817,
+    rv_op_froundnx_q = 818,
+    rv_op_fround_h = 819,
+    rv_op_froundnx_h = 820,
+    rv_op_fcvtmod_w_d = 821,
+    rv_op_fmvh_x_d = 822,
+    rv_op_fmvp_d_x = 823,
+    rv_op_fmvh_x_q = 824,
+    rv_op_fmvp_q_x = 825,
+    rv_op_fleq_s = 826,
+    rv_op_fltq_s = 827,
+    rv_op_fleq_d = 828,
+    rv_op_fltq_d = 829,
+    rv_op_fleq_q = 830,
+    rv_op_fltq_q = 831,
+    rv_op_fleq_h = 832,
+    rv_op_fltq_h = 833,
 } rv_op;
 
 /* register names */
@@ -854,6 +887,23 @@ static const char rv_vreg_name_sym[32][4] = {
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
 /* pseudo-instruction constraints */
 
 static const rvc_constraint rvcc_jal[] = { rvc_rd_eq_ra, rvc_end };
@@ -1925,6 +1975,39 @@ const rv_opcode_data rvi_opcode_data[] = {
     { "fsh", rv_codec_s, rv_fmt_frs2_offset_rs1, NULL, 0, 0, 0 },
     { "fmv.h.x", rv_codec_r, rv_fmt_frd_rs1, NULL, 0, 0, 0 },
     { "fmv.x.h", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
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
@@ -2864,24 +2947,38 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fmin_s; break;
                 case 1: op = rv_op_fmax_s; break;
+                case 2: op = rv_op_fminm_s; break;
+                case 3: op = rv_op_fmaxm_s; break;
                 }
                 break;
             case 21:
                 switch ((inst >> 12) & 0b111) {
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
                 switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fmin_q; break;
                 case 1: op = rv_op_fmax_q; break;
+                case 2: op = rv_op_fminm_q; break;
+                case 3: op = rv_op_fmaxm_q; break;
                 }
                 break;
             case 32:
                 switch ((inst >> 20) & 0b11111) {
                 case 1: op = rv_op_fcvt_s_d; break;
                 case 3: op = rv_op_fcvt_s_q; break;
+                case 4: op = rv_op_fround_s; break;
+                case 5: op = rv_op_froundnx_s; break;
                 case 6: op = rv_op_fcvt_s_bf16; break;
                 }
                 break;
@@ -2889,10 +2986,14 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_d_s; break;
                 case 3: op = rv_op_fcvt_d_q; break;
+                case 4: op = rv_op_fround_d; break;
+                case 5: op = rv_op_froundnx_d; break;
                 }
                 break;
             case 34:
                 switch (((inst >> 20) & 0b11111)) {
+                case 4: op = rv_op_fround_h; break;
+                case 5: op = rv_op_froundnx_h; break;
                 case 8: op = rv_op_fcvt_bf16_s; break;
                 }
                 break;
@@ -2900,6 +3001,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_q_s; break;
                 case 1: op = rv_op_fcvt_q_d; break;
+                case 4: op = rv_op_fround_q; break;
+                case 5: op = rv_op_froundnx_q; break;
                 }
                 break;
             case 44:
@@ -2922,6 +3025,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 0: op = rv_op_fle_s; break;
                 case 1: op = rv_op_flt_s; break;
                 case 2: op = rv_op_feq_s; break;
+                case 4: op = rv_op_fleq_s; break;
+                case 5: op = rv_op_fltq_s; break;
                 }
                 break;
             case 81:
@@ -2929,6 +3034,14 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
             case 83:
@@ -2936,6 +3049,18 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -2952,6 +3077,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 1: op = rv_op_fcvt_wu_d; break;
                 case 2: op = rv_op_fcvt_l_d; break;
                 case 3: op = rv_op_fcvt_lu_d; break;
+                case 8: op = rv_op_fcvtmod_w_d; break;
                 }
                 break;
             case 99:
@@ -2998,6 +3124,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                         ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_x_d; break;
                 case 1: op = rv_op_fclass_d; break;
+                case 8: op = rv_op_fmvh_x_d; break;
                 }
                 break;
             case 114:
@@ -3011,30 +3138,35 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                         ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_x_q; break;
                 case 1: op = rv_op_fclass_q; break;
+                case 8: op = rv_op_fmvh_x_q; break;
                 }
                 break;
             case 120:
                 switch (((inst >> 17) & 0b11111000) |
                         ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_s_x; break;
+                case 8: op = rv_op_fli_s; break;
                 }
                 break;
             case 121:
                 switch (((inst >> 17) & 0b11111000) |
                         ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_d_x; break;
+                case 8: op = rv_op_fli_d; break;
                 }
                 break;
             case 122:
                 switch (((inst >> 17) & 0b11111000) |
                         ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_h_x; break;
+                case 8: op = rv_op_fli_h; break;
                 }
                 break;
             case 123:
                 switch (((inst >> 17) & 0b11111000) |
                         ((inst >> 12) & 0b00000111)) {
                 case 0: op = rv_op_fmv_q_x; break;
+                case 8: op = rv_op_fli_q; break;
                 }
                 break;
             }
@@ -4298,6 +4430,10 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
         break;
     case rv_codec_zcmt_jt:
         dec->imm = operand_tbl_index(inst);
+	break;
+    case rv_codec_fli:
+        dec->rd = operand_rd(inst);
+        dec->imm = operand_rs1(inst);
         break;
     case rv_codec_r2_imm5:
         dec->rd = operand_rd(inst);
@@ -4708,6 +4844,9 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
             append(buf, tmp, buflen);
             break;
         }
+        case 'h':
+            append(buf, rv_fli_name_const[dec->imm], buflen);
+            break;
         default:
             break;
         }
diff --git a/disas/riscv.h b/disas/riscv.h
index 052a0c4281..9cf901fc1e 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -165,6 +165,7 @@ typedef enum {
     rv_codec_r_imm2,
     rv_codec_r2_immhl,
     rv_codec_r2_imm2_imm5,
+    rv_codec_fli,
 } rv_codec;
 
 /* structures */
@@ -229,6 +230,7 @@ enum {
 #define rv_fmt_rd_offset              "O\t0,o"
 #define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
 #define rv_fmt_frd_rs1                "O\t3,1"
+#define rv_fmt_frd_rs1_rs2            "O\t3,1,2"
 #define rv_fmt_frd_frs1               "O\t3,4"
 #define rv_fmt_rd_frs1                "O\t0,4"
 #define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
@@ -295,5 +297,6 @@ enum {
 #define rv_fmt_rd_rs1_immh_imml       "O\t0,1,i,j"
 #define rv_fmt_rd_rs1_immh_imml_addr  "O\t0,(1),i,j"
 #define rv_fmt_rd2_imm                "O\t0,2,(1),i"
+#define rv_fmt_fli                    "O\t3,h"
 
 #endif /* DISAS_RISCV_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fd647534cf..7fb29e3d29 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -94,6 +94,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
+    ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
     ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
     ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, PRIV_VERSION_1_11_0, ext_zfhmin),
@@ -434,6 +435,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
     env->priv_ver = PRIV_VERSION_1_11_0;
 
+    cpu->cfg.ext_zfa = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
@@ -1112,6 +1114,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zfa && !riscv_has_ext(env, RVF)) {
+        error_setg(errp, "Zfa extension requires F extension");
+        return;
+    }
+
     if (cpu->cfg.ext_zfh) {
         cpu->cfg.ext_zfhmin = true;
     }
@@ -1682,6 +1689,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
     DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
+    DEFINE_PROP_BOOL("Zfa", RISCVCPU, cfg.ext_zfa, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index e9ee39d7de..2bd9510ba3 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -75,6 +75,7 @@ struct RISCVCPUConfig {
     bool ext_svpbmt;
     bool ext_zdinx;
     bool ext_zawrs;
+    bool ext_zfa;
     bool ext_zfbfmin;
     bool ext_zfh;
     bool ext_zfhmin;
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index eb5ee5c4c9..871a70a316 100644
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
@@ -408,6 +482,11 @@ target_ulong helper_fcvt_w_d(CPURISCVState *env, uint64_t frs1)
     return float64_to_int32(frs1, &env->fp_status);
 }
 
+uint64_t helper_fcvtmod_w_d(CPURISCVState *env, uint64_t value)
+{
+    return float64_to_int32_modulo(value, float_round_to_zero, &env->fp_status);
+}
+
 target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
 {
     return (int32_t)float64_to_uint32(frs1, &env->fp_status);
@@ -448,6 +527,27 @@ target_ulong helper_fclass_d(uint64_t frs1)
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
@@ -485,6 +585,14 @@ uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
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
@@ -494,6 +602,14 @@ uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
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
@@ -507,6 +623,13 @@ target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
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
@@ -514,6 +637,13 @@ target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
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
@@ -527,6 +657,30 @@ target_ulong helper_fclass_h(CPURISCVState *env, uint64_t rs1)
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
index 3170b8daa6..c95adaf08a 100644
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
index 8c5d293f07..e341fa9213 100644
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
index 0000000000..2c715af3e5
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzfa.c.inc
@@ -0,0 +1,521 @@
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
+    static const uint64_t fli_h_table[] = {
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
+    tcg_gen_sari_i64(t1, cpu_fpr[a->rs1], 32);
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
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    tcg_gen_concat_tl_i64(cpu_fpr[a->rd], src1, src2);
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
index 621dd99241..697df1be9e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1091,6 +1091,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvzicond.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzicbo.c.inc"
+#include "insn_trans/trans_rvzfa.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index 42993549cb..a7e390c384 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -12,3 +12,9 @@ run-test-noc: QEMU_OPTS += -cpu rv64,c=false
 
 TESTS += test-aes
 run-test-aes: QEMU_OPTS += -cpu rv64,zk=on
+
+# Test for fcvtmod
+TESTS += test-fcvtmod
+test-fcvtmod: CFLAGS += -march=rv64imafdc
+test-fcvtmod: LDFLAGS += -static
+run-test-fcvtmod: QEMU_OPTS += -cpu rv64,d=true,Zfa=true
diff --git a/tests/tcg/riscv64/test-fcvtmod.c b/tests/tcg/riscv64/test-fcvtmod.c
new file mode 100644
index 0000000000..f050579974
--- /dev/null
+++ b/tests/tcg/riscv64/test-fcvtmod.c
@@ -0,0 +1,345 @@
+#include <stdio.h>
+#include <stddef.h>
+#include <stdint.h>
+
+#define FFLAG_NX_SHIFT 0 /* inexact */
+#define FFLAG_UF_SHIFT 1 /* underflow */
+#define FFLAG_OF_SHIFT 2 /* overflow */
+#define FFLAG_DZ_SHIFT 3 /* divide by zero */
+#define FFLAG_NV_SHIFT 4 /* invalid operation */
+
+#define FFLAG_NV (1UL << FFLAG_NV_SHIFT)
+#define FFLAG_DZ (1UL << FFLAG_DZ_SHIFT)
+#define FFLAG_OF (1UL << FFLAG_OF_SHIFT)
+#define FFLAG_UF (1UL << FFLAG_UF_SHIFT)
+#define FFLAG_NX (1UL << FFLAG_NX_SHIFT)
+
+typedef struct fp64_fcvt_fcvtmod_testcase {
+    const char* name;
+    union {
+        uint64_t inp_lu;
+        double inp_lf;
+    };
+    uint64_t exp_fcvt;
+    uint8_t exp_fcvt_fflags;
+    uint64_t exp_fcvtmod;
+    uint8_t exp_fcvtmod_fflags;
+} fp64_fcvt_fcvtmod_testcase_t;
+
+void print_fflags(uint8_t fflags)
+{
+    int set = 0;
+
+    if (fflags == 0) {
+        printf("-");
+        return;
+    }
+
+    if (fflags & FFLAG_NV) {
+        printf("%sFFLAG_NV", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_DZ) {
+        printf("%sFFLAG_DZ", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_OF) {
+        printf("%sFFLAG_OF", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_UF) {
+        printf("%sFFLAG_UF", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_NX) {
+        printf("%sFFLAG_NX", set ? " | " : "");
+        set = 1;
+    }
+}
+
+/* Clear all FP flags. */
+static inline void clear_fflags()
+{
+    __asm__ __volatile__("fsflags zero");
+}
+
+/* Read all FP flags. */
+static inline uint8_t get_fflags()
+{
+    uint64_t v;
+    __asm__ __volatile__("frflags %0" : "=r"(v));
+    return (uint8_t)v;
+}
+
+/* Move input value (without conversations) into an FP register. */
+static inline double do_fmv_d_x(uint64_t inp)
+{
+    double fpr;
+    __asm__ __volatile__("fmv.d.x %0, %1" : "=f"(fpr) : "r"(inp));
+    return fpr;
+}
+
+static inline uint64_t do_fcvt_w_d(uint64_t inp, uint8_t *fflags)
+{
+    uint64_t ret;
+    double fpr = do_fmv_d_x(inp);
+
+    clear_fflags();
+
+    __asm__ __volatile__("fcvt.w.d %0, %1, rtz" : "=r"(ret) : "f"(fpr));
+
+    *fflags = get_fflags();
+
+    return ret;
+}
+
+static inline uint64_t do_fcvtmod_w_d(uint64_t inp, uint8_t *fflags)
+{
+    uint64_t ret;
+    double fpr = do_fmv_d_x(inp);
+
+    clear_fflags();
+
+    /* fcvtmod.w.d rd, rs1, rtz = 1100001 01000 rs1 001 rd 1010011 */
+    asm(".insn r  0x53, 0x1, 0x61, %0, %1, f8" : "=r"(ret) : "f"(fpr));
+
+    *fflags = get_fflags();
+
+    return ret;
+}
+
+static const fp64_fcvt_fcvtmod_testcase_t tests[] = {
+    /* Zero (exp=0, frac=0) */
+    { .name = "+0.0",
+      .inp_lf = 0x0p0,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0x0000000000000000,
+      .exp_fcvtmod_fflags = 0 },
+    { .name = "-0.0",
+      .inp_lf = -0x0p0,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0x0000000000000000,
+      .exp_fcvtmod_fflags = 0 },
+
+    /* Subnormal: exp=0 frac!=0 */
+    { .name = "Subnormal frac=1",
+      .inp_lu = 0x0000000000000001,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "Subnormal frac=0xf..f",
+      .inp_lu = 0x0000ffffffffffff,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "Neg subnormal frac=1",
+      .inp_lu = 0x0000000000000001,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "Neg subnormal frac=0xf..f",
+      .inp_lu = 0x8000ffffffffffff,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    /* Infinity: exp=0x7ff, frac=0 */
+    { .name = "+INF",
+      .inp_lu = 0x7ff0000000000000,
+      .exp_fcvt = 0x000000007fffffff, /* int32 max */
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NV },
+    { .name = "-INF",
+      .inp_lu = 0xfff0000000000000,
+      .exp_fcvt = 0xffffffff80000000, /* int32 min */
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NV },
+
+    /* NaN: exp=7ff, frac!=0 */
+    { .name = "canonical NaN",
+      .inp_lu = 0x7ff8000000000000,
+      .exp_fcvt = 0x000000007fffffff, /* int32 max */
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NV },
+    { .name = "non-canonical NaN",
+      .inp_lu = 0x7ff8000000100000,
+      .exp_fcvt = 0x000000007fffffff, /* int32 min */
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NV },
+
+    /* Normal numbers: exp!=0, exp!=7ff */
+    { .name = "+smallest normal value",
+      .inp_lu = 0x0010000000000000,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "-smallest normal value",
+      .inp_lu = 0x8010000000000000,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    { .name = "+0.5",
+      .inp_lf = 0x1p-1,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "-0.5",
+      .inp_lf = -0x1p-1,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    { .name = "+value just below 1.0",
+      .inp_lu = 0x3fefffffffffffff,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "-value just above -1.0",
+      .inp_lu = 0xbfefffffffffffff,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    { .name = "+1.0",
+      .inp_lf = 0x1p0,
+      .exp_fcvt = 0x0000000000000001,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0x0000000000000001,
+      .exp_fcvtmod_fflags = 0 },
+    { .name = "-1.0",
+      .inp_lf = -0x1p0,
+      .exp_fcvt = 0xffffffffffffffff,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0xffffffffffffffff,
+      .exp_fcvtmod_fflags = 0 },
+
+    { .name = "+1.5",
+      .inp_lu = 0x3ff8000000000000,
+      .exp_fcvt = 1,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 1,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "-1.5",
+      .inp_lu = 0xbff8000000000000,
+      .exp_fcvt = 0xffffffffffffffff,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0xffffffffffffffff,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    { .name = "+max int32 (2147483647)",
+      .inp_lu = 0x41dfffffffc00000,
+      .exp_fcvt = 0x000000007fffffff,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0x000000007fffffff,
+      .exp_fcvtmod_fflags = 0 },
+    { .name = "+max int32 +1 (2147483648)",
+      .inp_lf = 0x1p31,
+      .exp_fcvt = 0x000000007fffffff,
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = (uint64_t)-2147483648l, /* int32 min */
+      .exp_fcvtmod_fflags = FFLAG_NV },
+    { .name = "+max int32 +2 (2147483649)",
+      .inp_lu = 0x41e0000000200000,
+      .exp_fcvt = 0x000000007fffffff,
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = (uint64_t)-2147483647l, /* int32 min +1 */
+      .exp_fcvtmod_fflags = FFLAG_NV },
+
+    { .name = "-max int32 (-2147483648)",
+      .inp_lf = -0x1p31,
+      .exp_fcvt = 0xffffffff80000000,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0xffffffff80000000,
+      .exp_fcvtmod_fflags = 0 },
+    { .name = "-max int32 -1 (-2147483649)",
+      .inp_lf = -0x1.00000002p+31,
+      .exp_fcvt = 0xffffffff80000000,
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 2147483647, /* int32 max */
+      .exp_fcvtmod_fflags = FFLAG_NV },
+    { .name = "-max int32 -2 (-2147483650)",
+      .inp_lf = -0x1.00000004p+31,
+      .exp_fcvt = 0xffffffff80000000,
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 2147483646, /* int32 max -1 */
+      .exp_fcvtmod_fflags = FFLAG_NV },
+};
+
+int run_fcvtmod_tests()
+{
+    uint64_t act_fcvt;
+    uint8_t act_fcvt_fflags;
+    uint64_t act_fcvtmod;
+    uint8_t act_fcvtmod_fflags;
+
+    for (size_t i = 0; i < sizeof(tests)/sizeof(tests[0]); i++) {
+        const fp64_fcvt_fcvtmod_testcase_t *t = &tests[i];
+
+        act_fcvt = do_fcvt_w_d(t->inp_lu, &act_fcvt_fflags);
+        int fcvt_correct = act_fcvt == t->exp_fcvt &&
+                    act_fcvt_fflags == t->exp_fcvt_fflags;
+        act_fcvtmod = do_fcvtmod_w_d(t->inp_lu, &act_fcvtmod_fflags);
+        int fcvtmod_correct = act_fcvtmod == t->exp_fcvtmod &&
+                       act_fcvtmod_fflags == t->exp_fcvtmod_fflags;
+
+        if (fcvt_correct && fcvtmod_correct) {
+            continue;
+        }
+
+        printf("Test %zu (%s) failed!\n", i, t->name);
+
+        double fpr = do_fmv_d_x(t->inp_lu);
+        printf("inp_lu: 0x%016lx == %lf\n", t->inp_lu, fpr);
+        printf("inp_lf: %lf\n", t->inp_lf);
+
+        uint32_t sign = (t->inp_lu >> 63);
+        uint32_t exp = (uint32_t)(t->inp_lu >> 52) & 0x7ff;
+        uint64_t frac = t->inp_lu & 0xfffffffffffffull; /* significand */
+        int true_exp = exp - 1023;
+        int shift = true_exp - 52;
+        uint64_t true_frac = frac | 1ull << 52;
+
+        printf("sign=%d, exp=0x%03x, frac=0x%012lx\n", sign, exp, frac);
+        printf("true_exp=%d, shift=%d, true_frac=0x%016lx\n", true_exp, shift, true_frac);
+
+        if (!fcvt_correct) {
+            printf("act_fcvt: 0x%016lx == %li\n", act_fcvt, act_fcvt);
+            printf("exp_fcvt: 0x%016lx == %li\n", t->exp_fcvt, t->exp_fcvt);
+            printf("act_fcvt_fflags: "); print_fflags(act_fcvt_fflags); printf("\n");
+            printf("exp_fcvt_fflags: "); print_fflags(t->exp_fcvt_fflags); printf("\n");
+        }
+
+        if (!fcvtmod_correct) {
+            printf("act_fcvtmod: 0x%016lx == %li\n", act_fcvtmod, act_fcvtmod);
+            printf("exp_fcvtmod: 0x%016lx == %li\n", t->exp_fcvtmod, t->exp_fcvtmod);
+            printf("act_fcvtmod_fflags: "); print_fflags(act_fcvtmod_fflags); printf("\n");
+            printf("exp_fcvtmod_fflags: "); print_fflags(t->exp_fcvtmod_fflags); printf("\n");
+        }
+
+        return 1;
+    }
+
+    return 0;
+}
+
+int main()
+{
+    return run_fcvtmod_tests();
+}
-- 
2.41.0


