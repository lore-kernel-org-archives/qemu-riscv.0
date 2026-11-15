Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300A606A31D
	for <qemu-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qvy+j6Jq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sa778O2J
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xSdEf-00012E-PL; Sun, 15 Nov 2026 11:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xSdES-0000vu-G9
 for qemu-riscv@nongnu.org; Sun, 15 Nov 2026 11:37:33 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xSdEP-0008M6-57
 for qemu-riscv@nongnu.org; Sun, 15 Nov 2026 11:37:32 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AFFAusg1413694
 for <qemu-riscv@nongnu.org>; Sun, 15 Nov 2026 16:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b++bwHxLjskIcni6HUhpCgY3sGssq+uOABEIIMb8JIo=; b=Qvy+j6JqAUcyvMCj
 2Fx1XQEOn41MfA4GDi7C3sJmbHFSbVDGLm4zBXTZAmknEIKdZZXN+vFPU0DO+u3H
 WhPUqAND0U369DujPcbxHoVAHLj16sD5i7ZT3vlCHW1SSuILCihXz77JR87z2uyT
 Kq5aFXyYjlzJEUolMvB3LV05kwOFZJSHYS0PW74G2nLLnYBy8XfyDQWkhgq7IJ2t
 9t3aAkIwKDeKes7cRPPPfazatSt+eZaDZOpMN6v5Xo9HqK1wWsuC94MWo+yaFfyV
 hUoP66SHd4VyftTjWyfd9tygab4koLETfpgH/CFGwByX2FcL2wxYYwutY0pFoHGZ
 FLv6UA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcb9gk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 15 Nov 2026 16:37:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cdb90a6230cso1224305a12.1
 for <qemu-riscv@nongnu.org>; Sun, 15 Nov 2026 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794760641; x=1795365441; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b++bwHxLjskIcni6HUhpCgY3sGssq+uOABEIIMb8JIo=;
 b=Sa778O2JWBDeQX5tuI1q83QWXocSWGyWpI4cH2kUCvmwPcluaPonlAhqFiiaTYjWTv
 FQmT2XvZEIVnJbC0yoKLNhDbO+WX6zTgpxpxvoTnsdDWPJya25Kwm7DJ8njYtGuqQ//d
 hm6U942QfWI7srLKGxZZF0T09zOI1DsaaW3mt5ccZAoOjLXUe+7cKwWYjaPWoTgg8Yoc
 aL16+0r6wkIfb7bG/v/zdxjmR3BgDmwU7xV3K1gqT7FHj466p4IsZ28iLY2zoTLhvyqm
 WvCEofbCV+3FVTENFuhrE5hiSINyH+cfISVTWVpo+vAtAUBYHRctrVveTGuNCvwwS+qB
 knYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794760641; x=1795365441;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b++bwHxLjskIcni6HUhpCgY3sGssq+uOABEIIMb8JIo=;
 b=gb8V3gc3CXmINVqm2M8AhP49huFdFAT33NzFJEfV04EnDDKG9fusYO+Z7gbgb6kk2p
 vQRDR5jpZq/HcOSTh0h209D6/aU0xNl/VfDKZl9IybZtTDz1NU+G7+9gZWeIHgZ5EuZe
 hHWGndU97nQzozDN5JTl+lTxUQ6pWSpXxQBlnRCfsMayy1VIwHJMkLOUlWGeFgxKbuws
 KQZBzpl4RqMlUFH3rcZnLGNKw11JoFRhA+JXUlsP6w+l1cRErRzOibKsC1rnsloXjvIf
 Z5MkKBXdONoAvhhftDAL1hg3WeRCJZiX+MoCxcQxkioweMhIbhKyP21XxBA9wtDeruv1
 fH4w==
X-Forwarded-Encrypted: i=1;
 AL+hErHR942JGEcuAqrCYyvEQcVEQUDxfs/UdaciNcw1WOCKEvJMxWbrJcg/EuEc7vfGc966cOcX0tr1zaQ8@nongnu.org
