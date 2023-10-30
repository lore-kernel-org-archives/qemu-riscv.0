Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF5C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 17:19:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxVuo-0004fz-Bv; Mon, 30 Oct 2023 13:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxVum-0004fi-75
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:19:00 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxVuk-00047l-4r
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:18:59 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-59e88a28b98so41704857b3.1
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698686336; x=1699291136; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TOc5hX1ww+veKjiK92Pde4cAEKIsh+gFNQbze2EF9Z0=;
 b=O2meaWa3swuFdGCTV/1EqMCC1HpTfdijSFzpn75C8vg84zfX8x4ZpVCaLwwx8iW4CA
 aDwNssg78UKFVqsx1RDQrou1xwFlnYT5oIL8qFwlvQ5YWk8IucFqgRqbegFax4NRPVX6
 0zyKd6jwYdlQNQtD3q8RiEmDTFX7r6l4p8PFNOPyhVArv9RsjB3s5pT8D7UufqxxD9Hs
 nyk6VYZvRKB6OhiG+6UJUI/Bleytp/WvdsbiCX/r5/YR3TthbUNsLN+IiuzXM7YoWfIJ
 K9IQs7ewHVtuU86CWl6b62MkUs49NIWileYUIF7cNL3gkQvB8/jXThKZtOeyiDoYF8fT
 /MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698686336; x=1699291136;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TOc5hX1ww+veKjiK92Pde4cAEKIsh+gFNQbze2EF9Z0=;
 b=Z4J/xNDXQe4zLobH8oVMp2iIAj/z/WPu6TerQiwx4G0h3Xn0OuEw6wSho4uvyU2CCg
 gAwUdpVaFKvQZ7a1NJnh6lD7Rr8ctND5C1/ie3y9G2+aHa7E0sbjn+g526ZYoihg1x28
 44uzowho0AXI12zP3iMxKw5PNHH47+lXj0cYztSMwPNoAMOJYGnpLkVZ8ibstG8vMIk5
 g2ehgGwQrREdW2bGBQjgGhY9GzMaWKDHfyKOHTSaff5u+Y7SCwYi1c80X5e1/ynL6PEX
 K62yjzJKXsHyi/SVcCF6Taw1S2WeGPjm0cBUjcUl6x/iyHxA8T+nIwZbLAJ9DRoq64NA
 vvxA==
X-Gm-Message-State: AOJu0Yyik8gUJdPGtNOHVIC10TiqrWVoze3lq/s4vqN7OaPfszu4e2cm
 7nCOV97t0e0eHuIBF1roC0Jg0A==
X-Google-Smtp-Source: AGHT+IFiukagCMvPORav9KiS1ik8bCu23HYbLks5d40nzZ6dP27rGsF/2WccfT1h53QyMLHBVwOzUA==
X-Received: by 2002:a05:690c:d8c:b0:5a7:b3d0:82c2 with SMTP id
 da12-20020a05690c0d8c00b005a7b3d082c2mr312878ywb.12.1698686336509; 
 Mon, 30 Oct 2023 10:18:56 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 b63-20020a0df242000000b005869fd2b5bcsm4548244ywf.127.2023.10.30.10.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 10:18:56 -0700 (PDT)
Message-ID: <be6f45ce-43c8-455e-a0f1-2b196ce080c2@ventanamicro.com>
Date: Mon, 30 Oct 2023 14:18:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] target/riscv/tcg: add user flag for profile
 support
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-7-dbarboza@ventanamicro.com>
 <17601513-f256-4179-bab8-1fec38f9cdc6@ventanamicro.com>
