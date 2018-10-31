Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHqx7-000604-LJ
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 09:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRD-0004UR-AB
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqR5-0002iL-CJ
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:30 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:53012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gHqR0-0002Bf-KA; Wed, 31 Oct 2018 09:21:23 -0400
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gHqQY-0007BW-3i; Wed, 31 Oct 2018 14:20:54 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 2965936-5;
	Wed, 31 Oct 2018 13:20:53 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
Received: from [131.234.87.238] (helo=mustique.hni.uni-paderborn.de)
	by mail.uni-paderborn.de with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89 nylar)
	id 1gHqQX-0005dh-PH; Wed, 31 Oct 2018 14:20:53 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: mjc@sifive.com, sagark@eecs.berkeley.edu, palmer@sifive.com,
	kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Wed, 31 Oct 2018 14:20:02 +0100
Message-Id: <20181031132029.4887-9-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.5.2775670, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.10.31.131216, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.10.10.5530001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
X-Mailman-Approved-At: Wed, 31 Oct 2018 09:54:25 -0400
Subject: [Qemu-riscv] [PATCH v3 08/35] target/riscv: Convert RVXI csr insns
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
X-List-Received-Date: Wed, 31 Oct 2018 13:21:36 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
v2 -> v3:
    - dropped insn argument of trans_foo functions

 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvi.inc.c | 79 +++++++++++++++++++++++++
 target/riscv/translate.c                | 43 +-------------
 3 files changed, 88 insertions(+), 42 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6d750b4c5a..b67d3a9437 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,6 +22,7 @@
 %rd        7:5
 
 %sh6    20:6
+%csr    20:12
 
 # immediates:
 %imm_i    20:s12
@@ -43,6 +44,7 @@
 @j       ....................      ..... .......         imm=%imm_j          %rd
 
 @sh6     ......  ...... .....  ... ..... ....... &shift  shamt=%sh6      %rs1 %rd
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
index a149e913b1..09e7a0052a 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -339,3 +339,82 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 #endif
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
index 80f18fb6aa..be03acd066 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1277,16 +1277,11 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
                       int rd, int rs1, int csr)
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
@@ -1349,45 +1344,9 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
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
2.19.1


