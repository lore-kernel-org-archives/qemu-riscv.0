Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C575606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JWlZ0pY7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I26p33D0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQWCL-0003pA-ES; Mon, 09 Nov 2026 15:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWC5-0003cK-PC
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:42:23 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWC2-0000Jw-EX
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:42:19 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHH9U899581
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2WuiQ9cK8INJ4KdrBs8ycZbdPGhqpYCJIPfTDT9+LwE=; b=JWlZ0pY7k4wvOCXB
 Va5d0eSFe16mKu+lxzLMLC0YKekTGgwOCx+56q5/hGl0KDB64hdTxC4BdRIDJL59
 6MQA/EXzu6adhrqO6CISygR6dkirJ9vqTLn8wKEUsyN1NtU4G9A3MlhGXUg7JsxX
 5kyZEDAmEakcnEQE+Ja/dUFYz7AXSj1WHgQ8IS/GCl4a3eJToDG6ulyUKV/DqOwK
 3V+SX77Qo4yhbwovqzmHSDG427WCRDBL/Abj4SZ8R/9hGasP7DtcfzP5+Phmz2bp
 6xiZM3o25iDG69hcuZe3keCpIO2uoc9A3aDhwoDV7h3zveOntVZbveazeysokEJ6
 cSaCJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2kfng-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:42:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c7bf2d734so28904816d6.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256936; x=1794861736; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2WuiQ9cK8INJ4KdrBs8ycZbdPGhqpYCJIPfTDT9+LwE=;
 b=I26p33D0q+fqYemSqTSeWanFoL00K67limhw/UqgJJkG6RxqiWNnmC/8HKp1gJFe74
 6XWym2zdCvuvP5Vsiahc9z5BwKesWVKyehJopWOqzsIVlxLCsGHqvK0TyGzz/Fxwgc8W
 iWQnimdIEe5CADM35DhrvU689bTeB7WrrCCJWWkdA3rN+AtUzgKDofK/5j2aQ+e1uZFk
 ArCpG2mWE8ktq9Abh7ShzZn6MC4E/8WuZB4mJRh/ee6pat5cNaZuISW6vm0INWOkIwAM
 XFE2rdUYDuqbAyd/bZNyvxCAwSjcaM0OaajiCv9bMHaIFUMHLIAPXbaSdhKUQcMz4kWa
 fd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256936; x=1794861736;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2WuiQ9cK8INJ4KdrBs8ycZbdPGhqpYCJIPfTDT9+LwE=;
 b=rts+0yV3eVKsj3ZEvTvc9kgyUrk4zYZN7PkbJ/+ZtcAp1gVtkBEFZHfnsNp3vSD/Ry
 8hccBLcKsmBx3FvRGMk1SsRVuXuVb+GOi5OBOcjTr4P5M7FFxljaYZkle/rBFhzVTPUU
 UFpUY8dh2Rt6brTEXqss3OXFdxODcmgT+i3n0hHlQNIQsjo5RPoDz2ZgHBPpeBZH7uCJ
 dEfpwJ8rosdmzB81tSQ7JOgY7FTEK75CMM1NT5IN57F+Ty4d7Qd2xYU8KG8LAOZgQzIp
 BFeTBqsHLzlORIsN8vP0ck4zBQ74kQqs+wZ5G+2yn/FwBp7RmGWpLkPbxtLfx/s+Hsyd
 l3wQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHbzdOrt4veTEfs6zBPWiDwAxFHl/G3iZERXMvHiYoPOqumZWcHchkqFzHWr12vECiI/6FVDQ19cOTG@nongnu.org
X-Gm-Message-State: APuU4Z/WBJbPu63S2NXdQaRXDe6iEJEJNgwn/HCDFVtm2s3jCTUCJtH8
 2KAzJOS98+8aSXY/cl02i6ZFGiaUdQl62nUiWF7wiLTlU0EX08MXHlbPBjWq4F+/DCPLSS5VT96
 FC4hpHHlSKeYc/aBQPCzLa6VwNtyh1KJPha9nAKXuFfG4KK47fkwE7ek5pw==
X-Gm-Gg: AYBFou3fbJYFFCDrePImEGhOP7e0qCHohZRD5s3ZE8GzlxQyaJk8eDnkBbcqScu4/G2
 pNZl1ikSVJGVAUZZMfzFoeRjCE2liYC7ynMCqghyqRnuwwpJZXyBoNXpiiqLVNj2YvjBu+3AUIO
 AuuZm0QpWsydKQ2UBqAEeiRRyCyRl5URA0CGZZcMcw0Cuq91O9CqM6muee7l9rAO9t+XsTUSJLO
 kvVBzuKtmwfMjDeH0G82QLu2yu+EKuaFXcsBBnQYK2E2EF5lrzLvgS1+5/wH4WdJlBOEFRoJMZJ
 4CSmftVQncvSp998Ai5+hlDZU5L2iYg86wuhnPRjIQ1WboZ5eUhNk3O3gMCfGgmkJ8x2YSzk3sl
 Ki8+8Yemo0822IuBSvDJhiRs16mEo0lEvRa0if8wJXby1akoUH9tS94PE7iyDG99uCRPS6+1t0Z
 3PrLaE+I8N
