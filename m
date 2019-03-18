Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5kux-0004uT-QZ
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 01:34:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h5kus-0004tM-9V
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 01:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h5kol-00084c-L8
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 01:28:12 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h5kol-000847-EK
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 01:28:11 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 8so7077916pfr.4
	for <qemu-riscv@nongnu.org>; Sun, 17 Mar 2019 22:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=lZsBxQxcC7Jt7E+FSq2SRc95WuPZFTJA3coHN960W4w=;
	b=cE/woTUhz14F1+qG0AGAR0TqEH67yd8luduoJgahB3iPqTLhsB4FS8fFz7h6k9yOhb
	/fiuHfgnB4VNh25GsiZlIoLQSMKusU9DXhP/jfsBoHFgaVpPq03+FEkO/uXyupPYlPRE
	dazZc2KdQ7cuod8XNNvzNnluxmOfOmqCRKkN+M5AtFGfVAUl+oCUQaGC0GByYP+vlZGQ
	o+WdF6vYuP/S/HOGdrmoE81BPp3kPbB7EVO4PlcppEEQLn3HztYyyV9nJmEvPR8h7Bzb
	7jHlQMK6+X8RAFtdkNDuaAp4Q0TUOD4kgWfgX2cKFPxEJurI7Fm/bXshpC2FAI7N6M68
	oazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=lZsBxQxcC7Jt7E+FSq2SRc95WuPZFTJA3coHN960W4w=;
	b=L/IWifUlSJ4DLrA1YsswcdM/Kb9qEqR7s4NlPAzIb15ML5k4kFdPkZ4FKh2e3ApA1y
	LR1HlXgYoFn2S1ZrTh8ghfTkdXpKwrV3sLnFf2kDEHAV8r9DvHSX1/Ft+bsZYsUsEi3T
	qrwt+HiKNANi9PMOEJ2f+vw67n7ywRXpFZlSp/nFyQtUJpR1yaZ3Ep+2EQYIhMGXpZKZ
	M295TsAPIPK+0Dkm56u47ELpChO8m7uEppUeGtEHeRroqxxrkVF+F8KZrIQubyc8ii/2
	NAxtrIkFMsCJ4rymQgNFX1jyT1rGdNea21modgH+t2xxwAN5NumBwzWdc1z4x/4fIPQO
	e+sw==
X-Gm-Message-State: APjAAAXMrFcdq194hCGoYfp2/9hK8Boa9ahu340rUhmFgeGi2TrkLGsT
	O+Ut3IzW0xLqOW7d1ZY0/L3jsbssDhEh1e3l
X-Google-Smtp-Source: APXvYqz58DrW6QlR10bSJiDOATbVC9+OunMDEJ0tgfVZUL//1syHDu9A4MSUfIAbyKIc7z5sw3IEBQ==
X-Received: by 2002:a17:902:850c:: with SMTP id
	bj12mr17480540plb.69.1552886890281; 
	Sun, 17 Mar 2019 22:28:10 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id f7sm5985393pgf.48.2019.03.17.22.28.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Mar 2019 22:28:09 -0700 (PDT)
Date: Sun, 17 Mar 2019 22:27:59 -0700
Message-Id: <20190318052759.10860-2-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190318052759.10860-1-palmer@sifive.com>
References: <20190318052759.10860-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: [Qemu-riscv] [PULL] target/riscv: Fix manually parsed 16 bit insn
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
X-List-Received-Date: Mon, 18 Mar 2019 05:34:34 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

during the refactor to decodetree we removed the manual decoding that is
necessary for c.jal/c.addiw and removed the translation of c.flw/c.ld
and c.fsw/c.sd. This reintroduces the manual parsing and the
omited implementation.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Tested-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvc.inc.c | 30 ++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index bcdf64d3b705..5819f53f900e 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -44,10 +44,19 @@ static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
 {
 #ifdef TARGET_RISCV32
     /* C.FLW ( RV32FC-only ) */
-    return false;
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    arg_c_lw tmp;
+    decode_insn16_extract_cl_w(&tmp, ctx->opcode);
+    arg_flw arg = { .rd = tmp.rd, .rs1 = tmp.rs1, .imm = tmp.uimm };
+    return trans_flw(ctx, &arg);
 #else
     /* C.LD ( RV64C/RV128C-only ) */
-    return false;
+    arg_c_fld tmp;
+    decode_insn16_extract_cl_d(&tmp, ctx->opcode);
+    arg_ld arg = { .rd = tmp.rd, .rs1 = tmp.rs1, .imm = tmp.uimm };
+    return trans_ld(ctx, &arg);
 #endif
 }
 
@@ -67,10 +76,19 @@ static bool trans_c_fsw_sd(DisasContext *ctx, arg_c_fsw_sd *a)
 {
 #ifdef TARGET_RISCV32
     /* C.FSW ( RV32FC-only ) */
-    return false;
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    arg_c_sw tmp;
+    decode_insn16_extract_cs_w(&tmp, ctx->opcode);
+    arg_fsw arg = { .rs1 = tmp.rs1, .rs2 = tmp.rs2, .imm = tmp.uimm };
+    return trans_fsw(ctx, &arg);
 #else
     /* C.SD ( RV64C/RV128C-only ) */
-    return false;
+    arg_c_fsd tmp;
+    decode_insn16_extract_cs_d(&tmp, ctx->opcode);
+    arg_sd arg = { .rs1 = tmp.rs1, .rs2 = tmp.rs2, .imm = tmp.uimm };
+    return trans_sd(ctx, &arg);
 #endif
 }
 
@@ -88,7 +106,9 @@ static bool trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)
 {
 #ifdef TARGET_RISCV32
     /* C.JAL */
-    arg_jal arg = { .rd = 1, .imm = a->imm };
+    arg_c_j tmp;
+    decode_insn16_extract_cj(&tmp, ctx->opcode);
+    arg_jal arg = { .rd = 1, .imm = tmp.imm };
     return trans_jal(ctx, &arg);
 #else
     /* C.ADDIW */
-- 
2.19.2


