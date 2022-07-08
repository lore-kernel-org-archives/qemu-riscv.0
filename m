Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9pTm-00011l-E4
	for mharc-qemu-riscv@gnu.org; Fri, 08 Jul 2022 11:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1o9pTk-000109-Ct; Fri, 08 Jul 2022 11:01:12 -0400
Received: from elephant.ash.relay.mailchannels.net ([23.83.222.57]:30619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1o9pTg-0002UJ-P6; Fri, 08 Jul 2022 11:01:11 -0400
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 07E2576230B;
 Fri,  8 Jul 2022 15:00:58 +0000 (UTC)
Received: from hp220.hostpapa.com (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id 10707761DE8;
 Fri,  8 Jul 2022 15:00:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1657292456; a=rsa-sha256;
 cv=none;
 b=gtFtrNJcUvHZ1GlKyCDbPnMpK/cgGLht+/q8IhTp66FTV3Lz8wVyPhQA91C1EtW0/E0doP
 stAhEBMJZCrdKAhaoa37r9XOT7s32Lxhq10AZ5AqyXnNxeAf2OvneRWyij0B5B8KxG548f
 u/iCkTF8LaFX7/8lWfRykDtW9WcNjkZKp6Tfp1jzd3+rfctEJDQ7y7Prfl1S3D92xLr21U
 qTb8Pni9IN05SrpEETuR62mX3p8FuikIYz0H/YO/OZGvRdi9u07H2xW8ZO8AlO7vluli21
 ioQGEXrlK7W0OKUzeU2pzDpvrqgRhbiL2OkFRF6cbgPJEXgm+1CJyt+9/V4CLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1657292456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=vLKHDQimy8+xBVr6wK2V1kfJV6/EObJp1t9I9EHpEzM=;
 b=xLfVveu1yDfEoYcHyu2K9HOwtG0aTytN4/VoCQ/YQBr/UU0rU1Acn3dJlNVW1rFR3ZFAHa
 W4hKZFrN3ais4TiM7mJgwc2P9oThol1LPwv18ed3HdPdJiu6gl8acazEoSVvqyxKVRJfrq
 poHcjKgERs48VWh7qFIm31haEWanZm3goYaLPvpo7dv/sukk63h/6P++f40A8aG1I0DGkO
 TXYtQWwe6edm6U0pRSm5vhc4LFPv7MmxeShMMZ7/w7931Y0ZNpLK0zPd5QoUlC/iog3Xpq
 bNm/nG/zKhuLXpJRrwWWM/YA9/UjPFgNX3mtKdIwvB9oWMqKBS5YSDV4q8Z4aA==
ARC-Authentication-Results: i=1; rspamd-689699966c-d2vq5;
 auth=pass smtp.auth=hostpapa
 smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|frederic@petrot.fr
X-MailChannels-Auth-Id: hostpapa
X-Bitter-Tart: 5bdb35210e4fcdc0_1657292456758_279952398
X-MC-Loop-Signature: 1657292456758:1936925537
X-MC-Ingress-Time: 1657292456758
Received: from hp220.hostpapa.com (hp220.hostpapa.com [69.90.161.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.115.45.63 (trex/6.7.1); Fri, 08 Jul 2022 15:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=petrot.fr; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vLKHDQimy8+xBVr6wK2V1kfJV6/EObJp1t9I9EHpEzM=; b=IqniT7553iDP6sVeTqNmZvwx9a
 +XLhyuuGpHgt2AoEJKzhXZiuwz9ERIFWmpAKy9gYt/TN4fZI1BnpBOMg2Pzu5NaY/8AeenYuW0W42
 n9uckiqkX9WGeUqoA8t4DVv4KBaoHk5AH09NbbBcI8GF/Jyl552sSyZilmrDfKYBqdvAN4FcT6NrM
 cUWbaSRdEDiHIO8Kf+LFdpcAk7NTKvzp+/tJngUEZyjW0HHSYnJyXS1J4jzUcfw0n3BZQAahnXCeE
 ccCJ23lr2Rn7NFsHlERAcawhYYgVMrI+sKX8S/INYb+1Z2yYQJh1E/TWcAtnf/3I48MrrTjIRfIHe
 vBc0qLEg==;
Received: from palmier.tima.u-ga.fr ([147.171.132.208]:59344
 helo=palmier.u-ga.fr) by hp220.hostpapa.com with esmtpa (Exim 4.94.2)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1o9pTR-00BGwV-J4; Fri, 08 Jul 2022 17:00:52 +0200
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH] target/riscv: fix right shifts shamt value for rv128c
Date: Fri,  8 Jul 2022 17:00:38 +0200
Message-Id: <20220708150038.216575-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: frederic@petrot.fr
Received-SPF: neutral client-ip=23.83.222.57;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=elephant.ash.relay.mailchannels.net
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 08 Jul 2022 15:01:12 -0000

For rv128c right shifts, the 6-bit shamt is sign extended to 7 bits.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 target/riscv/insn16.decode |  7 ++++---
 disas/riscv.c              | 27 +++++++++++++++++++++------
 target/riscv/translate.c   | 12 +++++++++++-
 3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 02c8f61b48..ea3c5a0411 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -31,7 +31,8 @@
 %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
 %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
 
-%shimm_6bit   12:1 2:5               !function=ex_rvc_shifti
+%shlimm_6bit   12:1 2:5              !function=ex_rvc_shiftli
+%shrimm_6bit   12:1 2:5              !function=ex_rvc_shiftri
 %uimm_6bit_lq 2:4 12:1 6:1           !function=ex_shift_4
 %uimm_6bit_ld 2:3 12:1 5:2           !function=ex_shift_3
 %uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
@@ -82,9 +83,9 @@
 @c_addi16sp     ... .  ..... ..... .. &i imm=%imm_addi16sp rs1=2 rd=2
 
 @c_shift        ... . .. ... ..... .. \
-                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shimm_6bit
+                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shrimm_6bit
 @c_shift2       ... . .. ... ..... .. \
-                &shift rd=%rd rs1=%rd shamt=%shimm_6bit
+                &shift rd=%rd rs1=%rd shamt=%shlimm_6bit
 
 @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
 
diff --git a/disas/riscv.c b/disas/riscv.c
index 7af6afc8fa..489c2ae5e8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2402,10 +2402,25 @@ static int32_t operand_sbimm12(rv_inst inst)
         ((inst << 56) >> 63) << 11;
 }
 
-static uint32_t operand_cimmsh6(rv_inst inst)
+static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)
 {
-    return ((inst << 51) >> 63) << 5 |
+    int imm = ((inst << 51) >> 63) << 5 |
         (inst << 57) >> 59;
+    if (isa == rv128) {
+        imm = imm ? imm : 64;
+    }
+    return imm;
+}
+
+static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)
+{
+    int imm = ((inst << 51) >> 63) << 5 |
+        (inst << 57) >> 59;
+    if (isa == rv128) {
+        imm = imm | (imm & 32) << 1;
+        imm = imm ? imm : 64;
+    }
+    return imm;
 }
 
 static int32_t operand_cimmi(rv_inst inst)
