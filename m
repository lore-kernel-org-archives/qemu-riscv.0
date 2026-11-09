Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45385606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wj22tbJv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmvRlORY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVaw-0007Wb-79; Mon, 09 Nov 2026 15:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVau-0007W1-Ui
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:03:56 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVat-0004b0-3R
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:03:56 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HGwnC1865704
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ByQ8UyKnLfnRpawtxW3v535hjn03Gu+vdpl4miyG7bc=; b=Wj22tbJv3L+iUHXM
 ZrusBPDLB4aBQI7suKXEVDqha2U6/7u5THL/eExf0v2Nsfso/LVU3gDGLMusf7tI
 UQ0rzqYDXEVLdEELgqnUtx1C4WiQNJ3XtB2JSsMYw9iYdgpEImrZ6ROC9O6zwer0
 TM1tI6xVefcM3wZEd4Pdx/zY+D+XVUeN+TCw3XNx4GcQF3SAIOYB1+xJ2V451CUi
 oUcaCL+bi9TBRhF9ZGI15tJJrze/vdwDHPePYxdseVGAWRIwzc1ZKS7+K2LqxKPZ
 F5gywBkHyxnU8+wvqDMdmwBdhEIK7Xxpqu7uTqMM6i+ebSVeUOV4MhRz/cIk4z9K
 83kkgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qsq3e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:03:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-934963b2bc0so263795885a.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254632; x=1794859432; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ByQ8UyKnLfnRpawtxW3v535hjn03Gu+vdpl4miyG7bc=;
 b=CmvRlORYVGPrSKizltVowRwyjgfs+IltnV0YjHGdTw8a4+YYcRvghTLV+zhMp6fnBy
 jLW/JGQbGGoBdEeTH+7MhmPRBoTuJwGzBT/ocr35QMdELvnZuB+QWm/3PAIaxrfjt83R
 ZDuD/TqDM8P5PyYPqpUCiNIvZ+sl2vP3G2Us+Z93ju1ai2G+eYinHXkp4SlSxr5arzYZ
 ZQ0+nUmYq09pJLIFJRutq51rYZO0+D/N/sbxasC2v9YOqCSfeLX3tZ+69ewybXc8NkA/
 RliCnOV7WGESTVrvq2tE07cnLIyivHV/L+ZwmueYjUblBCthiGPwaK6/OpJCc7SpAF2k
 L+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254632; x=1794859432;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ByQ8UyKnLfnRpawtxW3v535hjn03Gu+vdpl4miyG7bc=;
 b=VbtHIc1tNi7GDFFVdOsqDrrS7I16KZVA1fYlZEE4/KkU+IZdBQWdOhblgCFgY2z3Ce
 S2Fp5eUvcFnbjyTeyY6O4ZEbKPhoTsbMysc+FvyQYjMdef0hW+UAwMSZEG/4O31YId7x
 WMpKVZvc6GHffw93JRbbrxAJSgMwJUt9ZZkkPkJK7apEGZHDdzVlcQokaid6lPSYGP5l
 SsIyfM7+YRgYQTT0V4rJej602+dy6SJLLq6hiTjUUZa2DOb2nZzeLIm3u7aisU8XBEs7
 GUROseqsHvjjHM+dVI6rQQ1YI7ogjZI5rK6TkOLBpB0bqdxwjvgh2x2s61Uhek6hGx9a
 LjDg==
X-Forwarded-Encrypted: i=1;
 AL+hErEbUgxVV973/LJtmQohPV/7W/nUxMfGxEdZXKtXYSva9c/iXczTApRaBl0TCofxYhk7dQOS7GWeV9HK@nongnu.org
X-Gm-Message-State: APuU4Z995I/uZMAveje4xxT/faOTtbOXewetOQk1TaaOf6HmH/J0XD4a
 zHZ9eDqwtR+BPaQ5XeSwlxX/Fjlry43C3aCSeIliXTQPaRUooBWd5G5qOqQjO2Je5Rn6RKJL3Zi
 MltL/wsgZSOGf6G4FlMiWjBiC0JH694G5FzYCea2Q/gh+FpN60/6mCvCuNg==
X-Gm-Gg: AYBFou1le9oyoAUsP6E6Hhd9FW2DvHFw+FyrkYtSKSicAMMW6SyFGa+E+uU9urdza7d
 x1danb8MIbSRPe+ohSLs/dYliUa1uomVDBngCcGBDkgv+qrQIByPRSfM/scQfc7OmGeVm8ViQ80
 zoDz7+PMA7l7x81e0DJ77Zym6fzxfUtChqye/3aqzsTNvbwq0ayflDC288yRDlRd5csAqR6ld+1
 O5tpvV4am4XT/3hTvTn56r/n8cUzrMJr+Lh81mINd533MAT8sKrcru/T9MLEmXTn+1oaVXCeo61
 XLr8XFseCapn0yo7Arkm5vDv0Y4B/k0TgiDWuOp/qlIj1FDN8gI+lfBUGjYCHWkLhzuiz7iuPWz
 9B81KDj1FXGpTDSFYcUjVMehUBoXwKW1NrPuzz/9XhWNfgGfABY2tbpQ+/YkHhhA03dz1d14E1H
 yCtNR46hb8
