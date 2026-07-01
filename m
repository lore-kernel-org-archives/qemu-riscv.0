Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E0C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:36:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welkB-0002mH-R3; Tue, 30 Jun 2026 23:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1welkA-0002ly-7i
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:36:10 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1welk8-0004HE-GW
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:36:10 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6611669cd16so229488d50.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782876966; cv=none;
 d=google.com; s=arc-20260327;
 b=HqjZKtCm9aWio5fL119PqTxnWBoEthXbs9LLyDjBmo0oH4xeNu5snNxMd+wVBTEcsE
 aCIDksU+wXfsRWYUB8kaMwglxrbo59krLBAQovGUIdvjS3UsWm4Z/+gi+/k8tMLT1TNm
 Lfsr6bSYfKlk2Xpb199H0LP3A4Pi9VUqSgpU+1xJVTK4KRUAhS4FI0vM5iDd40/VpsmC
 9tpo9G2x6Uz0YjmNDc+y1HW75hGUyeGj3dwGWvkK/KmajAZAWD42dk6cqfxa1zbyszAN
 FDkjRgBueqpy+Ionm+2ZO6npr8SUtUs2et2EojlUtNkUyo/k+VrYPDG4kq8qAbeeTdYM
 7JZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=D/KiDJdWBj+MDpejZaVIsAH41W2OIqKu75gjRNFIXvQ=;
 fh=kTGMzyhJ1RNDkn9C7Y4P4VGPIgMwFvSxgM48WBQk6fY=;
 b=tDwrWxHZpiG1FF5LRx7SO1BKVNMLHuIAWlxHo0+o+eEx2GrcjLUQcwvdfL9UFeQT90
 eXswsQOBwKPxxTFfU6eTN1mF0tqjIvRdIDVfIAsWq+cvLbWSywwW/NWLDkum/CanPTgf
 pD3If97eDHGLAm+zRu3UFD3LVy935szGCphdCIt9ANwZQqcvO56rc5EvYEdBVgcQyx5N
 VyEcoEFsghVMGQQ1sXCgeI4QTxXjUx8po94AJxNGz6DRSu5tF7I6it81NzTqGg1fMRiO
 O9cp1EIAN57A2KfdHsPiEZ+xOOIT6a4qEijQW/T8KGAuyACOu+eV/mBknulNF59sdpxK
 giPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1782876966; x=1783481766; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/KiDJdWBj+MDpejZaVIsAH41W2OIqKu75gjRNFIXvQ=;
 b=nRfLojmRjWHxuwon0bRpoWPvTWoLAAATFd9FgHpNLzilaazU6lpDBwy85bu+F781x3
 0idQueG9VtLXYsdqwNtAvtqH47jEGvvflupK42SDXnVyaMhVwKjg8EYOZ3s3rO815GvL
 dvrPnsoRuDf89j32iWJ260ujQVHJBPHlg+Jyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782876966; x=1783481766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D/KiDJdWBj+MDpejZaVIsAH41W2OIqKu75gjRNFIXvQ=;
 b=gwkmRaX1ABApRPse4yj6ov4jDC40MUEmUJRimOw8/XtVrSuLbX9oxL1hAKGYnRIASz
 Z3hZE8Lem7+hvqJvIw2fHA8tP6PkxPo6+xfTfoXWnb35eA90rfgGjf5vEQrAIf28w4Ip
 D8Ck/ZxHdV0mr61vK4NbNLsgotYbIMQdmjpHBE5YuQcGdQwBSRVr8jCuDTyI6b5eG+oL
 Dk5E4hRVAq+qM/nq+vBLVjbHeXlVN9A7iv7T+SjtLKDUs6JXg0iJ+NeaddXdY0hKqQI5
 OEDy4XHJMyhj4G21cHSDcn/PIlKMzgTCL1yVW6B4UDQv6ONhb4xlQrUjkqs4NGsu9kcv
 EDPA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr6tlH1LmOH4NKP6QmMsqlpQPTArFb1j0W17lhsYDylE6ksx8Shfv9rEHIgvIkviniYP03fv9iF9US1@nongnu.org
