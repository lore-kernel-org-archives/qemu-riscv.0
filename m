Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB3606A325
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EoK2+3cb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jvx53TJB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQW4i-0007Kl-7o; Mon, 09 Nov 2026 15:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW3f-0006X5-Nk
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:34:35 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW3b-0007pg-VN
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:33:38 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHQo0876658
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8ibwYH3hvXrT6E5M1Uhm3oesUFUfbuor4NXtTQqkX34=; b=EoK2+3cbK7HQSU3G
 sVG/nqgzJULJa9UXaG47YE7WH0UYpO0P4/x29mkioGdlRN5CBHwAAX6tyotWj9kd
 OL1QRsxM5jKXtg9I58Z4Di63B5j3dc/p69dQ0yu/JikffMtmsWI9d0ZC0fhaXx4e
 YgaGsWn6SFRa8i5c1Eqne7hakYAnBSWzsHGl9HwL0jeAg4MXptWADVLbRDET214C
 e0XiI2IauSrYbb8/W2Gg1wNcGa6Rvntt5ZtAPcTrQyxLwvz/9jywncHG16NwRKsC
 PN1Opn0CKxrzeJ2hG99bfRn8/MpdCsfmMejS0lgzD/6PybyxRuKap9Beh/NGlKJB
 OpO37w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf59ybv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:33:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-53639e47be2so25034391cf.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256414; x=1794861214; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8ibwYH3hvXrT6E5M1Uhm3oesUFUfbuor4NXtTQqkX34=;
 b=Jvx53TJBhbn3N8bKbhS8xCELgJxasVMG/laSrOJWtrEFRoyvXE1JXAVi5qh1T1KdSj
 bKE//bagZAy2mvxuOeKL6dRc8R8U1azsRtajFnrTBr3CyrIXgs6tIjt0H/Rzk3oqYSaG
 mS/k3MEfiqtkkvC3gbO1yLeZ+Fv7y3nXctEC0yVnPXRZc1CrUFQvKX3oKqizr3BNICom
 5vIBlj68IAk7Q1LHb2tHyvEq7degfn5EDpu3k+tXC1Fdy7dhSbjdG6UedEOVyXHPpzsd
 5EU91ls0NVm1kiYBo5ENv2CEJECDc2paeMg4dkqhH3l7UfxDO/OH1YHeONrIK/fvAEGH
 D5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256414; x=1794861214;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8ibwYH3hvXrT6E5M1Uhm3oesUFUfbuor4NXtTQqkX34=;
 b=jH2YrfetmqwrVPL0V12Vc49nAiphkqOyXz3RyLWHHalOUm7+X4zrmEQbpVFACAZj21
 X9yrPZF4GdyeV/+vAiUhIouweVoxYduwmNwK0X5HP5gyqUI2z1CoUVYnx58NW2WeYdN7
 sCFuxgN/z6mZHlHc9o7vcIMTukjopNwY9FK9/Ha7U5WqBw0JIN0LtpyXjFdv8KdoaftX
 7sIStzNSCk5e3kL1GBIPxVes+wGQ85sw1hhs+wydlqYkyCG0OButmMC7J1ue69PxxUCl
 U0DuOwiZWJYSPdy3Xr78sAkXshZubrNPTnCt4pmlYO2LVf2DEdMfihppHnMv00r6iGkR
 sg8A==
X-Forwarded-Encrypted: i=1;
 AL+hErGwKoW8sFAxswELjWJ+jvUMMHZrVB1i/1CIY9u1/7PBPsdTFC7pxsf6tL8/QXkFVGRdLqPS7z4HqKiN@nongnu.org
X-Gm-Message-State: APuU4Z+2quGliAKFeuvvsmKXdD0G7mt2ScrkukapPDwMQPavIkOFLq7S
 B1MMVEiNb5UE1QUpx86x9y9mKHMA1D+aafB1PE+cDue0P6uQ5B1chHo46TX00xQ2lLg17KyKDnf
 trypMcsnX14jjVoN7b2o5B6xSCXzvWxGgEoQ34/YwRrzKUFpHsffjss+X2Q==
