Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3042EC43327
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 01:52:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we1AN-00048i-I4; Sun, 28 Jun 2026 21:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we1AL-00047v-KE
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 21:52:05 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we1AJ-0005uj-VX
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 21:52:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-698439b6e8aso2926871a12.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 18:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782697922; cv=none;
 d=google.com; s=arc-20260327;
 b=k+8fuvGgUYgbd06GNzOiCSJ6eZjePrEmmkJpp8o4Z65cmD1hQasinoqA+PshBqGHqe
 M0/uqV7T1RVjuM4hhOruSe9GFysLrZ0El7w3olcCs7JX1Ajng/GTUaq9GsJyljCIc8ce
 c8aINQZY/ZBaRG1NavV3sZER2AHjr4Gy9LV3s4MbZ8M/y/0yXrVybCzpZNhhko9cBpkV
 YEkX/uwR4Jb1fsbg5yICUSgxIwUgpr562TopJzLzZTK3d5pVnh3y3eY80UCAv1VwPqz5
 HvNoBMQQ2zWLXntZju5nSPeu+XhKUD/BKiNKAIM6Qht9m9Ao/YBo7nSXBx1dWRWcAiFE
 Kb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CMqBTCRUbnPotNNJ9L9MwTYdCpIX8sbnIZflPhglVns=;
 fh=NrKtEZXqYUQSvB8lva2UTdXVEKwL3modYTXUweY6DmU=;
 b=NS6byW5hnh+2Q1KzjglZ2fjisj+u1N98rECtphWYuksNU10u1cs4DhtOOVkWii6CeB
 Cj5o8Pik70hJn/Xow1Q3by5y2K4fnvgGtvuSEmpHBKXakjG5eLzXwwp4q1FzDLotZK9n
 ywAym+atn5wb0vjlZp4n5qFfUt8gzVIE5jFOU8Hws1b8aPQ/p8rRmj8/9dZM46pOULV2
 hTFMo1oLde+SixygdJAvqxBRe4W1/HTbDn5lMv/GwwYG2V2tqqDO3GjbnTlSNHInD9IR
 d99q0Qt4hWr0wFsJTZEIuTs9RDLC9RoL2B5F34+hipw4PLXzfUmkOARLADWzCD0Z8+eo
 cuEQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782697922; x=1783302722; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMqBTCRUbnPotNNJ9L9MwTYdCpIX8sbnIZflPhglVns=;
 b=aCsxoLzTPr7j8etPWh1kfRohrWGpzbbfhuPZ0F/nk8uuRnm8TOAr5QcxhPeLbIPftX
 vJqhDXR0KZJD9Ct+qvLCplB6ryj2+CKcQu/mGY1qhYu7hZYUyBY9vt6lhGE8u1ZNS5aE
 4GJT/wUfGrO7FbnZ4SlVF30h7SV0L5L7nWxXCLdks6qh2+ojSSvKzGNtg/WlpTrPPKnW
 Him3DICyDJxntSC4HxntjYNdOCuQX3Ry/Y1aL5DNip/ZzAZeNty4YKrDo6cMs/poY8WQ
 AuywZPbqzYKZTqkXWXpFMDJn36j8UQ8d0fi+jkcJmusBcZU/mx18SBjJKQ0esnj4CUR+
 GAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782697922; x=1783302722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CMqBTCRUbnPotNNJ9L9MwTYdCpIX8sbnIZflPhglVns=;
 b=dbDcBOxk6WtVbHGVToKeLILLirW2RqF72cF2f31wfQKGxyWAbjha1ZGVhR2MAu2rQY
 Dp/Pa6nv8CE7m9iJCF99PnCBmMy3tijI5b4XLOyCqU0kjkTAuGxk1iiomWrlAmMcBkGq
 7XOdJ0EKPxgCdid8TOoyewp9vdt1Kyg7nZWz2L7PpyhqFKqsb0Y5iuyJsUCUZQTaxnSS
 Kp8TEv3Z7SMfltQ0OtYbtaH63KlmR3ZNovL8RBpBNCY8ij0BAmCCn6VRbT0vWqIgyoXL
 z/Uf1JRkRGASZ414sXAumhCKmPA+r1OVDu7T9SDqL7KwiGiwueXXov3Wy9xMsqJE2ZnB
 oiHw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVPr/SSR2ny1YfvS2PMTg7N0t/mXxMQHgv2yuHt6VRNt0WuWrSer3N9LL4liIdccqgnlH9JhPH6y42@nongnu.org
X-Gm-Message-State: AOJu0YwIEvLamW+B1rAmYrpjpKyhBKnAGgPOUZ83mUGMKak4GbW0xGxC
 CBWXWDTdfCU7AJybakJa/BFp0sPQdbV16sFOR1Xbewd9cRNztYp0qAhibPG7l1cInYJBeKbVInf
 pEzKJv15FEnbcwEdB6+RAoeKm36oGHlM=
X-Gm-Gg: AfdE7cmKMQ9Iouc3Gbf4whud/6xnHlSL4aSRnyUdxR1gSvNexQ0kGn9JCvIf9/SzTtq
 hfAHvpyUltsQH/Y0eRtCNE7w4BZp1AnD90nObjJgL6w25ZjKIpOUPi0ZeNQeAm+1XAAmdln447f
 6t5gHsiOtRkw1QO0kqoQVedF8desDjr9OecgqATytF66uSdV3118sdq3o0anbRUOCyADcwtVWKK
 KBa/8Ed3T/MK7ZJItnJvgr2K9TWchn6A6rbcZVOWyAxgTB5lONd08rex1uZum1Oepn51803QOnB
 Q/fauK1+XXm4KtqR/MCINdyhIycIplbb2+YG8w==
