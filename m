Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8202BC4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 13:17:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLxU-0002vh-UC; Thu, 16 Jul 2026 09:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLxS-0002vR-Vf
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 09:16:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLxR-0003rT-9X
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 09:16:58 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiPLw2678328
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 13:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wgZjHsnitJfDRDNhZGlPRx+iMqM5CBC1O83g8qUGuGI=; b=BsEVhybp/XB5uiCj
 Z8vQbtczfWe18bHbyE0KTNlbfzaXgjhKOSYGDhiMRyPRaiLLXZ+hRMj/YCKIfPVj
 euhiHh2r3ha7QtFG7f51M9RDzaLTS46/ZadW4yz1FWx/om/M2/mDAi/bGuQHUZ15
 v2lbXjFnN+ExxTFbgYO0mHjEJFTTzcIqRhbM/cVWwfVNjMWdpOyj03g0y5PXpOqv
 4ZzP/QPeI8gulmFSDgHnPvsggrEN2hFP39YxuHGtSt5LbqyyuOVt/qMSvgt5KjIg
 NwWy1SgKUT8aMYfnXEkFJAr7ntx/oXtVvaTjHVvgwNLtH7auRXe9xgcFhOzUwqLK
 eQ0w7Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1s1gk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 13:16:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ec3314f65fso114704046d6.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 06:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784207814; x=1784812614; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wgZjHsnitJfDRDNhZGlPRx+iMqM5CBC1O83g8qUGuGI=;
 b=BE5VJghT5PahZqC4sZ8XQcpX+HgmCxQsCaUb8LHRl/WlQWG4qfzEBPNoeAdYi3LVFk
 e1q6+zDajJ0kTwecn40S6eH0zReO3LlHi83DRpJ2sb3i0WHxGVSZBpHnsUBpu07ibuSS
 M8rRFJaQ/WVNZz003r5qDky16juVI7n2//ilummV8HLLk5Tm7Plws98Gf9h6cGCLoghE
 ci8nfcRkFVBtRtHbkxHBAkSdzKsurn0OizJNLDT780Ltl7BGp105w4pyWIUxXcA5cJgo
 HZ/pBvbQngsByZdwN+HztaDkURA79pZA35y+oXkTLqX+u6XgE5yPTiZHAJTphCWMC8eb
 lBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784207814; x=1784812614;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wgZjHsnitJfDRDNhZGlPRx+iMqM5CBC1O83g8qUGuGI=;
 b=n0daaNtG3oH6CUn2PF9T9FVrQ7+k82z/miVyVWFNXBmbG1nT0DCxe3iZJCXuV955Ww
 qgO7tDvhGfXUs+2SSLQgLlrbgbl/+ahVbN1UROFnMZSeOIGAqQZ1+1Dqa2NetpEfj+i+
 v91DuIDWU1n5e4Xy67PERC61j+zgqy0vAHJuzC2DwV9oZjejplvSkBBABTG0pMB8B3dk
 BQlY+zki99igOeOV/dyM1qAuY2a0FmkC5QwYfCQMG6E3YyIUK21WB86ttjs5gMB3yoKT
 yE6fQSt1T+WJh+WJCp6lhRMje1W2T03YLqGCkzsDK6mSGFORIR4a43XUGE78Dn/GN59/
 TLgQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrAIIm3KI+N+e0naUEDcx2ttd4kHK6SGPjTnMRigivKxj2fq/K2wQujbNz4o7uABUsCeXi7nOrk7dPK@nongnu.org
X-Gm-Message-State: AOJu0YzJQkdvx0yib2Hp1LDSU0UlInjhr1dvaORPsDXs+dK54O3T9s5r
 M9LIhvZKc2R9c484gtd+TvU5jJ7yLW18efP/ay31HXG+U+EfA/rWIFhNo85Bi0fS5FBIzlWf6Ia
 4FUGuBXrVf25DjP4skPIxQkMON+oKP4KJCc7+S5fyz64RkgwFjt0mo5oBvQ==
X-Gm-Gg: AfdE7clxlXUQRf7SJE7sMTFgiuYzS02/znAohYSrhQB86BrMwDSJ1oeOdAtu+e4Vbwv
 Yh3KO4zkCOiMR3ktiG7ehuvFW6f0cvo+jh4TDTF2GkGDRxmfgjr67ffXlxpVj34Vg8jLaRh31Ce
 IvuYsX+FJd/fGErDRE6NLVyfElBoiRDFKJ8l56IyEQyRu0EzE2pUEYIYVbMffgrGhsADdKOs5Y9
 XzcD4b5d+2YaO3IDHMPgdd6S3P/uklkFfCguIoijsObhkJZgi2ZRaNFzSXOdhF6lq9qhIHI3g4A
 eaA7QCd/eqscFT7fWc/tT85alIWB0oTNWAfLTd50Rd8oEsIicSizlHb1A8noOY8BhQyoC941bCs
 mg2XsyKA0ehZSckOCHhfjauHkXCa4DZzZuQ==
