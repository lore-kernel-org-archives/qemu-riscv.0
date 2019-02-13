Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtv-0002XM-Lj
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtl-0002NW-Jy
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtN-0002zf-6O
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:25 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtM-00021m-Lu
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:08 -0500
Received: by mail-pl1-x636.google.com with SMTP id o6so1334201pls.13
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=K2gvPzrZn61ujbSxDUnXxGnfUKsPuWGUZPZQI6P0G70=;
	b=aTMm3eRQGI3uL9qWmSCeByBsWp7fmIcQkfG7DcgGt0VJ5kx8crCssVBpP6ELRjW8/8
	wG6LE18+4/n2fkBcF5rCkAKODxg54LJ4E5lP7wSHxG5d01LkLG9YdsImsVJdlbfGhWW8
	uILFEXZXzJScFkNjGMNqeDPpPWivmP4fTK7h1rd1LdIJIK4Gp1WLLeiLCIpvvj2NRNVt
	BMfvh/c1WMclMa44P7dDWQ7x/Ya6iAhSZcQspOHi1suAF1hyVCH3KSZem/RhURUH1ykW
	pwXFHteAVGTHXF10NlFm3wR80cIv0oYAXKCzD9+KNeYAg96Mx+cc3X1f4sRVlXT1JcPk
	dWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=K2gvPzrZn61ujbSxDUnXxGnfUKsPuWGUZPZQI6P0G70=;
	b=hOz897anXKP4o8IvQliLiXrY82dn/a3ldhPIJY+5/qTPn5v33PgpWMHwEqJVR4hp4V
	UPBFsjBdwLeR0TU0yTOdFAVJ9BFXlZrUE2NIwif/30Islvu2G/X3OSNs4fyHr3w/D3jB
	Zdyt6IskPPtJBggr8ZPs+7IIJ3xdmBRmraRXFEp6HHZKiB2RC6iahbEMvhJw7ZUDOlMv
	o0hQVFWabtYXP5Vve9X8Mict/fYZ3vldmbtvfcpqe1vZfS7LhrS2y+g2Q6MwRXnySvjE
	La9nWCI49QN5mCc6+fBsCgzogv8X1k3ECuyVNYWvTFUu2cRqORIVVDi3XNnIND1ZJoq1
	aaNA==
X-Gm-Message-State: AHQUAubMCBvZ472BU1BhWcDLbR1MH3Z6Gdc4f9QsXjHih32hyp3rXHlG
	7apSqCTnl6t5yHYXrFEO6fQrmw==
X-Google-Smtp-Source: AHgI3IaTRH389uCstIcEeHFc3NBVoZ6kUk4LFHb79n4iSpVWL8yMJOGkMb5SZhBF7FE4XmEiwqBVJQ==
X-Received: by 2002:a17:902:9a81:: with SMTP id
	w1mr1128797plp.19.1550073326544; 
	Wed, 13 Feb 2019 07:55:26 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	e21sm80146538pfh.45.2019.02.13.07.55.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:25 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:10 -0800
Message-Id: <20190213155414.22285-32-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: [Qemu-riscv] [PATCH v7 31/35] target/riscv: Convert @cs_2 insns to
 share translation functions
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 15:56:36 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

These all expand simply to R format instructions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/Makefile.objs              | 10 +++---
 target/riscv/insn16-64.decode           | 24 ++++++++++++++
 target/riscv/insn16.decode              | 15 +++++----
 target/riscv/insn_trans/trans_rvc.inc.c | 44 -------------------------
 target/riscv/translate.c                | 20 ++++++++---
 5 files changed, 54 insertions(+), 59 deletions(-)
 create mode 100644 target/riscv/insn16-64.decode

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index 9c6c1093271e..990bd8901623 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -5,16 +5,18 @@ DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 decode32-y = $(SRC_PATH)/target/riscv/insn32.decode
 decode32-$(TARGET_RISCV64) += $(SRC_PATH)/target/riscv/insn32-64.decode
 
+decode16-y = $(SRC_PATH)/target/riscv/insn16.decode
+decode16-$(TARGET_RISCV64) += $(SRC_PATH)/target/riscv/insn16-64.decode
+
 target/riscv/decode_insn32.inc.c: $(decode32-y) $(DECODETREE)
 	$(call quiet-command, \
 	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $(decode32-y), \
 	  "GEN", $(TARGET_DIR)$@)
 
-target/riscv/decode_insn16.inc.c: \
-  $(SRC_PATH)/target/riscv/insn16.decode $(DECODETREE)
+target/riscv/decode_insn16.inc.c: $(decode16-y) $(DECODETREE)
 	$(call quiet-command, \
-	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn16 --insnwidth 16 $<, \
-	  "GEN", $(TARGET_DIR)$@)
+	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn16 --insnwidth 16 \
+	  $(decode16-y), "GEN", $(TARGET_DIR)$@)
 
 target/riscv/translate.o: target/riscv/decode_insn32.inc.c \
 	target/riscv/decode_insn16.inc.c
diff --git a/target/riscv/insn16-64.decode b/target/riscv/insn16-64.decode
new file mode 100644
index 000000000000..5af2e2b0728d
--- /dev/null
+++ b/target/riscv/insn16-64.decode
@@ -0,0 +1,24 @@
+#
+# RISC-V translation routines for the RVC Instruction Set.
+#
+# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
+#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2 or later, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+# You should have received a copy of the GNU General Public License along with
+# this program.  If not, see <http://www.gnu.org/licenses/>.
+
+# This is concatenated with insn16.decode for risc64 targets.
+# All of the fields and formats are there.
+
+# *** RV64C Standard Extension (Quadrant 1) ***
+subw              100 1 11 ... 00 ... 01 @cs_2
+addw              100 1 11 ... 01 ... 01 @cs_2
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 0829e3bc592d..c7a58d80e5ae 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -41,6 +41,9 @@
 
 
 
