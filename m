Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CBF606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hSUooM30;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuCEf7/d
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMULg-0007CH-1s; Thu, 29 Oct 2026 13:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xMULW-00074C-2g
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 13:55:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xMULT-00059b-0P
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 13:55:25 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TGDX1R3234241
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 17:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T4Mc+Fdl83qzfmlbsFfM7O3W4T+LwdkvYjEi+9qnibQ=; b=hSUooM303D8obxNI
 zRAtyHoR8JVN0P6ZVPHz/ppJ+oenuhCgTktDZtMrr3YKeawg81tAzePF2ul+Rg1p
 XqS8CPCvHgbOwnywce0abJPGgqDlQNu9GvEZvrXPl1zX2cCoYqX4755d3ahUJnzo
 0vi1NTUpLZ/Oee3XY6+4m/6y8//SBI8x7ecuKO12UVciBUMA6NAGFCBitJADqAx8
 dD8Q4xrSvpMZ+WuQFwwC3QwkwPNIkAmT+I0nHkdrPKgD91MwxJmwhrbdcLdskDqY
 U2JB+M9anrduX59fRPgJngHmhSWRwgKpy08cpVs3Qpg+ZBBmrkp6AgCkg5jHaoR7
 NGsDZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b2a9m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 17:55:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5363b06bcb2so50546631cf.2
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793296520; x=1793901320; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=T4Mc+Fdl83qzfmlbsFfM7O3W4T+LwdkvYjEi+9qnibQ=;
 b=CuCEf7/dEd+sBfSGpeotmLxtrl9Ys4WoiSkSANiN9b2QHaieZYGrSgrJ0zuHeOExPq
 9GHtZtHbVQVfeJC0ZWZNUpvh946L36faj5R522HjGs0mOifjfbSm1sy+cqYr1JLCfR35
 Dyt8HU8xEbytQk/Klt2TmXz8byNWwTCXtfZ6E3ONBfeXCqLDu2GmHagPHI2CktAzRJ5c
 ZpYa6Ml2X0t5w93eHzDfrrWc45Ndck9lsque72H/ckfKxJcntv0JwUxgq+WPVa12JNZ1
 3mNd9bz8u+3+9FJf1z7+C1/5WNWxjwKqI/tpFHLtMP8yqUGn8noVRfEZt4JPM/ZaVGoq
 /1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793296520; x=1793901320;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T4Mc+Fdl83qzfmlbsFfM7O3W4T+LwdkvYjEi+9qnibQ=;
 b=LEOP3zTgwGzbhiYDZUx462NacMU08YoWFTDa74W9kp8eSvb+4k5Sd0dQVIeykbQTsD
 crqqaAoZ6b+dQphjuyYWQ8mUVngGy6hO1baWyyJkWjlFc4oR3voMAthStmCEEevpmJUY
 vGa8A91z38l3shHwCY4F52IV/WI8IXuQhlL1VyAJYf4yWi8i5uMKfjg+vFV6BZdnJMnx
 ByiYMjnBxgt+6fKyfiXNu+BztlmpQuJZ6NB2rwfQcOc0T2Q7GlImmyCxyB8gCx5jxfF9
 Yl1uYvIfwzSlb1DQPhRYAMV9uy4s9G3otw1NaU5g61Dw6dwrlun5e9+ZB24MOkAehVBG
 +52Q==
X-Gm-Message-State: AFq9FYL9QRUPDWse4wNeiOG/Odnn05DxOhQP/BiZ/f5CNIJkVj9tCI+E
 b/uBROu3QWz+Pgt6ZIT6xdo2JgjQk+xnGA2PcXAuJgiedk8cpYaQKZaZcM8IwxoxNEQtZ1NK2SP
 qSnx2OtmIf0pvhqAOlJ7OoojMYkKSFuTKFhpK58aSQu8w/+hve1j4neUA0g==
X-Gm-Gg: AYBFou0+WK9vp4kK+I1gYVJdjvbcNWkakNCtxM00Neocyk57r30i8uh0ZF3tevHXYCW
 kmTB+ilSeQakrbpyOfl46jMujbiIM9h3XrNpCG+OGdUPGsXKYLDdlKBEWjGTdarWTvruAAJVS+d
 dA05d8rT6xbYBCr+6R9o+XpdEypCw49PHFlZ/H0kzhVK1dPqMI3+qF2UlPi0qjGxowI9NU/eYnj
 nclH4i+rLt1BQseyAUy8p50SDqIDCQK7NT2JfsONv3LDQHex9FsWu7a0FggPkUwrNlPah5cAlRH
 KDoyjHeUdbOc0DVr91xK3GLVGtzJ9jbTC0Ubs1kei9RFRT7eK5WQXEL/Y1649vS+kLir0gguNJv
 OCwzWgj9ygW06a9WSDMs6B7ZO6FAUg731wOJ4PLVhSZ55a1gj3zwofOnPx9Lajk1QATxwWPawP+
 GYy7ivQ5rpdg==
X-Received: by 2002:ac8:610b:0:b0:537:dea7:d3f8 with SMTP id
 d75a77b69052e-53fcbbed61bmr102504791cf.30.1793296520150; 
 Thu, 29 Oct 2026 10:55:20 -0700 (PDT)
