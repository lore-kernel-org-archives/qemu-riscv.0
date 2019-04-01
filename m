Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAnN3-0006rF-MS
	for mharc-qemu-riscv@gnu.org; Sun, 31 Mar 2019 23:12:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnN1-0006oL-1C
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnMz-0002s1-R5
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:23 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hAnMz-0002qp-G8
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:21 -0400
Received: by mail-pg1-x544.google.com with SMTP id k3so3987165pga.6
	for <qemu-riscv@nongnu.org>; Sun, 31 Mar 2019 20:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JUQH54WlqWGm8qyK2Q0VFVzTkdAZArTzYx2vwJJCIVI=;
	b=GD0V5uMURb1QM+rZt7wGIQ5Met93OWvQpXKF0JN9RT/Y/FDsmy6j4ZF9YkmR2At3Z9
	g5ExvDJcQSzya65ef+53d1P+TQKS611GqCOiGOBVxe6D0hN7NIl63IGsbv97V8yz5xQp
	nJOhbXBZradEvA41045luL20QmPiejGtbu9p3bXVJWjC1ohyUnC7gR97OHH3CVLPZE4n
	yfTW/1WV71rprSsELS3BKgHKApID/3xrXVff1PBD0VZ3xFg/XNW5ExzFZEYqUsL/S1zX
	ptS2G4sqYdVSdnM+wv1nyu5kfoN14IpuyfxnnAPvdzyrTm01pO59thqTqi6/oJC5E7/M
	miGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JUQH54WlqWGm8qyK2Q0VFVzTkdAZArTzYx2vwJJCIVI=;
	b=Go8DyWOWrtDnzHk0LLdoNwCFWpxdlPGIxhxNnTfBUhjGozhJ06f0ffHE3B74Z/io7D
	p78i11bDL2NO1jZcVFNlZkZ0rRLDdbDulhP+YAwAPB6KWvGsnttz4THpMg+McVKAkaP8
	YlhD23jHh7/eGk3Eyla5Cw50YzptbMUhWhKoz2jX2ZEWazPjt4QHmZ+meLGl/MVmICXz
	kBktlGeRvbOsEhF6eMMs6nWyZ4Zk2DfVbVqdBONcPmZI3OIXZ38zopNKa78zBUdlJLKi
	MEy4S3sjSNmqZ0ypjeRGgZg3cxxkA2qKntLJFc74tthwDsoy4hia3ytHI5pn8Rbr7cvz
	ai0w==
X-Gm-Message-State: APjAAAVgUs+n6t9UY+RfDVf5vZOon1RJJjwCeOUVDBspVAAitMIR2689
	UslaNEyKxqPmYaRndDa9cyVEmg==
X-Google-Smtp-Source: APXvYqzTdRFtojuCNnW0xKO8vqyCJzYlwSorBVwiCOXuftNt4+vRJznWLwcfd1+uv72nUQCt8npZag==
X-Received: by 2002:a63:d5f:: with SMTP id 31mr12260960pgn.208.1554088339769; 
	Sun, 31 Mar 2019 20:12:19 -0700 (PDT)
Received: from cloudburst.imgcgcw.net ([147.50.13.10])
	by smtp.gmail.com with ESMTPSA id
	c1sm11843954pfd.114.2019.03.31.20.12.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 20:12:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com,
	palmer@sifive.com, qemu-riscv@nongnu.org
Date: Mon,  1 Apr 2019 10:11:51 +0700
Message-Id: <20190401031155.21293-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190401031155.21293-1-richard.henderson@linaro.org>
References: <20190401031155.21293-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-riscv] [PATCH for-4.1 4/8] target/riscv: Merge argument
 decode for RVC shifti
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
X-List-Received-Date: Mon, 01 Apr 2019 03:12:24 -0000

Special handling for IMM==0 is the only difference between
RVC shifti and RVI shifti.  This can be handled with !function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvc.inc.c | 47 -------------------------
 target/riscv/translate.c                |  6 ++++
 target/riscv/insn16.decode              | 12 +++----
 3 files changed, 12 insertions(+), 53 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index dfb46a2348..691b1e2725 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -97,37 +97,6 @@ static bool trans_c_addi16sp_lui(DisasContext *ctx, arg_c_addi16sp_lui *a)
     return false;
 }
 
