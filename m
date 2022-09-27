Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1od50k-0001mT-Uh
	for mharc-qemu-riscv@gnu.org; Tue, 27 Sep 2022 03:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1od50b-0001gf-EA
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 03:28:02 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:39827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1od50Y-00011r-8O
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 03:28:01 -0400
Received: by mail-lj1-x22e.google.com with SMTP id b24so9942055ljk.6
 for <qemu-riscv@nongnu.org>; Tue, 27 Sep 2022 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=OX6yHRBmvsJd5gOSoguPpyZyG1aG4raxC/B0LfHpNTE=;
 b=AkiQzS4BY4AWqKCr9WoMzLEmG5voR1H4YPEa3YdYkAoe2/Z4xNFxPqVnRUJlrQYJhD
 /MUxmz9NN5GJGeXvh48VV/b8ov6aX3UQHQAIV906v2wi0p1nCrkXzgbP/5OH5LCSD9CE
 wXPPZbmSa6YNXoV6sY6Xqlr7lJuqgB4t/Hiio4SHk/9j5IZGxlcqRC14ADlV05jaHTgU
 ErGEVyqPx9pfpMODbmtSCh+RpmNxjtG0ITBFtVV0eDCeVUTFCrIwHCainS7C7VFTof3T
 GKXBEw2wllyJo5KDb0sPA7NiHH+eokAiOC4fGCSKNquN4iPApmSNQvU6jbag6nhg05ul
 PkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=OX6yHRBmvsJd5gOSoguPpyZyG1aG4raxC/B0LfHpNTE=;
 b=ae4hdJm9NJCfHBenDEztXwFlUtE4sLJJNuessLEfMX+Xr4DfC7R6nhcSOm28hI2gOv
 06Cp/zhTng/P2XHksGMCI2wgw4OV6Q7fbru0aB3gWoSv/BJKg/tvhMuYFcSVpqgYcJVF
 bIjjYfsIeiDsohsxIwWW2TvoS8ds5Ndgo2lUYPA0ogkq7ACscsglxfFpHpy22hKevKfc
 /UcxW45wNU2L8BVu5hQMnrgOMSpMthgf8Soww72PN+DFwbZpu7NsrRk+5Wicv2SvuHCk
 0jVPA5pvNCkImg4+bnUv13buHqmFIqbZ0TTG4wNgTvbSj/J0C2XWys3X1UUNAD+qzcSU
 /QUA==
X-Gm-Message-State: ACrzQf3rM52v7gpBlPBokEmNJ2dSqiSEmRUhjqQYQmUBwg+UVnQ4LPvi
 Q3KgOBTdHZegwm7B4Ab19TanQBh9bRY/MCeC
X-Google-Smtp-Source: AMsMyM4YITZtLVdlkaarTXqgLVESA0F9PS54B9D6dfUrvvUvo6cDygwpX++JEkNviN/NiMiU6qUIAQ==
X-Received: by 2002:a05:651c:178e:b0:25a:4357:49cd with SMTP id
 bn14-20020a05651c178e00b0025a435749cdmr9264651ljb.123.1664263676145; 
 Tue, 27 Sep 2022 00:27:56 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05651c048c00b0026da7734d7bsm77398ljc.112.2022.09.27.00.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 00:27:55 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id j16so14429114lfg.1;
 Tue, 27 Sep 2022 00:27:54 -0700 (PDT)
X-Received: by 2002:a05:6512:130a:b0:4a1:d80d:95e with SMTP id
 x10-20020a056512130a00b004a1d80d095emr2791856lfu.565.1664263673545; Tue, 27
 Sep 2022 00:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
 <20220922084107.2834285-4-tommy.wu@sifive.com>
In-Reply-To: <20220922084107.2834285-4-tommy.wu@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 27 Sep 2022 15:27:42 +0800
X-Gmail-Original-Message-ID: <CANzO1D1YBrniruAxJdLSWDDx7-eNyCovr8Rfmd+bBGyFdnm_7w@mail.gmail.com>
Message-ID: <CANzO1D1YBrniruAxJdLSWDDx7-eNyCovr8Rfmd+bBGyFdnm_7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests/qtest: sifive-e-aon-watchdog-test.c : Add QTest
 of watchdog of sifive_e
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000001308e005e9a39572"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=frank.chang@sifive.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Tue, 27 Sep 2022 07:28:03 -0000

