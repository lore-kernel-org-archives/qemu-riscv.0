Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8289FC5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 11:46:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsJ29-0001ex-TU; Fri, 07 Aug 2026 07:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsJ24-0001ZC-9R
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 07:46:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsJ20-00052Q-A3
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 07:46:35 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6777VQK33829439
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 11:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OLoNgLzJcljzt+cN0bymY56/hm4HiW3LutifQ1CAhjA=; b=ch8Jp5sCKDZk+OP0
 nz12MXR7wxDimQEQiBPFeglIQY+55eMxTl60iwJgK6KJ7hdfk7UqG+BvmKAKjHjD
 bMJ6QmeUCVhD5dTcDT2KGFI2h+Oy9HM/+/h8LWpWNVh/9OlKhJWTXFff1qeUdyOW
 5RcffnFBTJryON7gEwYT93pg2aGpKg1w23nK1bU17mFaFYS+NT7Q7xH70IHp2gdE
 Fv9jbl5iW1FmhQUmqDRITDCmf8SdgINZE+R4VDjyI7BazCWcwVDSCa4nGryVi2xa
 /G5iShkmO6FxR7iyVs3JyYq5wxy0t2RWIpc+ncbMx/h5802ts3vB0c1L1WSKVh4R
 ELpivw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gut9a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 11:46:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8f39a46efd9so14920036d6.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786103190; x=1786707990; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OLoNgLzJcljzt+cN0bymY56/hm4HiW3LutifQ1CAhjA=;
 b=dxbl7rHw+6l9z64lYhuwbm+sudATaLj7MD06i8QzbBqPncHkmTUfIJi8Fc0lfL5Q18
 9mE0Xul18yGXFfFJc13GG864ehBdv209jSMtM9j99UuRuTZ5fW+BleCxcwO+fUI/irnk
 +/BYOrI2eNuRaIxZ3X9QYjsQEzfcCuTjTKhN2DWiCmOtc3o4BFDa4Nj/kdRj/MggyB1t
 D2psqTD8S6NcyfqSzSNy07xNeHtcm7FlsGQmeaCBmT35W0iMwuIVpfFxGBtsoLDc4aTb
 URBE1y5KbIYjn9MJUPtKScy9D05LI/2ER17j7iSJNex6oENJXdMDYu15q9KwV/un/K+G
 kADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103190; x=1786707990;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OLoNgLzJcljzt+cN0bymY56/hm4HiW3LutifQ1CAhjA=;
 b=TDAPjIFhsVGelR3gET+DoAOjNme+kZpbfJehl5XdMSCflsq+O6/38XErk9hirStBtU
 7JIn4+0KD1OBTRRKBWR4meFTdvLJf79E0BxNwQEKx3IA8zXJGP+uLqS1ohQErtYtF9B+
 r/Lf2CrXRe3/SEV3pdSAKYBM1BNmMPwhuJc9hYcqbP7qMkFnjD7+fwiNvgZtE+mRCHfK
 q5vVRM+ZKtz7T8GwnWkQkCHYmrzGkLXNPGI0n8Po6zGBMyvPeRiqeJ1Cwl7Kn4LHz1fY
 R/N/kD0msQ2EPhIGvRRknm2Pm2gNs/m6oD8AWImrev/Hkp2Ifa4Q+KnIUr7z8Ziv7sSy
 FAkA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpcUUWXkBe4Nb5x1oTNsvlkxSiZhH0dJYJqtFUAHPX886ZE2O6ajJvyizm7msq1R1ldUMO6GXv+3osj@nongnu.org
X-Gm-Message-State: AOJu0YyBT/BLWjT+ZW2QgPKiqIS1sUMAHLOi67gqmKngf8e4oE17xvBA
 mtzEmOoPkyaiIKBwsZa8Fu3aU+97ozEkIE2y49Y0iADyDLkyfUCiSEQc+8ZpuN+yM0KzK5hOCkw
 6K4yYkYgET4CrMU/pDucvbymxl+fgNGNJbokAwZbB0FowLREdKij4/LmlWg==
