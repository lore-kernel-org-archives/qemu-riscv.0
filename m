Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AED9EB64D0
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 18:20:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q98cH-0008Rr-1t; Tue, 13 Jun 2023 14:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q98c4-0008Pv-55
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 14:19:29 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q98c2-0007lm-9j
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 14:19:27 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-19f6211d4e1so4565799fac.1
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686680365; x=1689272365;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zcXf57pb/Amh5GwEdUbl+V19AudY0sVenzQPVndD2Eg=;
 b=mXcR7CvcdnOD346wKRZ+GyPCCNyj6wIxKabvTAxQ/RbYDvXRej/5Cru4rgtDtKaCHC
 V6aX8wxl7OoUV2Z8qbIEtUUWTxmLNyq10Sz91cqkZMUe622IabD1vLG+lxXhwESKwJx7
 ZQrZnAkvqMwthOt3c4dAsZapIh40tm+qTRtN1yhhBgdMaFgkv2IV0taU88oWXgSVOZLE
 OgdE9ZAMzQYhqR35Q3SbzmM5qkRPpxBcPOMjNrp3xoWGqBH80JodwSxCFFOoOyOK+jVm
 Yotv358K2e52BU8CAtIc7l5iGIsnUks58UAnd6BQXQxvN0RdPW0x1ib4caE9UfGHxAH3
 Jeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686680365; x=1689272365;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcXf57pb/Amh5GwEdUbl+V19AudY0sVenzQPVndD2Eg=;
 b=dpXehOByLUt4J9hA0Gqy4HrYIDM52LMd61XE38EL8fbS22WeWVGIZDd250GAOhT60q
 SWKd2+3JQTK5QRMBGy+7hJDcRmVc8gVMXW6XnOf8LaCvcTSJlzjoQn/28DixHepWnrYx
 Ps1HhxQBGmD2M8+HZ1WryV/vPv1l5WPlxAurYmEUTf65Qg9j8uCYux4Sc51UgE5bXo4O
 kxzc6cCvOSqwkXUzYvbZOOLte+BZD6uiPwkkmjBygSVHJ5gcZ2UnQgjwcSsnL3a4L17x
 E1gVQfui++swPD1d5AjGZCXfSzSur5GargQodwQZL7cVmn2FN5+8wj9lhIkpYFwp2fW6
 HsKQ==
X-Gm-Message-State: AC+VfDxBZjoaX3+WRpX75JP/woV6HUEhYAMioRpaSMQEh+e26KocMYMg
 EwdOPhivmxpQBVWmofLdkm07EQ==
X-Google-Smtp-Source: ACHHUZ7PDIZRjR5DfZleoha5iTpvL+LFMyh0biwxQSfWXZAYnSo2fzSoNy1Lrmj249Jo+M0WO6L9fw==
X-Received: by 2002:a05:6870:2206:b0:19e:f50f:f253 with SMTP id
 i6-20020a056870220600b0019ef50ff253mr10323245oaf.5.1686680364732; 
 Tue, 13 Jun 2023 11:19:24 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.210])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a0568301d7700b006b2e56b7b5dsm2469003oti.9.2023.06.13.11.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 11:19:24 -0700 (PDT)
Message-ID: <784fd208-265e-e951-7355-7398e2eec270@ventanamicro.com>
Date: Tue, 13 Jun 2023 15:19:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 14/16] target/riscv: adapt 'riscv_isa_string' for KVM
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-15-dbarboza@ventanamicro.com>
 <20230607-8e2b65e6a054c4f5f2962e85@orel>
 <7a4217e2-163b-8e2d-e86b-97fb0733fef3@ventanamicro.com>
