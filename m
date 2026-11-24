Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA75606A321
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BLWYE29Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MO3k54QW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVvdD-0001D4-Cl; Tue, 24 Nov 2026 13:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVvd8-0001Ci-Iy
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 13:52:38 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVvd6-0004sM-Fv
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 13:52:38 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOIXUk61618145
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2vqnlmmBk80MQVfVy4rzPum6jAp/sdQniDEzHDskeWI=; b=BLWYE29ZHqdXICHv
 zsDRkOGkrj3nySR4c4yewzYEB5g/u5+4mYgBgjnsYNf0HROhPTxxg38/6tW0aYcV
 xQQe1Xpdt2toVixdAW5VVNh3EOp3a2CYfk9V7Qn+4MJF9UVVHwjG4f9OcUDKvZ4z
 NhJ1GhrFdx7hKzAnv+52wH8X6Ec0mSciBqGcglmcDxeOn5El9C65R3v3Z/HEELEg
 y9q/RLfGCrcG0ITJQm6z1v2T3hPEjicC/brAf/uQp7rbnOlM4g+W3UWQnU+t5xYf
 720obqCrwNVxl5CUX9ZVKg3z1PHvUuYXubUjzc7nZTnJPk3pN1GIIbMwXJogr0B0
 hTGGuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky4bsm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:52:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-55cc3c32e15so54281911cf.1
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 10:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795546353; x=1796151153; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2vqnlmmBk80MQVfVy4rzPum6jAp/sdQniDEzHDskeWI=;
 b=MO3k54QWq23CornglsOLjGbfX6ECf0A5jqha/JYTAYXtk+kb9xZtxpWAOOpGDYNt5S
 f+TGsJ1OB4FfM7mMHP9JQ0KR+VzQkQ67Hi3y4pVn277G/SL9t3IXcR4we/JMvfsJCBQx
 do8mxuZ8V3DPKpOFEnpqfRkyQldYDoJNjhjDLqJkOWbvHIM4aGllDAHoUMmJkoK/er38
 v9fML6FKZH5Hrck+lk13PcIzctBmgAwdZ7tGyyxLSg2WvpiaoQxDn7AjRQXm9bF4uPTf
 m67zzSF7aXS5Vi8YsgA+OBY85s70depJx434LP0KU7+GPFpkqSq1Tuondu3rzCwM9Jap
 QKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795546353; x=1796151153;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2vqnlmmBk80MQVfVy4rzPum6jAp/sdQniDEzHDskeWI=;
 b=jmGE/5XodxCryKxRAB+54xZFjXnRVZeQqAqkVwZVcesgm1PblGGy7IDZ6DvjP9piqK
 vSbIVx8/bBs+Kln97zAT38QuJW4jvCBovl5kmmPT0tAn9EeJvIJ2sZ335etJjzZLgUIc
 yDGeC31P/4qmad8hRE2FLImrr3038SDH/lG2ISaekRXthV5Yy51zGdsMkW4fcschJMMI
 aAdWPSL+yOfrU15U7LXPGd7tQ+QYUdpAXLV1lRe96uqTKbvqklsWOAqdpeOJ0jVz90ky
 +SQJzXu4eG+SyuRbJopeDXa/lupKYulj9M5V2yqbf1GI+Lpph0DFFdxvD8ME+gcbZRjQ
 w2zg==
X-Forwarded-Encrypted: i=1;
 AL+hErFIvqa9J2cUuLY4X4t0bUr1D+oC8O4TTLBFtVMa0/+Lfxe7ELRMQnSl2Vl+dqMdsEg//ASbOSmZiIgd@nongnu.org
X-Gm-Message-State: APuU4Z+equyvcrNi9b1cDGfk9bD1hsJQkFN27C292BOMvx2Ikd8AF81Q
 xRhUS2f3qYd/8bFIJV+5QK/Yc4ItE4NiCnXtszR+oaXjPI+obq5OCc00hxQbCKnanVhoh3vTaW6
 1N69G3MheBffZLvNFo8LhpjtUHLkkAUY+y7piNmzl/K0x8fWvGGT9PoTjJg==
X-Gm-Gg: AZFdTZetnTSHS04gOot7TP3NKH67EnAJiJGqm/g4/FvCrudE/1+vLgfR//Qo59Q88ga
 9xwOFn3gsbfREb0k5Ghinf0lu61M2l08RxjlL/gPWdbHYzAIPdBXTP5xTdFYCLM5VLDZwQQXITT
 KCEF2uRXH6nSiKn8JLbgNHFxckY50jhOnSLC3567qbyBUxgRkI1aG4vnwdvufAC6eWZMyoVs1tY
 n5ks3rjNO21Z7ZEevbbA4cidFgO4DWghfyYR8k1Eq5kQsAq7Yr3Pu7Ft0AhVayrxttZA7fxldRI
 1tJszgsdUJcen5qgF+I1Hx/d949YcPMQx0y+72FouiDOPwt7u0BoFeZOr/m3fFALi9x97qT0wZj
 6y69fJmYutTZR9Dt14c9J/IbGvbAa5hHtvXV0CrU++1gHCw/HyTSzjd/HO7TQAhJiZExsWkKmjB
 l+e2CsDSAD
X-Received: by 2002:a05:622a:13c8:b0:549:df10:f62a with SMTP id
 d75a77b69052e-55d76a741bamr308656261cf.73.1795546352825; 
 Tue, 24 Nov 2026 10:52:32 -0800 (PST)
