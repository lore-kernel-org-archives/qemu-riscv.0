Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92BAC001DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 14:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQTS7-00034W-UN; Mon, 31 Jul 2023 10:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQTS0-00031i-U3
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 10:00:50 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQTRu-0004iF-Ch
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 10:00:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bb81809ca8so35875345ad.3
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690812028; x=1691416828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dFI5/dDGgtKfts1m9Qur3+hIlx9/w17jNCSRDR4ep4A=;
 b=3EPqxcNQLkbIAN43BnvhYZVYFN8u1avdTBAov9OH4wtbeM2Z/NKEQdQOXqOQqaSA7W
 wzU0t/EQvRuU+GjQjJd+AkPA1CQK5Yi1ZInbVUkjrnoYJxEmBDhASTvZUwboLnpe2ad9
 evmGSq52GlcBtKeCA43f8XyfLcLGT8KVBN6A5jEhptsqms8uAcya+MkMvYG3aos3C/en
 DtnP7HixhflynPBJNKOchyxMUeOHGLUfZMUN2EYFlBuV4ftryIydIWL7lVchim3/cobK
 aNpaUWV3K5bOBUhPol7UOvmxMf7DKUfW07qLqq8sVTi4DBIWC1nu3XNbeaAjdd1+hqW/
 GkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690812028; x=1691416828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dFI5/dDGgtKfts1m9Qur3+hIlx9/w17jNCSRDR4ep4A=;
 b=fNtxxYtmjG/m7guvcuK+gIYokPATRRTDu7KlzyOZfA/zKIMFIn38mxk3lZueqVzKd/
 81GSif4NUAguOHMqqzWtvVDIRgHnzF1R4zewFVIA4KRilOk8hNJAxp/YFy0nrBQ69NKi
 zMt9GJgAgTIqZ/UGoI6QPUE2+brh5jE4lX6PCq6bAcNWKv3UOBaZcrX+fqYsMVVnqdBa
 AOh+B1SGKeH8BaATxgQ4opT19NVqyreICfQS0KBvqsyj6MleLDGNcGwrT9gCydIWmrA1
 CPzsR2OSQSQ20OQEXZT7OGyZNrmD5vpjFCU/+tNbU9q7WD4TFu+7TAXjLymnIxpHE1gR
 9Xbg==
X-Gm-Message-State: ABy/qLaDn04bXBV4HDyI9wvQSwpg6MHDro/ZTNdx77dbnvCnTjSR+kfs
 7SZde/Pf37JSliiCubJSltUgbw==
X-Google-Smtp-Source: APBJJlFvL8s6ELhm4xoUw4u+DrnTuGXUQIjU2FysvwOYLzpco137/GPcI1hDqnIqDVUiZC9M1PCW4A==
X-Received: by 2002:a17:903:1ce:b0:1b8:88c5:2d2f with SMTP id
 e14-20020a17090301ce00b001b888c52d2fmr11462865plh.64.1690812028070; 
 Mon, 31 Jul 2023 07:00:28 -0700 (PDT)
Received: from [10.4.77.242] ([118.103.63.133])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a170902c1c600b001acae9734c0sm8638603plc.266.2023.07.31.07.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 07:00:27 -0700 (PDT)
Message-ID: <e11c2c4b-fcf8-cd24-2735-0ea107b289d3@daynix.com>
Date: Mon, 31 Jul 2023 23:00:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/24] target/arm: Use GDBFeature for dynamic XML
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
 <20230731084354.115015-8-akihiko.odaki@daynix.com>
 <6c92b326-d386-2dd4-c9a0-cbf9e7583243@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <6c92b326-d386-2dd4-c9a0-cbf9e7583243@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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

On 2023/07/31 22:44, Philippe Mathieu-Daudé wrote:
> On 31/7/23 10:43, Akihiko Odaki wrote:
>> In preparation for a change to use GDBFeature as a parameter of
>> gdb_register_coprocessor(), convert the internal representation of
>> dynamic feature from plain XML to GDBFeature.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   target/arm/cpu.h       | 20 +++++------
>>   target/arm/internals.h |  2 +-
>>   target/arm/gdbstub.c   | 80 +++++++++++++++++++++++-------------------
>>   target/arm/gdbstub64.c | 11 +++---
>>   4 files changed, 60 insertions(+), 53 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 88e5accda6..d6c2378d05 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -136,23 +136,21 @@ enum {
>>    */
>>   /**
>> - * DynamicGDBXMLInfo:
>> - * @desc: Contains the XML descriptions.
>> - * @num: Number of the registers in this XML seen by GDB.
>> + * DynamicGDBFeatureInfo:
>> + * @desc: Contains the feature descriptions.
>>    * @data: A union with data specific to the set of registers
>>    *    @cpregs_keys: Array that contains the corresponding Key of
>>    *                  a given cpreg with the same order of the cpreg
>>    *                  in the XML description.
>>    */
>> -typedef struct DynamicGDBXMLInfo {
>> -    char *desc;
>> -    int num;
>> +typedef struct DynamicGDBFeatureInfo {
>> +    GDBFeature desc;
>>       union {
>>           struct {
>>               uint32_t *keys;
>>           } cpregs;
>>       } data;
>> -} DynamicGDBXMLInfo;
>> +} DynamicGDBFeatureInfo;
>>   /* CPU state for each instance of a generic timer (in cp15 c14) */
>>   typedef struct ARMGenericTimer {
>> @@ -881,10 +879,10 @@ struct ArchCPU {
>>       uint64_t *cpreg_vmstate_values;
>>       int32_t cpreg_vmstate_array_len;
>> -    DynamicGDBXMLInfo dyn_sysreg_xml;
>> -    DynamicGDBXMLInfo dyn_svereg_xml;
>> -    DynamicGDBXMLInfo dyn_m_systemreg_xml;
>> -    DynamicGDBXMLInfo dyn_m_secextreg_xml;
>> +    DynamicGDBFeatureInfo dyn_sysreg_feature;
>> +    DynamicGDBFeatureInfo dyn_svereg_feature;
>> +    DynamicGDBFeatureInfo dyn_m_systemreg_feature;
>> +    DynamicGDBFeatureInfo dyn_m_secextreg_feature;
> 
> Since now DynamicGDBFeatureInfo.desc contains xmlname, we can replace
> all these by a generic 'DynamicGDBFeatureInfo *dyn_features' and have
> arm_gdb_get_dynamic_xml() looking up the xmlname.

In patch 12, cpu-specific gdb_get_dynamic_xml() function is removed, and 
gdbstub instead looks up an internal list it holds.

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> @@ -489,14 +497,14 @@ const char *arm_gdb_get_dynamic_xml(CPUState 
>> *cs, const char *xmlname)
>>       ARMCPU *cpu = ARM_CPU(cs);
>>       if (strcmp(xmlname, "system-registers.xml") == 0) {
>> -        return cpu->dyn_sysreg_xml.desc;
>> +        return cpu->dyn_sysreg_feature.desc.xml;
>>       } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
>> -        return cpu->dyn_svereg_xml.desc;
>> +        return cpu->dyn_svereg_feature.desc.xml;
>>       } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
>> -        return cpu->dyn_m_systemreg_xml.desc;
>> +        return cpu->dyn_m_systemreg_feature.desc.xml;
>>   #ifndef CONFIG_USER_ONLY
>>       } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
>> -        return cpu->dyn_m_secextreg_xml.desc;
>> +        return cpu->dyn_m_secextreg_feature.desc.xml;
>>   #endif
>>       }
>>       return NULL;
> 

