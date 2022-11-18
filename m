Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ow0eO-0005w2-Q4
	for mharc-qemu-riscv@gnu.org; Fri, 18 Nov 2022 07:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ow0dx-0005p6-L7; Fri, 18 Nov 2022 07:38:54 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ow0dr-0007f0-Ur; Fri, 18 Nov 2022 07:38:51 -0500
Received: from localhost.localdomain (unknown [180.165.240.202])
 by APP-05 (Coremail) with SMTP id zQCowACHj7fNfHdjlWwsCg--.62094S5;
 Fri, 18 Nov 2022 20:38:40 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 3/9] target/riscv: add support for Zcf extension
Date: Fri, 18 Nov 2022 20:37:22 +0800
Message-Id: <20221118123728.49319-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHj7fNfHdjlWwsCg--.62094S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uF43Zr43Zry3AFW8trW3GFg_yoW8tryUpr
 18Cay7GrWjkryfAan3tF45Xr15trs7K348K3sxtw1kGayUGFs8Zw1qqr17tr4UXFyvqr1Y
 kF18A398C3yktrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9l14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUojjgUUUUU
X-Originating-IP: [180.165.240.202]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 18 Nov 2022 12:38:54 -0000

Separate c_flw/c_fsw from flw/fsw to add check for Zcf extension

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn16.decode              |  8 ++++----
 target/riscv/insn_trans/trans_rvf.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index ccfe59f294..f3ea650325 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -109,11 +109,11 @@ sw                110  ... ... .. ... 00 @cs_w
 # *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
 {
   ld              011  ... ... .. ... 00 @cl_d
-  flw             011  ... ... .. ... 00 @cl_w
+  c_flw           011  ... ... .. ... 00 @cl_w
 }
 {
   sd              111  ... ... .. ... 00 @cs_d
-  fsw             111  ... ... .. ... 00 @cs_w
+  c_fsw           111  ... ... .. ... 00 @cs_w
 }
 
 # *** RV32/64C Standard Extension (Quadrant 1) ***
@@ -174,9 +174,9 @@ sw                110 .  .....  ..... 10 @c_swsp
 {
   c64_illegal     011 -  00000  ----- 10 # c.ldsp, RES rd=0
   ld              011 .  .....  ..... 10 @c_ldsp
-  flw             011 .  .....  ..... 10 @c_lwsp
+  c_flw           011 .  .....  ..... 10 @c_lwsp
 }
 {
   sd              111 .  .....  ..... 10 @c_sdsp
-  fsw             111 .  .....  ..... 10 @c_swsp
+  c_fsw           111 .  .....  ..... 10 @c_swsp
 }
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 93657680c6..426518957b 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,6 +24,12 @@
             return false; \
 } while (0)
 
+#define REQUIRE_ZCF(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zcf) {              \
+        return false;                          \
+    }                                          \
+} while (0)
+
 #ifndef CONFIG_USER_ONLY
 static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
 {
@@ -96,6 +102,18 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     return true;
 }
 
+static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
+{
+    REQUIRE_ZCF(ctx);
+    return trans_flw(ctx, a);
+}
+
+static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
+{
+    REQUIRE_ZCF(ctx);
+    return trans_fsw(ctx, a);
+}
+
 static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


