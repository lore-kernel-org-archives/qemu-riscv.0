Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456H-00010N-BW
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4569-0000a4-Dj
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450k-0004EH-8R
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:39 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36956)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450k-0004DU-0l
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:38 -0400
Received: by mail-pf1-x435.google.com with SMTP id s22so1528380pfh.4
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=WDLG4gtJ4NVIixxVrBqAA7qUBYE6tWbEuBXX1NYpea0=;
	b=F7vJcekFPdhkOKGuJMl+R937hpFyA0Jld/dtn6h2nJlQI86apAtqL6DKH4f2MyU6tw
	LUZ/G79X2I3Edzo/5Kr9UMuhxCEtGAKLEdD17Tld2sqxNyH0vPAZISAOx9kvYYZbiwGx
	uGWdwsZUweUPdAIM3Afw8G5VLlv8vJiuJ822iw/aK1tzmXZYN+XDKkeUKHteRcCyk5V0
	q1hdsSlIxnNyiMJATIMbQ7QQmDb/aL3jzl0nhoDxMr/jw5a0CtbF5fyRdGHc8nO7dMfO
	cTcGPJoss7GHW31/lzvkN2aEE2+rmtExFisycpcAG4AK6iYbJWLSVayy0poBmXiEijWU
	SD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=WDLG4gtJ4NVIixxVrBqAA7qUBYE6tWbEuBXX1NYpea0=;
	b=jKw+zk0+p8pCJn3FN6fdiQTh7EWSviTmluHx2IZGHtIWWgQXdNqrGLlAqfbUD4LkOo
	VQH5f7ggnf+7RIPc/dFCkCcmu8eBQnpuOnQjo74tT0JYhcrKdlSxBvNXeK77C2uZOmwr
	Vr3DikP0YcwUtaunIExftW4/eOv1yqkW2wQJy8DEHPovkG5Uo/Cj9spJ2VptL2LDdhHQ
	+i/JDBRVZuIyH6nAPyxdr5p2NykSLqU1G/zFwDGN2yXt+vEY+NlnpdoCw6GsOudvq5IY
	SWpAU1rp+a2PTnlJxgWemAk7Pwgk1jdbEDHhUPOHx834t+N2YxfQ5njopIFEH78x8NDV
	7JiQ==
X-Gm-Message-State: APjAAAXwd8yWZCWOod68/mugueDfOfdCJkl59md5/rp7U1EqhcOCOoID
	zM2qRlJNJO/9Ur6UjggPHgRwr8QaFghUGVXJ
X-Google-Smtp-Source: APXvYqwixnjsMGu2K+NgdbRrFRH/gdI/MqNiuRskKyoyEhHrJ5HugjenUozaHs0JbHB8tSC08dj7nA==
X-Received: by 2002:a17:902:1101:: with SMTP id
	d1mr44588143pla.19.1552487856688; 
	Wed, 13 Mar 2019 07:37:36 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	h23sm2130957pfn.68.2019.03.13.07.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:36 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:43 -0700
Message-Id: <20190313143705.29129-8-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::435
Subject: [Qemu-riscv] [PULL 07/29] target/riscv: Convert RVXI csr insns to
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:14 -0000

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
index f720746cb791..18555000af35 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1476,16 +1476,11 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
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
@@ -1556,45 +1551,9 @@ static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
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
2.19.2


