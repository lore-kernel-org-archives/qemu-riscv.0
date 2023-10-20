Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC80C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 17:29:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qttJa-0004uv-Au; Fri, 20 Oct 2023 13:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qttJZ-0004uB-3x
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 13:29:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qttJS-0007vJ-Qz
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 13:29:36 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40675f06f1fso13232405e9.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 10:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697822966; x=1698427766; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L4fk6lB59s/+A9fBJSiwRTamLux6JQdJTIlGF8jIQuY=;
 b=qsDsnCH/EOnhcNgP2alpu4twkU/Z/PUlORw8C5mqb0AnjAPiPoV4XUKjMwid0fU2if
 pn96jnNy64V/JM/LVNVUo7FcDrm5B2XsAgfbBaGgilORE0fOqqplH8sYOPgx7OjGr/qh
 otCJRc+ljgnA5MDxMt4XfMEkCYI1tkSmEsnVvCyl+VxFX02YayadvSLYyxJVxkL1UAnA
 mC08YG2f63z4VoUHVeH70ThrlHQh4iQ17wIDJtLwBjyUNOvPK7+zo8MFi1p0x96l+RNi
 NM08e6GdFbez0jGVP2cDFklLN59Pg2TQqH+8EcN/UkTDOxfK0uXgY7SNF0i9es9cmSec
 Q9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697822966; x=1698427766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L4fk6lB59s/+A9fBJSiwRTamLux6JQdJTIlGF8jIQuY=;
 b=foX/HFga8Jg7CnE7Taybk4pVT+84D3ZvMiA0RGpyKeV1PzpXW79ZLlXDzpR0geYDuq
 PUAz5WfCmGisnoMjoZi24zxcyjRQw4ExdLANJVLc1wxvRoOhBMaBx9Rn1WHYbO8aNlbz
 TS3tdND2oL8xHmK4Pp0SDlIF7ViSXyeQscbFmZVRBa2JMMfxJoxsxYfcaX753nN18LN+
 FYA62D3k3MqW1HZ97L11qCsL4lsgQCYPArAA33jxLUKFjOg/kn6Nj0XX5MSYONgdQdBB
 55kPYmVLwChA8iSNtvbWL64wKmjGrSzVceoYHTVd2hWU343lW+U6FykWwlwB7oHCJK4p
 0TTA==
X-Gm-Message-State: AOJu0YwLJkV4Bxw7+MGG7aCCaEI0V26zkXFI5q5ovKCSm2alZaySo+6S
 DCu5TPm7GSkh1Z97e43JmmCY1w==
X-Google-Smtp-Source: AGHT+IGRfbcNonEkwyi8vi5OFGINF3bin0wJDBsgqgz8BhvOfEZlUEGn13fRXcs8/ZOWn1GLQdUROg==
X-Received: by 2002:a5d:4fca:0:b0:32d:dcee:a909 with SMTP id
 h10-20020a5d4fca000000b0032ddceea909mr5044035wrw.1.1697822966254; 
 Fri, 20 Oct 2023 10:29:26 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b0040531f5c51asm2677126wms.5.2023.10.20.10.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 10:29:25 -0700 (PDT)
Message-ID: <56646980-d38c-d844-1ee6-80453d092172@linaro.org>
Date: Fri, 20 Oct 2023 19:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 01/19] cpus: Add argument to qemu_get_cpu() to filter
 CPUs by QOM type
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov
 <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <huth@tuxfamily.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org
References: <20231020163643.86105-1-philmd@linaro.org>
 <20231020163643.86105-2-philmd@linaro.org>
 <CAFEAcA9FT+QMyQSLCeLjd7tEfaoS9JazmkYWQE++s1AmF7Nfvw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9FT+QMyQSLCeLjd7tEfaoS9JazmkYWQE++s1AmF7Nfvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi Peter,

