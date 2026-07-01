Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31C1C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 06:12:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weoAq-0004qF-F5; Wed, 01 Jul 2026 02:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoAo-0004pD-6e
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:11:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoAm-0004am-MA
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:11:49 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lX61137160
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 06:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SoHyYqO4aqroluLj9Q1S+7qEdoozN1L04oaP2Sw1UDc=; b=SN/Pavn5l0nOKbXO
 Jltj6avEsGCkPjJkv4MyT5Y8ci2Nt3SIGuL3dmtl2wV8WTq4Emz6mkN/lqoYWrHr
 EAXkJ3WreYmiF0EcTRgqaNxowvObK+auipeICpsy4JSye32RjyHpBl56hPgxbnHB
 soO30D1mOX5Xko58C/i1V8OHgTGjHtcnaNFewtRA4CanC7coahwR2IDdi7mphMc6
 w9ft3ftMlrDw1GcIMEq1ae9wURzb2t6OjIcNNGOFvhvuCP5exRrij8/AmjYUvwqK
 5dkwN9JP6q5uzAGMbxzoGZnggkfOIbaqhaviLJ8FiVKiq8sr540hlwwSymoH9eXC
 BlMOBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0au2sj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 06:11:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-91ed0e140c5so67070285a.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 23:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782886306; x=1783491106; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SoHyYqO4aqroluLj9Q1S+7qEdoozN1L04oaP2Sw1UDc=;
 b=dlno8rliEAH8xbQBwqe3s3yuus77sw1Wb0hIAD55w99TQl3WqlSEpRRboYn+J34KGH
 BybUiplxfvHWfpoX9foKZvyXyZg2rb+YXtC/T8goWs5p8uMPq2+UAp1ziPGEhlc2Wjcv
 fjHi6111o7HXgcitNoVf/RBZXR5RyJ5mZAS2cxUTVOzkDaK2uZc9L4EWwIE3mUz/An/J
 Tn1lU6CfGPPzivay9eTIIApSD3Wrr3ytSgxW/pR+HG6g0btStvwFX9wDVuuNl2dyC2I7
 H/5/df/zszBlnT9pak7qZTCQ4MhqoojckcOM9A2R9V5imWX0sym1rZN1pHVDRlx/h/gG
 z2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782886306; x=1783491106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SoHyYqO4aqroluLj9Q1S+7qEdoozN1L04oaP2Sw1UDc=;
 b=FW50+QyQoNm75G7JkDkyT3th0cji2Q4IOYXI8+Hg0VwrLowa6DM4GLqJSutTeska3B
 b2wt7/T1nP6L66jQk8ubqP2P6CvHk6ipSAjhNAW+ZPYd26r6veGq5CGUzXLXoTQrgoYg
 tQHV3cYL9ObV7OeoyGlvem3OAPJF9AAD/7JcYtjOyLx4c/oXC6rxH1EWzo0Yhia+gTU9
 QHznlNQIV9m0oPTezlahtsfMQ63UGNb9T295uPmv4ZMMtGvNuU14kOu+0zdy2DzCHeV9
 FUEwmlcqSuwORf1I32sHLLkWTa8hF8OC2JWHQCZ3iK3uRT3cJOoSfEHnchfbl6iRPz2z
 TMnA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9EXF6rH+VS9ke4Y+BCDS6GqGDssK2s3f5LK51q1JeLF3OaQkhWGZmyhRJtq2L0ifwifCBtsUd73YJp@nongnu.org
X-Gm-Message-State: AOJu0YxQmA72c9FLu95zFujIavP/usshHpxl9Qw9WWZaVVS+/UOQ/4Iu
 XjimnPR0mE7XREMPtf2kLFlnX/J1+Bi39ygjUXO2+wA+c9CAiNKUdVmGKzg/AZDt+Y2r2yPWKSQ
 7RNUeUuzEVrtkMQDLdPjMpoaopr78mKvqiGgWQZ8x047dAQZLCb5sdzKazKwYonKJig==
