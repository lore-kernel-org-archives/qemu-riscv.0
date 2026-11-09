Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4319606A322
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YDXFi50x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etiNJ+aB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQQml-0006Y7-9v; Mon, 09 Nov 2026 09:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQQme-0006Xe-7r
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 09:55:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQQmc-00074t-G5
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 09:55:43 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9DFBwk022887
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 14:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0+IFDq/PmlEGOuxxFyftK8bgVsCMdJc+vZ+YTw+yiJA=; b=YDXFi50xJjuN/49E
 FtYSnNrqSkXLXuJpg6bWCFlNSQJmUpl0u8Dpw+1PbL0W99ax59Y2DycIUHvz2Oao
 itu0PUZecPHJD6/he8d6RWQSRUu6j7Bp635uF4C8fGcBXCEQ+hgxjzhwVaxrHRZk
 n7anq5DjgD7+ue3yujwi+Lqo7ugpvl2qePhWYHTIEik9iYLjP41fpOr/3ZdK2sH1
 XdvHVko2fbr4KD+7p/CE00DWtA+KydC2tn8HMou1x7svfAMeWPn1/0BGGXdcmS+p
 Xmxs2Y5sqEDD0CJzPhed4IFyexsbpNR6gEy8tLF+V1YY9vDxt3NIEUTES7w4xp6U
 D77cew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgtrb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 14:55:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5363763b556so19066621cf.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 06:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794236137; x=1794840937; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0+IFDq/PmlEGOuxxFyftK8bgVsCMdJc+vZ+YTw+yiJA=;
 b=etiNJ+aB/JeoXZMtXZ65nwLXvP8W/3AxyxD+sRTPVdjnfaDEcWEq11icC2Zr7PP+yC
 DSJE8dH6UtgXF3LhE1LyOLRFUlNO55Hchx26EOV7V+7i0iMwo0I7smyJFblZZQ0zKYos
 VqgFlcm5pX976hwWBi1JruTMpSAoO1nY3/DZAYHYSPGHj41OZfvT6HZwOVGMWNpytGR8
 fQKunwpv2/CkNzLuF5Y0R/SjwErf/T1L5kJfdad1E/0eJsyk+m3y8QD9XqVBHLc9Aa/i
 QTJPG/9alBi89gZWSddUgPObjt+97+fmRRFeNE+TVpyyYLey5f9DzD3uEpPL4CUM2SBP
 rWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794236137; x=1794840937;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0+IFDq/PmlEGOuxxFyftK8bgVsCMdJc+vZ+YTw+yiJA=;
 b=UEVIrxzsJBCsLthzKtFZETyURYcf+8hx92oxOPm4DdZ5qcxky+Lc6aWG/OaumYAk69
 YnBogMxXwHA9uaK9mkbLSEFW8iFO6htO6gZokYIi/HdWi6SNh3Fe2K6NKT+fUYA8q5qz
 lawJ1iyqIAh+SqD6Qy6C3Ua+0LS83Y47ddlmMrITP0J5S4bPJjbkbDTG8w9HVrCRtutv
 HuM71T7LwoaH/yh/ydesxhhWaygUX6mbwoFaXF1qFe+O6W9ZjO5Yt+hGxmlJIOjXS1/G
 2pceHEm+bA9ruz7dKWhdvH7lV5G6+KcJ2Lu1iN4P4C3QphbOgOmxqXOz2axWS/vPZaOu
 iQcg==
X-Forwarded-Encrypted: i=1;
 AL+hErE/xFKpC0rFsWJDtWasgjTjQ78EFjI3EoHHKX4rw+pEIwtceDc8pFl6Ynm6rawtdLCDfmV8XqsiGsI1@nongnu.org
X-Gm-Message-State: APuU4Z8/Lt9kd1vcjHDwcel8BFtiJlokkTwRSUvRAbaxyDAk9z9hsQPy
 ld/JUA3G9zqlBbb+4Brho9kras1LG043+9ZmokAXbgUiBEeFRRPW/q1zVWqhi9aT+32CYpuYh/K
 9/4Pk/xomTIep9WE/e1smqpjZIdfoe27xfVUB35mRNx822qyqtgMVZkwqAQ==
X-Gm-Gg: AYBFou3/XZ5WTyu+hu/Fes0CxVZ4P5khN3UHR5Ab+4ykDpGw/WGb0fKNu2/OCC/7Siy
 3aR1le9WipNTiawUdaS0Q4qCoerL97xZho/wY1CovjJ/KCCwTb18ysMGOgeFwNxsx6geqQS/jBL
 xVz8n/YT9e9qChAyxt+0ibHdAUxttIhGoIKLD6hXdx49Kt2pJWNYhFECy7a+E0Ya+KJ9OHfatOY
 Dn6wU7OgGWzPC2ADlGEXcU74XcUUieLcDatVo05gcmBYQZ9LPrcJVQM4d35zt8y5iNmMorTI2xm
 uXBCsF+MikPtdgs+oivDDAQQMBmkISudvNUaCmlpxdDj0Z4l+iRht08ByoIOKsMoT+1+AcJUCLX
 M9JZirr7GJp5oPcUEFChDESplYJTSuuR4IFtRLRYyLfw9oYaTXFTYesVBx0+flQuBLfXqyPDtaX
 QsyttTBtn8
