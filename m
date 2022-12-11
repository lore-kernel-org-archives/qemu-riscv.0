Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4Cpi-0003fx-6E
	for mharc-qemu-riscv@gnu.org; Sat, 10 Dec 2022 22:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpX-0003Zr-7J; Sat, 10 Dec 2022 22:16:43 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpU-000095-Vf; Sat, 10 Dec 2022 22:16:42 -0500
X-QQ-mid: bizesmtp68t1670728139t52hm0w7
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:08:58 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: znfcQSa1hKaXpp03g6dMijOvFN+4DHqUoJOhx19v0wa1cHzp1XxvbHYiuagdP
 2t/0mHcvmdgPgeLTZr75+hJ7UoL5zyw2f7n5+N+lGo9SrqdAQdLJQ/6AvOCsbII4qd+ngJw
 qwRadq9neOBG5RUmCuQgIpC4WO8h8JS7H0ShHGfZ6478agZU18a3Ya+0aTgdlR6OaMqoBcq
 4CaAQWdzz/ApSjhVqGWIkmNryXiz/srzoS59JXU18j/tFNZEy8UdnPk3C/9D8b7R7j4pD1W
 McFpys3S/mdJftMMeBoHfgv+AqHtDhdVd6DzNCn5TknOtAefKipo1w5BG2Zbdayit47M4Gf
 r/GXAefOCwv9aGKGHMbQR2hpK0XQbrIYmtRID+rLtyZ39IbwmKKlQCY6/8Htg==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 11/16] hw/riscv: sifive_e: Fix the number of interrupt
 sources of PLIC
Date: Sun, 11 Dec 2022 11:08:24 +0800
Message-Id: <20221211030829.802437-11-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211030829.802437-1-bmeng@tinylab.org>
References: <20221211030829.802437-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
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
X-List-Received-Date: Sun, 11 Dec 2022 03:16:45 -0000

Per chapter 10 in Freedom E310 manuals [1][2][3], E310 G002 and G003
supports 52 interrupt sources while G000 supports 51 interrupt sources.

We use the value of G002 and G003, so it is 53 (including source 0).

[1] G000 manual:
https://sifive.cdn.prismic.io/sifive/4faf3e34-4a42-4c2f-be9e-c77baa4928c7_fe310-g000-manual-v3p2.pdf

[2] G002 manual:
https://sifive.cdn.prismic.io/sifive/034760b5-ac6a-4b1c-911c-f4148bb2c4a5_fe310-g002-v1p5.pdf

[3] G003 manual:
https://sifive.cdn.prismic.io/sifive/3af39c59-6498-471e-9dab-5355a0d539eb_fe310-g003-manual.pdf

Fixes: eb637edb1241 ("SiFive Freedom E Series RISC-V Machine")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/riscv/sifive_e.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index d738745925..9e58247fd8 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -82,7 +82,12 @@ enum {
 };
 
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
-#define SIFIVE_E_PLIC_NUM_SOURCES 127
+/*
+ * Freedom E310 G002 and G003 supports 52 interrupt sources while
+ * Freedom E310 G000 supports 51 interrupt sources. We use the value
+ * of G002 and G003, so it is 53 (including interrupt source 0).
+ */
+#define SIFIVE_E_PLIC_NUM_SOURCES 53
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
 #define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
-- 
2.34.1


