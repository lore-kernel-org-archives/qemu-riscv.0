Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D6DC3ABCC
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 11:02:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEnPE-0007Na-6C; Tue, 13 May 2025 07:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnPA-0007MG-Qb
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 07:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnP4-0004mh-FI
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 07:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747134149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+MUBu+AOkvHvputcwm8mNfXLGlZ4E78YSyM2ij8pJw=;
 b=adghdwH2wBexuuJxW01zXVRH/FFDwQeCA+Is6/Q0n2Z9pevZzZOXCqbSqD2o4m/tSARWxS
 +yWyoBw/pyQEO7dQ16DldET7sfT0RZVinJQgafOSSwVTNtgDP753aLhJUrcwjCvoRW/7Zu
 9fuoN7jTBBQspRL5vp00jEehxfYXk2E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-jaUgcd7-Me6QU0BGA9oZcw-1; Tue, 13 May 2025 07:02:28 -0400
X-MC-Unique: jaUgcd7-Me6QU0BGA9oZcw-1
X-Mimecast-MFC-AGG-ID: jaUgcd7-Me6QU0BGA9oZcw_1747134147
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-442ccf0eb4eso40676425e9.1
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 04:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747134147; x=1747738947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JW7oK2CyI854OSLqH48Mzg+zv/icPx31EwbrZmKAXLE=;
 b=uPhztHYOSKPolFHghU/naKCbQtbWyOyWShLeRHXToAQZYxg08PT4qT97zYRnUg8EB/
 QgSiIWlT6Bv5hDnOG12qALZcSfV0g01WmlwoxdLMhMbFnun/RQ5CsowB+58e2Y+SaSP2
 KVl5T6SLererk0cmj+t/C1v+dQujuQDSMbrkF9M8k5+RdPifSgc9Qhb/ZGWeb62ONFh4
 s7kJ6y8kx+gM6bexEmYk+JeZu2icbrQJuozBO7Lazfuee+2O0d8vdXU7o4eIehG/uUCC
 VGqCjX0qmFITykU8xW9BSB35cq1+i8GDXUxy/c6EZmkRYl8daeIpLv/A/opAWjwrpLHc
 RBAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1JCQ2eUaUi7H/834KND9AuAWQNJ8SyCc4D/SWRp0d+Ss1O4/z4htZYYJPGU2U+AfYZGovPV+xAvTd@nongnu.org
X-Gm-Message-State: AOJu0YxYtnepciYNDdrOm5x5tYbDZdMm/W/4Zk5dXj4rCUGDfnDb9Axi
 S1ejOeVvryik5d6ih4yRZg/kccOwj7aIEpDMRg7+tJThuDW7BzD4bZf8a8ajJfn6rtnH6+dkJh2
 QU7TX3qgQpxnDEMF2W8zUVmr2ilzhys/zR09GHXVtR2KpPh+4owtQ
X-Gm-Gg: ASbGncvDizsOOR0S9rJ/EjPVNJBKon8XZ9/ZvxNVr748GzYTYC1bu6FoYxAmRgbHNoq
 y5+wI45fC4XUcfTWDCmNrCxMxMXM6dwxBcbPC1LO5gdCXejPM3M3zs+esDanodMU5hddkzBGDVj
 IZF5kl2Bzqmtus0vl2eVlEBf85vg7Q2SAfapedt+pbPYHazsTg07duDkfpJihZqiydCFLtimapU
 ZDeZF7aU/RJSVkHPZFgmvwTqWAFRlcMEsqmacVpSfHW1M5/zF/Q0qbAzmbHPTUx1hDjjelAqdXN
 9u39a/nvu70gS6cBXzSgvDXtylglb4DN
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id
 5b1f17b1804b1-442d6d18b68mr175998625e9.3.1747134146801; 
 Tue, 13 May 2025 04:02:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk13HL4XgRMNtBFAgcztyAjoi+/4X2BhOPn1zg6pOI7KXkFzTEKIuNaNeRmT7l0ksWgMhSRA==
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id
 5b1f17b1804b1-442d6d18b68mr175998075e9.3.1747134146360; 
 Tue, 13 May 2025 04:02:26 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ea45c209sm38283135e9.17.2025.05.13.04.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 04:02:25 -0700 (PDT)
Date: Tue, 13 May 2025 13:02:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 19/27] target/i386/cpu: Remove
 CPUX86State::full_cpuid_auto_level field
Message-ID: <20250513130224.3aa2e837@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-20-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-20-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ysC4a2Zvrje5J2rG1DZ1y8S1_W_XUk5DF2xH-ywx6ds_1747134147
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu,  8 May 2025 15:35:42 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The CPUX86State::full_cpuid_auto_level boolean was only
> disabled for the pc-q35-2.7 and pc-i440fx-2.7 machines,
> which got removed. Being now always %true, we can remove
> it and simplify x86_cpu_expand_features().

I've found field being mentioned only by some external rust library,
that's likely shouldn't concern QEMU qemu though.

