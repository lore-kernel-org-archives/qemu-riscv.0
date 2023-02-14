Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRqpx-00007h-3g
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqpu-00005h-ID; Tue, 14 Feb 2023 03:38:50 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqpr-0001rc-Nw; Tue, 14 Feb 2023 03:38:50 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowADHz5uOSOtjHFQsBQ--.41555S9;
 Tue, 14 Feb 2023 16:38:43 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [Patch 07/14] target/riscv: Indent fixes in cpu.c
Date: Tue, 14 Feb 2023 16:38:26 +0800
Message-Id: <20230214083833.44205-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHz5uOSOtjHFQsBQ--.41555S9
X-Coremail-Antispam: 1UD129KBjvJXoWxZF15WF1xWr1rXrWDGF43trb_yoW5Jw45pr
 sxG34SkF9rtw17X3yfXF1Ut3W5GrySqa1xK393Zw1kCF4fCrs8Jr9FkF1S9FW7JFn5GFWa
 gw1UZFn8uw4DJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTY
 UUUUU
X-Originating-IP: [114.95.238.225]
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
X-List-Received-Date: Tue, 14 Feb 2023 08:38:50 -0000

Fix indent problems in vector related check

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8fe76707a0..73711d392d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -798,7 +798,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
         if (cpu->cfg.ext_f) {
             error_setg(errp,
-                "Zfinx cannot be supported together with F extension");
+                       "Zfinx cannot be supported together with F extension");
             return;
         }
     }
@@ -861,40 +861,40 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVV;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
-                    "Vector extension VLEN must be power of 2");
+                       "Vector extension VLEN must be power of 2");
             return;
         }
         if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
             error_setg(errp,
-                    "Vector extension implementation only supports VLEN "
-                    "in the range [128, %d]", RV_VLEN_MAX);
+                       "Vector extension implementation only supports VLEN "
+                       "in the range [128, %d]", RV_VLEN_MAX);
             return;
         }
         if (!is_power_of_2(cpu->cfg.elen)) {
             error_setg(errp,
-                    "Vector extension ELEN must be power of 2");
+                       "Vector extension ELEN must be power of 2");
             return;
         }
-    if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
-        error_setg(errp,
-                "Vector extension implementation only supports ELEN "
-                "in the range [8, 64]");
-        return;
-    }
-    if (cpu->cfg.vext_spec) {
-        if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
-            vext_version = VEXT_VERSION_1_00_0;
-        } else {
+        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
             error_setg(errp,
-                   "Unsupported vector spec version '%s'",
-                   cpu->cfg.vext_spec);
+                       "Vector extension implementation only supports ELEN "
+                       "in the range [8, 64]");
             return;
         }
-    } else {
-        qemu_log("vector version is not specified, "
-                 "use the default value v1.0\n");
-    }
-    set_vext_version(env, vext_version);
+        if (cpu->cfg.vext_spec) {
+            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+                vext_version = VEXT_VERSION_1_00_0;
+            } else {
+                error_setg(errp,
+                           "Unsupported vector spec version '%s'",
+                           cpu->cfg.vext_spec);
+                return;
+            }
+        } else {
+            qemu_log("vector version is not specified, "
+                     "use the default value v1.0\n");
+        }
+        set_vext_version(env, vext_version);
     }
     if (cpu->cfg.ext_j) {
         ext |= RVJ;
-- 
2.25.1


