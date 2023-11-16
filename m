Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD90BC47071
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:19:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3ZT6-0002ZS-LU; Thu, 16 Nov 2023 05:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3ZT4-0002Z0-VF
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:19:26 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3ZT2-0006Ya-MV
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:19:26 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c83d37a492so7579041fa.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 02:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700129963; x=1700734763; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CQRct2TGGtF39Dg9z3MrEvW95l5sO94I/9nPlKUud/k=;
 b=NS5yVaJu3HHWFJd06qB8GYSDqZEWC32vedYxsPcFltHcQzbzMckmteMdjI2vQYPnjl
 9bDcF+n26i3i2EsXYm3K/cZHQ8i+0FKw4w2zLUa40+oxE/3aRLEuP++gVVvDe+x7lePT
 yg19qHSuDHIHz7n8nZPtP4NepKga7FurunEBqY7T4n3h0O+lMcBWAqb91O+1bPQ8Xwh+
 sAt67JZ8Re6ZT5V0wrCsTs69lVR7UIYM3Ja1b8eaGLPx351+X41LupYGqEFx9nQxp1W3
 KRqH1Fjkel8hAjWNhGY7BQes6DsT9pctRf7718Ueev+q2aoQVhZcBnzNYxi4snFBrr4x
 hz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700129963; x=1700734763;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CQRct2TGGtF39Dg9z3MrEvW95l5sO94I/9nPlKUud/k=;
 b=Pyh9dHZEckXyjR9Z5aG37zCoUEWa/5zENx3t9ISioJQGord4C41WtAVbQb1Hh+GBhz
 FMO4S5udOOu0hrYF9j/CcTSAyYEiY4b6hwPCqcirMllNBOs5f5PS2zMq0L36AtNVZtK1
 AFlBSeKe6ahDCkhLTRuUTZ7iGv/n/CyVHB0E+79zFzmMwMIWQsRarf1U67Lq3uHDQC2k
 bo7lgk6j+5+0Ez1emA6ktfIUEky9LSa8DZXSzCfQECK9wit8AzWjcVw4Kn0xv2yzOhTl
 lJhyoFOYkbGbej9Yo39EQNKEPC6LOQquGVfSlMScD31THvvyUw8qyEqIlQJvhRYTNyQ9
 N6nA==
X-Gm-Message-State: AOJu0Ywg7ie2LKRqHbcBbNMZBPobwSDdx7osm0X3Jkku7bIE3Pl6PKd3
 wUR6/kQRikrs2yRyI7yACOwP8w==
X-Google-Smtp-Source: AGHT+IFNklr26HiyuSkhiupDsnVLvsYuDo7i9ws/ipKhXHGDwHErK1UOYvV7AcWMCouJz7B6VSdt1w==
X-Received: by 2002:a2e:8512:0:b0:2c6:ee98:de83 with SMTP id
 j18-20020a2e8512000000b002c6ee98de83mr5846304lji.46.1700129962637; 
 Thu, 16 Nov 2023 02:19:22 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b00405959bbf4fsm2981637wmo.19.2023.11.16.02.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:19:22 -0800 (PST)
Message-ID: <ac71b101-3b61-47fa-b017-766ba55a2c8f@linaro.org>
Date: Thu, 16 Nov 2023 11:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/31] cpu: Add generic cpu_list()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-7-gshan@redhat.com>
 <80da2d00-0d96-4252-b2aa-f7859e44bece@linaro.org>
 <55922c30-be4b-459d-835b-819e1dcd2437@linaro.org>
