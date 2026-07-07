Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DB4C43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 01:34:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgugx-0007c3-QQ; Mon, 06 Jul 2026 21:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgugw-0007bJ-Ac
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 21:33:42 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgugt-0005DI-26
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 21:33:42 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-698aa7ba320so337108a12.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Jul 2026 18:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783388016; cv=none;
 d=google.com; s=arc-20260327;
 b=jm62QXvyf+QdCvryzL4ll/hrHqygW708+g24Kii1lLVxcGopnZdQbk8lVo7x5ekhlH
 d+MusN+FnT6GtqqvibmVvXjLyGHURURMs/qnoAaZizvkgQO7AtXeu3LK/GXTrFrWdwWb
 fWW5sNxR8l9IsPi2jenjgQtsGuxXWOruQvKsx57mAwcIeXhbaV8gIoYu6cE53Mz5u4Bz
 75v1RPC1ZCL2icLz41qcyMDoreUmLBQo05xdVnm5+XsGDmjiSdT3CGkZEwhQl1tTl+Ya
 I3ZOOVSQu9AQofMFtw5UFibM/AKArjkRZxfzyfeEqtoC/C+MeL+r8N/gwgpMw8j3+qUX
 q2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=r7m03jgquoE+FYAtpgC/OHjgtuI+9mUnN8AC3QyOv80=;
 fh=tk2HDMW4feu9B9G+JVp4Kg3lA+KRwrCEbKNJP0tMOkQ=;
 b=qBGQloXiXOOHyaCnZFFxcImn8oxo4oX9r1ZG5bzDFbLIU/jWE2Ul9GaI1ki5DtQcK7
 JyfCoXHhdlKGvmGePRYL3rToDL5xpQPpvWTpWrdKlvKYixZeMt6+rJBe93mKBax3bp06
 YQ6gEjOhTiX1vUOKY1GzEcFuqEGQvLF9jsGOcfqmyvG+BmZyWqkLkcMA7kG9/1Yqnu4o
 oIZF3NPklZg13nr4K09QPtrljFOuhC3y6C1Q28ABZXezYT7yatN2jhFjWGAtPsTcHw+k
 HwqH5XPX2RpmnNgHjVPflnZpG6VE6dzlCF9vCBICGxgA+dl/870FUCc1zfNobzexcIQ0
 6vOQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783388016; x=1783992816; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7m03jgquoE+FYAtpgC/OHjgtuI+9mUnN8AC3QyOv80=;
 b=ntx975HO9RklZDSSjPdgKi4frPil90S1aqyvMFbI+r2k2f8UvBMMxNArmz094Hnh3D
 Py7bNJ+l/TdoWCdjOrBA2Q2Jtb4LRB1eiLRU3RnNJDZHNOB4XrK/gyFtpTOrgGvncJzs
 wYmix2pGYDCwCvcSD3mmQIsTRGX3DF8s/cgElk95SK1ltZBfXqOYBkWCfCrGw10y5Vm3
 WHRqL3yo7IFKgIQ1yiYfDjp/XA2o7rUOEoMulcXv0DgZcV1dn2mgFZboP/CHZ39lTBbA
 nDaFuQzwfw8MrCFvU2z8uHvYTose1zBR13g9a1H/+NerZvpXdV+b+aYQ5ct/BvPBPNjF
 gJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783388016; x=1783992816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r7m03jgquoE+FYAtpgC/OHjgtuI+9mUnN8AC3QyOv80=;
 b=oIb9BdPcj8E80EdBnxtOa6ys9n5tbG8o5Kebyw2yecxJ0vYUG4ADt0VegoMwNYdQf7
 Bqj9QtUwks/ZnxDdb3UxU5QZICmuhjQ/NKbT3DjA5iRJZ5GzvJ6UtmMGAKXzZKgMl/ou
 VL0IbO/1KIo5pW7acR+O8G98ipnji7pYN2kn0GWaMUGo+r2NWu+HI2w2idNTi0C/Ap73
 9QvEm6ZPXZyTInrqDNrauaQRLpfWC6OJgKfm3JiR09dO0zzH8HAF21bfOmPBKTexUCIz
 0vuGPEtEzMmP9ifh5d0DM+HBCO8x+URaaJ4qUrx+D0gMSmREM7Xgsjb12kfJsVsopXav
 0rLA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqZMSQ0nFpWmwHTkOD/4XoVYECMA0BPOjuIXBD2zBMm0gS0LPwIhrh6ZKptNB4dFSROSfJiFvL/fgIe@nongnu.org
