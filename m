Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40491D5CC9A
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 11:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t66ty-0006dt-DM; Wed, 30 Oct 2024 07:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t66tv-0006b6-LM
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2024 07:30:12 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t66tu-0005tV-1P
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2024 07:30:11 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so7309939e87.2
 for <qemu-riscv@nongnu.org>; Wed, 30 Oct 2024 04:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730287806; x=1730892606; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m8Q8GJcopYW0R+JNnylDaPfRMSamiKCalUke1lDKgP4=;
 b=U7nDNas1zxNu7wxZzOBMe0HOPkNcFFDNLzjFNtOrbbb9O1n0hLx+ICCju2LwNCILFq
 isR2uHK1WRv1QY7bL1jSGGX0RbjppYWQwWv4YWTYL3KY7mfEnrwHdvRIqz7Mldyzuw6z
 r13ool5YJZ6lGrzkD4PqnQmwneJrXyFoDwV01k9PUHo3fa2LBXYyowCz1RHu9QdAdAKb
 IhANfi/GrR/L/rRiGVYhu4t1taD44zO/TUPzYLXBcRxoHyVz7tv/lZjUWqC9RVq4ecJO
 trvOr3dXDJOG/MnbU+uTtAZpee5CVqFNv4c85jBVyBmUyCteZLugsVCcoQkxr0svE4uS
 Xy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730287806; x=1730892606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8Q8GJcopYW0R+JNnylDaPfRMSamiKCalUke1lDKgP4=;
 b=Jy/TfpAreEqDDyKcvchjb/Ggs29Pa6KYVquDAeQa6X/1PtsrNtM3GdZZr92xHTvZdg
 zVjUUDAzvN4L11zoVjc095AH5h/X92F4WWQlItJc1mCMzNp6I17S2R0/O8f5dQ1O7ZEW
 B2vMMjxySMwqfJZFXVLlw9jSvR2qwKzzDNXk2vh0cN+8zh7G29vZZLZ30wMlt6JJXfXl
 bYXVuloujVhUBW5YP6d6mLcdkj+jbSnw4Xn00YgEXpOSN4+43WX8pGOtkD0OVMGyzui6
 2DpW/IWqWFSTPjMoi8++ywLl3jusXJDjgH/E63LfTzSGf4bpjTXMTPB0kzQXb9KHlILS
 sX+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo8uPxfspntYhwSVssNznyM4Su3znUMnkmrpWCoKaf1q+86tGXezMRH1hNWDuTiYL6AkiMSmv31U+L@nongnu.org
X-Gm-Message-State: AOJu0YxBYcrrv6NY8So030V4deAZ4VQxZuCt2Vi2Obw58gFKUNji1YDB
 1g+ahIkzlvQJrrMTZsU0M2stiQrEJx1tVMLZaMI1kPsZ1YrG9AwgfXhTNmjhxaM=
X-Google-Smtp-Source: AGHT+IFdWAj6rDNW7xD4+y2D9zW/bs86OmWLCOLX/fFd3Ikc5q69IbCeU7Z6J8DImi8AnPOz/pnarQ==
X-Received: by 2002:a05:6512:23a9:b0:536:55cf:3148 with SMTP id
 2adb3069b0e04-53b348deb93mr7469074e87.31.1730287806162; 
 Wed, 30 Oct 2024 04:30:06 -0700 (PDT)
Received: from [192.168.21.227] ([89.100.107.89])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9480e5sm18553865e9.16.2024.10.30.04.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 04:30:05 -0700 (PDT)
Message-ID: <1d19909f-53be-4e70-8b82-4dafd6da206d@linaro.org>
Date: Wed, 30 Oct 2024 11:30:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] target/riscv: Set vdata.vm field for vector
 load/store whole register instructions
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 negge@google.com
References: <20240918171412.150107-1-max.chou@sifive.com>
 <20240918171412.150107-2-max.chou@sifive.com>
 <8c09e7cd-cecc-40bd-be6e-6043c8f7592a@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8c09e7cd-cecc-40bd-be6e-6043c8f7592a@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12b.google.com
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

On 10/29/24 18:58, Daniel Henrique Barboza wrote:
> 
> 
> On 9/18/24 2:14 PM, Max Chou wrote:
>> The vm field of the vector load/store whole register instruction's
>> encoding is 1.
>> The helper function of the vector load/store whole register instructions
>> may need the vdata.vm field to do some optimizations.
>>
>> Signed-off-by: Max Chou <max.chou@sifive.com>
>> ---
> 
> I wonder if we should always encode 'vm' in vdata for all insns. Seems like
> helpers are passing 'vm' around in the helpers ...

The intention there is that 'vm' is a constant within those helpers, so the compiler can 
fold away the code blocks.


r~