--0000000000001308e005e9a39572
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Thu, Sep 22, 2022 at 4:42 PM Tommy Wu <tommy.wu@sifive.com> wrote:

> Add some simple tests of the watchdog timer in the always-on domain device
> of HiFive 1 rev b.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>  tests/qtest/meson.build                  |   3 +
>  tests/qtest/sifive-e-aon-watchdog-test.c | 400 +++++++++++++++++++++++
>  2 files changed, 403 insertions(+)
>  create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e910cb32ca..446115ea34 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -234,6 +234,9 @@ qtests_s390x = \
>     'cpu-plug-test',
>     'migration-test']
>
> +qtests_riscv32 = \
> +  (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ?
> ['sifive-e-aon-watchdog-test'] : [])
> +
>  qos_test_ss = ss.source_set()
>  qos_test_ss.add(
>    'ac97-test.c',
> diff --git a/tests/qtest/sifive-e-aon-watchdog-test.c
> b/tests/qtest/sifive-e-aon-watchdog-test.c
> new file mode 100644
> index 0000000000..a583539346
> --- /dev/null
> +++ b/tests/qtest/sifive-e-aon-watchdog-test.c
> @@ -0,0 +1,400 @@
> +#include "qemu/osdep.h"
> +#include "qemu/timer.h"
> +#include "qemu/bitops.h"
> +#include "libqtest-single.h"
> +#include "hw/misc/sifive_e_aon.h"
> +
> +#define WDOG_BASE (0x10000000)
> +#define WDOGCFG (0x0)
> +#define WDOGCOUNT (0x8)
> +#define WDOGS (0x10)
> +#define WDOGFEED (0x18)
> +#define WDOGKEY (0x1c)
> +#define WDOGCMP0 (0x20)
> +
> +#define SIFIVE_E_AON_WDOGKEY (0x51F15E)
> +#define SIFIVE_E_AON_WDOGFEED (0xD09F00D)
> +#define SIFIVE_E_LFCLK_DEFAULT_FREQ (32768)
> +
> +static void test_init(void)
> +{
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCOUNT, 0);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, 0);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCMP0, 0xBEEF);
> +}
> +
> +static void test_wdogcount(void)
> +{
> +    test_init();
> +
> +    uint64_t tmp;
> +    tmp = readl(WDOG_BASE + WDOGCOUNT);
> +    writel(WDOG_BASE + WDOGCOUNT, 0xBEEF);
> +    g_assert(readl(WDOG_BASE + WDOGCOUNT) == tmp);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCOUNT, 0xBEEF);
> +    g_assert(0xBEEF == readl(WDOG_BASE + WDOGCOUNT));
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCOUNT, 0xAAAAAAAA);
> +    g_assert(0x2AAAAAAA == readl(WDOG_BASE + WDOGCOUNT));
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGFEED, 0xAAAAAAAA);
> +    g_assert(0x2AAAAAAA == readl(WDOG_BASE + WDOGCOUNT));
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGFEED, SIFIVE_E_AON_WDOGFEED);
> +    g_assert(0 == readl(WDOG_BASE + WDOGCOUNT));
> +}
> +
> +static void test_wdogcfg(void)
> +{
> +    test_init();
> +
> +    wdogcfg_s tmp;
> +    tmp.value = readl(WDOG_BASE + WDOGCFG);
> +    writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
> +    g_assert(readl(WDOG_BASE + WDOGCFG) == tmp.value);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
> +    g_assert(0xFFFFFFFF == readl(WDOG_BASE + WDOGCFG));
> +
> +    tmp.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(15 == tmp.wdogscale);
> +    g_assert(1 == tmp.wdogrsten);
> +    g_assert(1 == tmp.wdogzerocmp);
> +    g_assert(1 == tmp.wdogenalways);
> +    g_assert(1 == tmp.wdogencoreawake);
> +    g_assert(1 == tmp.wdogip0);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, 0);
> +    g_assert(0 == readl(WDOG_BASE + WDOGCFG));
> +
> +    tmp.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == tmp.wdogscale);
> +    g_assert(0 == tmp.wdogrsten);
> +    g_assert(0 == tmp.wdogzerocmp);
> +    g_assert(0 == tmp.wdogenalways);
> +    g_assert(0 == tmp.wdogencoreawake);
> +    g_assert(0 == tmp.wdogip0);
> +}
> +
> +static void test_wdogcmp0(void)
> +{
> +    test_init();
> +
> +    wdogcfg_s tmp;
> +    tmp.value = readl(WDOG_BASE + WDOGCMP0);
> +    writel(WDOG_BASE + WDOGCMP0, 0xBEEF);
> +    g_assert(readl(WDOG_BASE + WDOGCMP0) == tmp.value);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCMP0, 0xBEEF);
> +    g_assert(0xBEEF == readl(WDOG_BASE + WDOGCMP0));
> +}
> +
> +static void test_wdogkey(void)
> +{
> +    test_init();
> +
> +    g_assert(0 == readl(WDOG_BASE + WDOGKEY));
> +
> +    writel(WDOG_BASE + WDOGKEY, 0xFFFF);
> +    g_assert(0 == readl(WDOG_BASE + WDOGKEY));
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    g_assert(1 == readl(WDOG_BASE + WDOGKEY));
> +
> +    writel(WDOG_BASE + WDOGFEED, 0xAAAAAAAA);
> +    g_assert(0 == readl(WDOG_BASE + WDOGKEY));
> +}
> +
> +static void test_wdogfeed(void)
> +{
> +    test_init();
> +
> +    g_assert(0 == readl(WDOG_BASE + WDOGFEED));
> +
> +    writel(WDOG_BASE + WDOGFEED, 0xFFFF);
> +    g_assert(0 == readl(WDOG_BASE + WDOGFEED));
> +}
> +
> +static void test_scaled_wdogs(void)
> +{
> +    test_init();
> +
> +    wdogcfg_s cfg;
> +    uint32_t fake_count = 0x12345678;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCOUNT, fake_count);
> +    g_assert(readl(WDOG_BASE + WDOGCOUNT) == fake_count);
> +    g_assert((uint16_t)readl(WDOG_BASE + WDOGS) ==
> +             (uint16_t)fake_count);
> +
> +    for (int i = 0; i < 16; i++) {
> +        cfg.value = readl(WDOG_BASE + WDOGCFG);
> +        cfg.wdogscale = i;
> +        writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +        writel(WDOG_BASE + WDOGCFG, cfg.value);
> +        g_assert((uint16_t)readl(WDOG_BASE + WDOGS) ==
> +                 (uint16_t)(fake_count >> cfg.wdogscale));
> +    }
> +}
> +
> +static void test_watchdog(void)
> +{
> +    test_init();
> +
> +    wdogcfg_s cfg;
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ);
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    cfg.wdogscale = 0;
> +    cfg.wdogenalways = 1;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +
> +    clock_step(NANOSECONDS_PER_SECOND);
> +
> +    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ);
> +
> +    g_assert(readl(WDOG_BASE + WDOGS) ==
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ);
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == cfg.wdogscale);
> +    g_assert(0 == cfg.wdogrsten);
> +    g_assert(0 == cfg.wdogzerocmp);
> +    g_assert(1 == cfg.wdogenalways);
> +    g_assert(0 == cfg.wdogencoreawake);
> +    g_assert(1 == cfg.wdogip0);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCOUNT, 0);
> +    cfg.wdogip0 = 0;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == cfg.wdogip0);
> +}
> +
> +static void test_scaled_watchdog(void)
> +{
> +    test_init();
> +
> +    wdogcfg_s cfg;
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCMP0, 10);
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    cfg.wdogscale = 15;
> +    cfg.wdogenalways = 1;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +
> +    clock_step(NANOSECONDS_PER_SECOND * 10);
> +
> +    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ * 10);
> +
> +    g_assert(10 == readl(WDOG_BASE + WDOGS));
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(15 == cfg.wdogscale);
> +    g_assert(0 == cfg.wdogrsten);
> +    g_assert(0 == cfg.wdogzerocmp);
> +    g_assert(1 == cfg.wdogenalways);
> +    g_assert(0 == cfg.wdogencoreawake);
> +    g_assert(1 == cfg.wdogip0);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCOUNT, 0);
> +    cfg.wdogip0 = 0;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == cfg.wdogip0);
> +}
> +
> +static void test_periodic_int(void)
> +{
> +    test_init();
> +
> +    wdogcfg_s cfg;
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ);
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    cfg.wdogscale = 0;
> +    cfg.wdogzerocmp = 1;
> +    cfg.wdogenalways = 1;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +
> +    clock_step(NANOSECONDS_PER_SECOND);
> +
> +    g_assert(0 == readl(WDOG_BASE + WDOGCOUNT));
> +
> +    g_assert(0 == readl(WDOG_BASE + WDOGS));
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == cfg.wdogscale);
> +    g_assert(0 == cfg.wdogrsten);
> +    g_assert(1 == cfg.wdogzerocmp);
> +    g_assert(1 == cfg.wdogenalways);
> +    g_assert(0 == cfg.wdogencoreawake);
> +    g_assert(1 == cfg.wdogip0);
> +
> +    cfg.wdogip0 = 0;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == cfg.wdogip0);
> +
> +    clock_step(NANOSECONDS_PER_SECOND);
> +
> +    g_assert(0 == readl(WDOG_BASE + WDOGCOUNT));
> +
> +    g_assert(0 == readl(WDOG_BASE + WDOGS));
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == cfg.wdogscale);
> +    g_assert(0 == cfg.wdogrsten);
> +    g_assert(1 == cfg.wdogzerocmp);
> +    g_assert(1 == cfg.wdogenalways);
> +    g_assert(0 == cfg.wdogencoreawake);
> +    g_assert(1 == cfg.wdogip0);
> +
> +    cfg.wdogip0 = 0;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == cfg.wdogip0);
> +}
> +
> +static void test_enable_disable(void)
> +{
> +    test_init();
> +
> +    wdogcfg_s cfg;
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCMP0, 10);
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    cfg.wdogscale = 15;
> +    cfg.wdogenalways = 1;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +
> +    clock_step(NANOSECONDS_PER_SECOND * 2);
> +
> +    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ * 2);
> +
> +    g_assert(2 == readl(WDOG_BASE + WDOGS));
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(15 == cfg.wdogscale);
> +    g_assert(0 == cfg.wdogrsten);
> +    g_assert(0 == cfg.wdogzerocmp);
> +    g_assert(1 == cfg.wdogenalways);
> +    g_assert(0 == cfg.wdogencoreawake);
> +    g_assert(0 == cfg.wdogip0);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    cfg.wdogenalways = 0;
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +
> +    clock_step(NANOSECONDS_PER_SECOND * 8);
> +
> +    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ * 2);
> +
> +    g_assert(2 == readl(WDOG_BASE + WDOGS));
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(15 == cfg.wdogscale);
> +    g_assert(0 == cfg.wdogrsten);
> +    g_assert(0 == cfg.wdogzerocmp);
> +    g_assert(0 == cfg.wdogenalways);
> +    g_assert(0 == cfg.wdogencoreawake);
> +    g_assert(0 == cfg.wdogip0);
> +
> +    cfg.wdogenalways = 1;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +
> +    clock_step(NANOSECONDS_PER_SECOND * 8);
> +
> +    g_assert(readl(WDOG_BASE + WDOGCOUNT) ==
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ * 10);
> +
> +    g_assert(10 == readl(WDOG_BASE + WDOGS));
> +
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(15 == cfg.wdogscale);
> +    g_assert(0 == cfg.wdogrsten);
> +    g_assert(0 == cfg.wdogzerocmp);
> +    g_assert(1 == cfg.wdogenalways);
> +    g_assert(0 == cfg.wdogencoreawake);
> +    g_assert(1 == cfg.wdogip0);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCOUNT, 0);
> +    cfg.wdogip0 = 0;
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, cfg.value);
> +    cfg.value = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(0 == cfg.wdogip0);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    int r;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_start("-machine sifive_e");
> +
> +    qtest_add_func("/sifive-e-aon-watchdog-test/wdogcount",
> +                   test_wdogcount);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/wdogcfg",
> +                   test_wdogcfg);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/wdogcmp0",
> +                   test_wdogcmp0);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/wdogkey",
> +                   test_wdogkey);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/wdogfeed",
> +                   test_wdogfeed);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/scaled_wdogs",
> +                   test_scaled_wdogs);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/watchdog",
> +                   test_watchdog);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/scaled_watchdog",
> +                   test_scaled_watchdog);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/periodic_int",
> +                   test_periodic_int);
> +    qtest_add_func("/sifive-e-aon-watchdog-test/enable_disable",
> +                   test_enable_disable);
> +
> +    r = g_test_run();
> +
> +    qtest_end();
> +
> +    return r;
> +}
> --
> 2.27.0
>
>
>

