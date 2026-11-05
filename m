Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3752C606A6C4
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 19:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9gKKo9Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KNvRCQoW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP3MP-0004ZY-HX; Thu, 05 Nov 2026 14:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3MF-0004Wf-RS
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 14:42:47 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3MC-0000Rw-Hr
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 14:42:47 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HeRZI1122125
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 19:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +QOVnJir3R9RchXDvliSUWFlXSIb1w3s7jM9+Awq/1g=; b=H9gKKo9YofDLMY2h
 jAGyXl6Pk/NSofTMEiGswVQC+X8nelqRiPotAEYqUh6IZMwE3pquOIevRZ46FEVe
 id957kA2FdyOz+9jl8XP1NBto56F2LF39UpfymPpqUy8aBf1IlcNvBANAQA+CpKm
 ZlMUV9IzgH8azY80VV2GUYdtc/6i2GW4G3XpwN3AC+96nna75E6i6umuNbBlnAuk
 j/b9cyIiVtjErECNZJt0dBBtzKjxX7pET5ZxS94QXTDdDqdx28aC6I6NUMnAfMdw
 7DXBDJPLT3md6Jh5zC/xCk6+syTivx6HNQGtRZ/rcsLBLUm7uconZrumEcmkB7A5
 rbU2HQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p2rap-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 19:42:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3662e7a9299so1265382eec.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 11:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793907761; x=1794512561; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+QOVnJir3R9RchXDvliSUWFlXSIb1w3s7jM9+Awq/1g=;
 b=KNvRCQoWwUwBkYam6bXyr7h8g+cVB4ABYc2rwPhL2iWF6cOqYPClvd6QTBnWBskqJ+
 mjK2TqsrYLn7Th3HRMsrFLEunDCc74dAnBDos2MwiZXUPMXHWdffhTqCpWTzAu2MLRSh
 ucsXgfA4ARujqK0oCy8OoJQQylCRbEIRyvmpahD4Q0RIzJbu7Zp3ev5R5K+ZvO7yrF/l
 2mjdbS2hxD+3EvZ1Q1XiDxqResoDRQ0BAxUpHQ1TMZwS4giQYd1YR64LoEInzeq9UcrU
 Y4R1RPRXqs0ZhCAKHHOEDu0ytXtnpIG+DFC6FxaU+o1B9NDeUByT+pgZmuYzgv0K+yth
 Gxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793907761; x=1794512561;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+QOVnJir3R9RchXDvliSUWFlXSIb1w3s7jM9+Awq/1g=;
 b=BqrSBRwFKnlAcxbpk1aelhYyBkbjYVqLy8M+Uwkvi86go7LbkHvmzgEeWqba6gHv8M
 a1yztFznahfDq4FvqEEsh3sg3rU/akw8/ZVdO2e7mj8bF9686P14subq5L6ww+/2ryGZ
 n6zpnbHsBPgyP2/5utNBUG7ZPruqWZ4wplFtiGAievAZIe1YL207vUrzfXve9Pytp5bB
 cE4Rm6XyOwqHWipsZ4aozEk2VuK1g8PV6dBOOv2GFEsQS65sfdnGOn05rHdtLEz7yqAm
 BFXvsiA8+OxLBEMhHluLkwWyiRbYpym20/afTXWS6pV7NM/uuHBWGBPeFcyrPRAJ1Rmi
 z6zQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4AyAyd8qx5KahzvZbMyRfm2puw1NfU9NmscBRSC6ZZjmSF/qplo0SwDOWdkQ74ZM88ai9bmd6Q9vj@nongnu.org
X-Gm-Message-State: APuU4Z97Gr86KmtInFSfYKMrgixGMiffFRfaj4PkgfF52YxWh3YbdeIr
 Sc1I5cundICRa4FcV0b1cjMgdlg9SvkGjbSCUsFxUxUxe6iEwY1KzM+5nZZM182EgGbYJnCgE0j
 +F70QKJT+qmFb9l48IrCtdsDabLyzocVEQd9/vDHSaXpQrjMMG7+UzhY1XQ==
X-Gm-Gg: AYBFou2qKm7Bz9hDyEjk21Se/GcOwD2+cf+t1HlbhScLG8TgWqQkWG/+rL0g/NQ0s20
 22MS/2uRG8nRXpnZiD//vtH9JnKAmZhxmNcXKmBqcNUcesrSv/LnDwHUP+4MzcBu4HjYcbgmaPR
 YGPNXg7JAAqMsSk34kIxSw69SSwFCF1IruewXeWFUUYL+5KgklN0UZPMbzd7cf/dDVNquOAh2KH
 w/ES5iiDns6GOoIbLEGLo7zQOsxQ6bXPAUiucHwhWf/w4uksX+RSgWvg3GGqkxfrKNuuKLNBwTn
 gGqLMh4Pa/Bh1Cz0sEaY2f58I0T4S8jzG0cnMsfqdeg199mzCn5DCBbytv95q1mQVbZjL2oxyAb
 Cvrj3yGyHvolUK+pOQaGCnmyUWLPBZ+8w7E6jdgLImTGc1AiYeWIGnCW503yDZYBAWkOUxH2wB1
 U2ySXT2djzAfOaO2YxlwVcZcdqExBLiNlExszdxn1fdg==
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id
 5a478bee46e88-36f75b1ffd2mr177787eec.18.1793907761439; 
 Thu, 05 Nov 2026 11:42:41 -0800 (PST)
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id
 5a478bee46e88-36f75b1ffd2mr177726eec.18.1793907760574; 
 Thu, 05 Nov 2026 11:42:40 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36f7379e5dfsm290836eec.4.2026.11.05.11.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 11:42:39 -0800 (PST)