X-Gm-Gg: AYBFou2Zv2/P2msUEf0JJcUjoWvA4nqjYpFZpslYnWgMBoVz5QQkPuNmYBcgI1BEA/i
 nGt8rWl5E7kEN0C+APZtDD+vTAt4MYHobi2Yed63YPtBytM9iSvEwMwAer73eb/zOPlZAAq5PD1
 xU+tCjZpceDKoeA6w5nKC1w48aablNHH7YAUS3x7ytW4QusPJVFvwu44AYpgBWs+tAFAtvoD2kX
 YN5/RQJYVPGHkQgn+0fI971fZXyvRJVfJVGOhZElW1IryJxUQE/159YYncECA8sCB/gvmEyoL4g
 DBEQq0d1vPdNG8Pv0U+Rpg5FQhOuOGXuJh43ni9oZUZL0j1bmnGNVIOp/RzxhDDtFstwtENAF0O
 rRDQmBRiei0vR2KLcxkIZBcWNtbX3ygg56OAWUUW0HAhXj96n8/SHLex0CM23/NkOG2/9j2+Ts1
 4H3u5h6wSf
X-Received: by 2002:a05:622a:1aa4:b0:533:370f:3e06 with SMTP id
 d75a77b69052e-555291c35a0mr7390081cf.25.1794256414025; 
 Mon, 09 Nov 2026 12:33:34 -0800 (PST)
X-Received: by 2002:a05:622a:1aa4:b0:533:370f:3e06 with SMTP id
 d75a77b69052e-555291c35a0mr7389731cf.25.1794256413505; 
 Mon, 09 Nov 2026 12:33:33 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef010b059sm4886676d6.0.2026.11.09.12.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:33:33 -0800 (PST)
Message-ID: <315bc71c-f8c7-48ba-837c-d43eaccb53b8@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:33:29 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 24/38] target/riscv: Add implied rules for
 Zvqwbdota16i extension
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
 <20261104194155.679241-25-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-25-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ECvFE_gBArCeHik4qWXi7yLFBUWpQ-pI
X-Proofpoint-GUID: ECvFE_gBArCeHik4qWXi7yLFBUWpQ-pI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfX8kyZhViUqAip
 S4P/ow+l+yt2CT3eS/qCTJ+FbGfzY45b2jNZ+PCSUjdqlvrzXurzw5A7hiVJzRlZB/s9Q4ltEcu
 RoAZ5csDTt4OOINiXyLEBWQtT3FSP4E=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af22e1e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=88Q7jkV7JQJhtN5z1ogA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfX604jsk+XpP4Q
 +3lObZN7/mSxx5dkFXw+QnbNM0VYCcNCXNLzjuWgpOgbzNPlfSaKgmKbg5KjswxYY8ivLFclb3k
 56cUxAMpiqFyvtoJBwJr1gJ1OkoZwncUAXb3xmk7Dt0j92iT5BbKUQ6kSiYoGCdF0t++C7lIR8H
 h5aakeqinLdqdPZIbsnOzkAutFkeX/haNrxOwszhDkfFOuCCoL8Xg9MGTz4i1SFTxx9gqkiRB9W
 XiM6JSFEBz8uBkYIZPLWZJW74SfcD6aUcyC3Ex27LUxXVhc8BhxmMZNv6wLKkp7daCRYFxJHkG1
 hnffsW/kc5ooSmMDu03ILExPovZynxyKhFjTMeEhnDLvgz1mK3MRiE7OsdcBhdvjxIS126DDhoQ
 84T3HX3fZmBNB+7ay0GwGh+9RfgRT9EgvGWA4BkvkFJXinYTzmxTceAyzU2IHf8aDtiT00tQRv+
 zwRbkTIGtr624Mje9lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090081
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
> Add implied rules to enable the implied extensions of Zvqwbdota16i
> extension recursively.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 99c82b898f0..95bba330e06 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2906,6 +2906,15 @@ static RISCVCPUImpliedExtsRule ZVQWBDOTA8I_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVQWBDOTA16I_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvqwbdota16i),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve64x),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   static RISCVCPUImpliedExtsRule ZVKN_IMPLIED = {
>       .ext = CPU_CFG_OFFSET(ext_zvkn),
>       .implied_multi_exts = {
> @@ -3112,6 +3121,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVKS_IMPLIED,
>       &ZVKSC_IMPLIED,
>       &ZVKSG_IMPLIED,
> +    &ZVQWBDOTA16I_IMPLIED,
>       &ZVQWBDOTA8I_IMPLIED,
>       &ZVQWDOTA16I_IMPLIED,
>       &ZVQWDOTA8I_IMPLIED,