In-Reply-To: <17601513-f256-4179-bab8-1fec38f9cdc6@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 10/30/23 10:28, Daniel Henrique Barboza wrote:
> 
> 
> On 10/28/23 05:54, Daniel Henrique Barboza wrote:
>> The TCG emulation implements all the extensions described in the
>> RVA22U64 profile, both mandatory and optional. The mandatory extensions
>> will be enabled via the profile flag. We'll leave the optional
>> extensions to be enabled by hand.
>>
>> Given that this is the first profile we're implementing in TCG we'll
>> need some ground work first:
>>
>> - all profiles declared in riscv_profiles[] will be exposed to users.
>> TCG is the main accelerator we're considering when adding profile
>> support in QEMU, so for now it's safe to assume that all profiles in
>> riscv_profiles[] will be relevant to TCG;
>>
>> - we'll not support user profile settings for vendor CPUs. The flags
>> will still be exposed but users won't be able to change them. The idea
>> is that vendor CPUs in the future can enable profiles internally in
>> their cpu_init() functions, showing to the external world that the CPU
>> supports a certain profile. But users won't be able to enable/disable
>> it;
>>
>> - Setting a profile to 'true' means 'enable all mandatory extensions of
>> this profile, setting it to 'false' means 'do not enable all mandatory
>> extensions for this profile'. This is the same semantics used by RVG.
>> Regular left-to-right option order will determine the resulting CPU
>> configuration, i.e. the following QEMU command line:
>>
>> -cpu rv64,zicbom=false,zifencei=false,rva22u64=true
>>
>> Enables all rva22u64 mandatory extensions, including 'zicbom' and
>> 'zifencei', while this other command line:
>>
>> -cpu rv64,rva22u64=true,zicbom=false,zifencei=false
>>
>> Enables all mandatory rva22u64 extensions, and then disable both zicbom
>> and zifencei.
>>
>> For now we'll handle multi-letter extensions only. MISA extensions need
>> additional steps that we'll take care later.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   target/riscv/tcg/tcg-cpu.c | 63 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 65d59bc984..5fdec8f04e 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -783,6 +783,67 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>>       }
>>   }
>> +static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
>> +                            void *opaque, Error **errp)
>> +{
>> +    RISCVCPUProfile *profile = opaque;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    bool value;
>> +    int i, ext_offset;
>> +
>> +    if (object_dynamic_cast(obj, TYPE_RISCV_DYNAMIC_CPU) == NULL) {
>> +        error_setg(errp, "Profile %s only available for generic CPUs",
>> +                   profile->name);
>> +        return;
>> +    }
>> +
>> +    if (cpu->env.misa_mxl != MXL_RV64) {
>> +        error_setg(errp, "Profile %s only available for 64 bit CPUs",
>> +                   profile->name);
>> +        return;
>> +    }
>> +
>> +    if (!visit_type_bool(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    profile->user_set = true;
>> +    profile->enabled = value;
>> +
>> +    if (!profile->enabled) {
>> +        return;
>> +    }
> 
> My idea here was to prevent the following from disabling default rv64
> extensions:
> 
> -cpu rv64,rva22u64=false
> 
> And yeah, this is a niche (I'll refrain from using the word I really wanted) use
> of the profile extension, but we should keep in mind that setting a default 'false'
> option to 'false' shouldn't make changes in the CPU.
> 
> But now if I do this:
> 
> -cpu rv64,rva22u64=true (...) -cpu rv64,rva22u64=false
> 
> This will enable the profile in rv64 regardless of setting it to 'false' later
> on. Which is also a weird mechanic. One way of solving this would be to postpone
> profile enable/disable to realize()/finalize(), but then we're back to the problem
> we had in v2 where, for multiple profiles, we can't tell the order in which the
> user enabled/disabled them in the command line during realize().
> 
> Let me think a bit about it.

To be honest, all the debate around this feature is due to rv64 having default
extensions and users doing non-orthodox stuff with the flag that will crop
rv64 defaults, resulting in something that we don't know what this is.

And what aggravates the issue is that, ATM, we don't have any other CPU aside
from rv64 (and max) to use profiles on.

The RVA22U64 profile spec mentions: "RV64I is the mandatory base ISA for RVA22U64".
So we have a base. And we should base profiles around the base, not on a CPU that
has existing default values.

I'll add the 'rv64i' CPU in v7. This will be a bare-bones CPU that will only have
RVI enabled by default. Profile support will be based on top of this CPU, making
enable/disable profiles a trivial matter since we have a fixed minimal base. This
will give users a stable way of using profiles.

As long as we have the rv64i CPU I'll start not caring for what happens with
'-cpu rv64,rva22u64=false' - users are free to use profiles in rv64 if they want,
but the feature is designed around rv64i.

I'll also throw a bone for all CPUs and add 'rva22u64' as an internal flag for
everybody, including vendor CPUs, that will reflect whether the CPU complies with
the profile. query-cpu-model-expansion can expose this flag, allowing the tooling
to have an easier time verifying if a profile is implemented or not.


Thanks,


Daniel


> 
> 
> Daniel
> 
>> +
>> +    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
>> +        ext_offset = profile->ext_offsets[i];
>> +
>> +        g_hash_table_insert(multi_ext_user_opts,
>> +                            GUINT_TO_POINTER(ext_offset),
>> +                            (gpointer)profile->enabled);
>> +        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
>> +    }
>> +}
>> +
>> +static void cpu_get_profile(Object *obj, Visitor *v, const char *name,
>> +                            void *opaque, Error **errp)
>> +{
>> +    RISCVCPUProfile *profile = opaque;
>> +    bool value = profile->enabled;
>> +
>> +    visit_type_bool(v, name, &value, errp);
>> +}
>> +
>> +static void riscv_cpu_add_profiles(Object *cpu_obj)
>> +{
>> +    for (int i = 0; riscv_profiles[i] != NULL; i++) {
>> +        const RISCVCPUProfile *profile = riscv_profiles[i];
>> +
>> +        object_property_add(cpu_obj, profile->name, "bool",
>> +                            cpu_get_profile, cpu_set_profile,
>> +                            NULL, (void *)profile);
>> +    }
>> +}
>> +
>>   static bool cpu_ext_is_deprecated(const char *ext_name)
>>   {
>>       return isupper(ext_name[0]);
>> @@ -906,6 +967,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>> +    riscv_cpu_add_profiles(obj);
>> +
>>       for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>>           qdev_property_add_static(DEVICE(obj), prop);
>>       }

