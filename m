Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B83C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 09:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyUNY-0005nk-TH; Thu, 02 Nov 2023 05:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyUNX-0005nR-O1
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:52:43 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyUNV-0007CO-FZ
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:52:43 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-45d69a97b17so268801137.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698918760; x=1699523560; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YAHEOJSZAjR41L+zsBiycQgknV0hzOwmh+CRJ5M9ec=;
 b=U44x0WmDhLYL3qYwFwUsFYMM9onJ4gbCxQ4mtIGvVfQmZMzKuoxP6U8FFl+mXqBlHA
 KzMJ2dG2c/4nwRkupGp4s22nswrLwC9v5grDtt3aJfSMU3FyejqNrXOf7RBznXjst61a
 oKRWx5hDjQIzY+p8TLk0boh5jE109h3ugevohc3j7PQbX/LcPCHXzyjCbzMvywbAyQvP
 VxmaxU4MId2dnu3zCWBljxpQLXWCWpvOICIW58HdTfL5V+yfnucO2hbyqh42kNEdgoQ0
 3YTP50zdFkmz1FecDTqXYUmM0Wvrs2EyFpdS2ILk3b8hh4JUq5RWc3pW511BOa/Y8Rq8
 xAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698918760; x=1699523560;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YAHEOJSZAjR41L+zsBiycQgknV0hzOwmh+CRJ5M9ec=;
 b=vpSlCGF14WzS2KlxtSYrSOBVW1wcbQBFkHeZZBR/1TQHGtrsLO6Skfp0IZDMU3Q2rF
 DGW4CaKmevQKUihwZR7BIfJN4A3tW3LBKwMNTDirxT8HFeHsAZOAOpfPuabttM2gzSwE
 4PxfjW1vyvqu8a9w5blrQuuLf7dI54AgL5v4nOmCVmMogMchBoESpSLo1ZUbX/mL5g0i
 n6OXvJZM9JBG34XmiuXb+4lXWoFlxWcpuoo385H8Hn//qNfwJD3VaWzbl1MAbXzlfFPy
 2YbE55eDAn5sNhTxJMmeVQ7uL2sELxqVwBF9ZXVfDcUdP7HcN/2VgHPDWDYIwshvPiq0
 7x7Q==
X-Gm-Message-State: AOJu0Yy9mmCXXK5TLCTevXJ7FgxgRwo2B2IxA48wM6CEtBr1p1FBVBty
 8dQQ2KTXm37cKRhqGw4Gzs5gnQ==
X-Google-Smtp-Source: AGHT+IE6cbDHDdfs1b9qQ4/CIrnaJM6bJBqwlbFXlY2jR3DEm4KkmpwLe5nS/Qs7V2+DSrl6rXXIGw==
X-Received: by 2002:a67:c894:0:b0:457:c9ae:6c6e with SMTP id
 v20-20020a67c894000000b00457c9ae6c6emr17128063vsk.12.1698918759872; 
 Thu, 02 Nov 2023 02:52:39 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a81830c000000b005a7be94585bsm1022561ywf.96.2023.11.02.02.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 02:52:39 -0700 (PDT)
Message-ID: <c3de9158-bc3b-4fcf-8f7b-dd74ff0ff639@ventanamicro.com>
Date: Thu, 2 Nov 2023 06:52:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] target/riscv/tcg: add user flag for profile
 support
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-7-dbarboza@ventanamicro.com>
 <17601513-f256-4179-bab8-1fec38f9cdc6@ventanamicro.com>
 <be6f45ce-43c8-455e-a0f1-2b196ce080c2@ventanamicro.com>
 <CAKmqyKP7xzZ9Sx=-Lbx2Ob0qCfB7Z+JO944FQ2TQ+49mqo0q_Q@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKP7xzZ9Sx=-Lbx2Ob0qCfB7Z+JO944FQ2TQ+49mqo0q_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vs1-xe2d.google.com
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



