Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB2BCA5FCE
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 21:26:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOIb-0002me-1t; Thu, 01 Oct 2026 17:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOIX-0002lU-NW
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:26:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOIW-0006kW-82
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:26:37 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691IxHsQ3522806
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 21:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +NoL16hu4mfp3PDDLKJtqZ8WrpLF7H8KBA9gmpGjjjI=; b=ZgbDDOeVpxlsPorj
 wnlNMLPxpxOSQTG4V7E6euQPdn8yZ9ZYECXvxxazplzHDj+oJXB9pwGB5hAoCmXP
 SwJfbtMi8K0ByfNYoT/d4YwdivNtesHmnwkj3IWqhF+/sR5mTs6OdBo59DrZejtS
 ZOODyNYouzvvK8vvhR5pjnODTMeZ5hWEankNKOrJGkMtb687/2CI7UHJkUukt5+C
 rBje9eUZ6jfo5qX6gcsb7SayehKDyc+Zn82gHu87wGiFNtbmSxHtqFZf1D+ktCbP
 qojk888Fu5qOlVZLTlWalisZMsL3NG44fYF9cX2th4+yo1HvfPf7oAZqtGhffxQz
 Zy+81w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tgfvm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 21:26:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-34ef5fd7934so1190523eec.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 14:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790889994; x=1791494794; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+NoL16hu4mfp3PDDLKJtqZ8WrpLF7H8KBA9gmpGjjjI=;
 b=RBRnPCLg10lPGNd//CD1bH8J79Xo4TyCGT71SAyELtK9/PvQKksL1DAcOIsle6X72V
 X5QvzLiekJ+wpBUzMBCobwbk8H6vNgvk2aqyiAAyfED9lpyF0wnTNklki1s7O6UkZlmy
 lKsS0RaoKGXadhJd6mKzbh1oXDq/mTS/gJ0aSpjv58787jATmvKgo23PFR5Mbf2w2W4j
 E/G03gntiHRUukkdG3hCu/bnfesn8q1hThVniplZSCSKoyFJMsSiupQHbP0CI6ESmoZA
 MYlY0ZyPghBdHDgoM9zj3UkFPwINxREP5xSpTgXLUc8dgT9WKw8VbEv0WT8fr7Bp0lHW
 2e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790889994; x=1791494794;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+NoL16hu4mfp3PDDLKJtqZ8WrpLF7H8KBA9gmpGjjjI=;
 b=oOcVi+2om5WLpUNC02CswJ4z60yGCTCL3Fg3wx1mYoWzZ6sFIV02z1gAjvbhAI40sY
 rKugSntj2xgP6yZOe6ZCzE1yfD+8r0X7/LiFnnKFU7Y5seV1nabFR4LkyNELo5W0XoW+
 oIBBnaZgOq2vPXTyAS60Jq+BbQLba2VRc3Xudu5j3wO+Xuz+xAuxTsa9f0YGtXZ58XWr
 BCtw82Iz1goa5wFfxmtfMgYXSoF84/qX6U3Dgeapx43dQ99nc/FNASJJ1JbdnR9YoptT
 cct1dfTODEbtBBXbzGJR+47UeyOtMZgJy/L+0h2bGhHbJ4FdL4UTT7GlN14OJqnW6yL5
 EOmA==
X-Gm-Message-State: AFq9FYIzxtkXeq6Zr/mo81os3H1OmObJPBlzlIz/mtzxqIB60c59SETu
 jzYdQzqlf297qH/gD3Bdms355/d8hjHAM2QBdi4EgMos9iiagYOq6TfOMK5GiTWhRIVzSOntp+t
 bplSLt+QPdsAm8AnpHFeQsof49uyYpyGlbiRdOq6Z1rx866R1pTjtJcOtxksl2dxuKQ==
