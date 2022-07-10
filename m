Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAUkc-0005TC-DR
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jul 2022 07:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1oAUka-0005Sf-RN; Sun, 10 Jul 2022 07:05:20 -0400
Received: from aye.elm.relay.mailchannels.net ([23.83.212.6]:28863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1oAUkX-0004o0-ME; Sun, 10 Jul 2022 07:05:20 -0400
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 091004C1DB9;
 Sun, 10 Jul 2022 11:05:12 +0000 (UTC)
Received: from hp220.hostpapa.com (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id E5C184C1D5F;
 Sun, 10 Jul 2022 11:05:10 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1657451111; a=rsa-sha256;
 cv=none;
 b=pQuwHTMNezWgqafMTtZKJP1wPJLbc+yhecha4Zmix0ieWJ+O+TJUkvhcbDevFwC0IyGmB0
 G5lGou6VhnBX7WALBzPCAEoF8bAZWkFdcgMgaqxD0VAz6nUhg9sDl3P92Te42tL7OPkA9U
 gSoFlRaB0fp+nw1hDexy9Ah2k/BSF3XFLQv1ongD/JOxPqu50Cxm+2Sz8MtNqr40S0EXsk
 WL3JVewDHumL5iH8Um+1PkfDZkUV/dMv3EGN5RhNz1Vw8Fialqg0t2PVUiDRbrGSxkgWmS
 42J+BT8uMcsYWirEu7nQ2BnUAtRI1IMvG0ijXDKpgCvUaPZRu/uQyE7c6961AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1657451111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=/PRLQ9cFPMi9YXZy4q8Y22urOLzvANNirfV2Lq3pfpg=;
 b=eDiiKyYo+BY/CcV9J4e1h0bpvXIslPMrbEX02e9EL66JZO0wIqECqlXhqGEeu5QCdrJxKx
 7lXzqyCkZ8arS47v0gmpEIysb5fe+3c0XxHxrXH1sIsJEewpuQlP82xGvi9F+iCqEqj/yg
 EijCDcOPagW0vrkqoaCCZy16F1Dmufqe1Wjk6IdAXtRXQjrNadWKPfvHh3vdhjely68Y7x
 oBEJ9Z9sfwYXnVbHmqcICtX60iewPuKukIC+VA8TL/Garg9SbXgf5e+BpIQZQnWCtsTjJO
 OFIL/+9GZRhqTXqE8ebHmTeIQOsYkMdQo37zVJ8wLKdxblZ6wcwLSmwtK6Op2Q==
ARC-Authentication-Results: i=1; rspamd-674ffb986c-5f767;
 auth=pass smtp.auth=hostpapa
 smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|frederic@petrot.fr
X-MailChannels-Auth-Id: hostpapa
X-Arch-Occur: 4f709daf3c8c41ab_1657451111674_4282186247
X-MC-Loop-Signature: 1657451111673:352706108
X-MC-Ingress-Time: 1657451111673
Received: from hp220.hostpapa.com (hp220.hostpapa.com [69.90.161.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.120.38.170 (trex/6.7.1); Sun, 10 Jul 2022 11:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=petrot.fr; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/PRLQ9cFPMi9YXZy4q8Y22urOLzvANNirfV2Lq3pfpg=; b=oohnpn5Ixl+rpoJgCNkwbCFHAK
 tkKhQHYw0MTiodm90AIjJLlq8b683l7S4jqFq48S/Qa99VZjqQ9LnqEzj+hPC7jYvdGs2/jd5CXq1
 zY/Wz4yOCosZROTxNNoqSLoMjV50Mmsc527j4Sm1FUpT4fLCJwjjLwHFAUH9CiZRwkvg81fDrDjtA
 dmXE6H7LKndzno30knFIxi6u8CLyKlChmTcmJ32Svn5dT3E7GuACKDMZ87vmimIygP8lsE/hYJ1T0
 pmO+apEvtX7twiarjzy4lSmfPcHpglzgvHsk6qU6owCOaJHzPTkBVT5g45DmhRn+rwOkzawVAD3H9
 fx6gVkCg==;
Received: from [37.72.194.135] (port=58712 helo=palmier.Home)
 by hp220.hostpapa.com with esmtpa (Exim 4.94.2)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1oAUkN-001fZL-Id; Sun, 10 Jul 2022 13:05:10 +0200
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2] target/riscv: fix shifts shamt value for rv128c
Date: Sun, 10 Jul 2022 13:04:51 +0200
Message-Id: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: frederic@petrot.fr
Received-SPF: neutral client-ip=23.83.212.6;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=aye.elm.relay.mailchannels.net
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 10 Jul 2022 11:05:21 -0000

For rv128c shifts, a shamt of 0 is a shamt of 64, while for rv32c/rv64c
it stays 0 and is a hint instruction that does not change processor state.
For rv128c right shifts, the 6-bit shamt is in addition sign extended to
7 bits.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 target/riscv/insn16.decode |  7 ++++---
 disas/riscv.c              | 27 +++++++++++++++++++++------
 target/riscv/translate.c   | 20 ++++++++++++++++++--
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 02c8f61b48..ccfe59f294 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -31,7 +31,8 @@
 %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
 %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
 
-%shimm_6bit   12:1 2:5               !function=ex_rvc_shifti
+%shlimm_6bit  12:1 2:5               !function=ex_rvc_shiftli
+%shrimm_6bit  12:1 2:5               !function=ex_rvc_shiftri
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
index 63b04e8a94..d7c82a9c81 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -705,10 +705,26 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
     return 8 + reg;
 }
 
-static int ex_rvc_shifti(DisasContext *ctx, int imm)
+static int ex_rvc_shiftli(DisasContext *ctx, int imm)
 {
     /* For RV128 a shamt of 0 means a shift by 64. */
-    return imm ? imm : 64;
+    if (get_ol(ctx) == MXL_RV128) {
+        imm = imm ? imm : 64;
+    }
+    return imm;
+}
+
+static int ex_rvc_shiftri(DisasContext *ctx, int imm)
+{
+    /*
+     * For RV128 a shamt of 0 means a shift by 64, furthermore, for right
+     * shifts, the shamt is sign-extended.
+     */
+    if (get_ol(ctx) == MXL_RV128) {
+        imm = imm | (imm & 32) << 1;
+        imm = imm ? imm : 64;
+    }
+    return imm;
 }
 
 /* Include the auto-generated decoder for 32 bit insn */
-- 
2.36.1


