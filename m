Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923C9C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbjD-0002F3-E1; Mon, 10 Feb 2025 16:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbjB-0002EQ-Q1
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:54:05 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbjA-0006BE-2C
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:54:05 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21f92258aa6so41192925ad.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739224442; x=1739829242; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hkNAqktjdKbKBJHHW1z6rMMw680e2czk9yQHTsJnsUg=;
 b=Oe7FMqtBLtSWnNRd9YV1Aa+CAsWZii76y6x/ncfvh/4msDN/ARIyR+v21NN+X+DQUc
 X/wa43wTfX7ab42NVOPEr008BHIym+Ye7BxkTZ+beNDyKHXD2zpk7TpIT21Qx+9IpsVs
 +1efn2taIe4jdvEqzTJIrMO1LDx4OXTwp2FFLriWYxaN4sSS2qTEwAoIhNM1teHzOnAl
 nQ/TwbP+q59FJQ2AnJ90rRbnP5TuhxVdqFYE6HJv31ZRVNTcb+KbiLDW8MkO6tpD2XQb
 y6uqDpO3kLBCa63QhPb4voTv0s5mjN0m8w4KnmC7Ytl4mbRoWkC7a75kxOSIOAUVVVUw
 2kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739224442; x=1739829242;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkNAqktjdKbKBJHHW1z6rMMw680e2czk9yQHTsJnsUg=;
 b=up8LOC3TWksnlh4IZTUxyL7iaUvSI67uS2y3uh8TH8T+JZEtKGwxtGffCZbjEGT0XZ
 LK9Ors54rt5EeJLOz/omyeqJ8ufwQYgiifFp5VL3ceF0NufJAjsi1QmrWoKDp5nAsTpG
 hSkH/yZPZ1OmfZDpUC40oNFN/+10q8acFDdj0b4vpj2S8oDXhKjBFJiDlP7MiIOiNN+N
 l6FUE7TX5hiQspbt5L1tDqnDHVSCKMMoAwxSTtSvL0jaCwCedJ+aCb52q5+kyS6gq4TN
 TnbGSvJSscd/k1hVU5ks+o6yRKM5Tujwffaew34cmvimM2yysZZo2swe+v8EZgY9IYov
 Bwcw==
X-Gm-Message-State: AOJu0YyRvf32fqOEehZRujh/rujFkLYfaQPk7VD1nzxROMhfOBkKNMPc
 io2pTDIT4GYd5PHTCmXxWYH4NiSVJsnd9PNXzlGeEjei1mBEVHZ8Hb3/wma5cRv/M1O+Z7Sj5sq
 2
X-Gm-Gg: ASbGncvNS20YRlSl//VaLIgCrfujGd1p2E7DRQ1t6pSmXUGqQfVLYnEMD+vCqYQumHa
 BYE1LaaMlA0RDIAuCmWz83kruugEtsqYiAoUOV5Q9yzmFg8U9yYcpAQTR2nd/HbUaFu+3byTv8o
 DfZ/3oW+TzYsqCTrtAe1A+J3qROTS0FIc1ZQOc/4yERguw+d3WkQSEFeFxOzVKrwUS+FucljPzq
 nnAZwtX1QUvwh2aRv+DxUIjSsH+mP8vGBIVQnxuOtSuVqzqaPOf9Jdzx6rxgbliWcHYHLFTqPlq
 GwyH4K3LBiW3kgPp6FOnfV8EdOi3mvs0sCHmtsncTFH1KSdBV7YYRkY=
X-Google-Smtp-Source: AGHT+IHNqVqSlVivIU9g9oWvu55/e/FjNUWtiEMnDHxVDxwidW6XkoXKROm3BVFz29P1c8k0qkpsiw==
X-Received: by 2002:a17:902:ce8c:b0:21f:6bda:e492 with SMTP id
 d9443c01a7336-21f6bdae843mr153272365ad.35.1739224442264; 
 Mon, 10 Feb 2025 13:54:02 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3687bde1sm84029975ad.195.2025.02.10.13.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 13:54:01 -0800 (PST)
Message-ID: <45b18fab-59a3-49c4-b600-b9a26b815961@linaro.org>
Date: Mon, 10 Feb 2025 13:54:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] target: Set disassemble_info::endian value for
 little-endian targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> @@ -35,6 +35,11 @@ static const gchar *tricore_gdb_arch_name(CPUState *cs)
>       return "tricore";
>   }
>   
> +static void tricore_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
> +{
> +    info->endian = BFD_ENDIAN_LITTLE;
> +}

While this is not wrong, since there's no disassembler it's slightly disingenuous.

This is the only target without a callback function, correct?  Let's split this function 
out separately, along with the hunk in patch 10 which makes the disas_set_info call 
unconditional.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

