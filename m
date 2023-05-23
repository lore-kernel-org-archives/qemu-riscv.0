Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BD8C7EE26
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 08:50:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1Nhw-0008FY-Tu; Tue, 23 May 2023 04:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1Nhu-0008EI-Rc
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 04:49:26 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1Nhs-0004Gs-HA
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 04:49:26 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d2467d640so6127998b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 01:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684831762; x=1687423762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFMw/LvbKHzXHMpeGdNyjqbwwXCt4fAepn2/05/Ir5Y=;
 b=cVNywWMsLMiZR7Jx7eSeX4pEGUr8sw67J4r9lSQzYkLl0qNQmuVV0OURJpA9rEwTBM
 rRrWuX+g/YlhxS/OsFgv8IqBcBxNagO1pnPe/HjkxxT47BrflW1MiraR/185XvXKlEVw
 CnBm9jETHCeL92yxxtxe72AIclyEtak7VDotVA1dzQiBM/LtUNElcj5QIkh0s8GjUF6U
 W12Tm5Sv0i7Mo6VzJjgKjH52IE1Q6k5yEOQCXAObfQT7zDCG1fl4iDyIRLSHVYwb3TmG
 6vF9hsdescWDUysHN5eFrqAA9Z0Dxa8vkpMz1RpWLyrTckqySmPj+GRlBC9P8mGkgP84
 Cu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684831762; x=1687423762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFMw/LvbKHzXHMpeGdNyjqbwwXCt4fAepn2/05/Ir5Y=;
 b=NCAsFAVQVSBH7MQwopUCSrhREVrVibaZTGAQBs4sASwlEQw2jq4uWwDr0c6tRSluoV
 SAhZA7rsuWNcvuvWhEL2eiaEmGojXlTaBT0sR9v2cIG2lI9oNv2rUNFfs777zUk80jVP
 dvy3JLlOccPk6Xo+iy/ZZCBa0V0DleWo6DJ0qThZakFssRg8yXmx4ykztTk9FlxN+1xr
 ySMkHKGsIg6d848YbnodDGKjZnbPm9z8+dHi6+cQFUo9rrPPJrao8AV316tJgG1Ca4Ok
 jNYMhJ9LLBLvsJNywGRqofxiZD4yfvqlviREaf6ao24idC2ll1MPVlftaXWzD19nUh0E
 M8PA==
X-Gm-Message-State: AC+VfDzs4Bq2phyiQrGV27R5V7TRx9oEk8f+XN/WEcpC9ciViO+nk8vR
 Q5gxSdDSArsBEil+1c83iZC2Ug==
X-Google-Smtp-Source: ACHHUZ7AwPsFys7jbeiIuMe1NG6LoPXz9GWZJeYR5YKYbgA0muUBPMyUAvb/szFQ2vyRZEuUQb4bpA==
X-Received: by 2002:a05:6a20:3c8d:b0:10c:467a:536f with SMTP id
 b13-20020a056a203c8d00b0010c467a536fmr2897073pzj.14.1684831761717; 
 Tue, 23 May 2023 01:49:21 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a635118000000b0052858b41008sm5634475pgb.87.2023.05.23.01.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 01:49:21 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, thuth@redhat.com,
 liweiwei@iscas.ac.cn, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v4 1/3] hw/misc: sifive_e_aon: Support the watchdog timer of
 HiFive 1 rev b.
Date: Tue, 23 May 2023 01:49:08 -0700
Message-Id: <20230523084910.304679-2-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230523084910.304679-1-tommy.wu@sifive.com>
References: <20230523084910.304679-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=tommy.wu@sifive.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The watchdog timer is in the always-on domain device of HiFive 1 rev b,
so this patch added the AON device to the sifive_e machine. This patch
only implemented the functionality of the watchdog timer.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/misc/Kconfig                |   3 +
 hw/misc/meson.build            |   1 +
 hw/misc/sifive_e_aon.c         | 326 +++++++++++++++++++++++++++++++++
 include/hw/misc/sifive_e_aon.h |  60 ++++++
 4 files changed, 390 insertions(+)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 2ef5781ef8..10d367d616 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -158,6 +158,9 @@ config SIFIVE_TEST
 config SIFIVE_E_PRCI
     bool
 
