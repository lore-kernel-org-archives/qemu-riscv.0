Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C983CD6E6B
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 11:39:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV6P8-0001XR-4M; Thu, 04 Jun 2026 07:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV6P1-0001UR-1u
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 07:38:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV6Oy-0000Ur-KJ
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 07:38:22 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654BKR6Q011796
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 11:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KdGrnDU85/Gp8A4Y6rDYfemrSoy+zFmAw8U7j3rLZss=; b=aL64DzInSksFjuSS
 iHn2v+u1CaAkA9T3nCaELzsHQ+msVffUHyygbj2Td+7P55sUGbWPG/D9mvU7THJU
 tD44Z+IXJwtulPTrJx3BbroLiI+bpV/VHCv0fGlZha6ER20CwL4fKbOe77GExRM9
 6P0tFST+fi+PvqZlf17ia/Ve/mTLdvgqX8kJqSMHXv0EeQNse4j5YNqv46+m29wI
 R9XL2mG3ksXyUGzfG4KKhf+CErH99NwymSAyBX5SpCAhvOhvPbJV8vkLsKyb0uES
 hwmZ0iljiHAEquw+lP9w7G7W2JwgGu/aVYBug8vbpSf51qxWMTOvKHjsNq4Xe/t/
 YyMnag==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8dc02b3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 11:38:18 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-59ece6adf0cso429198e0c.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780573097; x=1781177897; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KdGrnDU85/Gp8A4Y6rDYfemrSoy+zFmAw8U7j3rLZss=;
 b=WrUa1CbpVatl8QcObEvu+QL3kbpZk3zoiAb8wTZCYRu0DepsIN5PIksmHlNNTUVH43
 sZU5Fpb3Uuyvyyr/GCq6CHEcLAVxO8/hzivjyFl4eNTYq8Znx8Z6L2Vhzgoxx82pTjbb
 1VUAgJM09sm3kqB6C0e8sCF3WGGiFrkHCQ8rWiMkylRdpZ/xMmVjRF0t7tW1khC8EH0G
 GmpJ1yayYvHXkcIDqO4H41To21GBKihxvVtQaFtQ9Cze4Ht+y73wt5obyW8f+n5Ij02z
 z/ABA8RUij/xvQ/OOKox5k9BzkefxpAzDFLK2OSqn39zljbdI6it0kXaJADexSuBUcs1
 4y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780573097; x=1781177897;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KdGrnDU85/Gp8A4Y6rDYfemrSoy+zFmAw8U7j3rLZss=;
 b=aXAMSznBv0e0/nS+rBB4W5EkTkoDLjLGQbNCTUjmHIBJa3+43dPAQXcN9TLRfAXAh/
 pB6SvzxaonE0r69Dr2GWl0lF5HDJZD77oAA4Q3/r1HrIXOY4H5l+DB5iamewyATGXKQB
 QTafFhtWsWjbvoS86upETUJ7sNeMnkq593+fbxrIWG4CHk8Eyb3du8gMbLqfJ0HwDE+9
 bjkxMpLtQ/+2CxB+Kxy5b6BvMa/7EFQXfre1XUGEWcM5snI3fTd4EO8qPS5f52zmuyZU
 fXtFqtGGEAQq3h9LolC0ijSeJz7X+ZXStY4g5fvp95K+HRRhjk3B6pplqzdY2Cu9zukO
 JT4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9zX4j4IhSSqr+GUiZ+Y4xfN7mnUVPxFct3R+uEdrIbJwQGnSpOQX/b7EPm5SFOQgC57Ks1JG/oqo0T@nongnu.org
X-Gm-Message-State: AOJu0YzpgK8C0X3wHRQ8G9XnPRaMzolqyoOw5mLL2E3fLy4+khcit9+f
 JLIHjGca84PD+3Nzw1FlEwWVX+3CnTvFfOAlbPjLWkjAtWgRvjBOS65gh64phx1C7s/anK2wFEt
 nFtK7hTSByN7WdnsxRCLw5BdAsaecHU1GghznWybI3VYH3jxLxcyd1KNhKw==
