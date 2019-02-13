Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwsH-0000vd-SP
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwsF-0000tF-9W
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwsD-0001Bu-Cd
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:54:58 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33510)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwsB-00013C-K0
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:54:56 -0500
Received: by mail-pf1-x429.google.com with SMTP id c123so1337771pfb.0
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=zZo7XThRIMtKt7wXi11qpcU8RsDgOJHm2xpDnrdhGfM=;
	b=V8AH/9xOvGLbn8jYQSMNIg8l3KvUilr7k2AHUMJrSqRmglue25N1mSM/xHUISj+E7E
	ni8337KujMKhyiAwYxQbb74U+9LLyZAqRD2EOcgs1uYikHawzsq2fStqdBQRZTtwMyvc
	oLoP5BtebN+9mnvb21nX97sLrC/icY+5Dsl/zVumIG8izQK2vwsSSUSOHSqUTWwIQq74
	kZAbIA9W/GZDjm+xIbzYPYoXRWkHHuLsmovkTL/uNExCiewBN3oftCCKGvJ1sZRIKSZO
	zXPUHu3fSXqzLoMJdXcfwQa3f/Fvf/9doa0BpeaKTjc2RlNBKHZrDDlJSsHYIAJjidzY
	Ng6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=zZo7XThRIMtKt7wXi11qpcU8RsDgOJHm2xpDnrdhGfM=;
	b=SMGNnlkZsoBEzlghcSQpmXuLDWlSnYVLmXO+MDjdva4wYciMaU7zE7ocnCX4ZS+O/X
	J8G0q1tAgWi76pvQsNki/r8Dy+eSt56k8fsZflttWcbsNgSlocqTtEG+uTwvkNuiyut+
	5U90k/z51U31SWXZbaE3kTt8N3GDNFiFbB5gMZR1373Gf5LDaEYBPJlf/yxTFR5o0/XJ
	u5Ak1TM1niH7WaoWRJr4y8JuIKURD9cyBGqdwy0avwGM9SPQHFHcY1sbSHSKlUXXBIff
	b8CT9Vo+SOdQ0Cl8UYTtqfZXUAGhkqK0wa+jxfkHANfl3eanphNY1NQggotzzq7527z3
	s5+w==
X-Gm-Message-State: AHQUAuaLhAdK9FPKMlOh8TvGn7ZAK6SICz83rRwhnoytyL8C0YIuG4a7
	VqB3VB18WX7+5uXDtM5AnpUs3w==
X-Google-Smtp-Source: AHgI3IaHRfrTlLggmm1L/G7nTcVcusBlZ41WjeAJpWgObjkUV7/4K31Dg+OTlIvL9QGroIdE03zkwg==
X-Received: by 2002:a65:628e:: with SMTP id f14mr1039467pgv.193.1550073289780; 
	Wed, 13 Feb 2019 07:54:49 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	y5sm57274990pge.49.2019.02.13.07.54.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:49 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:47 -0800
Message-Id: <20190213155414.22285-9-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: [Qemu-riscv] [PATCH v7 08/35] target/riscv: Convert RVXI csr insns
 to decodetree
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
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvi.inc.c | 79 +++++++++++++++++++++++++
 target/riscv/translate.c                | 43 +-------------
 3 files changed, 88 insertions(+), 42 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 804b721ca51e..977b1b10a330 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,6 +22,7 @@
 %rd        7:5
 
 %sh10    20:10
+%csr    20:12
 
 # immediates:
 %imm_i    20:s12
@@ -43,6 +44,7 @@
 @j       ....................      ..... .......         imm=%imm_j          %rd
 
 @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
+@csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
@@ -84,3 +86,9 @@ or       0000000 .....    ..... 110 ..... 0110011 @r
 and      0000000 .....    ..... 111 ..... 0110011 @r
 fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
 fence_i  ---- ----   ----   ----- 001 ----- 0001111
