Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA249606A330
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dlAwOeqQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huO5AJfe
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVbH-00083Z-Oy; Mon, 09 Nov 2026 15:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVbG-00082B-Aw
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:04:18 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVbE-0004d1-GU
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:04:18 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HGwCJ1865707
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1zo3Gvzvz9Rey7froWrdXvDVwGBJloHLQ3iYmQTeerk=; b=dlAwOeqQPdc015nG
 +FcQXk4Xu80t4Pe4ZTfOzq68dI9pnV8i58/TmFDdVDUVMG+kSYu0/DIDzC8xb+df
 gRBhhmI5aYrdBnJwnrf5ONWcH+TqWS0DleawQZD/nbp+Nbqj+3X5hfUHTALPn8sf
 0uIpTwGQbvmDC5ke9seHJ6KKvf9jbBULEa90MZOi6X5lAeRYPmgbOsKkDUAE5B9j
 JWYZe7sMQU9abU8ixr3Avispdon2iegeF19gWGbvwBXaWeS7kr1XcKc4sYTfk34t
 yDIOXPKoy3M1mLScSONjU9IMjATXxhqKUICzILtQ7IJ6WBZPJEGke0h5K7crJ7FN
 vAFnoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qsq4b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:04:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-534f3fe0236so28586711cf.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254654; x=1794859454; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1zo3Gvzvz9Rey7froWrdXvDVwGBJloHLQ3iYmQTeerk=;
 b=huO5AJfe3+XTdKlEqARagTmwuZQvc2JZkjwXkpHflFRY10kNjy/HEPL53r4/Eqzs4b
 zsCkcqwdQ8fc5qLA4JANjsqh+QaM75D2Ac6N6Md3KazSLiBBfLpJUHhFxWYfd8+4kZD0
 C4EIa7yZR7rB1GImqwRqf41vv2IzRZrrhNt2PwN2M0jkMzUjdNu1eQbbASL2UL1vZZTd
 gxFkoeITKs5Fzmc2kxgEzClw+W3ptDmc5oA+Luyt54mLEd+F/rjY/r57Yhk4KKOjfg6k
 8nLag8XJF/bJ6Rj+P0xiPNQE/4C6BdiJE14Om4+aJZ3k/7yHJLysRFreA4y9z3mU+//f
 Wx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254654; x=1794859454;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1zo3Gvzvz9Rey7froWrdXvDVwGBJloHLQ3iYmQTeerk=;
 b=m9vKLA1RgFtwzoNaL2Qvucm87fqPQ8aNSOpbgxUZ+kRHXgA6eqSISq5HXwJWks785B
 CFk4/acg61mAjswTKjCBdh0IdxY4cBA6WnocvVjBO8li3T4IP7SPPXf5+U83c0WC2e3D
 hVoRvq4YisSCs2f9FBT0cJ9IdRMv9PEbTX5n1NBgWqOMhh5IOq+ANzDvlwVWFxBvBo4p
 Ulf+Xfb5w5Tnyo+LbpffS/lbDF/d4RoBOXHI8V3YoXfGuqwwpzhCQ2ouFzDRGrDj47MA
 VMcUE4C1irPNqCIKAelXJ7vdIOKNCjadd+YHkJm7cHwE2zYwzAS7Kzy3EPRTZ2lKr3G8
 g0oQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHCyQxbnCqLmfkpfUm12nRDJiovFJkTFt2HRAa6jd7/8MKy6RZ08gGrZosL4yriNGUWFmh+MLxjvdoZ@nongnu.org
X-Gm-Message-State: APuU4Z+imCxlu9enu6AishK7NhJl0JFve7w5UNDnHYRhP7EpwBoFvvzG
 xPndPgoavu3lnX1421cCaKMMm1tNZMfP+cACgvtJHGbA/nH7mfrVTXK9AHGE77fBa3yerijA1p6
 XfGq9mjk4pBCQvYHBKsb/02717t1yJ6qvmtJ2d/05HJyHxB36oVztIHOmyg==