X-Received: by 2002:a05:6402:42d5:b0:698:3b7c:7e37 with SMTP id
 4fb4d7f45d1cf-6983b7c7f56mr4453673a12.33.1782697922307; Sun, 28 Jun 2026
 18:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260616190147.1286316-1-visitorckw@gmail.com>
 <20260616190147.1286316-6-visitorckw@gmail.com>
In-Reply-To: <20260616190147.1286316-6-visitorckw@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 11:51:36 +1000
X-Gm-Features: AVVi8Ccfc-DaiAEW7_omqutxWG8tDvIYBF2EI5rzffMcZiT-WYX_3fQ0e87Otjk
Message-ID: <CAKmqyKMXyrtFeruxxsy2NNTeCeqQfkM4khYuWN+Qu9Zhb0ebMg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] tests/qtest: Add qtest for Milk-V Duo board
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair.francis@wdc.com,
 farosas@suse.de, lvivier@redhat.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
 marscheng@google.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
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

On Wed, Jun 17, 2026 at 5:04=E2=80=AFAM Kuan-Wei Chiu <visitorckw@gmail.com=
> wrote:
>
> Add minimal qtest coverage for the Milk-V Duo machine to validate basic
> MMIO mapping and register access.
>
> Currently tested:
> - Verify DW8250 UART component version and type signatures.
> - Test read/write access to CV1800B clock bypass register.
>
> Tested with:
> $ meson test -C build -v qemu:qtest-riscv64/milkv-duo-test
> [...]
> Ok:                 1
> Fail:               0
>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  MAINTAINERS                  |  1 +
>  tests/qtest/meson.build      |  3 +-
>  tests/qtest/milkv-duo-test.c | 70 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/milkv-duo-test.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e197dcb5b2..472513537f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1807,6 +1807,7 @@ F: hw/riscv/milkv_duo.c
>  F: include/hw/char/dw8250.h
>  F: include/hw/misc/cv1800b_clk.h
>  F: include/hw/riscv/cv1800b.h
> +F: tests/qtest/milkv-duo-test.c
>
>  RX Machines
>  -----------
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 4897325d84..38acbdc0c8 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -293,7 +293,8 @@ qtests_riscv64 =3D ['riscv-csr-test'] + \
>    (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
>     config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
>     ['iommu-riscv-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
> +  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : []) +=
 \
> +   ['milkv-duo-test']
>
>  qos_test_ss =3D ss.source_set()
>  qos_test_ss.add(
> diff --git a/tests/qtest/milkv-duo-test.c b/tests/qtest/milkv-duo-test.c
> new file mode 100644
> index 0000000000..06064b8733
> --- /dev/null
> +++ b/tests/qtest/milkv-duo-test.c
> @@ -0,0 +1,70 @@
> +/*
> + * QTest for Milk-V Duo Board
> + *
> + * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +
> +#define CV1800B_CLK_BASE            0x03002000
> +#define CV1800B_CLK_BYPASS          0x030
> +#define CV1800B_CLK_BYPASS_RESET    0xFFFFFFFF
> +#define TEST_PATTERN_5A             0x5A5A5A5A
> +#define TEST_PATTERN_A5             0xA5A5A5A5
> +
> +#define CV1800B_UART0_BASE          0x04140000
> +#define DW_UART_UCV                 0xF8
> +#define DW_UART_CTR                 0xFC
> +#define DW_UART_VERSION_3_23A       0x3332332A
> +#define DW_UART_TYPE_SIGNATURE      0x44570110
> +
> +static void test_milkv_duo_uart(void)
> +{
> +    QTestState *qts;
> +    uint32_t component_version;
> +    uint32_t component_type;
> +
> +    qts =3D qtest_init("-M milkv-duo");
> +
> +    component_version =3D qtest_readl(qts, CV1800B_UART0_BASE + DW_UART_=
UCV);
> +    g_assert_cmphex(component_version, =3D=3D, DW_UART_VERSION_3_23A);
> +
> +    component_type =3D qtest_readl(qts, CV1800B_UART0_BASE + DW_UART_CTR=
);
> +    g_assert_cmphex(component_type, =3D=3D, DW_UART_TYPE_SIGNATURE);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_milkv_duo_clk(void)
> +{
> +    QTestState *qts;
> +    uint32_t clk_bypass_val;
> +
> +    qts =3D qtest_init("-M milkv-duo");
> +
> +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK_B=
YPASS);
> +    g_assert_cmphex(clk_bypass_val, =3D=3D, CV1800B_CLK_BYPASS_RESET);
> +
> +    qtest_writel(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS, TEST_PATTER=
N_5A);
> +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK_B=
YPASS);
> +    g_assert_cmphex(clk_bypass_val, =3D=3D, TEST_PATTERN_5A);
> +
> +    qtest_writel(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS, TEST_PATTER=
N_A5);
> +    clk_bypass_val =3D qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK_B=
YPASS);
> +    g_assert_cmphex(clk_bypass_val, =3D=3D, TEST_PATTERN_A5);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/riscv/milkv-duo/uart", test_milkv_duo_uart);
> +    qtest_add_func("/riscv/milkv-duo/clk", test_milkv_duo_clk);

Thanks for the tests. These are just checking some static values
though. Can you also add a boot test?

Alistair