X-Gm-Message-State: AOJu0YzqDsabxyZpZrHni3tPd8pDt/FUBKsBUu9uZnV8gOO9vYnpzOJh
 u3tdpGxUOLpc5vLSAhBqjzrIRn5LzeZ39RDB3n7kIsnclGGPl6gma1hA4WCNRi80K5s00jOpQd+
 SPzH4BI5qRvB86GcOWR+jLoI3UtljzBaU/bNL/LM=
X-Gm-Gg: AfdE7cl5zvkenvUjpzvOVClNdjEK6hBhbGl8lwYmMknoXNkdonvLsdegikioxHvoPCg
 3la667MnRV3Ln9DFDCcAmLYMhSkLTCUaFgWtb4kecD9rNLtTiH3EBPypDkQG0GOeZqIKP6veE55
 26Xse+wHDy/1cJ+2hqcVkAs1KtveHvNwK5tig2GELHyeG3xCCi0sM7uYcnen/0l070qhDtnT2d/
 InOfolgtpzHPRT7lBqlK+7Ys1TF6H+aueUUIIuHkgzmATJekR6USJoiTRGAe2eLK7LPjJ84h/+R
 GacQc5pD+TXAaITNeDcq8ma4rdC8IdqH2DCwd30QLuGM0f8LTnX5Gp/a/ABTqJZ9qp4bZN8hx7K
 wCULUvx9v01+guA==
X-Received: by 2002:a05:690e:190a:b0:660:4936:95d5 with SMTP id
 956f58d0204a3-664f98c495dmr6019662d50.40.1782876966401; Tue, 30 Jun 2026
 20:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260616190147.1286316-1-visitorckw@gmail.com>
 <20260616190147.1286316-6-visitorckw@gmail.com>
 <CAKmqyKMXyrtFeruxxsy2NNTeCeqQfkM4khYuWN+Qu9Zhb0ebMg@mail.gmail.com>
In-Reply-To: <CAKmqyKMXyrtFeruxxsy2NNTeCeqQfkM4khYuWN+Qu9Zhb0ebMg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2026 13:05:55 +0930
X-Gm-Features: AVVi8Cd8i7tKg3VQI2A6DSSlO0CQAsoJEnSN2vmke63hk2M0mwHU0K5Tia7azDo
Message-ID: <CACPK8Xes3v8zoq4d35vLCHe8hs71nP87nAmkgvyr6WOMj9s4Ew@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] tests/qtest: Add qtest for Milk-V Duo board
To: Alistair Francis <alistair23@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, 
 alistair.francis@wdc.com, farosas@suse.de, lvivier@redhat.com, 
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 29 Jun 2026 at 11:21, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Wed, Jun 17, 2026 at 5:04=E2=80=AFAM Kuan-Wei Chiu <visitorckw@gmail.c=
om> wrote:
> >
> > Add minimal qtest coverage for the Milk-V Duo machine to validate basic
> > MMIO mapping and register access.
> >
> > Currently tested:
> > - Verify DW8250 UART component version and type signatures.
> > - Test read/write access to CV1800B clock bypass register.
> >
> > Tested with:
> > $ meson test -C build -v qemu:qtest-riscv64/milkv-duo-test
> > [...]
> > Ok:                 1
> > Fail:               0
> >
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  MAINTAINERS                  |  1 +
> >  tests/qtest/meson.build      |  3 +-
> >  tests/qtest/milkv-duo-test.c | 70 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 73 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/qtest/milkv-duo-test.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e197dcb5b2..472513537f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1807,6 +1807,7 @@ F: hw/riscv/milkv_duo.c
> >  F: include/hw/char/dw8250.h
> >  F: include/hw/misc/cv1800b_clk.h
> >  F: include/hw/riscv/cv1800b.h
> > +F: tests/qtest/milkv-duo-test.c
> >
> >  RX Machines
> >  -----------
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 4897325d84..38acbdc0c8 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -293,7 +293,8 @@ qtests_riscv64 =3D ['riscv-csr-test'] + \
> >    (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
> >     config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
> >     ['iommu-riscv-test'] : []) + \
> > -  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
> > +  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])=
 + \