X-Gm-Gg: Acq92OEzDhsgTqR3MsbryLLq/zFVLHa0fNpFCSdmmZQj9d4k3Z2J0h8IgqyIdkt+Csg
 Ru8jpGqqtcE2h2Tmewz0YpQqwIX0BKIL5/d2FgNGdASvsBzI9g4wNN8OYYXLyp5Ac+zXPOGPBp+
 JNova7Uf1c2XFbsmYcLnx2PIQdS/FNzdHVT/e4N/NWoRbRvalEelVGdqaXWAZKNAyi2x4qga1Oi
 16ul3pEz28w4mnRggUoE6yX6K4EQ3x/FGbImiqt9pBJ++HW1rF+tBrbotO71Hwax7PYDSKZhoFg
 b0qSZ3ALT3X4CzWVMHiqjbty7NppaVYQHWE/SAEWUwNKtQJs7Ywx3dPbkLBGlNkO4feEDYsecRk
 xcSwTNS3Hgw1IyqgHhTw3ESc2MFx8qp03uOV+hXBb42u9Gn4GDjQEmk3HgGv6MY5JVSfA
X-Received: by 2002:a05:6122:d84:b0:56e:f071:d4ef with SMTP id
 71dfb90a1353d-5a6e62bf36emr3592781e0c.8.1780573097071; 
 Thu, 04 Jun 2026 04:38:17 -0700 (PDT)
X-Received: by 2002:a05:6122:d84:b0:56e:f071:d4ef with SMTP id
 71dfb90a1353d-5a6e62bf36emr3592769e0c.8.1780573096515; 
 Thu, 04 Jun 2026 04:38:16 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5a6d6413983sm4764197e0c.1.2026.06.04.04.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 04:38:15 -0700 (PDT)
Message-ID: <6dd6df87-132c-4cf0-ba73-18e6e29b6740@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 08:38:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/25] target/riscv/debug: Put mcontrol load/store
 match address into tval
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-13-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-13-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VVLFC75FL_Wfk_U2oTJee0NV1kz0_Rpl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExMiBTYWx0ZWRfXznE9CJdLgkpd
 B0zvJzEuY5Q7/9R4ROmQ1WskzvnxqNGwFqF1vrm1mJOtpghTBXu1glS1R9xmyUZ74G3oVWuvqxj
 UuzWEQ+6xZ+69JobRSQASMvAzJDp7DaxUkAfoZ59KqCTAfd7VMp+vJMcdIMXz6sf384T0ezu3GZ
 mLgp4HqJSMyLy509d2MW8kyZAerCVZrMb7XMGegpekFcJb6dpPA9Z3IVuGM71dK+yysXQUBH8dy
 RbYMCxWAx7JW2+aV0CeRbFLkUTwe4qS75LhH+R5xBT0/AgG5oetdwRbT0Pc2EEZE9bNNoR5nCx7
 /jKtEVYI7h+cCnkgGS+Hflc7F+QExHOPheIp+99HtVD6a7IrU2mP9ruTx5ZFxavuWfGfcFDgpyI
 lFO4mh599ZJ5mdXmeUsDSvomaoYPNWAPyG4JRnHDfMfXVQs6oCJRncZmWJkMcFkRkPhDF5xmevg
 HAME9UGGKaqTig1YXnQ==
X-Authority-Analysis: v=2.4 cv=eJwjSnp1 c=1 sm=1 tr=0 ts=6a2163aa cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZWLnrAQK2iS3FxJT6f0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: VVLFC75FL_Wfk_U2oTJee0NV1kz0_Rpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040112
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 1/14/2026 1:46 AM, Nicholas Piggin wrote:
> When an mc/mc6 trigger triggers on a load/store and raises a breakpoint
> exception, put the matching memory address into tval, as is already
> done for exec addresses matching.
> 
> Tval for breakpoint exceptions is optional in the spec, but it seems
> more consistent to implement it for load/store if exec is implemented.

There is a non-written standard that we follow in qemu-riscv where we always
tend to supply these tval style addresses for exceptions/interrupts, even if
the spec says it's s optional.  So yeah, you are correct.


> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index bd61b7ff02..19c45fb13c 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -1075,6 +1075,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>   
>               if ((wp->flags & flags) && (wp->vaddr == addr)) {
>                   if (do_trigger_action(env, i)) {
> +                    env->badaddr = wp->vaddr;
>                       return true;
>                   }
>               }
> @@ -1093,6 +1094,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>   
>               if ((wp->flags & flags) && (wp->vaddr == addr)) {
>                   if (do_trigger_action(env, i)) {
> +                    env->badaddr = wp->vaddr;
>                       return true;
>                   }
>               }


