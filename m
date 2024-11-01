Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89483E6F075
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 18:13:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t6w98-0003uh-15; Fri, 01 Nov 2024 14:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t6w95-0003uO-LD
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 14:13:15 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t6w93-0004d2-OL
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 14:13:15 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-71e70c32cd7so1911289b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2024 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730484792; x=1731089592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cAKu0wkF5YvURGA1MdHdUzfmbg1T4fOQuynVkRQbW8k=;
 b=hwJ2rZ+dIsv+3mY0mc0mSs7IZITLY/ZCmAd70ArwYEUqDh3jRQG7pPnGx5Mx4LjUzQ
 dlYg/GtczewRpBnqJoDrjoG0Dzo8EWdtF8sf88cggW1CK5TpXp0GOP+/JngfseCgnEww
 f/Z63zf/crcLHMy56FOLN9fs4rUiD3JAaQnjaC4s0uOO9wlYyla4T0R4ErSbm2xVmvAX
 EE46jaElB6IjBFglmRX8lrX/hMD0Z0AN9iC5pMezcNajYeF0ax1M1SJ5BT0uREupd7XY
 m/ZhdU4dzqYIk47h3GdG1PWeh+8Qq0eCWO3OpMBq4oO/x8FjAr8FeWTtbq7BQ5Vfp/Cx
 CWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730484792; x=1731089592;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cAKu0wkF5YvURGA1MdHdUzfmbg1T4fOQuynVkRQbW8k=;
 b=PtNB/gxBDFvDiqgmXv58m+QBpkeW2s7f59eCnwQyNNfFtgBDGg3c6rFK3fMhP3AnBt
 P0R22KgNFKy5oeQ/f+0C0mCfBFeAMoDdQwdOUoa+ulpWTSy05U1cmNQUHwDOgKF3AivI
 BggDJ1lBBYYkhycftmIa2jdd+FQEdVQop0tNV9q88mjEGAzUMUMT4kQR8q65gkqfghxC
 sDADq068ex6LaM/iwecHVfQ0opD0k6xdvM1x6IXGMRwqxmgyLCnjgfGDvPpQDrI8ds+3
 Vss9I/pHCfOe9OUEE5/xIZZ+/uA9Ej+GO/0CTxQjir7LcO7oXgjOKG4xYa1nmUb5w/he
 hMaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3L7XuJBsCx6qcoTAWPQFe3SdiybVknI355MPdZqrlzUkz5snwgX+5EmMezXCMTWnQUHgFuP9ZD1P5@nongnu.org
X-Gm-Message-State: AOJu0YwDgPsR02BPhDtYJZNaC2rEeaKQW88flOFwgxa/wLXkG++0owGV
 RhSkQrGCCc6caoxZ8Zqpoq2q2JhqIt13AC398Cz0zVUknn1Cn3uNK3NBNbpTeKc=
X-Google-Smtp-Source: AGHT+IHszhqpTngwHTvVzv/NNNlCeyKiOjEHHfTICSbbF/thrbPp+Yfc7JggyCXWdL2krJ/uBer5dQ==
X-Received: by 2002:a05:6a20:d8b:b0:1cf:3d14:6921 with SMTP id
 adf61e73a8af0-1d9a84d168emr33118541637.35.1730484791626; 
 Fri, 01 Nov 2024 11:13:11 -0700 (PDT)
Received: from [192.168.68.110] ([191.8.109.222])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc1b8d2fsm2955951b3a.9.2024.11.01.11.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 11:13:11 -0700 (PDT)
Message-ID: <fd9ee34a-24e1-43fb-950b-aba585473085@ventanamicro.com>
Date: Fri, 1 Nov 2024 15:13:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv: fix build error with clang
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, John Snow <jsnow@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
References: <20241101170833.1074954-1-pierrick.bouvier@linaro.org>
 <2e1af830-a90a-447f-ab47-1c3d49463134@ventanamicro.com>
 <CAFEAcA92CuvGUJQk5LFE1X3a8dH21ksE_QXETjVPnU3v1bVSzw@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAFEAcA92CuvGUJQk5LFE1X3a8dH21ksE_QXETjVPnU3v1bVSzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
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

(Ccing Tomasz)

On 11/1/24 2:48 PM, Peter Maydell wrote:
> On Fri, 1 Nov 2024 at 17:36, Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 11/1/24 2:08 PM, Pierrick Bouvier wrote:
>>> Introduced in 0c54ac, "hw/riscv: add RISC-V IOMMU base emulation"
>>>
>>> ../hw/riscv/riscv-iommu.c:187:17: error: redefinition of '_pext_u64'
>>>
>>>     187 | static uint64_t _pext_u64(uint64_t val, uint64_t ext)
>>>
>>>         |                 ^
>>>
>>> D:/a/_temp/msys64/clang64/lib/clang/18/include/bmi2intrin.h:217:1: note: previous definition is here
>>>
>>>     217 | _pext_u64(unsigned long long __X, unsigned long long __Y)
>>>
>>>         | ^
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    hw/riscv/riscv-iommu.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
>>> index feb650549ac..f738570bac2 100644
>>> --- a/hw/riscv/riscv-iommu.c
>>> +++ b/hw/riscv/riscv-iommu.c
>>> @@ -184,7 +184,7 @@ static void riscv_iommu_pri(RISCVIOMMUState *s,
>>>    }
>>>
>>>    /* Portable implementation of pext_u64, bit-mask extraction. */
>>> -static uint64_t _pext_u64(uint64_t val, uint64_t ext)
>>> +static uint64_t pext_u64(uint64_t val, uint64_t ext)
>>
>> I suggest name it 'riscv_iommu_pext_u64' to be clear that this is a local scope function,
>> not to be mistaken with anything available in clang or any other compiler.
> 
> More generally, we should avoid using leading '_' in QEMU function
> names; those are reserved for the system.
> 
> Also, what does this function do? The comment assumes that
> the reader knows what a "pext_u64" function does, but if you
> don't then it's fairly inscrutable bit-twiddling.
> "bit-mask extraction" suggests maybe we should be using
> the bitops.h extract functions instead ?

This is the function:


/* Portable implementation of pext_u64, bit-mask extraction. */
static uint64_t _pext_u64(uint64_t val, uint64_t ext)
{
     uint64_t ret = 0;
     uint64_t rot = 1;

     while (ext) {
         if (ext & 1) {
             if (val & 1) {
                 ret |= rot;
             }
             rot <<= 1;
         }
         val >>= 1;
         ext >>= 1;
     }

     return ret;
}

Taking a look at bitops.h I'm not sure if we have a function that does that. Perhaps
we have a similar function that does that in another helper somewhere. I wouldn't
oppose using a common helper if available.

In fact I think this is not the first time we're having this talk, i.e. RISC-V code
using exclusive bitops/mask functions. target/riscv/cpu.c has a lot of these cases.
There's a whole infrastructure that ARM uses that handles regs operations that we
could use in that file, for example.

I can take a look at how we can standardize existing RISC-V code to use common helpers,
creating more common helpers if needed. Would be a 10.0 work since we're too late
for 9.2.


Thanks,

Daniel

> 
> thanks
> -- PMM

