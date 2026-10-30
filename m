Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD65606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUXICXQZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9gWDIX+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMhcA-0001yK-FX; Fri, 30 Oct 2026 04:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xMhbw-0001sv-9q
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 04:05:18 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xMhbs-0000FD-DN
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 04:05:15 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69U5F9T93312595
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 08:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eY2Cny05Y9jPZqEMSlhtSLPJ2vBaVW6uvDFuD0lYxGM=; b=QUXICXQZoiuCDhqD
 Jy7jARAX49+Y+nAm6XUcLhEHAOYpEGxiSqfZj9Kcs95kzbmzsPlt4B3ODR+s3s7O
 rdGxUYOUa1hKFbiiYMV6qTcrMJBlIHf/Cz8g4AIWaDe56nbw3/33xFG0LeToI/Yp
 DURrqxBmviZtC3egXPmZoAuJNt80QNi38nVM/OUaUvUULuZPO+oVMQ+3V9f2Uo/A
 pmuOdWl0fNOQ4fLcrPGgrV5RdmgRF9yK50ERBJCT6aW9IkZnBDQriURJNWjbrViZ
 iqtboslo8eATsEICC4h9BicIJUFiPDy3qfQvBYLpyB1w/IyVNZP81Fdj0z5cLdIP
 rfrLmg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rhydr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 08:05:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7bf08dc2fc8so84314137.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793347506; x=1793952306; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eY2Cny05Y9jPZqEMSlhtSLPJ2vBaVW6uvDFuD0lYxGM=;
 b=V9gWDIX+k5henN15j4oij8VvK54vLc/tdgp+oNX+m9aagnTOZ7d1U6fIIqfDDrjhMb
 nw41VJcUBJdkw78zzi1ji2Hkq0fsrOIzrBJ2Sa/mysBctA1sMfzisa2T7cCoampSrLa3
 7SFp4sYqmoon+KJNzJ3E12JTeEvHZTTlwKO6M2tH8Ex2i97Tfb7uUq7WMBZM1VfZc0Vz
 sSrJBtK4v25FAXMQzWQfD+27ZSg/sFqPm4YWFWRbC8bLWauffU4Gylvi7/c/nDpKAgFM
 rxl+mo6uk4lw/RzbNHG1NC+rqMqtV7Aj0yNWrt2c0ttQihz91R2YeA+Myzqy6akjHeq+
 Wpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793347506; x=1793952306;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eY2Cny05Y9jPZqEMSlhtSLPJ2vBaVW6uvDFuD0lYxGM=;
 b=0mS38qGEEAPczwyEUSGR26KEQXPRAR4oOh0AGZUd/0mr9yZVXrHhjcbD8zgTywQsVY
 hBSStAcIJLJZ7APzIaFBSkVO2hva4uOYIfXRVcdhOl3O4adENDFrw2lrpkQznNAUFMy5
 /+7t1ickyJdzNcGwQINShYhHwV9eBIPJfTYYNjxBkND3jQ9A5n/g3eevTtCVdLobR0RD
 4EBFv5lVYQZGV4TnlI547T7cUOrkJForAudvWbt1OS9YipfBw99jJcQwzBcwKSGxk+re
 0OCEvKKUNnQTGP9oxtk2rrTWrq1FhLlcMhUI6+kaIj8NOQXAR6zaBLoKyADtutzXQiiP
 kgPg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFhfH5KBI/vt0TR8IiJpETyDB2+HT6+BaeFMWXcXEUARGW0QpTWF7NHcpUzhOLDI94alCOjBgXpuIQ@nongnu.org
X-Gm-Message-State: AFq9FYIYsW4p0WiHDoXtqmZrbuEI9I3rCqq1AUm7SM0nCd/mhGWkrdN9
 Q1XnDF3pMudHwe5xeLYNAIN/dthmLWHejeOCGbqfBXqB/byOe6mgqbXHRVRINBZXy4yjb4MnwrB
 dzjtRX60WmMMLWNoMKEjUWSCBlOfsxEPgdsTN3tqxLYlmuWrWIhBlFPVM0A==
