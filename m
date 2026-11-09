Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5160A2601
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTQUpej0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Msi5bAZh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVUU-0002Qm-Gs; Mon, 09 Nov 2026 14:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVU9-0002JT-RW
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:57:04 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVU6-0003vM-PQ
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:56:57 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHHUq4001658
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 19:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hB2uILwlIfhAgLGWgsF46CoVXLx8/88jFlsXBTkMwow=; b=ZTQUpej0zhqaVqoK
 iAXlO6QUeUpBmev/CxNTQ7d1dYqYCsVF/4i0SJ2PDo58/SXReUIy0Qyn7mQUTnjJ
 MZFfAe+0+moOEN2tc5adBh6z5/kGMddF38OJjdWntniNvtLBl0g+w0Iy0+4LCzWW
 dstgI8XL0NT8L9U/C9uyATbjYiGo4047WsysbiB31CazVDSj5JOYVqjH0NM946lY
 PckqCQQsOJ7Vz+BoO5X36JzVFRk5kGbnR+8rPqRsmof4bHZPdJ+S59npvy055UaC
 bXaaYkglCfKG/FmKvwQJj3S7iIzJtlQtWXawKmuBsgyS5rqRmj5D1z+QbTnhsDBj
 Sqvh8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rssck-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 19:56:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c046843f1so32211536d6.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 11:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254212; x=1794859012; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hB2uILwlIfhAgLGWgsF46CoVXLx8/88jFlsXBTkMwow=;
 b=Msi5bAZhy7hHUetMu98LNqTjFAd3jdnFoXFrhjOLw9m9JKydUqWBLPGS4rOYzow3Zi
 cAWchuJaWbzUVsPoUvGHYSeTmNd+PFn9znudYmAltqlfolXAVzwNkFvwyiSCL866hbA5
 Sa6VW22KByjaZuU4Z56hpIAem19F/yecfyzgeAxJV8j8Ni8FxwlyjNWnPd0yxCoMT/Xz
 AvH6OoptIEk5vHvIA2ZtJL8HAxkPW6xY+dWKk8bzKaugLOiEr318KuPOXHbL8gz7yhYO
 zasMYRL45CdRoTgalsETqa8l4nHvtZSdFQ2JOd1mLj3hWi0zWrsR3rewInvsbIQcR50H
 fKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254212; x=1794859012;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hB2uILwlIfhAgLGWgsF46CoVXLx8/88jFlsXBTkMwow=;
 b=TildJWF6MMUYfEscqsakmr2/0ohMMGgS7BabOGMxlIAnb0pLJ9U8yFz7B9yOhxbRQa
 wioh3vNWC5XHOgpfs46/S0Wk5G84JXZkRlemTSD5adflX/oIyM8qct9N3dALfGwcc+gC
 es60l+r54Hiqp0009juEAQXuLOnnPc2AhwwgSMMOCuVbM7ThSBXu7dJlc+WGAnZNcjdU
 RwUjDu0ZnZiOM/1dVEHCTyPjGkiBBLZW4UFNLARk6Dcb9hKpQHhovzqTvVQyZjbJcVOo
 Gr9clAz5IfkvjotgL6QxToew+6zI1BEc/v5nRiT2+pXVY4fLswJTbHWe3UPQ5TcNfK4n
 aGgw==
X-Forwarded-Encrypted: i=1;
 AL+hErFFoj7HZXZKTp2nFlylZYe09QiTv9Z68nirmXg8AByIZeZwoIj412hKZN6gn21AKaZtXZEZRVVaTU4O@nongnu.org
X-Gm-Message-State: APuU4Z+unUjTnS9ywgPa2wj0ZU4NzTusZZWHoZGrXShlBNSPqRK9lKNH
 uXhEUpcdog/zRhT5UyLTJ+PXScMXH06aYqKWwpMSw5WemChVbKogdMLsJ1DcgpoCbem3S9fv0J9
 Tz0YeIEnkfcgPiwV+lppgkeCkXbpNzwb4ls7B+Zozt2nWbNypxA3fhHVe2h1Xj6Jh+A==
X-Gm-Gg: AYBFou2ypxxMY2DZjEWVzT4WrT8YfJotFAlMBDGcOo3KAX1RG6JpKxLRcUgPYDYv9p0
 84InF7Pi5+lOX9WnKRbFT/FS0wdBcpsw//p6N6HxqYukttZYD0AG2MJbBoL2t6bmch58b5r0QfW
 7gog09XU0sXLgXTASFoEMyr8DS1sYOVLqbQnAQJG4YaPYbBZkMlcSIbOnArnO6lbzKcuHHIPQWt
 t88k/jKKOzERfeRUK1U/v8Werwwpo6Q/dQSiybv6aJNMqzM5de8i+W/rClTLZgW59vVgoklmT39
 c1KH6jVkM6SaoESbqvUGGeskkDjrC0+DGQcG1Pwf9TQJyeuAmlDC5Wmyi9JNji+SqmtXT4wKGjF
 fZlvXNgWifHBx8G5gvoSF5MF0gSAB2LNr6Gqu8e9z54u0S7qYlJaEnGvVheyIpN+wyS1e12cuf9
 QkelL6iLgO
