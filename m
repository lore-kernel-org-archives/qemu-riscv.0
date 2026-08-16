Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F26C5B572
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 15:18:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvccE-00036y-9e; Sun, 16 Aug 2026 11:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcc0-00034i-JQ
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 11:17:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcbv-0005AJ-RI
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 11:17:22 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDmHLt3952772
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 15:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IjC/ciFDPuGvWvWUCVjSu8/vWWfDkE5Y80FiO9GPPTc=; b=fxHBmf2XVwNaldG6
 RU6FKPfkuzpuhJFtBsUjqKF+Mt/1E3thb65olLc6DHncFenklvsS/CYaqgj2Vfvm
 qIsZUuDNseXp8XBZ3TONCJFfAxoR6D4cqGZ4NbW0aEzBpk57pTidLHps4WPFHbzf
 Wwszf9baABDyRFtGhI0tOwpjidlav3VPFmACQL1pshE8vg2U3FFThpcyMgNWbKYr
 ocuGky53vaOOD9a/V+UUKt3TGoeAQxZpK3uSsTKsoHlR7y+lXBVufE/vyB7LoiIh
 gUHgq/dPt9HitjHGNXYF5fR5x9iVOzcyt6lVMneWa8zGdZYs/4Far+fV534gPdbs
 mQMW3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghnup1x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 15:17:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-933023a5980so444471485a.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786893437; x=1787498237; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IjC/ciFDPuGvWvWUCVjSu8/vWWfDkE5Y80FiO9GPPTc=;
 b=GadsZu484dwWzK7Lto+U1MXkp44zDLNtAig0nfpDFOdBSDtsT0e6FPofQYUrjEeZSv
 gscX1/9fF1ND8Wi7PxQmqt8YTmc4wXWqNgqWnLRPTPOhZm/6GmHRGI/W0ry/Av7628kM
 tF+q6JVjgassHIPE9ayReOeemki6yR1auyYDUYhrZVjR0AYSy0r7KMgdYlOlFPRBDQRz
 e/PUza3poJwEIYEvQd16bmBOAd9R2ayacPP4bwWGCoc9HeKwI9yOtQmOm9CmAEuhgZvk
 U5Ci0E0yVD5+N9OWmirwytWPFyxJAfdXWnxhIzyR+8+3FLPpmITDGI6NSbwG1pG6QnO8
 KRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786893437; x=1787498237;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IjC/ciFDPuGvWvWUCVjSu8/vWWfDkE5Y80FiO9GPPTc=;
 b=UdbCgq/nz/ZcHodIJ6r+QNG7hDiYdM99/BV/ArPJTkCt3DWf5/RFSMEJktI1BptqbF
 o0YE9jwUyEtjMt9/+tIVcFKiHX/PSeuYfi28GVf4dX5hWOiY4HDmJmdYLsCb7E9Xb1ki
 s6tf3wlKhk20j6DD21cAm3Y0LS/4riUfTFvRoNCJxheGY1G7vXqe7MfBcHiQZorMXIS3
 e7xCIHmFJbLIQOmTOZl59gwXa3DKzwzQFXKYo+Gfk6U/uFvPP0BbUG2jZBVbL8DQ9j65
 Q/RPycCyjrnzCaGwJ4c2V2URVB9aVVlbGlMV7BUhwmGMUUD7b/O1j7LYEZNMSb+49VZp
 QySg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrm3AknTaj/8zy3hpC5cm3RcyTLDUhKZKz9W5HEF6yt7eVUE5ExcY/yg2xkg+z0dulOTicILGvxF+Jp@nongnu.org
X-Gm-Message-State: AOJu0Yw4qdO/GA4e82OWDBWocGaCNejMcqwZgJyBm2+2CCJEsDBcSOvb
 7utc4IfawPxMw2saNDROAEeXWjxcc/Ks3FDGHRCih7esr2szqF9d+T/Ng6yEB2X04MneAIc1KBZ
 dRyD5b6jiMYIS4KGfkkbAfCVaOj6uVjZt1jhWaUzcfikYhHzYHs1crar7VBwgLXBVeA==
X-Gm-Gg: AR+sD110ZqBz35sahpqK34HW/pK+nLwIcJ6g9jjP95wOOKiU3rEMCbOxA7TnOhzw6Sq
 GVHd+xSIiYK9ZfLCqIQ0Z0ii3cQDnD/Z/BFkEyxhvmp7eRrOfRpokN93G1J1I5EI6mUNCKwGNja
 3Fow2OaMRCleisKphqbQmetG4j/dGQWbtat3uxmJW7pufA8ehO5nDive3gEzhkyW4SLM2e715XZ
 /WVpKaSQLvLfZshK8ZW7RXG0zPDJfSKCSdMUwT4gbcgYuAdwaGfGpm1TwU6F6HwQD8mJFqU+ifi
 e8Nbv+nT61LF0MM66oB6cwCGABG1C4sH3A87S98S6pgE622Z+gZNwo6Whm7FPw0E6zyQgsoLYpq
 omYI16lhQjVmkkaugQDvZXcwhKjYsix5ihBg=
X-Received: by 2002:a05:620a:44c7:b0:915:8055:3f91 with SMTP id
 af79cd13be357-936d239f8a7mr1930482685a.43.1786893437506; 
 Sun, 16 Aug 2026 08:17:17 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:915:8055:3f91 with SMTP id
 af79cd13be357-936d239f8a7mr1930478285a.43.1786893437019; 
 Sun, 16 Aug 2026 08:17:17 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996188217sm131142035e9.13.2026.08.16.08.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 08:17:16 -0700 (PDT)
