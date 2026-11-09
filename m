Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD770606A33E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HSPpfxQo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZCeUppCz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVXI-0004Xg-JL; Mon, 09 Nov 2026 15:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVWn-0003sj-7S
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:59:43 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVWf-0004Ag-Om
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:59:38 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHHGM3464773
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 19:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tM8YiLpqT+wLqSNqxCMW5CgNi//JYHTegiGv6da3yuk=; b=HSPpfxQotTiYMehR
 fMCb5H7NYOPEjoC5fHH9IR9AzlNY0rc7waZrkkLUQ5atHhVwei/8dD4PiIQZs2Jt
 7yGQ+a5cYXSSQUxzb4I0PwD73MSLNi9Vo+Ja+cfeVh9WInWKyTW1DP0bQ04atda2
 m9BR3sKH7AfTrcr1hizuYGe/CvlRKXdtBWjJ2E1IdRvHk85LACLARLhiqKu0fusi
 ZwBaPhr7G8sUIcJbMG5R09N5deN1Q/pVd/x4xBhrEg4dFLuvv7VP3UUNe9S5HFuN
 h5/1dJp1OxwYuDXIh7IjcHUJKANUk1kdMpmYX6QT2PViP80o8DDETfQdq5zxjZZW
 xhDfQQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8t6ej-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 19:59:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91edde88d16so15974156d6.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 11:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254371; x=1794859171; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tM8YiLpqT+wLqSNqxCMW5CgNi//JYHTegiGv6da3yuk=;
 b=ZCeUppCz3V6f4ZYyc8nSZF0BDNICPgtk2st6TS8dlKibuiAheVs5BBtpb4pJb99cw2
 DOUYjCzwTtbsnyySZPdt4dJ8PCLRm/voR0TDTak2T2V18lWFebmm9VQzdgMcMI7TWhyX
 LfsgUxrB6k943WnRbv63s0AlKFoiYroOT/5/6xBqyAQkhItl4AE+VE0qDpn/izt5BOlC
 JXJZJi5tkE4U7RZbGOKNVasjtbR8nA7KzvDyTgH1OuHIuaVKfIEgqBwqh78LVC2VaAqS
 /zdiaF9doFp8H0NWkEa5zzM+Ge/pBw4tt4SWL1JQy7RqZaaJ2QJ+H0aoKZylx2tV7zOv
 X+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254371; x=1794859171;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tM8YiLpqT+wLqSNqxCMW5CgNi//JYHTegiGv6da3yuk=;
 b=tWYh4/B3mc6UZwD7adAnySjJmomiPWEn6LqwvBVpOqpSG6N9EuZPIwWMW3e+hbxhrE
 xLmO8nmyGYrA7H5FXPm7qbwMy+jI8wkzrZDUnq3n+eowXHh/GHkiF3QIFIOxysa7WwoU
 9zshiXYIR+KwWGonUfRhb4ySy2EIE33T5Z02+hGutbfG7wttsnjOyG2cwY+FG9OcWxmo
 nP+WCj7aKTt+OU7DaD8/lIOUVKq7yHVSfJhKt5sNVVUmco0NZ+YTsQ64ChZnCSEmDwk9
 3Ni9dlKgnms3xkoG15VWmnXclTJfa7tpASdzuH3GzGk6Z+gjiBM0pfpdVTpPimqMKE4G
 uZEw==
X-Forwarded-Encrypted: i=1;
 AL+hErGMWMcT1QJk2yb/t/ahg7ZBp7JTY4x9Z0sBC0/y+ezLeKc0lu04LL4dQshqFg+dhA1q78PdV1r7TUjW@nongnu.org
X-Gm-Message-State: APuU4Z9kd6va24S8VFg4dcWF3Gc3QN1HXVoxR+051Dg3dL4RR/heeo6f
 rz95HRzEjDzWNxGU35liei5epvllZL9FuCqpG5Tp2efdBSOFDriA31i8ZARBs3GfCgkTgXuCIBh
 EKs/bG2S3sy+ok1yMPbvoZ5ThtnCoMmq7SSj4NiNH+R2EMucNM6sPrJ7dtQ==
