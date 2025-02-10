Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B83C0219D
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:11:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc0D-0000ly-7P; Mon, 10 Feb 2025 17:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc0B-0000kt-Qy
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:11:39 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc08-0001Aw-Sy
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:11:39 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21f4af4f9ddso55428965ad.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225495; x=1739830295; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W5LEXqAUgggiukX7b7gmDPOVaASqTo18usIG3BlbuxE=;
 b=S/xjkv8sd4MHiA80cZ/3gt6fsQDLLaMiHcm4UUYEye+eZfbwWAXdIzzL2wBCZPsnII
 Sf6u6K9AhdBwKwqQhcqui1lu6DVNSUg045FXgqvjHuHb+Z4s9QKfSxdv7GcJZHmetdVe
 VJDFf4ywIM7OFPByzey/nQR4XuR4zAkxcJ9S66JCcMZ+WBUq5mNx1AP0R/WUZgG8gpT7
 4zAoI/+R+KZdirXbAC9UzNIjAYA2q+tMJfwzwcUsd1yJnixZ2Ghpf2xmASy8PQLxh9o1
 WQyD4MTec/NsJWh1lqpcdfKVVxjADvNms5OP4SWwKfJXL5IuWePv+e1ttcKenbyfQkMw
 uV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225495; x=1739830295;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W5LEXqAUgggiukX7b7gmDPOVaASqTo18usIG3BlbuxE=;
 b=WtegGX9XCDXV6kL7jz/TXn2o9lBuW0VhEHkwHC4OvU3JWajs7YNDzI9peu/gQ1l9i7
 6lkWInLmZ5Eo56A1yABa+3H6n3b3/yKYdy/DBgzpWuBrENYbNkoGGdrYCfIIH3fqEGLU
 Zx9yHMaSSIpW3u3I5dXmgZfjEepHf5gaeR+DttjkY7Xu1HfNX6xRGnO8FXpJldhQFLiw
 8RwRKzuhfwNeylrUQ+9RGReyrTQfM3hORJfJj/1SRV4hGJK+3q6tvt3Jzb9M3f5Vv0yI
 6oILxeZriZf/CrExJ9uFLkSBwPfDes8mw59FNj3EItNBBcJIBiRxzSmIMO34ayKP/LZP
 ykTQ==
X-Gm-Message-State: AOJu0YzBo5Fu4EMVswmGaCpvcCe+AcVJi/RAE1g8106yDXzoZYwyp6lb
 VmV4U2bTOjtfNF9r+g18d9Ftv8Iz1dnDLFeWzuvDTXqk08ogOf+ZM2IjBietqc8=
X-Gm-Gg: ASbGncvnL1GxzyIkOBJZ4hM/W5CC4OZ4fW85SESav2bsV4N/s5uXZ2t0U4VY+SqKxjQ
 8lHYHnJCX+t3yE0KyLBZanCYKQ22PPKfzfpA9CVZlLjkJoz5tppwso2F31ppKoRUB3DPBCZeBaz
 mOUROTzfR0XNkhrSdaQ0bRTY/CU3ahidHAnvi34iOwK2F/uBgpHHE9HmkyhgV/G079V0VSuTFdn
 f4l9dyZDA9nNfNQSqrsRijG2oAJSNfQQAgx/fHAMpTdbr7NrS/JKvPCLwrSGZOXiHpfEI3l8M5M
 4qehEpaSn0GsAVEVk16Wy+aFme3ve+vonY4v9U4pLDUdE9RGwV0IcDA=
X-Google-Smtp-Source: AGHT+IEa3z/aXqLerEU1HqCuwV/2AGvpB9rOaqlB+uZTPQbr8kv7QaxZ2QcFy/zRmkhi4hL5AEut/w==
X-Received: by 2002:a17:902:f78d:b0:21f:68ae:56e3 with SMTP id
 d9443c01a7336-21f68ae57dcmr174467065ad.39.1739225495399; 
 Mon, 10 Feb 2025 14:11:35 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653cac5sm83914835ad.76.2025.02.10.14.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:11:34 -0800 (PST)
Message-ID: <7c75da5c-4c91-4a06-a7e8-ea5ab5fa4398@linaro.org>
Date: Mon, 10 Feb 2025 14:11:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] target/microblaze: Set disassemble_info::endian
 value in disas_set_info
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/microblaze/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 13d194cef88..27089e3c579 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -224,6 +224,7 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
>   {
>       info->mach = bfd_arch_microblaze;
>       info->print_insn = print_insn_microblaze;
> +    info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG : BFD_ENDIAN_LITTLE;
>   }
>   
>   static void mb_cpu_realizefn(DeviceState *dev, Error **errp)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