-static bool trans_c_srli(DisasContext *ctx, arg_c_srli *a)
-{
-    int shamt = a->shamt;
-    if (shamt == 0) {
-        /* For RV128 a shamt of 0 means a shift by 64 */
-        shamt = 64;
-    }
-    /* Ensure, that shamt[5] is zero for RV32 */
-    if (shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    arg_srli arg = { .rd = a->rd, .rs1 = a->rd, .shamt = a->shamt };
-    return trans_srli(ctx, &arg);
-}
-
-static bool trans_c_srai(DisasContext *ctx, arg_c_srai *a)
-{
-    int shamt = a->shamt;
-    if (shamt == 0) {
-        /* For RV128 a shamt of 0 means a shift by 64 */
-        shamt = 64;
-    }
-    /* Ensure, that shamt[5] is zero for RV32 */
-    if (shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    arg_srai arg = { .rd = a->rd, .rs1 = a->rd, .shamt = a->shamt };
-    return trans_srai(ctx, &arg);
-}
 
 static bool trans_c_subw(DisasContext *ctx, arg_c_subw *a)
 {
@@ -147,22 +116,6 @@ static bool trans_c_addw(DisasContext *ctx, arg_c_addw *a)
 #endif
 }
 
-static bool trans_c_slli(DisasContext *ctx, arg_c_slli *a)
-{
-    int shamt = a->shamt;
-    if (shamt == 0) {
-        /* For RV128 a shamt of 0 means a shift by 64 */
-        shamt = 64;
-    }
-    /* Ensure, that shamt[5] is zero for RV32 */
-    if (shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    arg_slli arg = { .rd = a->rd, .rs1 = a->rd, .shamt = a->shamt };
-    return trans_slli(ctx, &arg);
-}
-
 static bool trans_c_flwsp_ldsp(DisasContext *ctx, arg_c_flwsp_ldsp *a)
 {
 #ifdef TARGET_RISCV32
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9e016d8e50..a1cd29f80f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -538,6 +538,12 @@ static int ex_rvc_register(int reg)
     return 8 + reg;
 }
 
+static int ex_rvc_shifti(int imm)
+{
+    /* For RV128 a shamt of 0 means a shift by 64. */
+    return imm ? imm : 64;
+}
+
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
 
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index d0cc778bc9..add9cf3923 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -30,7 +30,7 @@
 %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
 %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
 
-%nzuimm_6bit   12:1 2:5
+%shimm_6bit   12:1 2:5               !function=ex_rvc_shifti
 %uimm_6bit_ld 2:3 12:1 5:2           !function=ex_shift_3
 %uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
 %uimm_6bit_sd 7:3 10:3               !function=ex_shift_3
@@ -94,9 +94,9 @@
     uimm_sdsp=%uimm_6bit_sd rs2=%rs2_5
 
 @c_shift        ... . .. ... ..... .. \
-                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%nzuimm_6bit
+                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shimm_6bit
 @c_shift2       ... . .. ... ..... .. \
-                &shift rd=%rd rs1=%rd shamt=%nzuimm_6bit
+                &shift rd=%rd rs1=%rd shamt=%shimm_6bit
 
 @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
 
@@ -114,8 +114,8 @@ addi              000 .  .....  ..... 01 @ci
 c_jal_addiw       001 .  .....  ..... 01 @ci #Note: parse rd and/or imm manually
 addi              010 .  .....  ..... 01 @c_li
 c_addi16sp_lui    011 .  .....  ..... 01 @c_addi16sp_lui # shares opc with C.LUI
-c_srli            100 . 00 ...  ..... 01 @c_shift
-c_srai            100 . 01 ...  ..... 01 @c_shift
+srli              100 . 00 ...  ..... 01 @c_shift
+srai              100 . 01 ...  ..... 01 @c_shift
 andi              100 . 10 ...  ..... 01 @c_andi
 sub               100 0 11 ... 00 ... 01 @cs_2
 xor               100 0 11 ... 01 ... 01 @cs_2
@@ -128,7 +128,7 @@ beq               110  ... ...  ..... 01 @cb_z
 bne               111  ... ...  ..... 01 @cb_z
 
 # *** RV64C Standard Extension (Quadrant 2) ***
-c_slli            000 .  .....  ..... 10 @c_shift2
+slli              000 .  .....  ..... 10 @c_shift2
 fld               001 .  .....  ..... 10 @c_ldsp
 lw                010 .  .....  ..... 10 @c_lwsp
 c_flwsp_ldsp      011 .  .....  ..... 10 @c_flwsp_ldsp #C.LDSP:RV64;C.FLWSP:RV32
-- 
2.17.1