X-Gm-Gg: AYBFou2L2Rqj2BceoIza6BAc5tv5sh2IVpv8gay/OumuJS3Tf3fQfpLJu4/hvr/EndO
 cSaiAwfeRBheMhXFUpMLda3XR8fmOELE3371yIHTUI7XJ7mU8TAl1sBFhMmHzeiDJ9msAV16kFc
 TflxNHFS+5d9svEDBr2Q1NTrOP2/L8qW2gbW0rluItIfxiu2nxlIFPoqP7gcYw+tnIScoACBQf0
 tw+w6Cf+omWSy+wRWvd6AQS8GoubwIwC40tTu5BIf3+F9VYq3Yxn5Y7v3+HFN+5ZYd9eeJv0T2l
 AyOfJX+xX5BeHsK0AfGWjbmOsHXCdR94IS/MZC8+hPF8OjYmE51JlhrhQAKHpaGXYzw4ETCDrrE
 JJYiILSVo5Dby5x8mOU/xHZC/AU4ei2sEltFJClSErPch60u5r86jLVAq/593GO7uy9Zl4GPS4w
 mogTYWlXCM
X-Received: by 2002:a05:622a:5e0d:b0:536:719d:7974 with SMTP id
 d75a77b69052e-555283f3c18mr6632751cf.55.1794254653816; 
 Mon, 09 Nov 2026 12:04:13 -0800 (PST)
X-Received: by 2002:a05:622a:5e0d:b0:536:719d:7974 with SMTP id
 d75a77b69052e-555283f3c18mr6632381cf.55.1794254653405; 
 Mon, 09 Nov 2026 12:04:13 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550be2e22esm5315721cf.23.2026.11.09.12.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:04:12 -0800 (PST)
Message-ID: <1bdbf80b-670d-4c65-a5b3-1105f50bcdca@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:04:09 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/38] target/riscv: Add implied rules for
 Zvfwdota16bf extension
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-13-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-13-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OSBTYWx0ZWRfX9bI8sYx2ST47
 f8RqUxyWML3fUkKns9y8ZYUClKUPEh9b1qgkmoPnQEqmXgNnY0s1aB+FaeCu/MRtflaa1L/v4NE
 l5A3W/oJFx51kvSJne8s6M4NkWEYYHv2/0abwsEyoH5ZhPr1MuCwyNkUN6Y0lnTG7hf8B2HUT5K
 5xcG9fOovhZBatedPMefr48LBM8ehyMuAAmwRrYcvZbbhYVE5cddhRemo3iEVLiYckiQ2rVrIPg
 5jNkyY69lm5phPsb8OLHWGedtNQm2QqDk/nhByEN0LkIEGAeiB+jaVrGjqZczf+NohMY8X8c48W
 x0QClYiwmd8c4v8NTK1zT5KIK8Hi6ffP/H5RTVAYrAKdzytlQRLC8E8rgZL8XHTr4V+i8XYhltL
 xmicMZZobvLRDKgfBQziYCL+jn38MjuFuXIOC0nuZlGzLutr2+AT4rkC/TBw4eK+E2aaUg+Nmlr
 SwX8yIcWJ7LsdnONhTQ==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af2273e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=CoVnzymCHC7Sdcki2SQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: se6fL6FMCPGM6Z3H3axIzQYsd9hZX7iT
X-Proofpoint-ORIG-GUID: se6fL6FMCPGM6Z3H3axIzQYsd9hZX7iT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OSBTYWx0ZWRfX6B2AZ5zBFc+d
 2K2hIAI2P8GWQ/BwB8CU0XPzJL/5bbGJTE7tDBX2BpEZ7gDTehVz1cVQ7Gj7+vu445mydC1W6To
 9s6FCTTmAbHujtoZuzT/xe1GFBEZBBY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090079
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



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add implied rules to enable the implied extensions of Zvfwdota16bf
> extension recursively.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d6e2b07c401..2d905a99d68 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2873,6 +2873,15 @@ static RISCVCPUImpliedExtsRule ZVQWDOTA8I_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVFWDOTA16BF_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvfwdota16bf),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve32f),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   static RISCVCPUImpliedExtsRule ZVKN_IMPLIED = {
>       .ext = CPU_CFG_OFFSET(ext_zvkn),
>       .implied_multi_exts = {
> @@ -3070,6 +3079,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVFBFWMA_IMPLIED,
>       &ZVFH_IMPLIED,
>       &ZVFHMIN_IMPLIED,
> +    &ZVFWDOTA16BF_IMPLIED,
>       &ZVKN_IMPLIED,
>       &ZVKNC_IMPLIED,
>       &ZVKNG_IMPLIED,