X-Received: by 2002:a05:622a:138c:b0:535:a5f9:752c with SMTP id
 d75a77b69052e-552a5d63060mr64973641cf.75.1794236136543; 
 Mon, 09 Nov 2026 06:55:36 -0800 (PST)
X-Received: by 2002:a05:622a:138c:b0:535:a5f9:752c with SMTP id
 d75a77b69052e-552a5d63060mr64973051cf.75.1794236135918; 
 Mon, 09 Nov 2026 06:55:35 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-552638912a0sm42210861cf.9.2026.11.09.06.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 06:55:35 -0800 (PST)
Message-ID: <6f668743-7f33-4bf4-ba08-dbdba650de8f@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:55:32 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: write mstatus.GVA on every trap into
 M-mode
To: tewaro <tewaro@theorem.dev>, qemu-devel@nongnu.org
Cc: disclosures@theorem.dev, tewaro <tewaro@tewaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <cover.1793677945.git.tewaro@theorem.dev>
 <9c108816bf40bd4023f23ecc32527a7fc92c1747.1793677944.git.tewaro@theorem.dev>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9c108816bf40bd4023f23ecc32527a7fc92c1747.1793677944.git.tewaro@theorem.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX2ahm1YEuPSOA
 tj8F8K+0w4kzf8Yp9eSKLPCmGA9zDu1ZCmBeOG169ADQBmaotbZrW4OqijqULHeWOCYmHHtrg1N
 iGrL9Jq0lyLvUktEHtQQQbNErFn3Mmk=
X-Proofpoint-GUID: mbGQJE0ZNf_5AAa0pMWT2txNNYN94G9D
X-Proofpoint-ORIG-GUID: mbGQJE0ZNf_5AAa0pMWT2txNNYN94G9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX56fITKFlHClD
 cw/6Y6dmatFeZKYQ7OpXmloayy9GzuK94IUk3QX5wVfsJuqnXWRrh0dQJ7VtfIwH33CLtzDOHbp
 stxAQQ1uDdJrwIkvPOpf0ijeJwO6L750JElWE4SSAu6v/P19GbDUexUmgz31QiDR36JWJxL+22R
 eL5rV9TGGDttX1QMRMXEClA8obk5E4sxlSJhI766RxC1xkf4EzXIGgNCBGrdhT6FTjfe/zzLK0J
 s0yyN2jYTVsjLcue3m5Rqc6+fhbRoAKLPGzWTaCRVJ5sZMGPOpOW+OhWP52Duf44jB5mHZ20FCG
 ItlKYNOitf59uBBAqx6wGA/HEMX0e/kXFdIeCi3rcf+wT21cOgoYAiIqMK4wtk5LKgvkwSnv3kT
 0evyBJYH9j9YTQRaTzubG82M6sVfiU0we3O5fn3Hj3sTfICwBL7JFDHlFWWEvzW6rmUen+pPvo/
 puLUu7Fgt7I6fYT+a/g==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1dee9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xvfqbYfxAAAA:20 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=rNDt8dwyJFNyhbOj3TAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/2026 4:42 AM, tewaro wrote:
> On every trap into M-mode, mstatus.GVA should be set to 1 if mtval
> holds a guest virtual address and to 0 otherwise [1].
> riscv_cpu_do_interrupt() only ever sets it, and only when V = 1 and
> tval is nonzero. That has two effects:
> 
> - GVA is never cleared. After one guest-page fault, every later trap
>    into M-mode, including an ecall, reports GVA = 1.
> - GVA stays 0 when HLV, HLVX or HSV faults, because those run with
>    V = 0. The spec names this case ("SPV=0 but GVA=1").
> 
> The HS-mode path already computes write_gva for hstatus.GVA. Use it
> for mstatus.GVA too.
> 
> [1] Privileged ISA v1.12, 8.2.1
> https://github.com/riscv/riscv-isa-manual/releases/tag/Priv-v1.12
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4594
> Signed-off-by: tewaro <tewaro@theorem.dev>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/cpu_helper.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 063525cfc5..55b370294a 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -2416,9 +2416,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>               }
>               env->mstatus = set_field(env->mstatus, MSTATUS_MPV,
>                                        env->virt_enabled);
> -            if (env->virt_enabled && tval) {
> -                env->mstatus = set_field(env->mstatus, MSTATUS_GVA, 1);
> -            }
> +            env->mstatus = set_field(env->mstatus, MSTATUS_GVA, write_gva);
>   
>               mtval2 = env->guest_phys_fault_addr;
>   