On 11/2/23 00:00, Alistair Francis wrote:
> On Tue, Oct 31, 2023 at 3:19 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 10/30/23 10:28, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 10/28/23 05:54, Daniel Henrique Barboza wrote:
>>>> The TCG emulation implements all the extensions described in the
>>>> RVA22U64 profile, both mandatory and optional. The mandatory extensions
>>>> will be enabled via the profile flag. We'll leave the optional
>>>> extensions to be enabled by hand.
>>>>
>>>> Given that this is the first profile we're implementing in TCG we'll
>>>> need some ground work first:
>>>>
>>>> - all profiles declared in riscv_profiles[] will be exposed to users.
>>>> TCG is the main accelerator we're considering when adding profile
>>>> support in QEMU, so for now it's safe to assume that all profiles in
>>>> riscv_profiles[] will be relevant to TCG;
>>>>
>>>> - we'll not support user profile settings for vendor CPUs. The flags
>>>> will still be exposed but users won't be able to change them. The idea
>>>> is that vendor CPUs in the future can enable profiles internally in
>>>> their cpu_init() functions, showing to the external world that the CPU
>>>> supports a certain profile. But users won't be able to enable/disable
>>>> it;
>>>>
>>>> - Setting a profile to 'true' means 'enable all mandatory extensions of
>>>> this profile, setting it to 'false' means 'do not enable all mandatory
>>>> extensions for this profile'. This is the same semantics used by RVG.
>>>> Regular left-to-right option order will determine the resulting CPU
>>>> configuration, i.e. the following QEMU command line:
>>>>
>>>> -cpu rv64,zicbom=false,zifencei=false,rva22u64=true
>>>>
>>>> Enables all rva22u64 mandatory extensions, including 'zicbom' and
>>>> 'zifencei', while this other command line:
>>>>
>>>> -cpu rv64,rva22u64=true,zicbom=false,zifencei=false
>>>>
>>>> Enables all mandatory rva22u64 extensions, and then disable both zicbom
>>>> and zifencei.
>>>>
>>>> For now we'll handle multi-letter extensions only. MISA extensions need
>>>> additional steps that we'll take care later.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>>> ---
>>>>    target/riscv/tcg/tcg-cpu.c | 63 ++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 63 insertions(+)
>>>>
>>>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>>>> index 65d59bc984..5fdec8f04e 100644
>>>> --- a/target/riscv/tcg/tcg-cpu.c
>>>> +++ b/target/riscv/tcg/tcg-cpu.c
>>>> @@ -783,6 +783,67 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>>>>        }
>>>>    }
>>>> +static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
>>>> +                            void *opaque, Error **errp)
>>>> +{
>>>> +    RISCVCPUProfile *profile = opaque;
>>>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>>>> +    bool value;
>>>> +    int i, ext_offset;
>>>> +
>>>> +    if (object_dynamic_cast(obj, TYPE_RISCV_DYNAMIC_CPU) == NULL) {
>>>> +        error_setg(errp, "Profile %s only available for generic CPUs",
>>>> +                   profile->name);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (cpu->env.misa_mxl != MXL_RV64) {
>>>> +        error_setg(errp, "Profile %s only available for 64 bit CPUs",
>>>> +                   profile->name);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (!visit_type_bool(v, name, &value, errp)) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    profile->user_set = true;
>>>> +    profile->enabled = value;
>>>> +
>>>> +    if (!profile->enabled) {
>>>> +        return;
>>>> +    }
>>>
>>> My idea here was to prevent the following from disabling default rv64
>>> extensions:
>>>
>>> -cpu rv64,rva22u64=false
> 
> I think that's the right approach
> 
>>>
>>> And yeah, this is a niche (I'll refrain from using the word I really wanted) use
>>> of the profile extension, but we should keep in mind that setting a default 'false'
>>> option to 'false' shouldn't make changes in the CPU.
>>>
>>> But now if I do this:
>>>
>>> -cpu rv64,rva22u64=true (...) -cpu rv64,rva22u64=false
>>>
>>> This will enable the profile in rv64 regardless of setting it to 'false' later
>>> on. Which is also a weird mechanic. One way of solving this would be to postpone
> 
> Urgh, that is odd.
> 
>>> profile enable/disable to realize()/finalize(), but then we're back to the problem
>>> we had in v2 where, for multiple profiles, we can't tell the order in which the
>>> user enabled/disabled them in the command line during realize().
> 
> Are the properties not just set in order automatically? So we end up
> with the property being set by the last one?
> 
>>>
>>> Let me think a bit about it.
>>
>> To be honest, all the debate around this feature is due to rv64 having default
>> extensions and users doing non-orthodox stuff with the flag that will crop
>> rv64 defaults, resulting in something that we don't know what this is.
> 
> Ok, just to summarise.
> 
> The idea is that having a CPU with nothing enabled makes it easy to
> then enable features based on what extensions have been enabled. That
> way if a profile is false, we can just ignore it. The result is the
> features are disabled as that is the default state.
> 
>>
>> And what aggravates the issue is that, ATM, we don't have any other CPU aside
>> from rv64 (and max) to use profiles on.
>>
>> The RVA22U64 profile spec mentions: "RV64I is the mandatory base ISA for RVA22U64".
>> So we have a base. And we should base profiles around the base, not on a CPU that
>> has existing default values.
> 
> That is only a base for RVA22U64 though. Aren't there embedded
> profiles that might use rv64e as a base? What about RV32 as well?

For these profiles we would block them from running into RV64I because it's not
the right base ISA. We should add a RV64E CPU for them.

Same thing with any 32 bit profiles that we might add in the future - rva22u64
isn't compatible with any 32 bits ATM.

> 
>>
>> I'll add the 'rv64i' CPU in v7. This will be a bare-bones CPU that will only have
>> RVI enabled by default. Profile support will be based on top of this CPU, making
>> enable/disable profiles a trivial matter since we have a fixed minimal base. This
>> will give users a stable way of using profiles.
>>
>> As long as we have the rv64i CPU I'll start not caring for what happens with
>> '-cpu rv64,rva22u64=false' - users are free to use profiles in rv64 if they want,
> 
> What does happen with -cpu rv64,rva22u64=false though?
> 
> I feel like this doesn't really address the problem

It doesn't, because it's an user problem. We're wasting too much time trying to
sandbag weird command lines. "-cpu rv64,rva22u64=false" is a nonsense command
line that will give a nonsense CPU.

A failsafe solution I see for it is to forbid profile support for rv64. But this
is too extreme because "-cpu rv64,rva22u64=true" is a valid use, and a way more
common use, that would be cropped out because we want to babysit a minority of
users doing nonsense.

IMO we should let users use profiles with any capable CPU and document properly
what it means to do stuff like "-cpu rv64,rva22u64=false".

And now that I thought more about it, there's no gain for the 'max' CPU to support
profiles (all extensions enabled by default) but -cpu max,rva22u64=false will still
be possible. I guess I'll remove profile support for 'max' CPU.

> 
>> but the feature is designed around rv64i.
> 
> One other thought it to create a CPU per extension. So the actual CPU
> is rva22u64. That way it is easy for users to enable/disable features
> on top of the extension and we don't have to worry about the complex
> true/false operations for extensions

We can make aliases. '-cpu rva22u64' would be an alias for '-cpu rv64i,rva22u64=true'.
Same thing with every other profile we end up adding.


Thanks,


Daniel

> 
>>
>> I'll also throw a bone for all CPUs and add 'rva22u64' as an internal flag for
>> everybody, including vendor CPUs, that will reflect whether the CPU complies with
>> the profile. query-cpu-model-expansion can expose this flag, allowing the tooling
>> to have an easier time verifying if a profile is implemented or not.
> 
> Great!
> 
> Alistair
> 
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>>
>>>
>>> Daniel
>>>
>>>> +
>>>> +    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
>>>> +        ext_offset = profile->ext_offsets[i];
>>>> +
>>>> +        g_hash_table_insert(multi_ext_user_opts,
>>>> +                            GUINT_TO_POINTER(ext_offset),
>>>> +                            (gpointer)profile->enabled);
>>>> +        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
>>>> +    }
>>>> +}
>>>> +
>>>> +static void cpu_get_profile(Object *obj, Visitor *v, const char *name,
>>>> +                            void *opaque, Error **errp)
>>>> +{
>>>> +    RISCVCPUProfile *profile = opaque;
>>>> +    bool value = profile->enabled;
>>>> +
>>>> +    visit_type_bool(v, name, &value, errp);
>>>> +}
>>>> +
>>>> +static void riscv_cpu_add_profiles(Object *cpu_obj)
>>>> +{
>>>> +    for (int i = 0; riscv_profiles[i] != NULL; i++) {
>>>> +        const RISCVCPUProfile *profile = riscv_profiles[i];
>>>> +
>>>> +        object_property_add(cpu_obj, profile->name, "bool",
>>>> +                            cpu_get_profile, cpu_set_profile,
>>>> +                            NULL, (void *)profile);
>>>> +    }
>>>> +}
>>>> +
>>>>    static bool cpu_ext_is_deprecated(const char *ext_name)
>>>>    {
>>>>        return isupper(ext_name[0]);
>>>> @@ -906,6 +967,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>>>>        riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>>>> +    riscv_cpu_add_profiles(obj);
>>>> +
>>>>        for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>>>>            qdev_property_add_static(DEVICE(obj), prop);
>>>>        }
>>

