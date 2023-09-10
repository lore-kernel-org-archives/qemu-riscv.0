Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2580AC71153
	for <qemu-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 23:28:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfTr5-00048Q-6N; Sun, 10 Sep 2023 19:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfTr3-00047d-Jx
 for qemu-riscv@nongnu.org; Sun, 10 Sep 2023 19:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfTr0-0005Zr-5q
 for qemu-riscv@nongnu.org; Sun, 10 Sep 2023 19:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694388512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e2fftQ3Z1YMVS4ZoGPv3NkmJcAPHmlnGVpxoCEdFFp4=;
 b=eUHC5A4gbJgas1cOblGn29V4axl3FCGgHazyf32K5/ta92ODzplBRzPRMvYzpK/drMeLzj
 Pk7MBXRwjyql8ueZZqgp/2FL5TVDJJ3SvwIOsMwOVO1G/DRHHiJpSvLyc5KCsfkEI3G4p3
 SObjO/WpBn7xvXlWdNpJZUKo7hAfZNY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-7ks0n4dOPbOYIoVhTnTNoA-1; Sun, 10 Sep 2023 19:28:30 -0400
X-MC-Unique: 7ks0n4dOPbOYIoVhTnTNoA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1bf39e73558so61617655ad.2
 for <qemu-riscv@nongnu.org>; Sun, 10 Sep 2023 16:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694388509; x=1694993309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e2fftQ3Z1YMVS4ZoGPv3NkmJcAPHmlnGVpxoCEdFFp4=;
 b=r1QJ4AFMpZj3P35d4hDbQS73kSC3Hp946WBuQYF69SUXQnWi6RHfedyfM59cqt4bYZ
 xavU1+PRDD4qchNqNcgcPvE4ZViWE7FS4jOJqWTT8ZppLEglLtIy4P3LjkboXpx4gmRl
 6OdJwuE1ydxner+zNDVLWxjb/jMFZtizO4StahuPOSRSEd+J6Lcgmsbs8FAk+kD2IsOv
 hxrbmxfK8L0GZTrFWY1lGjw5gg/zGtDJDL8zvyUKEj0onTa9CmQTV3rrAMykon50/7k8
 8h0rgRrxKJFfZ+MkSQbbtcHlZgIFDZ2x/zwxOn9PaQepO+GKrH2o8/pGeGmX47BupUEP
 WxqQ==
X-Gm-Message-State: AOJu0YzuRO2tvAHDThuJuEY5o1fgbJjRyb8zaFe+bL0FSINYIMmcCo+1
 +IMbggjdOayd5XGvBO+sPuQOYCLIw6dOwblzY6qeqwH5+QPSfYQeQyvYdURFAvs3TAz3M/TBKEa
 ifxFnyNO2qw+jmHk=
X-Received: by 2002:a17:902:efd4:b0:1b8:36a8:faf9 with SMTP id
 ja20-20020a170902efd400b001b836a8faf9mr8680849plb.38.1694388509380; 
 Sun, 10 Sep 2023 16:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhkF13WjSReO6amN2QhNQy1TJY0pD0qe0NmD2FlihHDv1PhoElriA4Qt9AGNegOByUSskClA==
X-Received: by 2002:a17:902:efd4:b0:1b8:36a8:faf9 with SMTP id
 ja20-20020a170902efd400b001b836a8faf9mr8680826plb.38.1694388509029; 
 Sun, 10 Sep 2023 16:28:29 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c14d00b001bdd51748f8sm5013285plj.271.2023.09.10.16.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Sep 2023 16:28:28 -0700 (PDT)
Message-ID: <87cb0174-c652-aa44-be7c-49e78e0a5003@redhat.com>
Date: Mon, 11 Sep 2023 09:28:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] hw/cpu: Introduce CPUClass::cpu_resolving_type field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230908112235.75914-1-philmd@linaro.org>
 <20230908112235.75914-4-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230908112235.75914-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi Philippe,

On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
> Add a field to return the QOM type name of a CPU class.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/cpu.h   | 2 ++
>   hw/core/cpu-common.c    | 2 +-
>   target/alpha/cpu.c      | 1 +
>   target/arm/cpu.c        | 1 +
>   target/avr/cpu.c        | 1 +
>   target/cris/cpu.c       | 1 +
>   target/hexagon/cpu.c    | 1 +
>   target/hppa/cpu.c       | 1 +
>   target/i386/cpu.c       | 1 +
>   target/loongarch/cpu.c  | 1 +
>   target/m68k/cpu.c       | 1 +
>   target/microblaze/cpu.c | 1 +
>   target/mips/cpu.c       | 1 +
>   target/nios2/cpu.c      | 1 +
>   target/openrisc/cpu.c   | 1 +
>   target/ppc/cpu_init.c   | 1 +
>   target/riscv/cpu.c      | 1 +
>   target/rx/cpu.c         | 1 +
>   target/s390x/cpu.c      | 1 +
>   target/sh4/cpu.c        | 1 +
>   target/sparc/cpu.c      | 1 +
>   target/tricore/cpu.c    | 1 +
>   target/xtensa/cpu.c     | 1 +
>   23 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 129d179937..e469efd409 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -100,6 +100,7 @@ struct SysemuCPUOps;
>   
>   /**
>    * CPUClass:
> + * @cpu_resolving_type: CPU QOM type name
>    * @class_by_name: Callback to map -cpu command line model name to an
>    *                 instantiatable CPU type.
>    * @parse_features: Callback to parse command line arguments.
> @@ -148,6 +149,7 @@ struct CPUClass {
>       DeviceClass parent_class;
>       /*< public >*/
>   
> +    const char *cpu_resolving_type;
>       ObjectClass *(*class_by_name)(const char *cpu_model);
>       void (*parse_features)(const char *typename, char *str, Error **errp);
>   

