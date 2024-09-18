Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44318CCD195
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 10:12:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqrfC-0005FD-Dh; Wed, 18 Sep 2024 06:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sqrf9-0005D9-UT
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 06:11:55 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sqrf8-0000w1-BN
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 06:11:55 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7b28so8686359a12.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726654312; x=1727259112; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g5xJCI3jIM+E07EAG0ku4aft+jYfu8AVjJlyxLFkIes=;
 b=IDE19H0nY5JVrnnDAKURN2pH4CZtHfM4Goi4tX/yj7BBHBRF3sx136UZ42RhPlNPY5
 qMemOksC57fNDu521vHVuuUfybLiDLoCr5YAdZzMiPcva2h8LPsPTDUPj7fFzulswKZG
 nT9j7Iax3vGlOYtyBBMEVOYSOyYPL8OFLHMYhU/PvPFL7ZjH0ClmeN9ceCeZrNt3MkNb
 cFuoao8XGp170+q7vRfEfq4+BFLRouQiBlAVj/l/wglGONSgoggfW44chuFpPl4bw43l
 A89gaoWuAWbV8wkyIRiWqLPQFkKI4gCa1UQDbQqe0jSYaPVNzgwZ9iTx29NmqJPsLOsc
 6kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726654312; x=1727259112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g5xJCI3jIM+E07EAG0ku4aft+jYfu8AVjJlyxLFkIes=;
 b=Ag2FVS5nIa/JfFZBwSUjgq9VkSJPAzmiDh10K714kLrnjm9CJ2cIPrXkixiW0tGTd/
 FqIXFllhqenoHtz1ZYRVv04F0LJPoWVePruN22Jf66ALayqBUDV0P15dEcSDj7K5HNRE
 s8BLOQxswxr0g6Z0/iwrZvAb/rUpgqFX3FH7GaGjM9DehHyaMt/8X5mfp4hwv/Vno+ye
 jXdhQFigVEa5ssV/Dl7PepAl1y6oQSuS1m+q6y9PSukcmD00S3/dacX/8ZbhCvj+QYwo
 iZSTbYeFOkWbbMv+AVdcb4HbXAf+/9QqZOdjHINMW5XYSwlR0N6YoKI8Jvo/rUb9Ug4R
 WGRw==
X-Gm-Message-State: AOJu0YwRMjO6hlsiUbYXVdAjG3gzRXEq0W1ZX8i9NpkciWKcqrxQW2n9
 aUOS5J1QuFr0DEYlBOD+7t+H4UYXI3/Qj9NiStgyrrnVpXCVDOOMJs8Yjv4R6Yc=
X-Google-Smtp-Source: AGHT+IF5vnsT+51c8uToKgefA6uiZuXCu76ZV8hTQ6ISJUZuTlwZrqkNmopvkpkoeZcG58GqY8SicQ==
X-Received: by 2002:a05:6402:4025:b0:5be:fc1d:fd38 with SMTP id
 4fb4d7f45d1cf-5c413e60976mr17785486a12.36.1726654311567; 
 Wed, 18 Sep 2024 03:11:51 -0700 (PDT)
Received: from [10.133.7.245] ([83.68.141.146])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb53122sm4737204a12.32.2024.09.18.03.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2024 03:11:51 -0700 (PDT)
Message-ID: <33101e38-080d-4444-a8c3-9d01827e243f@linaro.org>
Date: Wed, 18 Sep 2024 12:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] tcg/riscv: Add basic support for vector
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 Swung0x48 <swung0x48@outlook.com>,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240911132630.461-1-zhiwei_liu@linux.alibaba.com>
 <20240911132630.461-3-zhiwei_liu@linux.alibaba.com>
 <0d591570-02c6-48c9-9e3f-ef47ac20ce7d@linaro.org>
 <b87e7a7e-41fd-4b26-bde3-9adca9babb24@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b87e7a7e-41fd-4b26-bde3-9adca9babb24@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
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

On 9/18/24 07:17, LIU Zhiwei wrote:
> 
> On 2024/9/12 2:41, Richard Henderson wrote:
>> On 9/11/24 06:26, LIU Zhiwei wrote:
>>> From: Swung0x48<swung0x48@outlook.com>
>>>
>>> The RISC-V vector instruction set utilizes the LMUL field to group
>>> multiple registers, enabling variable-length vector registers. This
>>> implementation uses only the first register number of each group while
>>> reserving the other register numbers within the group.
>>>
>>> In TCG, each VEC_IR can have 3 types (TCG_TYPE_V64/128/256), and the
>>> host runtime needs to adjust LMUL based on the type to use different
>>> register groups.
>>>
>>> This presents challenges for TCG's register allocation. Currently, we
>>> avoid modifying the register allocation part of TCG and only expose the
>>> minimum number of vector registers.
>>>
>>> For example, when the host vlen is 64 bits and type is TCG_TYPE_V256, with
>>> LMUL equal to 4, we use 4 vector registers as one register group. We can
>>> use a maximum of 8 register groups, but the V0 register number is reserved
>>> as a mask register, so we can effectively use at most 7 register groups.
>>> Moreover, when type is smaller than TCG_TYPE_V256, only 7 registers are
>>> forced to be used. This is because TCG cannot yet dynamically constrain
>>> registers with type; likewise, when the host vlen is 128 bits and
>>> TCG_TYPE_V256, we can use at most 15 registers.
>>>
>>> There is not much pressure on vector register allocation in TCG now, so
>>> using 7 registers is feasible and will not have a major impact on code
>>> generation.
>>>
>>> This patch:
>>> 1. Reserves vector register 0 for use as a mask register.
>>> 2. When using register groups, reserves the additional registers within
>>>     each group.
>>>
>>> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
>>> Co-authored-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
>>
>> If there is a co-author, there should be another Signed-off-by.
> 
> This patch has added a tag:
> 
> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> 
> 
> Do you mean we should add the same tag twice?

The from line is "Swung0x48 <swung0x48@outlook.com>".
If this is an alternate email for TANG Tiancheng, then please fix the patch --author.


r~