X-Gm-Gg: AYBFou1wzUgiHgo7LvbUO/LDcYcgLstVLIAaj+DDH03CbreC/UnCnBvJSZfmXDe750j
 qXfzCDlAiMEvoqBcsenYQ55zRXUIZ0tT/vVDJtlsoJ2+N8GYabyJf1CYAMepebyn07jHzig2Mlf
 dIaRpYoBov9oK5YeNlvONc3rIAmIX5/1iokeCTDeinPR69FQnCqnQ747YV5HGXHpKDcNhNSxywt
 z4bG86ja2elbm81Za0QBglI7+oG7qX6uGhAKpPVUGGSIJTkFk7hX10TygJQsRRZiHOpuEi2OmjO
 aYmYrUxMKK+F+rlOOr9IRmo0jy00soQLLYuHUM15+xtDVXGWTajlOpHeMbw4qG0+IOCEr58o+d+
 KokeodfQEK9GyhL4sfsh+OE9Qi911UrlsF6baDAXmsAELaU32D2NQKTeeFcN8EjMcYn1VYn0nBz
 VMnjj26OPXjj/n++ca
X-Received: by 2002:a05:6102:1611:b0:7cc:9605:3974 with SMTP id
 ada2fe7eead31-7d072c2b976mr750050137.16.1793347506075; 
 Fri, 30 Oct 2026 01:05:06 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:7cc:9605:3974 with SMTP id
 ada2fe7eead31-7d072c2b976mr750027137.16.1793347505347; 
 Fri, 30 Oct 2026 01:05:05 -0700 (PDT)