X-Gm-Gg: AYBFou2U/2wmgmevDNfK8pte15kw5u812/uQe/zfN5QcixLMFeNALOd35B0UbbCz0IY
 LdJCl9irVaQJDLn/Q2iFzEqZ5AN9Y6+Tv7I7OgDPyhuDCpbhrVvgWPzYxtFcT4Lf1Z+hkb5R3ot
 RCda3SeOJvu2dnQF6UF/PejFKAb3kvKEF19xChMjze9eBK/1mJFuR3N+BcUqOgOjL7sminf2Tij
 XKagxScnyr72mAuNKCSQ+WHvSTmbENW2rqgsG1CA3NWpxVqfgrLKYUH9KqcuRhO4pHZTODU5cK9
 GhZP1fc3ZrR4Qn4/YYPTpYaCRzIV62WQ2g2knskuqyfIVHhhkunr8pHwXquqULCVFV2DwuwcTOZ
 xsI0CTyHVbQLYyE1hkHwvWxkwxKQ5/kqByAKdeIc9wCKM/GGw7QYEK9RtfP3w8XufooPfJg==
X-Received: by 2002:a05:7300:4352:b0:33b:f8f9:c8e8 with SMTP id
 5a478bee46e88-34f14f0d996mr990728eec.1.1790889994070; 
 Thu, 01 Oct 2026 14:26:34 -0700 (PDT)
X-Received: by 2002:a05:7300:4352:b0:33b:f8f9:c8e8 with SMTP id
 5a478bee46e88-34f14f0d996mr990681eec.1.1790889993480; 
 Thu, 01 Oct 2026 14:26:33 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14fd5620sm913470eec.21.2026.10.01.14.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 14:26:33 -0700 (PDT)
Message-ID: <d04339c4-db71-4d7f-833b-664d54f2a855@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:26:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/18] target/riscv: Move pmu CSR read to csr.h
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-3-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-3-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jTygsYSTJxt8atwKrfvejrhMGsHbgrfR
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abed00a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-O1BbwZ24phnXMZMCbkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfX2qwFn886T2lG
 hFkG8ZzuKI5VTcr4gjH4Ur81dFblyKY6LmRRL9OZs6LRK70ypYEjZUgN+zB8WsA89YTkLUdzonM
 /sw81hgIvwRE34+LSZu32UvTEzIQIajPStYnGCVznlZiTIurSoI50hNE4UT65A2UlLbadjfKnCK
 +FGbgW71dyawRznNtI6ioshERXCf7WhF80wTKU/eQzNuWE8AgRD+bnCEY2s+seAroQyCYTaq/KP
 BQchDoyS8oxhYQhHRiWBI2/DFNa68UDfcsOg0nA/yfBr044Jg0Dql2s85/jQZ9SGZjyzwGW+zwq
 GIOf1TPdyLeK0Q9szldvozqbNTB8F+SxjiFOrZcXIHxFzzZw8z0Eu6J49T+fZXoRqbaQlixksKQ
 iHZ7y2gFw0Yv4tl3gCbxzjHoC14CtmTNRRTeb2mmRpHzv9Cezd7dz3KUBWw2N6b/t2WJ0T/yyhC
 HTYuuLCffH9aHq8IUVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfX63PK8qodyaH+
 gFcedHoHRTn2rvhQpQftJt+CbnSpd3zW0UH6YGlJ55VMBSS2rDDPaKZ0F3wCNGc8kkGmC9L1RkH
 CDZ3Mt9okWbHcbm2r8EjwB7309jM6/0=
X-Proofpoint-ORIG-GUID: jTygsYSTJxt8atwKrfvejrhMGsHbgrfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010085
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> pmu.c can then be compiled once for system-mode alongside csr.c/csr.h
> in a follow up commit, since it's otherwise target agnostic.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/tcg/csr.h       | 4 ++++
>  target/riscv/tcg/pmu.h       | 3 ---
>  target/riscv/tcg/pmu.c       | 5 +++--
>  target/riscv/tcg/meson.build | 2 --
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

