Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9338CC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 22:16:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJWN-0002JQ-Uv; Fri, 10 Jul 2026 18:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJW9-00026V-CG
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:16:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJW7-00042c-ED
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:16:21 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3R801697277
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C+VaTBawsyiLdlLuK9EXJtp5+875b1nSFubFDNiAN+o=; b=LUD4WvIBhBlzXR85
 X377vomCaJTRlcj8vm3vnPQZBLq5EEFDYuymYbNY51PvDDcvjunMmWQJn0YT5tS7
 P0DVnNWM/keWM5ShfKgDSGENk4J5d22S5NwwYCz3eTbP3dtZmoxzMrkznFccrjal
 idNpo+A8Dwwco6x/+gMgbXuxvuvFnHhAQbIyBTqwzdlvl/t1dgFpojeuXeLcsX/U
 ZDnxRhFTit+so0dqm25qMx9owwZmLRWXF4U6BCSdO/ysa6GqUEZbDM+hA1oKiVaY
 hJD18t6SraLvl8fc9jlvfg70HCrPQKVk7SnVAHjX1s6zP4WCSUsnvJALXxMe/uWw
 QS5JAA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5djkek-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:16:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso19192371cf.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783721777; x=1784326577; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=C+VaTBawsyiLdlLuK9EXJtp5+875b1nSFubFDNiAN+o=;
 b=WSYABWYTiC2rVtUAmUBZmYLhYVfO/WOH1cvv1gMttUxFq1Pe6CCg78CA9tA5dK7xUP
 moN/vyNuVrXscS8MiARebYeK9Q5AEPTnVAHGUQHF8KItKQiSfuArgJccj3A2o6UTyKkN
 yPVZGkfmfIe+oF8miUfNtyWisN3iHT8BBiZT3ANDSvIVYUCrsXZBM3ILddwxh8OfO6nV
 +NhM2Ld3Qwyz/waRlM8xSiqQoimTybF3D0h2/Tp+qSLqXpYHdR2ea4CMeBMNYZdrsVXo
 NQCBumFJd0wWFYOc81kSi6sJl13bZ+H28I0GO9kpiSOd39BMpfhkAZqfJKzn+V9pKAlQ
 3VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783721777; x=1784326577;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C+VaTBawsyiLdlLuK9EXJtp5+875b1nSFubFDNiAN+o=;
 b=ImAjQq29Nw5/i27nsTgS0db7J/6iTdac43zpZizWktSqwe5Md8a8Nfxc8ruEmhTp2b
 U9yPzA8eVmREOJ36D6hoF+8AWyor7UvoI2xSCs+Q/9MTlLLvncpxtw3IX5O57yLyhPkm
 qPc+5bvBMLLs58i75XZaWVRDz73f8G/lrrwYUwPfU7yHee2AdlTfs0BFRY11uo4A3oV+
 5GvE0snEEv0GTaRF55sDD0bAJ5nqZwFBK9QfSpjkdL3xk2R/UyY5EjLcPr2M4g35+Rra
 g+mdZcdhskW2a0BxeZzAnvvrN+dtLiCqktUKmQi1kqGbjZ1JmpiLNT0W8CNwP74+sxXT
 fp+w==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxetbmP/gEBEa0Hd6xohEeCq7SJwreo3UxJZ/UHEPGZjg+f4d4utknZAAj4x0VCUtdlrKv4o+aCRP0@nongnu.org
X-Gm-Message-State: AOJu0YzyHcBRNu/ZPaDKmKsfYhKUDhTBCPSzrK6kjsdkWiqdui2fv037
 ACk5DBs3uT1EhRayDQX/xhD3wHMtXNWz1RBe2ft80tZXKr0fP80EmmEuWNRwBqVGkmu3ihSIFO5
 JTuBh8ln8jN7DdQKIpwWkkcNAOvEnEMHPQVAt8psAncZxpWTe1wahKmCaxg==
X-Gm-Gg: AfdE7cm3DHiOAL+/whA8tFYpulr/J9jlawZ6Q4nc+vRxLpL2473T/HtSVEaHvlVzdyJ
 GrsEmKJyQY5/DrBl3EpZ04Yb8FX0kMx5zAOOzxfvLeAUhEx8BL23jo2PLjncUsREOyGGgdwyV8V
 TLhqGL5b62SVrqYBJQLiMo0ZaJVgAzB0Q3H+QZKvGmtHmgg04sD3FOjOBlYxQWF57X4MkbXNJ9K
 hqM3uuEAfVdDvKovgSFDrTNzUO4/p/SOt213B1e5N4LpzX5r/1TgGxOGV7AeXa2JzzlEVz5qtL9
 1eCgUj1afsuWCJKIU4rwdhE7N8KBn6CjILMjHiRluuvJshotwoXm7nNMUtT0EUl74zT8paX2FGh
 NeIIijzj+rh3dLX8cR03J1bRsZcFiAnNJEpZEspXTL4CX5dy+tUBRdUST2nQoLg==
X-Received: by 2002:a05:622a:1101:b0:516:e152:7a59 with SMTP id
 d75a77b69052e-51cbf280ccbmr8188601cf.42.1783721776991; 
 Fri, 10 Jul 2026 15:16:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1101:b0:516:e152:7a59 with SMTP id
 d75a77b69052e-51cbf280ccbmr8188301cf.42.1783721776605; 
 Fri, 10 Jul 2026 15:16:16 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb73b161sm150741955e9.9.2026.07.10.15.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:16:15 -0700 (PDT)
Message-ID: <242a93c6-8af6-4c3f-936e-2e8e5b34eef6@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 45/51] accel/tcg: Move ALL_MMUIDX_BITS to hw/core/cpu.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-46-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMyBTYWx0ZWRfX/tgSEKg0o6YE
 mg2tb0YUot0gZwyzDIpzo/hMBHdUJU8SnY92Rg09n8wixZw1Ssd+JPZ30bA/KEwC1dO4aneG7Gr
 jh73JgtOzOw/LuEpHxPDxqtAINwn33Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMyBTYWx0ZWRfX2xni05fOagRZ
 qIoPHvkczDOyK5VHZM4vXWVHvTicCeQIbk7TJVr6Z9uFgqwyR7ADSvEQGJRRFyG8ChpY85TTdG8
 KoxhBSoS5fvlA7b7fwdk9SBtO5NY8s7Ptu8q0wh1/tAq2En06uOiLYwa4EQw4DAZaQuiA1m/hp9
 OcQUrsY2Deghto1bA+gyRi45GKg21a+lcLTx4R/6hJnEYRKaIusM8dmINQGgDBwQntnAhv+sdFL
 MflPvUz0v1IzY1aUGgAu+RD6UQyrrHw8zWuvkIfRRkfEDy6D6/Sf3f7fKk1iDFjot2jmcps0/yQ
 2ufj1jEac4M77Miy0sATqYhwxsGHArJoCdYbXO0Q17Lp7OA4vWLRQK0UweSOU1vmadoIM9Nrw7s
 ezNPIitmzIvBwEbNoRrubp7JIGqMu5I3lKmCuIzyziUCewnqPSd2xUbTY1SQWmlYm0GHV2Xs5CB
 SVdKW1rbGwvq1rBrL8Q==
X-Proofpoint-GUID: 3o0_bA2Y3COlBDFe1MB6_mGBoV0O1W54
X-Proofpoint-ORIG-GUID: 3o0_bA2Y3COlBDFe1MB6_mGBoV0O1W54
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a516f31 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100223
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/7/26 22:53, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h | 1 +
>   accel/tcg/cputlb.c    | 2 --
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

