Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC09606A337
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyT3QRXP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PK9rp7AM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOtJN-0007Xp-Bk; Thu, 05 Nov 2026 03:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xOtJJ-00077y-82
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 03:59:05 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xOtJF-0003rD-3m
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 03:59:04 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A56UCPn4169780
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 08:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JkvboH8M057pEYITNDwjHjNihtWGyEB04rVTPpzplHY=; b=YyT3QRXPRWKTewYd
 u7edhdH/QeE/mNlUETmykLPADV434IOczFdSjORYO9QRLLS/r7GabPqZxBlXwt9Z
 EfQONwjfix5v2MxUg5vE42i5L8J7tRRshMmiE+dOMaRsgsIKS3K7naz9fhUC33G1
 V2GhWilaLMJyl04ZHzag0OpNv8fEDmzgkThWvF69745zUaBIt+eBphn36hQeuXvq
 Y30EE9Sl6/ADocO+rS4V6RxPGlxACnZ+MfjZtjm3cN9hqqwCwQ9itxfFDnxk20JR
 HGgedKzVjnWIOCiLESyRebTdXK5kch1kXbO+LeTaQ9gGZrFrqCMV7Zg7snPuQaOk
 ft8Zwg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8m1m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 08:58:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3ad91787a1aso1439220a91.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 00:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793869137; x=1794473937; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JkvboH8M057pEYITNDwjHjNihtWGyEB04rVTPpzplHY=;
 b=PK9rp7AMB133kMkkJjL+vUbFVWo+rPOAqAyZU5nTS3sRZ/Kd5JC6EB/RaxIlqUdYy+
 tgiUpDQ29/6aYATQh0nCm8HquyXp1l/EtQswTfnnI9ci9L9qbVg+G2or7bSDy4sbJpCg
 lkpkp3sdYChV1Y642ss5tMfkgGVhNckJMsyEJh5u2m5r0Od8NlLdDd6Nps9twhfh0ZGq
 fjo+LPmAMhthjSIqM01zhnNh8pcRu9lLhHXkrwwgDQlbWeUSVJ6y30xouXmjE5FL6It9
 /v+i77iLUkA317s42N7bUG4TKIXwk0hm1koYqT60cIPX3sgAe/W2AbpcI+jpvWS/78dk
 jJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793869137; x=1794473937;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JkvboH8M057pEYITNDwjHjNihtWGyEB04rVTPpzplHY=;
 b=DPhsp0jrW77GlwpBJjZFWv5epJPit7RHupa+k+TPC3S7xmqPT1EIeSdjrRzxfnvP57
 a3Hw4A2mDyf3WQ7DGGZptEuSVFc7q0Txp/n0Y8dcuium7PnHGbH3hJsAOXw2iJ0n7LoC
 XpXYV1jsdsemCJUuDDdqHbQtnxZRooOXDiotI8ZXU3LKJhGtSCYeNUQrA2CM37iLlBbl
 ubBwjXZR5Ew4etOLmC1vamdg7oTW3dEg7O9sW8p6CJBTKR6gLp5Yy/9EkSc/GaZBz2dB
 HjT3VVNGd2VpE69FjcxeqWCSTaiRtazVPncLcX6vqS5gag1aH+sDrW6LvNMKkD7m8Mjq
 898g==
X-Forwarded-Encrypted: i=1;
 AKwUvByr9c+3jJYQq6b7V+rvh99xtchxiwxSLQjchJ2EFw5qEXyu1VdoBrYSejO/dodO6aDac8KYbAvJm+OB@nongnu.org
X-Gm-Message-State: APuU4Z8Nm2n8vse4haRrTH3ifGOkrgqBw6UaOqR61gnCAmbSB4QpuiT8
 FK8HSmALSNfR4QDFiuvuAzL9ms1vH2TwdIZyqnMwohA/FlJamcwyS7afEKSRRnCIEEmNkNnIRFX
 yKVDMBcj3xspidkCtzq4YTRqdbvubNO4BjF7wHlmajtX4DXabvjUyV/347w==
