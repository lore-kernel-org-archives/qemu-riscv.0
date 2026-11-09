Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CC8606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=njWid/rt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L7Q83gSD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQWCO-0003zC-GW; Mon, 09 Nov 2026 15:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWCG-0003ky-Cv
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:42:33 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWCD-0000Ka-W1
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:42:31 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHNBw562137
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YKYsKERAMFKPOsBV4MhFkZpCH1mMicqnYlynI4lyjYA=; b=njWid/rtMan7kpKp
 GpH7OeYNHMTDPsvUXq/uhOrWII72H9cSY039bLI/vrb5QezbemLlq9X/PhnG8tqJ
 8AwvYPbUWPx0597FN/JibmaPQjcZ7YbDXIeu7R4OFWRavotg8meQQ9JFSyOTsHtd
 P5qz/Fh2cnBJkGKO9sJY7q3GRiG/DhlNYUmV2eyUyePRZjoCYK41h1gjLmrA8TIR
 JvVtHe213GcNqHPKaSq2cvQUnfCpgCGINkL6vPlPPJ0jsQLxaZ6qiDdD/OKwFF4O
 7P7pUTy6eEhFUHvMSY/L98X7+Icgvd7fwD9YorEK4wDU7uvkh3+yjxxhbAaS6ByG
 p2aFKA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydj426-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:42:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91eaad608a2so26420686d6.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256948; x=1794861748; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YKYsKERAMFKPOsBV4MhFkZpCH1mMicqnYlynI4lyjYA=;
 b=L7Q83gSDOD+lwVlCKfll/D5GVp+PegGo+gZv0dVcFF7VBYt4dx1BivEd2GXIFJ/ZP/
 cA9qZxT0XeSJ9tC4fr3xLOtOlPnE5YkxgFOC3B2E7LBmMrj8C2iTW92Rs81RjPWffd4m
 REO2FC51fafmM/bKZXwzXBzLIDPX+SxEnTJgIbVN3IRUeizkUTRWuBEJS13kbEd8vF5M
 zPsAwJrVsjmOEB9B9699NSObNJ7zYTHs6bzasWysOGAQV/r9cmB3A2PyzB7gzO6ob7ZQ
 EjGA1P08kgxk/FsjBUTARUYCRAiL1mOadg2szvclB1JLoTEcTc/lJ5OsxGH9zrzMhvOm
 m/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256948; x=1794861748;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YKYsKERAMFKPOsBV4MhFkZpCH1mMicqnYlynI4lyjYA=;
 b=GCGj0tFgFG6FEF5ZYQYtde5+phhT53GmjDpfoY9QV6hBJzTacEJ0+6oxCzhlNM2QfD
 URfnWqeit6DMlLXDFhTt4+TQTw8EnzKL9pGMJsT5JXUfdEq5P3XKYkP0ub4kERR6euuV
 95T0QquCjlUE9/JP5GhsKjeVhppvaG7QM/g84Cn/asfESB1hhHFmEo9RAequLc5jbEAC
 ZOI3JL/YQYvzPVyWOfm38jNYtXcQ+Ik7nkkDnbV40xzzO5F0nshz0zB39IWLNW04TTqP
 NdN+NdhSDSEQ1ILWRvJhjz/nHW9lGBGLIWVNDoiveJG75XXAZ3MpXsdTWD9Tka60DLhv
 0qXg==
X-Forwarded-Encrypted: i=1;
 AL+hErE6wdSfK23bshvABJ3VrMGBizY2abF/SfMQevY/uSx+dT+KzQO4VtNtZnacxGeXQ+L73Yb7b5aZfs7K@nongnu.org
X-Gm-Message-State: APuU4Z87eiy1BOMiOgwVXLhapObiOZRDx9J7L+/uJwMYlf+4IsXisJJ3
 iuUr448mmFe56PmxPm2OlGq68UkxbTAVBUCi+Ex9+3UsSznz0fKgM3szdNilRW/lpbQFaSxjwBa
 bgLHoY/nBXl97mVyouj5YJlLto+LW1KCsjTYd1VmN8910/NYjGaE7xSZICQ==
