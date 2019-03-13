Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456H-00010e-IC
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h456A-0000SU-3I
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450h-0004Bx-JF
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:36 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33441)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450h-0004B3-BG
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:35 -0400
Received: by mail-pg1-x530.google.com with SMTP id h11so1693433pgl.0
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=WWYhGlfR+QxniywGBBQQv5AvX4xZxzsr+ZT3lsQI/+c=;
	b=Gx0tEdqi+VERrWx0QGUS7EWXZMJUgaCsjDz2mtnu7B2uhD+EtfY3Nh7kRCrov1gpGt
	w2Ld3JoxCX54s+/r0ilCxNn86RwLAS7cUlG/2Xy52fM/vlwsCxEkQKgnaiXmMp5mGSNp
	B/2+cBRDDNeokXeshPInk8CQ9zLEkzKwkHOokgjcgtTc398Xz7Aul5C4XUwEzHdU92BH
	KDM1b1FdtMJQdkT1rzl6jWwkXo7Xv8irEbRanMBIXJD/5g8eQSNoodBlMPkdzjxPWZ7O
	/TQefHChKXQ9cNErbtxkda2JF10KXT9EXcykXmlh5gmE6JWsHGvrXrWLKeba6EfgGYl0
	vycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=WWYhGlfR+QxniywGBBQQv5AvX4xZxzsr+ZT3lsQI/+c=;
	b=jdUDDuW4pnSQC83kLnndeItmDJfsIRsXgG4c8cNs90AIPubnlzgLBCT8EVlOQj4cbL
	h4xo2FAx9lN/8kPN88qSkclQhdPs8WQjLwHUE0E+6Evf+MPa1WoebSt6vmYzlKPQFGBV
	7TUcwsjuHqK6hJp3KCmNcExvEFoc1laEjG5SewPFc3D4uX3QdLpsgSc1ZEtZ9UapjUXD
	yAyHMru7TLsw4wkoAvt5P7jgNo5sAq56f7apmy8W5IdLQ70XtJFxycjtmGNLgPoMGv1K
	PO8Se372k6Ukwvsm0V/N8gol/X2PGzI0M/+eb4qoyWGps2IrtgNboLwRP38ug5S1jYw/
	Anqg==
X-Gm-Message-State: APjAAAWijSMYDXHOEPwpdMXho+wdlfKuh3MXLv68kmuVFNRDOf3LUkTo
	qwslGeGRb+BE85EiV5q9kT3on2rsb7xBfnLh
X-Google-Smtp-Source: APXvYqzhiClINFd3GBbFuvXRfxht2lY3qIpeu1itY5mvSQzu7ZMgCVTHnohQeJ1/0k8+OKEfcKg40w==
X-Received: by 2002:a17:902:380c:: with SMTP id
	l12mr34260853plc.238.1552487853822; 
	Wed, 13 Mar 2019 07:37:33 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	f10sm14594071pgo.55.2019.03.13.07.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:33 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:42 -0700
Message-Id: <20190313143705.29129-7-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
References: <20190313143705.29129-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::530
Subject: [Qemu-riscv] [PULL 06/29] target/riscv: Convert RVXI fence insns to
 decodetree
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:15 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvi.inc.c | 19 +++++++++++++++++++
 target/riscv/translate.c                | 12 ------------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1f5bf1f6f97d..804b721ca51e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -82,3 +82,5 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
 sra      0100000 .....    ..... 101 ..... 0110011 @r
 or       0000000 .....    ..... 110 ..... 0110011 @r
 and      0000000 .....    ..... 111 ..... 0110011 @r
+fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
+fence_i  ---- ----   ----   ----- 001 ----- 0001111
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 136fa54d0655..973d6371df85 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -318,3 +318,22 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
     return true;
 }
 #endif
+
+static bool trans_fence(DisasContext *ctx, arg_fence *a)
+{
+    /* FENCE is a full memory barrier. */
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    return true;
+}
+
+static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
+{
+    /*
+     * FENCE_I is a no-op in QEMU,
+     * however we need to end the translation block
+     */
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1ae84dcd5992..f720746cb791 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1950,18 +1950,6 @@ static void decode_RV32_64G(DisasContext *ctx)
         gen_fp_arith(ctx, MASK_OP_FP_ARITH(ctx->opcode), rd, rs1, rs2,
                      GET_RM(ctx->opcode));
         break;
-    case OPC_RISC_FENCE:
-        if (ctx->opcode & 0x1000) {
-            /* FENCE_I is a no-op in QEMU,
-             * however we need to end the translation block */
-            tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-            tcg_gen_exit_tb(NULL, 0);
-            ctx->base.is_jmp = DISAS_NORETURN;
-        } else {
-            /* FENCE is a full memory barrier. */
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-        }
-        break;
     case OPC_RISC_SYSTEM:
         gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
                    (ctx->opcode & 0xFFF00000) >> 20);
-- 
2.19.2