X-Received: by 2002:a0c:e00a:0:b0:91e:beda:6736 with SMTP id
 6a1803df08f44-91eef8b2e4bmr11114646d6.47.1794256935725; 
 Mon, 09 Nov 2026 12:42:15 -0800 (PST)
X-Received: by 2002:a0c:e00a:0:b0:91e:beda:6736 with SMTP id
 6a1803df08f44-91eef8b2e4bmr11114336d6.47.1794256935264; 
 Mon, 09 Nov 2026 12:42:15 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04ceadcsm4634996d6.19.2026.11.09.12.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:42:14 -0800 (PST)
Message-ID: <a4863cd2-d530-453f-9d02-f4d3b816ea43@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:42:11 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 34/38] target/riscv: Add cfg property for Zvfbdota32f
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
 <20261104194155.679241-35-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-35-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af23028 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=G9tXxen98mT-uGK9xe4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX1MnJfR5IG+Us
 NlesvNYmHNfulZgoJdKTJUm7IbUlutffwCIl+ytWP0G0deyvI2338uNm+tW6vnCBgPHQAC3UBgq
 Kh/8pOT6xdBZ3kTWIn9pNGsNH74qY7Qbm4BT+nOm1oY8r99J0+LNz45aXB9CaY8ROJ1W65Lf1wV
 p8TXa5ygeHaTKXYopmFe6saaDYeGVjmK11u7UVCpXamN1WtvOO8eHJiFptsTaeDWBZtwOPORZsl
 R6FoJ/d0daQ6kcYVkb5rc+avaPDgP6Hnt6bV1K8EIjXDc9EUaDYVgWFHtAbkDiNaDlV+bpjYuho
 qqPNMb9SyK3aFgmYCz4TBUvTWW0lFuVS/HW3Mt6kd7ztdQC6A4Q4gMoBaJO4PF2cmTFSyqbbdtj
 kd3HcqLD/sNzPU4Pv+0OrsyYhxBD8NaTaF880L4ECABiDauL11EIwCdya7nJJCquoljS4Yz5q2I
 3Tu7BDK/LzmZNQzqj4w==
X-Proofpoint-GUID: i8I_G1Nt0dFsjHEB6c-H9-VTVJKrCbT2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX/FC7ZDlc0Eu0
 1b/a0Rhyi02UnePpyNo/f1hRkjsNSGIu5D26B51LUDkBGiRHkYkKOfNzK91DVoOzvBPsi3qQKIe
 /glH+sDuKem9ONIluhiiButfIcpIOfU=
X-Proofpoint-ORIG-GUID: i8I_G1Nt0dFsjHEB6c-H9-VTVJKrCbT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090082
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
> Add CPU configuration property of Zvfbdota32f extension which depends on
> the Zve32f extension per the specification.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c                | 2 ++
>   target/riscv/cpu_cfg_fields.h.inc | 1 +
>   target/riscv/tcg/tcg-cpu.c        | 5 +++++
>   3 files changed, 8 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0a35bc7c416..ed0f5ed976a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -231,6 +231,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
>       ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
>       ISA_EXT_DATA_ENTRY(zve64x, PRIV_VERSION_1_10_0, ext_zve64x),
> +    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfbdota32f, PRIV_VERSION_1_13_0,
> +                                    ext_zvfbdota32f),
>       ISA_EXT_DATA_ENTRY(zvfbfa, PRIV_VERSION_1_13_0, ext_zvfbfa),
>       ISA_EXT_DATA_ENTRY(zvfbfmin, PRIV_VERSION_1_12_0, ext_zvfbfmin),
>       ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 0385b58de0a..d85dd2cfd53 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -101,6 +101,7 @@ BOOL_FIELD(ext_zvks)
>   BOOL_FIELD(ext_zvksc)
>   BOOL_FIELD(ext_zvksg)
>   BOOL_FIELD(ext_zmmul)
> +BOOL_FIELD(ext_zvfbdota32f)
>   BOOL_FIELD(ext_zvfbfa)
>   BOOL_FIELD(ext_zvfbfmin)
>   BOOL_FIELD(ext_zvfbfwma)
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index a52637f5ca9..32b6f9894fc 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -731,6 +731,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_zvfbdota32f && !cpu->cfg.ext_zve32f) {
> +        error_setg(errp, "Zvfbdota32f extension depends on Zve32f extension");
> +        return;
> +    }
> +
>       if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
>           error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
>           return;