X-Gm-Gg: AR+sD12shlY+g/BHdvLXxpjVvsuTDVha9Y1eEOAZ+1e+sIp6jJBjaTsOT+jsBaWRmqF
 7gvsBUkWnDy8QzCg7qhKIJYtI+M8epYLkTJ9IlVbydhQ4iqAv8tJ7w5bpSkwze/kspkCKys+hiF
 +IKXlmAnFgGfUPc3TkJHh4TR/Co6fHZGiEmdYG6aCZxCNxBs4z4VqRXWbzYGjWneWz4d+zMBrSE
 SoQ7Srv9mhhVe8aj+mIq2SfiwlpvMoUEcpdeFHgQhOoNnK2wvolPlIMsB2/SECIjHqJALX0kXp3
 LLLCtqkepbzO+3lEHPpyH5MaGQJG1DoLL2JTgPhIPlU79JdimDSdwGPKPBW7SGsFfNQdNL6FlrT
 t+xyiAKT9BJqBOJIXOvm/h5E8ZI28Ti5Czp3g
X-Received: by 2002:a05:6214:570b:b0:8f1:617b:2692 with SMTP id
 6a1803df08f44-908931ca159mr143666036d6.10.1786103189507; 
 Fri, 07 Aug 2026 04:46:29 -0700 (PDT)
X-Received: by 2002:a05:6214:570b:b0:8f1:617b:2692 with SMTP id
 6a1803df08f44-908931ca159mr143665336d6.10.1786103188970; 
 Fri, 07 Aug 2026 04:46:28 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-908a92ff366sm6900066d6.32.2026.08.07.04.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:46:28 -0700 (PDT)
Message-ID: <3fc84f76-0aca-4ed6-ba32-9fcb597424f6@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 08:46:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests/qtest: add K230 GPIO controller test
To: guochun.wang@foxmail.com, qemu-devel@nongnu.org
Cc: chao.liu@processmission.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, pbonzini@redhat.com,
 farosas@suse.de, lvivier@redhat.com, qemu-riscv@nongnu.org
References: <20260805151455.99076-1-guochun.wang@foxmail.com>
 <tencent_76E410D79348037AB2CC88758B8A5B932907@qq.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tencent_76E410D79348037AB2CC88758B8A5B932907@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a75c596 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=dCQgOfw7uq-57JqLBc0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-GUID: Nnl9skN-OOSH5uzygeo5xHc5DZtAlKr8
X-Proofpoint-ORIG-GUID: Nnl9skN-OOSH5uzygeo5xHc5DZtAlKr8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MCBTYWx0ZWRfXyTHZ9cGc+crW
 6MxSTj6AbcqzAITPT2OjeeCW9f/IzT19t6nLcJeD/4FqL9EzxmhXkFNioo8uZv6/DZ5wqMjFGbU
 V89T4wTxqItKi7HD7bnOS9PtA8fVXwc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MCBTYWx0ZWRfX0CD8tldgSJtE
 sbJT11CTCVIpSRd7PwOSwnW/sYWNB5OCqlnHaRRcm8nOwWlyFqrentf6X43BCbnFNz3EtYg0ymi
 tgJRjU3fo0KBVkKszp4th+wbi8JRcjaA/KH4cUolPsH5NIe9Z2myx1xGOr7hrKjbCSc28GHJ0Pr
 gzhzSXhyAPYmdj2h2dbI6rW4At8RGA3oATZc38dqPsLodgFXKyQZUEGNFkhYY4xTnEtqWkd71Mf
 fSNxF+9lT2Qfqi2rxlgM1g0aSlyKRHiop6gz/gWaf3zUr3Q2GvNKzcyEGqZhuLJFzBl8fCM1v4z
 nEGt4KF5X0+YqGP65Us+i/JPFAYEDsBl5f2HS2K3guHqNuUnKCkcJG9lM6q5LUjVqgia+q8X9jo
 hRa25qPVgomqm62R2Xg4TGIbFKhtPuPEe4Cuz1E0IgARb1wOLHwwH3UybQHdclr+3bSgPa7RXvS
 AYMrlYt7eeHlnzV3kIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070090
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