Received: from [10.53.234.132] (2.171.88.92.rev.sfr.net. [92.88.171.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b723cdsm1931806f8f.12.2026.10.30.01.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 01:05:04 -0700 (PDT)
Message-ID: <4d91f226-4a3e-4ee8-bbc7-2fa267c9e4af@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:05:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] tcg/riscv64: Extract elements for vector
 arithmetic immediates
Content-Language: en-US
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-4-philmd@oss.qualcomm.com>
 <auOOEFFecNzz9mCG@aurel32.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <auOOEFFecNzz9mCG@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TUh9w05ao9ioytm70vEPirHZHSk6yTlu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMiBTYWx0ZWRfX4x2ivjYkTbpz
 Hl6WvQYCh9oHJiUaRILTTEYbs+T/uSUgf8eGO46lnNN0oMrhxMridgxVPDRXpQ3IIq1o7dwqf1j
 4F2xdzPMz8PVcr2wyHwf4p2nJ0Fx7j0=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae44fb3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=HQTXqKeVkpfRTvjBQxpVcQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=a1eARgKs3mAvNS3BxcMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMiBTYWx0ZWRfX4v05GyjzpEIq
 A0SCu255itkjMxI9nj5IyjaLr3bBgWGqqeDQH9LwPv4fJITqypmW7i69CCfhNKpws+jc6Q/iBqh
 iCZ3vpLya7nZomoK26nE2ZNwNZ5HZSXXtYtv4AUczOCLUv1lvKRiA4UawOtNkSqoEuGaGMDv3tR
 lAehfnafadLbBRhLTiF1Mt6XQh7TckqEkaRFpqQbvi8h5U2PKOh9wFxSegktGDt7CNRwB4Ufbir
 Sj7dNJMXCuExUCaMCej8l0tZW8XRh0jI26sH49jLK1ZB7FRnpucebeSwdcJEvxXMM1RZmQQq1Ay
 BhBwrouzvoIcM4i4FMvcYlXAVxdRYYoH5A533l1W3+HZ4mMMyKvBy7dgLxt6q1TwyGH/PYVBa1S
 gnYBJ7TgCFM9jjISIUOQiDTAmLXHjPCtY8rtGe6RczqD2dMXDRGjgqo86tjLAvGFnJ+yKbCwwF4
 SFRyktYQiTSJhbW3y3A==
X-Proofpoint-GUID: TUh9w05ao9ioytm70vEPirHZHSk6yTlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300032
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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

On 29/10/26 19:18, Aurelien Jarno wrote:
> On 2026-10-28 15:33, Philippe Mathieu-Daudé wrote:
>> The .vi emitters for add, reverse sub and saturating ops pass the
>> whole replicated constant (e.g. 0x0505050505050505) to encode_vi()
>> instead of a single element. This aborts debug builds on common
>> vectorized guest code and is undefined behaviour in release builds.

I'll reword as:

   The .vi emitters pass the whole replicated constant (e.g.
   0x0505050505050505) instead of one element. The encoding is still
   correct, because encode_vi() keeps the low 5 bits, but it trips the
   range assert added in 006352d69f14 on common vectorized guest code
   in debug builds. Extract the VECE element with vec_imm(), so the
   assert keeps checking that the emitter agrees with the constraint
   matcher.

>>
>> Add vec_imm() to extract the VECE element, and use it.
>>
>> Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   tcg/riscv64/tcg-target.c.inc | 23 +++++++++++++++++------
>>   1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
>> index 0e749ae296b8..a3d995e290b7 100644
>> --- a/tcg/riscv64/tcg-target.c.inc
>> +++ b/tcg/riscv64/tcg-target.c.inc
>> @@ -735,6 +735,12 @@ static void tcg_out_opc_vi_u(TCGContext *s, RISCVInsn opc,
>>       tcg_out32(s, encode_vi_u(opc, vd, imm, vs2, true));
>>   }
>>   
>> +/* Constants are replicated by VECE; extract one element for .vi forms. */
>> +static int64_t vec_imm(TCGArg arg, unsigned vece)
>> +{
>> +    return sextract64(arg, 0, 8 << vece);
>> +}
>> +
>>   static void tcg_out_opc_vv_vi(TCGContext *s, RISCVInsn o_vv, RISCVInsn o_vi,
>>                                 TCGReg vd, TCGReg vs2, TCGArg vi1, int c_vi1)
>>   {
>> @@ -2788,12 +2794,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>>           break;
>>       case INDEX_op_add_vec:
>>           set_vtype_len_sew(s, type, vece);
>> -        tcg_out_opc_vv_vi(s, OPC_VADD_VV, OPC_VADD_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv_vi(s, OPC_VADD_VV, OPC_VADD_VI, a0, a1,
>> +                          c2 ? vec_imm(a2, vece) : a2, c2);
>>           break;
>>       case INDEX_op_sub_vec:
>>           set_vtype_len_sew(s, type, vece);
>>           if (const_args[1]) {
>> -            tcg_out_opc_vi(s, OPC_VRSUB_VI, a0, a2, a1);
>> +            tcg_out_opc_vi(s, OPC_VRSUB_VI, a0, a2, vec_imm(a1, vece));
>>           } else {
>>               tcg_out_opc_vv(s, OPC_VSUB_VV, a0, a1, a2);
>>           }
>> @@ -2824,19 +2831,23 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>>           break;
>>       case INDEX_op_ssadd_vec:
>>           set_vtype_len_sew(s, type, vece);
>> -        tcg_out_opc_vv_vi(s, OPC_VSADD_VV, OPC_VSADD_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv_vi(s, OPC_VSADD_VV, OPC_VSADD_VI, a0, a1,
>> +                          c2 ? vec_imm(a2, vece) : a2, c2);
>>           break;
>>       case INDEX_op_sssub_vec:
>>           set_vtype_len_sew(s, type, vece);
>> -        tcg_out_opc_vv_vi(s, OPC_VSSUB_VV, OPC_VSSUB_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv_vi(s, OPC_VSSUB_VV, OPC_VSSUB_VI, a0, a1,
>> +                          c2 ? vec_imm(a2, vece) : a2, c2);
>>           break;
>>       case INDEX_op_usadd_vec:
>>           set_vtype_len_sew(s, type, vece);
>> -        tcg_out_opc_vv_vi(s, OPC_VSADDU_VV, OPC_VSADDU_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv_vi(s, OPC_VSADDU_VV, OPC_VSADDU_VI, a0, a1,
>> +                          c2 ? vec_imm(a2, vece) : a2, c2);
>>           break;
>>       case INDEX_op_ussub_vec:
>>           set_vtype_len_sew(s, type, vece);
>> -        tcg_out_opc_vv_vi(s, OPC_VSSUBU_VV, OPC_VSSUBU_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv_vi(s, OPC_VSSUBU_VV, OPC_VSSUBU_VI, a0, a1,
>> +                          c2 ? vec_imm(a2, vece) : a2, c2);
>>           break;
>>       case INDEX_op_smax_vec:
>>           set_vtype_len_sew(s, type, vece);
> 
> This is technically correct. That said, the goal of all this extra code
> is to satisfy the assert added in commit 006352d69f14 ("tcg/riscv64:
> Assert immediate in range for {i,s,u,vi}-type insns") not to fix the
> code generation which is correct as it only keeps the lower 5 bits of
> the immediate.
> 
> At this stage we already know that the immediate can be represented as a
> duplicated simm5 constant, so just dropping the assert could be a
> simpler way to fix the issue.

IIUC that assert was added on purpose, together with the matching ones 
for imm12, simm12 and uimm20. If we drop the vi assert, the emitter
stops checking that it agrees with the matcher; and vec_imm() costs
only five lines. The reworded description should clarify that.

