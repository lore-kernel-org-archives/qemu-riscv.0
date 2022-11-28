Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozdH7-0005ID-Ha
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 07:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ozdH2-0005FN-SV; Mon, 28 Nov 2022 07:30:13 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ozdGw-00020a-VP; Mon, 28 Nov 2022 07:30:12 -0500
Received: from localhost.localdomain (unknown [180.175.30.174])
 by APP-05 (Coremail) with SMTP id zQCowAC3v_fCqYRj_UQNAw--.18159S3;
 Mon, 28 Nov 2022 20:29:56 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 1/9] target/riscv: add cfg properties for Zc* extension
Date: Mon, 28 Nov 2022 20:29:05 +0800
Message-Id: <20221128122913.55611-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128122913.55611-1-liweiwei@iscas.ac.cn>
References: <20221128122913.55611-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3v_fCqYRj_UQNAw--.18159S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF1DurykXFy5JrWkJFb_yoW8KF15pr
 48G3yYkrWDJr17C3yfXF1UK3Z8Wwn29ayIg392q3WxuFW7ArW5XF1vkw1UWF45tFs5Xa1a
 9F17CFy5CwsrJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
 j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
 W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU==
X-Originating-IP: [180.175.30.174]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 28 Nov 2022 12:30:13 -0000

Add properties for Zca,Zcb,Zcf,Zcd,Zcmp,Zcmt extension
Add check for these properties

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  6 ++++++
 2 files changed, 49 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c705331bbe..9f4aa0fe55 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -808,6 +808,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


