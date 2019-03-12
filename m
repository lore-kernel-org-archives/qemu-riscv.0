Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUo-00048K-5q
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:31:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUh-0002wx-Eb
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hG5-0007qm-L4
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:54 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hG5-0007qC-D9
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:53 -0400
Received: by mail-pg1-x52a.google.com with SMTP id h8so1814119pgp.6
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=R8uXdJpPgTupkhE1qFvGxX8i+zl6nFv6jUsFP1lbGhM=;
	b=iY98PPgXV4z1atP0lLt9aCVIjtBGFlb72ZeDS9YrZJBJog7AxqDuxpIV9vOoExXt3I
	zNfGwL2U0b59lqro1z9zAH8o9TD5gs8gTWXwQnx/0OrUG916sqOCs+eE1ZbFhO0b5592
	OEl8FCye/1fr3I6JePpw0aPHt2DjUndIFAbEU1WDuzhYadE1cGFsrlJG/EoPyeKAKuEL
	tJtM6kbvKFVszm3uyKbZIqrALWjs7hShF+6Q0D55W++WJmlE/4i90KMuaPG/a1mH3z5p
	Ij3bzurIXzUVso4gKhtEG0zbygxF4iAnAYnkqIFfwjV+DYN8HdVNnqWasSYkCaM6z/OC
	5eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=R8uXdJpPgTupkhE1qFvGxX8i+zl6nFv6jUsFP1lbGhM=;
	b=tySH664Bk+5/ZelN3KnGKx/fGsrTIhruPDWhZUKll7QB4Jk3oqWtR1/HnrEvhEw64X
	8ZWGhfIyGXik19vXMzZJ7ZL58s2Crl+h0i3KHvvdNqgu7CSwTG0DfzpfgO/prKjheSKc
	WviBX1uUNnVQC5q8Nu1a6B03nov1NkzKZoLD7DWA3sEsdJfExu2DyiKefuHWwGRUlLgz
	9TPYoKYDThFrXyQ+H5+MT0csejen0wTieHZuwFTqgOZhlNG5V4b/CZEEEgEHkubF7jed
	uq0hCjH06smGAT+qPrz8TeJdyOnYyT7ByEWUKS86iILOXYG6wOl6CttphjER9gEYugu1
	ZR5Q==
X-Gm-Message-State: APjAAAXLrfAbKxa6iP+B8/Au68cFMAtgqhSBIm3/W3Df68FTENVaE+ho
	L/c2/Slm9JGL8kF9vKIQ2WCEUg==
X-Google-Smtp-Source: APXvYqwZU6mVsHuf+T0tEqe/WbPjRZu9M/E8w3vZ9fCfaH8IkQurjAvXYGqD3XeqsiTzMqPlXDFQBQ==
X-Received: by 2002:a63:c804:: with SMTP id z4mr9527179pgg.228.1552396552330; 
	Tue, 12 Mar 2019 06:15:52 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	v12sm12002331pfn.25.2019.03.12.06.15.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:15:51 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:00 -0700
Message-Id: <20190312131526.14710-4-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::52a
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
X-List-Received-Date: Tue, 12 Mar 2019 13:31:03 -0000

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
2.19.2


