Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D692C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 19:46:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rKkiN-0007nz-45; Tue, 02 Jan 2024 14:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rKkiK-0007ly-C6
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 14:46:12 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rKki7-0007Sj-W4
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 14:46:12 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d3dee5f534so67737375ad.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jan 2024 11:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704224758; x=1704829558; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J5oSn395Pqfqf7kSPKsJ/LsH8wEE7a9PzAPZco3bgsc=;
 b=YgGPNAjrB3Iu6ovYsX3LeAAoSL/NlA57Q4BZQYC/JpVf4y9EEt7L9qQNVYKChpsVAF
 v1d4Vy8dgmCR3vIz7SX0gt5KtvR39ELMexN+8vLjglsMKmXlJp176VAEd58Mfor+f9qH
 iYw6VgW5vtMsrqjK+WhYBUAohpnDigAGhqXZ/qGf4x7mzRSNqamHJDaFMwCq7W4GjKLT
 mL2KDuRTSbuyzXSUWBzCmzQQISaATn68wZUZBYflT5yn0zoGCESRIaIp6Bc0r5fkOzgw
 sV68e9M57XAlV1Sl/Tw3NzSDKoxCANIDBKzqVky1rc4mxUjbdMEJbudneXc3MewYNaPn
 lzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704224758; x=1704829558;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J5oSn395Pqfqf7kSPKsJ/LsH8wEE7a9PzAPZco3bgsc=;
 b=hMVDdew9qGjtf1EDmxRkfBl+EIt2AlsyRjLkJfn4g+YaqhD2T68xOYuW8BU06mP/qZ
 iGHc1GCwSYuZb0tWx0GGr7hQ9MGBiI/z+ZPCCdpfX5dWm4G4uKBQcfWiIcWoHd9INKTq
 adHHoW9tQeOYDGg9t33nQpm3+9JvgDEROnKsEY5v8bCzNbxckbiF2V0lbIzdUrxOS+Nc
 wOJzt4p7a+Z5y289cxDiL1B8m46OiFxH8cpcDijRcxWsT6ldV0p7d5S9b+L8swtyajnD
 Tgoqpe9IXT+IOMi8JKQLj2CEXL1UrXoTCNpYvwetma1Gu36ksYOCBGTzkksEq8haEDqt
 +15w==
X-Gm-Message-State: AOJu0YwNZlKidwScTMN1X/lee99BaNhRJ2mkEywumEgT3H2yicWnE89g
 rROomXw8gdS2gPfUhtyt7uV8ycnVYdZrEg==
X-Google-Smtp-Source: AGHT+IGSzXo3fwz5+go1Mk7cr5Z6lBTtsIOg0IrIEmNjRNXN9SGrP0A7a0RLXx8IYXmJh9VHq/ktgg==
X-Received: by 2002:a17:90a:d587:b0:28c:f95:621f with SMTP id
 v7-20020a17090ad58700b0028c0f95621fmr18589881pju.33.1704224757728; 
 Tue, 02 Jan 2024 11:45:57 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 rs16-20020a17090b2b9000b00286da7407f2sm27197122pjb.7.2024.01.02.11.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 11:45:57 -0800 (PST)
Message-ID: <515e56ad-acbc-4105-99a5-90aaab3bd80d@ventanamicro.com>
Date: Tue, 2 Jan 2024 16:45:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] target/riscv: move 'vlen' to
 riscv_cpu_properties[]
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
 <20231222122235.545235-9-dbarboza@ventanamicro.com>
 <346d8260-bed8-492b-aae3-8110b7663e5e@syntacore.com>
 <cb307b8b-dfc8-4c10-9420-281865eb678c@ventanamicro.com>
In-Reply-To: <cb307b8b-dfc8-4c10-9420-281865eb678c@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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