X-Received: by 2002:a05:620a:1d0b:b0:93f:6375:aaa0 with SMTP id
 af79cd13be357-9479f394e07mr80695185a.80.1794254632217; 
 Mon, 09 Nov 2026 12:03:52 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:93f:6375:aaa0 with SMTP id
 af79cd13be357-9479f394e07mr80690785a.80.1794254631665; 
 Mon, 09 Nov 2026 12:03:51 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e61c150sm55728585a.2.2026.11.09.12.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:03:51 -0800 (PST)
Message-ID: <6bbe820e-32f7-46c8-b7c0-197a61d24fda@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:03:47 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/38] target/riscv: Add cfg property for Zvfwdota16bf
 extension
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
 <20261104194155.679241-12-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-12-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OSBTYWx0ZWRfX6RtdOzgdZFN9
 UMqTDQ76/9tNdZBsa1zmGywmhCMIQ2MmSF7v4bIw0MhpJxceW3YEJEaW2J5dpASUad2fhZXBISM
 UBcr2ZHQ3FQmmizHHn3PaxzmVTshjS//baxNXFIRNVkYg66SKCB1vOGXPW6ckPaZ6kvQs0YpmA6
 LqYp3u9k3qD0JHup0IM/0vFW66IgL0YIrMg4HQgXp38+YYfz8iQzQ2Z0LQih8cZdCQDZDuYHMVx
 1RZ85kVqaDCFud7bmHnGm3XZNL8qNd3O8yQCgZ0MNLeev+k5gMZyBUAT/V8sMnKG1m+as2KT7oG
 mXES405zC+FRrUROmelr1LJn/Sn9VZoc7fnUH8kx7FlbcZFmmAGVLi/d857qJUQv6TN+m3dPxZX
 RIhhApQqElpjE8llQNyUvJoRxuhRlVKvltH4CWAEc22RmRtzpT8UhzqaS+r0bfgr/j8iiShX/DW
 HRpc1fIR7IRthfFYDkw==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af22729 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=cyZchcy-x6cUBInBKMkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: WtHbQKS49HEPMMhiLYP2615Vp0o-5AJd
X-Proofpoint-ORIG-GUID: WtHbQKS49HEPMMhiLYP2615Vp0o-5AJd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OSBTYWx0ZWRfX3k9oDjpNoiBg
 GVJ60H94i50J5WEB70PQ7GKdK6iopZFzz68AkgSqxozoWjyeG9/l9SeuKy9ziItwd810uqUTz++
 aVCOMoBDVZbnd41Cj/QXMlDuYqI4Mwc=
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add CPU configuration property of Zvfwdota16bf extension which depends on
> the Zve32f extension per the specification.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c                | 2 ++
>   target/riscv/cpu_cfg_fields.h.inc | 1 +
>   target/riscv/tcg/tcg-cpu.c        | 5 +++++
>   target/riscv/tcg/vector_helper.c  | 2 ++
>   4 files changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ae859128d30..d6e2b07c401 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -236,6 +236,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
>       ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
>       ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
> +    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfwdota16bf, PRIV_VERSION_1_13_0,
> +                                    ext_zvfwdota16bf),
>       ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
>       ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
>       ISA_EXT_DATA_ENTRY(zvkn, PRIV_VERSION_1_12_0, ext_zvkn),
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 8bac69a17f7..30c404863c8 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -106,6 +106,7 @@ BOOL_FIELD(ext_zvfbfmin)
>   BOOL_FIELD(ext_zvfbfwma)
>   BOOL_FIELD(ext_zvfh)
>   BOOL_FIELD(ext_zvfhmin)
> +BOOL_FIELD(ext_zvfwdota16bf)
>   BOOL_FIELD(ext_zvqwdota16i)
>   BOOL_FIELD(ext_zvqwdota8i)
>   BOOL_FIELD(ext_sdext)
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 54749125acf..91e009072e6 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -701,6 +701,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_zvfwdota16bf && !cpu->cfg.ext_zve32f) {
> +        error_setg(errp, "Zvfwdota16bf extension depends on Zve32f extension");
> +        return;
> +    }
> +
>       if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
>           error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
>           return;
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index 57a381098f6..41b526d25ef 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -40,6 +40,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
>       target_ulong reserved = 0;
>   
>       if (riscv_cpu_cfg(env)->ext_zvfbfa ||
> +        riscv_cpu_cfg(env)->ext_zvfwdota16bf ||
>           riscv_cpu_cfg(env)->ext_zvqwdota16i ||
>           riscv_cpu_cfg(env)->ext_zvqwdota8i) {
>           reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
> @@ -95,6 +96,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>           break;
>       case MO_16:
>           ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
> +                        cpu->cfg.ext_zvfwdota16bf ||
>                           cpu->cfg.ext_zvqwdota16i);
>           break;
>       default:


