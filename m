Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8134C001DB
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 14:29:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTNhP-0002Ix-BC; Tue, 08 Aug 2023 10:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTNhO-0002Ij-Dm
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 10:28:38 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTNhM-0003KV-V5
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 10:28:38 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bbf0f36ce4so37387025ad.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 07:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691504915; x=1692109715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WjIQTdJXCyYEoKEkOcHIrtiJvvJxjdXOQaOVJRDiY1k=;
 b=J1DQaJPbm1esN/0wKMnreNKt0cQ9zasI47tG58herfpIDuhU2gpSaU3R2wtrSyikur
 O6Q3z+Cuz8FOE6DNHYFZk0U6kNOJL8QDNhkGmUYM8ETnX+n3CxzYfXbmcbsxdT4mY9wd
 5+uwWL9le73zmsE8/4GIweuDcbF1zgs/wpDL6IwRrbAlZjDc8n/3YV+3MxFRVYZK5Rks
 4KVBfSrKAFHRVGpgEscpi5DyLFH/bHbQFkijQamaNzMH93Z/NPzAGqpO1h9r+UvMfoEp
 OdJ5apydwW9Spbv74Uo1IxkJDYnH+Y+Cadqzw9OxJzj5Kb6Gy6NNmgP2/Z9pBpq8x15O
 Xfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691504915; x=1692109715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WjIQTdJXCyYEoKEkOcHIrtiJvvJxjdXOQaOVJRDiY1k=;
 b=IzO8brmLCr6waoMr3TKVAxHqnMheYbmBmLkVVPO6RKl+fG3MY+jJKXvUytnRpbvm7z
 rWgh7h42DX3PRoxetUT0vjnmw2Y1yCwXm2TojadzTPJ37puU5MLj+VGyOTGF6efdb+Ii
 /X3ogu3Aipruyb4MmPT5fxDrlnbjmDdCoUpjMwakTzZpqHGfdQlc7GIRtYc/RKh89o+f
 lPlfOqXo3AV9TttWYH4D+rZedXhzwLoqMtZEJW5f/x3PYZvEYwJFEB/LeyL72OMpS9XW
 JA26k8Lx9ydMmRtAF83ySt8b6NpOEe55tdF/ZrFr2oKyz7WNWwx5ptz4egGHRyLWt42+
 cxdw==
X-Gm-Message-State: AOJu0Yz8UBwr27knRoPFpFnZg46fKceD3JX33Q663i1P6nSV0AP3lgWZ
 qGBmFIHGADsYES4gqGBUHQLROA==
X-Google-Smtp-Source: AGHT+IF6QsHnPBwlCBdps/gUeduLbXkJgG1IL8LRH+zEZzQDG0U4YHT2J6ETa92VkQRmnrnGJf/mSQ==
X-Received: by 2002:a17:90b:1d88:b0:269:4645:80b9 with SMTP id
 pf8-20020a17090b1d8800b00269464580b9mr7066511pjb.2.1691504915050; 
 Tue, 08 Aug 2023 07:28:35 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:63dc:2a47:f4bc:4a95?
 ([2602:47:d490:6901:63dc:2a47:f4bc:4a95])
 by smtp.gmail.com with ESMTPSA id
 2-20020a17090a01c200b00256b67208b1sm11353903pjd.56.2023.08.08.07.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 07:28:34 -0700 (PDT)
Message-ID: <d7cc2724-5fe5-f491-556c-03ab2af0975a@linaro.org>
Date: Tue, 8 Aug 2023 07:28:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] linux-user/riscv: Use abi_ulong for target_ucontext
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230808093434.2059-1-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230808093434.2059-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 8/8/23 02:34, LIU Zhiwei wrote:
> We should not use types dependend on host arch for target_ucontext.
> This bug is found when run rv32 applications.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   linux-user/riscv/signal.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

