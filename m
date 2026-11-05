Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE8B606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=II0L64ho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAThbqie
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP3q8-0005KO-NT; Thu, 05 Nov 2026 15:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3oy-0005BY-Pt
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 15:12:34 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3ou-0006D2-TK
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 15:12:28 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HeOpU1440071
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 20:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QHgWrpM6Je5MUjRIfCnUqSUcI3UOUrpzQsy/4PouJ58=; b=II0L64hoSEEGtGiI
 PMfsgWvrWzDjcaToD5SClH46HldTrPMhibfhjQAcTnH5RHL3HAjeOY4sgn2qconP
 2C38hO+RSe7Z04c4I6zI05MNQDCb1zPQS/5yfk4JPA1NUpM4qZou0F9Y0fKfb+yC
 0wOl9o+dKT+utgxV+9qTUmTgeQNDZ3yRqqaXiq3rPKpu1HcXRMFgzYsnIIM2NMr0
 g737jNw/QYH18jWV21O7uzKc5I+d9mBl7ew8RasLfdxZ2kZzq+fSP5T8b+plP3wF
 VeGbusJlWOBRauf/pAERelhgiFWK6NTwxUH+yy1P+MhtRRCii1RLwFBkQ3b9BwFo
 s60gjA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v3knb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 20:12:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-36ecd5db581so837550eec.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793909541; x=1794514341; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QHgWrpM6Je5MUjRIfCnUqSUcI3UOUrpzQsy/4PouJ58=;
 b=eAThbqiebMnGbMK+pDTXN61Sg/hRi//deqvg5f+lTfG+u3tiyfumqxQL5nXxWwxJ8L
 79Zja8D+kAmSISMrkkOKCwzKSocBtBXsuFn1ToscJaiebearI6N2Qf2FD5Z5MOgI4hD6
 2oXiZE9CBR+cIwvWZ/AUYJ3immhhymu3+XooSKfua9cON17ND/XGzxPGQyySIodQ0rDw
 QntHxH0idriOnnL2GjQ5Sr20UEM0NT6Y6qeG7Ih4/fv19c6PsExoY+tqTk7oAJzabzU6
 W0B5aVSl/1IiF+PaxeczHr4LFyTpKX3VRwWqESYkeLIgpVb4oRu3ESoAgySgxZ7b+LO6
 AqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793909541; x=1794514341;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QHgWrpM6Je5MUjRIfCnUqSUcI3UOUrpzQsy/4PouJ58=;
 b=C83OUKWkiETDTgkc3wthZkPJEZkShMUBEippyjHqnreb1XuLIvOJHMcUZLjms4iSsK
 +yCweaIoPxlzafGg1nWADDykqSif/lnUEIWbs1ZCfta2DzkUoCyVzyIu9dOjD3kGXE8a
 DgnzV4J14gt+hElIOGpGS2Fgjqt+MVAMdHZgGG/ji9qazbwgwtQtutEyxcRc+YeuN5Rt
 33M6rRMQ1TxueF3gV18g1ed0awRaYqo38n+hglino17xwv3C6xXDZchFIblXl10yu7yL
 AvbUlNLO067shUR+3W7Jal9BU05xGmHe2I06q9CrFETjTV2EcM066CTttAysYszXbfr4
 sCXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz9s3U3a9RMK7m1+xoPWwLrSFO5tVUjEdcfra6B6Xm1uL8O3GDUGnhFCK8SbReNtLPNPIhMeEafM3qz@nongnu.org
X-Gm-Message-State: APuU4Z8G1xxYe8nbxKAOKuF7hMAnct7/WNAnsu9WpJLujlCLMUbmVFNW
 7Y+RqdkoQeoK4hi5BJq29c5A6/mzZqA/0y3yMRJcP9hcbMskm1zThG6O6lBYo17sSf9JXa0PDBg
 8hQYoNhf1fmgewS3msyAetjX65LcMf9yB6Pq0kpvfsvx8clU89kCX0cgpDw==
