Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox99m-0008T3-Dd
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 10:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lyan@digitalocean.com>)
 id 1ox7iE-0002K6-39
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 09:23:54 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lyan@digitalocean.com>)
 id 1ox7i8-00015M-Fr
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 09:23:53 -0500
Received: by mail-qv1-xf34.google.com with SMTP id i12so8087950qvs.2
 for <qemu-riscv@nongnu.org>; Mon, 21 Nov 2022 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=content-transfer-encoding:in-reply-to:subject:from:content-language
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2J1cgZnf+hEAYJW0tGMwAKWSUEmTIr7fF82Fb35eHbY=;
 b=Lh2f76/8990pibuviVeiDXMSV0EgGS4n8a3z9jHzZUSJhb5CMDjyASTqpxIGkyxret
 vTGsee6bxdqHQCVQCCiVzA/tyXaMfqsucH4uTQ5EijBCVVYwHEL+PsoLtIzmXgu6DJUg
 YTYLS0QpSe16a2ZWKGASPQMlUWpxn/BaCkzno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:content-language
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2J1cgZnf+hEAYJW0tGMwAKWSUEmTIr7fF82Fb35eHbY=;
 b=iSoQAuzNmmBR3YKxn3xW7rYbX+jR5x5O8C7J0A/DOFCaP/UK9mBwQqpbj14OgfU+7T
 zrDT0wHgpWbzhI3TAhBDegJCu66LEkUahK2Nz9yVHPRceZF1+11XI3UyCOJgxk0kP0D+
 x7Ob1Td8Bduj/877z7IS/LpBGb06N+M3FI1BDum+AKRt8pdFRNUfaIyOi1hqB8D9U/dr
 pVaPJvIQjpMUENVMBOqDz1xJx6E56weJFvGdXMwoWTbxYJEkAXI5DcTfyI1Td50Y/Rv6
 R9/zWxk/JKp1TFbBHIPIYOh/KFn5YKI+dX8NBxjVWMguPzmsYfaRFJ028oOElu4UiSIA
 oaDQ==
X-Gm-Message-State: ANoB5pnczO21BZd8gl5j+y/nATtY4FKpF8FoANFKTE1drYSw3ICGfbuI
 78q+BsG3G2Igj44sQtShyPl8gg==
X-Google-Smtp-Source: AA0mqf52GkgLat58I8j4V8x3YHX81aBjPkquPBqqIjLFfKOQOIZumzYocNG2t0XkVoIn9jOPef0Ylg==
X-Received: by 2002:a05:6214:368a:b0:4bb:6b58:2c96 with SMTP id
 nl10-20020a056214368a00b004bb6b582c96mr17830235qvb.127.1669040620750; 
 Mon, 21 Nov 2022 06:23:40 -0800 (PST)
Received: from [192.168.2.110]
 (107-142-220-210.lightspeed.wlfrct.sbcglobal.net. [107.142.220.210])
 by smtp.gmail.com with ESMTPSA id
 e8-20020ac84908000000b003a4f14378d1sm6729083qtq.33.2022.11.21.06.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 06:23:39 -0800 (PST)
Message-ID: <98067697-4205-4061-1cbb-a666f7021692@digitalocean.com>
Date: Mon, 21 Nov 2022 09:23:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Greg Kurz <groug@kaod.org>, Dongli Zhang <dongli.zhang@oracle.com>
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, mtosatti@redhat.com,
 chenhuacai@kernel.org, philmd@linaro.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, joe.jin@oracle.com, likexu@tencent.com
References: <20221119122901.2469-1-dongli.zhang@oracle.com>
 <20221119122901.2469-3-dongli.zhang@oracle.com>
 <20221121120311.2731a912@bahia>
Content-Language: en-US
From: Liang Yan <lyan@digitalocean.com>
Subject: Re: [PATCH 2/3] i386: kvm: disable KVM_CAP_PMU_CAPABILITY if "pmu" is
 disabled
In-Reply-To: <20221121120311.2731a912@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=lyan@digitalocean.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Nov 2022 10:56:21 -0500
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
X-List-Received-Date: Mon, 21 Nov 2022 14:23:54 -0000


On 11/21/22 06:03, Greg Kurz wrote:
> On Sat, 19 Nov 2022 04:29:00 -0800
> Dongli Zhang <dongli.zhang@oracle.com> wrote:
>
>> The "perf stat" at the VM side still works even we set "-cpu host,-pmu" in
>> the QEMU command line. That is, neither "-cpu host,-pmu" nor "-cpu EPYC"
>> could disable the pmu virtualization in an AMD environment.
>>
>> We still see below at VM kernel side ...
>>
>> [    0.510611] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
>>
>> ... although we expect something like below.
>>
>> [    0.596381] Performance Events: PMU not available due to virtualization, using software events only.
>> [    0.600972] NMI watchdog: Perf NMI watchdog permanently disabled
>>
>> This is because the AMD pmu (v1) does not rely on cpuid to decide if the
>> pmu virtualization is supported.
>>
>> We disable KVM_CAP_PMU_CAPABILITY if the 'pmu' is disabled in the vcpu
>> properties.
>>
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>> ---
>>   target/i386/kvm/kvm.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 8fec0bc5b5..0b1226ff7f 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -137,6 +137,8 @@ static int has_triple_fault_event;
>>   
>>   static bool has_msr_mcg_ext_ctl;
>>   
>> +static int has_pmu_cap;
>> +
>>   static struct kvm_cpuid2 *cpuid_cache;
>>   static struct kvm_cpuid2 *hv_cpuid_cache;
>>   static struct kvm_msr_list *kvm_feature_msrs;
>> @@ -1725,6 +1727,19 @@ static void kvm_init_nested_state(CPUX86State *env)
>>   
>>   void kvm_arch_pre_create_vcpu(CPUState *cs)
>>   {
>> +    X86CPU *cpu = X86_CPU(cs);
>> +    int ret;
>> +
>> +    if (has_pmu_cap && !cpu->enable_pmu) {
>> +        ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_PMU_CAPABILITY, 0,
>> +                                KVM_PMU_CAP_DISABLE);
> It doesn't seem conceptually correct to configure VM level stuff out of
> a vCPU property, which could theoretically be different for each vCPU,
> even if this isn't the case with the current code base.
>
> Maybe consider controlling PMU with a machine property and this
> could be done in kvm_arch_init() like other VM level stuff ?
>

There is already a 'pmu' property for x86_cpu with variable 'enable_pmu' 
as we see the above code. It is mainly used by Intel CPU and set to off 
by default since qemu 1.5.

And, this property is spread to AMD CPU too.

I think you may need setup a machine property to disable it from current 
machine model. Otherwise, it will break the Live Migration scenario.


>> +        if (ret < 0) {
>> +            error_report("kvm: Failed to disable pmu cap: %s",
>> +                         strerror(-ret));
>> +        }
>> +
>> +        has_pmu_cap = 0;
>> +    }
>>   }
>>   
>>   int kvm_arch_init_vcpu(CPUState *cs)
>> @@ -2517,6 +2532,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>           }
>>       }
>>   
>> +    has_pmu_cap = kvm_check_extension(s, KVM_CAP_PMU_CAPABILITY);
>> +
>>       ret = kvm_get_supported_msrs(s);
>>       if (ret < 0) {
>>           return ret;
>

