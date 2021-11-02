Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhu0k-0000e9-Hv
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 09:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhkEN-00031n-EB; Mon, 01 Nov 2021 23:13:00 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:34846 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhkEI-0004mv-Ub; Mon, 01 Nov 2021 23:12:59 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mO2qrIBh7YkSBg--.46962S5;
 Tue, 02 Nov 2021 11:12:46 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: luruibo2000@163.com, lustrew@foxmail.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, liweiwei@iscas.ac.cn
Subject: [RFC 3/6] target/riscv: rvk: add flag support for
 Zk/Zkn/Zknd/Zknd/Zkne/Zknh/Zks/Zksed/Zksh/Zkr
Date: Tue,  2 Nov 2021 11:11:25 +0800
Message-Id: <20211102031128.17296-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowAC3mO2qrIBh7YkSBg--.46962S5
X-Coremail-Antispam: 1UD129KBjvJXoWxAF4UWr45uw43Zr1fWr43Awb_yoW5XFy8pr
 yDGayYkr9rJF13Cw4fJFyDJrWrWw1fA34Ig392q3Z3GrWxKrW3JF1DC3WDuF4FgF4rX3Wf
 WF13CF1jkFZ2ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5U
 UUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Nov 2021 09:39:15 -0400
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
X-List-Received-Date: Tue, 02 Nov 2021 03:13:00 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 36 ++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  9 +++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0f03d3efba..d7e026df36 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -491,6 +491,33 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_d = true;
         }
 
+        if (cpu->cfg.ext_zk) {
+            cpu->cfg.ext_zbkb = true;
+            cpu->cfg.ext_zbkc = true;
+            cpu->cfg.ext_zbkx = true;
+            cpu->cfg.ext_zknd = true;
+            cpu->cfg.ext_zkne = true;
+            cpu->cfg.ext_zknh = true;
+            cpu->cfg.ext_zkr = true;
+        }
+
+        if (cpu->cfg.ext_zkn) {
+            cpu->cfg.ext_zbkb = true;
+            cpu->cfg.ext_zbkc = true;
+            cpu->cfg.ext_zbkx = true;
+            cpu->cfg.ext_zknd = true;
+            cpu->cfg.ext_zkne = true;
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
@@ -642,6 +669,15 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbkb", RISCVCPU, cfg.ext_zbkb, false),
     DEFINE_PROP_BOOL("x-zbkc", RISCVCPU, cfg.ext_zbkc, false),
     DEFINE_PROP_BOOL("x-zbkx", RISCVCPU, cfg.ext_zbkx, false),
+    DEFINE_PROP_BOOL("x-zk", RISCVCPU, cfg.ext_zk, false),
+    DEFINE_PROP_BOOL("x-zkn", RISCVCPU, cfg.ext_zkn, false),
+    DEFINE_PROP_BOOL("x-zknd", RISCVCPU, cfg.ext_zknd, false),
+    DEFINE_PROP_BOOL("x-zkne", RISCVCPU, cfg.ext_zkne, false),
+    DEFINE_PROP_BOOL("x-zknh", RISCVCPU, cfg.ext_zknh, false),
+    DEFINE_PROP_BOOL("x-zks", RISCVCPU, cfg.ext_zks, false),
+    DEFINE_PROP_BOOL("x-zksed", RISCVCPU, cfg.ext_zksed, false),
+    DEFINE_PROP_BOOL("x-zksh", RISCVCPU, cfg.ext_zksh, false),
+    DEFINE_PROP_BOOL("x-zkr", RISCVCPU, cfg.ext_zkr, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f9f4437efc..de706a7d18 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -312,6 +312,15 @@ struct RISCVCPU {
         bool ext_zbkb;
         bool ext_zbkc;
         bool ext_zbkx;
+        bool ext_zk;
+        bool ext_zkn;
+        bool ext_zknd;
+        bool ext_zkne;
+        bool ext_zknh;
+        bool ext_zks;
+        bool ext_zksed;
+        bool ext_zksh;
+        bool ext_zkr;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.17.1


