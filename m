Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC4ACA1012
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 10:14:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu6z6-0003yI-Lv; Thu, 04 Sep 2025 06:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uu6z5-0003xQ-1z
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 06:14:27 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uu6yy-0008Cj-3W
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 06:14:24 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-30cce5cb708so599537fac.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 03:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756980857; x=1757585657; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l/yR6M74PCFzVjAUqQfwhFVlLv7FromAIG+fewQNg3Q=;
 b=ARd5/EiPtPQfZzwIxLg6Et9LphXrPWaOrKzkX14Wd9X1voUKDqIZTUYRmzdzenBEFw
 kchOpRSjcRiiPAsDKfaV6wXXL1GZUavBJokmuS7TJQr9h2tQTQV3UTVM/ZcR4pjlXqHY
 bOtRdQ618zGxzk58oVQScQ5CfbikYNH/nSakme4c9phxRFteNuENUAYBxP0RhXTMSTR5
 gdQ+EbS2pkUprU6fouzMIPZqqhPSVez2ovonifz/JTpnpRIasRexArGhOTvrYldn1ZoY
 XgvfShzp9GPNPeKE8tqibmIJwfJ0mx1YqDvqKKBbohIff5rNNsxzaWbWlHW0GIxzgamd
 me0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756980857; x=1757585657;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/yR6M74PCFzVjAUqQfwhFVlLv7FromAIG+fewQNg3Q=;
 b=jiaNGu3FSvji1tza1meZDEhB5hBPLT7Y6FfzIYmPWc1rEKPN65CJcKfxYOkaCwQgSk
 0jGh6hjW9EcIQUrkVJRvuBy+xZ5iTyQTQDpWODPhFGuVWnEcnAJPchB92NFVD0qj14Yj
 gLXQNsBtpE9EnOwiQkCe3kYmFiF8HpiHGzQoy7Trz4mtxOfLhKurQRphqnadOXo+l32y
 GeluqRsWa5Y5UyqNo8AAkGZuERpRMjn5TC109IKP54xhbg5cw4sJHEPd0i00sb/7DFzg
 Dh/mKDKw4zKnGsofIcYu2eRUptvMoY1R2D7hObyd1ps0KA7DKH5qsfWJGLOsM292hi4c
 Piow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz5XypIxEv3ZQdagvOg9QbHUXysF1A87Y2PwQrrcttI6d6pgPHmXBRsTusxGVbUrgsTjnq3rr8oD+c@nongnu.org
X-Gm-Message-State: AOJu0YzMuAxDwEAb7KHaahRc7PbV1/R6NOFwp3mfG/5j/9YwCsRzZ9EC
 aI6oYyjGxeH6n6UwfONe2F4rd5iew6U6us4dyeyfcLwZGxoIbHdfO18lUtrEiDc+NvU=
X-Gm-Gg: ASbGncswti6dPKBZGp0rTwOKPccicxEXAL03kjNy+P/KNGHShT9tLGZ9WKHLnui0Jyk
 Wno2NPKvIj97CQXRD4NZOqmKx16f/emzs3xPoyGny0d1R16b5fhFBhr+J6pOeOqcs1MTHMnwGPE
 6W7G7Z5L6LS/4iztyvlPGyg8RBd/zIjhLyUKATZpmB9+phRnW9oenOOg0CHEW1eQbf2KfWrL0Su
 3yvNai0ndUvl6CyLGENHiO4NBNeLXo4zLe8yr1lG2PZep6MuLA2CC8/Hz2n/t3uXrOfkWO06upt
 zW6LO804SxwV1O3k0YPluQN4jrx+rA8iqtJDEtpif8/olX6jVoowrSgMe3uOtpU8CezAFvMDFZu
 nN+0KkqpbyE0BNN2mIIcPXIp8f1ujzhWBWvSQ3JtgsWQ7MKA=
X-Google-Smtp-Source: AGHT+IFtHENZmou+j3cb+4+f/VxqCNMwFnjmLRlw2wlo3gsYwArBnDXB+G6cwJqCiDVRXRv4cBaV3A==
X-Received: by 2002:a05:6871:4186:b0:2bc:918c:ee04 with SMTP id
 586e51a60fabf-319630cafbcmr11118579fac.14.1756980856729; 
 Thu, 04 Sep 2025 03:14:16 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-319b6063d3dsm2049136fac.26.2025.09.04.03.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 03:14:15 -0700 (PDT)
Message-ID: <2f2cafa3-0017-4fa9-8766-554556a9aa8b@ventanamicro.com>
Date: Thu, 4 Sep 2025 07:14:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/3] target/riscv: Expose Zvqdotq extension as a
 cpu property
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 richard.henderson@linaro.org
References: <20250903140308.1705751-1-max.chou@sifive.com>
 <20250903140308.1705751-4-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250903140308.1705751-4-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL=0.141, SPF_HELO_NONE=0.001,
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



On 9/3/25 11:03 AM, Max Chou wrote:
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 95edd02e68..ed486113ba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1373,6 +1373,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>   /* These are experimental so mark with 'x-' */
>   const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
> +    MULTI_EXT_CFG_BOOL("x-zvqdotq", ext_zvqdotq, false),
>   
>       { },
>   };


