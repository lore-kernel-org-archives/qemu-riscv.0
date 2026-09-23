Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2267C9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 14:39:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9O7u-0001rv-5C; Wed, 23 Sep 2026 10:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9O7o-0001rG-Vy
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 10:39:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9O7k-0008Nq-BW
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 10:39:06 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NBbVVX2443351
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 14:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QAPNeVaRXknRyms4HxR2TnjgMeCvlo5g9U21YYAAeco=; b=DiXhunMos4Mm+QMd
 vDYmQB2k8FlbBj9hbq4d39Hl7D/YYq1zHCwarWmtfticPsx4U7rMuu+USwj/RN2I
 r9Dsm4zns3S+QyMmlhJyWnX06WlKMIwAxVRcyJ3jMhpxBg7hLuvg27hqLC1tpWrc
 lx42PDWopGo7cuCaPDmg5ieC3TkSbMp0KCM9k1xivJiSzAUSER6ld7BbR4NadH+7
 5+nXS4WlE0k5yVlMhWaF9PCoM3twESyeRayvYzhua/6/FLnKmtvsnP32gRJKggRI
 zzjNoU2qe9CD8ZIL0+71jeOs10xDf7LK36mSUVN/CIx9EEi6N9Of5U3lgIQ9IysW
 XvMggQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7haya-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 14:38:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7a8a773db4eso346792137.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 07:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790174334; x=1790779134; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QAPNeVaRXknRyms4HxR2TnjgMeCvlo5g9U21YYAAeco=;
 b=IMPlptOaOFphAmr3RmMbQShGx00+1iQOcczEIXCLbLvojdZk1UcSmrJT4PlGMn9V1r
 u3j9gAeH7ISEtMX289t475YVryDxuWqI/VJfVMkcs7QzbYl4aza6cBIU7kSX82hKeNRn
 jPJ2KK16zQKX/71ptyyR1CsnxeMvDFMmzky5NKT9eslycSibej7ZiLn+XIZ0LxN0qftZ
 TR0Uq18cfgebAorq+g3t+67yW5Ri+o0GCKbJIHyapj/2QoXHXWsXlcgDuMj+FhX311f8
 cWn8LLOk1qKnc3fqIZpPQLFlVwvr+9gleclvSYyTLhfQkf9BwYwCZCvY16G1I7nxIz6R
 aBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790174334; x=1790779134;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QAPNeVaRXknRyms4HxR2TnjgMeCvlo5g9U21YYAAeco=;
 b=17DiX7yID7UAuHmMegl4W5Y01FSV/pZg6Ogb1AHSPyHEspfFbEeMlI2UjHKQT4MY/6
 aay0eQp6Pk1k4yiIgu9v0fWWfbLO4qCoUgVVrvMGuirjdKfUB3fvJq7QlIRUXP7RWBN/
 0ATgtO+duerug5DLuOdVqSeiG3KNZbLiER4dy4qo5jx4hrSiGeAVq0ywdZ/UllaWPT4W
 DHAkqlW8fL/HW+ZyMA+Gc2pHWMG8KRjYW5t+SIyJAE7aGdgWvZXWN5w47pbEG3JXTNcW
 P8sRbPJvJqtjqfWS8e530fWwNs1TuVwdB5oO4JgF4VODj1llDJD8tnYwz5rL8nEDO3a/
 4QJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwTFJouQPy/V0CihevdCehKbwqpAThABMbmzP7URSJY04ZxKTjJ0BvTW3sFG81MRYqQdrBkulsszGq5@nongnu.org
X-Gm-Message-State: AFuF++kTx1RwqF/6u5ml0dFlD31xTChbVb+f0KOFMvvtl0IN6oge/mIV
 YHj0N26m5W57SGGcQRe3uaRSShqg+/25Ou8iFEpJp6SkYxIoKyIXj7WiIBOPnJe2UeIqCzGMbY2
 dKhd5g7U7eT+Kvl9uYg3yc0I5DgvjcPkc3C9jYLvbMwPOkzp8YQywUkWgZA==
X-Gm-Gg: AYBFou0K/HN6QIyT3JdFlsq1cttQ38ImxdmwhEIXjX/Zg7uVTEVf1rcYIVf3k91GbeP
 SEgJqefGrwJWo4pZSZmhCgXRoPYchR4uKY6QcgWmFVrfmzxhHi0+UjkftCzi+KIak3G2zuVULcK
 edYfexjPlvGSlbnEHoXxSupJ7DU8AVmbApSaZR6A0vC5qsCUKbUGGD/eNiuq8t74t1oZInm7fHG
 NOgO4wwNA4EQ3tFChAcTV0Te/FgR8sgVZj3V4AhWJ07rTR762JGk03XG+GRLj12NebjJnwYYp3g
 pKylCA4r7pTHqDGXcildEcZCVx8a1NvywC9twfRRmBIHsGieGfkGpupchnPh6O5T3oM46Sg7iAC
 1T9SKlT6+WHP/cwuOwNkvnoLiKquSrzc4OcvRN3xYV9YBqlQ=
