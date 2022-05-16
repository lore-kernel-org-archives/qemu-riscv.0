Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqRUv-0006ym-4c
	for mharc-qemu-riscv@gnu.org; Sun, 15 May 2022 23:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqRUt-0006yN-Ih; Sun, 15 May 2022 23:34:15 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:50360 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqRUr-0002wM-08; Sun, 15 May 2022 23:34:15 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACHA+ErxoFinf0YBw--.36458S3;
 Mon, 16 May 2022 11:34:05 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 2/2] target/riscv: disable zb* extensions by default
Date: Mon, 16 May 2022 11:33:57 +0800
Message-Id: <20220516033357.12371-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
References: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowACHA+ErxoFinf0YBw--.36458S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF1kXFW3WF4Duw18AFb_yoW8Xw4rpr
 98GFZrKwsxJry3Cay8trn8J3ykCa1rC392q3yIq3Z7Ar4fGr43JF1kKan5Cr47Xr48Za1x
 uF13ur1Fv39Fva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
 4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoXUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 16 May 2022 03:34:15 -0000

 - enable zb* extensions by default will make cpu types(such as sifive-u34) implicitly support zb* extensions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b12f69c584..a3a17323e7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -847,13 +847,13 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
 
-    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
-    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
-    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
+    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, false),
+    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, false),
+    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
     DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
     DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
-    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
+    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
     DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
     DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
-- 
2.17.1


