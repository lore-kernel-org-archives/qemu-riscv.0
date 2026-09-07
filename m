Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42E6C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:42:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3dLe-0001bG-HQ; Mon, 07 Sep 2026 13:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3dLb-0001at-8L
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:41:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3dLY-0004VM-F7
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:41:35 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 687HXIk9553103
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 17:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BGJF8a70pbTndm2hJWcCX6Lk5X5yOuDdFOoF0bgGyw4=; b=C12mzDb/WM2WhZqT
 9k1ZKJH3+ESOe3BQVUX377hElv7LCFYqm4o1gMoy8iPBlznwS5rs51HvFJcgkUPd
 R6FEzUvOWPZ/E4N/eWsw1z/q2QtWKbvLzRGZJjo+rloWBVJf7SZ7k2E6KtDKy6AG
 uK0S+vu94PmrmDvIibBl7tCptVx1LNEIcQ+w+36RDHmauxgfvBFdSuLurZgYl5jN
 BU8aGYx4X4YlZ/spYaH+kSJ7pqw25O57txIwvkkZzy0PnzdHi/tIh/SGJ74FqP0J
 tlCuNx4OeJDFhlft3Xfy81mqADIdXQfR/nF4xcKI65D+UrCQXaa3gXHA3OMB2DHu
 MRqN6g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwg140-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 17:41:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91049eac948so29828886d6.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 10:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788802890; x=1789407690; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BGJF8a70pbTndm2hJWcCX6Lk5X5yOuDdFOoF0bgGyw4=;
 b=B3MHEcGVppX818xzWL9R39Gf+DrJ+oPGt1Y7M81L/t2SkkaLSrW0PJmBx/Fwnk0I96
 2t8gnrxLtbAVijBQMQNLSz8MZx++xiWryolIrDR7bspFKstpm5MAcFm+z6rCXznkshLF
 UVngZd7DD2OiogdVOII1Qf0r3D52ZGvrzPHzINZpGxn992qluo1VgcU+nELDwo0ebbZ1
 IQGJ+WmiuvATJ9CAc7Cr/ULAwUoGzNZm+oglyLMmxAOeNwc8XToGXlEmcNn6MVFozbGC
 RbKEy3r6ggBlK2tr+XpOSrJ+UUIKCg23i7BG7zxHRc3oNt+/0RPYS+YCExI3syVnDwVo
 /3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788802890; x=1789407690;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BGJF8a70pbTndm2hJWcCX6Lk5X5yOuDdFOoF0bgGyw4=;
 b=XBk/Om+s2l9e1lomXiWdept0gX53fU7mahNRG7fCCxUvPE5wjl2lYjT4R664sehUIY
 EUkwrYWZBHULR7vMQIlWW838IK71dqbBEqKhO2RmVt7iJ3+SYUG8bG4sVw4lwZxi9HE/
 PvkTEocUKyLVsiiqFq2V0jjEU0gs6zy4Fg0h8/FnSbWGp7VsAV8WwJvlMg1utZh7Hkgr
 OPjFgemoIz5ghXGtRmDhj255QLOON9JTVyNDVVvPlEuxa7pHojVWI9tHkS4/RIHDPnAF
 QwDGglS6LmDk5zt8m8bJy2oqWlE4MIDpFd7qHa9upIk+Dj9u+grdaJnqAzJB3diUFzgl
 nA+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzXk1FJ0Wsut62ZjswwRQfjgrwQuLaKaOw4JkLE/1RBh67gb8XbbefE58aHWXJLyligNUDzIYS3aVny@nongnu.org
X-Gm-Message-State: AFuF++kB7D9CUXfKGUvGv1I6AoNXqeEBEM25Jky+Jp8zN85+v1p4MEMK
 ek02Q24SdWslsBBNEfMLI++2AN1dKXrV9ay7E8Dckmyy/c4q8g8KHjYhKafEmWOxy0LMjAvJvO3
 2g7jbsBtdWuzXSilXdnS43TFRjIW88wAP6UZ0QxFXbfXDxx8LAehZNGtQJw==
X-Gm-Gg: AYBFou2tz0umIp6BvcVj1OWeT8eiOWCehCH/CgrKqxTpSVdGjhrZly1iOlCkIWoZtk/
 aQK40kTXzoCCWjjBJHxANdpAIAvxVDRcpcVieeOEWETHiRretFwCgDXcHSdnpwHHeasaJfPL4WD
 ARHHDCFXZEIzrI53ntyLR7TNNZAHzRqHXaTHH0JlVsap3F3ae/V0E2dM08DlpK4yF60fYe+ORgZ
 Z4OyMpGS1WPa4U3OM4XNG7c2maWt8CVj31B7IV/hh7WXQLq2UHr7Lape9O2q20mWgcwgTSrFUSq
 iIdDWuM8a6ks6zgZZfEhahO48PA2Wba8zm9VZFMcRlW68BjWNRS+jW/rrjDK2yo5+0suYxedK07
 KMfgvwg8ZTx1nskDiBf+HZN1BVNLrz099yl0=
