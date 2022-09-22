Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obHmL-0008BQ-6q
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 04:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHlw-00083t-Kl
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 04:41:29 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHls-0000PT-4s
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 04:41:28 -0400
Received: by mail-pf1-x436.google.com with SMTP id u132so8607322pfc.6
 for <qemu-riscv@nongnu.org>; Thu, 22 Sep 2022 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HvuMTW94+hFSQqzauz4aeVbKjUjPDqFiwXpARMEgMMY=;
 b=JSLWeu1CVqE96Twxs7Wxo8zCKgsuEuMPm8+jiBJn+HXBpNXXQiCcsFuMmgpSGNnPDR
 Fgcqa0APPsN1D1+h71D5LEnUNfSr2PTMCZTujNiAPKNOk0+q6XLw4ar1FVsYFwiTYbK6
 NTDFOMUjbqugYdqDpvgn35kJEsk2j4Fe8uNCIP3C3Yy2ik+Dg+UqWObRjYqN1egghwMW
 tu6tMtIee0Z/xMOVnr/Vtln6RDhTqcWloIpHrTqR789QH86zQN+AA3ER4OkUaxA2NNgS
 JaV2LjIlkBVyhYfRLYQf4QjbFsnVNrR+3tco4cF1XfkWP1BZXXX0WcJ89mQUyN5JAP+6
 5Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HvuMTW94+hFSQqzauz4aeVbKjUjPDqFiwXpARMEgMMY=;
 b=q8lc8qR0AFohzruVP+twKPlxGvO7I8g1mkHhd2cx8bRGpEoT8O2/KMNJNGeHcl1ujf
 8n038CXdPWyf1ysipXsVxckOo5K1U3fCOoOh44/Bbu3Ow+iCGUsD7xchU/H5OdYeLz3R
 eT7/fGrzbSCOnGkZRxhOuCaOe7z4+A2UupQ6u9rGPpaP0+MNtHxnT1eY3AmXHHCG9zut
 ZKs/rASS7IMrLTbONRjiP+dYK1X63QtGNEfALvtz6b37Dg44Ys8FBRYxe+KhJ7fO42r2
 TrLFlAWrqNMCf5GEDTbPGWdgpfcNKiOH+vhNEuxIh74Hwfq5Wuj4yiZRQNVjJfZGcvFe
 nKpg==
X-Gm-Message-State: ACrzQf1VNOJq1UoUIJZAVPzPMkPi3bT1YLHPSDmF1MXW7+/FJX/BD1Hn
 g6UU5Nivr5LRlUszPrrt1oCsEw==
X-Google-Smtp-Source: AMsMyM4r5bGfiM7j0M51h2Kyokh3JWWZX6fBAPCKLGAdnvdEzdcTc06TXoN2NwNW/TdyuegtDsc1uw==
X-Received: by 2002:a05:6a00:1946:b0:54d:bdea:e159 with SMTP id
 s6-20020a056a00194600b0054dbdeae159mr2538828pfk.47.1663836082911; 
 Thu, 22 Sep 2022 01:41:22 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a1f8200b0020379616053sm3239202pja.57.2022.09.22.01.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:41:22 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH 3/3] tests/qtest: sifive-e-aon-watchdog-test.c : Add QTest of
 watchdog of sifive_e
Date: Thu, 22 Sep 2022 01:41:07 -0700
Message-Id: <20220922084107.2834285-4-tommy.wu@sifive.com>
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
X-List-Received-Date: Thu, 22 Sep 2022 08:41:30 -0000

Add some simple tests of the watchdog timer in the always-on domain device
of HiFive 1 rev b.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 400 +++++++++++++++++++++++
 2 files changed, 403 insertions(+)
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e910cb32ca..446115ea34 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -234,6 +234,9 @@ qtests_s390x = \
    'cpu-plug-test',
    'migration-test']
 
