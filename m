Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rHo-0004Xx-Bd
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHj-0004SH-0R; Wed, 07 Dec 2022 05:04:17 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHf-0005Qc-Nt; Wed, 07 Dec 2022 05:04:13 -0500
X-QQ-mid: bizesmtp63t1670407434tgqkxgoa
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:03:53 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: FwowAM4HOqDeOYl6fTM2rbUy0nAlwA4gkI/W1xh57lzFvpPAZ77SS/zeGkqrf
 MkxV4TUNC2by/fSt2ji9jaUGRrVorHEJWdrV5eroc4T5xP4MQz8pot/cymfeyvROWKV1eU2
 XkntlvQ7iCyTURT2rd8YilNLSKyWKpxrcAdzXLzwxhiGWL/clKaMkY2wU21zwQMl5dRbtTi
 jNM8xitXZ1e58jKTVwAF9bOkiCBIlDp5wWjS97JeZdWYO1xzGXW7wItp1qGj8AuRR0DwMwD
 e0K6+HyphCIcBCLR+K5NS2QEmsx8ZC10NW4MLt/XVvsV5utdufa6MvXdbQeJoinoqFnqgFd
 WjPCMfSkSLw0Gm2FiECtOXyDIvsfFwK6PNM6c5BZcc81xKdtI8=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 07/16] hw/intc: sifive_plic: Improve robustness of the PLIC
 config parser
Date: Wed,  7 Dec 2022 18:03:26 +0800
Message-Id: <20221207100335.290481-7-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207100335.290481-1-bmeng@tinylab.org>
References: <20221207100335.290481-1-bmeng@tinylab.org>
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
X-List-Received-Date: Wed, 07 Dec 2022 10:04:18 -0000

At present the PLIC config parser can only handle legal config string
like "MS,MS". However if a config string like ",MS,MS,,MS,MS,," is
given the parser won't get the correct configuration.

This commit improves the config parser to make it more robust.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/intc/sifive_plic.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 936dcf74bc..c9af94a888 100644
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



