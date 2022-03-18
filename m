Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nV46C-0004it-VJ
	for mharc-qemu-riscv@gnu.org; Fri, 18 Mar 2022 00:20:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nV45z-0004eQ-HK; Fri, 18 Mar 2022 00:20:12 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:56932 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nV45t-0001mK-94; Fri, 18 Mar 2022 00:20:09 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABHKfJmCDRijsoBBA--.29102S5;
 Fri, 18 Mar 2022 12:19:54 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v9 03/14] target/riscv: rvk: add support for zbkc extension
Date: Fri, 18 Mar 2022 12:19:33 +0800
Message-Id: <20220318041944.19859-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowABHKfJmCDRijsoBBA--.29102S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uryrZFyxZFy3tF4ftryxXwb_yoW8Zr47pr
 4FkryUGrW8WFyfJa4FqF15XF17GFsa9ay7JwnIywn5Ja15JFZ8Zwn8Kw47KrWDZFWkur4j
 93WUA3y2yrWrta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbJ73DUU
 UUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 18 Mar 2022 04:20:13 -0000

 - reuse partial instructions of zbc extension, update extension check for them

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              | 3 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fdceaf621a..3a49acab37 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -770,9 +770,10 @@ clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
-# *** RV32 Zbc Standard Extension ***
+# *** RV32 Zbc/Zbkc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
 clmulh     0000101 .......... 011 ..... 0110011 @r
+# *** RV32 extra Zbc Standard Extension ***
 clmulr     0000101 .......... 010 ..... 0110011 @r
 
 # *** RV32 Zbs Standard Extension ***
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index f36577579d..5a5751557d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -489,7 +489,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
 {
-    REQUIRE_ZBC(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
     return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul, NULL);
 }
 
@@ -501,7 +501,7 @@ static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
 
 static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
 {
-    REQUIRE_ZBC(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
     return gen_arith(ctx, a, EXT_NONE, gen_clmulh, NULL);
 }
 
-- 
2.17.1


