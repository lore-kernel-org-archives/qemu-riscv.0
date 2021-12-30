Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2wTF-0000H6-GR
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 09:31:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2wTD-0000FU-HI; Thu, 30 Dec 2021 09:31:55 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:55252 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2wTA-0004AX-Mn; Thu, 30 Dec 2021 09:31:55 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADHzFjJws1h4_TqBA--.24839S3;
 Thu, 30 Dec 2021 22:31:39 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 1/7] target/riscv: rvk: add cfg properties for zbk* and zk*
Date: Thu, 30 Dec 2021 22:30:52 +0800
Message-Id: <20211230143058.7352-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowADHzFjJws1h4_TqBA--.24839S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW8JrW5JFy7ury7Kr17KFg_yoW8Ar13pr
 WDGa1YyryDXF9rCw4fJa4jgFyrWwn3ua4Iga92qrn3GrWxGrW3JF1qkw1UuF4Yga1rXFy3
 WF1qkFyjkF47Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
 0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
 1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
 JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
 AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
 IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU86wZUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 14:31:55 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 23 +++++++++++++++++++++++
 target/riscv/cpu.h | 13 +++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bce..961c5f4334 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -491,6 +491,29 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
index dc10f27093..edca7118ff 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -311,7 +311,20 @@ struct RISCVCPU {
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