The question is why not use CPU_RESOLVING_TYPE directly? It seems CPU_RESOLVING_TYPE
is exactly what you want here. Besides, I guess the changes can be squeezed into two
patches (commits) as below:

PATCH[1] target/alpha: Tidy up alpha_cpu_class_by_name()
PATCH[2] Move the checks (oc == NULL || object_class_is_abstract() || !object_class_dynamic_cast())
          from individual targets to hw/core/cpu-common.c::cpu_class_by_name()

I rebase my series of '[PATCH v3 00/32] Unified CPU type check' on top of yours. Please
let me know if I need to include your patch into my v4 series for review. In that case,
I can include your patches with above changes applied.

Thanks,
Gavin

> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index c6a0c9390c..2d24261a6a 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -155,7 +155,7 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>       assert(cpu_model);
>       oc = object_class_by_name(typename);
>       cc = CPU_CLASS(oc);
> -    assert(cc->class_by_name);
> +    assert(cc->cpu_resolving_type && cc->class_by_name);
>       oc = cc->class_by_name(cpu_model);
>       if (oc == NULL || object_class_is_abstract(oc)) {
>           return NULL;
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 351ee2e9f2..0ddea8004c 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -254,6 +254,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
>       device_class_set_parent_realize(dc, alpha_cpu_realizefn,
>                                       &acc->parent_realize);
>   
> +    cc->cpu_resolving_type = TYPE_ALPHA_CPU;
>       cc->class_by_name = alpha_cpu_class_by_name;
>       cc->has_work = alpha_cpu_has_work;
>       cc->dump_state = alpha_cpu_dump_state;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 42e29816cc..9e51bde170 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2377,6 +2377,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, arm_cpu_reset_hold, NULL,
>                                          &acc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_ARM_CPU;
>       cc->class_by_name = arm_cpu_class_by_name;
>       cc->has_work = arm_cpu_has_work;
>       cc->dump_state = arm_cpu_dump_state;
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 4b255eade1..f6004169ac 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -233,6 +233,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, avr_cpu_reset_hold, NULL,
>                                          &mcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_AVR_CPU;
>       cc->class_by_name = avr_cpu_class_by_name;
>   
>       cc->has_work = avr_cpu_has_work;
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 115f6e2ea2..adde4f599d 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -314,6 +314,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, cris_cpu_reset_hold, NULL,
>                                          &ccc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_CRIS_CPU;
>       cc->class_by_name = cris_cpu_class_by_name;
>       cc->has_work = cris_cpu_has_work;
>       cc->dump_state = cris_cpu_dump_state;
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 5e301327d3..2d4fed838d 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -381,6 +381,7 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
>       resettable_class_set_parent_phases(rc, NULL, hexagon_cpu_reset_hold, NULL,
>                                          &mcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_HEXAGON_CPU;
>       cc->class_by_name = hexagon_cpu_class_by_name;
>       cc->has_work = hexagon_cpu_has_work;
>       cc->dump_state = hexagon_dump_state;
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 11022f9c99..47950a15ae 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -192,6 +192,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
>       device_class_set_parent_realize(dc, hppa_cpu_realizefn,
>                                       &acc->parent_realize);
>   
> +    cc->cpu_resolving_type = TYPE_HPPA_CPU;
>       cc->class_by_name = hppa_cpu_class_by_name;
>       cc->has_work = hppa_cpu_has_work;
>       cc->dump_state = hppa_cpu_dump_state;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 00f913b638..9979464420 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7951,6 +7951,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>                                          &xcc->parent_phases);
>       cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
>   
> +    cc->cpu_resolving_type = TYPE_X86_CPU;
>       cc->class_by_name = x86_cpu_class_by_name;
>       cc->parse_features = x86_cpu_parse_featurestr;
>       cc->has_work = x86_cpu_has_work;
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index fe2e5ecc46..189dfd32d1 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -743,6 +743,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>       resettable_class_set_parent_phases(rc, NULL, loongarch_cpu_reset_hold, NULL,
>                                          &lacc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_LOONGARCH_CPU;
>       cc->class_by_name = loongarch_cpu_class_by_name;
>       cc->has_work = loongarch_cpu_has_work;
>       cc->dump_state = loongarch_cpu_dump_state;
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 004f3d6265..bd7bb103d7 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -558,6 +558,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
>       resettable_class_set_parent_phases(rc, NULL, m68k_cpu_reset_hold, NULL,
>                                          &mcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_M68K_CPU;
>       cc->class_by_name = m68k_cpu_class_by_name;
>       cc->has_work = m68k_cpu_has_work;
>       cc->dump_state = m68k_cpu_dump_state;
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 03c2c4db1f..bb5f2c1f00 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -414,6 +414,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, mb_cpu_reset_hold, NULL,
>                                          &mcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_MICROBLAZE_CPU;
>       cc->class_by_name = mb_cpu_class_by_name;
>       cc->has_work = mb_cpu_has_work;
>   
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 63da1948fd..649147df2e 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -578,6 +578,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>       resettable_class_set_parent_phases(rc, NULL, mips_cpu_reset_hold, NULL,
>                                          &mcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_MIPS_CPU;
>       cc->class_by_name = mips_cpu_class_by_name;
>       cc->has_work = mips_cpu_has_work;
>       cc->dump_state = mips_cpu_dump_state;
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index bc5cbf81c2..fc7c6a83ee 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -381,6 +381,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, nios2_cpu_reset_hold, NULL,
>                                          &ncc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_NIOS2_CPU;
>       cc->class_by_name = nios2_cpu_class_by_name;
>       cc->has_work = nios2_cpu_has_work;
>       cc->dump_state = nios2_cpu_dump_state;
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 3bbbcc4e63..5e1e0576e0 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -243,6 +243,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, openrisc_cpu_reset_hold, NULL,
>                                          &occ->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_OPENRISC_CPU;
>       cc->class_by_name = openrisc_cpu_class_by_name;
>       cc->has_work = openrisc_cpu_has_work;
>       cc->dump_state = openrisc_cpu_dump_state;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 02b7aad9b0..bc106d01a2 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7357,6 +7357,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, ppc_cpu_reset_hold, NULL,
>                                          &pcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_POWERPC_CPU;
>       cc->class_by_name = ppc_cpu_class_by_name;
>       cc->has_work = ppc_cpu_has_work;
>       cc->dump_state = ppc_cpu_dump_state;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 17b00eb7c0..e8f04ef82b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2130,6 +2130,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>       resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
>                                          &mcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_RISCV_CPU;
>       cc->class_by_name = riscv_cpu_class_by_name;
>       cc->has_work = riscv_cpu_has_work;
>       cc->dump_state = riscv_cpu_dump_state;
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index c98034540d..2a6df418a8 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -222,6 +222,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
>       resettable_class_set_parent_phases(rc, NULL, rx_cpu_reset_hold, NULL,
>                                          &rcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_RX_CPU;
>       cc->class_by_name = rx_cpu_class_by_name;
>       cc->has_work = rx_cpu_has_work;
>       cc->dump_state = rx_cpu_dump_state;
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index df167493c3..bcba466bb4 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -336,6 +336,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
>       device_class_set_parent_reset(dc, s390_cpu_reset_full, &scc->parent_reset);
>   
>       scc->reset = s390_cpu_reset;
> +    cc->cpu_resolving_type = TYPE_S390_CPU;
>       cc->class_by_name = s390_cpu_class_by_name,
>       cc->has_work = s390_cpu_has_work;
>       cc->dump_state = s390_cpu_dump_state;
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index bc112776fc..17c87f15f2 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -283,6 +283,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, superh_cpu_reset_hold, NULL,
>                                          &scc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_SUPERH_CPU;
>       cc->class_by_name = superh_cpu_class_by_name;
>       cc->has_work = superh_cpu_has_work;
>       cc->dump_state = superh_cpu_dump_state;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 130ab8f578..e41a9f4ee2 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -902,6 +902,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, sparc_cpu_reset_hold, NULL,
>                                          &scc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_SPARC_CPU;
>       cc->class_by_name = sparc_cpu_class_by_name;
>       cc->parse_features = sparc_cpu_parse_features;
>       cc->has_work = sparc_cpu_has_work;
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index a2381b0dc1..ffe5158786 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -202,6 +202,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
>   
>       resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
>                                          &mcc->parent_phases);
> +    cc->cpu_resolving_type = TYPE_TRICORE_CPU;
>       cc->class_by_name = tricore_cpu_class_by_name;
>       cc->has_work = tricore_cpu_has_work;
>   
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index a31825a2b5..13bed05d0c 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -252,6 +252,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
>       resettable_class_set_parent_phases(rc, NULL, xtensa_cpu_reset_hold, NULL,
>                                          &xcc->parent_phases);
>   
> +    cc->cpu_resolving_type = TYPE_XTENSA_CPU;
>       cc->class_by_name = xtensa_cpu_class_by_name;
>       cc->has_work = xtensa_cpu_has_work;
>       cc->dump_state = xtensa_cpu_dump_state;


