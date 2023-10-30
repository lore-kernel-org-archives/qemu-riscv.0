Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381C2C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 13:28:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxSJo-0001NG-Gh; Mon, 30 Oct 2023 09:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxSJn-0001Mz-8M
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 09:28:35 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxSJl-0004NP-FX
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 09:28:35 -0400
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-77063481352so441896185a.1
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672512; x=1699277312; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MeztH+UGydQ1qR/jNKL9BJqTaescrUKmKGiDkNWA1L0=;
 b=Z25fchMjGzhf+t/w4afi93jfpZ7qQoHTaESzhALyR9Obvubv6QCNmOexKYz51Ed3Vi
 GHPSjUrqtVtTi8eN7Yef9mBa9+Bp63UOqzO75vIN5ySPcjT5sqnWAVxa0RdRE0n0XmwH
 GjdipBAHKiGxoSI4rWztad8f9NNyrvqcbIZ/GcixOi7LOM/5tOSuR5lFTv1Qh08QUADl
 GB2sZv7peUaeAqxpxFNu+wfCRdb3BjuweK5TckiI9tiRdwLGuP7VR+tj8ZlExQD6xNoD
 dvjiq9JEScvMl0n122ujnYjkS7RPKZzprQxyPhA8SYa1Idis08TT5qpdbMsABVwU+FHM
 dKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672512; x=1699277312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MeztH+UGydQ1qR/jNKL9BJqTaescrUKmKGiDkNWA1L0=;
 b=D23nrMz8LpohWz07iyqg+NRDqLM3TcKAaTta0C2gwNN5RJWSlsImMOyRQpaHbX8Sl+
 ZBbvRE2Wjn/E5XYbC2Y0fVVa15qNv/SZ96zolmrooU6xLD8iiLxEHA5oOCXWzdDukjwF
 czoz9I8TDxTevtIXgET5npDpRTcYX1EhQubK4krmPKEbFk9tT93tgFGVg0+JXIQxDqYZ
 9HnDzQdNICLe4ltBQt0BLelUqpurLkn+VJ0Nb0XosU0M1elt9s6Kc32U6MI273tM1Bux
 mXEc57ip09QGfbVRTP1nS9m3AZqg4tQxAg1gF5jTD5f52hhQRmm9UU/klR/jRte+HPku
 n0bA==
X-Gm-Message-State: AOJu0Yy67MbYNfdvscOr9oI7tPCOluHPN6/vb3iofgYs0egEzoN3VCpn
 1eUp6CSCkl3Rp3kuAY4vxCPHjg==
X-Google-Smtp-Source: AGHT+IHQr5yZOJ3S3BqaTN1oId1xF22plVOF27/oZ8yFyHypJAdp1wQCiRLUlhM7IpCs5fs4gcajLQ==
X-Received: by 2002:a05:620a:bcc:b0:778:a456:778e with SMTP id
 s12-20020a05620a0bcc00b00778a456778emr11132369qki.39.1698672512248; 
 Mon, 30 Oct 2023 06:28:32 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05620a034900b007758ffab58asm3310281qkm.8.2023.10.30.06.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 06:28:31 -0700 (PDT)
Message-ID: <17601513-f256-4179-bab8-1fec38f9cdc6@ventanamicro.com>
Date: Mon, 30 Oct 2023 10:28:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] target/riscv/tcg: add user flag for profile
 support
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-7-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231028085427.707060-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qk1-x72b.google.com
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