+qtests_riscv32 = \
+  (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-watchdog-test'] : [])
+
 qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
diff --git a/tests/qtest/sifive-e-aon-watchdog-test.c b/tests/qtest/sifive-e-aon-watchdog-test.c
new file mode 100644
index 0000000000..a583539346
--- /dev/null
+++ b/tests/qtest/sifive-e-aon-watchdog-test.c
@@ -0,0 +1,400 @@
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "qemu/bitops.h"
+#include "libqtest-single.h"
+#include "hw/misc/sifive_e_aon.h"
+
+#define WDOG_BASE (0x10000000)
+#define WDOGCFG (0x0)
+#define WDOGCOUNT (0x8)
+#define WDOGS (0x10)
+#define WDOGFEED (0x18)
+#define WDOGKEY (0x1c)
+#define WDOGCMP0 (0x20)
+
+#define SIFIVE_E_AON_WDOGKEY (0x51F15E)
+#define SIFIVE_E_AON_WDOGFEED (0xD09F00D)
+#define SIFIVE_E_LFCLK_DEFAULT_FREQ (32768)
+
+static void test_init(void)
+{
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, 0);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, 0xBEEF);
+}
+
+static void test_wdogcount(void)
+{
+    test_init();
+
+    uint64_t tmp;
+    tmp = readl(WDOG_BASE + WDOGCOUNT);
+    writel(WDOG_BASE + WDOGCOUNT, 0xBEEF);
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) == tmp);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0xBEEF);
+    g_assert(0xBEEF == readl(WDOG_BASE + WDOGCOUNT));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0xAAAAAAAA);
+    g_assert(0x2AAAAAAA == readl(WDOG_BASE + WDOGCOUNT));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGFEED, 0xAAAAAAAA);
+    g_assert(0x2AAAAAAA == readl(WDOG_BASE + WDOGCOUNT));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGFEED, SIFIVE_E_AON_WDOGFEED);
+    g_assert(0 == readl(WDOG_BASE + WDOGCOUNT));
+}
+
+static void test_wdogcfg(void)
+{
+    test_init();
+
+    wdogcfg_s tmp;
+    tmp.value = readl(WDOG_BASE + WDOGCFG);
+    writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
+    g_assert(readl(WDOG_BASE + WDOGCFG) == tmp.value);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
+    g_assert(0xFFFFFFFF == readl(WDOG_BASE + WDOGCFG));
+
+    tmp.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 == tmp.wdogscale);
+    g_assert(1 == tmp.wdogrsten);
+    g_assert(1 == tmp.wdogzerocmp);
+    g_assert(1 == tmp.wdogenalways);
+    g_assert(1 == tmp.wdogencoreawake);
+    g_assert(1 == tmp.wdogip0);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, 0);
+    g_assert(0 == readl(WDOG_BASE + WDOGCFG));
+
+    tmp.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == tmp.wdogscale);
+    g_assert(0 == tmp.wdogrsten);
+    g_assert(0 == tmp.wdogzerocmp);
+    g_assert(0 == tmp.wdogenalways);
+    g_assert(0 == tmp.wdogencoreawake);
+    g_assert(0 == tmp.wdogip0);
+}
+
+static void test_wdogcmp0(void)
+{
+    test_init();
+
+    wdogcfg_s tmp;
+    tmp.value = readl(WDOG_BASE + WDOGCMP0);
+    writel(WDOG_BASE + WDOGCMP0, 0xBEEF);
+    g_assert(readl(WDOG_BASE + WDOGCMP0) == tmp.value);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, 0xBEEF);
+    g_assert(0xBEEF == readl(WDOG_BASE + WDOGCMP0));
+}
+
+static void test_wdogkey(void)
+{
+    test_init();
+
+    g_assert(0 == readl(WDOG_BASE + WDOGKEY));
+
+    writel(WDOG_BASE + WDOGKEY, 0xFFFF);
+    g_assert(0 == readl(WDOG_BASE + WDOGKEY));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    g_assert(1 == readl(WDOG_BASE + WDOGKEY));
+
+    writel(WDOG_BASE + WDOGFEED, 0xAAAAAAAA);
+    g_assert(0 == readl(WDOG_BASE + WDOGKEY));
+}
+
+static void test_wdogfeed(void)
+{
+    test_init();
+
+    g_assert(0 == readl(WDOG_BASE + WDOGFEED));
+
+    writel(WDOG_BASE + WDOGFEED, 0xFFFF);
+    g_assert(0 == readl(WDOG_BASE + WDOGFEED));
+}
+
+static void test_scaled_wdogs(void)
+{
+    test_init();
+
+    wdogcfg_s cfg;
+    uint32_t fake_count = 0x12345678;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, fake_count);
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) == fake_count);
+    g_assert((uint16_t)readl(WDOG_BASE + WDOGS) ==
+             (uint16_t)fake_count);
+
+    for (int i = 0; i < 16; i++) {
+        cfg.value = readl(WDOG_BASE + WDOGCFG);
+        cfg.wdogscale = i;
+        writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+        writel(WDOG_BASE + WDOGCFG, cfg.value);
+        g_assert((uint16_t)readl(WDOG_BASE + WDOGS) ==
+                 (uint16_t)(fake_count >> cfg.wdogscale));
+    }
+}
+
+static void test_watchdog(void)
+{
+    test_init();
+
+    wdogcfg_s cfg;
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ);
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    cfg.wdogscale = 0;
+    cfg.wdogenalways = 1;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+
+    clock_step(NANOSECONDS_PER_SECOND);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ);
+
+    g_assert(readl(WDOG_BASE + WDOGS) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ);
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == cfg.wdogscale);
+    g_assert(0 == cfg.wdogrsten);
+    g_assert(0 == cfg.wdogzerocmp);
+    g_assert(1 == cfg.wdogenalways);
+    g_assert(0 == cfg.wdogencoreawake);
+    g_assert(1 == cfg.wdogip0);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0);
+    cfg.wdogip0 = 0;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == cfg.wdogip0);
+}
+
+static void test_scaled_watchdog(void)
+{
+    test_init();
+
+    wdogcfg_s cfg;
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, 10);
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    cfg.wdogscale = 15;
+    cfg.wdogenalways = 1;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+
+    clock_step(NANOSECONDS_PER_SECOND * 10);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ * 10);
+
+    g_assert(10 == readl(WDOG_BASE + WDOGS));
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 == cfg.wdogscale);
+    g_assert(0 == cfg.wdogrsten);
+    g_assert(0 == cfg.wdogzerocmp);
+    g_assert(1 == cfg.wdogenalways);
+    g_assert(0 == cfg.wdogencoreawake);
+    g_assert(1 == cfg.wdogip0);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0);
+    cfg.wdogip0 = 0;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == cfg.wdogip0);
+}
+
+static void test_periodic_int(void)
+{
+    test_init();
+
+    wdogcfg_s cfg;
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ);
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    cfg.wdogscale = 0;
+    cfg.wdogzerocmp = 1;
+    cfg.wdogenalways = 1;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+
+    clock_step(NANOSECONDS_PER_SECOND);
+
+    g_assert(0 == readl(WDOG_BASE + WDOGCOUNT));
+
+    g_assert(0 == readl(WDOG_BASE + WDOGS));
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == cfg.wdogscale);
+    g_assert(0 == cfg.wdogrsten);
+    g_assert(1 == cfg.wdogzerocmp);
+    g_assert(1 == cfg.wdogenalways);
+    g_assert(0 == cfg.wdogencoreawake);
+    g_assert(1 == cfg.wdogip0);
+
+    cfg.wdogip0 = 0;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == cfg.wdogip0);
+
+    clock_step(NANOSECONDS_PER_SECOND);
+
+    g_assert(0 == readl(WDOG_BASE + WDOGCOUNT));
+
+    g_assert(0 == readl(WDOG_BASE + WDOGS));
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == cfg.wdogscale);
+    g_assert(0 == cfg.wdogrsten);
+    g_assert(1 == cfg.wdogzerocmp);
+    g_assert(1 == cfg.wdogenalways);
+    g_assert(0 == cfg.wdogencoreawake);
+    g_assert(1 == cfg.wdogip0);
+
+    cfg.wdogip0 = 0;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == cfg.wdogip0);
+}
+
+static void test_enable_disable(void)
+{
+    test_init();
+
+    wdogcfg_s cfg;
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, 10);
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    cfg.wdogscale = 15;
+    cfg.wdogenalways = 1;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+
+    clock_step(NANOSECONDS_PER_SECOND * 2);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ * 2);
+
+    g_assert(2 == readl(WDOG_BASE + WDOGS));
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 == cfg.wdogscale);
+    g_assert(0 == cfg.wdogrsten);
+    g_assert(0 == cfg.wdogzerocmp);
+    g_assert(1 == cfg.wdogenalways);
+    g_assert(0 == cfg.wdogencoreawake);
+    g_assert(0 == cfg.wdogip0);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    cfg.wdogenalways = 0;
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+
+    clock_step(NANOSECONDS_PER_SECOND * 8);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ * 2);
+
+    g_assert(2 == readl(WDOG_BASE + WDOGS));
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 == cfg.wdogscale);
+    g_assert(0 == cfg.wdogrsten);
+    g_assert(0 == cfg.wdogzerocmp);
+    g_assert(0 == cfg.wdogenalways);
+    g_assert(0 == cfg.wdogencoreawake);
+    g_assert(0 == cfg.wdogip0);
+
+    cfg.wdogenalways = 1;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+
+    clock_step(NANOSECONDS_PER_SECOND * 8);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ * 10);
+
+    g_assert(10 == readl(WDOG_BASE + WDOGS));
+
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 == cfg.wdogscale);
+    g_assert(0 == cfg.wdogrsten);
+    g_assert(0 == cfg.wdogzerocmp);
+    g_assert(1 == cfg.wdogenalways);
+    g_assert(0 == cfg.wdogencoreawake);
+    g_assert(1 == cfg.wdogip0);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0);
+    cfg.wdogip0 = 0;
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg.value);
+    cfg.value = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 == cfg.wdogip0);
+}
+
+int main(int argc, char *argv[])
+{
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_start("-machine sifive_e");
+
+    qtest_add_func("/sifive-e-aon-watchdog-test/wdogcount",
+                   test_wdogcount);
+    qtest_add_func("/sifive-e-aon-watchdog-test/wdogcfg",
+                   test_wdogcfg);
+    qtest_add_func("/sifive-e-aon-watchdog-test/wdogcmp0",
+                   test_wdogcmp0);
+    qtest_add_func("/sifive-e-aon-watchdog-test/wdogkey",
+                   test_wdogkey);
+    qtest_add_func("/sifive-e-aon-watchdog-test/wdogfeed",
+                   test_wdogfeed);
+    qtest_add_func("/sifive-e-aon-watchdog-test/scaled_wdogs",
+                   test_scaled_wdogs);
+    qtest_add_func("/sifive-e-aon-watchdog-test/watchdog",
+                   test_watchdog);
+    qtest_add_func("/sifive-e-aon-watchdog-test/scaled_watchdog",
+                   test_scaled_watchdog);
+    qtest_add_func("/sifive-e-aon-watchdog-test/periodic_int",
+                   test_periodic_int);
+    qtest_add_func("/sifive-e-aon-watchdog-test/enable_disable",
+                   test_enable_disable);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
-- 
2.27.0


