Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq2i-0002hW-VJ
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2f-0002gl-Sq
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2e-0001jF-DV
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:05 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq2d-0001em-Qj
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id k2so12090830plt.3
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=hFKTZz6IPw1id8YoPgiQS2RYFfpvgs+5pIW5GhYLQec=;
	b=ah1tUXh/nTF/PFJ8S8wJcFu7t+hV6+kMWm0uxeRJMp/BVPHl1Nxw/azNCoh4L7PDhv
	LlAJd1sbBNGYItJ7bX/KOyBJTpa4bf9thtOqdMBpjninr6G8PmrMzYDyoOREQNnhXor0
	0rJlhKhNysf+TDfpnI231In8KJklAHeb/46L0uUFrIPFQL8ZAiMmfvK/G7cSyFIe1jA+
	YW09KdTTclNxztI+UjoY5GFgRqvzMJ/I4cq24ZObZ9cZpnwYN2dvCvqKkG2x+Akjc650
	ELBBWuyGj0lOFNwioqYTWNWSZih3h7oU+DNQFvsRhxc9ut1L2WH/KacYGbL/03BX3O3t
	QnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=hFKTZz6IPw1id8YoPgiQS2RYFfpvgs+5pIW5GhYLQec=;
	b=BJYOoKC23rRH8nNbSeUjES3VNHLsx1E/v9XQh5/uyUXy0mFY+X8ivXa+YI8ITFBFw3
	PJ4Hllgxy5Szrsg9bAhnnmYhh8a8ZUePPMxrmjZv3Mp+T/J8U3TnwN+NJFiosIe1z70K
	oouWIVovt4j7KadDpkqgMO55SDVeEqBtq8xFGKzANRB7sMiGaAWUJxf6F3z+6wtGkq7s
	LBh2QXy2OSdT5uWITuJ0KTJq3RnYRHaMsBuyPrRNgpUfhsy11Z37xPT8Hk7FHj1lUujK
	E15kSHwDZCBDsjh+0bI3UxNdHUgF2EtKXcnRYVhHOx2pc2eOrYdFf8d+pcycJoK0nSL5
	ggrg==
X-Gm-Message-State: APjAAAUoPt9q6Mt+wCrgM6NhfoDMUdoIXu0r6wvNu1pV7yWBhgc7S6MK
	dlzjGbHWLEiiLa8YqFMC8N46TA==
X-Google-Smtp-Source: APXvYqwif5UzxsQhiw55Uuooef5djyIu2g+M/6aOH2KF9wAgltOjSRah9EF1RQ+2kTl6Abg1nEo8Ww==
X-Received: by 2002:a17:902:b904:: with SMTP id
	bf4mr7577826plb.273.1551477001408; 
	Fri, 01 Mar 2019 13:50:01 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	b85sm62022227pfj.56.2019.03.01.13.50.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:00 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:14 -0800
Message-Id: <20190301214945.4353-4-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::62d
Subject: [Qemu-riscv] [PULL 03/34] target/riscv: Convert RV32I load/store
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:07 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn32.decode              | 10 ++++++
 target/riscv/insn_trans/trans_rvi.inc.c | 48 +++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 81f56c16b45f..076de873c4f1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -23,6 +23,7 @@
 
 # immediates:
 %imm_i    20:s12
+%imm_s    25:s7 7:5
 %imm_b    31:s1 7:1 25:6 8:4     !function=ex_shift_1
 %imm_j    31:s1 12:8 20:1 21:10  !function=ex_shift_1
 %imm_u    12:s20                 !function=ex_shift_12
@@ -33,6 +34,7 @@
 # Formats 32:
 @i       ............    ..... ... ..... .......         imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
+@s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
 @u       ....................      ..... .......         imm=%imm_u          %rd
 @j       ....................      ..... .......         imm=%imm_j          %rd
 
@@ -47,3 +49,11 @@ blt      ....... .....    ..... 100 ..... 1100011 @b
 bge      ....... .....    ..... 101 ..... 1100011 @b
 bltu     ....... .....    ..... 110 ..... 1100011 @b
 bgeu     ....... .....    ..... 111 ..... 1100011 @b
+lb       ............     ..... 000 ..... 0000011 @i
+lh       ............     ..... 001 ..... 0000011 @i
+lw       ............     ..... 010 ..... 0000011 @i
+lbu      ............     ..... 100 ..... 0000011 @i
+lhu      ............     ..... 101 ..... 0000011 @i
+sb       .......  .....   ..... 000 ..... 0100011 @s
+sh       .......  .....   ..... 001 ..... 0100011 @s
+sw       .......  .....   ..... 010 ..... 0100011 @s
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index bcf20def50eb..d13b7b2b6d8f 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -82,3 +82,51 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
     gen_branch(ctx, OPC_RISC_BGEU, a->rs1, a->rs2, a->imm);
     return true;
 }
+
+static bool trans_lb(DisasContext *ctx, arg_lb *a)
+{
+    gen_load(ctx, OPC_RISC_LB, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_lh(DisasContext *ctx, arg_lh *a)
+{
+    gen_load(ctx, OPC_RISC_LH, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_lw(DisasContext *ctx, arg_lw *a)
+{
+    gen_load(ctx, OPC_RISC_LW, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
+{
+    gen_load(ctx, OPC_RISC_LBU, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
+{
+    gen_load(ctx, OPC_RISC_LHU, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_sb(DisasContext *ctx, arg_sb *a)
+{
+    gen_store(ctx, OPC_RISC_SB, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_sh(DisasContext *ctx, arg_sh *a)
+{
+    gen_store(ctx, OPC_RISC_SH, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_sw(DisasContext *ctx, arg_sw *a)
+{
+    gen_store(ctx, OPC_RISC_SW, a->rs1, a->rs2, a->imm);
+    return true;
+}
-- 
2.18.1