Message-ID: <b9474466-d91a-413c-bedd-a976b8cfa31c@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:42:37 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] accel: register CPU parent only for AccelCPU
 subclasses
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Philippe Mathieu-Daude
 <philmd@mailo.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20261105183310.1614-1-luoyonggang@gmail.com>
 <20261105183310.1614-2-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261105183310.1614-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aecdc32 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=Xc0wq4E9_1UvSiohNwwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX7L4WMcLZSlm9
 KqUjgOWRLAwd0ydJ6akr2XgYnXEw18lb4BS9XfxWB1NpopWYOt/xxzI4pXXrMRA74MMIApAi2DH
 ywSAeuvrz/UEbo+wPJjwJ0kr0/6GEwmfi8CaWbvvJRIjQf1Tc8qpmEuk8qmUqOGVlZvrvuG7rk9
 FFnRz20fnj8gzGJquxgBo+yrGWawbOai+ZsN4pwglG4lyoCd4qyvEk1qbgUfHY7KhSVME1pcgem
 BDGF/vpV90vtEHh0hp7s9CNnpy8Zs2wokoEAHTHk74ycNjfeAGUTN78FtgL6yeZEbSpnOe2Fx4z
 3LLp+NOrFnykCa64MMko+DHsq5X7qtogWCIju/FH/oeYa6zaWVpe3jjt2GUMTMBgsM+ZJZPs20Y
 DrMMGjDJXiVaEzwepp6cQMTBdcr4OtOghJjBGeeR2OqotOpIeY8KRuIoBWMlwKhdRmIEs3k4c92
 M4KC8eecoEhUJgqeIHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX/oLHTyFV+x2I
 FPjz3+2yyZhr/SBwyBb5W+xCSXIYAvEmJCucBrtQLChHOeQZJsjEvpISb2qbSat0GoblCDVQslA
 SIPBi1QQi/5Mu/FX04kugkHTkw50O8c=
