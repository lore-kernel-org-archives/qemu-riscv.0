Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vma-00061e-1c
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl9-00037V-DS
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl7-0004fE-0X
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:07 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50840)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vl6-0004ef-QF
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:04 -0500
Received: by mail-pj1-x1029.google.com with SMTP id nm6so143791pjb.0
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=QkFXHaLS5zlcI8OA2QDono5LxTYgDFUD9/bo7kYQTas=;
 b=Rv/G8zGPxbtwWgkO0FUOC2raCL/iRkF3CaxIs8T6Rpf3hDXPywrA6si1Qzt+naSAV7
 TFvR89SVq9S87iRm4nNAd9KDe5hszuBn4ehjdQWvnE4K/cWssJ0ZmtvUvJYoURmsaW3O
 o2GEnInxZOEVhIpVM8DYkkM8/qeCMPj60KOwCX93leoMeTeHBrcD9oHtQiF5/BsKxL1u
 oG9fSTL3EqVhjJVUiLXZf2lptGOvxsRZZnpDIhfdVwQRNcpXS8S/eL6PQRrHRLEh6kZC
 4dhyk0yujTRk9y6dJT+pN14AeqYV/aY1BTsvVDl8dXNGh2BCrv3Xm98I/H5btMObf6ke
 uTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=QkFXHaLS5zlcI8OA2QDono5LxTYgDFUD9/bo7kYQTas=;
 b=T6+d9jUEjeOVGw3H9/T1C+DXamWuLSNFG8CLuZXph8+dLFyePFhacBnbo79zFFRUvV
 uclA/m/sf6ppCeZZ7PdRnzLuwUd4aIcRUkR02VEPgrDlJ9SDBuYTtz9QXl/sLal6EAtR
 kSOPqZBU4z9Wuhx10efFta8I02OvM+iIi1VRG3rVVmq/LiIV4PwwgIvLED/YW+pbkWEr
 +Gd8i0SA8/UXn4rz8NZ0Ecqbd7eYQEx8o1G3cF1g81BAQ6JThms6G6c9TV6D78pqcueu
 QUFOrszrlLNMYmos+MMITdyFI8khGwA8i44xDL8QLhTnX6U9VNlrvyqpeaPsUsunWVoV
 gnVg==
X-Gm-Message-State: ANhLgQ3lFSDwgCfhKsy/wjTP6HDgWFzmRkeC2GWbZ65QdEusOq6f+Vzk
 Op83uMFbKj7YYHiBvatXF8gJz+wu70r7OQ==
X-Google-Smtp-Source: ADFU+vvDAPOQnKqfImIbbsB7ZdmCppOth4QLMuaewn8JykUc2tk0O0yENetS6cKY/mTTO5zPFsmQsQ==
X-Received: by 2002:a17:902:fe05:: with SMTP id
 g5mr1719431plj.248.1583196603312; 
 Mon, 02 Mar 2020 16:50:03 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id y7sm9656801pfq.15.2020.03.02.16.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:50:02 -0800 (PST)
Subject: [PULL 38/38] hw/riscv: Provide rdtime callback for TCG in CLINT
 emulation
Date: Mon,  2 Mar 2020 16:48:48 -0800
Message-Id: <20200303004848.136788-39-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1029
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2020 00:50:09 -0000

From: Anup Patel <anup.patel@wdc.com>

This patch extends CLINT emulation to provide rdtime callback for
TCG. This rdtime callback will be called wheneven TIME CSRs are
read in privileged modes.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/sifive_clint.c         | 6 +++++-
 hw/riscv/sifive_e.c             | 2 +-
 hw/riscv/sifive_u.c             | 2 +-
 hw/riscv/spike.c                | 9 ++++++---
 hw/riscv/virt.c                 | 2 +-
 include/hw/riscv/sifive_clint.h | 3 ++-
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
index e2feee871b..e933d35092 100644
--- a/hw/riscv/sifive_clint.c
+++ b/hw/riscv/sifive_clint.c
@@ -227,7 +227,8 @@ type_init(sifive_clint_register_types)
  * Create CLINT device.
  */
 DeviceState *sifive_clint_create(hwaddr addr, hwaddr size, uint32_t num_harts,
-    uint32_t sip_base, uint32_t timecmp_base, uint32_t time_base)
+    uint32_t sip_base, uint32_t timecmp_base, uint32_t time_base,
+    bool provide_rdtime)
 {
     int i;
     for (i = 0; i < num_harts; i++) {
@@ -236,6 +237,9 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size, uint32_t num_harts,
         if (!env) {
             continue;
         }
+        if (provide_rdtime) {
+            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc);
+        }
         env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                   &sifive_clint_timer_cb, cpu);
         env->timecmp = 0;
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 8a6b0348df..a254cad489 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -164,7 +164,7 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_E_PLIC].size);
     sifive_clint_create(memmap[SIFIVE_E_CLINT].base,
         memmap[SIFIVE_E_CLINT].size, ms->smp.cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, false);
     create_unimplemented_device("riscv.sifive.e.aon",
         memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
     sifive_e_prci_create(memmap[SIFIVE_E_PRCI].base);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0e12b3ccef..156a003642 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -549,7 +549,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_IRQ));
     sifive_clint_create(memmap[SIFIVE_U_CLINT].base,
         memmap[SIFIVE_U_CLINT].size, ms->smp.cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, false);
 
     object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 8823681783..6e5723a171 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -227,7 +227,8 @@ static void spike_board_init(MachineState *machine)
 
     /* Core Local Interruptor (timer and IPI) */
     sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size,
-        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+        false);
 }
 
 static void spike_v1_10_0_board_init(MachineState *machine)
@@ -316,7 +317,8 @@ static void spike_v1_10_0_board_init(MachineState *machine)
 
     /* Core Local Interruptor (timer and IPI) */
     sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size,
-        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+        false);
 }
 
 static void spike_v1_09_1_board_init(MachineState *machine)
@@ -424,7 +426,8 @@ static void spike_v1_09_1_board_init(MachineState *machine)
 
     /* Core Local Interruptor (timer and IPI) */
     sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size,
-        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+        false);
 
     g_free(config_string);
 }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5d175d5c9e..85ec9e22aa 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -593,7 +593,7 @@ static void riscv_virt_board_init(MachineState *machine)
         memmap[VIRT_PLIC].size);
     sifive_clint_create(memmap[VIRT_CLINT].base,
         memmap[VIRT_CLINT].size, smp_cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, true);
     sifive_test_create(memmap[VIRT_TEST].base);
 
     for (i = 0; i < VIRTIO_COUNT; i++) {
diff --git a/include/hw/riscv/sifive_clint.h b/include/hw/riscv/sifive_clint.h
index ae8286c884..4a720bfece 100644
--- a/include/hw/riscv/sifive_clint.h
+++ b/include/hw/riscv/sifive_clint.h
@@ -41,7 +41,8 @@ typedef struct SiFiveCLINTState {
 } SiFiveCLINTState;
 
 DeviceState *sifive_clint_create(hwaddr addr, hwaddr size, uint32_t num_harts,
-    uint32_t sip_base, uint32_t timecmp_base, uint32_t time_base);
+    uint32_t sip_base, uint32_t timecmp_base, uint32_t time_base,
+    bool provide_rdtime);
 
 enum {
     SIFIVE_SIP_BASE     = 0x0,
-- 
2.25.0.265.gbab2e86ba0-goog