X-Gm-Gg: AfdE7clYSRPYWJraAWXR4G0p7Xi4hXTkXlTzG5By5NPIRLOAFs2Lxk4BmUQwUhIUKKZ
 LS+Af7ShKisSA+vyEnJDvAfj4TxxILOhouhHWfCJ8lP+dDrCKfUxM9sHmDaq0/jZ8xdPY7AEpmM
 GrDhaAWEB8C66YV7vjRTva541j4+YfQbjavku2z5iQtabehWX9wokBNE7BOvRWSHlnY8StF2k3Z
 DcGiryChKhb1dHRRfK+UFj90mD2JkhxWz6sdB+wq+XNP3Vvddn6WXSCeJ5n6FJhM6bNYsiYY01z
 l55qKMhrBfShlyIwTNF4fAShhxiFZy2CnOLyUBedcir4jFRhtAlkr9elnYN1nffJWFaqVvuYReB
 SgnOhH4ibYyJBf8hoU/Z7G+BVGzZs3UPgLzqYKvXfDFqUppjcSEAY0QI+HF7jBA==
X-Received: by 2002:a05:620a:258e:b0:92e:51ee:7944 with SMTP id
 af79cd13be357-92e784d1225mr40352985a.34.1782886306629; 
 Tue, 30 Jun 2026 23:11:46 -0700 (PDT)
X-Received: by 2002:a05:620a:258e:b0:92e:51ee:7944 with SMTP id
 af79cd13be357-92e784d1225mr40350685a.34.1782886306167; 
 Tue, 30 Jun 2026 23:11:46 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47560effc81sm14096761f8f.0.2026.06.30.23.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:11:38 -0700 (PDT)
Message-ID: <bf05f5e5-737d-44ca-8fd5-abd97c6513d4@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] exec/breakpoint: Move BP declarations from
 hw/core/cpu.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44afa3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9e7byKQMp6R3KdQvgMwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GH9gEa1ZaAQFuE-SuA2yRA9Cfz6by6wm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX+SvWRbolutmQ
 hUlTCYLRrUSSkiirNEfSN+qK6+vQU8NfYq17kr3jO+VYRunijbHddiUByamt0nAo05oWNSyZI6K
 hUxhMdrTqYQZkYb0q4CFBZc1mEsns4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX5/Q1AOhtzcHA
 52qjY2QxD496dUZZIdtdppZ8Mt3cqHnzL4jcJKE9htpOYpM9l1CbobH1hPtTjxA2e3nvra7OvT/
 G4QxvNBs1PJcPU4Zq3t2f5+sRwa3jkF3c6S49QFDshEXzMUDd0DK4RWZim5DU6n6+IgxBDiNTNv
 UyCgq7smJEILPnDJdts4Hfa65iZgKTmFNnfh6Mn7+AtyEIOnxlDgr5ULNq4Ykzd1kpmSg2WXqVn
 6xe3AVEjXtckkv0jnMp69BEqnXDm46NY54TcrcFLNAzeIGsT2mTFWGWtRTS+oOlkjc6z+Pclp9c
 VY2zLFnyE3LXVpXY9K3jvQdTSgsr8sumdBDjkRez69/dzKL5njobFlaj4/ilB5DeulMFkhJkt1g
 cttechBHRnsCRGrVMe8j4Hm0c+gksra3JQnvE81P9cE4p029jGMMSCzGayxsIGM9khfNqPBkCnV
 kPVTdK0CknqNZ27Q72A==
X-Proofpoint-GUID: GH9gEa1ZaAQFuE-SuA2yRA9Cfz6by6wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010061
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 1/7/26 05:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h | 21 +++++++++++++++++++++
>   include/hw/core/cpu.h     | 21 ---------------------
>   2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
> index 95f0482e6d..4013d9a07c 100644
> --- a/include/exec/breakpoint.h
> +++ b/include/exec/breakpoint.h
> @@ -12,6 +12,20 @@
>   #include "exec/vaddr.h"
>   #include "exec/memattrs.h"
>   
> +/* Breakpoint/watchpoint flags */
> +#define BP_MEM_READ           0x01
> +#define BP_MEM_WRITE          0x02
> +#define BP_MEM_ACCESS         (BP_MEM_READ | BP_MEM_WRITE)
> +#define BP_STOP_BEFORE_ACCESS 0x04
> +/* 0x08 currently unused */
> +#define BP_GDB                0x10
> +#define BP_CPU                0x20
> +#define BP_ANY                (BP_GDB | BP_CPU)
> +#define BP_HIT_SHIFT          6
> +#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
> +#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
> +#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)

See 
https://lore.kernel.org/qemu-devel/20260630220100.1289-18-philmd@oss.qualcomm.com/ 
;)