+config SIFIVE_E_AON
+    bool
+
 config SIFIVE_U_OTP
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index a40245ad44..37b4bbf31d 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -30,6 +30,7 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true: files('mchp_pfsoc_sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true: files('sifive_test.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
+softmmu_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true: files('sifive_e_aon.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
 
diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
new file mode 100644
index 0000000000..b66a9e40fa
--- /dev/null
+++ b/hw/misc/sifive_e_aon.c
@@ -0,0 +1,326 @@
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
+#include "qemu/timer.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/registerfields.h"
+#include "hw/misc/sifive_e_aon.h"
+#include "qapi/visitor.h"
+#include "qapi/error.h"
+#include "sysemu/watchdog.h"
+#include "hw/qdev-properties.h"
+
+REG32(AON_WDT_WDOGCFG, 0x0)
+    FIELD(AON_WDT_WDOGCFG, SCALE, 0, 4)
+    FIELD(AON_WDT_WDOGCFG, RSVD0, 4, 4)
+    FIELD(AON_WDT_WDOGCFG, RSTEN, 8, 1)
+    FIELD(AON_WDT_WDOGCFG, ZEROCMP, 9, 1)
+    FIELD(AON_WDT_WDOGCFG, RSVD1, 10, 2)
+    FIELD(AON_WDT_WDOGCFG, EN_ALWAYS, 12, 1)
+    FIELD(AON_WDT_WDOGCFG, EN_CORE_AWAKE, 13, 1)
+    FIELD(AON_WDT_WDOGCFG, RSVD2, 14, 14)
+    FIELD(AON_WDT_WDOGCFG, IP0, 28, 1)
+    FIELD(AON_WDT_WDOGCFG, RSVD3, 29, 3)
+REG32(AON_WDT_WDOGCOUNT, 0x8)
+REG32(AON_WDT_WDOGS, 0x10)
+REG32(AON_WDT_WDOGFEED, 0x18)
+REG32(AON_WDT_WDOGKEY, 0x1c)
+REG32(AON_WDT_WDOGCMP0, 0x20)
+
+static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
+{
+    int64_t now;
+    if (0 == FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS) &&
+        0 == FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE)) {
+        return;
+    }
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    r->wdogcount += muldiv64(now - r->wdog_restart_time,
+                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
+
+    /* Clean the most significant bit. */
+    r->wdogcount = ((r->wdogcount << 1) >> 1);
+    r->wdog_restart_time = now;
+}
+
+static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
+{
+    uint16_t wdogs;
+    bool cmp_signal = false;
+    sifive_e_aon_wdt_update_wdogcount(r);
+    wdogs = (uint16_t)(r->wdogcount >>
+                           FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, SCALE));
+
+    if (wdogs >= r->wdogcmp0) {
+        cmp_signal = true;
+        if (1 == FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, ZEROCMP)) {
+            r->wdogcount = 0;
+            wdogs = 0;
+        }
+    }
+
+    if (cmp_signal) {
+        if (1 == FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, RSTEN)) {
+            watchdog_perform_action();
+        }
+        r->wdogcfg = FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, IP0, 1);
+    }
+
+    qemu_set_irq(r->wdog_irq, FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, IP0));
+
+    if (wdogs < r->wdogcmp0 &&
+        (FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS) ||
+         FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE))) {
+        int64_t next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next += muldiv64((r->wdogcmp0 - wdogs) <<
+                         FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, SCALE),
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
+    case A_AON_WDT_WDOGCFG:
+        return r->wdogcfg;
+    case A_AON_WDT_WDOGCOUNT:
+        sifive_e_aon_wdt_update_wdogcount(r);
+        return r->wdogcount;
+    case A_AON_WDT_WDOGS:
+        sifive_e_aon_wdt_update_wdogcount(r);
+        return r->wdogcount >>
+               FIELD_EX32(r->wdogcfg,
+                          AON_WDT_WDOGCFG,
+                          SCALE);
+    case A_AON_WDT_WDOGFEED:
+        return 0;
+    case A_AON_WDT_WDOGKEY:
+        return r->wdogunlock;
+    case A_AON_WDT_WDOGCMP0:
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
+    case A_AON_WDT_WDOGCFG: {
+        uint8_t new_en_always;
+        uint8_t new_en_core_awake;
+        uint8_t old_en_always;
+        uint8_t old_en_core_awake;
+        if (0 == r->wdogunlock) {
+            return;
+        }
+
+        new_en_always = FIELD_EX32(value, AON_WDT_WDOGCFG, EN_ALWAYS);
+        new_en_core_awake = FIELD_EX32(value, AON_WDT_WDOGCFG, EN_CORE_AWAKE);
+        old_en_always = FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS);
+        old_en_core_awake = FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG,
+                                       EN_CORE_AWAKE);
+
+        if (1 == (old_en_always ||
+                  old_en_core_awake) &&
+            0 == (new_en_always ||
+                  new_en_core_awake)) {
+            sifive_e_aon_wdt_update_wdogcount(r);
+        } else if (0 == (old_en_always ||
+                        old_en_core_awake) &&
+                  1 == (new_en_always ||
+                        new_en_core_awake)) {
+            r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        }
+        r->wdogcfg = value;
+        r->wdogunlock = 0;
+        break;
+    }
+    case A_AON_WDT_WDOGCOUNT:
+        if (0 == r->wdogunlock) {
+            return;
+        }
+        r->wdogcount = ((value << 1) >> 1);
+        r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        r->wdogunlock = 0;
+        break;
+    case A_AON_WDT_WDOGS:
+        return;
+    case A_AON_WDT_WDOGFEED:
+        if (0 == r->wdogunlock) {
+            return;
+        }
+        if (SIFIVE_E_AON_WDOGFEED == value) {
+            r->wdogcount = 0;
+            r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        }
+        r->wdogunlock = 0;
+        break;
+    case A_AON_WDT_WDOGKEY:
+        if (SIFIVE_E_AON_WDOGKEY == value) {
+            r->wdogunlock = 1;
+        }
+        break;
+    case A_AON_WDT_WDOGCMP0:
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
+    sifive_e_aon_wdt_update_state(r);
+}
+
+static uint64_t
+sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    if (addr < SIFIVE_E_AON_RTC) {
+        return sifive_e_aon_wdt_read(opaque, addr, size);
+    } else if (addr < SIFIVE_E_AON_MAX) {
+        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented read: addr=0x%x\n",
+                      __func__, (int)addr);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
+                      __func__, (int)addr);
+    }
+    return 0;
+}
+
+static void
+sifive_e_aon_write(void *opaque, hwaddr addr,
+                   uint64_t val64, unsigned int size)
+{
+    if (addr < SIFIVE_E_AON_RTC) {
+        sifive_e_aon_wdt_write(opaque, addr, val64, size);
+    } else if (addr < SIFIVE_E_AON_MAX) {
+        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented write: addr=0x%x\n",
+                      __func__, (int)addr);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x\n",
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
+static void sifive_e_aon_reset(DeviceState *dev)
+{
+    SiFiveEAONState *r = SIFIVE_E_AON(dev);
+
+    r->wdogcfg = FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, RSTEN, 0);
+    r->wdogcfg = FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS, 0);
+    r->wdogcfg = FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE, 0);
+    r->wdogcmp0 = 0xbeef;
+
+    sifive_e_aon_wdt_update_state(r);
+}
+
+static void sifive_e_aon_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    SiFiveEAONState *r = SIFIVE_E_AON(obj);
+
+    memory_region_init_io(&r->mmio, OBJECT(r), &sifive_e_aon_ops, r,
+                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
+    sysbus_init_mmio(sbd, &r->mmio);
+
+    /* watchdog timer */
+    r->wdogclk_freq = SIFIVE_E_LFCLK_DEFAULT_FREQ;
+    sysbus_init_irq(sbd, &r->wdog_irq);
+}
+
+static void sifive_e_aon_realize(DeviceState *dev, Error **errp)
+{
+    SiFiveEAONState *r = SIFIVE_E_AON(dev);
+
+    /* watchdog timer */
+    r->wdog_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                 sifive_e_aon_wdt_expired_cb, r);
+}
+
+static Property sifive_e_aon_properties[] = {
+    DEFINE_PROP_UINT64("wdogclk-frequency", SiFiveEAONState, wdogclk_freq,
+                       SIFIVE_E_LFCLK_DEFAULT_FREQ),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sifive_e_aon_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = sifive_e_aon_realize;
+    dc->reset = sifive_e_aon_reset;
+    device_class_set_props(dc, sifive_e_aon_properties);
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
index 0000000000..2ae1c4139c
--- /dev/null
+++ b/include/hw/misc/sifive_e_aon.h
@@ -0,0 +1,60 @@
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
+    SIFIVE_E_AON_WDT    = 0x0,
+    SIFIVE_E_AON_RTC    = 0x40,
+    SIFIVE_E_AON_LFROSC = 0x70,
+    SIFIVE_E_AON_BACKUP = 0x80,
+    SIFIVE_E_AON_PMU    = 0x100,
+    SIFIVE_E_AON_MAX    = 0x150
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
+    uint32_t wdogcfg;
+    uint16_t wdogcmp0;
+    uint32_t wdogcount;
+    uint8_t wdogunlock;
+};
+
+#endif
-- 
2.27.0


