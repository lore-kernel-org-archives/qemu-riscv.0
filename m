Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3D4C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 12:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rKdVj-0002q7-3O; Tue, 02 Jan 2024 07:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rKdVh-0002pT-5k
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 07:04:41 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rKdVV-0000xh-FP
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 07:04:40 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so549523b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Jan 2024 04:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704197068; x=1704801868; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JfIuPENYZ8JbpZW3U2QQ6Cx6wbyARRSkcKv4zbbDRqg=;
 b=X/OIYG9N+SWo9f0tw+vJkgef/LLfZjrC1oWlngyazDlbkfzm2VNDInoCgJ/Z2492I0
 HbKah4fOWOf08K1liL4zReNz32xiClbQONGBIRF9e2HNBm20/hBkFbDC++bUOMLwN5Ej
 8KDjkF8+Vb4z+/3bk/DoVP29yFRrHKYsvquIhA8dA43pKxpooL1n+/qwPW3CoAv1dPVg
 pHPm9W9RK05P0DKSAxmUfF62QaBTzQe83prhs/gllYkbMfKlHnLXzcfSYg4MVy/Rh3EH
 F+BwQ8NBuGpOvNXDM9ClLC9XM6nLjxfcTSr9GInfdyy2kM2zJYjPSSnMa41yzTvTWhlr
 pdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704197068; x=1704801868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JfIuPENYZ8JbpZW3U2QQ6Cx6wbyARRSkcKv4zbbDRqg=;
 b=UcIVqpHkYlX7THG8F4/gS520HcB8SEUON72DK0nYsgv4kPYY/W+3ckWtq1V8jyX0br
 1XmxevRxVhvKI3SqIQ65pYWKIlhTRWa2ma7P2ZyIQlIuQ7Cv3Wm49NuyFac5LQe+O/yl
 69YN9t2NTG1DXaqhVy0hSjNBlnmi4AeZi5K/lX9wdFRPRljKJxi/xhAI5krT2KNVl8oF
 pE5xPj+eogafl4EAymEn1L39r7TsH0m/TinW6v8OZobw/kyvNImaenow29aQhXjRKFPJ
 cYw/k0YQPbPk1sU0pwybrTmLqaeTk34FlrFIQjK+Pbki2cPMaCALfeNwICAj6VKrljaK
 m2zg==
X-Gm-Message-State: AOJu0YwJSoqoFxxc5e3g5soWU6BiD7PDes/KXqpiPsolQmR9KUuPuYH1
 hUTIbq0FD73LgPNSRlo+bdBeCfSfJMkJqQ==
X-Google-Smtp-Source: AGHT+IGrR4JfESd4l0RzFnWEEjunBTXUN1VYfNgzsF2hPghhJXt8NGsRbnZMqyJx4iVpFadyBQFsxw==
X-Received: by 2002:a05:6a00:2315:b0:6d9:c0a0:b1f2 with SMTP id
 h21-20020a056a00231500b006d9c0a0b1f2mr14348780pfh.46.1704197067909; 
 Tue, 02 Jan 2024 04:04:27 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 i26-20020aa78b5a000000b006cdb17f9ffdsm20905550pfd.66.2024.01.02.04.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 04:04:27 -0800 (PST)
Message-ID: <cb307b8b-dfc8-4c10-9420-281865eb678c@ventanamicro.com>
Date: Tue, 2 Jan 2024 09:04:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] target/riscv: move 'vlen' to
 riscv_cpu_properties[]
Content-Language: en-US
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
 <20231222122235.545235-9-dbarboza@ventanamicro.com>
 <346d8260-bed8-492b-aae3-8110b7663e5e@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <346d8260-bed8-492b-aae3-8110b7663e5e@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 12/29/23 08:22, Vladimir Isaev wrote:
> 22.12.2023 15:22, Daniel Henrique Barboza wrote:
>>
>> Turning 'vlen' into a class property will allow its default value to be
>> overwritten by cpu_init() later on, solving the issue we have now where
>> CPU specific settings are getting overwritten by the default.
>>
>> For 'vlen', 'elen' and the blocksize options we need a way of tracking
>> if the user set a value for them. This is benign for TCG since the cost
>> of always validating these values are small, but for KVM we need syscalls
>> to read the host values to make the validations. Knowing whether the
>> user didn't touch the values makes a difference. We'll track user setting
>> for these properties using a hash, like we do in the TCG driver.
>>
>> Common validation bits are moved from riscv_cpu_validate_v() to
>> prop_vlen_set() to be shared with KVM.
>>
>> And, as done with every option we migrated to riscv_cpu_properties[],
>> vendor CPUs can't have their 'vlen' value changed.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c         | 63 +++++++++++++++++++++++++++++++++++++-
>>   target/riscv/tcg/tcg-cpu.c |  5 ---
>>   2 files changed, 62 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index d6625399a7..c2ff50bcab 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -29,6 +29,7 @@
>>   #include "qapi/visitor.h"
>>   #include "qemu/error-report.h"
>>   #include "hw/qdev-properties.h"
>> +#include "hw/core/qdev-prop-internal.h"
>>   #include "migration/vmstate.h"
>>   #include "fpu/softfloat-helpers.h"
>>   #include "sysemu/kvm.h"
>> @@ -53,6 +54,15 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>>   #define BYTE(x)   (x)
>>   #endif
>>
>> +/* Hash that stores general user set numeric options */
>> +static GHashTable *general_user_opts;
>> +
>> +static void cpu_option_add_user_setting(const char *optname, uint32_t value)
>> +{
>> +    g_hash_table_insert(general_user_opts, (gpointer)optname,
>> +                        GUINT_TO_POINTER(value));
>> +}
>> +
>>   #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>>       {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
>>
>> @@ -1244,6 +1254,8 @@ static void riscv_cpu_init(Object *obj)
>>                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>>   #endif /* CONFIG_USER_ONLY */
>>
>> +    general_user_opts = g_hash_table_new(g_str_hash, g_str_equal);
>> +
>>       /*
>>        * The timer and performance counters extensions were supported
>>        * in QEMU before they were added as discrete extensions in the
>> @@ -1664,8 +1676,54 @@ static const PropertyInfo prop_vext_spec = {
>>       .set = prop_vext_spec_set,
>>   };
>>
>> +static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
>> +                         void *opaque, Error **errp)
>> +{
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    uint16_t value;
>> +
>> +    if (!visit_type_uint16(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (!is_power_of_2(value)) {
>> +        error_setg(errp, "Vector extension VLEN must be power of 2");
>> +        return;
>> +    }
>> +
>> +    /* Always allow setting a default value */
> 
> What is the case for vlen equal to 0? Since in properties it is defined with default value set to 128.

The process of setting a default uses the default setter of the property. I.e.
when setting vlen default value to 128, this function will be called with
value = 128 when cpu->cfg.vlen is 0.

If we don't special case this scenario we'll fail the "vendor CPUs don't allow
changing vlen" check that comes right after.


Thanks,

Daniel

> 
>> +    if (cpu->cfg.vlen == 0) {
>> +        cpu->cfg.vlen = value;
>> +        return;
>> +    }
>> +
>> +    if (value != cpu->cfg.vlen && riscv_cpu_is_vendor(obj)) {
>> +        cpu_set_prop_err(cpu, name, errp);
>> +        error_append_hint(errp, "Current '%s' val: %u\n",
>> +                          name, cpu->cfg.vlen);
>> +        return;
>> +    }
>> +
>> +    cpu_option_add_user_setting(name, value);
>> +    cpu->cfg.vlen = value;
>> +}
>> +
>> +static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
>> +                         void *opaque, Error **errp)
>> +{
>> +    uint16_t value = RISCV_CPU(obj)->cfg.vlen;
>> +
>> +    visit_type_uint16(v, name, &value, errp);
>> +}
>> +
>> +static const PropertyInfo prop_vlen = {
>> +    .name = "vlen",
>> +    .get = prop_vlen_get,
>> +    .set = prop_vlen_set,
>> +    .set_default_value = qdev_propinfo_set_default_value_uint,
>> +};
>> +
>>   Property riscv_cpu_options[] = {
>> -    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>>
>>       DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
>> @@ -1687,6 +1745,9 @@ static Property riscv_cpu_properties[] = {
>>       {.name = "priv_spec", .info = &prop_priv_spec},
>>       {.name = "vext_spec", .info = &prop_vext_spec},
>>
>> +    {.name = "vlen", .info = &prop_vlen,
>> +     .set_default = true, .defval.u = 128},
>> +
>>   #ifndef CONFIG_USER_ONLY
>>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
>>   #endif
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 6501c29d8e..8ec858e096 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -178,11 +178,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>   static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>>                                    Error **errp)
>>   {
>> -    if (!is_power_of_2(cfg->vlen)) {
>> -        error_setg(errp, "Vector extension VLEN must be power of 2");
>> -        return;
>> -    }
>> -
>>       if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
>>           error_setg(errp,
>>                      "Vector extension implementation only supports VLEN "
>> --
>> 2.43.0
>>
>>

