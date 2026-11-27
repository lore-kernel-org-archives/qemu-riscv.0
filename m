Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE499606A31F
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZYdlOQ4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqS04aBo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWumU-0003oP-5p; Fri, 27 Nov 2026 07:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWulw-0003dY-Sc
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2026 07:09:48 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWulu-0006K2-Ck
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2026 07:09:48 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ARApQqw1560743
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 12:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bfCHy1aGwvGQoIT9FaQIWSQLz57DDUsdUsnvI1uV63U=; b=VZYdlOQ47dz8J7cr
 Jy8I/quOoRtLYGSl2X2JMq8NnKvnXB6VM3xUEBeve/qPoddhaH6Oueom24KchKRg
 MK4ybHitMh0KqHqu8C+rIOJvKUGEWYFq8GXgvOQ9HIDy59UxcxZzK0Bg5V+u4YjX
 Gxz6LUd9wScnfkJ1HcZoFToWxSvQgKlzZBoVmbtcpP5S8l9iMHY3CBbPvvQ/vnWd
 JmKlnSUFUu29asOOmdK1BREtTPd/8Cexk4dxf1fYpgD54JoivyN+lp2TPO/9+yZi
 /nQh3u0RbLaLU7b83sLAO1Hg6tqstz4M+p4DFQp5E4t46/8hZsuNdNKVENzXV75T
 8exmmQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55tvj4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 12:09:44 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-8b4bfc0b441so99615677b3.2
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 04:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795781384; x=1796386184; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bfCHy1aGwvGQoIT9FaQIWSQLz57DDUsdUsnvI1uV63U=;
 b=HqS04aBo7fEBYeXjWxhFr4697Oi1JV9XmWYJGmC1Gf6CY/XOK2a/2SR65KDmVT/ExA
 etjranJT7hpIJxJOqPyD/wp1pByV4eG3B87zGJCLkSZoVwAG5Nfs7aey28T8BxnG9lj8
 h1xMGno8dWw51/z83G2/SjmzBAWdF+fscoJjc56pRmv3NBxfdY3aoasv5oYioyQS16ru
 N77rA/PfCOlOq0cR0KN5qAji2Jztx1KfVK8aK2evmrYBQ7Jm30Kbfhtcs81+a5l1p4cg
 P5NxG/lAcVAdGJD0g+FSpadM5QUILiPyi227+R+gIzN2XvZaAPni8I6ZOjzB7ngpwtsJ
 6mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795781384; x=1796386184;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bfCHy1aGwvGQoIT9FaQIWSQLz57DDUsdUsnvI1uV63U=;
 b=cermhb+r/Ud76i+aDhBhc3clHADeIpbGdoafcxK250pLCwDUabtcb4sNuNoJA4HTre
 PVkNa526q8q7seQmnsxXcGqtRB0I3+Zk3BngS8eXXLQ57Hona/PASe060I/93l4/cByU
 cnyQAvxprlvtPEsLk8m7hL/eZ24uroVWCWUgLrdniutiLuPhLtzT/Yz5cIqIGYwVjQqc
 UBbrtmBrn2w/TTlpvzE8hPN51U1Ui5eMD43gmKIlJVF2+TKJ4RmCl9GDbjJghxrtFU2m
 QP8prfefUizfRqpu/VfX0bzvqczbpCQCCX2mrA6OFj7O6QqrYgZeU2ZPAJwIA39u0CVr
 7iAw==
X-Forwarded-Encrypted: i=1;
 AL+hErGTELB4khtGSQxd62LPdr2eXzB87jvoYiX0qcpsrjl56s6TTJTA1uQHRaw/zE0QQ1kBSKVgYKWHGSqd@nongnu.org
X-Gm-Message-State: APuU4Z8KfrQwqg1G6ADwpZly6T5HiZ6y1NJQWxgoXTZZPrGy1iixceVH
 9Ip5ZUmo2SgVO5mc9W3353WZYufuYyokOqw8QTdxsvN0SZ/K/XaPae1zhyptQ4Pwqes/I3xwc/j
 Shg2boBQsuuD4EAGOzWp/fvp+mUM+sQVtzRFJq3oUjNR3YN5jhRuBIuK61w==