X-Gm-Gg: AYBFou2J/9FIu8OnU21W21onW0u0Gt+ZsqCqq4D9/0KtjgrOS2RyU79XE6R+Sc1mm6C
 FTTPPkKEUNIX8ZWjqltX16Gkl/ogndP5+1KMRJMtWCGeIfAmkFo4M7eHG5v/ONFIQYINVMs3jPs
 JdTkAtnV27TO/XgM0h5644Pm8NYKw3OAgXXm/m96TkhAi4ysk+DPjliS+lf5q8oGmWRNgLM1vA2
 +0Ut7fN2JeOOnfUTGCjY0ATqZYOI0nQuBMeFXItenxWSucTyKoXWs24NjRX5zRwWF0X+m/JTfMp
 rxz/fRNEvzoW1742oIpXfQorVfO5xQh8Hzjnlceo2TQDd4nvRtP9RYpU37uP5ViFgZFi0Ks6TYF
 si+GFrEAc3160oAxdot2KrIAhnJpohEI52SMm+nYmyxn4B9jC2xG22zMRH7X4KeMhbwblljYmPM
 4pxVso6ZTtA14aRzKsiv009qvavbR3
X-Received: by 2002:a17:90b:3148:b0:3a8:13d6:f740 with SMTP id
 98e67ed59e1d1-3ae897364c0mr14923152a91.22.1793869136906; 
 Thu, 05 Nov 2026 00:58:56 -0800 (PST)
X-Received: by 2002:a17:90b:3148:b0:3a8:13d6:f740 with SMTP id
 98e67ed59e1d1-3ae897364c0mr14923122a91.22.1793869136351; 
 Thu, 05 Nov 2026 00:58:56 -0800 (PST)
Received: from [192.168.1.169] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b313c143sm2911999a91.2.2026.11.05.00.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:58:55 -0800 (PST)
Message-ID: <969ba2d1-f008-40a8-a084-2d266dd5d87d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 01:58:55 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] accel: register CPU parent once per target base
 arch
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>
References: <20261031170925.789-1-luoyonggang@gmail.com>
 <20261031170925.789-2-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261031170925.789-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec4552 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=aWEEm6OflQt8SYyCYE0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: yM9U8GYuYDV8di6lXhmDsbQr2UwrAkjG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfXyi9/vJ3RG9Ba
 x4JX4Z90KWrrTcBhMT/J90H8YilhPUUgT86zUbliUKuVm3nhWZlCU8r1YxJRY0d9CZZtHKB9cIz
 CLd/HP+tt4zeiCso0IK3KId7IO/3rAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX1FXSje/H9RqV
 EvvMeGxOzu4/u6+AJGd26+IsuEqAQ9tOy7kBI+WWuDGraiRP5kTzZsHMFsmmT82nBVH4uy0uUM3
 SLtob3vmifcgwPVkTT4337pAIQRxgs4mLEu4JphjT1S5lo7BblPf4ASovwwp0gE1xhzOPhCi5SX
 G8QF8NxPCTCJwANRpTQjkHrNi63q1G6SHfVoNc4s1RW3qWL55F+J5Inb8VU832bKTF2m6yAhbH/
 d1JFzM8d9Qy3hLB2cQ2jiCEX4pKPEjILmbsqvfXMI2G4btUABfIJCiM94pRunGPkApbcddAb56f
 RMEBqorVJl1euEzGbCvx9UXEDfFGDZJSeI/b3RF7mMpN2/JAWmELMXkXNUrK1bzqtrJZzAuwGfv
 aPcIRSXqIZwFkvkVuUQcZt7bzD82wUJuQN/ygeIiWhyfRZhUzMmIIDM9TksavE1dH5H3as0e/5z
 4ZCTpcb0b0Nf0KyIq2Q==
