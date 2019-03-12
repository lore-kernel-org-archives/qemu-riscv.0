Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUh-00042j-RK
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUe-0002wr-EP
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGJ-000877-B5
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:09 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGI-0007yn-NP
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:07 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a22so1786296pgg.13
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=ToX/SXdJ161autvl4ZZt2ntjrkT+rRoe3YT2cC0hsfE=;
	b=EMV7jdYeX2X7rNw+tP3UOlXI+R/GACpL7w42xS9pU5MpSeT5JAOvjqNe3mcItG2JHm
	HhzOoNYYmicFduijLR7VbT9rlsyRHDSSe2WWF0CUIZzmBXQkIK3pRTHYFgqF62M9Hof+
	XfPl1m914Z3Q8pt9SOUYnigHYcOU9sNdnsSu7Y1RweYIQF+mx3UIT3IIsr1emobznse7
	H/37EMRW1HiYrKSUzgtt1JzdIp4YPh/1O2QoqqyghNqnfdfl2fob3S1nkPFfHVnld/DU
	iJ+N2cGX5zrxbVMctb1+Yeh2ZhLw33nSXKvu/LgdIexPutTILLOEzGKEqi6UZoVmnftA
	G36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=ToX/SXdJ161autvl4ZZt2ntjrkT+rRoe3YT2cC0hsfE=;
	b=hsjAKOxd90PACAMOn4KfAOImbuHXBUvmhfMgxw1DF0kPV6SpxdlPCcjeauWwxO3H24
	B2/MyX+8lEXKK9lGRTJ6d6FQLEov76Uu2RyUYjUheWCb+sO3Egczhw58kFzN9+G/j+Ab
	z1k/Srl5vUtaDctsaJA1wIJWU1IUK7yO1tRCimjTBXKpX7GSydlVi2w23DQYCS2mleku
	ssgNuwbNm84s9E2FNFQrhP2oQaLHnTgkNsvLBN3hF0f9AXa1U9/o/WHXvhHPEfEkG3xw
	JCXxeFuWXGt5MH4K1X+zjgSeBbHdgzr1M0wgA+C9KXZGDrWVEnwRJaKxuD26IQTd9rhT
	cKtQ==
X-Gm-Message-State: APjAAAWJwoF3Yfnl0m2WVwbmBkMji18swG2fcKnUdPnwq2Q2LTl5uMCe
	dW9JrmvIVedj0pW6gDm6yFuHfw==
X-Google-Smtp-Source: APXvYqyc8DTPAShp0mOzSFtvrkORSuJlMP6COVIYBZi00fHvUsHtqgEtCsgW1PwjQ7zpijU0tfbLsA==
X-Received: by 2002:a63:4e1a:: with SMTP id c26mr34757462pgb.175.1552396560926;
	Tue, 12 Mar 2019 06:16:00 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	u11sm32968820pgq.28.2019.03.12.06.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:00 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:03 -0700
Message-Id: <20190312131526.14710-7-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::52b
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:58 -0000

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
2.19.2


