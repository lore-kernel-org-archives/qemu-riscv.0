Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obHly-00084K-LT
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 04:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHlu-00082Y-Js
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 04:41:27 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHlo-0000Jj-6j
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 04:41:26 -0400
Received: by mail-pf1-x436.google.com with SMTP id y136so8616223pfb.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Sep 2022 01:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FSSYQLFV1VvTNy6n9rnrntuKIbdmESb1brATI/jw0D4=;
 b=jIPGdf7atn+5cmrKS0tcVbY1ADbb6fODx3ArxpeIaWINiO9sT6Thke5RBe/NbKXDN3
 8t2xgv/3KzihxjFj5VAHhqOxTI+s5Ac7dowL6+idLoEHvkCr/mbOASihLkyZMrgje9Kk
 6YCP1H9nBeZyE5OtjmRl786WVtQL6h2KnVwPC52QhxN3z7kQRVP5zkxSzB6GE/r08HHR
 NEFAGMLqZslYFJ3UIte+/wZHkAgZSECoMIQY+lwaQrIuIzOrx7Lo9WNODwzF4ESSFuze
 +2jOKqulKjzFJjZyv9igso1zybA5/fIht1F7A6Df4XnDyGcTc3O2IlXZQ7q2anhV9GMD
 SwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FSSYQLFV1VvTNy6n9rnrntuKIbdmESb1brATI/jw0D4=;
 b=bnmHbCHoCi+LAmvh55Nake3uObt/KUPHRLMb0/OhxCL5yTyKgnRuxCUmWHWVnCwUKD
 l/kHgfapQdrd+aptgruj/SLgBeEdIcp0xSLCotiktJ5MBABRFSullYAiZqBPFz5KOyWA
 KVDVHoQ1DeKjVc9IdTTPy0k4kfvIXCq3OlBp0wBJz1OU2kqvA3EAuxwwBywznbglV1R7
 MEJLbnVax6Lzf7vW9wiUkXDb+qWKjTHOFXUiKscZ0K1l8WGYMST8sdAeGYGttj3pPpZt
 SsyxSSG4Bhb+S8CTNoawZ5l36Eklg8a+cqlqsQJ86r4YwF+E7EYJNwdLDHpCpM2M7GpR
 ykBw==
X-Gm-Message-State: ACrzQf2zlZs6TNUOvZS79o4hPqArLly9UXJhGOR+aN0ealYglwmEiaP2
 Bb/gywEzTVN8CNKoohDyur5N1Q==
X-Google-Smtp-Source: AMsMyM62XkQxjZRz4VInXr3PqSW3cgkthu4G9ojlut0Gx+j6dCtMnqeL3vjjW0mO471jPFBfi6XKag==
X-Received: by 2002:a05:6a00:1253:b0:546:3d50:3284 with SMTP id
 u19-20020a056a00125300b005463d503284mr2463119pfi.72.1663836078633; 
 Thu, 22 Sep 2022 01:41:18 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a1f8200b0020379616053sm3239202pja.57.2022.09.22.01.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:41:18 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH 1/3] hw/misc: sifive_e_aon: Support the watchdog timer of
 HiFive 1 rev b.
Date: Thu, 22 Sep 2022 01:41:05 -0700
Message-Id: <20220922084107.2834285-2-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220922084107.2834285-1-tommy.wu@sifive.com>
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=tommy.wu@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Sep 2022 08:41:27 -0000

The watchdog timer is in the always-on domain device of HiFive 1 rev b,
so this patch added the AON device to the sifive_e machine. This patch
only implemented the functionality of the watchdog timer.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 hw/misc/Kconfig                |   3 +
 hw/misc/meson.build            |   1 +
 hw/misc/sifive_e_aon.c         | 330 +++++++++++++++++++++++++++++++++
 include/hw/misc/sifive_e_aon.h |  87 +++++++++
 4 files changed, 421 insertions(+)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cbabe9f78c..7d1247822e 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -162,6 +162,9 @@ config SIFIVE_TEST
 config SIFIVE_E_PRCI
     bool
 