X-Proofpoint-ORIG-GUID: yM9U8GYuYDV8di6lXhmDsbQr2UwrAkjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/31/26 10:09 AM, Yonggang Luo wrote:
> Move accel-$cpu_type registration into accel-cpu-target.c. System
> targets whose variants share CPU_RESOLVING_TYPE (arm, riscv, sh4,
> and xtensa) build that file once per TARGET_BASE_ARCH. User-mode
> and every other system target compile it once per target.
> 
> test-multi-target checks that each target's accel parent exists
> after QOM init.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   accel/accel-common.c           | 15 ---------------
>   accel/accel-cpu-target.c       | 27 +++++++++++++++++++++++++++
>   meson.build                    | 32 ++++++++++++++++++++++++++++++++
>   tests/unit/test-multi-target.c | 10 ++++++++++
>   4 files changed, 69 insertions(+), 15 deletions(-)
>   create mode 100644 accel/accel-cpu-target.c
> 
> diff --git a/accel/accel-common.c b/accel/accel-common.c
> index 00a400243f0..e7abec4a7b1 100644
> --- a/accel/accel-common.c
> +++ b/accel/accel-common.c
> @@ -129,18 +129,3 @@ static const TypeInfo accel_types[] = {
>   };
>   
>   DEFINE_TYPES(accel_types)
> -
> -static void register_accel_target_type(void)
> -{
> -    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
> -    const TypeInfo accel_cpu_type = {
> -        .name = name,
> -        .parent = TYPE_OBJECT,
> -        .abstract = true,
> -        .class_size = sizeof(AccelCPUClass),
> -    };
> -
> -    type_register_static(&accel_cpu_type);
> -}
> -
> -type_init(register_accel_target_type);
> diff --git a/accel/accel-cpu-target.c b/accel/accel-cpu-target.c
> new file mode 100644
> index 00000000000..ef4da5a2b61
> --- /dev/null
> +++ b/accel/accel-cpu-target.c
> @@ -0,0 +1,27 @@
> +/*
> + * Accelerator CPU parent registration.
> + *
> + * Compiled once per target. System targets for arm, riscv, sh4, and
> + * xtensa share one CPU_RESOLVING_TYPE, so those bases compile it once.
> + * The constructor is static, so more than one copy can be linked.
> + *
> + * SPDX-License-Identifier: MIT
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "accel/accel-cpu-target.h"
> +
> +static void register_accel_target_type(void)
> +{
> +    const TypeInfo accel_cpu_type = {
> +        .name = TYPE_ACCEL_CPU,
> +        .parent = TYPE_OBJECT,
> +        .abstract = true,
> +        .class_size = sizeof(AccelCPUClass),
> +    };
> +
> +    type_register_static(&accel_cpu_type);
> +}
> +
> +type_init(register_accel_target_type);
> diff --git a/meson.build b/meson.build
> index 7ec3fb90233..2b605b373fa 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3243,6 +3243,11 @@ config_devices_h = {}
>   config_target_h = {}
>   config_target_mak = {}
>   config_base_arch_mak = {}
> +# System targets of these bases share one CPU_RESOLVING_TYPE.
> +# i386/x86_64, ppc/ppc64, mips/mips64, and sparc/sparc64 do not.
> +# Once they share one name too, drop this workaround.
> +config_base_arch_cpu_type = ['arm', 'riscv', 'sh4', 'xtensa']
> +config_base_arch_target = {}
>   config_target_info = {}
>

It's basically the same implementation that v2, except the loop is in 
build system.

Could we express that for each architecture instead of a loop like this 
at the top?

Like having a .c file for each target, reusing a macro (or a .c.inc) 
with a parameter for cpu type, being either CPU_RESOLVING_TYPE, or some 
specific ones for the arch mentioned above.
We have the common_* libs for target that share the same type among 
variants.

>   disassemblers = {
> @@ -3443,6 +3448,10 @@ foreach target : target_dirs
>     target_base_arch = config_target['TARGET_BASE_ARCH']
>     config_base_arch = config_base_arch_mak.get(target_base_arch, {}) + config_target
>     config_base_arch_mak += {target_base_arch: config_base_arch}
> +  if (target.endswith('-softmmu') and
> +      target_base_arch in config_base_arch_cpu_type)
> +    config_base_arch_target += {target_base_arch: target}
> +  endif
>   endforeach
>   target_dirs = actual_target_dirs
>   
> @@ -4150,6 +4159,7 @@ common_all = static_library('common',
>   target_common_arch_libs = {}
>   target_common_system_arch_libs = {}
>   target_stubs_arch_libs = {}
> +target_cpu_libs = {}
>   foreach target_base_arch, config_base_arch : config_base_arch_mak
>     target_inc = [include_directories('target' / target_base_arch)]
>     inc = [common_user_inc + target_inc]
> @@ -4219,6 +4229,23 @@ foreach target_base_arch, config_base_arch : config_base_arch_mak
>                            c_args: target_system_c_args)
>       target_stubs_arch_libs += {target_base_arch: lib}
>     endif
> +
> +  if target_base_arch in config_base_arch_target
> +    accel_target = config_base_arch_target[target_base_arch]
> +    target_cpu_libs += {
> +      target_base_arch: static_library(
> +        'accel-cpu-type-' + target_base_arch,
> +        files('accel/accel-cpu-target.c'),
> +        config_target_h[accel_target],
> +        genh,
> +        build_by_default: false,
> +        include_directories: inc,
> +        c_args: ['-DCOMPILING_PER_TARGET',
> +                 '-DCONFIG_TARGET="@0@-config-target.h"'.format(accel_target),
> +                 '-DTARGET_ARCH_PREFIX=target_' + target_base_arch.to_lower()],
> +        dependencies: common_deps + system_deps)
> +    }
> +  endif
>   endforeach
>   
>   if have_rust
> @@ -4390,6 +4417,11 @@ foreach target : target_dirs
>     target_common = common_ss.apply(config_target, strict: false)
>     objects = [common_all.extract_objects(target_common.sources())]
>     arch_deps += target_common.dependencies()
> +  if target_type == 'system' and target_base_arch in target_cpu_libs
> +    objects += target_cpu_libs[target_base_arch].extract_all_objects(recursive: false)
> +  else
> +    arch_srcs += files('accel/accel-cpu-target.c')
> +  endif
>     if target_base_arch in target_common_arch_libs
>       src = target_common_arch[target_base_arch].apply(config_target, strict: false)
>       lib = target_common_arch_libs[target_base_arch]
> diff --git a/tests/unit/test-multi-target.c b/tests/unit/test-multi-target.c
> index c7559827a08..0f0aff0d7d2 100644
> --- a/tests/unit/test-multi-target.c
> +++ b/tests/unit/test-multi-target.c
> @@ -30,6 +30,13 @@
>   /* stub for system/main.c */
>   int (*qemu_main)(void);
>   
> +static void test_accel_cpu_parent(const TargetInfo *ti)
> +{
> +    g_autofree char *name = g_strconcat("accel-", ti->cpu_type, NULL);
> +
> +    g_assert_nonnull(object_class_by_name(name));
> +}
> +
>   static void test_qom_types_are_unique(const void *data)
>   {
>       const TargetInfo *ti = data;
> @@ -49,6 +56,9 @@ static void test_qom_types_are_unique(const void *data)
>       module_call_init(MODULE_INIT_QOM);
>       /* trigger type_initialize for all types */
>       object_class_get_list("", false);
> +
> +    /* Accel parent lookup depends on the QOM types above being unique. */
> +    test_accel_cpu_parent(ti);
>   }
>   
>   int main(int argc, char **argv)


