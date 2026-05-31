Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10CBCD6E57
	for <qemu-riscv@archiver.kernel.org>; Sun, 31 May 2026 22:13:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wToOw-0000mU-VT; Sun, 31 May 2026 18:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wToOv-0000ln-0L
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 18:12:57 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wToOt-0007D1-2L
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 18:12:56 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49048e043e5so74176165e9.1
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 15:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780265573; x=1780870373; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oWF6tyr2CYayU1PYtFJKATyY4aqFNfuk6d6waCisXn8=;
 b=p5A7o4MyfdCyht6MD9H5oG9X/wm2s8A34MvxiHeOia9xjxScHMLcBuQh4hBtmhLZrw
 idkfCvid9gRQrlGXVzkzNCDsO8sR8i4JhlCtGkytPng1zXp+eezoNMH2uiR57VS2HpCh
 w7yi7te77YvF3iK3q726g7+34Um9XzeS+f1QQWDYIBcCPzYYE9rPCHOwNRvkl3MXSK6a
 KG9lN33g4dJN94sCrKWotp0g/0/16BIs9hMD3SNljycoyFWuzGl44MzxpI5u1i35Z623
 RxnT7OkoOej4lvA+zHD5BAs+CdTvWhI3sNQvjrSQjCoho/b7KzuA8miMUgzEUkcxwBlU
 W9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780265573; x=1780870373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oWF6tyr2CYayU1PYtFJKATyY4aqFNfuk6d6waCisXn8=;
 b=AMYz9GA5Jf/VNK0pY7Zy0pp9proyi6IP2eJGvoEj/Zn22kw0M9PJawP64G7dUVyra5
 Wz5mf/o/WdKxMyNfsCJanKh9mfa5WtfWTCQe1G/1ExJaRr3LLSyJ1ACNA36y/eM32iC0
 F/8Fhc46edg0CLIPUmtDhhjgxUWtT8dCJrromPwyYQBv12ItQGJwVFTOwIFiDohtEpQ8
 vhqgpluz4X6T7IsP1cD1V8NfVxTgwx6mYrtcal+2wWzUbQeUjKYdQCItAEDCIjgkEk0f
 V2w4laUQHIarzS0UdQH7Dh7AjclxOJv6XXK98Vc6SiCL0DmKA6AURcumj1cI1Wcz9nVP
 urog==
X-Forwarded-Encrypted: i=1;
 AFNElJ9GThcY2c3aPePgkiVYL3NFodNm2M4KzFwl7glVahHsyNZ8RsKhbVu3GLF5MBxBYme4FvzQAMEicZ/H@nongnu.org
X-Gm-Message-State: AOJu0Yy2D4QofNpqte0rSx5iAlPAZLmV82Buzn5jCDXDB32a0vE5bb7l
 7Es6dRtd1MUp9gwmD7qW6Swm6x7gSkglQEAEnf1wM9+XyNy+lx+WfzmwyTFUyWaaBmI=
X-Gm-Gg: Acq92OHgAAkjR9q4QVmTqL08ZCTaCFgRsKIJM6i7jdrBpPVpYcSMXQLXOGCUfPBmkdV
 pv3aRKSJfOZNp8fEwDmVHXlW4SSCny6qgE0DyU4jHAEvMbbmiMYsw3PMTNSJ6a6VsDIcKXB1W2D
 mpV1mLXIRhmDFwvV2WoHgFLi0VeXY2IZ735PPbk01UT62hSXEyXL02VrCc9I/G37/KQAy85MZWY
 CIy3x4jJ2NZuwllAHOv0Uy8hPcI3QDNj4jbFX8TKRcMKmIkdpfoX/1MVSWiCUoDtSJSE4Jndim0
 e2VvuIk3M9vsHLvc4MjqrtG4QDz4h1ulbeQis6WC9ydVANlewndjTPSLNB0HOrV4Np0tUii6XgF
 msS7x0pbN35LRZ/mQod2L1T17ubwGMtdobVjSbHTq1uRp99aG2owigKJuw/6f/4LFYwIsb+XanW
 cGPQC0kD0JEGB6Qho0YxctZdCm0fGFE1D/gwdViBPAHPF2rLu6HPtoVECdKg5twhKn+rpoaV3mX
 6YF
X-Received: by 2002:a05:600c:6d2:b0:490:5368:743 with SMTP id
 5b1f17b1804b1-490a2946a23mr100294545e9.32.1780265572879; 
 Sun, 31 May 2026 15:12:52 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c123406sm82118745e9.5.2026.05.31.15.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 May 2026 15:12:52 -0700 (PDT)
Message-ID: <b8f40cca-2646-4912-8aa6-43442eab4f31@linaro.org>
Date: Mon, 1 Jun 2026 00:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] accel/whpx: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-8-philmd@linaro.org>
 <8889E557-72CA-4DED-B06E-4D82135CF923@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8889E557-72CA-4DED-B06E-4D82135CF923@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 29/5/26 21:03, Mohamed Mediouni wrote:
> 
> 
>> On 29. May 2026, at 16:24, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Register the new AccelOpsClass::cpu_instance_init hook.
>>
>> ACCEL_CPU_NAME("whpx") TypeInfo is now empty, remove it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> accel/whpx/whpx-accel-ops.c |  2 ++
>> accel/whpx/whpx-common.c    | 17 -----------------
>> target/arm/whpx/whpx-all.c  |  1 -
>> target/i386/whpx/whpx-all.c |  1 -
>> 4 files changed, 2 insertions(+), 19 deletions(-)
>>
>> diff --git a/accel/whpx/whpx-accel-ops.c b/accel/whpx/whpx-accel-ops.c
>> index b8f41544cbe..099e8ef6da3 100644
>> --- a/accel/whpx/whpx-accel-ops.c
>> +++ b/accel/whpx/whpx-accel-ops.c
>> @@ -98,6 +98,8 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, const void *data)
>>      ops->handle_interrupt = generic_handle_interrupt;
>>      ops->supports_guest_debug = whpx_supports_guest_debug;
>>
>> +    ops->cpu_instance_init = whpx_cpu_instance_init;
>> +
> Hi,
> 
> No whpx_cpu_instance_init implementation present in the commit
> as far as I can tell.

You exposed it in commit 4610fee3242 ("whpx: reshuffle common code") :)

> 
> Did you miss it? Other than that things look fine and a stub implementation
> should be okay.
> 
>>      ops->synchronize_post_reset = whpx_cpu_synchronize_post_reset;
>>      ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
>>      ops->synchronize_state = whpx_cpu_synchronize_state;

