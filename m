Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E0DCA0EC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 10:49:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg0x2-00023k-7S; Tue, 12 Sep 2023 06:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg0x0-0001uF-Vq
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 06:48:59 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg0wx-0003X6-W6
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 06:48:58 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5733d431209so3363956eaf.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694515735; x=1695120535; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mwj6qqRsZ/Ci5WyhvdCBsKYRj6VSFOQ9XuZ9cbwYrUE=;
 b=WLQumVgH5faxeWQaDIYhFaeCpqlGagWxX6Rlt/PUifqvnb0z1X9j7mDlVOdiLeKisy
 zbhx6bFzz+oQ9sxxJfJszsBfLyqDUN4DTRKF4nlBlte+7qGueLrlzs4Mq01p1Nr0gBEu
 pOsWhxCTWzksDwCW9Km4Ro20WkgPrbqe58O8RF3AnewZq2AblkpymNdIjP6J5uJxtKv2
 l7LhSTXsrvJIBACKbI8d5/T9htySzc4NVr4+VoeE5ireHVmMfNWxH3IhlfRBPls4/ehN
 Uk7pC5pXn2SJ0+aBRla8Zzlcd6XQxKi+xYUJlWK8z7hGz5tc9Mo7N0tmgwabV6Mx6p7P
 MCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694515735; x=1695120535;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mwj6qqRsZ/Ci5WyhvdCBsKYRj6VSFOQ9XuZ9cbwYrUE=;
 b=pK1Fd45iRIzXSIOHh82FchrJNT9nIr0A4jFGErY0icJHdrkuMlMq+t9GL/yiCtmcjb
 VPrgh2xs1VcEG6AGa3yAc2MuSA5d4aKJLzplkm2oE6fPIAaAm3W9NoBPI8SjDRL1F6G5
 eAdKpcnNLsVaojkumbjuG0eRi3LQ/Uabza7imuA3ANDDfAL6Un9CtLjthFw4LeVbGt0C
 EhPXW7YXhyfjOwU7Wi18KCVRCbzNQGq9UdNpN1SIl9iRfxC76B1TpAtXLDN6dopguytF
 tNVIOsjwIzjYR929/G+M9euI00QWzvsYCpniHl5NTJKHSIDZLeXCbeY7Ry46wafsIjmd
 WdDA==
X-Gm-Message-State: AOJu0Yz0oeocuwNm9LAEXK4Bmlvxalu+gPBXblN+NiKNQWTBy33s5ooi
 40z5ZMPcTkx3K92etPceRgxOvg==
X-Google-Smtp-Source: AGHT+IETCjvxGUWv/qY9/lek5A+DtCVjQyT5yAr0CmNpv9/CtnrxfetCJEJFZtzxubRsQd/tUKKupQ==
X-Received: by 2002:a05:6870:911f:b0:1bf:dc25:a5aa with SMTP id
 o31-20020a056870911f00b001bfdc25a5aamr14699355oae.39.1694515734821; 
 Tue, 12 Sep 2023 03:48:54 -0700 (PDT)
Received: from [192.168.68.107] ([177.9.182.82])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a056871079700b001d58f6e31e4sm3536098oap.41.2023.09.12.03.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 03:48:54 -0700 (PDT)
Message-ID: <0aa9885e-f56f-d72d-1d41-773661974746@ventanamicro.com>
Date: Tue, 12 Sep 2023 07:48:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 10/19] target/riscv: remove kvm-stub.c
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, Michael Tokarev <mjt@tls.msk.ru>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-11-dbarboza@ventanamicro.com>
 <f30d8589-8b59-2fd7-c38c-3f79508a4ac6@linaro.org>
 <20230911-0ff170da2e7063d0eb82ded9@orel>
 <20230911-df4609b7aca0b1fe00fb2e17@orel>
 <8c4158b7-6c44-aec1-e25a-4804df70af49@ventanamicro.com>