> > +   ['milkv-duo-test']
> >
> >  qos_test_ss =3D ss.source_set()
> >  qos_test_ss.add(
> > diff --git a/tests/qtest/milkv-duo-test.c b/tests/qtest/milkv-duo-test.=
c
> > new file mode 100644
> > index 0000000000..06064b8733
> > --- /dev/null
> > +++ b/tests/qtest/milkv-duo-test.c
> > @@ -0,0 +1,70 @@
> > +/*
> > + * QTest for Milk-V Duo Board
> > + *
> > + * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest.h"
> > +
> > +#define CV1800B_CLK_BASE            0x03002000
> > +#define CV1800B_CLK_BYPASS          0x030
> > +#define CV1800B_CLK_BYPASS_RESET    0xFFFFFFFF
> > +#define TEST_PATTERN_5A             0x5A5A5A5A
> > +#define TEST_PATTERN_A5             0xA5A5A5A5
> > +
> > +#define CV1800B_UART0_BASE          0x04140000
> > +#define DW_UART_UCV                 0xF8
> > +#define DW_UART_CTR                 0xFC
> > +#define DW_UART_VERSION_3_23A       0x3332332A
> > +#define DW_UART_TYPE_SIGNATURE      0x44570110
> > +
> > +static void test_milkv_duo_uart(void)
> > +{
> > +    QTestState *qts;
> > +    uint32_t component_version;
> > +    uint32_t component_type;
> > +
> > +    qts =3D qtest_init("-M milkv-duo");
> > +
> > +    component_version =3D qtest_readl(qts, CV1800B_UART0_BASE + DW_UAR=
T_UCV);
> > +    g_assert_cmphex(component_version, =3D=3D, DW_UART_VERSION_3_23A);
> > +
> > +    component_type =3D qtest_readl(qts, CV1800B_UART0_BASE + DW_UART_C=
TR);
> > +    g_assert_cmphex(component_type, =3D=3D, DW_UART_TYPE_SIGNATURE);
> > +
> > +    qtest_quit(qts);
> > +}
> > +
> > +static void test_milkv_duo_clk(void)
> > +{
> > +    QTestState *qts;
> > +    uint32_t clk_bypass_val;
> > +
> > +    qts =3D qtest_init("-M milkv-duo");
> > +
> > +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK=
_BYPASS);
> > +    g_assert_cmphex(clk_bypass_val, =3D=3D, CV1800B_CLK_BYPASS_RESET);
> > +
> > +    qtest_writel(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS, TEST_PATT=
ERN_5A);
> > +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK=
_BYPASS);
> > +    g_assert_cmphex(clk_bypass_val, =3D=3D, TEST_PATTERN_5A);
> > +
> > +    qtest_writel(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS, TEST_PATT=
ERN_A5);
> > +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK=
_BYPASS);
> > +    g_assert_cmphex(clk_bypass_val, =3D=3D, TEST_PATTERN_A5);
> > +
> > +    qtest_quit(qts);
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    g_test_init(&argc, &argv, NULL);
> > +
> > +    qtest_add_func("/riscv/milkv-duo/uart", test_milkv_duo_uart);
> > +    qtest_add_func("/riscv/milkv-duo/clk", test_milkv_duo_clk);
>
> Thanks for the tests. These are just checking some static values
> though. Can you also add a boot test?

+1

 A functional test that exercises -bios -kernel -dtb, as well as the
sd device would be great.

