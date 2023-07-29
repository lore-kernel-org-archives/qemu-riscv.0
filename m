Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947DAC0015E
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 22:06:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPrKJ-0002hz-7n; Sat, 29 Jul 2023 17:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qPrKF-0002h7-PI
 for qemu-riscv@nongnu.org; Sat, 29 Jul 2023 17:18:11 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qPrKE-0001ff-19
 for qemu-riscv@nongnu.org; Sat, 29 Jul 2023 17:18:11 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bb775625e2so20543495ad.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Jul 2023 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690665488; x=1691270288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2M9+soq9/vyWJ3xsv/OorLOQth0Z/WnuaAE3XOzrz1o=;
 b=zhk152XSUw4Q1SzJeuEnYiHJH4rEIbqvIja28vH/qGbWma9Zv5onhKtpiYTFuFu1si
 t1KHvNbDZshi2enzo2TXFf27pc5hnxOkrlS39CG+pJd1Q/mzLK2uP1xnsHGjjUzilZYD
 AuAs4I+TXACiWk1Kdgvv3bXbfcQvFKwNu3gKmuQafqDnYD+Y8e09HhAiN8OGomw8CoOC
 WS6/jKdrTo6efjVa2wv3wKW0MvS+t3Xu0QIltA5QdCYrmm92R4gGYN9nia1DO9HrX0Sf
 7CzY1fyDyi4k+1fDHRMkYaaf08VzcXKGb6aTXSQgNfWD3l2zOUtSpl/EPizFW6Ba0/2e
 YpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690665488; x=1691270288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2M9+soq9/vyWJ3xsv/OorLOQth0Z/WnuaAE3XOzrz1o=;
 b=WLpyxUABvSu2Qh46gS7xY5iamTDszRkKJKAD8FGehSScSlw1vMshCAsDuFTABkxRmN
 FMuaDjZOGs5fuQSiwxRsLygcTQpswTjOpCfDFO2ItNB0bBQTs4STvCsS+g1RS0Zccv5a
 dqn3Jri0fdDkY9xa79uB/gOiZph8ZYAR5rR0Q7Y/pJP12eCvRnVyiwx8XrqIU6AwHYcw
 fhbj8iLIR3U3OQ13F0tntTsUh4ogt/JIOJLl5ZUEuRsfVbjKWYwYj+ZhhJGYidw6QxRv
 lcFdDKXerqXc4GaWy3LNg7xMXFx3pUk4ISuHNwq+AhY90wTPuHx9zd58IR62AvQ8wZaj
 S+IA==
X-Gm-Message-State: ABy/qLY4dW6o9re9w4yjy0bXnSRsblriyMxK2NQf7TEoa8tNFp+zWu2Z
 444K2dxMJLtSRrICdTJz2K/11A==
X-Google-Smtp-Source: APBJJlEJZD391X/wPvWnYlt4/6rKozvSbeuSUvNlZhtH88zrYnt78jLaN9siHAGTGtDEz63yWheIVA==
X-Received: by 2002:a17:902:ba96:b0:1b8:c6f8:d9b with SMTP id
 k22-20020a170902ba9600b001b8c6f80d9bmr6114607pls.34.1690665487598; 
 Sat, 29 Jul 2023 14:18:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:c001:3ba7:1297:fffe:e7cb?
 ([2602:ae:154e:c001:3ba7:1297:fffe:e7cb])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170902c3c300b001bb40b880efsm4681915plj.101.2023.07.29.14.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jul 2023 14:18:07 -0700 (PDT)
Message-ID: <4c8751cf-7e27-a5dc-e7e1-2074c2d5f09d@linaro.org>
Date: Sat, 29 Jul 2023 14:18:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/riscv: Fix page_check_range use in fault-only-first
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230729031618.821-1-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230729031618.821-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/28/23 20:16, LIU Zhiwei wrote:
> Commit bef6f008b98(accel/tcg: Return bool from page_check_range) converts
> integer return value to bool type. However, it wrongly converted the use
> of the API in riscv fault-only-first, where page_check_range < = 0, should
> be converted to !page_check_range.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/vector_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

As far as it goes,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

though the test will never fail, because tlb_vaddr_to_host just succeeded.


r~