X-Received: by 2002:ac8:610b:0:b0:537:dea7:d3f8 with SMTP id
 d75a77b69052e-53fcbbed61bmr102504301cf.30.1793296519478; 
 Thu, 29 Oct 2026 10:55:19 -0700 (PDT)
Received: from [192.168.68.103] ([152.234.122.251])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5428c6d6569sm1934081cf.6.2026.10.29.10.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 10:55:18 -0700 (PDT)
Message-ID: <4a3a147c-7000-4de5-9a20-33f2ffb77bee@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:55:16 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: Honor Zama16b for Zalasr accesses
To: GavinQin <qinzhengxiang@foxmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <20261024120211.236223-1-qinzhengxiang@foxmail.com>
 <tencent_BF29702C3097A727E3F9206043AE923DB207@qq.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tencent_BF29702C3097A727E3F9206043AE923DB207@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MCBTYWx0ZWRfX+cCbfAKWv6VL
 phStVOMJywRGvpAdGJrMoHLX26WqHIYpLv19ST90cn05C3+fOKPPKvsP2bWtH54azokvhf4SJJt
 MmC1FfqwavdHyaqkMHAlp1myBJ4cbHY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MCBTYWx0ZWRfX6xvj0CsX3yTG
 155u9SGVmFWpifemZKfY7dp6N4HY3CgsYL43SWmS86u3nGe2V8PEG6nHVDitF99m76exX1YmaM1
 a5sewiBvwhoCYHMnT3rNPsJ8u64iV8B2wmp8w2GfxpD4OolOH2e6gAQQiRbzU07jiAIjpXC0sTb
 tveYB4hqBJfKZW4LRT9lrQDeFZQpkci2ZarP7qqF7b8r2Qlzk+9x5i1BYGf+wDrYsCgwZbSVKUG
 zcNX9L6EaipK5pX0IVFr7u8qDP6XRol9nFijPZf9KIo0KDqxN0o1X/NxJjMApJ65ktJM4G+jNIS
 0UoWQ8t4V1IsTPfqPTPLwcl18nd7lcTXb9QgysP07rZ1je08OS32MRTJgUS9JMFAyGgvu2gWywi
 C/mnfHaNrcaWqoSE98E4WqTYZCBNXwMDodp66J+z6OhZwNoyUZzpc7iKcZndYea9nEFLNOMcg5y
 +EvU+2j9vmP3EQP0Cjg==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae38889 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=QOY8BskYDu05dfarAz2gNQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p0WdMEafAAAA:8 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8 a=rLo9y_UmEUpFpIU9TWgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-GUID: hFQ6d54W1Yq9BJw3NbylLX40DGU16FpN
X-Proofpoint-ORIG-GUID: hFQ6d54W1Yq9BJw3NbylLX40DGU16FpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290070
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/24/2026 9:02 AM, GavinQin wrote:
> Zalasr loads and stores unconditionally request MO_ALIGN. Adding
> MO_ATOM_WITHIN16 therefore does not relax their natural alignment
> requirement when Zama16b is enabled.
> 
> Select MO_ATOM_WITHIN16 when Zama16b is enabled and retain MO_ALIGN
> otherwise. Preserve the existing acquire and release barriers.
> 
> Signed-off-by: GavinQin <qinzhengxiang@foxmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>


Also, this patch, when applied with the other 2 previous patches, fixes:


https://gitlab.com/qemu-project/qemu/-/work_items/4101


So I believe this patch needs a tag:


Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4101



Thanks,
Daniel



>   target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc b/target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc
> index 79b0b2c63b..5bbd06a346 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc
> @@ -29,8 +29,12 @@ static bool gen_load_acquire(DisasContext *ctx, arg_lb_aqrl *a, MemOp memop)
>           return false;
>       }
>   
> -    memop |= MO_ALIGN | ctx->mo_endianness;
> -    memop |= (ctx->cfg_ptr->ext_zama16b) ? MO_ATOM_WITHIN16 : 0;
> +    memop |= ctx->mo_endianness;
> +    if (ctx->cfg_ptr->ext_zama16b) {
> +        memop |= MO_ATOM_WITHIN16;
> +    } else {
> +        memop |= MO_ALIGN;
> +    }
>   
>       tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
>       gen_set_gpr(ctx, a->rd, dest);
> @@ -79,8 +83,12 @@ static bool gen_store_release(DisasContext *ctx, arg_sb_aqrl *a, MemOp memop)
>           return false;
>       }
>   
> -    memop |= MO_ALIGN | ctx->mo_endianness;
> -    memop |= (ctx->cfg_ptr->ext_zama16b) ? MO_ATOM_WITHIN16 : 0;
> +    memop |= ctx->mo_endianness;
> +    if (ctx->cfg_ptr->ext_zama16b) {
> +        memop |= MO_ATOM_WITHIN16;
> +    } else {
> +        memop |= MO_ALIGN;
> +    }
>   
>       /* Add a memory barrier implied by RL (mandatory) and AQ (optional) */
>       tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL | bar);


