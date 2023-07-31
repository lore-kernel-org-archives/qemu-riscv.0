Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE33DC001DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:45:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQTCj-0000CF-Bk; Mon, 31 Jul 2023 09:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQTCh-0000Am-Gi
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:44:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQTCe-0001Pn-Gd
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:44:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe1fc8768aso12097115e9.1
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690811091; x=1691415891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5EwGHoMLAhNqYUVT0oA6NfF6LfmubritLODr0v0MJtQ=;
 b=i+8ADQ5GQHcDMQj22X/FA0iDyqcUk+Dcf3/pTyWw8snGgzC213RXMBdWQ+Gvc+oscJ
 LZ2p2MneWsTlNGNS3fsCLYc6R4lBAGAAZ+fIQ5uPjjzDpVUItZ4qIvErlUk9VZ6MKCLt
 Pwi6fYLZoaEexBTXNqgA4Jnjs72ce7MUvbBrjjCEIdgOC9/Nw9q0JDHsr5CPj5bDns20
 lnWdKLAI9VdvUZms3fg0QshFfanfjFkaGffyNaNammNkVlc8XLhMMFNPO3n3wnVEZYq0
 qPvD4nICE7BazifeTsH5XFl2n3d/61WH9Ok/bq+y4XYj5NsTsvh2sX5bvUEKK8zt+WcH
 uIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690811091; x=1691415891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5EwGHoMLAhNqYUVT0oA6NfF6LfmubritLODr0v0MJtQ=;
 b=aQYSbTVToA2Ln3/M4lhtOItMDEpWfF4WhBargkTDpPrVmN1LdSJ8DGGBksvoUzY57X
 GT0E2bR/w2JigjCxFRIq8o/crV0y1fSpkFU0V5/CKpIXjj1W5XeFDYV6A7naShuXp0/i
 J4XZoxtnHQcNZCM3/eOTUcmKmGGA8pshyECpBjZy8wJdQ7G2UfLS9ummSf4YJ3BZx8kf
 vrc8CTKSRWfRk23r9XZe5jqRutVSEN/SpqQdz4NnRWMZoV+9g9VqPF8ytr6X8nAohqQS
 kQ4vx0vWiLOijOvjRI0uCiLkCX6istGAorJaUJVg13TMp6V35y8AxNDFGoTjpCaXdTiO
 eMXg==
X-Gm-Message-State: ABy/qLZaAG/jIbmk2CVW91TjqQ6eVHCNzDMChr698I2KF4/CYuGEnL/n
 xjERMUHoZPoJnkeZjrv+cZquqw==
X-Google-Smtp-Source: APBJJlFvU/UKA6OnFuC+hta+gt8YF5CUA5lRNK9tWn2/Gg55fXyDkOO1nqE80rh6qABbSklGYurOxA==
X-Received: by 2002:a05:600c:2296:b0:3fe:ad3:b066 with SMTP id
 22-20020a05600c229600b003fe0ad3b066mr8228885wmf.41.1690811090841; 
 Mon, 31 Jul 2023 06:44:50 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.198.42])
 by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b0031773a8e5c4sm13147248wrn.37.2023.07.31.06.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:44:50 -0700 (PDT)
Message-ID: <6c92b326-d386-2dd4-c9a0-cbf9e7583243@linaro.org>
Date: Mon, 31 Jul 2023 15:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 07/24] target/arm: Use GDBFeature for dynamic XML
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
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
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-8-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
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

On 31/7/23 10:43, Akihiko Odaki wrote:
> In preparation for a change to use GDBFeature as a parameter of
> gdb_register_coprocessor(), convert the internal representation of
> dynamic feature from plain XML to GDBFeature.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/arm/cpu.h       | 20 +++++------
>   target/arm/internals.h |  2 +-
>   target/arm/gdbstub.c   | 80 +++++++++++++++++++++++-------------------
>   target/arm/gdbstub64.c | 11 +++---
>   4 files changed, 60 insertions(+), 53 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 88e5accda6..d6c2378d05 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -136,23 +136,21 @@ enum {
>    */
>   
>   /**
> - * DynamicGDBXMLInfo:
> - * @desc: Contains the XML descriptions.
> - * @num: Number of the registers in this XML seen by GDB.
> + * DynamicGDBFeatureInfo:
> + * @desc: Contains the feature descriptions.
>    * @data: A union with data specific to the set of registers
>    *    @cpregs_keys: Array that contains the corresponding Key of
>    *                  a given cpreg with the same order of the cpreg
>    *                  in the XML description.
>    */
> -typedef struct DynamicGDBXMLInfo {
> -    char *desc;
> -    int num;
> +typedef struct DynamicGDBFeatureInfo {
> +    GDBFeature desc;
>       union {
>           struct {
>               uint32_t *keys;
>           } cpregs;
>       } data;
> -} DynamicGDBXMLInfo;
> +} DynamicGDBFeatureInfo;
>   
>   /* CPU state for each instance of a generic timer (in cp15 c14) */
>   typedef struct ARMGenericTimer {
> @@ -881,10 +879,10 @@ struct ArchCPU {
>       uint64_t *cpreg_vmstate_values;
>       int32_t cpreg_vmstate_array_len;
>   
> -    DynamicGDBXMLInfo dyn_sysreg_xml;
> -    DynamicGDBXMLInfo dyn_svereg_xml;
> -    DynamicGDBXMLInfo dyn_m_systemreg_xml;
> -    DynamicGDBXMLInfo dyn_m_secextreg_xml;
> +    DynamicGDBFeatureInfo dyn_sysreg_feature;
> +    DynamicGDBFeatureInfo dyn_svereg_feature;
> +    DynamicGDBFeatureInfo dyn_m_systemreg_feature;
> +    DynamicGDBFeatureInfo dyn_m_secextreg_feature;

Since now DynamicGDBFeatureInfo.desc contains xmlname, we can replace
all these by a generic 'DynamicGDBFeatureInfo *dyn_features' and have
arm_gdb_get_dynamic_xml() looking up the xmlname.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> @@ -489,14 +497,14 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
>       ARMCPU *cpu = ARM_CPU(cs);
>   
>       if (strcmp(xmlname, "system-registers.xml") == 0) {
> -        return cpu->dyn_sysreg_xml.desc;
> +        return cpu->dyn_sysreg_feature.desc.xml;
>       } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
> -        return cpu->dyn_svereg_xml.desc;
> +        return cpu->dyn_svereg_feature.desc.xml;
>       } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
> -        return cpu->dyn_m_systemreg_xml.desc;
> +        return cpu->dyn_m_systemreg_feature.desc.xml;
>   #ifndef CONFIG_USER_ONLY
>       } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
> -        return cpu->dyn_m_secextreg_xml.desc;
> +        return cpu->dyn_m_secextreg_feature.desc.xml;
>   #endif
>       }
>       return NULL;


