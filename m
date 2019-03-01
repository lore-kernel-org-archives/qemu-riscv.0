Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq38-000392-Bx
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq35-00036K-FA
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2r-0002Dq-67
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:21 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq2h-0001pv-Gk
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:14 -0500
Received: by mail-pl1-x632.google.com with SMTP id c17so8910564plz.13
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=/1mElAx7dGEjmoPQT9pBMAWfFIq7yVnDAy3YZPEjXVo=;
	b=jsc2nUPw31Fd1CU43RR8VhD/h7VLXO7h+9JhK3hnQ08+/qreJeFtYF1eDZZ4jCTsmA
	hcE3fqPFMW57JkVoOC5kDGoaBLcMGBXHqAc3F7YcNypFvGD6r9NPlPHYt/HMFQRtf9ur
	rhTi22MqFbFhnDmUJ/8WgNApJNkLR0Bk46N3wjWGe7hc5c+Opp/p6qHaQqLGjYQKdbp8
	hzh22lu8PyBpDhoPoNRhn1iNLd9CgIlSjfI2PKKfcDeYPjqRP7GzaSK58DQqdLfPgj0Z
	lq8vjpBxYVGVjg6/56zEtlkmJLuc6YvQzsSRMvrfbcLlQouzYiMYs/7a231F+sHQ8r6W
	4EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=/1mElAx7dGEjmoPQT9pBMAWfFIq7yVnDAy3YZPEjXVo=;
	b=saJWKWKB4s9Gz07A6Jje393ONG09MKtU9Mv+2bS4lnPA89ETlqgWHuS9bNVl/9wYmR
	J+h3Au5aECgzU2JGL5Rt1xhdCYHd7j94c02vcWj7oD5AnERWYWhyXaLQQACXzw60ECi5
	DYusPnAG9CgQ50SIsz5rMYoaz7rPOsuU81ozWKbnwlv45lormV9N3PJ4TvVSPe9a0zNH
	Y8zMxqh+WZSmB+jWST4O3ec86GCW8sl70Jh4NBzsSEBfM2hBMz/Aa0DfswktGEAeda/x
	GJTls9QlqNoZf8XpNNeFSyN0mnA6jZX7/ZvNK61W/P9uNCNn3NwUthTiI0C/NwbMFkVa
	mb9w==
X-Gm-Message-State: APjAAAWPQHLqUtHPCmMhe3dQ4ghlO7b4ECEjrFMrfpdD0zxGcuz57YA/
	Oeh7LcrMhYJUW0e4sfjUWOQTWQ==
X-Google-Smtp-Source: APXvYqwE/MJAh1uU7jJ5pQzua4Pya7uDfDc3c0WI/K9vEHo9ztnl6Q1CIN/+iunt7a4ENZ6IbuPRaw==
X-Received: by 2002:a17:902:1:: with SMTP id 1mr7368684pla.276.1551477006513; 
	Fri, 01 Mar 2019 13:50:06 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	b8sm21548550pfi.129.2019.03.01.13.50.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:05 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:17 -0800
Message-Id: <20190301214945.4353-7-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::632
Subject: [Qemu-riscv] [PULL 06/34] target/riscv: Convert RVXI fence insns to
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:33 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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
2.18.1


