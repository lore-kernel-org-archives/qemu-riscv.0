Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxg-0003zh-Cf
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxR-0003S6-2i
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhfr-0005nY-Dj
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhfr-0005mg-7E
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id s11so7490052pfm.12
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=AGynrsN21pUOx1n9WYF4sVDzoqOhDbKXNfRUTxBfjrw=;
	b=FqvlT/8QgERKHy3uNCGnzyGA9qLQz7aaAViQX7cgVwrea/uVCamnjakrLF3Q4ReBeT
	sttWX0yZ0I6OlQoVS4tGpqn+soNBo2BqcYC5SgKuuhU/iuafWKlypL9HsMIHoNgG0+ee
	+fXoIcEBhGl/BzcDEP0wTWw1XxfoNCnLDNDzZcSfccfQymVp8TAtF/qWistgMvFd3nOk
	zD5zbO9w3NGaC2/sJ412LpXbI1pISwXm6i4glrAyJOyaunoE1XBkjLpJCAdP8MT5qvHl
	usUXVc+pkm19D+R3eSNlrE5AfhcQ9QgkJAOw75VWFvwkm08dn2gAqrLGR2KXEghoGEzi
	84zQ==
X-Gm-Message-State: APjAAAXEq5CkJPQ/KcbRFJmtsedx+QYkI1O6Sh+xQ87i08Z90zyoZ9Sw
	102gd3y7CHWD71lnhEBXmyQh3vtNjtw=
X-Google-Smtp-Source: APXvYqwZY92aKwMSdJQkCQ2IbMRsfUvYIvnktU69XpIv7DBfceh2O5y1c7D6P9AsqkIeKoTCD+mQLw==
X-Received: by 2002:aa7:8dcd:: with SMTP id j13mr22711737pfr.107.1558833005679;
	Sat, 25 May 2019 18:10:05 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	e123sm6733854pgc.29.2019.05.25.18.10.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:05 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:23 -0700
Message-Id: <20190526010948.3923-5-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.194
Subject: [Qemu-riscv] [PULL 04/29] target/riscv: Name the argument sets for
 all of insn32 formats
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
X-List-Received-Date: Sun, 26 May 2019 01:28:21 -0000

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn32.decode | 10 +++++++---
 target/riscv/translate.c   | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6f3ab7aa52d3..77f794ed703d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -34,9 +34,13 @@
 %imm_u    12:s20                 !function=ex_shift_12
 
 # Argument sets:
+&empty
 &b    imm rs2 rs1
 &i    imm rs1 rd
+&j    imm rd
 &r    rd rs1 rs2
+&s    imm rs1 rs2
+&u    imm rd
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
 
@@ -44,9 +48,9 @@
 @r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
 @i       ............    ..... ... ..... ....... &i      imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
-@s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
-@u       ....................      ..... .......         imm=%imm_u          %rd
-@j       ....................      ..... .......         imm=%imm_j          %rd
+@s       .......   ..... ..... ... ..... ....... &s      imm=%imm_s %rs2 %rs1
+@u       ....................      ..... ....... &u      imm=%imm_u          %rd
+@j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
 @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 840ecbef36e7..928374242e83 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -687,11 +687,29 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 #include "insn_trans/trans_rvd.inc.c"
 #include "insn_trans/trans_privileged.inc.c"
 
+/*
+ * Auto-generated decoder.
+ * Note that the 16-bit decoder reuses some of the trans_* functions
+ * initially declared by the 32-bit decoder, which results in duplicate
+ * declaration warnings.  Suppress them.
+ */
+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
+# pragma GCC diagnostic push
+# pragma GCC diagnostic ignored "-Wredundant-decls"
+# ifdef __clang__
+#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
+# endif
+#endif
+
 bool decode_insn16(DisasContext *ctx, uint16_t insn);
 /* auto-generated decoder*/
 #include "decode_insn16.inc.c"
 #include "insn_trans/trans_rvc.inc.c"
 
+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
+# pragma GCC diagnostic pop
+#endif
+
 static void decode_opc(DisasContext *ctx)
 {
     /* check for compressed insn */
-- 
2.21.0


