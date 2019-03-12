Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUb-0003vm-9a
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUL-00033q-0s
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGz-0000G1-Pw
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:50 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGz-0000D6-G6
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:49 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h11so1843502pgl.0
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=sbnoVSR5Iu7X5DM0FylzGKu8vzx715pOrS8M38jMGuQ=;
	b=Cex+8sz8gY1lyvtN6NB3qtvcDf26+ZJKg6NDgNce8EoD/6uy0D74J2T0F/JgZzqTIi
	OY2GqDm+Waexbsr2R5PO4SNrQyX21PSa5/S8mY5nWRa79VxRn1kYoaPrpk/RjvUYJEQd
	2i8mB/mqNN0ikL8LNnzlNUTP5TAOwvqvHwPYdl/+RO3jxnorqao27YuRQBw0D52wrBr+
	YjWpdgZZ5eQxiV72hcADV19sYFU6Mrn8L4gjbOnt9sto323rZxuUsNm2YmRxUn11TuJL
	VmwpO9m8bzNigR1Z120re7X3oIKr0pu9EVN/Livt2WBzt1BBUPaE3j+qDgapoxRJtzyt
	wsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=sbnoVSR5Iu7X5DM0FylzGKu8vzx715pOrS8M38jMGuQ=;
	b=X8Uy5bOHETOIQfzOxM01GNJPtUJpjG/5M+ryVInwP+PxefaUqfdXspdxecS5sW2EQL
	9lovAhAsYYsWVPCP1MjoHqGj8zH8BYO9SzFnFwbLiTscdNFxMNZZ4fL7p/UGjPefOIvH
	4Po6x5S0BE/jbjBN+r6HZqQNkDVAQDYn25fBgK8zYlfhHxtmgwqpYr2EereRXTTHgFLr
	q5AFu04w1o2w0lMZDyXw7WvwhIkO17E9lgUVpiq48E2AqDC+Ej57xn+a4FYNGLPHfv2t
	UA3cOpARkDT2ajiPKkJhOSPtoPYl9ztscvPRpsO8OjjGNXcKvg9L4+f9MT6YYq3re8GK
	Mb/g==
X-Gm-Message-State: APjAAAV8JsilLglaJB0KWpUMGqhTsXn7IkdKTfg1p1i1Z2gyaYVFrqzE
	d80KNoNtTPoCSLKY+nLz217JaQ==
X-Google-Smtp-Source: APXvYqwyjyR9Zd9HZKaxcgrmwa6dDccXGphGjboJXjGnZj9nch6L/HfkblECsriguRHaITzrZ1hw5w==
X-Received: by 2002:a17:902:8d97:: with SMTP id
	v23mr38516330plo.274.1552396607460; 
	Tue, 12 Mar 2019 06:16:47 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	s4sm13091159pfe.16.2019.03.12.06.16.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:46 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:19 -0700
Message-Id: <20190312131526.14710-23-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190312131526.14710-1-palmer@sifive.com>
References: <20190312131526.14710-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52f
Subject: [Qemu-riscv] [PULL 22/29] target/riscv: Remove manual decoding from
 gen_store()
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:49 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

With decodetree we don't need to convert RISC-V opcodes into to MemOps
as the old gen_store() did.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 27 +++++++++++++++++--------
 target/riscv/translate.c                |  8 +++++---
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index cc361ed4d151..5a09c6335ae0 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -168,22 +168,34 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
     return gen_load(ctx, a, MO_TEUW);
 }
 
-static bool trans_sb(DisasContext *ctx, arg_sb *a)
+static bool gen_store(DisasContext *ctx, arg_sb *a, TCGMemOp memop)
 {
-    gen_store(ctx, OPC_RISC_SB, a->rs1, a->rs2, a->imm);
+    TCGv t0 = tcg_temp_new();
+    TCGv dat = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+    tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_get_gpr(dat, a->rs2);
+
+    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
+    tcg_temp_free(t0);
+    tcg_temp_free(dat);
     return true;
 }
 
+
+static bool trans_sb(DisasContext *ctx, arg_sb *a)
+{
+    return gen_store(ctx, a, MO_SB);
+}
+
 static bool trans_sh(DisasContext *ctx, arg_sh *a)
 {
-    gen_store(ctx, OPC_RISC_SH, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_store(ctx, a, MO_TESW);
 }
 
 static bool trans_sw(DisasContext *ctx, arg_sw *a)
 {
-    gen_store(ctx, OPC_RISC_SW, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_store(ctx, a, MO_TESL);
 }
 
 #ifdef TARGET_RISCV64
@@ -199,8 +211,7 @@ static bool trans_ld(DisasContext *ctx, arg_ld *a)
 
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
-    gen_store(ctx, OPC_RISC_SD, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_store(ctx, a, MO_TEQ);
 }
 #endif
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 99d6d3b4ae91..cdc08b1bff20 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -56,6 +56,7 @@ typedef struct DisasContext {
     int frm;
 } DisasContext;
 
+#ifdef TARGET_RISCV64
 /* convert riscv funct3 to qemu memop for load/store */
 static const int tcg_memop_lookup[8] = {
     [0 ... 7] = -1,
@@ -69,6 +70,7 @@ static const int tcg_memop_lookup[8] = {
     [6] = MO_TEUL,
 #endif
 };
+#endif
 
 #ifdef TARGET_RISCV64
 #define CASE_OP_32_64(X) case X: case glue(X, W)
@@ -551,9 +553,8 @@ static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
-#endif
 
-static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
+static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
         target_long imm)
 {
     TCGv t0 = tcg_temp_new();
@@ -572,6 +573,7 @@ static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
     tcg_temp_free(t0);
     tcg_temp_free(dat);
 }
+#endif
 
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
@@ -736,7 +738,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
     case 7:
 #if defined(TARGET_RISCV64)
         /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
-        gen_store(ctx, OPC_RISC_SD, rs1s, rd_rs2,
+        gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
                   GET_C_LD_IMM(ctx->opcode));
 #else
         /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
-- 
2.19.2


