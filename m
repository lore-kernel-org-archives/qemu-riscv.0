Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F4BE74AD8
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 21:08:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIa7f-0005HW-79; Tue, 03 Dec 2024 16:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tIa7c-0005G4-SE
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 16:07:53 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tIa7b-0002Yc-08
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 16:07:52 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-724d57a9f7cso5265797b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 13:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733260069; x=1733864869; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VkfrhlF25mJOtQpln6NH/tQSe01z945gq6e/KtdToIs=;
 b=FCgUI3PQo759fKuo5PzuCa30MgrK/QO+JR3iOV+Y2ZOJ2N2bzDcXYnlGvigI6XNmk3
 qeWvv+N6lrEjBpzi+AgUat2bzuH5JAiWGXmEwbY73B5hX+0w0PoguvWklAxNzXKtuDVC
 T2+ussYvzoT/PNiR6NqdBgK28fmqqUWKcuFVfCKJit5juYuA+VvS233thJ0tktBQS8gM
 R4TPxZtW8xomd6VMnDMSQeuv9KgUvr2H1vamkwjf5G0Ub4M/uXYUYZmWnbhlsAkU5R+U
 MJYW9DQAVD3jfl9znkxzH3+1VX7/MPo0ecU5EYb1GM3TPcfy5brMeejoCNW2z26XmG+g
 CGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733260069; x=1733864869;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VkfrhlF25mJOtQpln6NH/tQSe01z945gq6e/KtdToIs=;
 b=WTI5pAAZFp67IgCcO7P31eeuktIxbB8FgjMiWxIXYALgA0S07JLt9juUGywvVRXyBd
 /QW4x3T+abbzCRSbgYewbcVPISi4gQfkj9sdzHbbrbD5sZyFLjeRWRI65jjBkElIH13V
 5J8Vjb1jUS1uiLnnV7GLqnuSdhCwqDIX78GUhT1XR6EDqQNmU5lo2OjU0x9jULPTabjN
 WzYftQTm1PlRq/luqQF2vah2SuuYsKZZnYGup48ybX2jrEV7hZhr/m+wiklpp1Y9aReX
 sr4Sw2qOEvZe1XwjKrCrvsOvK2vysYZRMDsbmpW+IupLJxsaVs9udRGDLmXSFPOPT1gH
 oP3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2y6YNyLaNa4p9A3jpVOZ5ZvmJVC4Azc4FueID1cfUoObqaIV8tEoWNC/4CY3tj+55trS3/X8hH8Sp@nongnu.org
X-Gm-Message-State: AOJu0YzeTr1tV/FDj7TNQ8f2RFNsF9Tc0seP/MQv4M3GvTYWLV1+vQiA
 aGmY+OsCGPd/H+BONr0B/OIMJQGc8UQenM1oPEbbm7Rk2iWdgSaZRwrM2rr0MQQ=
X-Gm-Gg: ASbGncsFkks8LoO4BE+5mez53A3tHqFM7R8jiDtgw+pvS1zLKxoB6AAuqc8QFcyWJN+
 8UxasMdDstVWLpZAqDShboKzELq2+SMpVdm+vxumD0rf1o5aCo9mmq9nCzdwiGQVp7aYlyfeMnW
 dFIfQDFo+lrH9I1mwtAjbCfwYmz8QT3MabjdTJeEa4+ghXSMX7ByMHr33zm6IIlyMKnnpIWtP/s
 goQC/ER/QPCy9MMBAPdl5y3eOKBkm5BN/bQOA/Uo5y9ffo07cLdhi09AujymuU=
X-Google-Smtp-Source: AGHT+IHA9vtbr0P4IreN1YX/AbYBkTzpYP3pdOIuSMVgaQNrBBbMTgHkCbedMJHK9yW1GxhRiPI7+A==
X-Received: by 2002:a17:90a:d44e:b0:2ee:5958:86d with SMTP id
 98e67ed59e1d1-2ef011ff67emr5701689a91.9.1733260069193; 
 Tue, 03 Dec 2024 13:07:49 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef2701def5sm1184a91.31.2024.12.03.13.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 13:07:48 -0800 (PST)
Message-ID: <6fc9ff3a-28e0-4a0c-bea1-f210f845f224@ventanamicro.com>
Date: Tue, 3 Dec 2024 18:07:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: Include missing headers in
 'vector_internals.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20241203200828.47311-1-philmd@linaro.org>
 <20241203200828.47311-2-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241203200828.47311-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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



On 12/3/24 5:08 PM, Philippe Mathieu-Daudé wrote:
> Rather than relying on implicit includes, explicit them,
> in order to avoid when refactoring unrelated headers:
> 
>    target/riscv/vector_internals.h:36:12: error: call to undeclared function 'FIELD_EX32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       36 |     return FIELD_EX32(simd_data(desc), VDATA, NF);
>          |            ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vector_internals.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/vector_internals.h b/target/riscv/vector_internals.h
> index 9e1e15b5750..a11cc8366dc 100644
> --- a/target/riscv/vector_internals.h
> +++ b/target/riscv/vector_internals.h
> @@ -20,6 +20,7 @@
>   #define TARGET_RISCV_VECTOR_INTERNALS_H
>   
>   #include "qemu/bitops.h"
> +#include "hw/registerfields.h"
>   #include "cpu.h"
>   #include "tcg/tcg-gvec-desc.h"
>   #include "internals.h"