X-Received: by 2002:a05:6102:f85:b0:7a7:198a:c2c4 with SMTP id
 ada2fe7eead31-7ac1ea9919bmr2646815137.34.1790174333635; 
 Wed, 23 Sep 2026 07:38:53 -0700 (PDT)
X-Received: by 2002:a05:6102:f85:b0:7a7:198a:c2c4 with SMTP id
 ada2fe7eead31-7ac1ea9919bmr2646789137.34.1790174333130; 
 Wed, 23 Sep 2026 07:38:53 -0700 (PDT)
Received: from [10.21.17.122] (161.170.88.92.rev.sfr.net. [92.88.170.161])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488684863d9sm7433840f8f.12.2026.09.23.07.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 07:38:52 -0700 (PDT)
Message-ID: <f890177a-4322-4207-93a0-7f690cae6b2d@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] target/riscv: Add vstimecmp support
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@processmission.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
References: <20220824221357.41070-1-atishp@rivosinc.com>
 <20220824221357.41070-4-atishp@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20220824221357.41070-4-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6xaw316AgX8pM8mkmAmlielEcIPm4660
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3e47f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=XFFLIW5kwC1urAZS/mNkYQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=JF9118EUAAAA:8 a=h0uksLzaAAAA:8 a=8eR_iU2aUeOL-paLwokA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=xVlTc564ipvMDusKsbsT:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXwstdW3WngFiE
 h5vvnU4GXr6MBgMuQidw5tgboKyIq/6sVU8FnwcVugPJ4YGCbIkhTe7nE95hChRusl6l1w6A4ut
 hI9KaE96V9o6MGI3c+t/cUchJBpq/9sejqNImZfB7ao6uoTCeGlJ3ToCzPIyIdtgzfnAD5H51Yj
 9Jq0S0B8E0vKYZYjAImfXAALuidE60I0/vYbB5C6iBSmyT8bLObMR4gdImav01U2iPJVIfqvp+v
 cqrSrPqea526XEHwUiNC51m+n2tQ1vZOUXl2vBe0m0igga5rMCUuOEb7oy+rAxsGMrfc40InHcw
 8N4dIoYexPUfoCjZ8+dflgDr2NB9gN7XWqoBC5SSFXfLTJt3mXk3SYTTcAgxNKHCj4sH27qZ55G
 n/yymr0UCSlhcc6yQp5bn6XU/rpSWqRpvO/7hfyZjN9KsJ5CJu7bP3XfFzeHgQZUeIuwB6ATsQ8
 +85s8/ZuSDtq8xl8bAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXw33pPvAGGLbV
 SDHIDuSoG8J8ltJ8NjtgXOtnXLrDCdHJRNkIfYsg+I+fsJbSEFhXyJFvQJP5PDPsNlipgVuaRPH
 F60G/vtl8M/qUDmhH/2ek3VU3l7ePtc=
X-Proofpoint-GUID: 6xaw316AgX8pM8mkmAmlielEcIPm4660
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058
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

Hi,

(now committed as 3ec0fe18a31fabfe999b480e4c21847ac0d51560)

On 25/8/22 00:13, Atish Patra wrote:
> vstimecmp CSR allows the guest OS or to program the next guest timer
> interrupt directly. Thus, hypervisor no longer need to inject the
> timer interrupt to the guest if vstimecmp is used. This was ratified
> as a part of the Sstc extension.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.h         |  4 ++
>   target/riscv/cpu_bits.h    |  4 ++
>   target/riscv/cpu_helper.c  | 11 +++--
>   target/riscv/csr.c         | 88 ++++++++++++++++++++++++++++++++++++--
>   target/riscv/machine.c     |  1 +
>   target/riscv/time_helper.c | 16 +++++++
>   6 files changed, 118 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d2529b757aab..d895a0af2c6d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -311,6 +311,8 @@ struct CPUArchState {
>       /* Sstc CSRs */
>       uint64_t stimecmp;
>   
> +    uint64_t vstimecmp;
> +
>       /* physical memory protection */
>       pmp_table_t pmp_state;
>       target_ulong mseccfg;
> @@ -365,6 +367,8 @@ struct CPUArchState {
>   
>       /* Fields from here on are preserved across CPU reset. */

         ^^^

>       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> +    bool vstime_irq;

Shouldn't vstime_irq be reset upon vCPU reset?

>   
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;