X-Received: by 2002:a05:620a:178d:b0:93f:3795:e8ca with SMTP id
 af79cd13be357-9479f31bf64mr94982685a.21.1794254212522; 
 Mon, 09 Nov 2026 11:56:52 -0800 (PST)
X-Received: by 2002:a05:620a:178d:b0:93f:3795:e8ca with SMTP id
 af79cd13be357-9479f31bf64mr94979285a.21.1794254212077; 
 Mon, 09 Nov 2026 11:56:52 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef051dc5esm3656006d6.34.2026.11.09.11.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 11:56:51 -0800 (PST)
Message-ID: <e9cc6744-d005-480a-a778-23d2549ec2f0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:56:48 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/38] target/riscv: Add cfg property for Zvqwdota8i
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
 <20261104194155.679241-5-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-5-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AL00T-s1ynOKgd6hmnpaCICzNgOdCRTR
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af22585 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=59soux2idswOs06-gvkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX8536/dYpw8bH
 sLSDR+cFX6S7k3BuOxvsoApWxvhwyIJD2UdS1N9Hwd6gfZihIjvUnOmfsTVsLt81hPt7hB6swhk
 ud2UpoPEBVjuGl9hJJBP5A//dmJ1GoWP4Z8R1qdt0MJa3sL5OLYRfMNaQaf4kMj6gM57JgeqBQx
 +mUEmDOVTa8Jhmx4AqbD/NTxkSsjamCigFtUXTAOAoOFsKPtHnV5DGbJahrWAdq4gUDCDDSP4GZ
 /olqynqcRgcstAzsi6K8DpCSwO8R/bmstQZX/Yd3ikENKyzUE5F4g5UeyhLCL53796rFLvaDEpv
 2LxW5obkKe4WU8bYK7lwxlUQDvdlOfUwOfiK8A/rAu8D1sZM8k4Bn74d/p3G/kEEP1CTwNNk+JD
 vvkpKVSoY7X9lzWJgwem3SMBsZqoT/yyzWeqg5kNuGkqE8jGS1rg7U6YxTH3K8n4E2ZPAd1xgtM
 eIj73NsSiS3N1eqM+RQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX3zn2MCGIMS1e
 jCWRtZRFtk1Q1aZP6V76UD9lwtJHScJH/Ccna/OoRfoTqUFRecX85iMd0Xfcx9ez+pZfWOLa7ce
 eOO95RdQvWk1aTag43tHp+4ua9uPnaE=
X-Proofpoint-ORIG-GUID: AL00T-s1ynOKgd6hmnpaCICzNgOdCRTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090078
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add CPU configuration for the Zvqwdota8i extension which depends on the
> Zve32x extension per the specification.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c                | 2 ++
>   target/riscv/cpu_cfg_fields.h.inc | 1 +
>   target/riscv/tcg/tcg-cpu.c        | 5 +++++
>   target/riscv/tcg/vector_helper.c  | 6 ++++--
>   4 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 53ecce8c398..96a1d76c5a2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -250,6 +250,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
>       ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
>       ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
> +    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwdota8i, PRIV_VERSION_1_13_0,
> +                                    ext_zvqwdota8i),
>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(sdext, PRIV_VERSION_1_12_0, ext_sdext),
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 85fc3ad8bb8..0c08d688ac1 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -106,6 +106,7 @@ BOOL_FIELD(ext_zvfbfmin)
>   BOOL_FIELD(ext_zvfbfwma)
>   BOOL_FIELD(ext_zvfh)
>   BOOL_FIELD(ext_zvfhmin)
> +BOOL_FIELD(ext_zvqwdota8i)
>   BOOL_FIELD(ext_sdext)
>   BOOL_FIELD(ext_sdtrig)
>   BOOL_FIELD(ext_smaia)
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 5834ec1524f..1c51ea94489 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -691,6 +691,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           }
>       }
>   
> +    if (cpu->cfg.ext_zvqwdota8i && !cpu->cfg.ext_zve32x) {
> +        error_setg(errp, "Zvqwdota8i extension depends on Zve32x extension");
> +        return;
> +    }
> +
>       if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
>           error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
>           return;
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index 172ae0f11dc..4ba0a89f4b5 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -39,7 +39,8 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
>       int xlen = riscv_cpu_xlen(env);
>       target_ulong reserved = 0;
>   
> -    if (riscv_cpu_cfg(env)->ext_zvfbfa) {
> +    if (riscv_cpu_cfg(env)->ext_zvfbfa ||
> +        riscv_cpu_cfg(env)->ext_zvqwdota8i) {
>           reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
>                                              xlen - 1 - R_VTYPE_RESERVED_SHIFT);
>       } else {
> @@ -88,7 +89,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>   
>       switch (vsew) {
>       case MO_8:
> -        ill_altfmt &= !(cpu->cfg.ext_zvfbfa);
> +        ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
> +                        cpu->cfg.ext_zvqwdota8i);
>           break;
>       case MO_16:
>           ill_altfmt &= !(cpu->cfg.ext_zvfbfa);


