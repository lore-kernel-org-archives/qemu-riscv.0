Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E00C07545
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 16:11:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvgT8-0008BL-T1; Wed, 25 Oct 2023 12:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgT7-00089Z-BM
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:10:53 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgT5-00061p-9A
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:10:53 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99de884ad25so886240366b.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698250249; x=1698855049; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DhTWafBobKCBbfwsBpZHPKbTC1t7A8jqJQgw02eqEzA=;
 b=IdWe2XU+Lrgx8uxJ0xp+6KCNrDo817Le5pBUrGyv9UXETQxTOBWqyS4NXJqnw0cmA1
 4K3nokjcqrkuK1XA/MFKHvmq2l6GnE/eMQ+EHBvnK5+51m6P1xSrMHrv577WM7JxbfeI
 TjZTs0F6lGn9fzS9M8XZ5wdQlO7vg1hzh/TlKMFiKmx65FOPwE5WwErXsYusUh8wiHq5
 F4JOfgCewB0UUsIb6oTOAxZOEySAGm9vViUR4UUkrJW9qANUXkemZ8oMYyjuf1srwMhE
 qj7AsXKI7pzGxrAY4386kiWouf9nBSviiUyqEdNXy5KnSrWjTy1t5/WcMFWm3j4Lot7y
 eiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698250249; x=1698855049;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DhTWafBobKCBbfwsBpZHPKbTC1t7A8jqJQgw02eqEzA=;
 b=r2czT2T4ycuTEm7CLGDeSzg9ISBJv7c5GxggKrdE70zLT7wijMYWflBaxLghJvtZxD
 rtjPPm0B51mXt8Kp1crNr/32RqwNm09gpRutxff5Fqkv6y77j7bP99c+oh9iR/KNdj2H
 aJiqA12xrwnFD6If1wvYOmCl5FtnEuTBW2QjES1qETJOcotMo1TXQg2qvwR3J2EHzj+n
 RE2Dy47Dkxtjc05iX9Q/UeTqxL2YaW1TMHU07l4I/ULb7xZZKo2R5RWUisNm4CtTQWr3
 GnXQ6bK58yfOLp8dakgxa+Qi/0I6oSNEi1RxH32ZYouboP5kpL4HineM501WIGa6y84J
 9j6w==
X-Gm-Message-State: AOJu0Yxr+qmYC1CspgYWLFH05vD5cUBEnzTD3rAE4g7ZNpoJiRjrDmHM
 hQjGXj7j1luggOEtbWYjIPym4A==
X-Google-Smtp-Source: AGHT+IGG1ycGo5/J0YErK5OAvBgH81UmNS1QY7ImHwFXf2KRO7TYNFyz2tOC80R/iENB/BhjhSb98Q==
X-Received: by 2002:a17:907:9286:b0:9a9:f2fd:2a2b with SMTP id
 bw6-20020a170907928600b009a9f2fd2a2bmr11923797ejc.73.1698250249263; 
 Wed, 25 Oct 2023 09:10:49 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a170906105300b0099bcdfff7cbsm10005001ejj.160.2023.10.25.09.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 09:10:48 -0700 (PDT)
Date: Wed, 25 Oct 2023 18:10:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v4 3/9] target/riscv/tcg: add user flag for profile support
Message-ID: <20231025-886b123d832f3076f09d5b1b@orel>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
 <20231025135001.531224-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025135001.531224-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x635.google.com
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

On Wed, Oct 25, 2023 at 10:49:55AM -0300, Daniel Henrique Barboza wrote:
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
> this profile, setting it to 'false' means disabling all its mandatory
> extensions. Regular left-to-right option order will determine the
> resulting CPU configuration, i.e. the following QEMU command line:
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
> ---
>  target/riscv/tcg/tcg-cpu.c | 53 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 093bda2e75..572ae9c902 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -769,6 +769,57 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>      }
>  }
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
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    profile->user_set = true;
> +    profile->enabled = value;
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
>  static bool cpu_ext_is_deprecated(const char *ext_name)
>  {
>      return isupper(ext_name[0]);
> @@ -892,6 +943,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>  
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>  
> +    riscv_cpu_add_profiles(obj);
> +
>      for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>          qdev_property_add_static(DEVICE(obj), prop);
>      }
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

