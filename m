Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A21CA0ED5
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 12:04:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg27N-00070y-0D; Tue, 12 Sep 2023 08:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg27J-0006zw-9I
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 08:03:41 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg27G-0007lg-Cg
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 08:03:41 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3a9a6a7a824so3477004b6e.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694520217; x=1695125017; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fVbNVTbGXA7gLCxs/ebjUGIrWrRNl9I4tZuk03OnHZ8=;
 b=VVF9Alq6PjbXe2XBcL/VwNcpgct+yjmJjCfIDNqAA2L5seopw6VgvZMmURL/GlAgEB
 q+mwIUsLgSAeYxSbxf2hoA4YbzStYQOFWyqWFbOgFd+MginG5Agzzc3pkiWo4cPjD4DO
 67VuVdtHxH2FbLUs+5/OBgr0VC1IP9W+E4/rsxJudXFWK+PUQG8bQJ4AeAE6qoxXRqBp
 q74gkfnjjwizIS4qPLxR1j70cgrBsE4RIdh3G8S03xUy+VUKClI3HvzOyJEmZaGy061r
 QTJbALeCOEfTBrq0il7I3iqehC+Rmn6l+RWL29OKmdVr6hV+wc039p2HC2nj/nYY+CFG
 HNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694520217; x=1695125017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fVbNVTbGXA7gLCxs/ebjUGIrWrRNl9I4tZuk03OnHZ8=;
 b=IvSKRlPPnhMoB5F9GspnKympgTM0W5itGoCJ/sKHiPlnOCI7O+wKeUdPrAAaCxDSL5
 m/B4Ok2RB29SOJw2kLcDkozDRu9SbgUZr1RBgkkJfVzBalYPAV/ATfFXZStD9LV1sAlV
 LX61vwqrUAnDvN5Vd4YU2+KsXVMQZERoGh1MqF8RsKQ2+IgYq9SPN/3844BCTFQGCC6C
 ajoLN2+OMFxJaSZKqRn14Cppbq15Eav9ED2cLmTevS79MDSUVVtpnTFRFYOSCrExuV3d
 QvDNd6dsPHMVlPddkhInQyAUSRgtGkZ8yGeYy9rI+FfYsJTB1v3MIsYlfhfWYMc5oQe7
 ps/g==
X-Gm-Message-State: AOJu0YziE7qUD+j8cJnLwbTe/HYH1s+nH/mfIjXpx/bF6Fn8EqK5Rt6E
 Aa5QcYQhzIYnUGCHxyW0TEN3KQ==
X-Google-Smtp-Source: AGHT+IEhbpbsqLsa01adLUkKwLSqe7tOnauYikMCLo4jAoNYcDLJn8y+Qcum70PvH7h2T9QApke/qQ==
X-Received: by 2002:a05:6808:144c:b0:3ab:3a20:e8a3 with SMTP id
 x12-20020a056808144c00b003ab3a20e8a3mr1296811oiv.28.1694520216399; 
 Tue, 12 Sep 2023 05:03:36 -0700 (PDT)
Received: from [192.168.68.107] ([177.9.182.82])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a4ae6d4000000b00565d41ba4d0sm3234917oot.35.2023.09.12.05.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 05:03:36 -0700 (PDT)
Message-ID: <32308056-2b74-cc9f-3f97-564929f0483a@ventanamicro.com>
Date: Tue, 12 Sep 2023 09:03:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 10/19] target/riscv: remove kvm-stub.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, Michael Tokarev <mjt@tls.msk.ru>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-11-dbarboza@ventanamicro.com>
 <f30d8589-8b59-2fd7-c38c-3f79508a4ac6@linaro.org>
 <20230911-0ff170da2e7063d0eb82ded9@orel>
 <20230911-df4609b7aca0b1fe00fb2e17@orel>
 <8c4158b7-6c44-aec1-e25a-4804df70af49@ventanamicro.com>
 <0aa9885e-f56f-d72d-1d41-773661974746@ventanamicro.com>
 <e095221f-9d15-df10-3aa3-31310dad57f9@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <e095221f-9d15-df10-3aa3-31310dad57f9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/12/23 08:15, Philippe Mathieu-Daudé wrote:
> On 12/9/23 12:48, Daniel Henrique Barboza wrote:
>> On 9/11/23 09:23, Daniel Henrique Barboza wrote:
>>> On 9/11/23 06:04, Andrew Jones wrote:
>>>> On Mon, Sep 11, 2023 at 09:49:06AM +0200, Andrew Jones wrote:
>>>>> On Wed, Sep 06, 2023 at 12:23:19PM +0200, Philippe Mathieu-Daudé wrote:
>>>>>> On 6/9/23 11:16, Daniel Henrique Barboza wrote:
>>>>>>> This file is not needed for some time now. All the stubs implemented in
>>>>>>> it (kvm_riscv_reset_vcpu() and kvm_riscv_set_irq()) are wrapped in 'if
>>>>>>> kvm_enabled()' blocks that the compiler will rip it out in non-KVM
>>>>>>> builds.
>>>>>>>
>>>>>>> We'll also add non-KVM stubs for all functions declared in kvm_riscv.h.
>>>>>>> All stubs are implemented as g_asserted_not_reached(), meaning that we
>>>>>>> won't support them in non-KVM builds. This is done by other kvm headers
>>>>>>> like kvm_arm.h and kvm_ppc.h.
>>>>>>
>>>>>> Aren't them also protected by kvm_enabled()? Otherwise shouldn't they?
>>>>>
>>>>> Yes, I think your earlier suggestion that we always invoke kvm functions
>>>>> from non-kvm files with a kvm_enabled() guard makes sense.
>>>>>
>>>>>>
>>>>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>>>> ---
>>>>>>>    target/riscv/kvm-stub.c  | 30 ------------------------------
>>>>>>>    target/riscv/kvm_riscv.h | 31 +++++++++++++++++++++++++++++++
>>>>>>>    target/riscv/meson.build |  2 +-
>>>>>>>    3 files changed, 32 insertions(+), 31 deletions(-)
>>>>>>>    delete mode 100644 target/riscv/kvm-stub.c
>>>>>>
>>>>>>
>>>>>>> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
>>>>>>> index f6501e68e2..c9ecd9a967 100644
>>>>>>> --- a/target/riscv/kvm_riscv.h
>>>>>>> +++ b/target/riscv/kvm_riscv.h
>>>>>>> @@ -19,6 +19,7 @@
>>>>>>>    #ifndef QEMU_KVM_RISCV_H
>>>>>>>    #define QEMU_KVM_RISCV_H
>>>>>>> +#ifdef CONFIG_KVM
>>>>>>>    void kvm_riscv_cpu_add_kvm_properties(Object *obj);
>>>>>>
>>>>>> At a glance kvm_riscv_cpu_add_kvm_properties() is.
>>>>>> Keep the prototype declared (before #ifdef CONFIG_KVM) is enough for the
>>>>>> compiler to elide it.
>>>>>
>>>>> Yes, when building without CONFIG_KVM enabled it's actually better to not
>>>>> have the stubs, since the compiler will catch an unguarded kvm function
>>>>> call (assuming the kvm function is defined in a file which is only built
>>>>> with CONFIG_KVM).
>>>>>
>>>>> Unfortunately we don't have anything to protect developers from forgetting
>>>>> the kvm_enabled() guard when building a QEMU which supports both TCG and
>>>>> KVM. We could try to remember to put 'assert(kvm_enabled())' at the start
>>>>> of each of these types of functions. It looks like mips does that for a
>>>>> couple functions.
>>>>
>>>> Eh, ignore this suggestion. We don't need asserts, because we have CI. As
>>>> long as our CI does a CONFIG_KVM=n build and all KVM functions are in kvm-
>>>> only files, then we'll always catch calls of KVM functions which are
>>>> missing their kvm_enabled() guards.
>>>
>>> So, to sum up, get rid of the 'g_assert_not_reached()' stubs since they should
>>> be cropped by well placed kvm_enabled() calls in the code and, if that's not
>>> the case, a non-KVM build failure will let us know that there's something wrong.
>>>
>>> I can live with that. It's less code to deal with in the header as well. Thanks,
>>
>>
>> I changed my mind after talking with Michael in this thread:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg02567.html
>>
>>
>> There are differences in how gcc and clang (and probably other toolchains) behave
>> when choosing to crop code gated with 'if (kvm_enabled && something)'. It is
>> better to have stubs for all KVM functions to avoid relying on compiler behavior.
>>
>> We should keep the stubs in this patch as is. Thanks,
> 
> Don't get stuck at this; get your series merged, we'll have a look
> at that later, this is not important.


Ok, so we'll simplify here and avoid the unneeded stubs for now as we initially discussed,
while making sure we're not breaking builds with --enable-debug and clang. After this
is merged we can reevaluate the best approach to take.


Thanks,


Daniel

> 
> Regards,
> 
> Phil.

