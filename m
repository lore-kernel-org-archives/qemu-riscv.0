Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ou2q1-00033f-Vn
	for mharc-qemu-riscv@gnu.org; Sat, 12 Nov 2022 21:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ou2q1-00033J-D3; Sat, 12 Nov 2022 21:35:13 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ou2py-0006Sl-GO; Sat, 12 Nov 2022 21:35:12 -0500
Received: from localhost.localdomain (unknown [180.165.240.202])
 by APP-01 (Coremail) with SMTP id qwCowABH6GnNV3BjuIN9CQ--.57556S5;
 Sun, 13 Nov 2022 10:35:02 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 3/8] target/riscv: add support for Zcd extension
Date: Sun, 13 Nov 2022 10:32:46 +0800
Message-Id: <20221113023251.11047-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
References: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABH6GnNV3BjuIN9CQ--.57556S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1UuFW8GFy3Kryrtw13Jwb_yoW8tr1rp3
 W8Cw17GrZ8CryfZa13tF45JF1UJFs3Gry8t3sIywn5Gay5GF45Zr1UtFy3tr4UXFWkZr4Y
 9F1DA39xC395trDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9v14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
 j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
 W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU==
X-Originating-IP: [180.165.240.202]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Nov 2022 02:35:13 -0000

Separate c_fld/c_fsd from fld/fsd to add additional check for
c.fld{sp}/c.fsd{sp} which is useful for zcmp/zcmt to reuse
their encodings

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn16.decode              |  8 ++++----
 target/riscv/insn_trans/trans_rvd.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index ccfe59f294..c32cfe1543 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -97,12 +97,12 @@
 }
 {
   lq              001  ... ... .. ... 00 @cl_q
-  fld             001  ... ... .. ... 00 @cl_d
+  c_fld           001  ... ... .. ... 00 @cl_d
 }
 lw                010  ... ... .. ... 00 @cl_w
 {
   sq              101  ... ... .. ... 00 @cs_q
-  fsd             101  ... ... .. ... 00 @cs_d
+  c_fsd           101  ... ... .. ... 00 @cs_d
 }
 sw                110  ... ... .. ... 00 @cs_w
 
@@ -148,7 +148,7 @@ addw              100 1 11 ... 01 ... 01 @cs_2
 slli              000 .  .....  ..... 10 @c_shift2
 {
   lq              001  ... ... .. ... 10 @c_lqsp
-  fld             001 .  .....  ..... 10 @c_ldsp
+  c_fld           001 .  .....  ..... 10 @c_ldsp
 }
 {
   illegal         010 -  00000  ----- 10 # c.lwsp, RES rd=0
@@ -166,7 +166,7 @@ slli              000 .  .....  ..... 10 @c_shift2
 }
 {
   sq              101  ... ... .. ... 10 @c_sqsp
-  fsd             101   ......  ..... 10 @c_sdsp
+  c_fsd           101   ......  ..... 10 @c_sdsp
 }
 sw                110 .  .....  ..... 10 @c_swsp
 
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 1397c1ce1c..def0d7abfe 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -31,6 +31,12 @@
     } \
 } while (0)
 
+#define REQUIRE_ZCD(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zcd) {  \
+        return false;     \
+    } \
+} while (0)
+
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
     TCGv addr;
@@ -57,6 +63,18 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     return true;
 }
 
+static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
+{
+    REQUIRE_ZCD(ctx);
+    return trans_fld(ctx, a);
+}
+
+static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
+{
+    REQUIRE_ZCD(ctx);
+    return trans_fsd(ctx, a);
+}
+
 static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


