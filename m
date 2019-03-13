Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456F-0000xU-Ec
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h456B-0000Ro-FJ
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450Z-00042R-DS
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:29 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46248)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450Z-00040m-8H
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:27 -0400
Received: by mail-pf1-x432.google.com with SMTP id s23so1499796pfe.13
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=SheaVEXgAq4P9MXoQbJ/WXmVEoB3bxNZ3epjl2RqUfI=;
	b=OVmx/gwa3FRnRqgyRYXIp5HLNRUWGSKn0xkOicPvREO1vHK0Vsrklyea/lsNwpiNGR
	dqOXwTaS0GgspWOdWKe8yWFNHs+Hs+IFRaOqalJ7CqUSIFapzNWURslRTMkIvZDqGkcx
	fYx+HOLtDYypz71NHmW4bUDN0gpiKgfKFNVT0UpcZhPN0vqEVBWhWfNy8fcH9UAonWUs
	qgYqTBLuH80gKjSWvvY4QGlM8eIjDy/FWlE2hbh1mU/o6NRighiCNtwgQjrGrdeLybXC
	4/Q51oQMad5oDuD5DfY3rY8fUu3y0nxzUUkOe4gQrYIlO3fmVBJP+cOk0z2vZPx4qC9v
	96UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=SheaVEXgAq4P9MXoQbJ/WXmVEoB3bxNZ3epjl2RqUfI=;
	b=N3yC7EsY/n5XQJ8he5oQTf/S3aZlb3epwcZ/n9n02K+/iszU048MhNLIas2EQj0Y0f
	Rdy5tt4BqL4eBkUyiaYE49Z7CZNEdpdKPaqDPKDQxf/8/6dQbRqZh4fCfjmBK/EDX5B6
	ktYhyrx9wd79CkOoQzWzLhcj8WkdaYm5y3fgRIGdiwrGko+ASEbNcnGDEhoSvUk40Ku9
	MbuIJBifBQbfKJBUGO9qfJIVlSaxMH0te1tO9uRL6NI5Qd4ONpacsVqNTQLpKjiTfKEu
	mPY0JU42cllLkox39YCBzrmjGKC2XvsQ1iioU3gDdHjF9T2uK53rnZm69j+uIjLUEmyY
	G3IQ==
X-Gm-Message-State: APjAAAW55heJpGSX7YapXZCKkMKp0g3N5EiVvi4CfvJLKA155rU0va60
	6PRi8hUYYRX2oxMNZBU9WtZF+wwr1ihThH5w
X-Google-Smtp-Source: APXvYqwROvIejl+vhmPwnEpLBmG42lhtwfLmTgQ6fMIZfft8mxxUi0G7nILEzOtLaqUGX55AkQjjuQ==
X-Received: by 2002:a62:41cc:: with SMTP id g73mr43504827pfd.145.1552487845851;
	Wed, 13 Mar 2019 07:37:25 -0700 (PDT)
Received: from localhost ([122.146.90.161]) by smtp.gmail.com with ESMTPSA id
	u26sm16406570pfn.166.2019.03.13.07.37.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:25 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:39 -0700
Message-Id: <20190313143705.29129-4-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::432
Subject: [Qemu-riscv] [PULL 03/29] target/riscv: Convert RV32I load/store
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:16 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
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
2.19.2


