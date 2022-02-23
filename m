Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMnd4-0001xJ-Ee
	for mharc-qemu-riscv@gnu.org; Wed, 23 Feb 2022 04:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnd1-0001rL-O3; Wed, 23 Feb 2022 04:08:07 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncz-00023Q-5H; Wed, 23 Feb 2022 04:08:07 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 89B0021EC7;
 Wed, 23 Feb 2022 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qk+gMrnBuDwA4drP9M9tff9or15I+dFur3lZMPXIvp0=;
 b=NqvYpP9ztjWoFW3/YETDtLGUC3hSVlYVEiMIfX4oESzcUt8ef01tQLp5rrk4SbKFhexk0F
 QMtjgYMJDoxiqHa7QMJNIQlFudjpyPUmGLsc7v4FfSbaj7LH+RStSH+jcqHWa78C07ZiVs
 WL3VglpG7Le0+b2FqB9ckbWF9J3XhW8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org (open list:OpenTitan)
Subject: [PATCH v4 14/14] hw: set user_creatable on opentitan/sifive_e devices
Date: Wed, 23 Feb 2022 10:07:06 +0100
Message-Id: <20220223090706.4888-15-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 23 Feb 2022 09:08:08 -0000

The devices are:
+ ibex-timer
+ ibex-uart
+ riscv.aclint.swi
+ riscv.aclint.mtimer
+ riscv.hart_array
+ riscv.sifive.e.prci
+ riscv.sifive.plic
+ riscv.sifive.uart
+ sifive_soc.gpio
+ unimplemented-device

These devices are clean regarding error handling in realize.

They are all sysbus devices, so setting user-creatable will only
enable cold-plugging them on machine having explicitely allowed them
(only _none_ machine does that).

Note that this commit include the ricv_array which embeds cpus. There
are some deep internal constraints about them: you cannot create more
cpus than the machine's maxcpus. TCG accelerator's code will for example
assert if a user try to create too many cpus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

I can also split this patch if you think it's better.
But it is mostly a one-line fix per file.

This patch requires first some cleanups in order to fix error errors
and some more memory leaks that could happend in legit user-related
life cycles: a miss-configuration should not be a fatal error anymore.
https://lore.kernel.org/qemu-devel/20220218164646.132112-1-damien.hedde@greensocs.com
---
 hw/char/ibex_uart.c     | 1 +
 hw/char/sifive_uart.c   | 1 +
 hw/gpio/sifive_gpio.c   | 1 +
 hw/intc/riscv_aclint.c  | 2 ++
 hw/intc/sifive_plic.c   | 1 +
 hw/misc/sifive_e_prci.c | 8 ++++++++
 hw/misc/unimp.c         | 1 +
 hw/riscv/riscv_hart.c   | 1 +
 hw/timer/ibex_timer.c   | 1 +
 9 files changed, 17 insertions(+)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index e58181fcf4..0b6d45f2e7 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -546,6 +546,7 @@ static void ibex_uart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
     dc->reset = ibex_uart_reset;
     dc->realize = ibex_uart_realize;
     dc->vmsd = &vmstate_ibex_uart;
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 1c75f792b3..6e88778c03 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -243,6 +243,7 @@ static void sifive_uart_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     ResettableClass *rc = RESETTABLE_CLASS(oc);
 
+    dc->user_creatable = true;
     dc->realize = sifive_uart_realize;
     dc->vmsd = &vmstate_sifive_uart;
     rc->phases.enter = sifive_uart_reset_enter;
diff --git a/hw/gpio/sifive_gpio.c b/hw/gpio/sifive_gpio.c
index 78bf29e996..8443befa20 100644
--- a/hw/gpio/sifive_gpio.c
+++ b/hw/gpio/sifive_gpio.c
@@ -380,6 +380,7 @@ static void sifive_gpio_class_init(ObjectClass *klass, void *data)
     dc->realize = sifive_gpio_realize;
     dc->reset = sifive_gpio_reset;
     dc->desc = "SiFive GPIO";
+    dc->user_creatable = true;
 }
 
 static const TypeInfo sifive_gpio_info = {
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index bef2e1988b..fbf63a52b7 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -283,6 +283,7 @@ static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     dc->realize = riscv_aclint_mtimer_realize;
     device_class_set_props(dc, riscv_aclint_mtimer_properties);
+    dc->user_creatable = true;
 }
 
 static const TypeInfo riscv_aclint_mtimer_info = {
@@ -466,6 +467,7 @@ static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     dc->realize = riscv_aclint_swi_realize;
     device_class_set_props(dc, riscv_aclint_swi_properties);
+    dc->user_creatable = true;
 }
 
 static const TypeInfo riscv_aclint_swi_info = {
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 8692ea6725..4e5831b487 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -434,6 +434,7 @@ static void sifive_plic_class_init(ObjectClass *klass, void *data)
 
     dc->reset = sifive_plic_reset;
     device_class_set_props(dc, sifive_plic_properties);
+    dc->user_creatable = true;
     dc->realize = sifive_plic_realize;
     dc->vmsd = &vmstate_sifive_plic;
 }
diff --git a/hw/misc/sifive_e_prci.c b/hw/misc/sifive_e_prci.c
index a8702c6a5d..7341823e43 100644
--- a/hw/misc/sifive_e_prci.c
+++ b/hw/misc/sifive_e_prci.c
@@ -97,11 +97,19 @@ static void sifive_e_prci_init(Object *obj)
     s->plloutdiv = SIFIVE_E_PRCI_PLLOUTDIV_DIV1;
 }
 
+static void sifive_e_prci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->user_creatable = true;
+}
+
 static const TypeInfo sifive_e_prci_info = {
     .name          = TYPE_SIFIVE_E_PRCI,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SiFiveEPRCIState),
     .instance_init = sifive_e_prci_init,
+    .class_init    = sifive_e_prci_class_init,
 };
 
 static void sifive_e_prci_register_types(void)
diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
index 6cfc5727f0..fb2a0b23dd 100644
--- a/hw/misc/unimp.c
+++ b/hw/misc/unimp.c
@@ -80,6 +80,7 @@ static void unimp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
     dc->realize = unimp_realize;
     device_class_set_props(dc, unimp_properties);
 }
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 4aed6c2a59..85fae44048 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -77,6 +77,7 @@ static void riscv_harts_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
     device_class_set_props(dc, riscv_harts_props);
     dc->realize = riscv_harts_realize;
 }
diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 8c2ca364da..d1cc337416 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -295,6 +295,7 @@ static void ibex_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
     dc->reset = ibex_timer_reset;
     dc->vmsd = &vmstate_ibex_timer;
     dc->realize = ibex_timer_realize;
-- 
2.35.1


