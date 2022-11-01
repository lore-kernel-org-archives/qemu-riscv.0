Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ophJN-0002GK-Px
	for mharc-qemu-riscv@gnu.org; Mon, 31 Oct 2022 22:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophJH-0002F7-99
 for qemu-riscv@nongnu.org; Mon, 31 Oct 2022 22:47:29 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophJB-0004E3-UA
 for qemu-riscv@nongnu.org; Mon, 31 Oct 2022 22:47:25 -0400
Received: by mail-oi1-x235.google.com with SMTP id m204so2973827oib.6
 for <qemu-riscv@nongnu.org>; Mon, 31 Oct 2022 19:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HNXbqpEcUn7DYG1idgGyglL0XhGdSXTe8CR2vhs1To=;
 b=O40H1fMlzbbCjMhAq9rozekSMH9yDk0TAgp4y836Qd/76p1q3ABVQehKXk8DMdfuzl
 WJuosZUHsqZyKm3pcqZbHXmgO9rNKPQxGJ4CDX/MywofY6jYCLsLjjHLK8/MOsKE+LVl
 TYZgQ5xJtbplZM5i1wq4EqA/+bXLEPzRk3VqM1K0QAt5jNnUP5lxITwfq/SkS/mGAYPu
 3t0qlM2auq5+Eo2ynXOpPfvOYqhrqQOvoLMW2q4NvHOJ7wJtIXPsPpZrBCJJvh9DTBPE
 oJZ7Zgae0889YDHfbJ/JZjyQizHp06oJAnLEYtY6eCT4RNBhzGbzSylK2kSAkLZtjt1M
 Ekbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HNXbqpEcUn7DYG1idgGyglL0XhGdSXTe8CR2vhs1To=;
 b=cpGgMrlylbIXR8Y7cyJZfM5TKU9mKu+YEjAMQs9ipI2ljToRdCAtsXKpWMLQVmDSl+
 wdHQ948bisFLGdHU3fTAdUZBLBBoNTzuLxW83VSh4rjYnSJXA1BaOEL6Qp9o24qnxNfa
 wUHD9Gao/kffy3DfS7ufJZWTmjfYH0bs6LeFz5V1nGF5Q4FKJQUUSNWWIGicFTYc2yCX
 9TXP/d/+2n4ZJPw+3TP/ePLuGhYGB5FrMAWhEeww6mFMrobMFP8fsKXfvxbumchezL7C
 //KzHxE4nICw9A61X7SIddJlFIQnhZFc0AH/I+ZhGVM/Ky7iS2JXzCfyPfExTn3WFhty
 iGmA==
X-Gm-Message-State: ACrzQf34fLO5/Y4DGDust5R1aAS5xftyVsY1jv/Lw19HFWr2ZKFLJ8a9
 D54b/Y19LTqy37o/UYCGKXCBjDzuEkazw94p
X-Google-Smtp-Source: AMsMyM4D8J+0i/v0mlI0eI25EF0y75yCm8vQxByxDAXKeKM+B0EVz2GdQr5I4QlelhzsgPN/gOib8A==
X-Received: by 2002:a05:6808:1595:b0:359:f805:cf84 with SMTP id
 t21-20020a056808159500b00359f805cf84mr6196834oiw.152.1667270840737; 
 Mon, 31 Oct 2022 19:47:20 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05683001c400b00661a33883b8sm3367215ota.71.2022.10.31.19.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 19:47:20 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v2 3/3] tests/qtest: sifive-e-aon-watchdog-test.c : Add QTest
 of watchdog of sifive_e
Date: Mon, 31 Oct 2022 19:46:56 -0700
Message-Id: <20221101024656.517608-4-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221101024656.517608-1-tommy.wu@sifive.com>
References: <20221101024656.517608-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=tommy.wu@sifive.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Nov 2022 02:47:31 -0000