X-Gm-Gg: AZFdTZd4Ud2TETp9G3PSFiLkBlcTOicgAcHOd3GdeiRgYo0t3MBr2AZRp9vWZgcm4+x
 yW6cn67YbXU3w+SEL4hw3CS9SgzIDqB6gnWWXZ40gm2LK1XOusZaQ6K7DHPg+ixooX/x4EPNyDk
 FVrOqVErd+vHGuX34o9aj0VPucCN3iW9OwVJMmyyREwwZPq67YzdCSZHRicEEHdSSjehYRhfEa+
 gfom/MMmssjQbEOB1QvsnvmabTjQLqHSHqjZJmTER8cq33Z19ur0K6RFPrngqE2tD+MXNeZZHFQ
 umcsgg7DLF5aeFnwFAif7ZYeOE2zJZmffKEF2NUvatnlIJKTBLIx5Q93T+77t4h5fPyumJWHiMK
 sjWsfVnVb2uK6ebWINOKzlm700Wyd0St1ddEAcd+JHuzR4QE3DSuNcbMIAHE1RXzOCAwzi6dhC4
 tZY+j0+lg=
X-Received: by 2002:a05:690c:6887:b0:8b4:c1ef:a7a6 with SMTP id
 00721157ae682-8b52043f895mr95357087b3.12.1795781383495; 
 Fri, 27 Nov 2026 04:09:43 -0800 (PST)
X-Received: by 2002:a05:690c:6887:b0:8b4:c1ef:a7a6 with SMTP id
 00721157ae682-8b52043f895mr95356897b3.12.1795781383099; 
 Fri, 27 Nov 2026 04:09:43 -0800 (PST)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2c8csm47824160f8f.2.2026.11.27.04.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 04:09:42 -0800 (PST)
Message-ID: <4ec0f721-e206-4891-8987-87ec298bd81a@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:09:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] target/ppc: Use 64-bit TB flags
To: Chinmay Rath <rathc@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
 <20261126233604.67722-16-philmd@oss.qualcomm.com>
 <60270254-3b7e-4d83-8549-7b8f64845adf@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <60270254-3b7e-4d83-8549-7b8f64845adf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX8qYN14cl8C29
 v1+y4K7C02s9qEoiXsiyxsyupf8wJsZHHl4+6h1uK9kYr14hMUiC+CpX6wqHhZ7Ptdm6VY5dKF4
 L3FdCOYufvhxWv1i3TNaPScX5CZ2+SU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXyiUHwqzqxP+Z
 jmCxiHFCTF3vp8uyArELoKuqAcue4CEPgSFBg4LCFDbKPrGTG3O6CnlxCyAfjTvHrNL2Fvv0uTc
 CFuC57GlizXBSuYnqptgXzfehU8AIOpqHUpM4jo396Ywz8vl/tojn/Bjy1inX5DpUu1V2N8fHiV
 Gf58VV/iIWkK7d6wcj0L6uVCJtfmGlSEf1dXdh1K1XYLPOd+psjW80aKk+oJr93t6oZa1uVBkQA
 EowolINauExTjLomJ+9yD68bsZqP1ATcf4Sh48e9313QDb2tQagBJDzaWNVnfxviwIE8aDKh3qX
 UW+GGsD9ZY+eOpXgdtlaR/CRN2KkdbBfrYSwy6JART0SEC0GR58TwgGJfBpnV8dXVY40UZmOOsU
 uqis+lQZCyFpyINV2mz0zhOY9us+0YLpJbrOuYK10+yfdWo8PCi72Xtjnc8MxV5+hoUxxdRY8VM
 f/ODa8j7xO64ItfBg+g==
