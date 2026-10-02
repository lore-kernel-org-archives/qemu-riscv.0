Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE859CA5FD4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 05:56:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCWFo-0007VC-BL; Fri, 02 Oct 2026 01:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCWFj-0007UW-W9
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 01:56:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCWFh-00026d-D1
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 01:56:15 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6925keMI1072543
 for <qemu-riscv@nongnu.org>; Fri, 2 Oct 2026 05:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8E2FcrWFtQzoHqmHUGBOry/IEuIMn1Gr9r+T8CUUpDk=; b=eBBvWawl7B5Wma2c
 lmEpaL9ecuBJ4OJYCQPoCsHEie2B3OzqpqMdwfgZd5cWUqPqYgCmJOP21p88D+Jg
 HxG1PRqOcMUSAOT8YBloFZJTFQIYs0CDUfNvefS+OgSp8YvP2UzWYY1DzkRs8P22
 fixmX4lRO2KsIJB3hwHndm3HQu+gTeenUHcSSPyi9YurdlSY4CYIbyKLsg4OTpYv
 /jBcaKcsqraT2umenXI/iNzpi/zoWphDdbu+Y6e8GW9nITYXInv7WJRW3J5j3+ws
 VGZILM4G+JLIHn4J/YPMIZGmBuNun5gfs4hE4OmYHa0dF/xDXuQ1lCdwNFg4/o1F
 YC6vUA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukbhp0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 05:56:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93ae8e7e546so1373221985a.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790920570; x=1791525370; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8E2FcrWFtQzoHqmHUGBOry/IEuIMn1Gr9r+T8CUUpDk=;
 b=IHX9EPN+6OtV2y/ehQ5G4U74Cg6U4MRBNyAn+v/Xe34pwh8FsPt3QbEcC4h5IwQwwj
 XtJv7q7m13gKoKWU9izSZPfrgikYLkH1YQVmO6sp3MmE6I7CV27Me/jjjbWYhn09qFGM
 uNSZhMkFpMx+V1GdsKXDqoOcjsLKOpdn4EDiddlyRe34+kqBi2wcrNkZP1tod2tuIEaf
 E5LO8q16RknKcCnDPYlcCGuU/u/o1i6FNyXdlnVJHvYr1xYAm4CwZ15TdLyb97mm0zni
 VU/YjuwTuHlBzK4tPLDz6+iShmRSjx+6RK1Opb8n14fn2gypcv0UrDXJNNFpdSyC2qNr
 HqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790920570; x=1791525370;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8E2FcrWFtQzoHqmHUGBOry/IEuIMn1Gr9r+T8CUUpDk=;
 b=NGLu93SyXOnEc2Naqojq5Cn+uSdRYE9smjo/6Ue84GBP2fTZHaqG/SZAcnkXYMJS+5
 zd+uqcr4fqRIej+UccpWF+vHe4W7UM+Ar8zyov8HCR1EBENnWAex6Fzk1XyE3dg1uHpz
 CAMNS7zHoBQS8ydRxzw2YCZDjlJ0+m4GOEzipE71g1LQpiztltcRk9yoluLjjm+RSReV
 szJErXvEbKwm2M8cyNdOxxmhfKNmhau6Bc3JUxl6FNKIi0v+f57iaWrxoHF3O8TJp8bf
 1I0Uljp5TH/iL3OOOW9ecBuj1d6lqADUfitNTnkG1E8Yo0qKQGpaFv1ofwN9yvq9SIak
 1+Xw==
X-Gm-Message-State: AFuF++l1x1utp/yhjtRnWe6fjMhTRgCgshellZ/7Xr1Rn/GSJasCYidP
 h8lMLypQqLpltZoShaMMJeVUGlc0eYpP+T5Z2GuIxDyewfkDtdKOdD6UT6oxhVP2iSea9Zy4tHs
 rlP8eJ6iZnNPac4COxWJIEv9i29J/IavQxXd8uyByqWSCGL/n69tI33L7hA==
X-Gm-Gg: AYBFou2L3G2ySvBSPsni+QHnkgvPhZQp/D32pnbzWzteAB2NG7lUtz+r71Y/ECxr/Aw
 xzqY/FTIdS9uMgJVKXSGhvsru1PjuAFwDerWi/xUoeGZvdSrijFt12Xa6309t/izP3LR1GEW9nL
 7jESBk36h50LoL+fohtdUwfCKkUEdn1E9ezhgiLSGhKKsYHZRDIHOcI9wSpoJUwKrMN/NUxUarz
 3ggxDu5/527J5ENdYLcVNyRsLPtur9J0WhIGzHktSaEeLPjKGba9adiubOkJGn0uq5a1IAPvmei
 xfknqbCEy/2/XFUxQefkQDEJo3nRNistrB84JfiRNV4/pvNotsq4OiZF6g6LcQoi6peCi/vf7i8
 74WtSvJoVWZRrMZN80fltZfOzn07NTwBljQ==