X-Received: by 2002:a05:622a:410f:b0:51c:a8:51cd with SMTP id
 d75a77b69052e-51e4ede93d2mr78877001cf.1.1784207813826; 
 Thu, 16 Jul 2026 06:16:53 -0700 (PDT)
X-Received: by 2002:a05:622a:410f:b0:51c:a8:51cd with SMTP id
 d75a77b69052e-51e4ede93d2mr78876581cf.1.1784207813368; 
 Thu, 16 Jul 2026 06:16:53 -0700 (PDT)
Received: from [192.168.68.105] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51f2bf8ff21sm21928801cf.26.2026.07.16.06.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 06:16:52 -0700 (PDT)
Message-ID: <09fabffa-6d98-426f-af08-7b3e4e7845ed@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:16:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] disas/riscv.c: Correct wrong shifts for cbo
To: frederic.petrot@univ-grenoble-alpes.fr, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: julien.thillard@univ-grenoble-alpes.fr
References: <20260715190737.1381701-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20260715190737.1381701-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260715190737.1381701-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzNiBTYWx0ZWRfXyCFQ3y14In/g
 TSUzydC6Kqncf3X3bGVfzZ0Gmda1/uQp4t7xB6SwbSw80rE+Ou2wuBK4OOozqj+bBCDFOv35J21
 DeuMKNLlnNDiAHamkEn7CzgV0sli4dlG7kM4GqHoORyZfF+1/OWMnjWB5UKKxX+Y/JJBBuMIPOZ
 zsHVAzDHw5mdMzoVUMOdrWAtw2lDgSfxivYT+V+09yIa2eM1zukL2/klJd5Ts4VVob6p1CC5m3F
 /oUcNSs3EXl/WWGRtW3YQhtnV8gx8yzicVQ4OOKFZngO8Iw8H0oPj62+fbBwcWbPUtHOOkTew+i
 G2o097RZuq0yP4oAWGxtB7Nzbgem0ZIX4Y2DfWniZL++x0G9ZyT4giQbhl9dsUudkYkOsyu2net
 teAQkzXm5iKV6DmIKMV0wZ+496j9FbuAxPpkIxnfZz7poMoWSnKhf9FMEhfVn6cffPP+hjCCpBJ
 5CzrQCKZJSdMEo8pAFA==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58d9c6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FNu0ZtHtnlOnKnqYvqoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: -PEbRgRd89KLgH52fsBE9Nze8Fw9_e3d
X-Proofpoint-ORIG-GUID: -PEbRgRd89KLgH52fsBE9Nze8Fw9_e3d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzNiBTYWx0ZWRfX9vF9V91AFwT9
 JLo54q2VWiwKXlIrOrFthGRGvKvfk8mW1uWH1inb3Q47W7Yr+ItoAM8S78n2Yf2gA+lS2Cm923j
 3ftxkvtUVd4k+u4HuuZ8iOHawVXAgCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160136
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/15/2026 4:07 PM, frederic.petrot@univ-grenoble-alpes.fr wrote:
> From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> 
> The cache block operations are specified on bits 31:20, but for
> some reason a shift of 17 and a 5 bit masking were performed.
> Make this a raw shift of 20 prior to test for the cbo operation.
> 
> Reported-by: Julien Thillard <julien.thillard@univ-grenoble-alpes.fr>
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---

Fixes: 9273cda722 ("disas/riscv.c: add 'cbo' insns to disassembler")

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7f1b262773..490bda8e56 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2889,8 +2889,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 2:
>                  /*
>                   * 'lq' shares the "(...) 010 ..... 0001111" opcode space
> -                * with 'cbo' insns.  Check the next 5 bits to select
> -                * what we want:
> +                * with 'cbo' insns.
>                   *
>                   * cbo_inval  0000000 00000 ..... 010 00000 0001111
>                   * cbo_clean  0000000 00001 ..... 010 00000 0001111
> @@ -2899,7 +2898,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   *
>                   * Anything that doesn't match these will default to 'lq'.
>                   */
> -               switch ((inst >> 17) & 0b11111) {
> +               switch (inst >> 20) {
>                  case 0: op = rv_op_cbo_inval; break;
>                  case 1: op = rv_op_cbo_clean; break;
>                  case 2: op = rv_op_cbo_flush; break;


