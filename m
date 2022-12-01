Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kFA-0008Dr-Nr
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF4-00087u-Aq; Thu, 01 Dec 2022 09:08:46 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kEy-0008C5-Q1; Thu, 01 Dec 2022 09:08:46 -0500
X-QQ-mid: bizesmtp72t1669903708t8z7dn8p
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:27 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: ILHsT53NKPiwx2gKaK3oHeAJLqs2Aya5ESKfUXoP3PU6MeV8ILxP6x5TvpbIb
 xyX2MtIL85LEaYTPTZn5qLB+0nXfD/tbxbsy1T5+qH4dcLOz4la55Mg9F0oKvlrCJlkuw0X
 J0eVcVz9c/AVPvf89B4c5NHxB7JaWbUcidMWmt3oViHoZc+FWXsgePiS2uvy0h6uXYrd1XX
 P6KxZkPzA0iQjH1tpXKJIT7nRfELOinFK9Ocid03GgYmFktyp9FE4QHveMvNX6vUJBQ7XFI
 tJ+F7QaMJIRSIIjT1K7QhCjH/tOw0L9+PXup/LqhglY74fOSRv0k7CiIj8BENJ4yNldd//x
 AL0gcfmipFdfvPVRNISCr3GftaHBTofJYL68e47chNcKJ7hT+0=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 07/15] hw/intc: sifive_plic: Improve robustness of the PLIC
 config parser
Date: Thu,  1 Dec 2022 22:08:03 +0800
Message-Id: <20221201140811.142123-7-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 01 Dec 2022 14:08:46 -0000

At present the PLIC config parser can only handle legal config string
like "MS,MS". However if a config string like ",MS,MS,,MS,MS,," is
given the parser won't get the correct configuration.

This commit improves the config parser to make it more robust.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/intc/sifive_plic.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 3f6ffb1d70..5fd9a53569 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -290,7 +290,7 @@ static void sifive_plic_reset(DeviceState *dev)
  */
 static void parse_hart_config(SiFivePLICState *plic)
 {
-    int addrid, hartid, modes;
+    int addrid, hartid, modes, m;
     const char *p;
     char c;
 
@@ -299,11 +299,13 @@ static void parse_hart_config(SiFivePLICState *plic)
     p = plic->hart_config;
     while ((c = *p++)) {
         if (c == ',') {
-            addrid += ctpop8(modes);
-            modes = 0;
-            hartid++;
+            if (modes) {
+                addrid += ctpop8(modes);
+                hartid++;
+                modes = 0;
+            }
         } else {
-            int m = 1 << char_to_mode(c);
+            m = 1 << char_to_mode(c);
             if (modes == (modes | m)) {
                 error_report("plic: duplicate mode '%c' in config: %s",
                              c, plic->hart_config);
@@ -314,8 +316,9 @@ static void parse_hart_config(SiFivePLICState *plic)
     }
     if (modes) {
         addrid += ctpop8(modes);
+        hartid++;
+        modes = 0;
     }
-    hartid++;
 
     plic->num_addrs = addrid;
     plic->num_harts = hartid;
@@ -326,11 +329,16 @@ static void parse_hart_config(SiFivePLICState *plic)
     p = plic->hart_config;
     while ((c = *p++)) {
         if (c == ',') {
-            hartid++;
+            if (modes) {
+                hartid++;
+                modes = 0;
+            }
         } else {
+            m = char_to_mode(c);
             plic->addr_config[addrid].addrid = addrid;
             plic->addr_config[addrid].hartid = hartid;
-            plic->addr_config[addrid].mode = char_to_mode(c);
+            plic->addr_config[addrid].mode = m;
+            modes |= (1 << m);
             addrid++;
         }
     }
-- 
2.34.1