X-Gm-Gg: AYBFou09rhkHtgRopAxRoUT2rLlyvicUKbdg/zBUbWQgRJcd25SQwSMNfIpejUIB4Yv
 gfHQg+U3MmYJKrgP47R5KsQsMLqQnmiAMoKntygpcmUfwqqw7yJtGngyy1uXblMbruZHmOXs1aM
 U1939+GgiYIBtT2+6W1kFmf6xoBJJmeRGPgydJJZzfO/+x0BxcLuI5yIAQygGcZowAAR+wIB9f0
 +LejviIWuyc8p0EuqTDeQHsnKksADHoesYWxH7JgJBiHqcAlhPNxulayi+ZtlO/eEzuUzdj3zrz
 UiEVAFbPS31mJhKEyq2DrO2+jsnYAEzQqvTqWUR9rlzLaY6AN7AaiCMdmsWWMWfyPi4pyFeMoyA
 GUw4CT57ZdmewsNTknnwRUGl9zxeUj3NwvJUT48X9fQufOwsyOYHYaOhJW1AeBF0aThd2IHsxea
 QAKd8tiV6m
X-Received: by 2002:a05:6214:320b:b0:914:cdbf:b68 with SMTP id
 6a1803df08f44-91eef888d87mr10468496d6.20.1794254370496; 
 Mon, 09 Nov 2026 11:59:30 -0800 (PST)
X-Received: by 2002:a05:6214:320b:b0:914:cdbf:b68 with SMTP id
 6a1803df08f44-91eef888d87mr10468036d6.20.1794254369822; 
 Mon, 09 Nov 2026 11:59:29 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04fc000sm3776096d6.26.2026.11.09.11.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 11:59:29 -0800 (PST)
Message-ID: <d797d962-1911-4d0f-9977-0fee55c9a1cc@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:59:25 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/38] target/riscv: Add Zvqwdota16i dependency imply
 rule
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
 <20261104194155.679241-10-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-10-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfXzJrXVDSUipsq
 sZe50JOc4dhr0ojYQH5v6pkkNXrAUOY5LJCxM6egk6zRg3pkzjidivYBcsEFE+pbSMtbi+Ox/4Q
 gm7vxAT0qruSzIrjcxReXT3AYd+X5S1jRTjCZycTByfBAfZv3xrOILt5H7D7WDkdRasgd97Qu53
 xyYZdsuLlYcUid9dn9wqwJGyDsJy/nzftF+JMJLjx0zd7FIdLw4XJ2CuWo1e1gK3/3dC6UHPjB1
 ERHcdy19eVaqx1timps9od1j4vhaZLxKZstCA9kJ+XLNfoKxQlaGhn/0Cusp+QcLjlVdFBADcGz
 0fuEyQ+91Ib6DClLRysUo5Fav2Cdw4xu+vuBQYjavjmBdvRxei4WqJXL2xQ828zwXs+WWmDNSEr
 CJll0XWjCjuecX7SbVwn7BcHv+m04IXVN/NTMJC9As/HAVYUnFZgOESDk5gpkhGYbbaG+DA8Ahx
 WrwPmkzuuDkx2TlZAcw==
X-Proofpoint-GUID: XuQWDs5DbAHt0_xHMxlK7TRYhVForfMa
X-Proofpoint-ORIG-GUID: XuQWDs5DbAHt0_xHMxlK7TRYhVForfMa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX0R2NQbsHpaRK
 uEeLoS0wGeDlhObHyHoa6kSEXESKdrUjvebebfxVeOGOLKie/UDfOQZpqThEm+cHmuRYzaYrtPb
 VVar3yAqXqJhZ6Owm4tNap7hXCT3J04=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af22623 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=lghVttTW7IiECEMhu-gA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
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
> According to the Zvbdota isa spec, Zvqwdota16i requires Zve64x.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7873e67c053..ae859128d30 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2853,6 +2853,15 @@ static RISCVCPUImpliedExtsRule ZVFHMIN_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVQWDOTA16I_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvqwdota16i),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve64x),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   static RISCVCPUImpliedExtsRule ZVQWDOTA8I_IMPLIED = {
>       .ext = CPU_CFG_OFFSET(ext_zvqwdota8i),
>       .implied_multi_exts = {
> @@ -3066,6 +3075,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVKS_IMPLIED,
>       &ZVKSC_IMPLIED,
>       &ZVKSG_IMPLIED,
> +    &ZVQWDOTA16I_IMPLIED,
>       &ZVQWDOTA8I_IMPLIED,
>       &SHA_IMPLIED,
>       &SSCFG_IMPLIED,


