Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rHt-0004bH-ID
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHr-0004a1-8H; Wed, 07 Dec 2022 05:04:23 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHn-0005rE-E7; Wed, 07 Dec 2022 05:04:23 -0500
X-QQ-mid: bizesmtp63t1670407446tc09wn27
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:04:05 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: CEO3k+BsRkIAUuBXM7JEPeNKoQwu8Fi13FhefNBWoTeutJKCKGFWntDkSoM+h
 LhpQof9BrU2BwyKfA+rbN3KXnHehwOI4g5Wwgub4RpOmLnaLgPhChlKsY9JtfftvT97Rbxq
 IInou+06Z91X9x7u9VuXZokhtJKTbG+Ry2zyuIMpMFb3xlTJMEnEk+HPytfaWSp0g2HT1z9
 aoxMmGQDXc3CUtQzgUUBnDapdTT8njyI+zGJyZylk79yVMZJJoubjkSp6mEFmmH8oFNz9TJ
 s9vor9+aPapF9wkvFyLCBbFWEy7e11XTiFbG6VrbF/OkaOZX34vt+OIA8oPSq9SxhrUnm9Z
 E2ia6DOWeDlscLrVzC2kheZFE5NGD1LXHgB72aQ50KQFMg5lrPamJ0XO4tbsw==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 11/16] hw/riscv: sifive_e: Fix the number of interrupt
 sources of PLIC
Date: Wed,  7 Dec 2022 18:03:30 +0800
Message-Id: <20221207100335.290481-11-bmeng@tinylab.org>
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
X-List-Received-Date: Wed, 07 Dec 2022 10:04:23 -0000

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


