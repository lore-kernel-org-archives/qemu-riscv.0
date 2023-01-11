Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFYWS-0003mF-6O
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 05:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pFYWQ-0003k0-5X; Wed, 11 Jan 2023 05:39:54 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pFYWM-0007k9-8u; Wed, 11 Jan 2023 05:39:53 -0500
Received: from localhost.localdomain (unknown [61.165.33.198])
 by APP-01 (Coremail) with SMTP id qwCowABHTTXskb5jCcUADA--.29173S5;
 Wed, 11 Jan 2023 18:39:42 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v10 3/9] target/riscv: add support for Zcf extension
Date: Wed, 11 Jan 2023 18:39:30 +0800
Message-Id: <20230111103936.129269-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111103936.129269-1-liweiwei@iscas.ac.cn>
References: <20230111103936.129269-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABHTTXskb5jCcUADA--.29173S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uF43Zr43Zry3AFW8trW3GFg_yoW8trWxpr
 18C3y7GrWUAryfA3Z3tF45Xr1UJrs2gry8t39Iyw1kGa15GFs8Zw1qqr13tr4UXFyvqr1Y
 kF18A39xC3yktrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [61.165.33.198]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Wed, 11 Jan 2023 10:39:54 -0000

Separate c_flw/c_fsw from flw/fsw to add check for Zcf extension

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index 965e1f8d11..5df9c148dc 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -30,6 +30,12 @@
     } \
 } while (0)
 
+#define REQUIRE_ZCF(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zcf) {              \
+        return false;                          \
+    }                                          \
+} while (0)
+
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
     TCGv_i64 dest;
@@ -61,6 +67,18 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
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