I'm not confident enough to ack it but I won't object either
=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/cpu.h |   3 --
>  target/i386/cpu.c | 106 ++++++++++++++++++++++------------------------
>  2 files changed, 51 insertions(+), 58 deletions(-)
>=20
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 7585407da54..b5cbd91c156 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2241,9 +2241,6 @@ struct ArchCPU {
>       */
>      bool legacy_multi_node;
> =20
> -    /* Enable auto level-increase for all CPUID leaves */
> -    bool full_cpuid_auto_level;
> -
>      /* Only advertise CPUID leaves defined by the vendor */
>      bool vendor_cpuid_only;
> =20
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index fb505d13122..6b9a1f2251a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7843,68 +7843,65 @@ void x86_cpu_expand_features(X86CPU *cpu, Error *=
*errp)
> =20
>      /* CPUID[EAX=3D7,ECX=3D0].EBX always increased level automatically: =
*/
>      x86_cpu_adjust_feat_level(cpu, FEAT_7_0_EBX);
> -    if (cpu->full_cpuid_auto_level) {
> -        x86_cpu_adjust_feat_level(cpu, FEAT_1_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_1_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_6_EAX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_0_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EAX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_2_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0007_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0008_EBX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_C000_0001_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_SVM);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_XSAVE);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_1_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_1_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_6_EAX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_0_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EAX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_2_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0007_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0008_EBX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_C000_0001_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_SVM);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_XSAVE);
> =20
> -        /* Intel Processor Trace requires CPUID[0x14] */
> -        if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
> -            if (cpu->intel_pt_auto_level) {
> -                x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x1=
4);
> -            } else if (cpu->env.cpuid_min_level < 0x14) {
> -                mark_unavailable_features(cpu, FEAT_7_0_EBX,
> -                    CPUID_7_0_EBX_INTEL_PT,
> -                    "Intel PT need CPUID leaf 0x14, please set by \"-cpu=
 ...,intel-pt=3Don,min-level=3D0x14\"");
> -            }
> +    /* Intel Processor Trace requires CPUID[0x14] */
> +    if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
> +        if (cpu->intel_pt_auto_level) {
> +            x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
> +        } else if (cpu->env.cpuid_min_level < 0x14) {
> +            mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_I=
NTEL_PT,
> +                "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...=
,intel-pt=3Don,min-level=3D0x14\"");
>          }
> +    }
> =20
> -        /*
> -         * Intel CPU topology with multi-dies support requires CPUID[0x1=
F].
> -         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should =
detect
> -         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, u=
nless
> -         * cpu->vendor_cpuid_only has been unset for compatibility with =
older
> -         * machine types.
> -         */
> -        if (x86_has_extended_topo(env->avail_cpu_topo) &&
> -            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> -        }
> +    /*
> +     * Intel CPU topology with multi-dies support requires CPUID[0x1F].
> +     * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should dete=
ct
> +     * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, unles=
s
> +     * cpu->vendor_cpuid_only has been unset for compatibility with olde=
r
> +     * machine types.
> +     */
> +    if (x86_has_extended_topo(env->avail_cpu_topo) &&
> +        (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> +    }
> =20
> -        /* Advanced Vector Extensions 10 (AVX10) requires CPUID[0x24] */
> -        if (env->features[FEAT_7_1_EDX] & CPUID_7_1_EDX_AVX10) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x24);
> -        }
> +    /* Advanced Vector Extensions 10 (AVX10) requires CPUID[0x24] */
> +    if (env->features[FEAT_7_1_EDX] & CPUID_7_1_EDX_AVX10) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x24);
> +    }
> =20
> -        /* SVM requires CPUID[0x8000000A] */
> -        if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000000A=
);
> -        }
> +    /* SVM requires CPUID[0x8000000A] */
> +    if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000000A);
> +    }
> =20
> -        /* SEV requires CPUID[0x8000001F] */
> -        if (sev_enabled()) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F=
);
> -        }
> +    /* SEV requires CPUID[0x8000001F] */
> +    if (sev_enabled()) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
> +    }
> =20
> -        if (env->features[FEAT_8000_0021_EAX]) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021=
);
> -        }
> +    if (env->features[FEAT_8000_0021_EAX]) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021);
> +    }
> =20
> -        /* SGX requires CPUID[0x12] for EPC enumeration */
> -        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
> -        }
> +    /* SGX requires CPUID[0x12] for EPC enumeration */
> +    if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
>      }
> =20
>      /* Set cpuid_*level* based on cpuid_min_*level, if not explicitly se=
t */
> @@ -8820,7 +8817,6 @@ static const Property x86_cpu_properties[] =3D {
>      DEFINE_PROP_UINT32("min-xlevel2", X86CPU, env.cpuid_min_xlevel2, 0),
>      DEFINE_PROP_UINT8("avx10-version", X86CPU, env.avx10_version, 0),
>      DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
> -    DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_le=
vel, true),
>      DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
>      DEFINE_PROP_BOOL("x-vendor-cpuid-only", X86CPU, vendor_cpuid_only, t=
rue),
>      DEFINE_PROP_BOOL("x-amd-topoext-features-only", X86CPU, amd_topoext_=
features_only, true),