X-Gm-Message-State: AOJu0YxFldCGNQUUg0xl2RoWOD3APMojJ7KH2Xksdd3CfuSkWx72Cd2K
 qOin0gDyfn2h8Ng4DLDcsGGDY/Alfuw3A1XtUXl/5ftARwrHqKHgmoD35L8fCfoHxzgkHMSZaBw
 Rx7dombhW1P1ynnZu2ESgQmaZ56VJXUk=
X-Gm-Gg: AfdE7cmWUBM12PublzsIC/PC59Qik0geS2+dHwhywBE4+XE3jr6245XzEkSmoqduvMD
 KpLnHnOTN/2TMSplxSapeozjuIxVnqyI6PnhWmrJWOLu5ueCzPa6hPfaulyKTZV1UmnVoP4qNqL
 xOSwEPQr3EGBqlqdzYk7s2bfSCoBtJty2me+xGpqtykmWH6Acvx6T2Ekca/nDZb5Hq8Rg0Jyajw
 wELmE58NgL54Jzkg2dReJBadhpASEaOmJYViQ3AeP60XlnMnI7vkdNeEoAQ/H3dHBPuIoJA0wDT
 7AaHqH2d8DpK0HEZDKscg30QF1c=
X-Received: by 2002:a05:6402:2109:b0:698:4501:3a8e with SMTP id
 4fb4d7f45d1cf-69a910bd1ddmr314470a12.9.1783388015962; Mon, 06 Jul 2026
 18:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260616190147.1286316-1-visitorckw@gmail.com>
 <20260616190147.1286316-6-visitorckw@gmail.com>
 <CAKmqyKMXyrtFeruxxsy2NNTeCeqQfkM4khYuWN+Qu9Zhb0ebMg@mail.gmail.com>
 <CACPK8Xes3v8zoq4d35vLCHe8hs71nP87nAmkgvyr6WOMj9s4Ew@mail.gmail.com>
 <akvruoEI-PbAJ9es@google.com>
In-Reply-To: <akvruoEI-PbAJ9es@google.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jul 2026 11:33:08 +1000
X-Gm-Features: AVVi8CdUEZlFG67WcexbHXU-8m2HfYnH6Ao4hJoWuIV6UTX8mcAiWmZmqo3hes0
Message-ID: <CAKmqyKNDDuYnXxPo-gxJ=VWxwF1a5xJpgEZzdb3bCSxUE=ec-w@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] tests/qtest: Add qtest for Milk-V Duo board
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, 
 alistair.francis@wdc.com, farosas@suse.de, lvivier@redhat.com, 
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jul 7, 2026 at 3:54=E2=80=AFAM Kuan-Wei Chiu <visitorckw@gmail.com>=
 wrote:
>
> i Joel and Alistair,
>
> On Wed, Jul 01, 2026 at 01:05:55PM +0930, Joel Stanley wrote:
> > On Mon, 29 Jun 2026 at 11:21, Alistair Francis <alistair23@gmail.com> w=
rote:
> > >
> > > On Wed, Jun 17, 2026 at 5:04=E2=80=AFAM Kuan-Wei Chiu <visitorckw@gma=
il.com> wrote:
> > > >
> > > > Add minimal qtest coverage for the Milk-V Duo machine to validate b=
asic
> > > > MMIO mapping and register access.
> > > >
> > > > Currently tested:
> > > > - Verify DW8250 UART component version and type signatures.
> > > > - Test read/write access to CV1800B clock bypass register.
> > > >
> > > > Tested with:
> > > > $ meson test -C build -v qemu:qtest-riscv64/milkv-duo-test
> > > > [...]
> > > > Ok:                 1
> > > > Fail:               0
> > > >
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >  MAINTAINERS                  |  1 +
> > > >  tests/qtest/meson.build      |  3 +-
> > > >  tests/qtest/milkv-duo-test.c | 70 ++++++++++++++++++++++++++++++++=
++++
> > > >  3 files changed, 73 insertions(+), 1 deletion(-)
> > > >  create mode 100644 tests/qtest/milkv-duo-test.c
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index e197dcb5b2..472513537f 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -1807,6 +1807,7 @@ F: hw/riscv/milkv_duo.c
> > > >  F: include/hw/char/dw8250.h
> > > >  F: include/hw/misc/cv1800b_clk.h
> > > >  F: include/hw/riscv/cv1800b.h
> > > > +F: tests/qtest/milkv-duo-test.c
> > > >
> > > >  RX Machines
> > > >  -----------
> > > > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > > > index 4897325d84..38acbdc0c8 100644
> > > > --- a/tests/qtest/meson.build
> > > > +++ b/tests/qtest/meson.build
> > > > @@ -293,7 +293,8 @@ qtests_riscv64 =3D ['riscv-csr-test'] + \
> > > >    (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
> > > >     config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
> > > >     ['iommu-riscv-test'] : []) + \
> > > > -  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] :=
 [])
