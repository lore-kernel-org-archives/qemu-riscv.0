Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A23C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:43:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7Z4T-0008Rg-DK; Mon, 27 Nov 2023 05:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Z4R-0008Qr-VT
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 05:42:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Z4Q-0003Yh-CH
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 05:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701081748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLAXiNn6Mu2Tf5u+jHxJUtR1EYNF/HpPzJEnpWFkQDY=;
 b=fotJOD1JGWZ80O/P+4telddNGdZcMtRO8wRkqBp3RiDyOHZkmgvjIclqH07KcuX/jMbCb3
 SpPPElwTyzw08u3CzL4cAW/oyS2iEc1IhfAmww2b4lnSZ3KEjGl1sPdLqGomxhU7g+DM1L
 lsCc80NXHigkukCGHuzMc9Eqk6wXAwE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-1OwPMzBbPPSjTS152LtV1w-1; Mon, 27 Nov 2023 05:42:26 -0500
X-MC-Unique: 1OwPMzBbPPSjTS152LtV1w-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-5bdd8eee498so3362827a12.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 02:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701081745; x=1701686545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QLAXiNn6Mu2Tf5u+jHxJUtR1EYNF/HpPzJEnpWFkQDY=;
 b=VW4xCfumGv+RxTDLgoKde4MtyJextK/A4EzXfTVzwGbwONaVuqEB+sNiSP3pBQuIt9
 +PGvy5XXJk8fRo+fGV2t1s7+oCAzCOJ4BMdCBRxQ5IAchpko4ufyEFy00K+ZXzbe8Tg2
 wyEn3QheI7/EOEwbY59mVMOZFQ9w5mpcT3WwFSaZcXTdVOc4QSHy+U/Yv3K948/9tO9P
 yC9IPWzQ20wcsW7KXSzz2GOKVYFFJIJbdPFgAShBjskXD0J5wiYhdhb0LYuzwS2EuDw3
 WRElkBKKAHr3ICcPTd5/kQny7/b7XOBfypSpcTQwqfrhZ3xeeiZDHB2kd3hBFDBl9r/w
 u0ZA==
X-Gm-Message-State: AOJu0Yw+CsqEvRQEGeGcCU/+ARQqIY9N7K6WwYJXUJExwvGE/SdU8n/I
 4+WgMq7ydUPDSN1BG/y5LPXBtq5V7p4O0s9V85aXheS7qb1h5hoplnfNqFCJovRHJz+CzleWNZr
 1KvSazlCL9NNiDKE=
X-Received: by 2002:a05:6a21:a583:b0:187:636d:a61e with SMTP id
 gd3-20020a056a21a58300b00187636da61emr13148063pzc.42.1701081745205; 
 Mon, 27 Nov 2023 02:42:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQzzsagDSKVRHNhSOz5+k5pHU9woQOZ7VWDI/6f6rzrwSg4Yrbk8wLlkBN4P2fd3E1bMvPjw==
X-Received: by 2002:a05:6a21:a583:b0:187:636d:a61e with SMTP id
 gd3-20020a056a21a58300b00187636da61emr13148033pzc.42.1701081744895; 
 Mon, 27 Nov 2023 02:42:24 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 mz22-20020a17090b379600b002839a4f65c5sm7193823pjb.30.2023.11.27.02.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 02:42:24 -0800 (PST)
Message-ID: <7de4520b-1a00-4979-9ebb-38daa02ddde2@redhat.com>
Date: Mon, 27 Nov 2023 21:42:14 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] hw/arm/virt: Check CPU type in
 machine_run_board_init()
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <20231126231210.112820-6-gshan@redhat.com>
 <c7d6f212-b051-4533-8b89-6241d28658fc@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <c7d6f212-b051-4533-8b89-6241d28658fc@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 11/27/23 21:13, Marcin Juszkiewicz wrote:
> W dniu 27.11.2023 o 00:12, Gavin Shan pisze:
>> @@ -2939,6 +2900,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc = MACHINE_CLASS(oc);
>>       HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>> +    static const char * const valid_cpu_types[] = {
>> +#ifdef CONFIG_TCG
>> +        ARM_CPU_TYPE_NAME("cortex-a7"),
>> +        ARM_CPU_TYPE_NAME("cortex-a15"),
>> +        ARM_CPU_TYPE_NAME("cortex-a35"),
>> +        ARM_CPU_TYPE_NAME("cortex-a55"),
>> +        ARM_CPU_TYPE_NAME("cortex-a72"),
>> +        ARM_CPU_TYPE_NAME("cortex-a76"),
>> +        ARM_CPU_TYPE_NAME("cortex-a710"),
>> +        ARM_CPU_TYPE_NAME("a64fx"),
>> +        ARM_CPU_TYPE_NAME("neoverse-n1"),
>> +        ARM_CPU_TYPE_NAME("neoverse-v1"),
>> +        ARM_CPU_TYPE_NAME("neoverse-n2"),
>> +#endif
>> +        ARM_CPU_TYPE_NAME("cortex-a53"),
>> +        ARM_CPU_TYPE_NAME("cortex-a57"),
>> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>> +        ARM_CPU_TYPE_NAME("host"),
>> +#endif
>> +        ARM_CPU_TYPE_NAME("max"),
>> +        NULL
>> +    };
> 
> I understand that you just move list from one place to the other but also wonder why a53/a57 were/are outside of 'ifdef CONFIG_TCG' check.
> 

I'm not sure about HVF, but a53/a57 can be supported by KVM. The supported list of
CPUs by KVM is defined in linux/arch/arm64/include/uapi/asm/kvm.h as below

/*
  * Supported CPU Targets - Adding a new target type is not recommended,
  * unless there are some special registers not supported by the
  * genericv8 syreg table.
  */
#define KVM_ARM_TARGET_AEM_V8           0
#define KVM_ARM_TARGET_FOUNDATION_V8    1
#define KVM_ARM_TARGET_CORTEX_A57       2
#define KVM_ARM_TARGET_XGENE_POTENZA    3
#define KVM_ARM_TARGET_CORTEX_A53       4
/* Generic ARM v8 target */
#define KVM_ARM_TARGET_GENERIC_V8       5

#define KVM_ARM_NUM_TARGETS             6

And the following QEMU commit gives more hints about it.

[gshan@gshan q]$ git show 39920a04952
commit 39920a04952b67fb1fce8fc3519ac18b7a95f3f3
Author: Fabiano Rosas <farosas@suse.de>
Date:   Wed Apr 26 15:00:05 2023 -0300

     target/arm: Move 64-bit TCG CPUs into tcg/
     
     Move the 64-bit CPUs that are TCG-only:
     - cortex-a35
     - cortex-a55
     - cortex-a72
     - cortex-a76
     - a64fx
     - neoverse-n1
     
     Keep the CPUs that can be used with KVM:
     - cortex-a57
     - cortex-a53
     - max
     - host
     
     Signed-off-by: Fabiano Rosas <farosas@suse.de>
     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
     Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
     Message-id: 20230426180013.14814-6-farosas@suse.de
     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Thanks,
Gavin