In-Reply-To: <8c4158b7-6c44-aec1-e25a-4804df70af49@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/11/23 09:23, Daniel Henrique Barboza wrote:
> 
> 
> On 9/11/23 06:04, Andrew Jones wrote:
>> On Mon, Sep 11, 2023 at 09:49:06AM +0200, Andrew Jones wrote:
>>> On Wed, Sep 06, 2023 at 12:23:19PM +0200, Philippe Mathieu-Daudé wrote:
>>>> On 6/9/23 11:16, Daniel Henrique Barboza wrote:
>>>>> This file is not needed for some time now. All the stubs implemented in
>>>>> it (kvm_riscv_reset_vcpu() and kvm_riscv_set_irq()) are wrapped in 'if
>>>>> kvm_enabled()' blocks that the compiler will rip it out in non-KVM
>>>>> builds.
>>>>>
>>>>> We'll also add non-KVM stubs for all functions declared in kvm_riscv.h.
>>>>> All stubs are implemented as g_asserted_not_reached(), meaning that we
>>>>> won't support them in non-KVM builds. This is done by other kvm headers
>>>>> like kvm_arm.h and kvm_ppc.h.
>>>>
>>>> Aren't them also protected by kvm_enabled()? Otherwise shouldn't they?
>>>
>>> Yes, I think your earlier suggestion that we always invoke kvm functions
>>> from non-kvm files with a kvm_enabled() guard makes sense.
>>>
>>>>
>>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>> ---
>>>>>    target/riscv/kvm-stub.c  | 30 ------------------------------
>>>>>    target/riscv/kvm_riscv.h | 31 +++++++++++++++++++++++++++++++
>>>>>    target/riscv/meson.build |  2 +-
>>>>>    3 files changed, 32 insertions(+), 31 deletions(-)
>>>>>    delete mode 100644 target/riscv/kvm-stub.c
>>>>
>>>>
>>>>> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
>>>>> index f6501e68e2..c9ecd9a967 100644
>>>>> --- a/target/riscv/kvm_riscv.h
>>>>> +++ b/target/riscv/kvm_riscv.h
>>>>> @@ -19,6 +19,7 @@
>>>>>    #ifndef QEMU_KVM_RISCV_H
>>>>>    #define QEMU_KVM_RISCV_H
>>>>> +#ifdef CONFIG_KVM
>>>>>    void kvm_riscv_cpu_add_kvm_properties(Object *obj);
>>>>
>>>> At a glance kvm_riscv_cpu_add_kvm_properties() is.
>>>> Keep the prototype declared (before #ifdef CONFIG_KVM) is enough for the
>>>> compiler to elide it.
>>>
>>> Yes, when building without CONFIG_KVM enabled it's actually better to not
>>> have the stubs, since the compiler will catch an unguarded kvm function
>>> call (assuming the kvm function is defined in a file which is only built
>>> with CONFIG_KVM).
>>>
>>> Unfortunately we don't have anything to protect developers from forgetting
>>> the kvm_enabled() guard when building a QEMU which supports both TCG and
>>> KVM. We could try to remember to put 'assert(kvm_enabled())' at the start
>>> of each of these types of functions. It looks like mips does that for a
>>> couple functions.
>>
>> Eh, ignore this suggestion. We don't need asserts, because we have CI. As
>> long as our CI does a CONFIG_KVM=n build and all KVM functions are in kvm-
>> only files, then we'll always catch calls of KVM functions which are
>> missing their kvm_enabled() guards.
> 
> So, to sum up, get rid of the 'g_assert_not_reached()' stubs since they should
> be cropped by well placed kvm_enabled() calls in the code and, if that's not
> the case, a non-KVM build failure will let us know that there's something wrong.
> 
> I can live with that. It's less code to deal with in the header as well. Thanks,


I changed my mind after talking with Michael in this thread:

https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg02567.html


There are differences in how gcc and clang (and probably other toolchains) behave
when choosing to crop code gated with 'if (kvm_enabled && something)'. It is
better to have stubs for all KVM functions to avoid relying on compiler behavior.

We should keep the stubs in this patch as is. Thanks,


Daniel


> 
> 
> Daniel
> 
> 
>>
>> Thanks,
>> drew