X-Gm-Message-State: APuU4Z/KE4mEl1hz7UsKpI7or0GJFADlyele3bIcriWzeAgFoEjsuEEQ
 rPfl7dZAOVg9POmmxK0G19djGCyIcgTTmzPBWcKrbR5DVxRkPXz2+Cn8WzaF4WsWSWgdPmSPvZI
 Z0s+V4Efg8mrJvikWHu+YfnyTaPsDZYzbOfi+s5GtJljvX6I/9Xw/hM57XQ==
X-Gm-Gg: AYBFou2NpusQYY3UoHYAbbvcVqgLmMK+70s1Wv1/aNvWA5kjlpYwLf12NwGGZPPYrg0
 G22FNBum4dFuuYG1jviyJ7lKDIIcy0RdZRBrDcoWgl6UpZxtdOepUgB1QzkYpK9YhrYgr2zCzbw
 71UcV6kqAXNuzdgI0q6QaYFzmwjmu26WSEphlWAnnSb8Sx8W3oMbDq/WMdhw6o3yNLNvl9BNWVk
 6FoDfzF5gFL+9onFrRTGiLr/TbG5BRMOp0QSET9zGvmKyGHQfRLu1cUDLVlMUBrmbhW+UocQIM+
 7mLLhsj6AVF2bCL0x/CQwLRr/Hp0pZCuPeI3fyXQLddvSh1caG+K8LKx0dNG+7jFfPFZUnQmmjx
 L9m2UclrWa9YBy1KiRvmnfl3SewBmeQ5G/55QJIZnsq6o9CMNMI7BisA9SjgJFEemtyhbDwpSUt
 X7KupF6eSa9s4KU7iKOQAaiVsjdKm2xQ==
X-Received: by 2002:a17:90b:1b06:b0:3ac:b44c:2d84 with SMTP id
 98e67ed59e1d1-3b1b0a0e8d1mr8584709a91.13.1794760641483; 
 Sun, 15 Nov 2026 08:37:21 -0800 (PST)
X-Received: by 2002:a17:90b:1b06:b0:3ac:b44c:2d84 with SMTP id
 98e67ed59e1d1-3b1b0a0e8d1mr8584687a91.13.1794760640950; 
 Sun, 15 Nov 2026 08:37:20 -0800 (PST)
Received: from [192.168.1.169] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197ce55c1sm18322700a91.3.2026.11.15.08.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2026 08:37:20 -0800 (PST)
Message-ID: <ce14f379-af0c-46df-83a9-2a988414d825@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 09:37:19 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] accel: register CPU parent only for AccelCPU
 subclasses
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>
References: <20261106023936.772-1-luoyonggang@gmail.com>
 <20261106023936.772-2-luoyonggang@gmail.com> <avXCZ6IxBXWEuugm@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <avXCZ6IxBXWEuugm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA2NiBTYWx0ZWRfX7AZKw+RbG3Od
 FDmwSTAa4Vj9fmyCKlnyQX9jOXQhMdMFDSKbaQMdV7Uf93sr1kUMzfCCpZfxt2Zk6SWxGMKDWCW
 glnT+rXP/PtR4VowY1u7VOGVtsCaH2A=
