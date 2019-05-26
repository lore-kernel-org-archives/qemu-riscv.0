Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxd-0003vY-6G
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxN-0003S6-IG
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhg4-0005wc-3y
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:21 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhg2-0005r9-4U
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:19 -0400
Received: by mail-pg1-f193.google.com with SMTP id v11so7092066pgl.5
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=OmSQFZO3wBvDnHuwPuCqP/gKDSGfC6OxGSJhMV+r43c=;
	b=SyaOvoXbpo8Y8uv+FGfgV3uNmaesiT8n+pD09Ent3tcE7kxCckUv247OQ4lY3lhr+8
	tG+8MxtrEotjDixBTvXoRK39sig+uLzy2uiB4OeswLXG4i1CVK4B3yVUYjs//fR/T4+U
	AU985THMOegFmZbsYZ+gKMu0f8/ZsGn3FAdLpuPBrVUld71rq/YQf9kWbCyJxAeUpoSi
	vAJ8KAHgrILW84S68JQVvhg/vCjfl6VBsKU4yqTMIis5tNz3LTqhd9EherQINvfZpOos
	fKeai5bwp8SYfyiISXcy4Jbey2OwU9jLLVhvHbmuZaZnquDPyBFIRiEoNBmOmaL2rHgH
	IiZA==
X-Gm-Message-State: APjAAAVhLT5h+YXhUngBfgL6E3+KdIBQNQojoglJCDVUo1Rb4LrdmGyG
	61YnruHcBiMP9CLmVjv0PUo/BWK7Jgw=
X-Google-Smtp-Source: APXvYqytK9uAGScqQUE6ES9n4V1QrfbnNuis1mjqLofTtpq+oLyK34ZrHClntDgomJectNXSRDE9TQ==
X-Received: by 2002:aa7:9a99:: with SMTP id w25mr31312977pfi.249.1558833015176;
	Sat, 25 May 2019 18:10:15 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	p90sm17592187pfa.18.2019.05.25.18.10.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:14 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:29 -0700
Message-Id: <20190526010948.3923-11-palmer@sifive.com>
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
X-Received-From: 209.85.215.193
Subject: [Qemu-riscv] [PULL 10/29] target/riscv: Split gen_arith_imm into
 functional and temp
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
X-List-Received-Date: Sun, 26 May 2019 01:28:14 -0000

From: Richard Henderson <richard.henderson@linaro.org>

The tcg_gen_fooi_tl functions have some immediate constant
folding built in, which match up with some of the riscv asm
builtin macros, like mv and not.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 14 +++++++-------
 target/riscv/translate.c                | 19 +++++++++++++++++--
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index b5a5b4a199f8..6cda078ed6ba 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -223,7 +223,7 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
 
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
-    return gen_arith_imm(ctx, a, &tcg_gen_add_tl);
+    return gen_arith_imm_fn(ctx, a, &tcg_gen_addi_tl);
 }
 
 static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
@@ -239,25 +239,25 @@ static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
 
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
-    return gen_arith_imm(ctx, a, &gen_slt);
+    return gen_arith_imm_tl(ctx, a, &gen_slt);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    return gen_arith_imm(ctx, a, &gen_sltu);
+    return gen_arith_imm_tl(ctx, a, &gen_sltu);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
 {
-    return gen_arith_imm(ctx, a, &tcg_gen_xor_tl);
+    return gen_arith_imm_fn(ctx, a, &tcg_gen_xori_tl);
 }
 static bool trans_ori(DisasContext *ctx, arg_ori *a)
 {
-    return gen_arith_imm(ctx, a, &tcg_gen_or_tl);
+    return gen_arith_imm_fn(ctx, a, &tcg_gen_ori_tl);
 }
 static bool trans_andi(DisasContext *ctx, arg_andi *a)
 {
-    return gen_arith_imm(ctx, a, &tcg_gen_and_tl);
+    return gen_arith_imm_fn(ctx, a, &tcg_gen_andi_tl);
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
@@ -364,7 +364,7 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
 #ifdef TARGET_RISCV64
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
-    return gen_arith_imm(ctx, a, &gen_addw);
+    return gen_arith_imm_tl(ctx, a, &gen_addw);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8b37e0928f50..313c27b70073 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -567,8 +567,23 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
 
-static bool gen_arith_imm(DisasContext *ctx, arg_i *a,
-                          void(*func)(TCGv, TCGv, TCGv))
+static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a,
+                             void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv source1;
+    source1 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+
+    (*func)(source1, source1, a->imm);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
+static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
+                             void (*func)(TCGv, TCGv, TCGv))
 {
     TCGv source1, source2;
     source1 = tcg_temp_new();
-- 
2.21.0


