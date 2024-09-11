Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3E2EE57DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 23:07:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soWQr-0003k1-O4; Wed, 11 Sep 2024 19:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soWQp-0003j3-BB
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 19:07:27 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soWQn-0001Vs-Pz
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 19:07:27 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-7d4fbe62bf5so284531a12.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2024 16:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726096044; x=1726700844; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NWkFRwzMtnjnS6hDMOQcA6JEZDkh8xVFkbeR+AlO03Y=;
 b=vbRS293lUdW+NlGgCcw7qbxTdH6gwUGSpr1ewO3swWgOQB8NDQlaVjHIaRJj3MSlw8
 ZRL3MqXXqdYTlLS6SNgyjYmhF9xb704kzn22pQ0G/wBwCGDtnX0bPWraWXpPPqcyz62N
 /SGVua2E45Gmz6fOdRTugKPnATq0miNmpdLuCDnrkrWyRgNjyOb7QvKnZ87WMfVkIIvy
 FeJxtt5uokvio8yWf/ofE7Nmj3wxEHB19XR5/Q5l9NlQjGK/uAwZrlNaSvlM0ZnEK2iX
 o8rn8DMuvM/YjV8wQQwKsSpIN964zt28ngF/QpuuRNlJ5IGSWdhrqrbFNbn5B43NMIjr
 ac5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726096044; x=1726700844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NWkFRwzMtnjnS6hDMOQcA6JEZDkh8xVFkbeR+AlO03Y=;
 b=euCa41YNcm3ma5vpB8pVx46sTWDTef2DN+C3HyL9uEu18f0ScGxnJZxxzOM7NhRFN1
 KPt/fh+kEfnXtHGlLYtUsZH+NdNlP2c8cWaQLZd5Thu1BYySM/TPWUQ7EuWS3KG6aZiU
 Dnlu2KNo9qf6AwNK5zNXGUQXU9+CR73r9B+Bt+x3KoN0o0to76X6wxxneAmyU9Penhwa
 NGr9AMaPuIt285F6We0C20gwqz2LqyCSAe95Paqfv86ijX/4azi6tn53f7EbpkSGf16Y
 dH5ZT6LsNXFDLeiCDvZTy+yKhwiMmz55EzQEITfKkONtvH7ghRVXC+axHWdRl9bh3Uz+
 o4GQ==
X-Gm-Message-State: AOJu0YwFPNYxKo+Qeur1DvRc9LTD5p7+GS9umixhtstqboLyCzzC0S95
 l9x3UGxHI5jUOETLTREYNJ10KyMfGXqaKPbZhqC1BWE3hAClf9gFKr+KzhzAE10=
X-Google-Smtp-Source: AGHT+IECL0SCaKviybaGjoYpaCkfHbFysQgUBjMSPc/iO93ZIabeEyBAtkoJvGCPoMYvNfwv0O/Cbw==
X-Received: by 2002:a05:6a20:2d28:b0:1cf:253e:5cc5 with SMTP id
 adf61e73a8af0-1cf75e7b611mr979837637.10.1726096043698; 
 Wed, 11 Sep 2024 16:07:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71908fc8205sm3495676b3a.21.2024.09.11.16.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 16:07:23 -0700 (PDT)
Message-ID: <e0683f81-61f0-4c8b-8f91-fd93dd29e0be@linaro.org>
Date: Wed, 11 Sep 2024 16:07:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] tcg/riscv: Implement vector mov/dup{m/i}
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240911132630.461-1-zhiwei_liu@linux.alibaba.com>
 <20240911132630.461-5-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240911132630.461-5-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 9/11/24 06:26, LIU Zhiwei wrote:
> From: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> 
> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> Reviewed-by: Liu Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 73 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 71 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

