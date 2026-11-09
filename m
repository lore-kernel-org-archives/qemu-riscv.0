Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D8660A2638
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 19:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YpKY6nqU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeeFYxiC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVQp-0000rb-O8; Mon, 09 Nov 2026 14:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVQn-0000qx-PN
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:53:29 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVQl-0003YT-3F
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:53:29 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HH4tb846130
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 19:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zuhZXa3YEjBQ0lGDqmRitdcnjeYDmHa6ZhKZeBX7ojY=; b=YpKY6nqUgNHDNZf0
 HHPBJ1oSZX0ewyriffzQbB+FPy6Zlvhxyx2faH5d+lurqtDfdggRLjIVeITeEWpB
 uk9kv27gENRhHNlAuQtT8t8an8Bjgn0qtINiC1ARumtnjcweT+W1Q7fr3yZVyJym
 fptie4ZN0X7QcdxlVUQC4hFZDJoMfTNFhN54CuRdx6KOrKpiR0X8TDMyVp7wBmnx
 vbvkYR6kT2PmE8UzBw0ozCJ2PqqJKtut+rz+24REb855ptCQg1eW6CYjVLb/wQS3
 y/hL0WpeqpTpZG4wR0dQ0eOgBIvkAS3jPV+XT8O3cwGZltYjy3QJDf9wyonF6JX9
 28pbsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapa170-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 19:53:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-532f343a55bso23168631cf.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 11:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254003; x=1794858803; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zuhZXa3YEjBQ0lGDqmRitdcnjeYDmHa6ZhKZeBX7ojY=;
 b=jeeFYxiCk9LdmXIyXN5XWGIQJ9Ag74inPn0tHy/RiA131rexhx/Db1DiFYILQBSc+B
 8l3ePa6s0ltLjfBg4pksh4Cc3fqmCMOODbjUE41rSOLvA5SrBsx4/7eZr/ruBI86w/xU
 Jb37jycEbIpnipv1P6cDdYpHPRsgKWgXrUuGOHfsxmjBBWUq9IlvxwZoM8u7v9AnmDQs
 mecv1T7Nspw0xrrWslzOo2ItaykMHejd6Saq1wqINjZWHpRSGlNteA7ITaMcdB/bAcKZ
 KOU45W3BjXwwvgI9ze7eHmKpKETpDxQ6VsNdPGkDtRVSXUKAtEUM2ehTF4X/jsu1Scar
 2DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254003; x=1794858803;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zuhZXa3YEjBQ0lGDqmRitdcnjeYDmHa6ZhKZeBX7ojY=;
 b=Y/cj1c8ExToHoYjyv+PrTDZHKUMKGfBVrhiBmzkrBcnqGcKQwTsrO4W431TydUWaL6
 9BwszRHEEdTzlqveMS5aFoPB8kpT/2l2z/jWJ6pnbeX2swKQvQPiz6bPSM9JX4yy+WW/
 7WNwG3uEaDKra0mMwMCNZD9zj+pcb91eb6FDqQXuhiPZKh9bTQ9Qce1B6coh4EC87uob
 A7SALfNXF/f1UHSyn/fzYIo9ht89brl7JGv3iut34cKUKWYvojZhnqQgfkl7yVVmilCK
 FP7M8y6HxIMZNld6mbFUxsXleCr2QFtaETNH1g1LgSmsnpm5xZ6qQBOtBpLHZRKaBxlc
 ehOw==
X-Forwarded-Encrypted: i=1;
 AL+hErFY/3Ed/iYRgklAmnUKZCZOsD3zQqST7EopeKlxqHc/CbEsQ7rOoniGDl85p4SLeTfTMEpZranWZXIr@nongnu.org
X-Gm-Message-State: APuU4Z891hbq/Sp8wr0s60DONx/dtBzuE9NbLXc8EUFzFIMt5LLTWfab
 YCLt9yOhKIZBtQai0dlJdLLv3AyorMNzKo4KKjL+t2XJldwhHGZNIkKTc9V99Lndz8Xk1TaC1J1
 FprPQdFu8Hr0QCEQfvsHPekh5E32/6scc25ejNpjePn0LSj8JQ/8LaVC3Wg==
X-Gm-Gg: AYBFou3IiKbcf9pmroxuR8RX2hjc/SCWK+S1prJabRbfHE+vTrDDaVdqynKoURvq46m
 4oBZVTzr3wC0cCHFVvi/FLGWkt8xnUT5vwHLwP5kaK6Ucg2Glb6B8H3+AOAvmU9CB8P1t6jbkyy
 IoJ27vUQ9OY8CjS2lBN+I3zw1/94qeeyGvgesy/r69XVbcTRaf0aTK/VPmbqKe8FYX86/nafM0L
 XjFVjYBePAt5GjF8pVRsE4xYVttxSo9IGGzxPfhUxUWTKjwB4QqWDELzvfLSiDlrPkQi6Qp5EM9
 aXIXlxO77ubVY3oGCj/uYb5U38NQ9gotJ4YqvbM2mtV4STIAAf1BBY558KHLCrG1RXpBufTYIwl
 pHHJ9PNArx3kd4a6CIZ2ve+LzqY2Fgzb2e1mqlRe4gtoy+plYXRgHujiim8DHxU5qXgYw9+hvuD
 XWXrNs2jf1
