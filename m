Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B9C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:01:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNugA-0003VI-L7; Thu, 11 Jan 2024 08:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNufy-0003GE-QZ
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:00:53 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNufv-0002ue-MY
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:00:50 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d50d0c98c3so36895725ad.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 05:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704978043; x=1705582843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rFg1dNzVPnTCsOdeKSTg9W97fq3ju3xEU4cGnUvmmQY=;
 b=pX1jYTeIIa99KP9XtBtGyCp+iqD0j12ZESCQ5cVtvv3yvVFe5Oa6QJJxRuiGSWXq46
 Ppj75JNvARsp5d9PcrpLb5C9+E5dgW322B1uw7Q1mEAA4SDzaBLR/NtHFdxlc/Xn46V7
 q92Ecii0qO02eJdis6VpWlffGdf4EmGw94pAjKIZhEwtMIcwzj5tbz0xuQOtf5AhVGZC
 XWURLDaNlyR0s7c1mCT/dmBNLjWLhAQpz5jiUejtQA/AGy67i8imDc/wk2+ltXQVSyvq
 DKSFCD0Eb+iu/+3cERERSxEHtNyS4SDErWzQtZmYaZxq5cYlIc1LdbmptlxDYS+yXNjD
 aX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704978043; x=1705582843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rFg1dNzVPnTCsOdeKSTg9W97fq3ju3xEU4cGnUvmmQY=;
 b=qZz4gLcPLGmM7v71oLG+VwpVlHDbHPUAGfoTTwRu0veCQUqQLthy2qg6x5Iq3DEXOz
 8eh8zILihyEJvqs95JVDGYCyyLY2XyFDKtCdaE0gkctkwhNpg0+evcTMwJU1AVwfQYke
 tYluR60isSVvswv3KchCgcPSVLv8WzZ7i9SL9nw5KHUjco6+V74ixM/m664GXVIn+HES
 soK6t7Rjm8WqfZu+zD6qKIz84l5BlfipuGxsw6KUJtbYAwtyLYULO5Pvs9HemW1GF3PQ
 P9ouTDgHEdMAkvHqy+7iKD+MpOFNunBU+FR6ARcEH9a1z7VVBEqwEHVJhiYuaE3d/bBS
 Jveg==
X-Gm-Message-State: AOJu0Yz47+JY9hUxM7zEdNhr4DbjlXCzx6H8DBTeCZr+EjUdA38NOHrq
 vnxHlpGUxQnwFZXaTp7Zb5OEsFZYSlS5Rw==
X-Google-Smtp-Source: AGHT+IHKq5uz9HJ7tGNRly4fQPUPZks7QHK7eRejUxuKSvk+CAZt0w+2McbJtV6c1U6lMxiSVend0g==
X-Received: by 2002:a17:902:c40d:b0:1d0:acd4:e711 with SMTP id
 k13-20020a170902c40d00b001d0acd4e711mr1098588plk.15.1704978043272; 
 Thu, 11 Jan 2024 05:00:43 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170902c98b00b001d4c97a2adcsm1115031plc.108.2024.01.11.05.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 05:00:42 -0800 (PST)
Message-ID: <cfee5451-89a8-444a-b0a1-ac2035a66922@ventanamicro.com>
Date: Thu, 11 Jan 2024 10:00:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/core/cpu: Rename cpu_class_init() to include
 'common'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Eric Farman
 <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
References: <20240111120221.35072-1-philmd@linaro.org>
 <20240111120221.35072-3-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240111120221.35072-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 1/11/24 09:02, Philippe Mathieu-Daudé wrote:
> cpu_class_init() is common, so rename it as cpu_common_class_init()
> to ease navigating the code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/core/cpu-common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index 3ccfe882e2..67db07741d 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -273,7 +273,7 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
>       return cpu->cpu_index;
>   }
>   
> -static void cpu_class_init(ObjectClass *klass, void *data)
> +static void cpu_common_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       ResettableClass *rc = RESETTABLE_CLASS(klass);
> @@ -304,7 +304,7 @@ static const TypeInfo cpu_type_info = {
>       .instance_finalize = cpu_common_finalize,
>       .abstract = true,
>       .class_size = sizeof(CPUClass),
> -    .class_init = cpu_class_init,
> +    .class_init = cpu_common_class_init,
>   };
>   
>   static void cpu_register_types(void)