+csrrw    ............     ..... 001 ..... 1110011 @csr
+csrrs    ............     ..... 010 ..... 1110011 @csr
+csrrc    ............     ..... 011 ..... 1110011 @csr
+csrrwi   ............     ..... 101 ..... 1110011 @csr
+csrrsi   ............     ..... 110 ..... 1110011 @csr
+csrrci   ............     ..... 111 ..... 1110011 @csr
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 973d6371df85..4a23372cb823 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -337,3 +337,82 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
+
+#define RISCV_OP_CSR_PRE do {\
+    source1 = tcg_temp_new(); \
+    csr_store = tcg_temp_new(); \
+    dest = tcg_temp_new(); \
+    rs1_pass = tcg_temp_new(); \
+    gen_get_gpr(source1, a->rs1); \
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next); \
+    tcg_gen_movi_tl(rs1_pass, a->rs1); \
+    tcg_gen_movi_tl(csr_store, a->csr); \
+    gen_io_start();\
+} while (0)
+
+#define RISCV_OP_CSR_POST do {\
+    gen_io_end(); \
+    gen_set_gpr(a->rd, dest); \
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
+    tcg_gen_exit_tb(NULL, 0); \
+    ctx->base.is_jmp = DISAS_NORETURN; \
+    tcg_temp_free(source1); \
+    tcg_temp_free(csr_store); \
+    tcg_temp_free(dest); \
+    tcg_temp_free(rs1_pass); \
+} while (0)
+
+
+static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
+{
+    TCGv source1, csr_store, dest, rs1_pass;
+    RISCV_OP_CSR_PRE;
+    gen_helper_csrrw(dest, cpu_env, source1, csr_store);
+    RISCV_OP_CSR_POST;
+    return true;
+}
+
+static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
+{
+    TCGv source1, csr_store, dest, rs1_pass;
+    RISCV_OP_CSR_PRE;
+    gen_helper_csrrs(dest, cpu_env, source1, csr_store, rs1_pass);
+    RISCV_OP_CSR_POST;
+    return true;
+}
+
+static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
+{
+    TCGv source1, csr_store, dest, rs1_pass;
+    RISCV_OP_CSR_PRE;
+    gen_helper_csrrc(dest, cpu_env, source1, csr_store, rs1_pass);
+    RISCV_OP_CSR_POST;
+    return true;
+}
+
+static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
+{
+    TCGv source1, csr_store, dest, rs1_pass;
+    RISCV_OP_CSR_PRE;
+    gen_helper_csrrw(dest, cpu_env, rs1_pass, csr_store);
+    RISCV_OP_CSR_POST;
+    return true;
+}
+
+static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
+{
+    TCGv source1, csr_store, dest, rs1_pass;
+    RISCV_OP_CSR_PRE;
+    gen_helper_csrrs(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
+    RISCV_OP_CSR_POST;
+    return true;
+}
+
+static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
+{
+    TCGv source1, csr_store, dest, rs1_pass;
+    RISCV_OP_CSR_PRE;
+    gen_helper_csrrc(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
+    RISCV_OP_CSR_POST;
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 442e75fc40fb..395cc2d63626 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1477,16 +1477,11 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
                        int csr)
 {
-    TCGv source1, csr_store, dest, rs1_pass, imm_rs1;
+    TCGv source1, dest;
     source1 = tcg_temp_new();
-    csr_store = tcg_temp_new();
     dest = tcg_temp_new();
-    rs1_pass = tcg_temp_new();
-    imm_rs1 = tcg_temp_new();
     gen_get_gpr(source1, rs1);
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    tcg_gen_movi_tl(rs1_pass, rs1);
-    tcg_gen_movi_tl(csr_store, csr); /* copy into temp reg to feed to helper */
 
 #ifndef CONFIG_USER_ONLY
     /* Extract funct7 value and check whether it matches SFENCE.VMA */
@@ -1557,45 +1552,9 @@ static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
             break;
         }
         break;
-    default:
-        tcg_gen_movi_tl(imm_rs1, rs1);
-        gen_io_start();
-        switch (opc) {
-        case OPC_RISC_CSRRW:
-            gen_helper_csrrw(dest, cpu_env, source1, csr_store);
-            break;
-        case OPC_RISC_CSRRS:
-            gen_helper_csrrs(dest, cpu_env, source1, csr_store, rs1_pass);
-            break;
-        case OPC_RISC_CSRRC:
-            gen_helper_csrrc(dest, cpu_env, source1, csr_store, rs1_pass);
-            break;
-        case OPC_RISC_CSRRWI:
-            gen_helper_csrrw(dest, cpu_env, imm_rs1, csr_store);
-            break;
-        case OPC_RISC_CSRRSI:
-            gen_helper_csrrs(dest, cpu_env, imm_rs1, csr_store, rs1_pass);
-            break;
-        case OPC_RISC_CSRRCI:
-            gen_helper_csrrc(dest, cpu_env, imm_rs1, csr_store, rs1_pass);
-            break;
-        default:
-            gen_exception_illegal(ctx);
-            return;
-        }
-        gen_io_end();
-        gen_set_gpr(rd, dest);
-        /* end tb since we may be changing priv modes, to get mmu_index right */
-        tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-        tcg_gen_exit_tb(NULL, 0); /* no chaining */
-        ctx->base.is_jmp = DISAS_NORETURN;
-        break;
     }
     tcg_temp_free(source1);
-    tcg_temp_free(csr_store);
     tcg_temp_free(dest);
-    tcg_temp_free(rs1_pass);
-    tcg_temp_free(imm_rs1);
 }
 
 static void decode_RV32_64C0(DisasContext *ctx)
-- 
2.18.1