+# Argument sets imported from insn32.decode:
+&r         rd rs1 rs2   !extern
+
 # Argument sets:
 &cl               rs1 rd
 &cl_dw     uimm   rs1 rd
@@ -68,7 +71,7 @@
 @cl_w      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rd=%rs2_3
 @cl        ... ... ... .. ... .. &cl                      rs1=%rs1_3  rd=%rs2_3
 @cs        ... ... ... .. ... .. &cs                      rs1=%rs1_3  rs2=%rs2_3
-@cs_2      ... ... ... .. ... .. &cr                      rd=%rs1_3   rs2=%rs2_3
+@cs_2      ... ... ... .. ... .. &r      rd=%rs1_3 rs1=%rs1_3 rs2=%rs2_3
 @cs_d      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rs2=%rs2_3
 @cs_w      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rs2=%rs2_3
 @cb        ... ... ... .. ... .. &cb     imm=%imm_cb      rs1=%rs1_3
@@ -107,12 +110,10 @@ c_addi16sp_lui    011 .  .....  ..... 01 @c_addi16sp_lui # shares opc with C.LUI
 c_srli            100 . 00 ...  ..... 01 @c_shift
 c_srai            100 . 01 ...  ..... 01 @c_shift
 c_andi            100 . 10 ...  ..... 01 @c_andi
-c_sub             100 0 11 ... 00 ... 01 @cs_2
-c_xor             100 0 11 ... 01 ... 01 @cs_2
-c_or              100 0 11 ... 10 ... 01 @cs_2
-c_and             100 0 11 ... 11 ... 01 @cs_2
-c_subw            100 1 11 ... 00 ... 01 @cs_2
-c_addw            100 1 11 ... 01 ... 01 @cs_2
+sub               100 0 11 ... 00 ... 01 @cs_2
+xor               100 0 11 ... 01 ... 01 @cs_2
+or                100 0 11 ... 10 ... 01 @cs_2
+and               100 0 11 ... 11 ... 01 @cs_2
 c_j               101     ........... 01 @cj
 c_beqz            110  ... ...  ..... 01 @cb
 c_bnez            111  ... ...  ..... 01 @cb
diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index bcdf64d3b705..639c381edfc0 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -163,50 +163,6 @@ static bool trans_c_andi(DisasContext *ctx, arg_c_andi *a)
     return trans_andi(ctx, &arg);
 }
 
-static bool trans_c_sub(DisasContext *ctx, arg_c_sub *a)
-{
-    arg_sub arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
-    return trans_sub(ctx, &arg);
-}
-
-static bool trans_c_xor(DisasContext *ctx, arg_c_xor *a)
-{
-    arg_xor arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
-    return trans_xor(ctx, &arg);
-}
-
-static bool trans_c_or(DisasContext *ctx, arg_c_or *a)
-{
-    arg_or arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
-    return trans_or(ctx, &arg);
-}
-
-static bool trans_c_and(DisasContext *ctx, arg_c_and *a)
-{
-    arg_and arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
-    return trans_and(ctx, &arg);
-}
-
-static bool trans_c_subw(DisasContext *ctx, arg_c_subw *a)
-{
-#ifdef TARGET_RISCV64
-    arg_subw arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
-    return trans_subw(ctx, &arg);
-#else
-    return false;
-#endif
-}
-
-static bool trans_c_addw(DisasContext *ctx, arg_c_addw *a)
-{
-#ifdef TARGET_RISCV64
-    arg_addw arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
-    return trans_addw(ctx, &arg);
-#else
-    return false;
-#endif
-}
-
 static bool trans_c_j(DisasContext *ctx, arg_c_j *a)
 {
     arg_jal arg = { .rd = 0, .imm = a->imm };
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 59c297915158..597653fb12bc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -533,10 +533,25 @@ static int ex_rvc_register(int reg)
     return 8 + reg;
 }
 
+/*
+ * Include the auto-generated decoders.
+ * Note that the 16-bit decoder reuses some of the trans_* functions
+ * from the 32-bit decoder, which results in duplicate declarations
+ * of the relevant helpers.  Suppress the warning.
+ */
 bool decode_insn32(DisasContext *ctx, uint32_t insn);
-/* Include the auto-generated decoder for 32 bit insn */
+bool decode_insn16(DisasContext *ctx, uint16_t insn);
+
 #include "decode_insn32.inc.c"
 
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wredundant-decls"
+
+#include "decode_insn16.inc.c"
+
+#pragma GCC diagnostic pop
+
+
 static bool gen_arith_imm(DisasContext *ctx, arg_i *a,
                           void(*func)(TCGv, TCGv, TCGv))
 {
@@ -641,9 +656,6 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 #include "insn_trans/trans_rvd.inc.c"
 #include "insn_trans/trans_privileged.inc.c"
 
-bool decode_insn16(DisasContext *ctx, uint16_t insn);
-/* auto-generated decoder*/
-#include "decode_insn16.inc.c"
 #include "insn_trans/trans_rvc.inc.c"
 
 static void decode_opc(DisasContext *ctx)
-- 
2.18.1


