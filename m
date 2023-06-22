Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07275EB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 02:09:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC9l4-0003jo-Oz; Wed, 21 Jun 2023 22:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9l2-0003jS-0z; Wed, 21 Jun 2023 22:09:12 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9kz-0003jr-4v; Wed, 21 Jun 2023 22:09:11 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-440ad8ea514so1590019137.2; 
 Wed, 21 Jun 2023 19:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687399747; x=1689991747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0IoiPO6Eua4Mt4sfOUBVye5sUfQ/VNMAooVLXpSkXZo=;
 b=myFVziBUfGbHeP/AVF72rR26DIziP6n7BOzaP1svaCnMhRI+EiHP6T92AysPjxIEVC
 olK2Tk0hiT3e8SowyQ21wGhVVHSnnqu+nDm63PkOuUVOqtKNlAe3N2PuoyVhB83xLplE
 F0YolnGcs02mNjDbk0PRK9MjnAqKvNDssNIv2k8A3eFvP0axOGI1tl+d5Q1oZ1HmkkXd
 w9NJiyBNZoFay8S9ep/GuoVujcH58F1kOi02o5ejplQYdaRWXxwQzVXPdh2CpVDvBjhg
 KZhI7sYwuzPfRUxc1/c2YJpvfc60qbcns5I7Fi75qvvrQ2M62mCieCjSchSdkeXZ27dm
 1tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687399747; x=1689991747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0IoiPO6Eua4Mt4sfOUBVye5sUfQ/VNMAooVLXpSkXZo=;
 b=h7ZcJmVHd2mwmZ+H3kU1UA4MR6z9mTmul8cbOHmv3O1tBIL2OcaGYGHS1BBPbyRfYl
 8eqSUtt0wl67S2peU702YyTY1/uHDz0n5xQn6IfbywOr9dlMF83WfaTKvoFuztJNwBSL
 G/MGcllYtLifi3/BxUhJi+ghP/C5sm+Obd00Z3upmFV8FE+mfM7NXw6dgphARjlzQb/3
 MBmU6NzW4dmyvL/XaVHXb1qfULuTafiHnIcVe5zp+ZT6w3ye2ZmrLtqSD5rRhGxeoa/s
 wzM99CMI3rPZCX92loi0vMquIMqP1eJU62iWvd4cc6FWN4floa7uNhhminCwQkTVxpbN
 DxMw==
X-Gm-Message-State: AC+VfDx091MKutWbI/3D8S5w6gI5AFqok1dppVrX6q1h1Smx/W2IUwxt
 f03k6cWqGJd0WZuB3QMoyud8g3yQnE835w6ZuoA=
X-Google-Smtp-Source: ACHHUZ5sUbzg+HtnsIC868UBrZIdxM0KqghxC9gjLLrcZ4TB1Dwdx1hfjnxRf8+Fyuh82K2H6bJFFyLmsL8n46/BlH0=
X-Received: by 2002:a67:db87:0:b0:440:c0dd:e7f7 with SMTP id
 f7-20020a67db87000000b00440c0dde7f7mr5163078vsk.4.1687399746696; Wed, 21 Jun
 2023 19:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230608164542.3675619-1-tommy.wu@sifive.com>
 <20230608164542.3675619-4-tommy.wu@sifive.com>