X-Received: by 2002:a05:6214:498b:b0:910:44be:42b8 with SMTP id
 6a1803df08f44-91044be43eemr269661916d6.6.1788802889882; 
 Mon, 07 Sep 2026 10:41:29 -0700 (PDT)
X-Received: by 2002:a05:6214:498b:b0:910:44be:42b8 with SMTP id
 6a1803df08f44-91044be43eemr269661236d6.6.1788802889398; 
 Mon, 07 Sep 2026 10:41:29 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040664be1sm96570276d6.18.2026.09.07.10.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 10:41:28 -0700 (PDT)
Message-ID: <41e26f5c-631d-43a8-8ef0-0fb4a26e2bed@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:41:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] target/riscv: prioritize Zicfilp checks for
 misaligned JALR
To: wangyang <wangyang25@otcaix.iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260905093749.491-1-wangyang25@otcaix.iscas.ac.cn>
 <20260905093749.491-5-wangyang25@otcaix.iscas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260905093749.491-5-wangyang25@otcaix.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9ef74a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=phMR9B-mS8p-AgJQbMwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE5NiBTYWx0ZWRfX9X9eduy+Gbt3
 gfSGU0vbNc2JHkvNh2UUalN9+BhFcHNWAZUmxgm8LfiYUWHR4sJx5Or7IO/yCp8/g/9QPLuC43J
 rQWLQOoj5Qkrz7mq9C5glG990Rxs56FhQhUxrbqi9Ey1kKcizYWnD8wnLRwHEhNE1j2jBpXSB8t
 3lnoRPBBA678Lgk1JoXcwBQ/CEZSN7c5eyXm3jAaYlS4/O285+rrUPOqfpG/IpGx1UYIs/UTw5H
 9k4JidLYtQVv0pVZ0Bk1UF+Z08jBgqC2n6FchJB9wRRHDUPygL03qxwYpop6ANFtLWNHfTPuS3/
 xCwfAplqd/mqDTFjkF9HmQDFEilBxFTNwBwe5Si+oBShAkwYs9cM+Aat5KqTuji/1cuBgiy+gJv
 uBCZzYs5LvgppSGSPYygvV7hZrpPQ2h32sQJmtG3ytaJ4SeZ2yhNA0r2aoG1P2mJ0umU8Vtlyte
 YxCejdcbSen7tdH41Mw==
X-Proofpoint-ORIG-GUID: DlpZ6Xm2teWZCytrk9LqM2FZftT6xSga
X-Proofpoint-GUID: DlpZ6Xm2teWZCytrk9LqM2FZftT6xSga
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE5NiBTYWx0ZWRfX/FY9zGcqZ2dm
 K+rO/SX/Yb7XpJzMW2wU3dLeTzq7IDga2NYTvjd0Plf//uz/t6mjs8x/+1D/jrkBfCaDbFHQIcL
 lSWbsAniXy2JpEtbYgORJP14xhgqUUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070196
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 9/5/2026 6:37 AM, wangyang wrote:
> When Zicfilp tracking is active, a misaligned indirect JALR target also
> violates the landing-pad requirement. Generate the landing-pad
> software-check before the generic instruction-address-misaligned
> exception for tracked targets, while retaining the existing exception
> for untracked targets.
> 
> Tested: RV64 M-mode and S-mode Zicfilp controls and misaligned
> targets with c=true and c=false.
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4415
> 
> Signed-off-by: wangyang <wangyang25@otcaix.iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/insn_trans/trans_rvi.c.inc | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> index cc1b5dbbad..aa79a5ef3c 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> @@ -187,7 +187,14 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>   
>       if (misaligned) {
>           gen_set_label(misaligned);
> -        gen_exception_inst_addr_mis(ctx, target_pc);
> +        if (ctx->fcfi_enabled &&
> +            a->rs1 != xRA && a->rs1 != xT0 && a->rs1 != xT2) {
> +            tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
> +                            tcg_env, offsetof(CPURISCVState, sw_check_code));
> +            generate_exception(ctx, RISCV_EXCP_SW_CHECK);
> +        } else {
> +            gen_exception_inst_addr_mis(ctx, target_pc);
> +        }
>       }
>       ctx->base.is_jmp = DISAS_NORETURN;
>   


