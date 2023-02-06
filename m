Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOxD1-0005zW-Fk
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 03:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pOxCy-0005zD-U9; Mon, 06 Feb 2023 03:50:42 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pOxCv-0002Su-3j; Mon, 06 Feb 2023 03:50:40 -0500
X-QQ-mid: bizesmtp63t1675673411t9f2k3ul
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 06 Feb 2023 16:50:08 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: xKEg0Zr6dIuBOffnA9BfO3CQ766Yx4OKoXA1KWH5jsSQX52Juep9WVFB1Troe
 f90B8Zu5FyeUiPtE6dH3ONaKkQTG8tFKX9XX7vF/1/wI+WpUD/rk+umOZHp7d3RhBuDZ5Fo
 TBmDKnfQjmqFb7d1GaMIEU7tqJANKht/5uGJ9/+7uVOM3nG3BI5hIpa+HH2wS8p1Te6/IkQ
 lNg8RWGlbBrJrd7raODtpGBJit+K2om9K8kGXiQ4aK+TP9G6Byo7NBmTwRyZdHy7pZ9q349
 7JKw/W75sbpJ7MR1++oLzOlwj2zSKkSmq5tOTsplbVh0nMTB1tCVQFJlHPtjKHtON2og==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH] hw/riscv: virt: Simplify virt_{get,set}_aclint()
Date: Mon,  6 Feb 2023 16:50:07 +0800
Message-Id: <20230206085007.3618715-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
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
X-List-Received-Date: Mon, 06 Feb 2023 08:50:42 -0000

There is no need to declare an intermediate "MachineState *ms".

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/riscv/virt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a11b4b010..bdb6b93115 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1577,16 +1577,14 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
 
 static bool virt_get_aclint(Object *obj, Error **errp)
 {
-    MachineState *ms = MACHINE(obj);
-    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
 
     return s->have_aclint;
 }
 
 static void virt_set_aclint(Object *obj, bool value, Error **errp)
 {
-    MachineState *ms = MACHINE(obj);
-    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
 
     s->have_aclint = value;
 }
-- 
2.25.1


