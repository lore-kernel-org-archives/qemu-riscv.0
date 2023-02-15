Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS7BR-0001MZ-Ey
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 21:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pS7BO-0001LY-TN; Tue, 14 Feb 2023 21:06:06 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pS7BJ-0000DW-PK; Tue, 14 Feb 2023 21:06:06 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABXcNT4PexjNkcoBQ--.2339S9;
 Wed, 15 Feb 2023 10:05:50 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 07/14] target/riscv: Indent fixes in cpu.c
Date: Wed, 15 Feb 2023 10:05:32 +0800
Message-Id: <20230215020539.4788-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215020539.4788-1-liweiwei@iscas.ac.cn>
References: <20230215020539.4788-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABXcNT4PexjNkcoBQ--.2339S9
X-Coremail-Antispam: 1UD129KBjvJXoWxury3Jw4UGFyDury7Xw1xAFb_yoW5GF4rpr
 sxG34SkFZrtw17X3yfXF1Ut3W5GrySqa1xK393Zw1kWF4fArs8Jr9FkF1SgFW7JFn5GFWa
 gw1UZrn8Zw4DJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
 JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
 0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
 JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
 A2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
 43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7V
 UbmZX7UUUUU==
X-Originating-IP: [114.95.238.225]
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
X-List-Received-Date: Wed, 15 Feb 2023 02:06:07 -0000

Fix indent problems in vector related check.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e9832ea544..44abadc811 100644
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


