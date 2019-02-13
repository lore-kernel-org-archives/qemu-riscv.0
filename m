Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtI-0001s4-2S
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtF-0001pK-DL
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtD-0002fW-C9
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:01 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38172)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtB-00011z-CE
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:57 -0500
Received: by mail-pg1-x533.google.com with SMTP id g189so1312542pgc.5
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=UqruLD0D3gmwyXgIGQ4bTHq08y9NO+xuyJhuaPWdkSw=;
	b=AcGOYgNKfZ6M3/uWz04xJVW37qgiDkvMkPiwQqj9Wm1lBXGLsUF0WWuBr7M2G8rZsi
	KT/CvNylps4LQSc5/DI8ZqSxHnu9osvIB9YPPSUO9ZtpTbI1vGVeb5A3ZayfCeD2zAAx
	oY3JTmypjLB7FlxYQRr01HYZiDi5QNoFbKbg7Qxm6338qdpgnAqLT43hiv1aV0TbZ+Cg
	gzEUwZ1TTGNDgJ0iLsQ4Ij1EEXuFCgGL2OGOlwYVR3tQEsUAkJXVZwUBFI7HZ05Rt8HA
	R5iorGX3mh+4k6pIlTrm4dEKdCppKn/0OATXErh0OFDYhDDK8w94v4atFEqj7fn/z2Kz
	aSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=UqruLD0D3gmwyXgIGQ4bTHq08y9NO+xuyJhuaPWdkSw=;
	b=nxX3CK+cXyUj2fer8bWPVFcUCKF9817FyutJRbi07wtwClyVfOlyre5iEx9zi3pQ9Y
	2ut1NP7g9l7y1JFkOGI6Gh5aR1y2ugZrhNESbRhGy/8366OWPlK1za1qGDKbGFOWcKht
	lx86cGVNGmvJW6gpmG1zpi5VC0QoVp6J3wJtNDSLXv6ziMqB+3yVDz9jBSalgGoQj2dn
	ChlKvcaMhthm2cLkGBQJTLCTatHgxBnKvHZ8KiPhG3591DqA1TkavnUYeDXsh7lefHmg
	vQptDGM/MHS88HdGYUehGn5GerJguEBiuYKz55oLIikjgxzwJwFjdyhaZyanvCS92b4f
	DO2g==
X-Gm-Message-State: AHQUAuYXeQSTJ59cJ8IK13nd3+IvF0o7NLYyn7cxCpb7moo2wA9+S5xX
	8sZanEHpabsjE+9EVuE3wBXm0w==
X-Google-Smtp-Source: AHgI3IYHxgRSz/Cj4xF37hLgjE9RTFijjQacKMPnweywz/KfvlgFTvN/8eK1hG+q1kaMtT5I6D1utg==
X-Received: by 2002:a63:5d5f:: with SMTP id o31mr1064943pgm.414.1550073288213; 
	Wed, 13 Feb 2019 07:54:48 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	i71sm40222644pfi.170.2019.02.13.07.54.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:47 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:46 -0800
Message-Id: <20190213155414.22285-8-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::533
Subject: [Qemu-riscv] [PATCH v7 07/35] target/riscv: Convert RVXI fence
 insns to decodetree
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:02 -0000

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
index bb02ef23e791..442e75fc40fb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1951,18 +1951,6 @@ static void decode_RV32_64G(DisasContext *ctx)
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