+config SIFIVE_E_AON
+    bool
+
 config SIFIVE_U_OTP
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..1536a0cc2e 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -30,6 +30,7 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true: files('mchp_pfsoc_dmc.c')
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true: files('mchp_pfsoc_sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true: files('sifive_test.c'))
+softmmu_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true: files('sifive_e_aon.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
new file mode 100644
index 0000000000..7773dfb168
--- /dev/null
+++ b/hw/misc/sifive_e_aon.c
@@ -0,0 +1,330 @@
+/*
+ * SiFive HiFive1 AON (Always On Domain) for QEMU.
+ *
+ * Copyright (c) 2022 SiFive, Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "sysemu/watchdog.h"
+#include "qapi/visitor.h"
+#include "hw/misc/sifive_e_aon.h"
+
+static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
+{
+    if (0 == r->wdogcfg.wdogenalways &&
+        0 == r->wdogcfg.wdogencoreawake) {
+        return;
+    }
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    r->wdogcount += muldiv64(now - r->wdog_restart_time,
+                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
+    /* Clean the most significant bit. */
+    r->wdogcount = ((r->wdogcount << 1) >> 1);
+    r->wdog_restart_time = now;
+}
+
+static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
+{
+    sifive_e_aon_wdt_update_wdogcount(r);
+    uint16_t wdogs = (uint16_t)(r->wdogcount >> r->wdogcfg.wdogscale);
+    bool cmp_signal = false;
+    if (wdogs >= r->wdogcmp0) {
+        cmp_signal = true;
+        if (1 == r->wdogcfg.wdogzerocmp) {
+            r->wdogcount = 0;
+            wdogs = 0;
+        }
+    }
+
+    if (cmp_signal) {
+        if (1 == r->wdogcfg.wdogrsten) {
+            watchdog_perform_action();
+        }
+        r->wdogcfg.wdogip0 = 1;
+    }
+
+    qemu_set_irq(r->wdog_irq, r->wdogcfg.wdogip0);
+
+    if (wdogs < r->wdogcmp0 &&
+        (r->wdogcfg.wdogenalways ||
+         r->wdogcfg.wdogencoreawake)) {
+        int64_t next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next += muldiv64((r->wdogcmp0 - wdogs) << r->wdogcfg.wdogscale,
+                         NANOSECONDS_PER_SECOND, r->wdogclk_freq);
+        timer_mod(r->wdog_timer, next);
+    } else {
+        timer_mod(r->wdog_timer, INT64_MAX);
+    }
+}
+
+/*
+ * Callback used when the timer set using timer_mod expires.
+ */
+static void sifive_e_aon_wdt_expired_cb(void *opaque)
+{
+    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
+    sifive_e_aon_wdt_update_state(r);
+}
+
+static uint64_t
+sifive_e_aon_wdt_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
+
+    switch (addr) {
+    case SIFIVE_E_AON_WDT_WDOGCFG:
+        return r->wdogcfg.value;
+    case SIFIVE_E_AON_WDT_WDOGCOUNT:
+        sifive_e_aon_wdt_update_wdogcount(r);
+        return r->wdogcount;
+    case SIFIVE_E_AON_WDT_WDOGS:
+        sifive_e_aon_wdt_update_wdogcount(r);
+        return r->wdogcount >> r->wdogcfg.wdogscale;
+    case SIFIVE_E_AON_WDT_WDOGFEED:
+        return 0;
+    case SIFIVE_E_AON_WDT_WDOGKEY:
+        return r->wdogunlock;
+    case SIFIVE_E_AON_WDT_WDOGCMP0:
+        return r->wdogcmp0;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
+                      __func__, (int)addr);
+    }
+
+    return 0;
+}
+
+static void
+sifive_e_aon_wdt_write(void *opaque, hwaddr addr,
+                       uint64_t val64, unsigned int size)
+{
+    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
+    uint32_t value = val64;
+
+    switch (addr) {
+    case SIFIVE_E_AON_WDT_WDOGCFG:
+        if (0 == r->wdogunlock) {
+            return;
+        }
+        wdogcfg_s new_wdogcfg;
+        new_wdogcfg.value = value;
+        if (1 == (r->wdogcfg.wdogenalways ||
+                  r->wdogcfg.wdogencoreawake) &&
+            0 == (new_wdogcfg.wdogenalways ||
+                  new_wdogcfg.wdogencoreawake)) {
+            sifive_e_aon_wdt_update_wdogcount(r);
+        } else if (0 == (r->wdogcfg.wdogenalways ||
+                         r->wdogcfg.wdogencoreawake) &&
+                   1 == (new_wdogcfg.wdogenalways ||
+                         new_wdogcfg.wdogencoreawake)) {
+            r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        }
+        r->wdogcfg.value = value;
+        r->wdogunlock = 0;
+        break;
+    case SIFIVE_E_AON_WDT_WDOGCOUNT:
+        if (0 == r->wdogunlock) {
+            return;
+        }
+        r->wdogcount = ((value << 1) >> 1);
+        r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        r->wdogunlock = 0;
+        break;
+    case SIFIVE_E_AON_WDT_WDOGS:
+        return;
+    case SIFIVE_E_AON_WDT_WDOGFEED:
+        if (0 == r->wdogunlock) {
+            return;
+        }
+        if (SIFIVE_E_AON_WDOGFEED == value) {
+            r->wdogcount = 0;
+            r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        }
+        r->wdogunlock = 0;
+        break;
+    case SIFIVE_E_AON_WDT_WDOGKEY:
+        if (SIFIVE_E_AON_WDOGKEY == value) {
+            r->wdogunlock = 1;
+        }
+        break;
+    case SIFIVE_E_AON_WDT_WDOGCMP0:
+        if (0 == r->wdogunlock) {
+            return;
+        }
+        r->wdogcmp0 = (uint16_t) value;
+        r->wdogunlock = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x v=0x%x\n",
+                      __func__, (int)addr, (int)value);
+    }
+
+    sifive_e_aon_wdt_update_state(r);
+}
+
+static uint64_t
+sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    if (addr < SIFIVE_E_AON_RTC_RTCCFG) {
+        /* AON WDT */
+        return sifive_e_aon_wdt_read(opaque, addr, size);
+    } else if (addr < SIFIVE_E_AON_LFROSC_LFROSCCFG) {
+        /* AON RTC */
+    } else if (addr < SIFIVE_E_AON_BACKUP_BACKUP0) {
+        /* AON LFROSC */
+    } else if (addr < SIFIVE_E_AON_PMU_PMUWAKEUP0) {
+        /* AON BACKUP */
+    } else if (addr < SIFIVE_E_AON_MAX) {
+        /* AON PMU */
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
+            __func__, (int)addr);
+    }
+
+    return 0;
+}
+
+static void
+sifive_e_aon_write(void *opaque, hwaddr addr,
+                   uint64_t val64, unsigned int size)
+{
+    if (addr < SIFIVE_E_AON_RTC_RTCCFG) {
+        /* AON WDT */
+        sifive_e_aon_wdt_write(opaque, addr, val64, size);
+    } else if (addr < SIFIVE_E_AON_LFROSC_LFROSCCFG) {
+        /* AON RTC */
+    } else if (addr < SIFIVE_E_AON_BACKUP_BACKUP0) {
+        /* AON LFROSC */
+    } else if (addr < SIFIVE_E_AON_PMU_PMUWAKEUP0) {
+        /* AON BACKUP */
+    } else if (addr < SIFIVE_E_AON_MAX) {
+        /* AON PMU */
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
+                      __func__, (int)addr);
+    }
+}
+
+static const MemoryRegionOps sifive_e_aon_ops = {
+    .read = sifive_e_aon_read,
+    .write = sifive_e_aon_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,
+                                     qemu_irq wdt_irq)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+    SiFiveEAONState *r;
+
+    dev = qdev_new(TYPE_SIFIVE_E_AON);
+    s = SYS_BUS_DEVICE(dev);
+
+    sysbus_realize_and_unref(s, &error_fatal);
+
+    memory_region_add_subregion(mr, base,
+                                sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, wdt_irq);
+
+    r = SIFIVE_E_AON(dev);
+    return r;
+}
+
+static void sifive_e_aon_reset(DeviceState *dev)
+{
+    SiFiveEAONState *s = SIFIVE_E_AON(dev);
+
+    s->wdogcfg.wdogrsten = 0;
+    s->wdogcfg.wdogenalways = 0;
+    s->wdogcfg.wdogencoreawake = 0;
+    s->wdogcmp0 = 0xbeef;
+}
+
+static void sifive_e_aon_wdt_update_wdogclk_freq(Object *obj, Visitor *v,
+                                                 const char *name,
+                                                 void *opaque,
+                                                 Error **errp) {
+    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
+    uint64_t value;
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    r->wdogclk_freq = value;
+    sifive_e_aon_wdt_update_state(r);
+}
+
+static void sifive_e_aon_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    SiFiveEAONState *s = SIFIVE_E_AON(obj);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_e_aon_ops, s,
+                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    /* watchdog timer */
+    s->wdogclk_freq = SIFIVE_E_LFCLK_DEFAULT_FREQ;
+    sysbus_init_irq(sbd, &s->wdog_irq);
+    object_property_add(obj, "wdogclk-frequency", "uint64",
+                        NULL,
+                        sifive_e_aon_wdt_update_wdogclk_freq,
+                        NULL, s);
+}
+
+static void sifive_e_aon_realize(DeviceState *dev, Error **errp)
+{
+    SiFiveEAONState *s = SIFIVE_E_AON(dev);
+
+    /* watchdog timer */
+    s->wdog_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                 sifive_e_aon_wdt_expired_cb, s);
+}
+
+static void sifive_e_aon_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = sifive_e_aon_realize;
+    dc->reset = sifive_e_aon_reset;
+}
+
+static const TypeInfo sifive_e_aon_info = {
+    .name          = TYPE_SIFIVE_E_AON,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SiFiveEAONState),
+    .instance_init = sifive_e_aon_init,
+    .class_init    = sifive_e_aon_class_init,
+};
+
+static void sifive_e_aon_register_types(void)
+{
+    type_register_static(&sifive_e_aon_info);
+}
+
+type_init(sifive_e_aon_register_types)
diff --git a/include/hw/misc/sifive_e_aon.h b/include/hw/misc/sifive_e_aon.h
new file mode 100644
index 0000000000..ee4134bd25
--- /dev/null
+++ b/include/hw/misc/sifive_e_aon.h
@@ -0,0 +1,87 @@
+/*
+ * SiFive HiFive1 AON (Always On Domain) interface.
+ *
+ * Copyright (c) 2022 SiFive, Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SIFIVE_AON_H
+#define HW_SIFIVE_AON_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_SIFIVE_E_AON "riscv.sifive.e.aon"
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveEAONState, SIFIVE_E_AON)
+
+#define SIFIVE_E_AON_WDOGKEY (0x51F15E)
+#define SIFIVE_E_AON_WDOGFEED (0xD09F00D)
+#define SIFIVE_E_LFCLK_DEFAULT_FREQ (32768)
+
+enum {
+    SIFIVE_E_AON_WDT_WDOGCFG        = 0,
+    SIFIVE_E_AON_WDT_WDOGCOUNT      = 0x8,
+    SIFIVE_E_AON_WDT_WDOGS          = 0x10,
+    SIFIVE_E_AON_WDT_WDOGFEED       = 0x18,
+    SIFIVE_E_AON_WDT_WDOGKEY        = 0x1c,
+    SIFIVE_E_AON_WDT_WDOGCMP0       = 0x20,
+    SIFIVE_E_AON_RTC_RTCCFG         = 0x40,
+    SIFIVE_E_AON_LFROSC_LFROSCCFG   = 0x70,
+    SIFIVE_E_AON_BACKUP_BACKUP0     = 0x80,
+    SIFIVE_E_AON_PMU_PMUWAKEUP0     = 0x100,
+    SIFIVE_E_AON_MAX                = 0x150
+};
+
+typedef struct wdogcfg_s wdogcfg_s;
+struct wdogcfg_s {
+    union {
+        uint32_t value;
+        struct {
+            uint32_t wdogscale:4;
+            uint32_t reserved:4;
+            uint8_t  wdogrsten:1;
+            uint8_t  wdogzerocmp:1;
+            uint8_t  reserved2:2;
+            uint8_t  wdogenalways:1;
+            uint8_t  wdogencoreawake:1;
+            uint32_t reserved3:14;
+            uint8_t  wdogip0:1;
+            uint8_t  reserved4:3;
+        };
+    };
+};
+
+struct SiFiveEAONState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+
+    /*< watchdog timer >*/
+    QEMUTimer *wdog_timer;
+    qemu_irq wdog_irq;
+    uint64_t wdog_restart_time;
+    uint64_t wdogclk_freq;
+
+    wdogcfg_s wdogcfg;
+    uint16_t wdogcmp0;
+    uint32_t wdogcount;
+    uint8_t wdogunlock;
+};
+
+SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,
+                                     qemu_irq irq);
+
+#endif
-- 
2.27.0


