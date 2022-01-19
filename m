Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA9IT-0001U6-Gb
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 06:38:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IF-0001HJ-PS; Wed, 19 Jan 2022 06:38:25 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:60252 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IC-0002Hh-EI; Wed, 19 Jan 2022 06:38:23 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABnblof+Odh7EjABQ--.19898S3;
 Wed, 19 Jan 2022 19:38:10 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v5 01/14] target/riscv: rvk: add cfg properties for zbk*
 and zk*
Date: Wed, 19 Jan 2022 19:37:41 +0800
Message-Id: <20220119113754.20323-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABnblof+Odh7EjABQ--.19898S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF4rXr1DGw17Kr1Dtrb_yoW8Ar13pr
 WUGa1YyrWDXF9rCw4fJa4jgFyrWwn3ua4Iga92vrn3GrW7GrW3JF1qkw1UuF4FgF4rJFya
 gFn0kFyjkF47Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2_M3UUUUU
 =
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 19 Jan 2022 11:38:25 -0000

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 23 +++++++++++++++++++++++
 target/riscv/cpu.h | 13 +++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..b487a8282c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -518,6 +518,29 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_d = true;
         }
 
+        if (cpu->cfg.ext_zk) {
+            cpu->cfg.ext_zkn = true;
+            cpu->cfg.ext_zkr = true;
+            cpu->cfg.ext_zkt = true;
+        }
+
+        if (cpu->cfg.ext_zkn) {
+            cpu->cfg.ext_zbkb = true;
+            cpu->cfg.ext_zbkc = true;
+            cpu->cfg.ext_zbkx = true;
+            cpu->cfg.ext_zkne = true;
+            cpu->cfg.ext_zknd = true;
+            cpu->cfg.ext_zknh = true;
+        }
+
+        if (cpu->cfg.ext_zks) {
+            cpu->cfg.ext_zbkb = true;
+            cpu->cfg.ext_zbkc = true;
+            cpu->cfg.ext_zbkx = true;
+            cpu->cfg.ext_zksed = true;
+            cpu->cfg.ext_zksh = true;
+        }
+
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
             ext |= RVI;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..2c14fe8ed9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -323,7 +323,20 @@ struct RISCVCPU {
         bool ext_zba;
         bool ext_zbb;
         bool ext_zbc;
+        bool ext_zbkb;
+        bool ext_zbkc;
+        bool ext_zbkx;
         bool ext_zbs;
+        bool ext_zk;
+        bool ext_zkn;
+        bool ext_zknd;
+        bool ext_zkne;
+        bool ext_zknh;
+        bool ext_zkr;
+        bool ext_zks;
+        bool ext_zksed;
+        bool ext_zksh;
+        bool ext_zkt;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.17.1