On 1/2/24 09:04, Daniel Henrique Barboza wrote:
> 
> 
> On 12/29/23 08:22, Vladimir Isaev wrote:
>> 22.12.2023 15:22, Daniel Henrique Barboza wrote:
>>>
>>> Turning 'vlen' into a class property will allow its default value to be
>>> overwritten by cpu_init() later on, solving the issue we have now where
>>> CPU specific settings are getting overwritten by the default.
>>>
>>> For 'vlen', 'elen' and the blocksize options we need a way of tracking
>>> if the user set a value for them. This is benign for TCG since the cost
>>> of always validating these values are small, but for KVM we need syscalls
>>> to read the host values to make the validations. Knowing whether the
>>> user didn't touch the values makes a difference. We'll track user setting
>>> for these properties using a hash, like we do in the TCG driver.
>>>
>>> Common validation bits are moved from riscv_cpu_validate_v() to
>>> prop_vlen_set() to be shared with KVM.
>>>
>>> And, as done with every option we migrated to riscv_cpu_properties[],
>>> vendor CPUs can't have their 'vlen' value changed.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   target/riscv/cpu.c         | 63 +++++++++++++++++++++++++++++++++++++-
>>>   target/riscv/tcg/tcg-cpu.c |  5 ---
>>>   2 files changed, 62 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index d6625399a7..c2ff50bcab 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -29,6 +29,7 @@
>>>   #include "qapi/visitor.h"
>>>   #include "qemu/error-report.h"
>>>   #include "hw/qdev-properties.h"
>>> +#include "hw/core/qdev-prop-internal.h"
>>>   #include "migration/vmstate.h"
>>>   #include "fpu/softfloat-helpers.h"
>>>   #include "sysemu/kvm.h"
>>> @@ -53,6 +54,15 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>>>   #define BYTE(x)   (x)
>>>   #endif
>>>
>>> +/* Hash that stores general user set numeric options */
>>> +static GHashTable *general_user_opts;
>>> +
>>> +static void cpu_option_add_user_setting(const char *optname, uint32_t value)
>>> +{
>>> +    g_hash_table_insert(general_user_opts, (gpointer)optname,
>>> +                        GUINT_TO_POINTER(value));
>>> +}
>>> +
>>>   #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>>>       {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
>>>
>>> @@ -1244,6 +1254,8 @@ static void riscv_cpu_init(Object *obj)
>>>                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>>>   #endif /* CONFIG_USER_ONLY */
>>>
>>> +    general_user_opts = g_hash_table_new(g_str_hash, g_str_equal);
>>> +
>>>       /*
>>>        * The timer and performance counters extensions were supported
>>>        * in QEMU before they were added as discrete extensions in the
>>> @@ -1664,8 +1676,54 @@ static const PropertyInfo prop_vext_spec = {
>>>       .set = prop_vext_spec_set,
>>>   };
>>>
>>> +static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
>>> +                         void *opaque, Error **errp)
>>> +{
>>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>>> +    uint16_t value;
>>> +
>>> +    if (!visit_type_uint16(v, name, &value, errp)) {
>>> +        return;
>>> +    }
>>> +
>>> +    if (!is_power_of_2(value)) {
>>> +        error_setg(errp, "Vector extension VLEN must be power of 2");
>>> +        return;
>>> +    }
>>> +
>>> +    /* Always allow setting a default value */
>>
>> What is the case for vlen equal to 0? Since in properties it is defined with default value set to 128.
> 
> The process of setting a default uses the default setter of the property. I.e.
> when setting vlen default value to 128, this function will be called with
> value = 128 when cpu->cfg.vlen is 0.
> 
> If we don't special case this scenario we'll fail the "vendor CPUs don't allow
> changing vlen" check that comes right after.

I'll change this design. If we need to special case the default case for every
setter to not collide with the vendor CPU check, then we're better of adding the
defaults manually in riscv_cpu_init(). The defaults there will be overwritten by
any defaults set in the cpu_inits() of the CPUs, so in the end it's the same
effect but without the extra bloat in the setters().

In fact, reading the docs we see the following note on the 'set_default' Property
flag:

  * Property:
  * @set_default: true if the default value should be set from @defval,
  *    in which case @info->set_default_value must not be NULL
  *    (if false then no default value is set by the property system
  *     and the field retains whatever value it was given by instance_init).

So I believe putting the defaults in riscv_cpu_init() is covered by the intended
design.


Thanks,

Daniel


> 
> 
> Thanks,
> 
> Daniel
> 
>>
>>> +    if (cpu->cfg.vlen == 0) {
>>> +        cpu->cfg.vlen = value;
>>> +        return;
>>> +    }
>>> +
>>> +    if (value != cpu->cfg.vlen && riscv_cpu_is_vendor(obj)) {
>>> +        cpu_set_prop_err(cpu, name, errp);
>>> +        error_append_hint(errp, "Current '%s' val: %u\n",
>>> +                          name, cpu->cfg.vlen);
>>> +        return;
>>> +    }
>>> +
>>> +    cpu_option_add_user_setting(name, value);
>>> +    cpu->cfg.vlen = value;
>>> +}
>>> +
>>> +static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
>>> +                         void *opaque, Error **errp)
>>> +{
>>> +    uint16_t value = RISCV_CPU(obj)->cfg.vlen;
>>> +
>>> +    visit_type_uint16(v, name, &value, errp);
>>> +}
>>> +
>>> +static const PropertyInfo prop_vlen = {
>>> +    .name = "vlen",
>>> +    .get = prop_vlen_get,
>>> +    .set = prop_vlen_set,
>>> +    .set_default_value = qdev_propinfo_set_default_value_uint,
>>> +};
>>> +
>>>   Property riscv_cpu_options[] = {
>>> -    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>>>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>>>
>>>       DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
>>> @@ -1687,6 +1745,9 @@ static Property riscv_cpu_properties[] = {
>>>       {.name = "priv_spec", .info = &prop_priv_spec},
>>>       {.name = "vext_spec", .info = &prop_vext_spec},
>>>
>>> +    {.name = "vlen", .info = &prop_vlen,
>>> +     .set_default = true, .defval.u = 128},
>>> +
>>>   #ifndef CONFIG_USER_ONLY
>>>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
>>>   #endif
>>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>>> index 6501c29d8e..8ec858e096 100644
>>> --- a/target/riscv/tcg/tcg-cpu.c
>>> +++ b/target/riscv/tcg/tcg-cpu.c
>>> @@ -178,11 +178,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>>   static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>>>                                    Error **errp)
>>>   {
>>> -    if (!is_power_of_2(cfg->vlen)) {
>>> -        error_setg(errp, "Vector extension VLEN must be power of 2");
>>> -        return;
>>> -    }
>>> -
>>>       if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
>>>           error_setg(errp,
>>>                      "Vector extension implementation only supports VLEN "
>>> -- 
>>> 2.43.0
>>>
>>>

