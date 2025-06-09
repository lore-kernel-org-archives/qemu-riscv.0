Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AE8C5B552
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 12:03:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uObDj-0007zg-AG; Mon, 09 Jun 2025 08:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uObDf-0007xg-FR
 for qemu-riscv@nongnu.org; Mon, 09 Jun 2025 08:03:16 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uObDc-0005h8-5K
 for qemu-riscv@nongnu.org; Mon, 09 Jun 2025 08:03:15 -0400
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-234f17910d8so40179395ad.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Jun 2025 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749470590; x=1750075390; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=usPCwdu/bUNpbZgZnZVpiDvJ1pWA3Uq4f0/0dWe1wEY=;
 b=h6II8FDV2rMMSBlpXHbVMbR9dSiJXtU1nznYXeU6ojEbkpKMRIyyfwzxHgE7WFDJgb
 MVDPAkmaekO7KuHTpInEwzqJP0ua02m+j3uarZsZ1nQ2g9aq+Sbtkz7we5tKXvPKvKBI
 liDCMMkwObjtCGnP6EeqI19bqVlE4wZ9+7bFNN9UU5XVH8U3JOy7EYQ9PpJjgGFbxqs1
 LxRE+X1HeEUt0i1WSiuQ8okH43x+bR5nOl/eDJooXCUVL7Red1B7CYBkaSYV2BGs62Ql
 a/QaAIh3ByMnqi7DKcXEcxoBrY/mT1JzlAIrdTRqfV60oRcDy8GfRoxHZuU0aub3hzG+
 0cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749470590; x=1750075390;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=usPCwdu/bUNpbZgZnZVpiDvJ1pWA3Uq4f0/0dWe1wEY=;
 b=VXueBu9bI6H2lAn26UASZ9jlpuy9emxWnoWAXweMwbr3Lwl2VRdJ7b04VaYNO/2ENs
 BT8KEELX6H54bUfgNKQjjfH4fpVKbp3uNkHBrHdAbis4Uef6nmOKjnLeup6OtE9zDVmm
 b3bxtZdVjYr/ZQugdfwaFKE6phQk4favq1/YPcEyo8Lk0QZjmT+ngCn5kln99OLQIbeb
 Uok3fJjN5YEpw8Yj3ZkKTmjFPLHNwN7UaR7hnOHdrM3pTISisuYgQq9jS0Yw7XJodFrW
 G4qR1iJK3Um4CzWoSHN0KvjqEh8/cZo3R9Tdq98Qcsbn1hgFXWGvPGZ1/vVA2/76zZKo
 eUVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxLUrKac+b9M/Ej0zF+UhjkYW6Xp//cXa3py71KA9dBBxvOsOuhjHyDecjn2hW5J5yTWzv4JGlApfO@nongnu.org
X-Gm-Message-State: AOJu0Yxcf8JPC8BZpXLkg9nkObZHrrW++c2xxs5zYZjuEsqjweFEGz49
 zrz68Ljb7IwcBucDJyUTMN2i3D/vFKsAVP5Jrmv70EhfiTUX/W3E1bSYpSy+m0hsMmE=
X-Gm-Gg: ASbGncthlIILq1rcH08x4h0leoxnraPXaz7dKL2UJxFklGhrQayv7x1NjhSL9nGMSvV
 +LQHpxPeURFmcPiJSYRA2d7ibxAdm7fvpHgsxfIYHFjaj5nS3DIMZXeyKuSme3b1aDhAKaN8/xb
 xr6zWq/9SxpVCXk8/mBdbmAbsereyvte/TPF4mfxnJVybCBYWe5xczGOnBts2WkQMvKsEY7GMty
 1BlV6+XeKKfK7LMunUNtSqO5IPCBRBbDs4C31aPM+pfwWhmagstajpyDgDsce2NSXzJlhw8PAif
 kC281u1A2Gc469S7JST2WmGFYq/PUinPJgW++IOts2Y8LzOCATxMi27Wff6bxS3jKhDxIyiW+v8
 =
X-Google-Smtp-Source: AGHT+IGXF7JPu0VMaW4oMjKdhH1qKPHKVeZns53qaJ1DEXGIBNxmJM33sYw+DJKwBsAQ/ysOP02wzg==
X-Received: by 2002:a17:902:ce8e:b0:235:225d:3087 with SMTP id
 d9443c01a7336-23601d4ed7amr170531285ad.30.1749470589693; 
 Mon, 09 Jun 2025 05:03:09 -0700 (PDT)
Received: from [192.168.68.110] ([179.93.21.192])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fcd40sm53240035ad.125.2025.06.09.05.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 05:03:09 -0700 (PDT)
Message-ID: <ed76d0a7-bfb2-4c22-9e9d-093703f41296@ventanamicro.com>
Date: Mon, 9 Jun 2025 09:03:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hw/riscv: add CVA6 machine
To: Ben Dooks <ben.dooks@codethink.co.uk>, nazar.kazakov@codethink.co.uk,
 joseph.baker@codethink.co.uk, fran.redondo@codethink.co.uk,
 lawrence.hunter@codethink.co.uk, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20250527112437.291445-1-ben.dooks@codethink.co.uk>
 <20250527112437.291445-2-ben.dooks@codethink.co.uk>
 <ca6cc5a3-029a-4e6c-8dfb-076b910bfbb5@ventanamicro.com>
 <110336ae-4f0d-4e27-8bd4-5cd336c7fb4c@codethink.co.uk>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <110336ae-4f0d-4e27-8bd4-5cd336c7fb4c@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 6/9/25 8:32 AM, Ben Dooks wrote:
> On 09/06/2025 12:24, Daniel Henrique Barboza wrote:
>>
>>
>> On 5/27/25 8:24 AM, Ben Dooks wrote:
>>> Add a (currently Genesy2 based) CVA6 machine.
>>>
>>> Has SPI and UART, the GPIO and Ethernet are currently black-holed
>>> as there is no hardware model for them (lowRISC ethernet and Xilinx
>>> GPIO)
>>>
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> ---
>>> v2:
> 
> Apologie,s looks like it this got rebased out of the release
> 
>>> +/* plic register interface in corev_apu/rv_plic/rtl/plic_regmap.sv */
>>> +
>>
>> I believe you've missed my comment in v1:
>>
> 
> would this be ok
> 
> /*
> * plic register interface in corev_apu/rv_plic/rtl/plic_regmap.sv
> * https://github.com/pulp-platform/rv_plic/blob/master/rtl/plic_regmap.sv
> */

LGTM.


Thanks,

Daniel

> 


