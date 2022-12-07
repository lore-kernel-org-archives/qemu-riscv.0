Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rHn-0004UB-7D
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHk-0004Se-T1; Wed, 07 Dec 2022 05:04:17 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHh-0005Ur-LK; Wed, 07 Dec 2022 05:04:15 -0500
X-QQ-mid: bizesmtp63t1670407437tj8ehx7y
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:03:56 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: f+ZzKTjTzV3kuvRgkydlCISIFB4Iu1/5xhbBsW/dCBu9Urt8DndUAlGbbCvnF
 KivxeotxlhCUeMBExHwka7I/KWXXuB9Yu7UQNtyOmAi77IP3D0HKik4DTENG/PyYVyHjpUf
 S6pX7brvqmqHJLhI8gVZyZFT83vHAvvg/Rgqul1ApGHw7fgaIlvRMxV2jR4EKXDbU6Ys9vr
 BegEAA6pDwgZW6FLBW6FNwEa43RaCQ8tkhBAwBfO8dsEsiiB6NoK4symKBCxCbutqCNcAJF
 PEF5jjHyegACEJKe2VuXhc2+7Nl9LD97mokvIdC3es+5SDJsSFGyJaYp3LXCSgeHceXYjsn
 9auIU0BPzKY2OoiRfVw/TNnWnraK/ra7J7nC32XbFWmPW14qX8=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 08/16] hw/intc: sifive_plic: Use error_setg() to propagate
 the error up via errp in sifive_plic_realize()
Date: Wed,  7 Dec 2022 18:03:27 +0800
Message-Id: <20221207100335.290481-8-bmeng@tinylab.org>
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

The realize() callback has an errp for us to propagate the error up.
While we are here, corret the wrong multi-line comment format.

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

Changes in v2:
- new patch: "hw/intc: sifive_plic: Use error_setg() to propagate the error up via errp in sifive_plic_realize()"

 hw/intc/sifive_plic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c9af94a888..9cb4c6d6d4 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -379,7 +379,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     s->m_external_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
 
-    /* We can't allow the supervisor to control SEIP as this would allow the
+    /*
+     * We can't allow the supervisor to control SEIP as this would allow the
      * supervisor to clear a pending external interrupt which will result in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
      * hardware controlled when a PLIC is attached.
@@ -387,8 +388,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->num_harts; i++) {
         RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
         if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
-            error_report("SEIP already claimed");
-            exit(1);
+            error_setg(errp, "SEIP already claimed");
+            return;
         }
     }
 
-- 
2.34.1


