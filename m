Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F87C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 05:20:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyQ7g-0000nk-Df; Thu, 02 Nov 2023 01:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyQ7e-0000nR-Il
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 01:20:02 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyQ7c-0003An-QL
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 01:20:02 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6c10f098a27so536895b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 22:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698902399; x=1699507199; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dhbydLOcj3zngR1aYMACDltyDc1DBgfPBPjexoUEU2E=;
 b=iuA0d9tddunbbkwIp2w4eiYvjh8Poxnu61lD8QsA7WZWx0J71l5y9fv3ls8bYdL6mX
 LwSianCBm3N97STxh5+EkQcUDm/kBwMi6CzMtkdQeW6rTc3/s+Rgv4/SNVS0weTWAh4e
 kui5XQdYp2YGzL0idqUGEu+uXuaFlP5UtOTsO0BoG5UqUUypTAI0zuyfHZ1IW6BJAcGi
 Q6PTyArajrqE71WXjgQYiSNteMsv7ikF6/H/EURAML/O5EIL4pfbuTyfD+lk4hNYEb8v
 2taw2/wsHs8bm61xML78czhk3VPFkIakp3OJlBwmAxO48JxhESFvNor1lCC9bIbHPpdC
 E5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698902399; x=1699507199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dhbydLOcj3zngR1aYMACDltyDc1DBgfPBPjexoUEU2E=;
 b=DhzIP6WMfvmEyVVk4rAZI1b3bsadSb1EAoPQDSA+CwuwXhC/sK8clC0vaoPs/Xn0DY
 VQezj01KYDUqxkpyGrUDfz7BJSBoEwLRXnaNcX+ABAvkcsvEw5r7j0PLQRTMobb43AWe
 U85nG4QexhsJuo8SnKCR/WGsCQ7iWLAPfBEhbhHb96hJ+th6isDNTaYd7+tuzbUdVGAN
 xlHtTPajqSDol+CVGtCqDZNEMXwhIf2UHMnr2ojZulkZCYtA0HKkiVC3F+l3D8x38gzj
 ErkPaj/3WwwMhF31PTuMk5rp/2BqXzqUo91enwVohbRKnYno+wlMxtL9ptKT+XbHDfNf
 aZZw==
X-Gm-Message-State: AOJu0YxMdpT5RNjiAaPt55tkzPFVSS/YU/xAwvw+/+NtOIJLQLVPIF0r
 Gei8vKPMZS1S8Ahq6MMMZAopMA==
X-Google-Smtp-Source: AGHT+IHb2Zyh3dKCrHALo56zpzcVuLmKDNuEejwHCrAV2xbcHpBsPtConA5oGnpCXR32F2N3U3tm8A==
X-Received: by 2002:a05:6a00:c8f:b0:6b8:780:94e5 with SMTP id
 a15-20020a056a000c8f00b006b8078094e5mr18323332pfv.18.1698902399219; 
 Wed, 01 Nov 2023 22:19:59 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a056a001b4100b006bda45671b1sm2028579pfv.101.2023.11.01.22.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 22:19:58 -0700 (PDT)
Message-ID: <9396b822-d319-4259-ad95-d01838a59105@linaro.org>
Date: Wed, 1 Nov 2023 22:19:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 33/33] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-34-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-34-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 11/1/23 17:25, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it
> by ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/riscv/shakti_c.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index 12ea74b032..fc83ed4db4 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -28,6 +28,10 @@
>   #include "exec/address-spaces.h"
>   #include "hw/riscv/boot.h"
>   
> +static const char * const valid_cpu_types[] = {
> +    RISCV_CPU_TYPE_NAME("shakti-c"),
> +    NULL
> +};

Why are you using a different form here...

> @@ -85,6 +83,7 @@ static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
>       mc->desc = "RISC-V Board compatible with Shakti SDK";
>       mc->init = shakti_c_machine_state_init;
>       mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;

... than here?


r~

> +    mc->valid_cpu_types = valid_cpu_types;
>       mc->default_ram_id = "riscv.shakti.c.ram";
>   }
>   


