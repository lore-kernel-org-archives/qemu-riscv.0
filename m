Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZSSn-00063c-B5
	for mharc-qemu-riscv@gnu.org; Tue, 07 Mar 2023 03:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZSSh-00060Q-P9; Tue, 07 Mar 2023 03:14:19 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZSSd-0007Jx-28; Tue, 07 Mar 2023 03:14:19 -0500
Received: from localhost.localdomain (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowACn0qJN8gZkNe6lDA--.36330S6;
 Tue, 07 Mar 2023 16:14:08 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 04/10] target/riscv: add support for Zcd extension
Date: Tue,  7 Mar 2023 16:13:57 +0800
Message-Id: <20230307081403.61950-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACn0qJN8gZkNe6lDA--.36330S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1UuFW8GF1kWr4fJrW5KFg_yoW8Kr4xpF
 18Cw47GFW5GryfZa13tF43JF4UJFs3Gry8t3sIywn5Gay5GF45Zr1UtFy3tr4UXFWkZr1Y
 kFyDA39xC395trDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQSdkUUUUU=
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Tue, 07 Mar 2023 08:14:20 -0000

Separate c_fld/c_fsd from fld/fsd to add additional check for
c.fld{sp}/c.fsd{sp} which is useful for zcmp/zcmt to reuse
their encodings.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode              |  8 ++++----
 target/riscv/insn_trans/trans_rvd.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index f3ea650325..b62664b6af 100644
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
index 1597bf31d8..2c51e01c40 100644
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
@@ -59,6 +65,18 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
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