In-Reply-To: <7a4217e2-163b-8e2d-e86b-97fb0733fef3@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/13/23 07:29, Daniel Henrique Barboza wrote:
> 
> 
> On 6/7/23 09:21, Andrew Jones wrote:
>> On Tue, May 30, 2023 at 04:46:21PM -0300, Daniel Henrique Barboza wrote:
>>> KVM is not using the same attributes as TCG, i.e. it doesn't use
>>> isa_edata_arr[]. Add a new kvm_riscv_isa_string_ext() helper that does
>>> basically the same thing, but using KVM internals instead.
>>>
>>> The decision to add this helper target/riscv/kvm.c is to foster the
>>> separation between KVM and TCG logic, while still using
>>> riscv_isa_string_ext() from target/riscv/cpu.c to retrieve the string
>>> to not overcomplicate things.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   target/riscv/cpu.c       |  5 +++++
>>>   target/riscv/kvm.c       | 19 +++++++++++++++++++
>>>   target/riscv/kvm_riscv.h |  2 ++
>>>   3 files changed, 26 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 3c348049a3..ec1d0c621a 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -1956,6 +1956,11 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>>>       char *new = *isa_str;
>>>       int i;
>>> +    if (riscv_running_KVM()) {
>>> +        kvm_riscv_isa_string_ext(cpu, isa_str, max_str_len);
>>> +        return;
>>> +    }
>>> +
>>>       for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>>>           if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
>>>               isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
>>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
>>> index b4193a10d8..675e18df3b 100644
>>> --- a/target/riscv/kvm.c
>>> +++ b/target/riscv/kvm.c
>>> @@ -320,6 +320,25 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>>>       }
>>>   }
>>> +void kvm_riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>>> +                              int max_str_len)
>>> +{
>>> +    char *old = *isa_str;
>>> +    char *new = *isa_str;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
>>> +        RISCVCPUMultiExtConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
>>> +        if (kvm_cpu_cfg_get(cpu, multi_ext_cfg)) {
>>> +            new = g_strconcat(old, "_", multi_ext_cfg->name, NULL);
>>> +            g_free(old);
>>> +            old = new;
>>> +        }
>>> +    }
>>> +
>>> +    *isa_str = new;
>>> +}
>>> +
>>>   static int kvm_riscv_get_regs_core(CPUState *cs)
>>>   {
>>>       int ret = 0;
>>> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
>>> index e3ba935808..1a12efa8db 100644
>>> --- a/target/riscv/kvm_riscv.h
>>> +++ b/target/riscv/kvm_riscv.h
>>> @@ -20,6 +20,8 @@
>>>   #define QEMU_KVM_RISCV_H
>>>   void kvm_riscv_init_user_properties(Object *cpu_obj);
>>> +void kvm_riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>>> +                              int max_str_len);
>>>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>>>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>>> -- 
>>> 2.40.1
>>>
>>>
>>
>> Hmm, more duplication. I think we need an abstraction which can support
>> both TCG and KVM extension lists. Allowing functions like
>> riscv_isa_string_ext() to be shared for them.
> 
> I tried to play around a bit and didn't manage to find a solution that covers
> both.
> 
> The root cause is that the TCG only options are being ignored by KVM, but they
> are still around. I made an attempt of re-using the existing isa_string()
> function with KVM by changing all TCG-only extensions default to 'false'. This
> doesn't change the fact that, with KVM, I can do:
> 
> sudo ./qemu/build/qemu-system-riscv64  -machine virt,accel=kvm \
> -cpu host,zhinx=true,zhinxmin=true (...)
> 
> Note that zhinx and zhinxmin are TCG-only. And the ISA string showed these 2
> extensions:
> 
> # cat /proc/device-tree/cpus/cpu@0/riscv,isa
> rv64imafdc_zicbom_zicboz_zbb_zhinx_zhinxmin_sstc
> 
> 
> Alternatives would be to change TCG code to allow for extra fields for KVM (e.g. the
> 'supported' flag) to allow the isa_string() function to ignore the TCG-only extensions.
> Bear in mind that TCG has 63 extensions, so we would do 63 ioctls for each CPU in this
> extension discovery and KVM only 8 support extensions ATM.

... or we can add an extra flag in isa_edata_arr[] 'kvm_available' to indicate if a
given extension is also present in KVM, set it manually for each KVM-capable
entry of the array and check for that during riscv_isa_string_ext().

This will avoid the code duplication while not allowing TCG-only extensions
to appear in the riscv,isa when running KVM.

I made this change in v2. I'll send it up shortly. Thanks,


Daniel

> 
> Another idea is to make the existing isa_string() compare isa_edata_arr[] with the
> KVM counterpart kvm_multi_ext_cfgs[] and, if running KVM, check if the extension
> in isa_edata_arr[] is also in the KVM array. This also seems a bit inefficient since
> we're adding a search loop for 55 extensions when creating the string.
> 
> Another alternative is to exclude all TCG-only extensions from the command line when
> running KVM. We would fork the API though, which is something that we're wanting to
> avoid.
> 
> Duplicating this code as we're doing here guarantees that the KVM isa string won't
> have anything that KVM doesn't know about, regardless of the user input. I am not a
> fan of duplication, but at this moment it seems plausible to keep it. At least until
> we sort a way of unifying both TCG and KVM options in a satisfying manner.
> 
> I mean, at least as far as a I can see. Suggestions always welcome.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> 
>>
>> Thanks,
>> drew