X-Received: by 2002:a05:620a:271c:b0:939:6de6:9518 with SMTP id
 af79cd13be357-93cf1763839mr237442285a.47.1790920570298; 
 Thu, 01 Oct 2026 22:56:10 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:939:6de6:9518 with SMTP id
 af79cd13be357-93cf1763839mr237440185a.47.1790920569904; 
 Thu, 01 Oct 2026 22:56:09 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b38307190sm3074601f8f.45.2026.10.01.22.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 22:56:09 -0700 (PDT)
Message-ID: <496e9e78-1def-4877-9312-8d6764b63639@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 07:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] target/riscv: Make internals.h target agnostic
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-1-ea69b07afd31@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261001-rv-dedup-v1-1-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAyMyBTYWx0ZWRfXw0t8hByn5RUE
 CXejQqS83j2nWcx4zY7FIi95mcprZ+XjVIbWoKZMmXCwfe0ZNGb4j3imcxU6F2qSdT1svhNNkDt
 nyOW8I3F8gBJbmIkTNAmDegtgzRelUI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAyMyBTYWx0ZWRfXzTYKz1sbK9Un
 BdQk+Ablj8E08OPQybblDboBqyGZerFzTt9gpoGXcl2kqfbw0ATiPzVlWALQPg9yokto3rjAl61
 DBESLK39M5a0ZchI5+vBL14Bd7d7hgRQzaPv6zzXMRWPMoq9h2mfN2YJAiIRmbeU63KPD/KAO0m
 PbE4rwqhqgi/65o2lRGQto+u0QiuUvhuqUpBrD1pXqmK6/cPZWAYIuhiko3MP1NPWSHjb+2hEX8
 yTHgUv3PBZbS44AXoDUJlCvxrXZvlbyM66VclJc4ljAopmV2Bam5jP1oBFPlM+Sy3Awsr0uq8Sc
 hS+7kxClV0gxrtjPu2JjOYQDADMioIBqoTHtD55IdNCj74Ti5TlxF4yCdUNSyekua853F+9liS0
 P97Kfq8rTv9L6JzormfPtazB+BMNhr60ybF8XU56OzRoCvOKSS/yyuiQKmdAAP9aegYEWDDLXPZ
 7dDmMIcKeP5y5MC4IxQ==
X-Proofpoint-GUID: v2ouWMrDyZxPAXTdAJv82JsM0x1P9z7L
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abf477b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=MA8BGWbniLDi54e50OQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: v2ouWMrDyZxPAXTdAJv82JsM0x1P9z7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020023
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 1/10/26 17:59, Anton Johansson via qemu development wrote:
> Replaces uses of target_ulong with fixed-size integers, this is a
> prerequisite step to compiling cpu.c once for system-mode.
> 
> Note: the widening of target_long to int64_t in adjust_addr_body() is
> safe as rv32 is ruled out earlier in the function via the check
> 
>    /* do nothing for rv32 mode */
>    if (riscv_cpu_mxl(env) == MXL_RV32) {
>        return addr;
>    }
> 
> meaning target_long must be equal to int64_t anyway.
> 
> Duplicate includes between vector_helper.c and vector_internals.h are
> removed.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/internals.h            | 31 +++++++++---------
>   target/riscv/tcg/vector_internals.h |  5 +--
>   target/riscv/tcg/vector_helper.c    | 64 +++++++++++++++++--------------------
>   3 files changed, 47 insertions(+), 53 deletions(-)


>   /* Zjpm addr masking routine */
> -static inline target_ulong adjust_addr_body(CPURISCVState *env,
> -                                            target_ulong addr,
> -                                            bool is_virt_addr)
> +static inline uint64_t adjust_addr_body(CPURISCVState *env,
> +                                        uint64_t addr,
> +                                        bool is_virt_addr)
>   {
>       RISCVPmPmm pmm = PMM_FIELD_DISABLED;
>       uint32_t pmlen = 0;
> @@ -239,7 +238,7 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
>   
>       /* sign/zero extend masked address by N-1 bit */
>       if (signext) {
> -        addr = (target_long)addr >> pmlen;
> +        addr = (int64_t)addr >> pmlen;
>       } else {
>           addr = addr >> pmlen;
>       }
Maybe safer as (untested):

         addr = (sign ? sextract64 : extract64)
                (addr, 0, (riscv_cpu_mxl_bits(env) - pmlen);

