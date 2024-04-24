Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B019C10F15
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 17:54:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzgpH-0001cE-Tk; Wed, 24 Apr 2024 13:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzgpB-0001bM-A4
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 13:54:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzgp8-0007LJ-U5
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 13:54:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so67627f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 24 Apr 2024 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713981265; x=1714586065; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z3P1jKumN/2f0w+S1BnkZarrfCBd03HH4eddYEKpnIg=;
 b=UGWWk4wO4h6vdW1RzVKXKb7X4NSH4lxw1wUu/Zf8xOyNAe1R8017zmtAsMHChOE42o
 kkbY43FijOzTde4Njk+3fu8XY7ladI9ExjTVKojnl9CtdGxdy2Z4zKzxYykv4SVDkbPw
 AvtmkNr7GF60nyspX1c+Xecmz4m0N2oDqReCD3HUH6jOFfhu1NDJjqR0Hb3ASggOZrpn
 ML7gZQp9HFvblAn46eT/49jWe7kEA++Gz5Zq62km0JM4HKEauXhQGBtXUAFyj7WJuDo5
 D5eWtIJTsWHNTq5YE5U+azSS2Bt0WCg+Ixuxzt0GdsKKMVQdTkfrK6/N+V/wHO0+aK7B
 hong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713981265; x=1714586065;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z3P1jKumN/2f0w+S1BnkZarrfCBd03HH4eddYEKpnIg=;
 b=mjmBZq8kdJF0iXXR2jzNh/Grofd9K4JjJRMhTRyOuoaX2JKTB/Q8rtrDAsb6BKlZcB
 R6Wtg3zLBnUZO400h6Q6yzJgTUOliN+50b/Z2+BOI4WNUoGJ+ifgBVWrVAe84bj7hZ8u
 hQAXrtc3l/7XeeBDpuJKsqwjnHrb2dETzY/t7Xd5XL3zmFfMTjGHewKpL1S2fhT/urYc
 LWaL+BCoHqTcL89RsWWMJy3I0Z/RIvIxhDzPKX4iZTdDEGk3N2rASLnJsk+NZ2PlHaXu
 CcpHaABd2wbIaiYdh+hrzMcB6viFotd8I3G/uLGRCTQm+P+z4kIFAR1HV6t9tXAZzVRP
 0dTQ==
X-Gm-Message-State: AOJu0YyfsSeBoiXpb0PrFFQNy37XK72aLKqtFnPR5vvsu4cuQgzhHPj8
 7EkumJCBcgKBCvbEQSUOg0aVlBmLDMaRl+huC6BA5FMpwrWOQa0jtuVzfO5ZnHo=
X-Google-Smtp-Source: AGHT+IFmIodfRftbVOhvB2rYpm7nOqzp1jhLDBa+AeynyBeo/vuHfmY814JY+lmYeHpY5XtHdnoPCg==
X-Received: by 2002:adf:b11a:0:b0:34a:4e2:7014 with SMTP id
 l26-20020adfb11a000000b0034a04e27014mr2182476wra.35.1713981265284; 
 Wed, 24 Apr 2024 10:54:25 -0700 (PDT)
Received: from [192.168.1.102] (mon75-h03-176-184-51-42.dsl.sta.abo.bbox.fr.
 [176.184.51.42]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d684c000000b0034aa1e534c2sm12314832wrw.96.2024.04.24.10.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 10:54:24 -0700 (PDT)
Message-ID: <409f547e-fdab-4183-8f9a-9852f9be34f6@linaro.org>
Date: Wed, 24 Apr 2024 19:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv/kvm: remove sneaky strerrorname_np()
 instance
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 thuth@redhat.com, alex.bennee@linaro.org, mjt@tls.msk.ru,
 ajones@ventanamicro.com
References: <20240424094700.453356-1-dbarboza@ventanamicro.com>
 <20240424094700.453356-2-dbarboza@ventanamicro.com>
 <82079170-9d82-46d5-81e4-44d3b38b551f@linaro.org>
 <a619f516-d174-428a-aa19-52664282265b@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a619f516-d174-428a-aa19-52664282265b@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 24/4/24 19:18, Daniel Henrique Barboza wrote:
> On 4/24/24 06:55, Philippe Mathieu-Daudé wrote:
>> On 24/4/24 11:46, Daniel Henrique Barboza wrote:
>>> Commit d424db2354 excluded some strerrorname_np() instances because they
>>> break musl libc builds. Another instance happened to slip by via commit
>>> d4ff3da8f4.
>>>
>>> Remove it before it causes trouble again.
>>>
>>> Fixes: d4ff3da8f4 (target/riscv/kvm: initialize 'vlenb' via 
>>> get-reg-list)
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   target/riscv/kvm/kvm-cpu.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
>>> index 6a6c6cae80..ee69ea9785 100644
>>> --- a/target/riscv/kvm/kvm-cpu.c
>>> +++ b/target/riscv/kvm/kvm-cpu.c
>>> @@ -1054,8 +1054,8 @@ static void kvm_riscv_read_vlenb(RISCVCPU *cpu, 
>>> KVMScratchCPU *kvmcpu,
>>>           ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
>>>           if (ret != 0) {
>>> -            error_report("Unable to read vlenb register, error code: 
>>> %s",
>>> -                         strerrorname_np(errno));
>>> +            error_report("Unable to read vlenb register, error code: 
>>> %d",
>>> +                         errno);
>>
>> Why not use "%s" strerror(errno)?
> 
> It's not exactly the same. For errno = 2 strerrorname_np() gives 
> "ENOENT", and
> sterror() gives "No such file or directory". In this particular context 
> I think
> just printing a "error code -2" is clearer because we're not mentioning 
> files and
> dirs in a KVM reg context.
> 
> But in the end I don't mind changing to strerror() if you feel strong 
> about it. It's
> fine either way.

I'm fine with "error code -2" ;)

Regards,

Phil.