Message-ID: <26a073f0-9e8e-40c1-97dc-6b420740e20a@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 17:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/18] accel/tcg: Replace size with first/last in
 TCGCPUOps.tlb_fill*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEyMiBTYWx0ZWRfX7Ih+JTpAq0YL
 ofpDrfD//wJzBX1lRx72RIBlKF+dqd39iwkq2xvEw8fewL85Zrmtt1+iwNi3kdg8Mld91qnuF9N
 6+SVenH4tUUWAGfqqZZwE8HZGBE5PRGPXjYbFls6YebL8u6Oxw+70Fka72n/rKceff48YJgyRck
 wuWmn+yCcC8lZGi2bI2IRD/KDVxIlrVGUewOLDjENOCwfherNufDdeQiJned8e0ID2OfpKjw2xH
 stdN2QmrDsLcSwyNsUr5ylIP6qsm9RsgnlrzJo6yYKnHrYyuHDbzzCUFfWR0cw5exrzHQo7/rtW
 SJntm95SjKIgm76SkfBBVTOLmoZeIM39DKT9Pv2r9VuIw7xpCzMtta6oEkdwPL0QPpcRFw6e0oc
 hDtZmQVdtwQSuZk7nhAG1NAkuu67CcI/mC8S4o+Ru7HNPDS23WXX/ghx9ZCq9/372CmJFy49irQ
 Y63mgTfFqi1J8T41TjQ==
X-Proofpoint-ORIG-GUID: dDJQVmViIvTGYaiOwiVgd-HTPmkAVjhE
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a81d47e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GuUwtT5LwiOZPJdfuKMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEyMiBTYWx0ZWRfX9gFews+sx08r
 imVNxS5z2ALZvqfbIMVDwW0ZXmpU5MUprEn70kBuCYqPHpohL7AF+o6TwYx+Uk1bRDoTi3HXuIj
 FDLXnI/BeTcrmpJNEF4UQgEE0kJKHdk=
X-Proofpoint-GUID: dDJQVmViIvTGYaiOwiVgd-HTPmkAVjhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160122
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 15/8/26 22:37, Richard Henderson wrote:
> Expand the interfaces to allow an address within a range to be tested.
> Additionally, where was an edge case of size == 0 which was ambiguous,
> and is now eliminated.
> 
> Only change the functional interface.  Where required by the callee,
> rebuild "size = last - addr + 1" locally.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/cpu-ops.h          | 16 ++++++++++++----
>   target/alpha/cpu.h                   |  2 +-
>   target/arm/internals.h               |  5 +++--
>   target/avr/cpu.h                     |  2 +-
>   target/hppa/cpu.h                    |  5 +++--
>   target/i386/tcg/helper-tcg.h         |  2 +-
>   target/loongarch/tcg/tcg_loongarch.h |  2 +-
>   target/m68k/cpu.h                    |  2 +-
>   target/microblaze/cpu.h              |  2 +-
>   target/mips/tcg/tcg-internal.h       |  2 +-
>   target/or1k/cpu.h                    |  2 +-
>   target/ppc/internal.h                |  2 +-
>   target/riscv/cpu.h                   |  2 +-
>   target/s390x/s390x-internal.h        |  2 +-
>   target/sh4/cpu.h                     |  2 +-
>   target/sparc/cpu.h                   |  2 +-
>   target/tricore/cpu.h                 |  2 +-
>   target/xtensa/cpu.h                  |  2 +-
>   accel/tcg/cputlb.c                   |  7 +++----
>   target/alpha/helper.c                |  2 +-
>   target/arm/tcg/tlb_helper.c          |  5 +++--
>   target/avr/helper.c                  |  2 +-
>   target/hexagon/cpu.c                 |  8 +++++---
>   target/hppa/mem_helper.c             |  6 ++++--
>   target/i386/tcg/system/excp_helper.c |  2 +-
>   target/loongarch/tcg/tlb_helper.c    |  3 ++-
>   target/m68k/helper.c                 |  3 ++-
>   target/microblaze/helper.c           |  2 +-
>   target/mips/tcg/system/tlb_helper.c  |  2 +-
>   target/or1k/mmu.c                    |  2 +-
>   target/ppc/mmu_helper.c              |  2 +-
>   target/riscv/tcg/cpu_helper.c        |  3 ++-
>   target/rx/cpu.c                      |  2 +-
>   target/s390x/tcg/excp_helper.c       |  2 +-
>   target/sh4/helper.c                  |  2 +-
>   target/sparc/mmu_helper.c            |  4 ++--
>   target/tricore/helper.c              |  2 +-
>   target/xtensa/helper.c               |  2 +-
>   38 files changed, 68 insertions(+), 51 deletions(-)


> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 0ddd898e6e..bfcd9b6159 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -666,11 +666,13 @@ static const char *access_type_names[] = { "MMU_DATA_LOAD ", "MMU_DATA_STORE",
>   static const char *mmu_idx_names[] = { "MMU_USER_IDX", "MMU_GUEST_IDX",
>                                          "MMU_KERNEL_IDX" };
>   
> -static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
> -                             MMUAccessType access_type, int mmu_idx, bool probe,
> -                             uintptr_t retaddr)
> +static bool hexagon_tlb_fill(CPUState *cs, vaddr address,
> +                             vaddr first, vaddr last,
> +                             MMUAccessType access_type, int mmu_idx,
> +                             bool probe, uintptr_t retaddr)
>   {
>       CPUHexagonState *env = cpu_env(cs);
> +    int size = last - address + 1;

Nitpicking, since we know last >= first, could we use size_t instead?
Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>       int slot = 0;
>       hwaddr phys;
>       int prot = 0;