@@ -2529,7 +2544,7 @@ static uint32_t operand_rnum(rv_inst inst)
 
 /* decode operands */
 
-static void decode_inst_operands(rv_decode *dec)
+static void decode_inst_operands(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     dec->codec = opcode_data[dec->op].codec;
@@ -2652,7 +2667,7 @@ static void decode_inst_operands(rv_decode *dec)
     case rv_codec_cb_sh6:
         dec->rd = dec->rs1 = operand_crs1rdq(inst) + 8;
         dec->rs2 = rv_ireg_zero;
-        dec->imm = operand_cimmsh6(inst);
+        dec->imm = operand_cimmshr6(inst, isa);
         break;
     case rv_codec_ci:
         dec->rd = dec->rs1 = operand_crs1rd(inst);
@@ -2667,7 +2682,7 @@ static void decode_inst_operands(rv_decode *dec)
     case rv_codec_ci_sh6:
         dec->rd = dec->rs1 = operand_crs1rd(inst);
         dec->rs2 = rv_ireg_zero;
-        dec->imm = operand_cimmsh6(inst);
+        dec->imm = operand_cimmshl6(inst, isa);
         break;
     case rv_codec_ci_16sp:
         dec->rd = rv_ireg_sp;
@@ -3193,7 +3208,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
     dec.pc = pc;
     dec.inst = inst;
     decode_inst_opcode(&dec, isa);
-    decode_inst_operands(&dec);
+    decode_inst_operands(&dec, isa);
     decode_inst_decompress(&dec, isa);
     decode_inst_lift_pseudo(&dec);
     format_inst(buf, buflen, 16, &dec);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 63b04e8a94..af3a2cd68c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -705,12 +705,22 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
     return 8 + reg;
 }
 
-static int ex_rvc_shifti(DisasContext *ctx, int imm)
+static int ex_rvc_shiftli(DisasContext *ctx, int imm)
 {
     /* For RV128 a shamt of 0 means a shift by 64. */
     return imm ? imm : 64;
 }
 
+static int ex_rvc_shiftri(DisasContext *ctx, int imm)
+{
+    /*
+     * For RV128 a shamt of 0 means a shift by 64, furthermore, for right
+     * shifts, the shamt is sign-extended.
+     */
+    imm = imm | (imm & 32) << 1;
+    return imm ? imm : 64;
+}
+
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
 
-- 
2.36.1


