Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwsH-0000vV-Ne
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwsF-0000tE-9S
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwsD-0001C5-Ei
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:54:58 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwsC-0000uR-78
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:54:57 -0500
Received: by mail-pf1-x430.google.com with SMTP id h1so1321570pfo.7
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=LXBF32AaANmz5XWbuwT7of+5Guxbigkz/EGiNqeSByw=;
	b=GJU6XaH8H1Mk/vW8AsDBinleM6Uz7OXkNGWQUCV1V8x8GftOnfU9vG+frvKHh2qGQS
	t9rXdYiOFzplSRrLsp5ZAWXmbe2j4bHnlf8AKD1eXiu0SKR/rcRvEtq/Y/tyG1tVM0Rg
	GZc5tJ+Xt5zD2hFMN6opxyzf2LuxLy8jl0JE9fuE+O9VekoyyockG1TpAU8iP5/1bgDX
	vw0GaTD7JAm6GdySPOxZu083Z3AePpxySTIgpl1GDmWwFg7e5mYIZGbGc9lnxyEVQzli
	5TkVhXzNJuzNlINgfiogWitWlWxH2Ti3zvryr8+hA0CpsoZfpwWapn3crpB+K4bPLVqS
	UUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=LXBF32AaANmz5XWbuwT7of+5Guxbigkz/EGiNqeSByw=;
	b=Yq3RtY3EKgUyWxkwx3ZZq2Ps3bdKJUVyrqiq3nq6QZ7YfIK6k6g6dV3UfLUF/4Up3O
	3ESLNSrCQAizcMV5cIC2UFQsMhJqLsGJZNKoNIOO+pRbIE63AoPzYk5t7QyI/+LBsvhb
	YqfLsRjRr6/17E831mlbvEdhpfiYRoRXkFznMcl8uAlII1BqLUeLV85xD7a6rkop5lYg
	8qiZRB/fAG3DrovYlmPGo8IfVdcpD7w7H1booHLHq9Ki5s+9jlwI2L3QoR7xWfD3BbrN
	pbPEKCORyK+pA9wFMDKCClgsnqa19B/iv7ro+IIVoOKANsXcL/98p6CUDSOfwh4SvvVD
	dH6A==
X-Gm-Message-State: AHQUAuY6eF/vdldJS7aW/2+UYW3IUDZNWldMOKU6juZcJf3Aab2Qy59L
	yAb5cjC7l5/0+A0FtPX7xyE7t6qmPe0=
X-Google-Smtp-Source: AHgI3IaT0sk+NJQBO6jnLV8vXtnZiyuwRJwiELHnGC0HLDzcrr5gPXumiVs3eDBhAYY8Vzc8qFx1hw==
X-Received: by 2002:a62:5287:: with SMTP id g129mr1193683pfb.22.1550073283360; 
	Wed, 13 Feb 2019 07:54:43 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	e21sm80141252pfh.45.2019.02.13.07.54.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:42 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:43 -0800
Message-Id: <20190213155414.22285-5-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: [Qemu-riscv] [PATCH v7 04/35] target/riscv: Convert RV32I
 load/store insns to decodetree
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
X-List-Received-Date: Wed, 13 Feb 2019 15:55:00 -0000

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
2.18.1


