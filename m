Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovvd5-0006at-Ap
	for mharc-qemu-riscv@gnu.org; Fri, 18 Nov 2022 02:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovvcp-0006Tv-EI; Fri, 18 Nov 2022 02:17:26 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovvcm-00046w-I7; Fri, 18 Nov 2022 02:17:23 -0500
Received: from localhost.localdomain (unknown [180.165.240.202])
 by APP-05 (Coremail) with SMTP id zQCowAAHDbVzMXdjkmwiCg--.64051S3;
 Fri, 18 Nov 2022 15:17:10 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 1/9] target/riscv: add cfg properties for Zc* extension
Date: Fri, 18 Nov 2022 15:16:56 +0800
Message-Id: <20221118071704.26959-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118071704.26959-1-liweiwei@iscas.ac.cn>
References: <20221118071704.26959-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHDbVzMXdjkmwiCg--.64051S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF1DurykXw45KF1Utrb_yoW8KrWrpr
 48G3yYkrWDJr17C3yfXF1UK3Z8Wwn2kayIg392q3WxuFW7ArW5XF1vkw1UWF45tFs5Xa1a
 9F17CFy5CwsrJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
 4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoXUUUUU
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
X-List-Received-Date: Fri, 18 Nov 2022 07:17:29 -0000

Add properties for Zca,Zcb,Zcf,Zcd,Zcmp,Zcmt extension
Add check for these properties

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Cc: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  6 ++++++
 2 files changed, 49 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 042fd541b4..1ab04ab246 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -805,6 +805,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
         }
 
+        if (cpu->cfg.ext_c) {
+            cpu->cfg.ext_zca = true;
+            if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+                cpu->cfg.ext_zcf = true;
+            }
+            if (cpu->cfg.ext_d) {
+                cpu->cfg.ext_zcd = true;
+            }
+        }
+
+        if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
+            error_setg(errp, "Zcf extension is only relevant to RV32");
+            return;
+        }
+
+        if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
+            error_setg(errp, "Zcf extension requires F extension");
+            return;
+        }
+
+        if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
+            error_setg(errp, "Zcd extensionrequires D extension");
+            return;
+        }
+
+        if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
+             cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
+            error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
+                             "extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
+            error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
+                             "Zcd extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zcmt extension requires Zicsr extension");
+            return;
+        }
+
         if (cpu->cfg.ext_zk) {
             cpu->cfg.ext_zkn = true;
             cpu->cfg.ext_zkr = true;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9bd539d77a..6e915b6937 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -434,6 +434,12 @@ struct RISCVCPUConfig {
     bool ext_zbkc;
     bool ext_zbkx;
     bool ext_zbs;
+    bool ext_zca;
+    bool ext_zcb;
+    bool ext_zcd;
+    bool ext_zcf;
+    bool ext_zcmp;
+    bool ext_zcmt;
     bool ext_zk;
     bool ext_zkn;
     bool ext_zknd;
-- 
2.25.1