X-Proofpoint-ORIG-GUID: xiWoVGxTTKKrPDm7ilmRh0UMQ3qkUswn
X-Proofpoint-GUID: xiWoVGxTTKKrPDm7ilmRh0UMQ3qkUswn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA2NiBTYWx0ZWRfX8HwkQv3spbo/
 fidIBy99omUjNxAzJNY7+iZEtCuiE7VM6GSsUk7Dn+q9v9RaV9amTPBfHx/qLzquYNpOi8vBzoG
 fecxoud9mLQdM5d5+mU0A8tW0MQkjatbdr7oCpZ7Ol67Xh25Oj06piNvwd0MdiusrkekcNtQwkX
 Qy3SXmEEvr1NoCkzMfI42PRxByMwMkrtAkHBL4j0O5JhOhV7OQWLewmqdmU9dZfN0++doONMRci
 Oa7CRFdgDzvVr475q0D1UFAeWwSBtjT4VGSJorwfR1wHLEx+/+qzeO8CJQ0f/YH4cGpSNaSUXUS
 GiRUKNd0MReoeOdRZk0RATJN7cYlrYMS6+s1qn/CP/HIKF1vkht9TQRtrPw2oO5ZJyhMO3YcDy4
 V1/LAawZt8hqnu+hCOdnn8YtZjgSao1t8NojgW0ZBx9pgsTIu/N6DG3YdoMk/wnS2lrbrIDx9pR
 36lT+tgH+wNqSIVH8aQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af9dfc2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8 a=B1J7nxSkg31nvX5rniAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150066
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 6:43 AM, Daniel P. Berrangé wrote:
> On Fri, Nov 06, 2026 at 10:39:33AM +0800, Yonggang Luo wrote:
>> accel_cpu_register_type() creates the abstract parent
>> accel-<cpu type>. A subclass names that parent, and
>> type_initialize() aborts when the parent is missing. The old
>> type_init registered only target_cpu_type(), which is one name
>> in a multi-target process. Call the helper from the CPU type
>> init of each target that has an AccelCPU subclass.
>>
>> ARM calls it because whpx-common.c parents accel-arm-cpu on
>> aarch64-softmmu. i386 calls it for TCG, KVM, HVF, NVMM, and
>> MSHV. i386-softmmu and x86_64-softmmu each pass their own
>> CPU_RESOLVING_TYPE, so WHPX on x86_64-softmmu finds
>> accel-x86_64-cpu. RISC-V calls it for TCG and KVM. PowerPC
>> calls it for KVM.
>>
>> Other targets have no AccelCPU subclass. Machine init looks up
>> tcg-accel-<cpu type> or kvm-accel-<cpu type> and skips a missing
>> class, so those targets do not need the parent.
>>
>> No extra tests is needed, as these QOM types already be
>> tested by the existing logic instantiating all QOM types.
>>
>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>> ---
>>   accel/accel-common.c      | 6 ++----
>>   include/accel/accel-cpu.h | 2 ++
>>   target/arm/cpu.c          | 2 ++
>>   target/i386/cpu.c         | 2 ++
>>   target/ppc/cpu_init.c     | 2 ++
>>   target/riscv/cpu.c        | 8 ++++++++
>>   6 files changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/accel/accel-common.c b/accel/accel-common.c
>> index 00a400243f..441d1b77fa 100644
>> --- a/accel/accel-common.c
>> +++ b/accel/accel-common.c
>> @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] = {
>>   
>>   DEFINE_TYPES(accel_types)
>>   
>> -static void register_accel_target_type(void)
>> +void accel_cpu_register_type(const char *cpu_type)
>>   {
>> -    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
>> +    g_autofree char *name = g_strconcat("accel-", cpu_type, NULL);
>>       const TypeInfo accel_cpu_type = {
>>           .name = name,
>>           .parent = TYPE_OBJECT,
>> @@ -142,5 +142,3 @@ static void register_accel_target_type(void)
>>   
>>       type_register_static(&accel_cpu_type);
>>   }
> 
> Is there a reason why we need to register this base class
> repeatedly for each target ? This class is defined in target
> independent code and the target specific behaviour is provided
> by subclasses AFAICT, so I'm not seeing why we need to
> duplicate the class per target.
> 
> I just proposed changing its name to "accel-cpu" so that
> it is always available:
> 
>    https://lists.gnu.org/archive/html/qemu-devel/2026-11/msg02741.html
>
That seems to be the right move. I might have been confused in the 
beginning by thinking that a specific base class per target was needed 
to be able to override class pointers from AccelCPUClass.
After that, I didn't re-question the why and just assumed it was needed.

This predated the moment I understood that children class have their own 
copy of parent one, so can override base class behavior.

You're right, taking a fresh look, it does not seems to be necessary at all.

Thanks,
Pierrick

