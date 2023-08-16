Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0024CC04A6A
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 14:24:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHQi-0002aK-Ll; Wed, 16 Aug 2023 10:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHQh-0002ZN-5J
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:23:23 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHQb-0003A2-RN
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:23:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bdf98a6086so15266855ad.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692195796; x=1692800596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pi0YzRrxHtvfsCB/kPsntD6VRIE4uQVeB/AwCXtwNpk=;
 b=kxKXkZ+IfhVJpXkACKad/noDIRf/048BfSCTmLHWv2hXPpCFyRnxfOqPR8N6V/vkiQ
 8teD85jSWqzmBwq7UXbtenIn1mLDZ4Kd1122t0YaTzhZU04DmAHifr6NijqTLl7nbiSU
 ZjRjY7hCaB92Qrb2+92WUbb8lqPVFlDqBtkTeGshh6YRcoCHCC5kET4f5QwEu1fzPyvJ
 aseuaF/G1uh97sIQSChs0IT5SspEFzmB40kA8uN6kU0G8U1lmN5mcRUT2oF73+fu6tPz
 5vH4TVuyxStH09bPqcYvC9FqJ9UfcU9hm1BRc21xURDQ2/L9hYC1wModWIjmBtJwqUEc
 4/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692195796; x=1692800596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pi0YzRrxHtvfsCB/kPsntD6VRIE4uQVeB/AwCXtwNpk=;
 b=bGheuY5mBkKt1j1UEiFTmCIszIkr5AH1ETlePjcmluZ75L3NucR4XzGT/oYGcnHOVC
 WvPIUYK5roPYR+qPiM0r4ulieneu2LHGXx6y+tyQ8h6zwcON92BQEDFwiZPL4oaD/9tk
 Zd/neoESXQWtiac2+gaz181/w8BKzx7m45deF7spVTAU2bvnQuO2cD3LVOYQkUDQB3X3
 qVndh0q0wq2nmBwU9STJnwcyewsU6GF+TxJjL8uA/tRtPZELCcqJt0uqPlvRpd8TBEGE
 s8r4gr2VXD9AA3Ma1GWIPBk4RKddSP3gvmpsJEcqwoXky/8BdvG29HrF12DbZ+DduOOF
 QfTQ==
X-Gm-Message-State: AOJu0Yx4hpDhX3OWF/gs5Ey4Agx6ZlBt9SdCcjSIulb7b/PpnxzD2r1r
 UfD7CLPh4jjvPVaFkgPg8ZVj0g==
X-Google-Smtp-Source: AGHT+IEwdmbvmVU9SqavBTJy822BarEwR1/PmAEiYWnJ8YZEcatMYJyLmDhtopd8xEYxxpjZ4Qugpg==
X-Received: by 2002:a17:903:25cf:b0:1b8:8dbd:e1a0 with SMTP id
 jc15-20020a17090325cf00b001b88dbde1a0mr2102598plb.13.1692195796060; 
 Wed, 16 Aug 2023 07:23:16 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b001bbdf33b878sm13147681plg.272.2023.08.16.07.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 07:23:15 -0700 (PDT)
Message-ID: <f41aae27-8538-46b5-93fa-67de41602077@daynix.com>
Date: Wed, 16 Aug 2023 23:23:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 15/24] target/arm: Fill new members of GDBFeature
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-16-akihiko.odaki@daynix.com>
 <87350lr7p8.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87350lr7p8.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/08/14 23:56, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> These members will be used to help plugins to identify registers.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   target/arm/gdbstub.c   | 46 +++++++++++++++++++++++++++---------------
>>   target/arm/gdbstub64.c | 42 +++++++++++++++++++++++++-------------
>>   2 files changed, 58 insertions(+), 30 deletions(-)
>>
>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>> index 100a6eed15..56d24028f6 100644
>> --- a/target/arm/gdbstub.c
>> +++ b/target/arm/gdbstub.c
>> @@ -270,6 +270,7 @@ static void arm_gen_one_feature_sysreg(GString *s,
>>       g_string_append_printf(s, " regnum=\"%d\"", regnum);
>>       g_string_append_printf(s, " group=\"cp_regs\"/>");
>>       dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] = ri_key;
>> +    ((const char **)dyn_feature->desc.regs)[dyn_feature->desc.num_regs] = ri->name;
>>       dyn_feature->desc.num_regs++;
>>   }
>>   
>> @@ -316,6 +317,8 @@ static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
>>       DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
>>       gsize num_regs = g_hash_table_size(cpu->cp_regs);
>>   
>> +    dyn_feature->desc.name = "org.qemu.gdb.arm.sys.regs";
>> +    dyn_feature->desc.regs = g_new(const char *, num_regs);
> 
> AIUI this means we now have an array of register names which mirrors the
> names embedded in the XML. This smells like a few steps away from just
> abstracting the whole XML away from the targets and generating them
> inside gdbstub when we need them. As per my stalled attempt I referenced
> earlier.

