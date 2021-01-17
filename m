Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1BIK-0001WC-7S
	for mharc-qemu-riscv@gnu.org; Sun, 17 Jan 2021 11:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BII-0001S9-AW; Sun, 17 Jan 2021 11:52:50 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BIG-0003Fq-L6; Sun, 17 Jan 2021 11:52:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 7so6966083wrz.0;
 Sun, 17 Jan 2021 08:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xI3/9Y7+K+HjnEiO+qwtpvAyxBRJqQpFUUdFX8zyP2s=;
 b=QSiGg6uvH2ky7HpQlLu/hcWROsLGS7eMcxmAraFrPQHsBoDW2c1/nNphA2EIi2EsdJ
 jRMCCwZ4q8zQm5rjqm+cjNbSIrWv/ms7yNPioVZVmf5T/RAOjPjEpuO79g94ug9tqOvy
 gEG1DGCPY41q4T5ktXxtu+s+F/0fga8y5APCQCuadm8rJibvNEWzYdzVFheFajfbfZ/P
 UTMYN7q/8rGxFeO/w3FTQTdVP588leWFkEmb6tqNZqz+Qh9xCeZ+6hbPZZ8l/XLDbKRk
 X9cZJWlGVcJLVmTqejH9PPflNjw3c2xwMT0C60cy/OUbvYVvN9H47BzMXR2AknaaYoCd
 DPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xI3/9Y7+K+HjnEiO+qwtpvAyxBRJqQpFUUdFX8zyP2s=;
 b=bRfnFfPJpQQh1mAAHkYvZAuSgCpZdeXLzIKyOPyfHDOWEdZiKl7z4I/LUEWK/T7qM7
 yRF+u0q6/LgZL5pRq9BztVmgyma8DgRl+LJCkgIdH1P/fsNLLyH0x3NkisIeFFeFlMi7
 kN/Wpp50Yob0NBvINClApLtQ1dQ2BWXqWIQAiy+U1DGaxFHlqTMeCtXV1Cp5TVxT1AgC
 7FNS6YLpyuittcnQX4GFPep+8Z76bop4HSSWhKAC0e81202Sho8gzEmAahXduIV+vW6V
 87RFJq4jp2dEtCxJwEY/ZKKh8YpEdtux5+4dRNELame+nvh0aMpqnInY51A/0hjMPQj5
 Qa4w==
X-Gm-Message-State: AOAM531Jv1yUHpzgswaotkHokbKHWF7dZUfM1rowkMVwr56WfLL6Y8BD
 2GezKk1zYlAnzfk4IjeZ3r4=
X-Google-Smtp-Source: ABdhPJwg53u7Kpnyf+qvuCwZLTLl+CjTZEjLRpMWLJ7xwqDcwLRm+2OFlrjcFVHAQwFpHBKEO1D2hQ==
X-Received: by 2002:a5d:69c2:: with SMTP id s2mr21864655wrw.36.1610902366668; 
 Sun, 17 Jan 2021 08:52:46 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a24sm14426122wmj.17.2021.01.17.08.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 08:52:45 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
 <a566580a-ef30-0d2f-116e-1e3666f1187d@amsat.org>
 <CAKmqyKNvtuY2eaQHiM4YMKyy_bWAiHFrMan_R+7M_fw7=ioW=A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <31a5b411-66d8-87ef-865a-6b3d33d0a874@amsat.org>
Date: Sun, 17 Jan 2021 17:52:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNvtuY2eaQHiM4YMKyy_bWAiHFrMan_R+7M_fw7=ioW=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jan 2021 16:52:50 -0000

On 1/16/21 11:38 PM, Alistair Francis wrote:
> On Sat, Jan 16, 2021 at 2:32 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 1/16/21 12:00 AM, Alistair Francis wrote:
>>> We were accidently passing RISCVHartArrayState by value instead of
>>> pointer. The type is 824 bytes long so let's correct that and pass it by
>>> pointer instead.
>>>
>>> Fixes: Coverity CID 1438099
>>> Fixes: Coverity CID 1438100
>>> Fixes: Coverity CID 1438101
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>  include/hw/riscv/boot.h |  6 +++---
>>>  hw/riscv/boot.c         |  8 ++++----
>>>  hw/riscv/sifive_u.c     | 10 +++++-----
>>>  hw/riscv/spike.c        |  8 ++++----
>>>  hw/riscv/virt.c         |  8 ++++----
>>>  5 files changed, 20 insertions(+), 20 deletions(-)
...

>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>> index 83586aef41..acf77675b2 100644
>>> --- a/hw/riscv/boot.c
>>> +++ b/hw/riscv/boot.c
>>> @@ -33,14 +33,14 @@
>>>
>>>  #include <libfdt.h>
>>>
>>> -bool riscv_is_32bit(RISCVHartArrayState harts)
>>> +bool riscv_is_32bit(RISCVHartArrayState *harts)
>>>  {
>>> -    RISCVCPU hart = harts.harts[0];
>>> +    RISCVCPU hart = harts->harts[0];
>>
>> This doesn't look improved. Maybe you want:
>>
>>        return riscv_cpu_is_32bit(&harts->harts[0].env);
> 
> I suspect this ends up generating the same code.

If the compiler is smart enough, but I'm not sure it can figure out
only 1 element from the structure is accessed...
My understanding is "first copy the content pointed at '*harts' in
'hart' on the stack", then only use "env".

Cc'ing Eric/Richard to double check.

> 
> Either way, good point I have just squashed this change into the patch.

Thanks,

Phil.