Add some simple tests of the watchdog timer in the always-on domain device
of HiFive 1 rev b.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 650 +++++++++++++++++++++++
 2 files changed, 653 insertions(+)
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c07a5b1a5f..4a38bcb829 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -230,6 +230,9 @@ qtests_s390x = \
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
index 0000000000..1f454c266a
--- /dev/null
+++ b/tests/qtest/sifive-e-aon-watchdog-test.c
@@ -0,0 +1,650 @@
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "qemu/bitops.h"
+#include "libqtest-single.h"
+#include "hw/registerfields.h"
+#include "hw/misc/sifive_e_aon.h"
+
+FIELD(AON_WDT_WDOGCFG,
+      SCALE, 0, 4)
+FIELD(AON_WDT_WDOGCFG,
+      RSVD0, 4, 4)
+FIELD(AON_WDT_WDOGCFG,
+      RSTEN, 8, 1)
+FIELD(AON_WDT_WDOGCFG,
+      ZEROCMP, 9, 1)
+FIELD(AON_WDT_WDOGCFG,
+      RSVD1, 10, 2)
+FIELD(AON_WDT_WDOGCFG,
+      EN_ALWAYS, 12, 1)
+FIELD(AON_WDT_WDOGCFG,
+      EN_CORE_AWAKE, 13, 1)
+FIELD(AON_WDT_WDOGCFG,
+      RSVD2, 14, 14)
+FIELD(AON_WDT_WDOGCFG,
+      IP0, 28, 1)
+FIELD(AON_WDT_WDOGCFG,
+      RSVD3, 29, 3)
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
+    uint64_t tmp;
+
+    test_init();
+
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
+    uint32_t tmp_cfg;
+
+    test_init();
+
+    tmp_cfg = readl(WDOG_BASE + WDOGCFG);
+    writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
+    g_assert(readl(WDOG_BASE + WDOGCFG) == tmp_cfg);
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
+    g_assert(0xFFFFFFFF == readl(WDOG_BASE + WDOGCFG));
+
+    tmp_cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(1 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(1 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(1 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(1 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(1 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, 0);
+    tmp_cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(0 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(0 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(0 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(0 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(0 ==
+             FIELD_EX32(tmp_cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+    g_assert(0 == readl(WDOG_BASE + WDOGCFG));
+}
+
+static void test_wdogcmp0(void)
+{
+    uint32_t tmp;
+
+    test_init();
+
+    tmp = readl(WDOG_BASE + WDOGCMP0);
+    writel(WDOG_BASE + WDOGCMP0, 0xBEEF);
+    g_assert(readl(WDOG_BASE + WDOGCMP0) == tmp);
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
+    uint32_t cfg;
+    uint32_t fake_count = 0x12345678;
+
+    test_init();
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, fake_count);
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) == fake_count);
+    g_assert((uint16_t)readl(WDOG_BASE + WDOGS) ==
+             (uint16_t)fake_count);
+
+    for (int i = 0; i < 16; i++) {
+        cfg = readl(WDOG_BASE + WDOGCFG);
+        cfg = FIELD_DP32(cfg,
+                         AON_WDT_WDOGCFG,
+                         SCALE, i);
+        writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+        writel(WDOG_BASE + WDOGCFG, cfg);
+        g_assert((uint16_t)readl(WDOG_BASE + WDOGS) ==
+                 (uint16_t)(fake_count >>
+                            FIELD_EX32(cfg,
+                                       AON_WDT_WDOGCFG,
+                                       SCALE)));
+    }
+}
+
+static void test_watchdog(void)
+{
+    uint32_t cfg;
+
+    test_init();
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ);
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    cfg = FIELD_DP32(cfg,
+                     AON_WDT_WDOGCFG,
+                     SCALE, 0);
+    cfg = FIELD_DP32(cfg,
+                     AON_WDT_WDOGCFG,
+                     EN_ALWAYS, 1);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+
+    clock_step(NANOSECONDS_PER_SECOND);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ);
+
+    g_assert(readl(WDOG_BASE + WDOGS) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ);
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0);
+    cfg = FIELD_DP32(cfg,
+                     AON_WDT_WDOGCFG,
+                     IP0, 0);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+}
+
+static void test_scaled_watchdog(void)
+{
+    uint32_t cfg;
+
+    test_init();
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, 10);
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   SCALE, 15);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   EN_ALWAYS, 1);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+
+    clock_step(NANOSECONDS_PER_SECOND * 10);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ * 10);
+
+    g_assert(10 == readl(WDOG_BASE + WDOGS));
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   IP0, 0);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+}
+
+static void test_periodic_int(void)
+{
+    uint32_t cfg;
+
+    test_init();
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ);
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   SCALE, 0);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   ZEROCMP, 1);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   EN_ALWAYS, 1);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+
+    clock_step(NANOSECONDS_PER_SECOND);
+
+    g_assert(0 == readl(WDOG_BASE + WDOGCOUNT));
+
+    g_assert(0 == readl(WDOG_BASE + WDOGS));
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    cfg = FIELD_DP32(cfg,
+                     AON_WDT_WDOGCFG,
+                     IP0, 0);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    clock_step(NANOSECONDS_PER_SECOND);
+
+    g_assert(0 == readl(WDOG_BASE + WDOGCOUNT));
+
+    g_assert(0 == readl(WDOG_BASE + WDOGS));
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   IP0, 0);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+}
+
+static void test_enable_disable(void)
+{
+    uint32_t cfg;
+
+    test_init();
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCMP0, 10);
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   SCALE, 15);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   EN_ALWAYS, 1);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+
+    clock_step(NANOSECONDS_PER_SECOND * 2);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ * 2);
+
+    g_assert(2 == readl(WDOG_BASE + WDOGS));
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   EN_ALWAYS, 0);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+
+    clock_step(NANOSECONDS_PER_SECOND * 8);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ * 2);
+
+    g_assert(2 == readl(WDOG_BASE + WDOGS));
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   EN_ALWAYS, 1);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+
+    clock_step(NANOSECONDS_PER_SECOND * 8);
+
+    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
+             SIFIVE_E_LFCLK_DEFAULT_FREQ * 10);
+
+    g_assert(10 == readl(WDOG_BASE + WDOGS));
+
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(15 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        SCALE));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                         RSTEN));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        ZEROCMP));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_ALWAYS));
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        EN_CORE_AWAKE));
+    g_assert(1 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
+
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCOUNT, 0);
+    cfg =
+        FIELD_DP32(cfg,
+                   AON_WDT_WDOGCFG,
+                   IP0, 0);
+    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
+    writel(WDOG_BASE + WDOGCFG, cfg);
+    cfg = readl(WDOG_BASE + WDOGCFG);
+    g_assert(0 ==
+             FIELD_EX32(cfg,
+                        AON_WDT_WDOGCFG,
+                        IP0));
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
+    qtest_end();
+
+    return r;
+}
-- 
2.27.0