X-Received: by 2002:a05:622a:1f8c:b0:536:4482:2c5d with SMTP id
 d75a77b69052e-555292bb79dmr5973501cf.19.1794254003267; 
 Mon, 09 Nov 2026 11:53:23 -0800 (PST)
X-Received: by 2002:a05:622a:1f8c:b0:536:4482:2c5d with SMTP id
 d75a77b69052e-555292bb79dmr5973091cf.19.1794254002606; 
 Mon, 09 Nov 2026 11:53:22 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-555091eb801sm5435591cf.2.2026.11.09.11.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 11:53:22 -0800 (PST)
Message-ID: <090e835e-ae47-46e3-b8e6-8639bd9db920@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:53:18 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/38] fpu/softfloat: Support OCP(Open Compute
 Project) OFP8 checking functions
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
 <20261104194155.679241-2-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-2-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfXw/m0h/fDmls7
 WeTjSjWnnLzvdLqNgt6E81gZXPoZRXhHf+ak5f/C/bxt4/G2QcdUloeUk204YE1Z5BFVPOkMwhh
 EDGh5QRNbMrgNzNWvjx8HMWYIlWLpo8aYTWugLXajFz2mYchn8p+tT3rZ61QSrBblKBBrTFH7n0
 yQGC8npyvXJqVVfcAPK80CmV0RX6j9V2Rd2RZrKbzi3xidz12kTfRnUESd4bW4r71ewoSnAexRI
 kGCrWD7TOu+GGEMSbdPCdzgws//GX8Baas6LqUsgc7J8FPnvJ1Si1dK0Hkpz8p32R8WtbSRJlK/
 35rXrlWdX40FkAvldyvbPzGoe6clKWG1R6Vtg+rlZw0AptvBpkmmjVcE+PQuHtgDVOx4snNQ57l
 M/o+1Tw4CeGxWCex9GthiKNIzv/LKdyTknpgmxczjuvt+XyMMJWPpBBEahsKzWH8vmkHv8sjbfU
 Bfyqy9BsbfnPdkAdirQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX5Eu9/79Btwog
 2AhFolqo8qShwFfTZFxu8wL0YGrli6sZbtxahpoMoCnZ8ouICvqtJvw7J/amd05wwuhZEvvfkX7
 1o5ILfSdJ3Z+punxrX7DiciaOhE3s50=
X-Proofpoint-ORIG-GUID: RpA9T2BF2JQocTxRFaua_ppABD6mkvOv
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af224b4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=FVchq9tdzEtsCYCC46gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: RpA9T2BF2JQocTxRFaua_ppABD6mkvOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090078
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



On 11/4/2026 4:41 PM, Max Chou wrote:
> Include following checking functions liked other fp types:

typo: s/liked/like

