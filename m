Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAEHp-0002KR-8p
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 13:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAEHm-0002Jy-Ca
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 13:02:46 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAEHk-0004kJ-HX
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 13:02:46 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-14fb7fdb977so9585444fac.12
 for <qemu-riscv@nongnu.org>; Tue, 27 Dec 2022 10:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wi7AVxtyW0cd4Gk5rlIqP9ndCzIoUxCVo/GTIWBQF4s=;
 b=nfYkfI7iefnNSgjKJjdpkGXlhpX0OAF8W88J3CwP8Og34bK6lDIQ9YzwZozCKKcYjr
 56h28CDTz9ak89w/yrtK/iS3Pqk4TNtPQqCX+klYpC/C9clc8VvOKJpUyVAp70z6EAxd
 vYCSuAqKbKMC1C2t3qHfoJqpkHaNYW8FPudx9sN2alsEejVfXADmER52QNec8at1ECv8
 11xgzqNSMTNHvE5j9L7V7tzBsOB3ytUm+ycdP5ffBsYn3tNpMaJZYxpmegxPh/+7HHr7
 GJmaRAW+Xa56C2cFIaSw1INJnWdaaOSBtMe2CvoM/C0l1ga8jmlGVJoXcdmsKkSbUcmJ
 Zqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wi7AVxtyW0cd4Gk5rlIqP9ndCzIoUxCVo/GTIWBQF4s=;
 b=W9ykD//BSsO/ClJFI9S1CsaMBhbSmvdWm+hE2Qws4D6el15k76rLYCJQWdbxPHkCGQ
 zMhVP3suL78nfGXBkAXgT+82RkC8cTFFN/j8cV4rCuN+z7U+2a27VhmEeCAihMqM/ugy
 Kz3lmV6P/so4fjYSnit1LNKQa3QQSRPtankdBdyYqCz0VtAYp7bU+tcUH++nQ65iHxcs
 GVdseC7JkFdq7Wrjb93p/hzSqaoPtmU5UIiBzt/cXk3uj3l5nOCFdq6VWKLJ1D5MoqJ+
 lptkd/Ijia8lYcj/aGoZLezarXjqjwBC4qtqp0r5Pe8V0hz9AEehGl3QuMiakEaSSQzg
 r4zw==
X-Gm-Message-State: AFqh2koVLRnqbQTPkCUHkP7yp7jyEatu5GHbfUPCM2FDvc18tGAF+K4i
 yYPRf+ytvVs+zvd/RjnFwiSZEw==
X-Google-Smtp-Source: AMrXdXvV3DjNvteAOW1//kinpVFmTD/pvrgozxdAudrGQuDnxor0Fzk/zVooFP7B/VOIyPbLOd8wjw==
X-Received: by 2002:a05:6870:2f04:b0:14f:f0a0:fc59 with SMTP id
 qj4-20020a0568702f0400b0014ff0a0fc59mr2417008oab.25.1672164163027; 
 Tue, 27 Dec 2022 10:02:43 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a05687073cf00b00144bb1013e6sm6441681oan.4.2022.12.27.10.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 10:02:42 -0800 (PST)
Message-ID: <ba1e50bd-9f1b-7d5c-e09a-980de870d70d@ventanamicro.com>
Date: Tue, 27 Dec 2022 15:02:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
 <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
 <c8c87014-0c50-1649-2889-fa54a6110c19@ventanamicro.com>
 <CAEUhbmVPt2uN-=OGg6qu2HVAm1zc83hO3MpAbnQsBnTAOm1YYg@mail.gmail.com>
 <CAAhSdy1hhpzCpDJzMki7Rcd1Uu3gB2GFWyatbNFNNQMj-iHj1A@mail.gmail.com>
 <CAEUhbmVEtPaHrOt2RWEad6-SA4Qwtd+Xe4Lir78t86N5GR2Q=Q@mail.gmail.com>
 <CAEUhbmUJ8ViH-mVYZX6BkkWrgTMjH2meYg0=S8O=86N0YK-q-w@mail.gmail.com>
 <CAEUhbmWRpX1iAuGO95ixQg3AS+Q0aw-+hAPbYsJaqcVtOmNj6Q@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmWRpX1iAuGO95ixQg3AS+Q0aw-+hAPbYsJaqcVtOmNj6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Tue, 27 Dec 2022 18:02:46 -0000

Bin,

On 12/26/22 10:56, Bin Meng wrote:
> On Sat, Dec 24, 2022 at 11:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> Hi,
>>
>> On Fri, Dec 23, 2022 at 2:25 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> Hi Anup,
>>>
>>> On Fri, Dec 23, 2022 at 12:56 AM Anup Patel <anup@brainfault.org> wrote:
>>>> On Thu, Dec 22, 2022 at 6:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>> On Thu, Dec 22, 2022 at 6:47 PM Daniel Henrique Barboza
>>>>> <dbarboza@ventanamicro.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 12/22/22 07:24, Bin Meng wrote:
>>>>>>> On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
>>>>>>> <dbarboza@ventanamicro.com> wrote:
>>>>>>>> This test is used to do a quick sanity check to ensure that we're able
>>>>>>>> to run the existing QEMU FW image.

[.....]



>>>>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>>>>> How about testing riscv32_spike too?
>>>>>>
>>>>>> I didn't manage to make it work. This riscv64 spark command line boots opensbi:
>>>>>>
>>>>>>
>>>>>> $ ./qemu-system-riscv64 -nographic -display none -vga none -machine spike
>>>>>>
>>>>>> OpenSBI v1.1
>>>>>>      ____                    _____ ____ _____
>>>>>>     / __ \                  / ____|  _ \_   _|
>>>>>>    | |  | |_ __   ___ _ __ | (___ | |_) || |
>>>>>>    | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>>>>>>    | |__| | |_) |  __/ | | |____) | |_) || |_
>>>>>>     \____/| .__/ \___|_| |_|_____/|____/_____|
>>>>>>           | |
>>>>>>           |_|
>>>>>>
>>>>>> (...)
>>>>>>
>>>>>> The same command line doesn't boot riscv32 spark:
>>>>>>
>>>>>> ./qemu-system-riscv32 -nographic -display none -vga none -machine spike
>>>>>> (--- hangs indefinitely ---)
>>>>>>
>>>>>> I debugged it a bit and, as far as boot code goes, it goes all the way and loads the
>>>>>> opensbi 32bit binary.
>>>>>>
>>>>>> After that I tried to found any command line example that boots spike with riscv32
>>>>>> bit and didn't find any.  So I gave up digging it further because I became unsure
>>>>>> about whether 32-bit spike works.
>>>>>>
>>>>>> If someone can verify that yes, 32-bit spike is supposed to work, then I believe it's
>>>>>> worth investigating why it's not the case ATM.
>>>>>>
>>>>> +Anup who might know if QEMU spike 32-bit machine works with opensbi
>>>>> 32-bit generic image.
>>>> We never got HTIF putc() working on QEMU RV32 Spike but it works
>>>> perfectly fine on QEMU RV64 Spike.
>>> Where is the problem for the 32-bit? Is it in OpenSBI or in QEMU?
>>>
>>>> See below log of QEMU RV64 Spike ...
>>>>
>>> If we cannot get Spike 32-bit to work in QEMU, should we drop the
>>> 32-bit support? @Alistair Francis
>> I got a deeper look at the 32-bit spike issue and I believe it is a
>> problem of QEMU HTIF emulation.
>>
>> I will see if I can spin a patch to fix this.
>>
> It turns out there is a bug in OpenSBI too when booting 32-bit BIN
> image on Spike.
>
> For ELF & BIN image boot on QEMU, QEMU changes are needed. I will send
> the QEMU patches soon.

I reviewed the QEMU patches and sent a tested-by ack in the opensbi fix
as well. LGTM.

As I commented in your QEMU patches earlier [1], it would be good if we could
have an opensbi 1.2 rom with the fix already applied. If that's not possible then
what we could do, w.r.t this patch, is to add the spike 32bit test with a skip note
mentioning that we need an opensbi update before enabling it.

[1] https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04414.html


Thanks,


Daniel


>
> Regards,
> Bin


