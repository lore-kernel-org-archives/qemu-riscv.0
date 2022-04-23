Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni5cf-0008WF-27
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 22:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5ca-0008K3-GA; Fri, 22 Apr 2022 22:35:40 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39796 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cX-00057y-1R; Fri, 22 Apr 2022 22:35:40 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABX0+DqZWNiSogjAA--.1876S3;
 Sat, 23 Apr 2022 10:35:25 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 01/14] target/riscv: rvk: add cfg properties for zbk* and
 zk*
Date: Sat, 23 Apr 2022 10:34:57 +0800
Message-Id: <20220423023510.30794-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
References: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABX0+DqZWNiSogjAA--.1876S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF4rXr1DXrW3Ww4xCrg_yoW8Ar43pr
 WDGa1YyrWDXF9rCw4fJFyjgF1rWwn3ua4Iga92yrn3GrW7KrW3JF1qkw1UuF4Yga1rJFy3
 WF1qkFyUKF47Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
 kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU86wZUUUU
 U
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
X-List-Received-Date: Sat, 23 Apr 2022 02:35:40 -0000

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 23 +++++++++++++++++++++++
 target/riscv/cpu.h | 13 +++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ace68ed855..62a47c197b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -612,6 +612,29 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_zfinx = true;
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
index 46c66fbf8e..fe6c9a2c92 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -377,7 +377,20 @@ struct RISCVCPUConfig {
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
+    bool ext_zbkb;
+    bool ext_zbkc;
+    bool ext_zbkx;
     bool ext_zbs;
+    bool ext_zk;
+    bool ext_zkn;
+    bool ext_zknd;
+    bool ext_zkne;
+    bool ext_zknh;
+    bool ext_zkr;
+    bool ext_zks;
+    bool ext_zksed;
+    bool ext_zksh;
+    bool ext_zkt;
     bool ext_counters;
     bool ext_ifencei;
     bool ext_icsr;
-- 
2.17.1