> - *_nan_is_snan
> - *_is_quiet_nan
> - *_is_signaling_nan
> - *_is_any_nan
> - *_is_neg
> - *_is_infinity
> - *_is_zero
> - *_is_zero_or_denormal
> - *_is_normal
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   fpu/softfloat-specialize.c.inc | 55 ++++++++++++++++++++++++++
>   include/fpu/softfloat.h        | 70 ++++++++++++++++++++++++++++++++++
>   2 files changed, 125 insertions(+)
> 
> diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
> index 8b765ef623f..22a3188f99b 100644
> --- a/fpu/softfloat-specialize.c.inc
> +++ b/fpu/softfloat-specialize.c.inc
> @@ -255,6 +255,61 @@ floatx80 floatx80_default_inf(bool zSign, float_status *status)
>       return packFloatx80(zSign, 0x7fff, z ? 0 : (1ULL << 63));
>   }
>   
> +/*----------------------------------------------------------------------------
> +| Determine if a OCP FP8 E4M3 NaN is signaling NaN.
> +| E4M3 has only one NaN encoding, so classification is policy-based.
> +*----------------------------------------------------------------------------*/
> +
> +static bool float8_e4m3_nan_is_snan(float8_e4m3 a, float_status *status)
> +{
> +    return get_float_e4m3_nan_is_snan(status);
> +}
> +
> +/*----------------------------------------------------------------------------
> +| Returns 1 if the OCP FP8 E4M3 value `a' is a quiet NaN; otherwise returns 0.
> +*----------------------------------------------------------------------------*/
> +
> +bool float8_e4m3_is_quiet_nan(float8_e4m3 a_, float_status *status)
> +{
> +    return float8_e4m3_is_any_nan(a_) && !float8_e4m3_nan_is_snan(a_, status);
> +}
> +
> +/*----------------------------------------------------------------------------
> +| Returns 1 if the OCP FP8 E4M3 value `a' is a signaling NaN; otherwise 0.
> +*----------------------------------------------------------------------------*/
> +
> +bool float8_e4m3_is_signaling_nan(float8_e4m3 a_, float_status *status)
> +{
> +    return float8_e4m3_is_any_nan(a_) && float8_e4m3_nan_is_snan(a_, status);
> +}
> +
> +/*----------------------------------------------------------------------------
> +| Determine if a OCP FP8 E5M2 NaN is signaling NaN.
> +*----------------------------------------------------------------------------*/
> +
> +static bool float8_e5m2_nan_is_snan(float8_e5m2 a, float_status *status)
> +{
> +    return frac_msb_is_snan((a >> 1) & 1, status);
> +}
> +
> +/*----------------------------------------------------------------------------
> +| Returns 1 if the OCP FP8 E5M2 value `a' is a quiet NaN; otherwise returns 0.
> +*----------------------------------------------------------------------------*/
> +
> +bool float8_e5m2_is_quiet_nan(float8_e5m2 a_, float_status *status)
> +{
> +    return float8_e5m2_is_any_nan(a_) && !float8_e5m2_nan_is_snan(a_, status);
> +}
> +
> +/*----------------------------------------------------------------------------
> +| Returns 1 if the OCP FP8 E5M2 value `a' is a signaling NaN; otherwise 0.
> +*----------------------------------------------------------------------------*/
> +
> +bool float8_e5m2_is_signaling_nan(float8_e5m2 a_, float_status *status)
> +{
> +    return float8_e5m2_is_any_nan(a_) && float8_e5m2_nan_is_snan(a_, status);
> +}
> +
>   /*----------------------------------------------------------------------------
>   | Determine if a float16 NaN is signaling NaN.
>   *----------------------------------------------------------------------------*/
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
> index d48fc6b0437..4d91599e25d 100644
> --- a/include/fpu/softfloat.h
> +++ b/include/fpu/softfloat.h
> @@ -222,6 +222,76 @@ bfloat16 float8_e5m2_to_bfloat16(float8_e5m2, float_status *status);
>   float8_e5m2 bfloat16_to_float8_e5m2(bfloat16, bool sat, float_status *status);
>   float8_e5m2 float32_to_float8_e5m2(float32, bool sat, float_status *status);
>   
> +/*----------------------------------------------------------------------------
> +| OCP FP{4,8} classify operations.
> +*----------------------------------------------------------------------------*/
> +
> +bool float8_e4m3_is_quiet_nan(float8_e4m3, float_status *status);
> +bool float8_e4m3_is_signaling_nan(float8_e4m3, float_status *status);
> +bool float8_e5m2_is_quiet_nan(float8_e5m2, float_status *status);
> +bool float8_e5m2_is_signaling_nan(float8_e5m2, float_status *status);
> +
> +static inline bool float8_e4m3_is_any_nan(float8_e4m3 a)
> +{
> +    return ((a & ~0x80) == 0x7f);
> +}
> +
> +static inline bool float8_e5m2_is_any_nan(float8_e5m2 a)
> +{
> +    return ((a & ~0x80) > 0x7c);
> +}
> +
> +static inline bool float8_e4m3_is_neg(float8_e4m3 a)
> +{
> +    return a >> 7;
> +}
> +
> +static inline bool float8_e5m2_is_neg(float8_e5m2 a)
> +{
> +    return a >> 7;
> +}
> +
> +static inline bool float8_e4m3_is_infinity(float8_e4m3 a)
> +{
> +    return false;
> +}
> +
> +static inline bool float8_e5m2_is_infinity(float8_e5m2 a)
> +{
> +    return (a & 0x7f) == 0x7c;
> +}
> +
> +static inline bool float8_e4m3_is_zero(float8_e4m3 a)
> +{
> +    return (a & 0x7f) == 0;
> +}
> +
> +static inline bool float8_e5m2_is_zero(float8_e5m2 a)
> +{
> +    return (a & 0x7f) == 0;
> +}
> +
> +static inline bool float8_e4m3_is_zero_or_denormal(float8_e4m3 a)
> +{
> +    return (a & 0x78) == 0;
> +}
> +
> +static inline bool float8_e5m2_is_zero_or_denormal(float8_e5m2 a)
> +{
> +    return (a & 0x7c) == 0;
> +}
> +
> +static inline bool float8_e4m3_is_normal(float8_e4m3 a)
> +{
> +    uint8_t em = a & 0x7f;
> +    return em >= 0x8 && em <= 0x7e;
> +}
> +
> +static inline bool float8_e5m2_is_normal(float8_e5m2 a)
> +{
> +    return (((a >> 2) + 1) & 0x1f) >= 2;
> +}
> +
>   /*----------------------------------------------------------------------------
>   | Software half-precision conversion routines.
>   *----------------------------------------------------------------------------*/


