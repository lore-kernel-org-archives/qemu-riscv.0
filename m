Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQL7-0000KQ-69
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQL5-0000Iz-Jy; Tue, 11 Apr 2023 22:36:03 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQL2-0008U4-Eq; Tue, 11 Apr 2023 22:36:03 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowAC3vDABGTZkp2E_EQ--.55592S3;
 Wed, 12 Apr 2023 10:35:46 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 1/5] target/riscv: Add properties for BF16 extensions
Date: Wed, 12 Apr 2023 10:33:16 +0800
Message-Id: <20230412023320.50706-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3vDABGTZkp2E_EQ--.55592S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4rGFyrZFyfAFWUKr4fGrg_yoW8Cr43pr
 srGa4YkryDXry7C3yxJFyUtw1UGws7Wr4xK39aqwn3WFWaqrW5XFn8Cw1UWr4UJF4rXF43
 uw1qyFW5Zr4jva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
 kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoXUUUU
 U
X-Originating-IP: [180.165.241.15]
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
X-List-Received-Date: Wed, 12 Apr 2023 02:36:03 -0000

Add ext_zfbfmin/zvfbfmin/zvfbfwma properties.
Add require check for BF16 extensions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 13 +++++++++++++
 target/riscv/cpu.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..c19bbb41fb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -874,6 +874,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if ((cpu->cfg.ext_zfbfmin | cpu->cfg.ext_zvfbfmin |
+         cpu->cfg.ext_zvfbfwma) && !cpu->cfg.ext_f) {
+        error_setg(errp, "BF16 extensions require F extension");
+        return;
+    }
+
     if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
         error_setg(errp, "D extension requires F extension");
         return;
@@ -918,6 +924,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if ((cpu->cfg.ext_zvfbfmin | cpu->cfg.ext_zvfbfwma) &&
+        !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfbfmin/Zvfbfwma extensions require Zve32f "
+                         "extension");
+        return;
+    }
+
     /* Set the ISA extensions, checks should have happened above */
     if (cpu->cfg.ext_zhinx) {
         cpu->cfg.ext_zhinxmin = true;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..6c99a82624 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -462,6 +462,7 @@ struct RISCVCPUConfig {
     bool ext_svpbmt;
     bool ext_zdinx;
     bool ext_zawrs;
+    bool ext_zfbfmin;
     bool ext_zfh;
     bool ext_zfhmin;
     bool ext_zfinx;
@@ -471,6 +472,8 @@ struct RISCVCPUConfig {
     bool ext_zve64f;
     bool ext_zve64d;
     bool ext_zmmul;
+    bool ext_zvfbfmin;
+    bool ext_zvfbfwma;
     bool ext_zvfh;
     bool ext_zvfhmin;
     bool ext_smaia;
-- 
2.25.1