In-Reply-To: <55922c30-be4b-459d-835b-819e1dcd2437@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 16/11/23 08:51, Philippe Mathieu-Daudé wrote:
> On 16/11/23 08:39, Philippe Mathieu-Daudé wrote:
>> Hi Gavin,
>>
>> On 15/11/23 00:56, Gavin Shan wrote:
>>> Add generic cpu_list() to replace the individual target's implementation
>>> in the subsequent commits. Currently, there are 3 targets with no 
>>> cpu_list()
>>> implementation: microblaze and nios2. With this applied, those two 
>>> targets
>>> switch to the generic cpu_list().
>>>
>>> [gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
>>> Available CPUs:
>>>    microblaze-cpu
>>>
>>> [gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
>>> Available CPUs:
>>>    nios2-cpu
>>>
>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   bsd-user/main.c |  5 +----
>>>   cpu-target.c    | 29 ++++++++++++++++++++++++++---
>>>   2 files changed, 27 insertions(+), 7 deletions(-)
>>
>>
>>> diff --git a/cpu-target.c b/cpu-target.c
>>> index c078c0e91b..acfc654b95 100644
>>> --- a/cpu-target.c
>>> +++ b/cpu-target.c
>>> @@ -24,6 +24,7 @@
>>>   #include "hw/qdev-core.h"
>>>   #include "hw/qdev-properties.h"
>>>   #include "qemu/error-report.h"
>>> +#include "qemu/qemu-print.h"
>>>   #include "migration/vmstate.h"
>>>   #ifdef CONFIG_USER_ONLY
>>>   #include "qemu.h"
>>> @@ -283,12 +284,34 @@ const char *parse_cpu_option(const char 
>>> *cpu_option)
>>>       return cpu_type;
>>>   }
>>> +#ifndef cpu_list
>>> +static void cpu_list_entry(gpointer data, gpointer user_data)
>>> +{
>>> +    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
>>> +    const char *typename = object_class_get_name(OBJECT_CLASS(data));
>>> +    g_autofree char *model = cpu_model_from_type(typename);
>>> +
>>> +    if (cc->deprecation_note) {
>>> +        qemu_printf("  %s (deprecated)\n", model);
>>> +    } else {
>>> +        qemu_printf("  %s\n", model);

Wondering how this scale to heterogeneous emulation. Should we
display the architecture, i.e.:

-- >8 --
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 76ef59de0a..aeff182a37 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -792,6 +792,8 @@ ObjectClass *cpu_class_by_name(const char *typename, 
const char *cpu_model);
   */
  char *cpu_model_from_type(const char *typename);

+char *cpu_arch_from_type(const char *typename);
+
  /**
   * cpu_create:
   * @typename: The CPU type.
diff --git a/cpu-target.c b/cpu-target.c
index acfc654b95..75412f902f 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -257,6 +257,12 @@ char *cpu_model_from_type(const char *typename)
      return g_strdup(typename);
  }

+char *cpu_arch_from_type(const char *typename)
+{
+    assert(g_str_has_suffix(CPU_RESOLVING_TYPE, "-cpu"));
+    return g_strndup(CPU_RESOLVING_TYPE, strlen(CPU_RESOLVING_TYPE) - 
strlen("-cpu"));
+}
+
  const char *parse_cpu_option(const char *cpu_option)
  {
      ObjectClass *oc;
@@ -290,12 +296,11 @@ static void cpu_list_entry(gpointer data, gpointer 
user_data)
      CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
      const char *typename = object_class_get_name(OBJECT_CLASS(data));
      g_autofree char *model = cpu_model_from_type(typename);
+    g_autofree char *arch = cpu_arch_from_type(typename);
+    g_autofree char *arch_up = g_ascii_strup(arch, -1);

-    if (cc->deprecation_note) {
-        qemu_printf("  %s (deprecated)\n", model);
-    } else {
-        qemu_printf("  %s\n", model);
-    }
+    qemu_printf("  %s (%s%s)\n", model, arch_up,
+                cc->deprecation_note ? ", deprecated" : "");
  }
---

Produces:

qemu-system-aarch64 -M mps2-an500 -cpu \?
Available CPUs:
   a64fx (ARM)
   arm1026 (ARM)
   arm1136 (ARM)
   arm1136-r2 (ARM)
   arm1176 (ARM)
   arm11mpcore (ARM)
   arm926 (ARM)
   arm946 (ARM)
   cortex-a15 (ARM)
   cortex-a35 (ARM)
   cortex-a53 (ARM)
   cortex-a55 (ARM)
   cortex-a57 (ARM)
   cortex-a7 (ARM)
   cortex-a710 (ARM)
   cortex-a72 (ARM)
   cortex-a76 (ARM)
   cortex-a8 (ARM)
   cortex-a9 (ARM)
   cortex-m0 (ARM)
   cortex-m3 (ARM)
   cortex-m33 (ARM)
   cortex-m4 (ARM)
   cortex-m55 (ARM)
   cortex-m7 (ARM)
   cortex-r5 (ARM)
   cortex-r52 (ARM)
   cortex-r5f (ARM)
   host (ARM)
   max (ARM)

Bah, host/max are meaningless here. We'll need to filter somehow,
or rename them.