> > > > +  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] :=
 []) + \
> > > > +   ['milkv-duo-test']
> > > >
> > > >  qos_test_ss =3D ss.source_set()
> > > >  qos_test_ss.add(
> > > > diff --git a/tests/qtest/milkv-duo-test.c b/tests/qtest/milkv-duo-t=
est.c
> > > > new file mode 100644
> > > > index 0000000000..06064b8733
> > > > --- /dev/null
> > > > +++ b/tests/qtest/milkv-duo-test.c
> > > > @@ -0,0 +1,70 @@
> > > > +/*
> > > > + * QTest for Milk-V Duo Board
> > > > + *
> > > > + * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > + *
> > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > + */
> > > > +
> > > > +#include "qemu/osdep.h"
> > > > +#include "libqtest.h"
> > > > +
> > > > +#define CV1800B_CLK_BASE            0x03002000
> > > > +#define CV1800B_CLK_BYPASS          0x030
> > > > +#define CV1800B_CLK_BYPASS_RESET    0xFFFFFFFF
> > > > +#define TEST_PATTERN_5A             0x5A5A5A5A
> > > > +#define TEST_PATTERN_A5             0xA5A5A5A5
> > > > +
> > > > +#define CV1800B_UART0_BASE          0x04140000
> > > > +#define DW_UART_UCV                 0xF8
> > > > +#define DW_UART_CTR                 0xFC
> > > > +#define DW_UART_VERSION_3_23A       0x3332332A
> > > > +#define DW_UART_TYPE_SIGNATURE      0x44570110
> > > > +
> > > > +static void test_milkv_duo_uart(void)
> > > > +{
> > > > +    QTestState *qts;
> > > > +    uint32_t component_version;
> > > > +    uint32_t component_type;
> > > > +
> > > > +    qts =3D qtest_init("-M milkv-duo");
> > > > +
> > > > +    component_version =3D qtest_readl(qts, CV1800B_UART0_BASE + DW=
_UART_UCV);
> > > > +    g_assert_cmphex(component_version, =3D=3D, DW_UART_VERSION_3_2=
3A);
> > > > +
> > > > +    component_type =3D qtest_readl(qts, CV1800B_UART0_BASE + DW_UA=
RT_CTR);
> > > > +    g_assert_cmphex(component_type, =3D=3D, DW_UART_TYPE_SIGNATURE=
);
> > > > +
> > > > +    qtest_quit(qts);
> > > > +}
> > > > +
> > > > +static void test_milkv_duo_clk(void)
> > > > +{
> > > > +    QTestState *qts;
> > > > +    uint32_t clk_bypass_val;
> > > > +
> > > > +    qts =3D qtest_init("-M milkv-duo");
> > > > +
> > > > +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B=
_CLK_BYPASS);
> > > > +    g_assert_cmphex(clk_bypass_val, =3D=3D, CV1800B_CLK_BYPASS_RES=
ET);
> > > > +
> > > > +    qtest_writel(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS, TEST_=
PATTERN_5A);
> > > > +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B=
_CLK_BYPASS);
> > > > +    g_assert_cmphex(clk_bypass_val, =3D=3D, TEST_PATTERN_5A);
> > > > +
> > > > +    qtest_writel(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS, TEST_=
PATTERN_A5);
> > > > +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B=
_CLK_BYPASS);
> > > > +    g_assert_cmphex(clk_bypass_val, =3D=3D, TEST_PATTERN_A5);
> > > > +
> > > > +    qtest_quit(qts);
> > > > +}
> > > > +
> > > > +int main(int argc, char **argv)
> > > > +{
> > > > +    g_test_init(&argc, &argv, NULL);
> > > > +
> > > > +    qtest_add_func("/riscv/milkv-duo/uart", test_milkv_duo_uart);
> > > > +    qtest_add_func("/riscv/milkv-duo/clk", test_milkv_duo_clk);
> > >
> > > Thanks for the tests. These are just checking some static values
> > > though. Can you also add a boot test?
> >
> > +1
> >
> >  A functional test that exercises -bios -kernel -dtb, as well as the
> > sd device would be great.
>
> I'll try to add the boot test.
>
> I assume this means the test will need a way to fetch the kernel image
> and dtb from somewhere. Would it be acceptable to host these files on
> my personal github, or is there a more appropriate place I should
> upload them to?

I think personal GitHub is fine, from memory that is what others do.
If there is some official source that would be better though

Alistair

>
> Regards,
> Kuan-Wei