In-Reply-To: <20230608164542.3675619-4-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 12:08:40 +1000
Message-ID: <CAKmqyKMGfMGU1j85bqD-47GoXtoieoMO9MjKFx3GiODkOS=5uw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] tests/qtest: sifive-e-aon-watchdog-test.c: Add
 QTest of watchdog of sifive_e
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com, liweiwei@iscas.ac.cn, philmd@linaro.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jun 9, 2023 at 2:46=E2=80=AFAM Tommy Wu <tommy.wu@sifive.com> wrote=
:
>
> Add some simple tests of the watchdog timer in the always-on domain devic=
e
> of HiFive 1 rev b.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Acked-by: Thomas Huth <thuth@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/qtest/meson.build                  |   3 +
>  tests/qtest/sifive-e-aon-watchdog-test.c | 450 +++++++++++++++++++++++
>  2 files changed, 453 insertions(+)
>  create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 5fa6833ad7..eb8d153a65 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -234,6 +234,9 @@ qtests_s390x =3D \
>     'cpu-plug-test',
>     'migration-test']
>
> +qtests_riscv32 =3D \
> +  (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-wa=
tchdog-test'] : [])
> +
>  qos_test_ss =3D ss.source_set()
>  qos_test_ss.add(
>    'ac97-test.c',
> diff --git a/tests/qtest/sifive-e-aon-watchdog-test.c b/tests/qtest/sifiv=
e-e-aon-watchdog-test.c
> new file mode 100644
> index 0000000000..1f313d16ad
> --- /dev/null
> +++ b/tests/qtest/sifive-e-aon-watchdog-test.c
> @@ -0,0 +1,450 @@
> +/*
> + * QTest testcase for the watchdog timer of HiFive 1 rev b.
> + *
> + * Copyright (c) 2023 SiFive, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/timer.h"
> +#include "qemu/bitops.h"
> +#include "libqtest.h"
> +#include "hw/registerfields.h"
> +#include "hw/misc/sifive_e_aon.h"
> +
> +FIELD(AON_WDT_WDOGCFG, SCALE, 0, 4)
> +FIELD(AON_WDT_WDOGCFG, RSVD0, 4, 4)
> +FIELD(AON_WDT_WDOGCFG, RSTEN, 8, 1)
> +FIELD(AON_WDT_WDOGCFG, ZEROCMP, 9, 1)
> +FIELD(AON_WDT_WDOGCFG, RSVD1, 10, 2)
> +FIELD(AON_WDT_WDOGCFG, EN_ALWAYS, 12, 1)
> +FIELD(AON_WDT_WDOGCFG, EN_CORE_AWAKE, 13, 1)
> +FIELD(AON_WDT_WDOGCFG, RSVD2, 14, 14)
> +FIELD(AON_WDT_WDOGCFG, IP0, 28, 1)
> +FIELD(AON_WDT_WDOGCFG, RSVD3, 29, 3)
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
> +static void test_init(QTestState *qts)
> +{
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCOUNT, 0);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, 0);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCMP0, 0xBEEF);
> +}
> +
> +static void test_wdogcount(void)
> +{
> +    uint64_t tmp;
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    tmp =3D qtest_readl(qts, WDOG_BASE + WDOGCOUNT);
> +    qtest_writel(qts, WDOG_BASE + WDOGCOUNT, 0xBEEF);
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCOUNT) =3D=3D tmp);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCOUNT, 0xBEEF);
> +    g_assert(0xBEEF =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCOUNT));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCOUNT, 0xAAAAAAAA);
> +    g_assert(0x2AAAAAAA =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCOUNT));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGFEED, 0xAAAAAAAA);
> +    g_assert(0x2AAAAAAA =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCOUNT));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGFEED, SIFIVE_E_AON_WDOGFEED);
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCOUNT));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_wdogcfg(void)
> +{
> +    uint32_t tmp_cfg;
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    tmp_cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCFG) =3D=3D tmp_cfg);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
> +    g_assert(0xFFFFFFFF =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCFG));
> +
> +    tmp_cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(15 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(1 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(1 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(1 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(1 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE=
));
> +    g_assert(1 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, 0);
> +    tmp_cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(0 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(0 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(0 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(0 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE=
));
> +    g_assert(0 =3D=3D FIELD_EX32(tmp_cfg, AON_WDT_WDOGCFG, IP0));
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCFG));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_wdogcmp0(void)
> +{
> +    uint32_t tmp;
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    tmp =3D qtest_readl(qts, WDOG_BASE + WDOGCMP0);
> +    qtest_writel(qts, WDOG_BASE + WDOGCMP0, 0xBEEF);
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCMP0) =3D=3D tmp);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCMP0, 0xBEEF);
> +    g_assert(0xBEEF =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCMP0));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_wdogkey(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGKEY));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, 0xFFFF);
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGKEY));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    g_assert(1 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGKEY));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGFEED, 0xAAAAAAAA);
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGKEY));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_wdogfeed(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGFEED));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGFEED, 0xFFFF);
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGFEED));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_scaled_wdogs(void)
> +{
> +    uint32_t cfg;
> +    uint32_t fake_count =3D 0x12345678;
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCOUNT, fake_count);
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCOUNT) =3D=3D fake_count);
> +    g_assert((uint16_t)qtest_readl(qts, WDOG_BASE + WDOGS) =3D=3D
> +             (uint16_t)fake_count);
> +
> +    for (int i =3D 0; i < 16; i++) {
> +        cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +        cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, SCALE, i);
> +        qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +        qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +        g_assert((uint16_t)qtest_readl(qts, WDOG_BASE + WDOGS) =3D=3D
> +                 (uint16_t)(fake_count >>
> +                            FIELD_EX32(cfg, AON_WDT_WDOGCFG, SCALE)));
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_watchdog(void)
> +{
> +    uint32_t cfg;
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ)=
;
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, SCALE, 0);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS, 1);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND);
> +
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCOUNT) =3D=3D
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ);
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGS) =3D=3D
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ);
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCOUNT, 0);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, IP0, 0);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_scaled_watchdog(void)
> +{
> +    uint32_t cfg;
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCMP0, 10);
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, SCALE, 15);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS, 1);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND * 10);
> +
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCOUNT) =3D=3D
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ * 10);
> +
> +    g_assert(10 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGS));
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(15 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCOUNT, 0);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, IP0, 0);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_periodic_int(void)
> +{
> +    uint32_t cfg;
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCMP0, SIFIVE_E_LFCLK_DEFAULT_FREQ)=
;
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, SCALE, 0);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, ZEROCMP, 1);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS, 1);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND);
> +
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCOUNT));
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGS));
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, IP0, 0);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND);
> +
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGCOUNT));
> +    g_assert(0 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGS));
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, IP0, 0);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_enable_disable(void)
> +{
> +    uint32_t cfg;
> +    QTestState *qts =3D qtest_init("-machine sifive_e");
> +
> +    test_init(qts);
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCMP0, 10);
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, SCALE, 15);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS, 1);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND * 2);
> +
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCOUNT) =3D=3D
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ * 2);
> +    g_assert(2 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGS));
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(15 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS, 0);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND * 8);
> +
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCOUNT) =3D=3D
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ * 2);
> +    g_assert(2 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGS));
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(15 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS, 1);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND * 8);
> +
> +    g_assert(qtest_readl(qts, WDOG_BASE + WDOGCOUNT) =3D=3D
> +             SIFIVE_E_LFCLK_DEFAULT_FREQ * 10);
> +    g_assert(10 =3D=3D qtest_readl(qts, WDOG_BASE + WDOGS));
> +
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(15 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, SCALE));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, RSTEN));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, ZEROCMP));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_ALWAYS));
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE));
> +    g_assert(1 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCOUNT, 0);
> +    cfg =3D FIELD_DP32(cfg, AON_WDT_WDOGCFG, IP0, 0);
> +    qtest_writel(qts, WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    qtest_writel(qts, WDOG_BASE + WDOGCFG, cfg);
> +    cfg =3D qtest_readl(qts, WDOG_BASE + WDOGCFG);
> +    g_assert(0 =3D=3D FIELD_EX32(cfg, AON_WDT_WDOGCFG, IP0));
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    g_test_init(&argc, &argv, NULL);
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
> +    return g_test_run();
> +}
> --
> 2.27.0
>
>