X-Gm-Gg: AYBFou39VVOs5jPeMeoKaJhjxYkxCzOnHlAsyfuRnNR85wsv+Ypv4hER917ODCq8E4G
 V6ZQzgqhIuWnOFVeIBj6PGAGFRKbFI4FWS32D7WA/zGZo1/aLHL3qpb5BqXDMQ543tYD6nFxFWN
 KfgB1UXb00hZepH/I/stGeZ7H/Cths55yjEimlGMi8wtXeNk090KbXobWvj1vycyDL/KNpv9Xk2
 k7eZqWwlYrzMzUwx8LG/AZ9akg3yrM/BFqRvaM1cQQbWlKA4pYHjF5OMER+M9R/hcwdf5exTtYh
 tiEcGVUQDMAj4X/0iMPt0ylwz1DM00rexHVUFbE/nmZUChs/PnUs25uf/PbDIrZMFkTo8eeeTtj
 clXeh7Fre8E63jZVtA6NswFRTK+22LVuaauZ61lFEztfDt2rctP3nvajVa9yA2wsH59lRcxXMKt
 NuKcqMlk7xV3rc7KfGYv8ltpnDB5t/yLpG9RDQQBnbyg==
X-Received: by 2002:a05:693c:26c6:b0:36a:50f4:ed0d with SMTP id
 5a478bee46e88-36f76a1cc34mr264220eec.25.1793909541210; 
 Thu, 05 Nov 2026 12:12:21 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:50f4:ed0d with SMTP id
 5a478bee46e88-36f76a1cc34mr264182eec.25.1793909540651; 
 Thu, 05 Nov 2026 12:12:20 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36f72fbe241sm543164eec.10.2026.11.05.12.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 12:12:20 -0800 (PST)
Message-ID: <68504883-eab8-40b3-8c1e-2dcf64c6f6ca@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:12:18 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] accel: register CPU parent only for AccelCPU
 subclasses
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>,
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
 <b9474466-d91a-413c-bedd-a976b8cfa31c@oss.qualcomm.com>
 <CAE2XoE9KGLcegO5fONsnNd5ct-2V=AiuxGocrJ1XCMmymw4tOg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE9KGLcegO5fONsnNd5ct-2V=AiuxGocrJ1XCMmymw4tOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX6RLy0FOck+gz
 16h9e88XivEmHrj/K9moyymviErvv6D/PJtWwjod62HmoUiYyKEMYQ/kc0GA5dDe7zVKMn4dspH
 ZKQjT2JiYfbMlmtSO9JPpMHwu3+if5k=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aece326 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=yi15RFOVOLFOnr0euY0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX/YSvaeSttQ3W
 G3wHpgU82YFpJ9pVGOGEQrXTqiIKzen8oRE2B0PLPRvGCKpcdtGrVkhsbrngU6ueWN/yrLi3LmI
 vwvK8V/azXa+ya/zn+yW5N/5cqCBZGlY1x2Eb8kiICNmMn4G4QOpZwNypQOl7Fpq9sp13KcYpIV
 ntgt1G8E6pJ5I9hyZ5ghhrKm4gZzfZUouiP4Yzm0utpN+C28pCURza6XNRiXUzV8GlCp84hz9Bv
 nsFdnTFOpMvDW5wxNvK0Rv9uy8K/N9EFhcmQyAWh5TXZk3jR7M1AU6I/bETLEMlR7Ml44239uYN
 fPAC3Xg3Jg0uX9aSm/wKFwop/U4TC/E4bD3JvZnElk6vI6hN9GA8+957NEbhFvanQBVbbqxtPpG
 vuZcGz7J8adHITvIBqp2OkLQNoWJY3SdsR6NXMP6J/No6lQDoHy5gu7K42UILvifOaKt3YoxJ70
 6IAS4q9MCkkQ9JYY4zQ==