--0000000000001308e005e9a39572
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 4:42=
 PM Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com">tommy.wu@sifive.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Add some simple tests of the watchdog timer in the always-on domain device<=
br>
of HiFive 1 rev b.<br>
<br>
Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" target=
=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0tests/qtest/sifive-e-aon-watchdog-test.c | 400 ++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 403 insertions(+)<br>
=C2=A0create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c<br>
<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index e910cb32ca..446115ea34 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -234,6 +234,9 @@ qtests_s390x =3D \<br>
=C2=A0 =C2=A0 &#39;cpu-plug-test&#39;,<br>
=C2=A0 =C2=A0 &#39;migration-test&#39;]<br>
<br>
+qtests_riscv32 =3D \<br>
+=C2=A0 (config_all_devices.has_key(&#39;CONFIG_SIFIVE_E_AON&#39;) ? [&#39;=
sifive-e-aon-watchdog-test&#39;] : [])<br>
+<br>
=C2=A0qos_test_ss =3D ss.source_set()<br>
=C2=A0qos_test_ss.add(<br>
=C2=A0 =C2=A0&#39;ac97-test.c&#39;,<br>
diff --git a/tests/qtest/sifive-e-aon-watchdog-test.c b/tests/qtest/sifive-=
e-aon-watchdog-test.c<br>
new file mode 100644<br>
index 0000000000..a583539346<br>
--- /dev/null<br>
+++ b/tests/qtest/sifive-e-aon-watchdog-test.c<br>
@@ -0,0 +1,400 @@<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
+#include &quot;qemu/bitops.h&quot;<br>
+#include &quot;libqtest-single.h&quot;<br>
+#include &quot;hw/misc/sifive_e_aon.h&quot;<br>
+<br>
+#define WDOG_BASE (0x10000000)<br>
+#define WDOGCFG (0x0)<br>
+#define WDOGCOUNT (0x8)<br>
+#define WDOGS (0x10)<br>
+#define WDOGFEED (0x18)<br>
+#define WDOGKEY (0x1c)<br>
+#define WDOGCMP0 (0x20)<br>
+<br>
+#define SIFIVE_E_AON_WDOGKEY (0x51F15E)<br>
+#define SIFIVE_E_AON_WDOGFEED (0xD09F00D)<br>
+#define SIFIVE_E_LFCLK_DEFAULT_FREQ (32768)<br>
+<br>
+static void test_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCOUNT, 0);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, 0);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCMP0, 0xBEEF);<br>
+}<br>
+<br>
+static void test_wdogcount(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 uint64_t tmp;<br>
+=C2=A0 =C2=A0 tmp =3D readl(WDOG_BASE + WDOGCOUNT);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCOUNT, 0xBEEF);<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCOUNT) =3D=3D tmp);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCOUNT, 0xBEEF);<br>
+=C2=A0 =C2=A0 g_assert(0xBEEF =3D=3D readl(WDOG_BASE + WDOGCOUNT));<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCOUNT, 0xAAAAAAAA);<br>
+=C2=A0 =C2=A0 g_assert(0x2AAAAAAA =3D=3D readl(WDOG_BASE + WDOGCOUNT));<br=
>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGFEED, 0xAAAAAAAA);<br>
+=C2=A0 =C2=A0 g_assert(0x2AAAAAAA =3D=3D readl(WDOG_BASE + WDOGCOUNT));<br=
>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGFEED, SIFIVE_E_AON_WDOGFEED);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGCOUNT));<br>
+}<br>
+<br>
+static void test_wdogcfg(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 wdogcfg_s tmp;<br>
+=C2=A0 =C2=A0 tmp.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCFG) =3D=3D tmp.value);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);<br>
+=C2=A0 =C2=A0 g_assert(0xFFFFFFFF =3D=3D readl(WDOG_BASE + WDOGCFG));<br>
+<br>
+=C2=A0 =C2=A0 tmp.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(15 =3D=3D tmp.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D tmp.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D tmp.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D tmp.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D tmp.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D tmp.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, 0);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGCFG));<br>
+<br>
+=C2=A0 =C2=A0 tmp.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D tmp.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D tmp.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D tmp.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D tmp.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D tmp.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D tmp.wdogip0);<br>
+}<br>
+<br>
+static void test_wdogcmp0(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 wdogcfg_s tmp;<br>
+=C2=A0 =C2=A0 tmp.value =3D readl(WDOG_BASE + WDOGCMP0);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCMP0, 0xBEEF);<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCMP0) =3D=3D tmp.value);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCMP0, 0xBEEF);<br>
+=C2=A0 =C2=A0 g_assert(0xBEEF =3D=3D readl(WDOG_BASE + WDOGCMP0));<br>
+}<br>
+<br>
+static void test_wdogkey(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGKEY));<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, 0xFFFF);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGKEY));<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D readl(WDOG_BASE + WDOGKEY));<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGFEED, 0xAAAAAAAA);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGKEY));<br>
+}<br>
+<br>
+static void test_wdogfeed(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGFEED));<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGFEED, 0xFFFF);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGFEED));<br>
+}<br>
+<br>
+static void test_scaled_wdogs(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 wdogcfg_s cfg;<br>
+=C2=A0 =C2=A0 uint32_t fake_count =3D 0x12345678;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCOUNT, fake_count);<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCOUNT) =3D=3D fake_count);<br=
>
+=C2=A0 =C2=A0 g_assert((uint16_t)readl(WDOG_BASE + WDOGS) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint16_t)fake_count);<br>
+<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 16; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg.wdogscale =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGK=
EY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert((uint16_t)readl(WDOG_BASE + WDOGS) =
=3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint16_t)(f=
ake_count &gt;&gt; cfg.wdogscale));<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void test_watchdog(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 wdogcfg_s cfg;<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ);<b=
r>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 cfg.wdogscale =3D 0;<br>
+=C2=A0 =C2=A0 cfg.wdogenalways =3D 1;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+<br>
+=C2=A0 =C2=A0 clock_step(NANOSECONDS_PER_SECOND);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCOUNT) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIFIVE_E_LFCLK_DEFAULT_FRE=
Q);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGS) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIFIVE_E_LFCLK_DEFAULT_FRE=
Q);<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCOUNT, 0);<br>
+=C2=A0 =C2=A0 cfg.wdogip0 =3D 0;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogip0);<br>
+}<br>
+<br>
+static void test_scaled_watchdog(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 wdogcfg_s cfg;<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCMP0, 10);<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 cfg.wdogscale =3D 15;<br>
+=C2=A0 =C2=A0 cfg.wdogenalways =3D 1;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+<br>
+=C2=A0 =C2=A0 clock_step(NANOSECONDS_PER_SECOND * 10);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCOUNT) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIFIVE_E_LFCLK_DEFAULT_FRE=
Q * 10);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(10 =3D=3D readl(WDOG_BASE + WDOGS));<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(15 =3D=3D cfg.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCOUNT, 0);<br>
+=C2=A0 =C2=A0 cfg.wdogip0 =3D 0;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogip0);<br>
+}<br>
+<br>
+static void test_periodic_int(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 wdogcfg_s cfg;<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ);<b=
r>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 cfg.wdogscale =3D 0;<br>
+=C2=A0 =C2=A0 cfg.wdogzerocmp =3D 1;<br>
+=C2=A0 =C2=A0 cfg.wdogenalways =3D 1;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+<br>
+=C2=A0 =C2=A0 clock_step(NANOSECONDS_PER_SECOND);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGCOUNT));<br>
+<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGS));<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 cfg.wdogip0 =3D 0;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 clock_step(NANOSECONDS_PER_SECOND);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGCOUNT));<br>
+<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D readl(WDOG_BASE + WDOGS));<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 cfg.wdogip0 =3D 0;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogip0);<br>
+}<br>
+<br>
+static void test_enable_disable(void)<br>
+{<br>
+=C2=A0 =C2=A0 test_init();<br>
+<br>
+=C2=A0 =C2=A0 wdogcfg_s cfg;<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCMP0, 10);<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 cfg.wdogscale =3D 15;<br>
+=C2=A0 =C2=A0 cfg.wdogenalways =3D 1;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+<br>
+=C2=A0 =C2=A0 clock_step(NANOSECONDS_PER_SECOND * 2);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCOUNT) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIFIVE_E_LFCLK_DEFAULT_FRE=
Q * 2);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(2 =3D=3D readl(WDOG_BASE + WDOGS));<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(15 =3D=3D cfg.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 cfg.wdogenalways =3D 0;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+<br>
+=C2=A0 =C2=A0 clock_step(NANOSECONDS_PER_SECOND * 8);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCOUNT) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIFIVE_E_LFCLK_DEFAULT_FRE=
Q * 2);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(2 =3D=3D readl(WDOG_BASE + WDOGS));<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(15 =3D=3D cfg.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 cfg.wdogenalways =3D 1;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+<br>
+=C2=A0 =C2=A0 clock_step(NANOSECONDS_PER_SECOND * 8);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(readl(WDOG_BASE + WDOGCOUNT) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIFIVE_E_LFCLK_DEFAULT_FRE=
Q * 10);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(10 =3D=3D readl(WDOG_BASE + WDOGS));<br>
+<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(15 =3D=3D cfg.wdogscale);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogrsten);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogzerocmp);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogenalways);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogencoreawake);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D cfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCOUNT, 0);<br>
+=C2=A0 =C2=A0 cfg.wdogip0 =3D 0;<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);<br>
+=C2=A0 =C2=A0 writel(WDOG_BASE + WDOGCFG, cfg.value);<br>
+=C2=A0 =C2=A0 cfg.value =3D readl(WDOG_BASE + WDOGCFG);<br>
+=C2=A0 =C2=A0 g_assert(0 =3D=3D cfg.wdogip0);<br>
+}<br>
+<br>
+int main(int argc, char *argv[])<br>
+{<br>
+=C2=A0 =C2=A0 int r;<br>
+<br>
+=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
+<br>
+=C2=A0 =C2=A0 qtest_start(&quot;-machine sifive_e&quot;);<br>
+<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/wdogcount&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
wdogcount);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/wdogcfg&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
wdogcfg);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/wdogcmp0&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
wdogcmp0);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/wdogkey&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
wdogkey);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/wdogfeed&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
wdogfeed);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/scaled_wdog=
s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
scaled_wdogs);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/watchdog&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
watchdog);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/scaled_watc=
hdog&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
scaled_watchdog);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/periodic_in=
t&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
periodic_int);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/sifive-e-aon-watchdog-test/enable_disa=
ble&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
enable_disable);<br>
+<br>
+=C2=A0 =C2=A0 r =3D g_test_run();<br>
+<br>
+=C2=A0 =C2=A0 qtest_end();<br>
+<br>
+=C2=A0 =C2=A0 return r;<br>
+}<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div>

--0000000000001308e005e9a39572--

