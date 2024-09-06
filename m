Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E36CE7AB8
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 07:59:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1smTsc-0000HK-C8; Fri, 06 Sep 2024 03:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smTsa-00009p-M8
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2024 03:59:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smTsY-0002ls-T4
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2024 03:59:40 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42bbd0a40faso14613565e9.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Sep 2024 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725609577; x=1726214377; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QvzVpbuO5YC9V/75mSzaosrOTMO906NGXn793epl9+8=;
 b=EiJcWEEBZnmtG6UKsjDZOdne98W62lffY5k2ipuXOIQNHDneRIIGZ5Y29ayShw1E9s
 vbAmN2Ys/QwAdeCZW1eJF4QjO9coO0Cn4Qw2uGovnIN4Z7RG5aNQ1rwM52Dx4l61dkpi
 fHABu66LP63xqJFSXCo2P+uuGmbsWC2ccKN+NGbvLrnv6bOQId/Z9DJKjclzXQ8F/SY7
 kA1Rj6XS77BZPs3944QIeZO6oG4lu/Z0JIwt+gTVWKZqlv7tM3wkIX/YdCTBGnaMbVMS
 xdKp3W9BySS6gXmlJsJf4ghx2xlqbFk7V0AAnJ9dlRWxAwYDLG3ppv/GD2o38J9bfPIK
 wB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725609577; x=1726214377;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QvzVpbuO5YC9V/75mSzaosrOTMO906NGXn793epl9+8=;
 b=v1FV+8b5nb8xHvr/qHFnefvw81EFWAHjkq5Yg+piCLEgEtltCGCqVsN78doqJnyV/I
 kGadXsgGF4hkXeDbMkAm7VXYHyl6d3hHg6gr1T94uow9qafPctgSw4YFkSZopkUx65oJ
 pMm1n6Aw0hMhhLrkQrilHggepuhW54TZPtZTxRDoHBvjOkGjz4LkNCgak9guvXy7ZYd6
 S1DhOQq9U675Myc7rbQ/YHxYKguRT2LZhiwY87YLDcGlwgcA5eAMRqtktTzRKnD3DUhu
 F22BJmAybWtiXimr4/hfmXmAXq1coXNi5RJ9hqU3D48ETPjI1t6yJwViB3Jv5Aq1Vp+V
 /JSg==
X-Gm-Message-State: AOJu0Yy+I6h1LRNaOrvxyBncco5ifkdgEXzxkkZlwyUeccK+wYTptM5B
 viA9v8hibEQkS356XtvnUPZbjADcEWM2EWx5Ws097orTQl605pySOTQwMfCc9qo=
X-Google-Smtp-Source: AGHT+IF13JZidc1e0qcQf43JUxVvvsLFKVHmPxmwgN5Sd5QIv0Qo/jIRQXlPzavFWCcQx1XH3DYJgw==
X-Received: by 2002:a05:600c:4f82:b0:426:5e8e:410a with SMTP id
 5b1f17b1804b1-42c9f9d6e21mr11032725e9.24.1725609577172; 
 Fri, 06 Sep 2024 00:59:37 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c9bb7a46csm43322905e9.1.2024.09.06.00.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 00:59:36 -0700 (PDT)
Message-ID: <639f1017-4e74-4fdc-89a6-6aeca6c0737c@linaro.org>
Date: Fri, 6 Sep 2024 09:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] tests/qtest/boot-order-test: Make the machine name
 mandatory in this test
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-riscv@nongnu.org
References: <20240905191434.694440-1-thuth@redhat.com>
 <20240905191434.694440-4-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240905191434.694440-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Thomas,

On 5/9/24 21:14, Thomas Huth wrote:
> Let's make sure that we always pass a machine name to the test_boot_orders()
> function, so we can check whether the machine is available in the binary
> and skip the test in case it is not included in the build.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/boot-order-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/boot-order-test.c b/tests/qtest/boot-order-test.c
> index 8f2b6ef05a..c67b8cfe16 100644
> --- a/tests/qtest/boot-order-test.c
> +++ b/tests/qtest/boot-order-test.c
> @@ -31,7 +31,7 @@ static void test_a_boot_order(const char *machine,
>       uint64_t actual;
>       QTestState *qts;
>   
> -    if (machine && !qtest_has_machine(machine)) {
> +    if (!qtest_has_machine(machine)) {

Should we defer the NULL check to qtest_has_machine_with_env()?
It uses g_str_equal() which is described as:

   Note that this function is primarily meant as a hash table
   comparison function. For a general-purpose, NULL-safe string
   comparison function, see g_strcmp0().

Better switch to g_strcmp0() in qtest_has_machine_with_env()?

>           g_test_skip("Machine is not available");
>           return;
>       }
> @@ -107,7 +107,7 @@ static const boot_order_test test_cases_pc[] = {
>   
>   static void test_pc_boot_order(void)
>   {
> -    test_boot_orders(NULL, read_boot_order_pc, test_cases_pc);
> +    test_boot_orders("pc", read_boot_order_pc, test_cases_pc);
>   }
>   
>   static uint64_t read_boot_order_pmac(QTestState *qts)