On 20/10/23 19:14, Peter Maydell wrote:
> On Fri, 20 Oct 2023 at 17:36, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Heterogeneous machines have different type of CPU.
>> qemu_get_cpu() returning unfiltered CPUs doesn't make
>> sense anymore. Add a 'type' argument to filter CPU by
>> QOM type.
> 
> I'm not sure "filter by CPU type" is ever really the
> correct answer to this problem, though.
> 
> Picking out a handful of arm-related parts to this patchset
> as examples of different situations where we're currently
> using qemu_get_cpu():
> 
>> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
>> index 474cfdc87c..1c1585f3e1 100644
>> --- a/hw/arm/fsl-imx7.c
>> +++ b/hw/arm/fsl-imx7.c
>> @@ -212,7 +212,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>>
>>       for (i = 0; i < smp_cpus; i++) {
>>           SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
>> -        DeviceState  *d   = DEVICE(qemu_get_cpu(i));
>> +        DeviceState  *d   = DEVICE(qemu_get_cpu(i, NULL));
>>
>>           irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
>>           sysbus_connect_irq(sbd, i, irq);
> 
> This is an Arm SoC object. What it wants is not "the i'th Arm
> CPU in the whole system", but "the i'th CPU in this SoC object".
> Conveniently, it has easy access to that: s->cpu[i].
> 
>> diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
>> index e7c3d99224..0a698171ab 100644
>> --- a/hw/arm/pxa2xx_gpio.c
>> +++ b/hw/arm/pxa2xx_gpio.c
>> @@ -303,7 +303,7 @@ static void pxa2xx_gpio_realize(DeviceState *dev, Error **errp)
>>   {
>>       PXA2xxGPIOInfo *s = PXA2XX_GPIO(dev);
>>
>> -    s->cpu = ARM_CPU(qemu_get_cpu(s->ncpu));
>> +    s->cpu = ARM_CPU(qemu_get_cpu(s->ncpu, NULL));
>>
>>       qdev_init_gpio_in(dev, pxa2xx_gpio_set, s->lines);
>>       qdev_init_gpio_out(dev, s->handler, s->lines);
> 
> This is grabbing a private pointer to the CPU object[*], which
> we can do more cleanly by setting a link property, and getting
> the board code to pass a pointer to the CPU.
> 
> [*] it then uses that pointer to mess with the internals of
> the CPU to implement wake-up-on-GPIO in a completely horrible
> way, but let's assume we don't want to try to clean that up now...
> 
>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>> index 3c7dfcd6dc..3571d5038f 100644
>> --- a/hw/arm/sbsa-ref.c
>> +++ b/hw/arm/sbsa-ref.c
>> @@ -275,7 +275,7 @@ static void create_fdt(SBSAMachineState *sms)
>>
>>       for (cpu = sms->smp_cpus - 1; cpu >= 0; cpu--) {
>>           char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
>> -        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
>> +        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu, NULL));
>>           CPUState *cs = CPU(armcpu);
>>           uint64_t mpidr = sbsa_ref_cpu_mp_affinity(sms, cpu);
> 
> This is in a board model. By definition the board model for a
> non-heterogenous board knows it isn't in a heterogenous system
> model, and it doesn't need to say "specifically the first Arm CPU".
> So I think we should be able to leave it alone...
> 
>> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
>> index bfd8aa5644..8c9098d5d3 100644
>> --- a/hw/cpu/a15mpcore.c
>> +++ b/hw/cpu/a15mpcore.c
>> @@ -65,7 +65,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
>>           /* Make the GIC's TZ support match the CPUs. We assume that
>>            * either all the CPUs have TZ, or none do.
>>            */
>> -        cpuobj = OBJECT(qemu_get_cpu(0));
>> +        cpuobj = OBJECT(qemu_get_cpu(0, NULL));
>>           has_el3 = object_property_find(cpuobj, "has_el3") &&
>>               object_property_get_bool(cpuobj, "has_el3", &error_abort);
>>           qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
>> @@ -90,7 +90,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
>>        * appropriate GIC PPI inputs
>>        */
>>       for (i = 0; i < s->num_cpu; i++) {
>> -        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
>> +        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, NULL));
>>           int ppibase = s->num_irq - 32 + i * 32;
>>           int irq;
>>           /* Mapping from the output timer irq lines from the CPU to the
> 
> This is another case where what we want is "the Nth CPU
> associated with this peripheral block", not the Nth CPU of
> some particular architecture. (It's not as easy to figure
> out where we would get that from as it is in the fsl-imx7
> case, though -- perhaps we would need to tweak the API
> these objects have somehow to pass in pointers to the CPUs?)
> 
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index 2ebf880ead..cdf21dfc11 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -392,7 +392,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>>       s->cpu = g_new0(GICv3CPUState, s->num_cpu);
>>
>>       for (i = 0; i < s->num_cpu; i++) {
>> -        CPUState *cpu = qemu_get_cpu(i);
>> +        CPUState *cpu = qemu_get_cpu(i, NULL);
>>           uint64_t cpu_affid;
>>
>>           s->cpu[i].cpu = cpu;
> 
> These gicv3 uses of qemu_get_cpu() are because instead of doing
> the theoretical Right Thing and having the GIC object have to
> be told which CPUs it is responsible for, we took a shortcut
> and said "there's only one GIC, and it's connected to all the CPUs".
> The fix is, again, not filtering by CPU type, but having the
> board and SoC models do the work to explicitly represent
> "this GIC object is attached to these CPU objects" (via link
> properties or otherwise).
> 
> 
> So overall there are some places where figuring out the right
> replacement for qemu_get_cpu() is tricky, and some places where
> it's probably fairly straightforward but just an annoying
> amount of extra code to write, and some places where we don't
> care because we know the board model is not heterogenous.
> But I don't think "filter by CPU architecture type" is usually
> going to be what we want.

Thank for these feedbacks. I agree the correct way to fix that
is a tedious case by case audit, most often using link properties.

"we know the board model is not heterogeneous" but we want to
link such board/model altogether in a single binary, using common
APIs.

qemu_get_cpu() isn't scalable, so as you said the board has to
propagate its CPUs as properties to the devices which require
access to them. Eventually removing qemu_get_cpu() use from hw/.

I started isolating PCI Host Bridges devices as an example of
device complex enough to use multiple address spaces, and I figured
it'll take some time... So wanted to give a try at some generic
mechanical changes to allow a small step in my prototype,
postponing the case by case changes. I agree this isn't the best
approach and I should start with few devices, ignoring the rest
of the tree (not converting all at once).

Interrupt Controller are another cases which need CPU as link
properties. See for example this M68K series:
https://lore.kernel.org/qemu-devel/20231020150627.56893-1-philmd@linaro.org/

Regards,

Phil.

