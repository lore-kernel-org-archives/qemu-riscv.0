Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kFB-0008Em-7r
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF5-00089X-Ji; Thu, 01 Dec 2022 09:08:47 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF1-0008Ci-D3; Thu, 01 Dec 2022 09:08:47 -0500
X-QQ-mid: bizesmtp72t1669903710te4hljvq
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:29 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: mRz6/7wsmIgzXs1O082s/ZRXdi4VbChXlyVAHitWl8rMdGGBmmKV3/jbEerSU
 R459CwEsaGe8K0KWfbMCpzhBl1Fw6NawNjGZlTB4h1tHoX4f2TZym5gj0g4zHGE0PC/khQH
 60h+yVlgwBNd5LlZjUCbb6WfZYvBFZtYRl2Th6ubVsvfrr3m0QDJyQhDua1bsow+OU6kKLi
 b3KPThCp/eY4wz5D8IZCfjvkAn7O4yvW4Be8fQxdRswVi3Np7W5u6zPc26IW+lSsfXrlXSj
 GYtWGC18OTpPNZBBkN2xJDaLhBDL+M0ai8Ny7gDzOVom7nvXcBTbEM/V4yUFaG/Jrq84gPE
 DUaDaXyJVIZp4iMIl+g1NZPCwfCAsvLWz3oHuGz93/llwtIVdU=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 08/15] hw/intc: sifive_plic: Update "num-sources" property
 default value
Date: Thu,  1 Dec 2022 22:08:04 +0800
Message-Id: <20221201140811.142123-8-bmeng@tinylab.org>
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
X-List-Received-Date: Thu, 01 Dec 2022 14:08:48 -0000

At present the default value of "num-sources" property is zero,
which does not make a lot of sense, as in sifive_plic_realize()
we see s->bitfield_words is calculated by:

  s->bitfield_words = (s->num_sources + 31) >> 5;

if the we don't configure "num-sources" property its default value
zero makes s->bitfield_words zero too, which isn't true because
interrupt source 0 still occupies one word.

Let's change the default value to 1 meaning that only interrupt
source 0 is supported by default and a sanity check in realize().

While we are here, add a comment to describe the exact meaning of
this property that the number should include interrupt source 0.
A wrong multi-line comment format is corrected too.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/intc/sifive_plic.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 5fd9a53569..2bd292410d 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -363,6 +363,11 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
 
     parse_hart_config(s);
 
+    if (!s->num_sources) {
+        error_report("plic: invalid number of interrupt sources");
+        exit(1);
+    }
+
     s->bitfield_words = (s->num_sources + 31) >> 5;
     s->num_enables = s->bitfield_words * s->num_addrs;
     s->source_priority = g_new0(uint32_t, s->num_sources);
@@ -379,7 +384,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     s->m_external_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
 
-    /* We can't allow the supervisor to control SEIP as this would allow the
+    /*
+     * We can't allow the supervisor to control SEIP as this would allow the
      * supervisor to clear a pending external interrupt which will result in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
      * hardware controlled when a PLIC is attached.
@@ -419,7 +425,8 @@ static const VMStateDescription vmstate_sifive_plic = {
 static Property sifive_plic_properties[] = {
     DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
     DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
-    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
+    /* number of interrupt sources including interrupt source 0 */
+    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 1),
     DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities, 0),
     DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, 0),
     DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0),
-- 
2.34.1