X-Proofpoint-ORIG-GUID: GWKfL1tQqxqYOkc4UdUUuClo-cx7BW7F
X-Proofpoint-GUID: GWKfL1tQqxqYOkc4UdUUuClo-cx7BW7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/5/2026 10:33 AM, Yonggang Luo wrote:
> accel_cpu_register_type() creates the abstract parent
> accel-<cpu type>. A subclass names that parent, and
> type_initialize() aborts when the parent is missing. The old
> type_init registered only target_cpu_type(), which is one name
> in a multi-target process. Call the helper from the CPU type
> init of each target that has an AccelCPU subclass.
> 
> ARM calls it because whpx-common.c parents accel-arm-cpu on
> aarch64-softmmu. i386 calls it for TCG, KVM, HVF, NVMM, and
> MSHV. i386-softmmu and x86_64-softmmu each pass their own
> CPU_RESOLVING_TYPE, so WHPX on x86_64-softmmu finds
> accel-x86_64-cpu. RISC-V calls it for TCG and KVM. PowerPC
> calls it for KVM.
> 
> Other targets have no AccelCPU subclass. Machine init looks up
> tcg-accel-<cpu type> or kvm-accel-<cpu type> and skips a missing
> class, so those targets do not need the parent.
> test-multi-target checks the parent only for the CPU types that
> register it.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  accel/accel-common.c           |  6 ++----
>  include/accel/accel-cpu.h      |  2 ++
>  target/arm/cpu.c               |  2 ++
>  target/i386/cpu.c              |  2 ++
>  target/ppc/cpu_init.c          |  2 ++
>  target/riscv/cpu.c             |  8 ++++++++
>  tests/unit/test-multi-target.c | 25 +++++++++++++++++++++++++
>  7 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/accel-common.c b/accel/accel-common.c
> index 00a400243f..441d1b77fa 100644
> --- a/accel/accel-common.c
> +++ b/accel/accel-common.c
> @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] = {
>  
>  DEFINE_TYPES(accel_types)
>  
> -static void register_accel_target_type(void)
> +void accel_cpu_register_type(const char *cpu_type)
>  {
> -    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
> +    g_autofree char *name = g_strconcat("accel-", cpu_type, NULL);
>      const TypeInfo accel_cpu_type = {
>          .name = name,
>          .parent = TYPE_OBJECT,
> @@ -142,5 +142,3 @@ static void register_accel_target_type(void)
>  
>      type_register_static(&accel_cpu_type);
>  }
> -
> -type_init(register_accel_target_type);
> diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
> index 9e7eede7c3..2fdb64d2ae 100644
> --- a/include/accel/accel-cpu.h
> +++ b/include/accel/accel-cpu.h
> @@ -20,4 +20,6 @@ typedef struct AccelCPUClass {
>      bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
>  } AccelCPUClass;
>  
> +void accel_cpu_register_type(const char *cpu_type);
> +
>  #endif /* ACCEL_CPU_H */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 71681447b2..725f1f3a5f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -28,6 +28,7 @@
>  #include "qemu/module.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> +#include "accel/accel-cpu.h"
>  #ifdef CONFIG_TCG
>  #include "exec/translation-block.h"
>  #include "accel/tcg/cpu-ops.h"
> @@ -2753,6 +2754,7 @@ static const TypeInfo arm_cpu_type_info = {
>  
>  static void arm_cpu_register_types(void)
>  {
> +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
>      type_register_static(&arm_cpu_type_info);
>  }
>  
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index eab0d5a4d4..31b09e6f8e 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -23,6 +23,7 @@
>  #include "qemu/qemu-print.h"
>  #include "qemu/hw-version.h"
>  #include "cpu.h"
> +#include "accel/accel-cpu.h"
>  #include "tcg/helper-tcg.h"
>  #include "exec/translation-block.h"
>  #include "system/hvf.h"
> @@ -11093,6 +11094,7 @@ static void x86_cpu_register_types(void)
>  {
>      int i;
>  
> +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
>      type_register_static(&x86_cpu_type_info);
>      for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
>          x86_register_cpudef_types(&builtin_x86_defs[i]);
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 7f3036d903..fe3f2549b7 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -43,6 +43,7 @@
>  #include "exec/page-protection.h"
>  #include "exec/watchpoint.h"
>  #include "helper_regs.h"
> +#include "accel/accel-cpu.h"
>  #include "internal.h"
>  #include "spr_common.h"
>  #include "power8-pmu.h"
> @@ -7589,6 +7590,7 @@ static const TypeInfo ppc_vhyp_type_info = {
>  
>  static void ppc_cpu_register_types(void)
>  {
> +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
>      type_register_static(&ppc_cpu_type_info);
>  #ifndef CONFIG_USER_ONLY
>      type_register_static(&ppc_vhyp_type_info);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 362e561809..10e24f20e8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -25,6 +25,7 @@
>  #include "qemu/guest-random.h"
>  #include "qemu/atomic.h"
>  #include "cpu.h"
> +#include "accel/accel-cpu.h"
>  #include "cpu_vendorid.h"
>  #include "target/riscv/tcg/csr.h"
>  #include "internals.h"
> @@ -3931,3 +3932,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>  };
>  
>  DEFINE_TYPES(riscv_cpu_type_infos)
> +
> +static void riscv_accel_cpu_register_type(void)
> +{
> +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
> +}
> +

This looks good to me.

> +type_init(riscv_accel_cpu_register_type)
> diff --git a/tests/unit/test-multi-target.c b/tests/unit/test-multi-target.c
> index c7559827a0..fd44cf74ca 100644
> --- a/tests/unit/test-multi-target.c
> +++ b/tests/unit/test-multi-target.c
> @@ -30,6 +30,28 @@
>  /* stub for system/main.c */
>  int (*qemu_main)(void);
>  
> +static void test_accel_cpu_parent(const TargetInfo *ti)
> +{
> +    static const char * const needed[] = {
> +        "arm-cpu",
> +        "i386-cpu",
> +        "powerpc-cpu",
> +        "powerpc64-cpu",
> +        "riscv-cpu",
> +        "x86_64-cpu",
> +    };
> +    size_t i;
> +    g_autofree char *name = NULL;
> +
> +    for (i = 0; i < ARRAY_SIZE(needed); i++) {
> +        if (g_str_equal(ti->cpu_type, needed[i])) {
> +            name = g_strconcat("accel-", ti->cpu_type, NULL);
> +            g_assert_nonnull(object_class_by_name(name));
> +            return;
> +        }
> +    }
> +}
> +
>  static void test_qom_types_are_unique(const void *data)
>  {
>      const TargetInfo *ti = data;
> @@ -49,6 +71,9 @@ static void test_qom_types_are_unique(const void *data)
>      module_call_init(MODULE_INIT_QOM);
>      /* trigger type_initialize for all types */
>      object_class_get_list("", false);
> +
> +    /* Accel parent lookup depends on the QOM types above being unique. */
> +    test_accel_cpu_parent(ti);
>  }
>  
>  int main(int argc, char **argv)

This is not needed. When those targets will be added, it will already be
tested by the existing logic instantiating all QOM types.
That's fine to not cover that for i386/ppc until they are not part of
multi target.

Thanks,
Pierrick