X-Proofpoint-GUID: I2bgpoYcD1oKbpjctHkkw30vDggVDTyz
X-Proofpoint-ORIG-GUID: I2bgpoYcD1oKbpjctHkkw30vDggVDTyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050080
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 11:54 AM, Yonggang Luo wrote:
> On Fri, Nov 6, 2026 at 3:42 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 11/5/2026 10:33 AM, Yonggang Luo wrote:
>>> accel_cpu_register_type() creates the abstract parent
>>> accel-<cpu type>. A subclass names that parent, and
>>> type_initialize() aborts when the parent is missing. The old
>>> type_init registered only target_cpu_type(), which is one name
>>> in a multi-target process. Call the helper from the CPU type
>>> init of each target that has an AccelCPU subclass.
>>>
>>> ARM calls it because whpx-common.c parents accel-arm-cpu on
>>> aarch64-softmmu. i386 calls it for TCG, KVM, HVF, NVMM, and
>>> MSHV. i386-softmmu and x86_64-softmmu each pass their own
>>> CPU_RESOLVING_TYPE, so WHPX on x86_64-softmmu finds
>>> accel-x86_64-cpu. RISC-V calls it for TCG and KVM. PowerPC
>>> calls it for KVM.
>>>
>>> Other targets have no AccelCPU subclass. Machine init looks up
>>> tcg-accel-<cpu type> or kvm-accel-<cpu type> and skips a missing
>>> class, so those targets do not need the parent.
>>> test-multi-target checks the parent only for the CPU types that
>>> register it.
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> ---
>>>  accel/accel-common.c           |  6 ++----
>>>  include/accel/accel-cpu.h      |  2 ++
>>>  target/arm/cpu.c               |  2 ++
>>>  target/i386/cpu.c              |  2 ++
>>>  target/ppc/cpu_init.c          |  2 ++
>>>  target/riscv/cpu.c             |  8 ++++++++
>>>  tests/unit/test-multi-target.c | 25 +++++++++++++++++++++++++
>>>  7 files changed, 43 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/accel/accel-common.c b/accel/accel-common.c
>>> index 00a400243f..441d1b77fa 100644
>>> --- a/accel/accel-common.c
>>> +++ b/accel/accel-common.c
>>> @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] = {
>>>
>>>  DEFINE_TYPES(accel_types)
>>>
>>> -static void register_accel_target_type(void)
>>> +void accel_cpu_register_type(const char *cpu_type)
>>>  {
>>> -    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
>>> +    g_autofree char *name = g_strconcat("accel-", cpu_type, NULL);
>>>      const TypeInfo accel_cpu_type = {
>>>          .name = name,
>>>          .parent = TYPE_OBJECT,
>>> @@ -142,5 +142,3 @@ static void register_accel_target_type(void)
>>>
>>>      type_register_static(&accel_cpu_type);
>>>  }
>>> -
>>> -type_init(register_accel_target_type);
>>> diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
>>> index 9e7eede7c3..2fdb64d2ae 100644
>>> --- a/include/accel/accel-cpu.h
>>> +++ b/include/accel/accel-cpu.h
>>> @@ -20,4 +20,6 @@ typedef struct AccelCPUClass {
>>>      bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
>>>  } AccelCPUClass;
>>>
>>> +void accel_cpu_register_type(const char *cpu_type);
>>> +
>>>  #endif /* ACCEL_CPU_H */
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 71681447b2..725f1f3a5f 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -28,6 +28,7 @@
>>>  #include "qemu/module.h"
>>>  #include "qapi/error.h"
>>>  #include "cpu.h"
>>> +#include "accel/accel-cpu.h"
>>>  #ifdef CONFIG_TCG
>>>  #include "exec/translation-block.h"
>>>  #include "accel/tcg/cpu-ops.h"
>>> @@ -2753,6 +2754,7 @@ static const TypeInfo arm_cpu_type_info = {
>>>
>>>  static void arm_cpu_register_types(void)
>>>  {
>>> +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
>>>      type_register_static(&arm_cpu_type_info);
>>>  }
>>>
>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>> index eab0d5a4d4..31b09e6f8e 100644
>>> --- a/target/i386/cpu.c
>>> +++ b/target/i386/cpu.c
>>> @@ -23,6 +23,7 @@
>>>  #include "qemu/qemu-print.h"
>>>  #include "qemu/hw-version.h"
>>>  #include "cpu.h"
>>> +#include "accel/accel-cpu.h"
>>>  #include "tcg/helper-tcg.h"
>>>  #include "exec/translation-block.h"
>>>  #include "system/hvf.h"
>>> @@ -11093,6 +11094,7 @@ static void x86_cpu_register_types(void)
>>>  {
>>>      int i;
>>>
>>> +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
>>>      type_register_static(&x86_cpu_type_info);
>>>      for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
>>>          x86_register_cpudef_types(&builtin_x86_defs[i]);
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index 7f3036d903..fe3f2549b7 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -43,6 +43,7 @@
>>>  #include "exec/page-protection.h"
>>>  #include "exec/watchpoint.h"
>>>  #include "helper_regs.h"
>>> +#include "accel/accel-cpu.h"
>>>  #include "internal.h"
>>>  #include "spr_common.h"
>>>  #include "power8-pmu.h"
>>> @@ -7589,6 +7590,7 @@ static const TypeInfo ppc_vhyp_type_info = {
>>>
>>>  static void ppc_cpu_register_types(void)
>>>  {
>>> +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
>>>      type_register_static(&ppc_cpu_type_info);
>>>  #ifndef CONFIG_USER_ONLY
>>>      type_register_static(&ppc_vhyp_type_info);
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 362e561809..10e24f20e8 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -25,6 +25,7 @@
>>>  #include "qemu/guest-random.h"
>>>  #include "qemu/atomic.h"
>>>  #include "cpu.h"
>>> +#include "accel/accel-cpu.h"
>>>  #include "cpu_vendorid.h"
>>>  #include "target/riscv/tcg/csr.h"
>>>  #include "internals.h"
>>> @@ -3931,3 +3932,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>>  };
>>>
>>>  DEFINE_TYPES(riscv_cpu_type_infos)
>>> +
>>> +static void riscv_accel_cpu_register_type(void)
>>> +{
>>> +    accel_cpu_register_type(CPU_RESOLVING_TYPE);
>>> +}
>>> +
>>
>> This looks good to me.
>>
>>> +type_init(riscv_accel_cpu_register_type)
>>> diff --git a/tests/unit/test-multi-target.c b/tests/unit/test-multi-target.c
>>> index c7559827a0..fd44cf74ca 100644
>>> --- a/tests/unit/test-multi-target.c
>>> +++ b/tests/unit/test-multi-target.c
>>> @@ -30,6 +30,28 @@
>>>  /* stub for system/main.c */
>>>  int (*qemu_main)(void);
>>>
>>> +static void test_accel_cpu_parent(const TargetInfo *ti)
>>> +{
>>> +    static const char * const needed[] = {
>>> +        "arm-cpu",
>>> +        "i386-cpu",
>>> +        "powerpc-cpu",
>>> +        "powerpc64-cpu",
>>> +        "riscv-cpu",
>>> +        "x86_64-cpu",
>>> +    };
>>> +    size_t i;
>>> +    g_autofree char *name = NULL;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(needed); i++) {
>>> +        if (g_str_equal(ti->cpu_type, needed[i])) {
>>> +            name = g_strconcat("accel-", ti->cpu_type, NULL);
>>> +            g_assert_nonnull(object_class_by_name(name));
>>> +            return;
>>> +        }
>>> +    }
>>> +}
>>> +
>>>  static void test_qom_types_are_unique(const void *data)
>>>  {
>>>      const TargetInfo *ti = data;
>>> @@ -49,6 +71,9 @@ static void test_qom_types_are_unique(const void *data)
>>>      module_call_init(MODULE_INIT_QOM);
>>>      /* trigger type_initialize for all types */
>>>      object_class_get_list("", false);
>>> +
>>> +    /* Accel parent lookup depends on the QOM types above being unique. */
>>> +    test_accel_cpu_parent(ti);
>>>  }
>>>
>>>  int main(int argc, char **argv)
>>
>> This is not needed. When those targets will be added, it will already be
>> tested by the existing logic instantiating all QOM types.
>> That's fine to not cover that for i386/ppc until they are not part of
>> multi target.
> 
> So we have no need to add tests for it, I'll drop it in the new version?
>

Yes

> 
>>
>> Thanks,
>> Pierrick
> 
> 
> 


