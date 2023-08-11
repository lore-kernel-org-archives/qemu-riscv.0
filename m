Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C46C001B0
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 03:19:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUIfk-0005F5-4r; Thu, 10 Aug 2023 23:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1qUIfT-00059z-Dh; Thu, 10 Aug 2023 23:18:27 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1qUIfR-0004jP-Nv; Thu, 10 Aug 2023 23:18:27 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-565331f0736so1265081a12.0; 
 Thu, 10 Aug 2023 20:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691723903; x=1692328703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=du+BdA482G8F/vHOEDJ4RVicXsuWf5wwXoDJgI1QkuU=;
 b=f75NvvqYwEoTiC+l7V2ckIWI2ozc1Je3/L6F88dVoUD1oEPQWdJtCpRaPKCzXPxjJi
 mhUWI0RX7eDxCtdjGkzvuGeBrS22M76tOxOFsMqJAkg5sl9Yt2YYUuheguqdNkj8cr+7
 t12wU08Uouk4gxaoB9KOxrTSa9xzM2ya7Mp+z2dsE97aLTJR/tD01xBjObPnEYWdz5GU
 d5kebfv+uMusPAUa43BZJHmNMqLto1JB+FuDy+lLziG4+2epZOn7u9elNSGhInP631MJ
 +evF2pvU0Tuta7aux0duHxUVtShkJoHpeRa8/gWeewf1j56bjrfl7/GU9mcFjt9Ch3Xd
 wlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691723903; x=1692328703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=du+BdA482G8F/vHOEDJ4RVicXsuWf5wwXoDJgI1QkuU=;
 b=KxjEjsrLckepiBxPcl3rSs0ylZpWeLVCfMHZWZYE5SCMpJZjawnT1Ny+of9dozAV2T
 +E/ZNQTvVs+aBgxWJKecUYKN4cxILwBaaQfrVu5oUkx9TVZ02AKCxI+ZzZaTEg8v8Fpf
 8BqQRk8oYPBrLNOUUuMofhLVKgotcG5sco2StoJ64mE7nLlAxSYpbh0g8Vtq7upToSVo
 qLWxh40q45IHaafk4ikBhWSXtj2usasumEo8g9U2DO8L5CzFxFY8N8qH9msXHaqXd10P
 DipwYJpiWig+5bN/S/jdvYXuoHGKi53TXAWRh5cwwrD8WcBt56zm+0xIAptdDZFLwTDB
 AHYQ==
X-Gm-Message-State: AOJu0YzQgK4c9trkqSKC2h/uL8AQZxSxZZNsm2UtwFJSGA58evMKyjmf
 wNcKLcv0Ry0vuJC8YnIhNxg=
X-Google-Smtp-Source: AGHT+IG5vQYLNDaE1OY0ErdKfqAjTONK/VcD3QrTKsZDjTsF6VclALTNH6/hYc0YOS1UMOwWodbzpg==
X-Received: by 2002:a17:90b:378d:b0:268:51ab:a84a with SMTP id
 mz13-20020a17090b378d00b0026851aba84amr460173pjb.4.1691723903473; 
 Thu, 10 Aug 2023 20:18:23 -0700 (PDT)
Received: from [30.221.100.34] ([47.246.101.50])
 by smtp.gmail.com with ESMTPSA id
 29-20020a17090a195d00b00268385b0501sm4379975pjh.27.2023.08.10.20.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 20:18:23 -0700 (PDT)
Message-ID: <ff7a949f-e2dc-8936-70cb-e11703936ca2@gmail.com>
Date: Fri, 11 Aug 2023 11:17:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] linux-user/riscv: Use abi_ulong for target_ucontext
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230808093434.2059-1-zhiwei_liu@linux.alibaba.com>
 <64635d96-26d9-a00c-cf2f-aa92d7162061@linaro.org>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <64635d96-26d9-a00c-cf2f-aa92d7162061@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=baxiantai@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.156, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


On 2023/8/10 18:48, Philippe Mathieu-Daudé wrote:
> On 8/8/23 11:34, LIU Zhiwei wrote:
>> We should not use types dependend on host arch for target_ucontext.
>> This bug is found when run rv32 applications.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   linux-user/riscv/signal.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
>> index eaa168199a..ff8634a272 100644
>> --- a/linux-user/riscv/signal.c
>> +++ b/linux-user/riscv/signal.c
>> @@ -38,8 +38,8 @@ struct target_sigcontext {
>>   }; /* cf. riscv-linux:arch/riscv/include/uapi/asm/ptrace.h */
>>     struct target_ucontext {
>> -    unsigned long uc_flags;
>> -    struct target_ucontext *uc_link;
>> +    abi_ulong uc_flags;
>
> Correct.
>
>> +    abi_ulong uc_link;
>
> Isn't it 'abi_ptr uc_link' instead?

Thanks, I think abi_ptr is better. As RISC-V doesn't has similar ABI as 
sparc32plus(64bit long but 32bit space address). It is also right here. 
And many arches  use the abi_ulong for uc_link, such as ARM.

I will send a v2 patch.

Zhiwei

>
>>       target_stack_t uc_stack;
>>       target_sigset_t uc_sigmask;
>>       uint8_t   __unused[1024 / 8 - sizeof(target_sigset_t)];
>
>