On 8/5/2026 12:14 PM, guochun.wang@foxmail.com wrote:
> From: guochun wang <guochun.wang@foxmail.com>
> 
> Add qtest cases verifying the K230 GPIO model against TRM v0.3.1
> behaviour and Linux gpio-k230 driver requirements.
> 
> Tests cover:
>    - Reset values: all registers cleared after machine init
>    - Edge detection: rising / falling / both-edge, with EOI clearing
>    - Level-sensitive: active-high / active-low, cleared by source removal
>    - EOI: clears edge interrupts only, raw status verified
>    - INTEN gating and INTMASK masking (raw status still recorded)
>    - No new interrupts while DDR=output or CTL=hardware mode
>    - PLIC integration: per-pin IRQ, claim/complete flow
>    - Multiple simultaneous interrupts on independent lines
>    - GPIO1 controller (second instance at 0x9140C000)
>    - DDR/CTL mode switching: pending interrupts preserved; on switch
>      back to input/software mode, level interrupts re-evaluated against
>      current ext level, edge interrupts left untouched (TRM v0.3.1)
> 
> Update MAINTAINERS with the new test file.
> 
> Signed-off-by: guochun wang <guochun.wang@foxmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   MAINTAINERS                  |   1 +
>   tests/qtest/k230-gpio-test.c | 521 +++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build      |   2 +-
>   3 files changed, 523 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/k230-gpio-test.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4301d29f7e..bb4f585426 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1834,6 +1834,7 @@ F: include/hw/gpio/k230_gpio.h
>   F: include/hw/riscv/k230.h
>   F: include/hw/watchdog/k230_wdt.h
>   F: tests/functional/riscv64/test_k230.py
> +F: tests/qtest/k230-gpio-test.c
>   F: tests/qtest/k230-wdt-test.c
>   
>   RX Machines
> diff --git a/tests/qtest/k230-gpio-test.c b/tests/qtest/k230-gpio-test.c
> new file mode 100644
> index 0000000000..9c930cbd1c
> --- /dev/null
> +++ b/tests/qtest/k230-gpio-test.c
> @@ -0,0 +1,521 @@
> +/*
> + * QTest testcase for K230 GPIO
> + *
> + * Copyright (c) 2025 Wang Guochun <wdasn99@gmail.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * K230 Technical Reference Manual V0.3.1 (2024-11-18)
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "libqtest.h"
> +#include "hw/gpio/k230_gpio.h"
> +
> +#define K230_GPIO0_BASE  0x9140B000
> +#define K230_GPIO1_BASE  0x9140C000
> +
> +#define GPIO_BASE K230_GPIO0_BASE
> +
> +#define PLIC_BASE           0xF00000000ULL
> +#define PLIC_PRIORITY       (PLIC_BASE + 0x000000)
> +#define PLIC_PENDING        (PLIC_BASE + 0x001000)
> +#define PLIC_ENABLE         (PLIC_BASE + 0x002000)
> +#define PLIC_CONTEXT        (PLIC_BASE + 0x200000)
> +#define PLIC_THRESHOLD      (PLIC_CONTEXT + 0x0)
> +#define PLIC_CLAIM          (PLIC_CONTEXT + 0x4)
> +
> +#define GPIO0_IRQ_BASE  32
> +#define GPIO1_IRQ_BASE  64
> +
> +static inline bool plic_irq_pending(QTestState *qts, int irq)
> +{
> +    uint32_t word = qtest_readl(qts, PLIC_PENDING + (irq / 32) * 4);
> +    return extract32(word, irq % 32, 1);
> +}
> +
> +static void gpio0_set_input(QTestState *qts, int line, int level)
> +{
> +    qtest_set_irq_in(qts, "/machine/soc/k230-gpio0",
> +                     "unnamed-gpio-in", line, level);
> +}
> +
> +static void gpio1_set_input(QTestState *qts, int line, int level)
> +{
> +    qtest_set_irq_in(qts, "/machine/soc/k230-gpio1",
> +                     "unnamed-gpio-in", line, level);
> +}
> +
> +static void plic_enable_irq(QTestState *qts, int irq)
> +{
> +    qtest_writel(qts, PLIC_PRIORITY + irq * 4, 1);
> +    qtest_writel(qts, PLIC_THRESHOLD, 0);
> +    qtest_writel(qts, PLIC_ENABLE + (irq / 32) * 4, BIT(irq % 32));
> +}
> +
> +static void plic_claim_complete(QTestState *qts, int irq)
> +{
> +    uint32_t claimed = qtest_readl(qts, PLIC_CLAIM);
> +    g_assert_cmpuint(claimed, ==, irq);
> +    qtest_writel(qts, PLIC_CLAIM, irq);
> +}
> +
> +static uint32_t gpio0_read(QTestState *qts, hwaddr offset)
> +{
> +    return qtest_readl(qts, GPIO_BASE + offset);
> +}
> +
> +static void gpio0_write(QTestState *qts, hwaddr offset, uint32_t value)
> +{
> +    qtest_writel(qts, GPIO_BASE + offset, value);
> +}
> +
> +static uint32_t gpio0_raw_intstatus(QTestState *qts)
> +{
> +    return gpio0_read(qts, K230_GPIO_RAW_INTSTATUS);
> +}
> +
> +static void test_reset_values(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_SWPORTA_DR), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_SWPORTA_DDR), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_SWPORTA_CTL), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_INTEN), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_INTMASK), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_INTTYPE_LEVEL), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_INT_POLARITY), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_INTSTATUS), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_RAW_INTSTATUS), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_CONFIG_REG2), ==, 0x0);
> +    g_assert_cmphex(gpio0_read(qts, K230_GPIO_CONFIG_REG1), ==, 0x0);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_edge_rising(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 5;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(5));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(5));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(5));
> +
> +    gpio0_set_input(qts, 5, 0);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    gpio0_set_input(qts, 5, 1);
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_edge_falling(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 3;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(3));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, 0);
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(3));
> +
> +    gpio0_set_input(qts, 3, 1);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    gpio0_set_input(qts, 3, 0);
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_both_edge(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 7;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(7));
> +    gpio0_write(qts, K230_GPIO_INT_BOTHEDGE, BIT(7));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(7));
> +
> +    gpio0_set_input(qts, 7, 0);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    gpio0_set_input(qts, 7, 1);
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    gpio0_write(qts, K230_GPIO_PORTA_EOI, BIT(7));
> +    g_assert_cmphex(gpio0_raw_intstatus(qts) & BIT(7), ==, 0);
> +    plic_claim_complete(qts, gpio_irq);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    gpio0_set_input(qts, 7, 0);
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_level_high(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 2;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, 0);
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(2));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(2));
> +
> +    gpio0_set_input(qts, 2, 0);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    gpio0_set_input(qts, 2, 1);
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    gpio0_set_input(qts, 2, 0);
> +    g_assert_cmphex(gpio0_raw_intstatus(qts) & BIT(2), ==, 0);
> +    plic_claim_complete(qts, gpio_irq);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_level_low(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 4;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, 0);
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, 0);
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(4));
> +
> +    gpio0_set_input(qts, 4, 1);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    gpio0_set_input(qts, 4, 0);
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    /*
> +     * Level goes away: GPIO deasserts, but the PLIC pending bit is
> +     * sticky. Verify the GPIO-side status is cleared, then
> +     * claim/complete to clear the PLIC pending bit.
> +     */
> +    gpio0_set_input(qts, 4, 1);
> +    g_assert_cmphex(gpio0_raw_intstatus(qts) & BIT(4), ==, 0);
> +    plic_claim_complete(qts, gpio_irq);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_eoi_clear(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 10;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(10));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(10));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(10));
> +
> +    gpio0_set_input(qts, 10, 0);
> +    gpio0_set_input(qts, 10, 1);
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    /*
> +     * EOI clears the GPIO-side raw status, then claim/complete
> +     * clears the sticky PLIC pending bit.
> +     */
> +    gpio0_write(qts, K230_GPIO_PORTA_EOI, BIT(10));
> +    g_assert_cmphex(gpio0_raw_intstatus(qts) & BIT(10), ==, 0);
> +    plic_claim_complete(qts, gpio_irq);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_inten_disabled(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 15;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(15));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(15));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, 0);
> +
> +    gpio0_set_input(qts, 15, 0);
> +    gpio0_set_input(qts, 15, 1);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_intmask(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 20;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(20));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(20));
> +    gpio0_write(qts, K230_GPIO_INTMASK, BIT(20));
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(20));
> +
> +    gpio0_set_input(qts, 20, 0);
> +    gpio0_set_input(qts, 20, 1);
> +
> +    g_assert_cmphex(gpio0_raw_intstatus(qts) & BIT(20), ==, BIT(20));
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_ddr_output_no_int(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 25;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, BIT(25));
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(25));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(25));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(25));
> +
> +    gpio0_set_input(qts, 25, 0);
> +    gpio0_set_input(qts, 25, 1);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_ctl_hw_no_int(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 27;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_SWPORTA_CTL, BIT(27));
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(27));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(27));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(27));
> +
> +    gpio0_set_input(qts, 27, 0);
> +    gpio0_set_input(qts, 27, 1);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_gpio_plic(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO0_IRQ_BASE + 6;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(6));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(6));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(6));
> +
> +    gpio0_set_input(qts, 6, 0);
> +    gpio0_set_input(qts, 6, 1);
> +
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    /*
> +     * EOI clears the GPIO-side raw status, then claim/complete
> +     * clears the sticky PLIC pending bit and returns the claimed
> +     * IRQ id.
> +     */
> +    gpio0_write(qts, K230_GPIO_PORTA_EOI, BIT(6));
> +    plic_claim_complete(qts, gpio_irq);
> +    g_assert_false(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_multiple_irqs(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int irq_a = GPIO0_IRQ_BASE + 1;
> +    int irq_b = GPIO0_IRQ_BASE + 9;
> +
> +    qtest_writel(qts, PLIC_PRIORITY + irq_a * 4, 1);
> +    qtest_writel(qts, PLIC_PRIORITY + irq_b * 4, 1);
> +    qtest_writel(qts, PLIC_THRESHOLD, 0);
> +    qtest_writel(qts, PLIC_ENABLE + (irq_a / 32) * 4,
> +                 BIT(irq_a % 32) | BIT(irq_b % 32));
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(1) | BIT(9));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(1) | BIT(9));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(1) | BIT(9));
> +
> +    gpio0_set_input(qts, 1, 0);
> +    gpio0_set_input(qts, 9, 0);
> +
> +    gpio0_set_input(qts, 1, 1);
> +    g_assert_true(plic_irq_pending(qts, irq_a));
> +    g_assert_false(plic_irq_pending(qts, irq_b));
> +
> +    gpio0_set_input(qts, 9, 1);
> +    g_assert_true(plic_irq_pending(qts, irq_a));
> +    g_assert_true(plic_irq_pending(qts, irq_b));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_gpio1_plic(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int gpio_irq = GPIO1_IRQ_BASE + 5;
> +
> +    plic_enable_irq(qts, gpio_irq);
> +
> +    qtest_writel(qts, K230_GPIO1_BASE + K230_GPIO_SWPORTA_DDR, 0);
> +    qtest_writel(qts, K230_GPIO1_BASE + K230_GPIO_INTTYPE_LEVEL, BIT(5));
> +    qtest_writel(qts, K230_GPIO1_BASE + K230_GPIO_INT_POLARITY, BIT(5));
> +    qtest_writel(qts, K230_GPIO1_BASE + K230_GPIO_INTMASK, 0);
> +    qtest_writel(qts, K230_GPIO1_BASE + K230_GPIO_INTEN, BIT(5));
> +
> +    gpio1_set_input(qts, 5, 0);
> +    gpio1_set_input(qts, 5, 1);
> +
> +    g_assert_true(plic_irq_pending(qts, gpio_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_ddr_switch_output_to_input(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int level_irq = GPIO0_IRQ_BASE + 12;
> +    int edge_irq = GPIO0_IRQ_BASE + 13;
> +
> +    qtest_writel(qts, PLIC_PRIORITY + level_irq * 4, 1);
> +    qtest_writel(qts, PLIC_PRIORITY + edge_irq * 4, 1);
> +    qtest_writel(qts, PLIC_THRESHOLD, 0);
> +    qtest_writel(qts, PLIC_ENABLE + (level_irq / 32) * 4,
> +                 BIT(level_irq % 32) | BIT(edge_irq % 32));
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, BIT(12) | BIT(13));
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(13));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(12) | BIT(13));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(12) | BIT(13));
> +
> +    gpio0_set_input(qts, 12, 0);
> +    gpio0_set_input(qts, 13, 0);
> +
> +    gpio0_set_input(qts, 12, 1);
> +    gpio0_set_input(qts, 13, 1);
> +
> +    g_assert_false(plic_irq_pending(qts, level_irq));
> +    g_assert_false(plic_irq_pending(qts, edge_irq));
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +
> +    g_assert_true(plic_irq_pending(qts, level_irq));
> +    g_assert_false(plic_irq_pending(qts, edge_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_ctl_switch_hw_to_sw(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    int level_irq = GPIO0_IRQ_BASE + 14;
> +    int edge_irq = GPIO0_IRQ_BASE + 16;
> +
> +    qtest_writel(qts, PLIC_PRIORITY + level_irq * 4, 1);
> +    qtest_writel(qts, PLIC_PRIORITY + edge_irq * 4, 1);
> +    qtest_writel(qts, PLIC_THRESHOLD, 0);
> +    qtest_writel(qts, PLIC_ENABLE + (level_irq / 32) * 4,
> +                 BIT(level_irq % 32) | BIT(edge_irq % 32));
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_DDR, 0);
> +    gpio0_write(qts, K230_GPIO_SWPORTA_CTL, BIT(14) | BIT(16));
> +    gpio0_write(qts, K230_GPIO_INTTYPE_LEVEL, BIT(16));
> +    gpio0_write(qts, K230_GPIO_INT_POLARITY, BIT(14) | BIT(16));
> +    gpio0_write(qts, K230_GPIO_INTMASK, 0);
> +    gpio0_write(qts, K230_GPIO_INTEN, BIT(14) | BIT(16));
> +
> +    gpio0_set_input(qts, 14, 0);
> +    gpio0_set_input(qts, 16, 0);
> +
> +    gpio0_set_input(qts, 14, 1);
> +    gpio0_set_input(qts, 16, 1);
> +
> +    g_assert_false(plic_irq_pending(qts, level_irq));
> +    g_assert_false(plic_irq_pending(qts, edge_irq));
> +
> +    gpio0_write(qts, K230_GPIO_SWPORTA_CTL, 0);
> +
> +    g_assert_true(plic_irq_pending(qts, level_irq));
> +    g_assert_false(plic_irq_pending(qts, edge_irq));
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/k230-gpio/reset_values", test_reset_values);
> +    qtest_add_func("/k230-gpio/edge_rising", test_edge_rising);
> +    qtest_add_func("/k230-gpio/edge_falling", test_edge_falling);
> +    qtest_add_func("/k230-gpio/both_edge", test_both_edge);
> +    qtest_add_func("/k230-gpio/level_high", test_level_high);
> +    qtest_add_func("/k230-gpio/level_low", test_level_low);
> +    qtest_add_func("/k230-gpio/eoi_clear", test_eoi_clear);
> +    qtest_add_func("/k230-gpio/inten_disabled", test_inten_disabled);
> +    qtest_add_func("/k230-gpio/intmask", test_intmask);
> +    qtest_add_func("/k230-gpio/ddr_output_no_int", test_ddr_output_no_int);
> +    qtest_add_func("/k230-gpio/ctl_hw_no_int", test_ctl_hw_no_int);
> +    qtest_add_func("/k230-gpio/gpio_plic", test_gpio_plic);
> +    qtest_add_func("/k230-gpio/multiple_irqs", test_multiple_irqs);
> +    qtest_add_func("/k230-gpio/gpio1_plic", test_gpio1_plic);
> +    qtest_add_func("/k230-gpio/ddr_switch_out_to_in",
> +                   test_ddr_switch_output_to_input);
> +    qtest_add_func("/k230-gpio/ctl_switch_hw_to_sw",
> +                   test_ctl_switch_hw_to_sw);
> +
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 56ff860e21..cec2f818ae 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -297,7 +297,7 @@ qtests_riscv64 = ['riscv-csr-test'] + \
>     (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
>      config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
>      ['iommu-riscv-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
> +  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test', 'k230-gpio-test'] : [])
>   
>   qtests_hexagon = ['boot-serial-test']
>   