X-Proofpoint-ORIG-GUID: 1HGCWdr27Ylz3gZ-oOd6JI6n2KxCiuV8
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b097308 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=OCz7AubN24_iuOGhtk4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: 1HGCWdr27Ylz3gZ-oOd6JI6n2KxCiuV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 27/11/26 08:57, Chinmay Rath wrote:
> 
> On 11/27/26 05:05, Philippe Mathieu-Daudé wrote:
>> TranslationBlock::flags and TCGTBCPUState::flags are now
>> 64-bit, use matching types for the values derived from them.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Hi Philippe,
> Few months back I was wondering why cs_base was used as an extension 
> instead of extending flags to 64 bits. With this series, now I 
> understand that it was to support 32 bit hosts. Thanks for that!
> 
> I was wondering if PPC env's internal hflags should also be extended to 
> 64 bits with this, but I guess that can wait for when we actually have 
> more than 32 bits needed there.
> With that,
> 
> Reviewed-by: Chinmay Rath <rathc@linux.ibm.com>

Thanks!

Easy enough:

-- >8 --
Author: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Date:   Fri Nov 27 12:59:28 2026 +0100

     target/ppc: Widen CPUPPCState::hflags to 64 bits

     env->hflags uses almost all 32 bits: HFLAGS_DMMU_IDX is
     bit 29, and the composite dmmu_idx occupies bits 29..31.
     Widen CPUPPCState::hflags and the helpers accessing it to
     64 bits (adapting format strings), so more hflags can be
     added.

     Suggested-by: Chinmay Rath <rathc@linux.ibm.com>
     Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 0f44096bad77..c8c9578f413f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1436,3 +1436,3 @@ struct CPUArchState {
      /* These resources are used only in TCG */
-    uint32_t hflags;
+    uint64_t hflags;
      target_ulong hflags_compat_nmsr; /* for migration compatibility */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7f3036d903ea..8675a8d772f4 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7610,3 +7610,3 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int 
flags)
      qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
-                 "%08x iidx %d didx %d\n",
+                 "%016" PRIx64 " iidx %d didx %d\n",
                   env->msr, env->spr[SPR_HID0], env->hflags,
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index acf74c543a17..0ed188c4d70b 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -83,5 +83,5 @@ static bool hreg_check_bhrb_enable(CPUPPCState *env)

-static uint32_t hreg_compute_pmu_hflags_value(CPUPPCState *env)
+static uint64_t hreg_compute_pmu_hflags_value(CPUPPCState *env)
  {
-    uint32_t hflags = 0;
+    uint64_t hflags = 0;
  #if defined(TARGET_PPC64)
@@ -116,5 +116,5 @@ static uint32_t 
hreg_compute_pmu_hflags_value(CPUPPCState *env)
  /* Mask of all PMU hflags */
-static uint32_t hreg_compute_pmu_hflags_mask(CPUPPCState *env)
+static uint64_t hreg_compute_pmu_hflags_mask(CPUPPCState *env)
  {
-    uint32_t hflags_mask = 0;
+    uint64_t hflags_mask = 0;
  #if defined(TARGET_PPC64)
@@ -130,3 +130,3 @@ static uint32_t 
hreg_compute_pmu_hflags_mask(CPUPPCState *env)

-static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
+static uint64_t hreg_compute_hflags_value(CPUPPCState *env)
  {
@@ -134,3 +134,3 @@ static uint32_t 
hreg_compute_hflags_value(CPUPPCState *env)
      uint32_t ppc_flags = env->flags;
-    uint32_t hflags = 0;
+    uint64_t hflags = 0;
      uint32_t msr_mask;
@@ -266,9 +266,10 @@ TCGTBCPUState ppc_get_tb_cpu_state(CPUState *cs)
      CPUPPCState *env = cpu_env(cs);
-    uint32_t hflags_current = env->hflags;
+    uint64_t hflags_current = env->hflags;

  #ifdef CONFIG_DEBUG_TCG
-    uint32_t hflags_rebuilt = hreg_compute_hflags_value(env);
+    uint64_t hflags_rebuilt = hreg_compute_hflags_value(env);
      if (unlikely(hflags_current != hflags_rebuilt)) {
          cpu_abort(env_cpu(env),
-                  "TCG hflags mismatch (current:0x%08x rebuilt:0x%08x)\n",
+                  "TCG hflags mismatch "
+                  "(current:0x%016" PRIx64 " rebuilt:0x%016" PRIx64 ")\n",
                    hflags_current, hflags_rebuilt);
---