X-Gm-Gg: AYBFou0ZXReg/Dd4v+jFAFqFWko6lWZfL1KEv/iKJWBFdB6CfBGvqoAs5iSUzsMxaz5
 aCgi8DEE6vUplqP2KQZDZHMx0MHs3QbHX0eiKfPyE3FmO2tbliE38OvA7ecQugIWGwxxsUhTeqa
 sPkU4eQ3K6Izk2JlCykxGF2aneplXjez599RiobTd+38a+kZKC6MY7M9uzLe008ddCImkK0PGG9
 W4xcfTZLsLtTbHfAVbb0qDkILsQG/+DQXgaEdOCzbGuRbCcz/cmsC5eZmJezCd4wuY3As8eFqqo
 t1lt21HS5oCEB30MExJlK9blNAYdkbh0eS6At30Q4l7FJ+IH1w0Gev466gva/oVti1+owjQX7mG
 j4skCXXuOOwfI9WXuXn+CFZxtZRc620FyCxqjzEdFtgZMjIUifrW5c1S6l+B566epOBZ1MB8xsK
 7/WyQ6CooG
X-Received: by 2002:a05:6214:1d03:b0:91e:b592:ee15 with SMTP id
 6a1803df08f44-91ef0189d74mr11064726d6.15.1794256948080; 
 Mon, 09 Nov 2026 12:42:28 -0800 (PST)
X-Received: by 2002:a05:6214:1d03:b0:91e:b592:ee15 with SMTP id
 6a1803df08f44-91ef0189d74mr11064406d6.15.1794256947474; 
 Mon, 09 Nov 2026 12:42:27 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04e7315sm4585836d6.22.2026.11.09.12.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:42:27 -0800 (PST)
Message-ID: <047d75fc-5338-45d4-be5f-b0a635f73639@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:42:23 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 35/38] target/riscv: Add implied rules for Zvfbdota32f
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
 <20261104194155.679241-36-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-36-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX47efxF2BtQKr
 JnPo+YdZvFyWKkq++dg2/CgLFU87IddtFsW+DrO3uRF1K8sPnGFZaDhV+JHYrefxYUUvddbCQVG
 Ecv2Rcr6f2Wip3xCeGSv1PMN2J6q/as=
X-Proofpoint-GUID: eICtPWxqFjQfc3vHJ9Enp7KbVpHvCfBN
X-Proofpoint-ORIG-GUID: eICtPWxqFjQfc3vHJ9Enp7KbVpHvCfBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX1XkY/HYk0Ltf
 ma5AvYBE2M6ifmdfP6DEPNjWFPQmklJRUD8WyyO9rdnZx+dtarWg+kuPCdKfq9/XyEfoI1NIgjD
 PoJKpaF4FCFmMdAclgYbjzI/7ioFwNpStkKu8JaBwmJmMLUftZS7fJIrOQtA+ge3pL/C5N2lFlF
 /pXKCfVR4sW0mj42THo1dYVb5EKMkADmSkTXh6yTVm6i6WL1LpgMzA4FJBfWo8/10S/paFl0IJe
 3q8IQEvbbwddXXKvtPZH/KrP8//yXia/jeE2UXI2hDrb2kL4kiXiwuFX15+5HPuwCk6wxP7W6i1
 VSl6fTq6b86K8+7kPeXLVzivaKUDMBBqgL8aPLLcxHnS5A6ovrgBpS+rlR+Y5k1ouIeS25/IoOh
 ofAW0gmoVBrhXlfEK4FIjRAosk6nFjWbsHPlm+gbv2u1vbTf1dBCUQ0DDIuokskvHJJDQ6aNNMR
 ZBt/TjM0YsGuYl4n3Jw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af23034 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=9MQm-rMt-FVqDPw3zRgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090082
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add implied rules to enable the implied extensions of Zvfbdota32f
> extension recursively.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ed0f5ed976a..ff09bafe667 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2903,6 +2903,15 @@ static RISCVCPUImpliedExtsRule ZVFQWBDOTA8F_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVFBDOTA32F_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvfbdota32f),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve32f),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   static RISCVCPUImpliedExtsRule ZVFWBDOTA16BF_IMPLIED = {
>       .ext = CPU_CFG_OFFSET(ext_zvfwbdota16bf),
>       .implied_multi_exts = {
> @@ -3131,6 +3140,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVE64D_IMPLIED,
>       &ZVE64F_IMPLIED,
>       &ZVE64X_IMPLIED,
> +    &ZVFBDOTA32F_IMPLIED,
>       &ZVFBFA_IMPLIED,
>       &ZVFBFMIN_IMPLIED,
>       &ZVFBFWMA_IMPLIED,