On 10/28/23 05:54, Daniel Henrique Barboza wrote:
> The TCG emulation implements all the extensions described in the
> RVA22U64 profile, both mandatory and optional. The mandatory extensions
> will be enabled via the profile flag. We'll leave the optional
> extensions to be enabled by hand.
> 
> Given that this is the first profile we're implementing in TCG we'll
> need some ground work first:
> 
> - all profiles declared in riscv_profiles[] will be exposed to users.
> TCG is the main accelerator we're considering when adding profile
> support in QEMU, so for now it's safe to assume that all profiles in
> riscv_profiles[] will be relevant to TCG;
> 
> - we'll not support user profile settings for vendor CPUs. The flags
> will still be exposed but users won't be able to change them. The idea
> is that vendor CPUs in the future can enable profiles internally in
> their cpu_init() functions, showing to the external world that the CPU
> supports a certain profile. But users won't be able to enable/disable
> it;
> 
> - Setting a profile to 'true' means 'enable all mandatory extensions of
> this profile, setting it to 'false' means 'do not enable all mandatory
> extensions for this profile'. This is the same semantics used by RVG.
> Regular left-to-right option order will determine the resulting CPU
> configuration, i.e. the following QEMU command line:
> 
> -cpu rv64,zicbom=false,zifencei=false,rva22u64=true
> 
> Enables all rva22u64 mandatory extensions, including 'zicbom' and
> 'zifencei', while this other command line:
> 
> -cpu rv64,rva22u64=true,zicbom=false,zifencei=false
> 
> Enables all mandatory rva22u64 extensions, and then disable both zicbom
> and zifencei.
> 
> For now we'll handle multi-letter extensions only. MISA extensions need
> additional steps that we'll take care later.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/tcg/tcg-cpu.c | 63 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 65d59bc984..5fdec8f04e 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -783,6 +783,67 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>       }
>   }
>   
> +static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    RISCVCPUProfile *profile = opaque;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    bool value;
> +    int i, ext_offset;
> +
> +    if (object_dynamic_cast(obj, TYPE_RISCV_DYNAMIC_CPU) == NULL) {
> +        error_setg(errp, "Profile %s only available for generic CPUs",
> +                   profile->name);
> +        return;
> +    }
> +
> +    if (cpu->env.misa_mxl != MXL_RV64) {
> +        error_setg(errp, "Profile %s only available for 64 bit CPUs",
> +                   profile->name);
> +        return;
> +    }
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    profile->user_set = true;
> +    profile->enabled = value;
> +
> +    if (!profile->enabled) {
> +        return;
> +    }

My idea here was to prevent the following from disabling default rv64
extensions:

-cpu rv64,rva22u64=false

And yeah, this is a niche (I'll refrain from using the word I really wanted) use
of the profile extension, but we should keep in mind that setting a default 'false'
option to 'false' shouldn't make changes in the CPU.

But now if I do this:

-cpu rv64,rva22u64=true (...) -cpu rv64,rva22u64=false

This will enable the profile in rv64 regardless of setting it to 'false' later
on. Which is also a weird mechanic. One way of solving this would be to postpone
profile enable/disable to realize()/finalize(), but then we're back to the problem
we had in v2 where, for multiple profiles, we can't tell the order in which the
user enabled/disabled them in the command line during realize().

Let me think a bit about it.


Daniel

> +
> +    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
> +        ext_offset = profile->ext_offsets[i];
> +
> +        g_hash_table_insert(multi_ext_user_opts,
> +                            GUINT_TO_POINTER(ext_offset),
> +                            (gpointer)profile->enabled);
> +        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
> +    }
> +}
> +
> +static void cpu_get_profile(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    RISCVCPUProfile *profile = opaque;
> +    bool value = profile->enabled;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void riscv_cpu_add_profiles(Object *cpu_obj)
> +{
> +    for (int i = 0; riscv_profiles[i] != NULL; i++) {
> +        const RISCVCPUProfile *profile = riscv_profiles[i];
> +
> +        object_property_add(cpu_obj, profile->name, "bool",
> +                            cpu_get_profile, cpu_set_profile,
> +                            NULL, (void *)profile);
> +    }
> +}
> +
>   static bool cpu_ext_is_deprecated(const char *ext_name)
>   {
>       return isupper(ext_name[0]);
> @@ -906,6 +967,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>   
>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>   
> +    riscv_cpu_add_profiles(obj);
> +
>       for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>           qdev_property_add_static(DEVICE(obj), prop);
>       }

