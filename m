Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4CpZ-0003aK-O1
	for mharc-qemu-riscv@gnu.org; Sat, 10 Dec 2022 22:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpN-0003Yd-W0; Sat, 10 Dec 2022 22:16:41 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpL-000871-Vu; Sat, 10 Dec 2022 22:16:33 -0500
X-QQ-mid: bizesmtp68t1670728131tr62qmyp
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:08:50 +0800 (CST)
X-QQ-SSF: 00200000000000B0C000000A0000000
X-QQ-FEAT: kg0HbTcTClHrnuLFV1s52/rUJcH4acwmLOd1dll/BlsgXeIOyzPs9nPs2C4yB
 HOVW9vXo1enBULq84QY4OulyopySHBVtjgfMTFu1L19ZRwVJUAyJTSxgeh2q1x+3BeBmH2+
 gNFrGzhtj6kEVeG5lmIEdEZxxWgJtTEYSpTh7+yYCFbPSnAToVkTXOkNoi8FpH5Is4aYVoB
 9EG1a14h074r3vkCAcFpo96R5skmrFHQ6e8ShUxi8dtss3WdTyc0kMYwNvU9Uqg5VMA7QFC
 e2GUhwaG8goaYcOcC4tNp/aAwts7atbt6DhBf0tEVObL86mHLUyDGlXXDmFUmNALUJhyqMT
 aVYe5+eplMlaxbE3dALYrwe4dep+GLbx9B0oHNRvpRwIW8pyHg=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 08/16] hw/intc: sifive_plic: Use error_setg() to propagate
 the error up via errp in sifive_plic_realize()
Date: Sun, 11 Dec 2022 11:08:21 +0800
Message-Id: <20221211030829.802437-8-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211030829.802437-1-bmeng@tinylab.org>
References: <20221211030829.802437-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Sun, 11 Dec 2022 03:16:42 -0000

The realize() callback has an errp for us to propagate the error up.
While we are here, correct the wrong multi-line comment format.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

---

Changes in v3:
- Fix the typo in the commit message

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



