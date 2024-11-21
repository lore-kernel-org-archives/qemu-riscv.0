Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C8ED7879B
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAYp-0000Cl-SL; Thu, 21 Nov 2024 12:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tEAYL-0008Hj-HD
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 12:01:18 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tEAYI-0000NJ-N2
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 12:01:13 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-724d57a9f7cso654073b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 09:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1732208468; x=1732813268; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a/SRHG0Qm+evxtGHer1XfiTBuuTPjZsZSaIQJSlpRu0=;
 b=dMsJyQp49Ir/aAkz/LxYhGe4R2oCsHRGUQFjLrkHD0cbmz3cMkUnVgYNz50PlIIVP3
 I8sEGq7TP+m4DMRZaF3fQyFnUehdbYAjnXMfUoPKdfYhGpS3CIqLVW0KmE+vkgtBKokA
 6ot3s969SS0vnKOEmZiFv1bDXukBGHd0e92XFfGHCXaWJ2v8d2cU25SWtnlVtQxnyYj4
 hPY1XQwrqrYDuOCIyOtfDwZK+KKXtEfkASCMRAK8x6c47w1kthp7aIApVw+SQUFX42Ru
 lDrkNMQ12IxcFcSk/K8VCjBV3cmOjsMCxehkLvRKU2y4l9Y83FFdNy++b9CH1m+GoeNB
 B8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208468; x=1732813268;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a/SRHG0Qm+evxtGHer1XfiTBuuTPjZsZSaIQJSlpRu0=;
 b=hRqCBpnp21nbKQGKgr17Byyn7+T7R349b4rQ+Fpq5rXGgMYHrSDqg5a2MG9HQsmkT3
 8ueZyUqk7oWh4hqZp1MuirDjaYrrl2bAuzygAiWBuUz6444uu6ctBZgmvqpEd0+9UHlE
 VzZBYJebhOkWlK4kVugqE5KhkcifwUgqYMR6RgtY1t70lY1n1yw1nxMfh4yV2VZjGZfd
 ZwP2cA7ee7vp5rbSn/4/ApT5NOvDQ3EiW78hlbkMcgivx+7YhtY2FC9t9y+tsRXG7yIC
 e7JSpe3Au3H88eG/LDB/txSrJxzach+25YVrPI1rff+pwZuisRAHRZInXPYysBofDFBw
 6sYQ==
X-Gm-Message-State: AOJu0Yx7zIL//KEyCOeJFcUmAk7TTxLWVTI+y+UDCLBefXE2qhhtDQ4d
 Y/EHi3pqt18Z/CMVVSphtEd9d91HZcXrKhiezsIRSSvUrUt83l79uaHeFskN4mY=
X-Gm-Gg: ASbGncvEUTgq6PKoCNIIqDX9gBzF5zofthKwy0CCg+a0w5tMq8fS0RJk3shl1TbuO/R
 6/x9YOjjuTavH+RVw6nul24sfIMpNSkx2jQ0SxwTsYaxeeoaB7jh+gPe4H4Rsqe1yhh56OXnbSD
 PlLfV1iIItO8BKre4T8SQ3lwjBIT7uaUam+hp+kn21Mk5vhuXUXYKbm13L+UyQUSNB0Vxl557ip
 ixTKxpYinqaTGrrbViYlUNTwhU1ZO0VF8Z+z5CuhSpL/65oxbKcEBOeXbufcpo=
X-Google-Smtp-Source: AGHT+IHkEmSesM0qr6Vyj7HhE+kyj/wkScd4nnFvainIppA27H5wKVlKlJkX8ng3E5q0rEgg3cBCrQ==
X-Received: by 2002:a05:6a00:882:b0:71e:ed6:1cab with SMTP id
 d2e1a72fcca58-724bed9d162mr8417537b3a.26.1732208468096; 
 Thu, 21 Nov 2024 09:01:08 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724dda236afsm63760b3a.107.2024.11.21.09.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 09:01:07 -0800 (PST)
Message-ID: <a96cc560-b43e-43df-a352-17805c614747@ventanamicro.com>
Date: Thu, 21 Nov 2024 14:01:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 2/2] tests/qtest: QTest example for RISC-V CSR
 register
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com
References: <20241120072712.65302-1-ivan.klokov@syntacore.com>
 <20241120072712.65302-3-ivan.klokov@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241120072712.65302-3-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 11/20/24 4:27 AM, Ivan Klokov wrote:
> Added demo for reading CSR register from qtest environment.
> 
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tests/qtest/meson.build      |  2 +-
>   tests/qtest/riscv-csr-test.c | 56 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 57 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/riscv-csr-test.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index f2f35367ae..3aad77b3a9 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -272,7 +272,7 @@ qtests_s390x = \
>   qtests_riscv32 = \
>     (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-watchdog-test'] : [])
>   
> -qtests_riscv64 = \
> +qtests_riscv64 = ['riscv-csr-test'] + \
>     (unpack_edk2_blobs ? ['bios-tables-test'] : [])
>   
>   qos_test_ss = ss.source_set()
> diff --git a/tests/qtest/riscv-csr-test.c b/tests/qtest/riscv-csr-test.c
> new file mode 100644
> index 0000000000..ff5c29e6c6
> --- /dev/null
> +++ b/tests/qtest/riscv-csr-test.c
> @@ -0,0 +1,56 @@
> +/*
> + * QTest testcase for RISC-V CSRs
> + *
> + * Copyright (c) 2024 Syntacore.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +
> +#define CSR_MVENDORID       0xf11
> +#define CSR_MISELECT        0x350
> +
> +static void run_test_csr(void)
> +{
> +    uint64_t res;
> +    uint64_t val = 0;
> +
> +    QTestState *qts = qtest_init("-machine virt -cpu veyron-v1");
> +
> +    res = qtest_csr_call(qts, "get_csr", 0, CSR_MVENDORID, &val);
> +
> +    g_assert_cmpint(res, ==, 0);
> +    g_assert_cmpint(val, ==, 0x61f);
> +
> +    val = 0xff;
> +    res = qtest_csr_call(qts, "set_csr", 0, CSR_MISELECT, &val);
> +
> +    g_assert_cmpint(res, ==, 0);
> +
> +    val = 0;
> +    res = qtest_csr_call(qts, "get_csr", 0, CSR_MISELECT, &val);
> +
> +    g_assert_cmpint(res, ==, 0);
> +    g_assert_cmpint(val, ==, 0xff);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/cpu/csr", run_test_csr);
> +
> +    return g_test_run();
> +}