X-Received: by 2002:a05:622a:13c8:b0:549:df10:f62a with SMTP id
 d75a77b69052e-55d76a741bamr308655681cf.73.1795546352279; 
 Tue, 24 Nov 2026 10:52:32 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d78880604sm135351471cf.24.2026.11.24.10.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 10:52:31 -0800 (PST)
Message-ID: <77ad37e6-f068-4230-9cf2-9b8364fa7c49@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:52:29 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: add memory ordering required by RVTSO in
 ldst_stride_trans
To: WX Chen <wxchen0913@gmail.com>, qemu-devel@nongnu.org
Cc: Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20261121-fix-rvtso-vector-stride-v1-1-1c451042b0b5@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261121-fix-rvtso-vector-stride-v1-1-1c451042b0b5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05dcf2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=1zd4GTvV6lo8_xhFcXoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: pLkB5BSKFJGKNlB75k74ETlyuucX1pe4
X-Proofpoint-ORIG-GUID: pLkB5BSKFJGKNlB75k74ETlyuucX1pe4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3NCBTYWx0ZWRfX+jIYcWGmlo2o
 oVV/SZqJUn8L2TO4DkjDlW0YO+syf02CWcyvtfJthzXytF/padnL3H28AHTx/JhmGeIr7Tw7CV5
 UOHTcrnwVC7TYLIsN8lo72NE95EpEig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3NCBTYWx0ZWRfX5Tdy4Nc1sKJM
 jCBip8a2LuzeG4DiVcwun35EF28Z/K4mjJ0qY5dPQY5RhFOxrIJbjkOcxLCzUtXkz+0U9J/6WjE
 L/hEkSVr2X0S9Z0G4yTLdCQmfG+HNMIAtfu42jToMJPkW7seSGEvsH1SxgzBN/tPxm2aQvDaHaa
 F3KVaB/QVAl6M3+vQnsHJ4W/NlQQTp1kW2nhRAonFlBYodJJODn61bx50SGVE2Fk3rV9A7Gi2CY
 QTpZE30vKI9DyonCoHrBLm5MLqFYqMJxQS/EWsOhsOHeRV1LAxcYhB9kMlVpl8U9A62va4sANno
 BmyFmdHNRq4hJyps4vZMMsPsV8uE2kGL8QuSVFPOUutS8e0JxZRygufMx/Rrp53nSPowMkAHsOZ
 Xlv2SvyvOBusrWKVQRiWFsK5Shivb0K0BFAqipf+cyoeEGgcG/58j46E/r4y/0WRlyNJko6TX/7
 d4bQ2VT/HTFepycBXBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240074
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 11/21/2026 6:00 AM, WX Chen wrote:
> RISCV ztso extension provide default memory ordering of:
>      R -> R,  R -> W,  W -> W,  without W -> R,
> but the current ldst_stride_trans hasn't any ordering listed above. This may
> not satisfy the guest requirement on some weak memory ordering hosts.
> This patch add the above ordering in ldst_stride_trans, who is in charge of
> the following instructions:
> vlse8.v, vlse16.v, vlse32.v, vlse64.v
> vsse8.v, vsse16.v, vsse32.v, vsse64.v
> 
> Signed-off-by: WX Chen <wxchen0913@gmail.com>
> ---
>   target/riscv/tcg/insn_trans/trans_rvv.c.inc | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> index 7e1295f33e7d4b7a2ff26cbf428f6b5d9eb682ff..de6c8ba2a397b12cf0fecbe88936a4798a49bff4 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> @@ -880,7 +880,7 @@ typedef void gen_helper_ldst_stride(TCGv_ptr, TCGv_ptr, TCGv,
>   
>   static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>                                 uint32_t data, gen_helper_ldst_stride *fn,
> -                              DisasContext *s)
> +                              DisasContext *s, bool is_store)

Any reason to not handle ldst_index_trans, ldff_trans and ldst_whole_trans? They all
fall into the same RVTSO work you're doing here.


>   {
>       TCGv_ptr dest, mask;
>       TCGv base, stride;
> @@ -896,10 +896,18 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>       tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>       tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
>   

In ldst_us_trans() we have a Ztso comment explaining why we're positioning the barriers
around the loop.  We don't need to replicate it here but it would be helpful if we
could add a comment like:

/*
  *  See ztso comment in ldst_us_trans for more info on why
  *  the barriers are put around the loop.
  */

In the helpers we ended up adding these Ztso related barriers.


Thanks,
Daniel

> +    if (is_store && s->ztso) {
> +        tcg_gen_mb(TCG_MO_LD_ST | TCG_MO_ST_ST | TCG_BAR_STRL);
> +    }
> +
>       mark_vs_dirty(s);
>   
>       fn(dest, mask, base, stride, tcg_env, desc);
>   
> +    if (!is_store && s->ztso) {
> +        tcg_gen_mb(TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_BAR_LDAQ);
> +    }
> +
>       finalize_rvv_inst(s);
>       return true;
>   }
> @@ -924,7 +932,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       data = FIELD_DP32(data, VDATA, VMA, s->vma);
> -    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
>   static bool ld_stride_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
> @@ -958,7 +966,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>           return false;
>       }
>   
> -    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>   }
>   
>   static bool st_stride_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
> 
> ---
> base-commit: 08ed97c33c3818ef51a7c852347a28e9f66807b5
> change-id: 20261121-fix-rvtso-vector-stride-39fd6f035f17
> 
> Best regards,