The abstraction is strictly limited for identifiers. Most plugin should 
already have some knowledge of how registers are used. For example, a 
plugin that tracks stack frame for RISC-V should know sp is the stack 
pointer register. Similarly, a cycle simulator plugin should know how 
registers are used in a program. Only identifiers matter in such cases.

I'm definitely *not* in favor of abstracting the whole XML for plugins. 
It will be too hard to maintain ABI compatibility when a new attribute 
emerges, for example.

> 
> 
>>       dyn_feature->desc.num_regs = 0;
>>       dyn_feature->data.cpregs.keys = g_new(uint32_t, num_regs);
>>       g_string_printf(s, "<?xml version=\"1.0\"?>");
>> @@ -418,30 +421,34 @@ static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
>>   }
>>   
>>   static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs,
>> -                                                       int orig_base_reg)
>> +                                                       int base_reg)
>>   {
>>       ARMCPU *cpu = ARM_CPU(cs);
>>       CPUARMState *env = &cpu->env;
>>       GString *s = g_string_new(NULL);
>> -    int base_reg = orig_base_reg;
>> -    int i;
>> +    const char **regs = g_new(const char *, ARRAY_SIZE(m_sysreg_def));
>> +    int i = 0;
>> +    int j;
>>   
>>       g_string_printf(s, "<?xml version=\"1.0\"?>");
>>       g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>>       g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
>>   
>> -    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
>> -        if (arm_feature(env, m_sysreg_def[i].feature)) {
>> +    for (j = 0; j < ARRAY_SIZE(m_sysreg_def); j++) {
>> +        if (arm_feature(env, m_sysreg_def[j].feature)) {
>> +            regs[i] = m_sysreg_def[j].name;
>>               g_string_append_printf(s,
>>                   "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
>> -                m_sysreg_def[i].name, base_reg++);
>> +                m_sysreg_def[j].name, base_reg + i++);
>>           }
>>       }
>>   
>>       g_string_append_printf(s, "</feature>");
>> +    cpu->dyn_m_systemreg_feature.desc.name = "org.gnu.gdb.arm.m-system";
>>       cpu->dyn_m_systemreg_feature.desc.xmlname = "arm-m-system.xml";
>>       cpu->dyn_m_systemreg_feature.desc.xml = g_string_free(s, false);
>> -    cpu->dyn_m_systemreg_feature.desc.num_regs = base_reg - orig_base_reg;
>> +    cpu->dyn_m_systemreg_feature.desc.regs = regs;
>> +    cpu->dyn_m_systemreg_feature.desc.num_regs = i;
>>   
>>       return &cpu->dyn_m_systemreg_feature.desc;
>>   }
>> @@ -462,30 +469,37 @@ static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
>>   }
>>   
>>   static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
>> -                                                       int orig_base_reg)
>> +                                                       int base_reg)
>>   {
>>       ARMCPU *cpu = ARM_CPU(cs);
>>       GString *s = g_string_new(NULL);
>> -    int base_reg = orig_base_reg;
>> -    int i;
>> +    const char **regs = g_new(const char *, ARRAY_SIZE(m_sysreg_def) * 2);
>> +    int i = 0;
>> +    int j;
>>   
>>       g_string_printf(s, "<?xml version=\"1.0\"?>");
>>       g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>>       g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
>>   
>> -    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
>> +    for (j = 0; j < ARRAY_SIZE(m_sysreg_def); j++) {
>> +        regs[i] = g_strconcat(m_sysreg_def[j].name, "_ns", NULL);
>>           g_string_append_printf(s,
>> -            "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
>> -            m_sysreg_def[i].name, base_reg++);
>> +            "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
>> +            regs[i], base_reg + i);
>> +        i++;
>> +        regs[i] = g_strconcat(m_sysreg_def[j].name, "_s", NULL);
>>           g_string_append_printf(s,
>> -            "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
>> -            m_sysreg_def[i].name, base_reg++);
>> +            "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
>> +            regs[i], base_reg + i);
>> +        i++;
>>       }
>>   
>>       g_string_append_printf(s, "</feature>");
>> +    cpu->dyn_m_secextreg_feature.desc.name = "org.gnu.gdb.arm.secext";
>>       cpu->dyn_m_secextreg_feature.desc.xmlname = "arm-m-secext.xml";
>>       cpu->dyn_m_secextreg_feature.desc.xml = g_string_free(s, false);
>> -    cpu->dyn_m_secextreg_feature.desc.num_regs = base_reg - orig_base_reg;
>> +    cpu->dyn_m_secextreg_feature.desc.regs = regs;
>> +    cpu->dyn_m_secextreg_feature.desc.num_regs = i;
>>   
>>       return &cpu->dyn_m_secextreg_feature.desc;
>>   }
>> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
>> index 20483ef9bc..c5ed7c0aa3 100644
>> --- a/target/arm/gdbstub64.c
>> +++ b/target/arm/gdbstub64.c
>> @@ -316,15 +316,21 @@ static void output_vector_union_type(GString *s, int reg_width,
>>       g_string_append(s, "</union>");
>>   }
>>   
>> -GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int orig_base_reg)
>> +GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
>>   {
>>       ARMCPU *cpu = ARM_CPU(cs);
>>       GString *s = g_string_new(NULL);
>>       DynamicGDBFeatureInfo *info = &cpu->dyn_svereg_feature;
>> +    const char **regs;
>>       int reg_width = cpu->sve_max_vq * 128;
>>       int pred_width = cpu->sve_max_vq * 16;
>> -    int base_reg = orig_base_reg;
>> -    int i;
>> +    int i = 0;
>> +    int j;
>> +
>> +    info->desc.name = "org.gnu.gdb.aarch64.sve";
>> +    info->desc.num_regs = 32 + 16 + 4;
>> +    regs = g_new(const char *, info->desc.num_regs);
>> +    info->desc.regs = regs;
>>   
>>       g_string_printf(s, "<?xml version=\"1.0\"?>");
>>       g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>> @@ -339,44 +345,52 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int orig_base_reg)
>>                              pred_width / 8);
>>   
>>       /* Define the vector registers. */
>> -    for (i = 0; i < 32; i++) {
>> +    for (j = 0; j < 32; j++) {
>> +        regs[i] = g_strdup_printf("z%d", j);
>>           g_string_append_printf(s,
>> -                               "<reg name=\"z%d\" bitsize=\"%d\""
>> +                               "<reg name=\"%s\" bitsize=\"%d\""
>>                                  " regnum=\"%d\" type=\"svev\"/>",
>> -                               i, reg_width, base_reg++);
>> +                               regs[i], reg_width, base_reg + i);
>> +        i++;
>>       }
>>   
>>       /* fpscr & status registers */
>> +    regs[i] = "fpsr";
>>       g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
>>                              " regnum=\"%d\" group=\"float\""
>> -                           " type=\"int\"/>", base_reg++);
>> +                           " type=\"int\"/>", base_reg + i++);
>> +    regs[i] = "fpcr";
>>       g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
>>                              " regnum=\"%d\" group=\"float\""
>> -                           " type=\"int\"/>", base_reg++);
>> +                           " type=\"int\"/>", base_reg + i++);
>>   
>>       /* Define the predicate registers. */
>> -    for (i = 0; i < 16; i++) {
>> +    for (j = 0; j < 16; j++) {
>> +        regs[i] = g_strdup_printf("p%d", j);
>>           g_string_append_printf(s,
>> -                               "<reg name=\"p%d\" bitsize=\"%d\""
>> +                               "<reg name=\"%s\" bitsize=\"%d\""
>>                                  " regnum=\"%d\" type=\"svep\"/>",
>> -                               i, pred_width, base_reg++);
>> +                               regs[i], pred_width, base_reg + i);
>> +        i++;
>>       }
>> +    regs[i] = "ffr";
>>       g_string_append_printf(s,
>>                              "<reg name=\"ffr\" bitsize=\"%d\""
>>                              " regnum=\"%d\" group=\"vector\""
>>                              " type=\"svep\"/>",
>> -                           pred_width, base_reg++);
>> +                           pred_width, base_reg + i++);
>>   
>>       /* Define the vector length pseudo-register. */
>> +    regs[i] = "vg";
>>       g_string_append_printf(s,
>>                              "<reg name=\"vg\" bitsize=\"64\""
>>                              " regnum=\"%d\" type=\"int\"/>",
>> -                           base_reg++);
>> +                           base_reg + i++);
>>   
>>       g_string_append_printf(s, "</feature>");
>>   
>>       info->desc.xmlname = "sve-registers.xml";
>>       info->desc.xml = g_string_free(s, false);
>> -    info->desc.num_regs = base_reg - orig_base_reg;
>> +    assert(info->desc.num_regs == i);
>>       return &info->desc;
>>   }
> 
> 

