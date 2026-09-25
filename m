Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73ADC98325
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 16:12:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xA8Tq-0000zM-Pw; Fri, 25 Sep 2026 12:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA8TC-0000g1-Fc
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:08:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA8T9-0007if-Hs
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:08:17 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68PG0gZ02515748
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mxB611+hWxACu6YmxPADCJtRZ0wFU7KHtrRoV4JAiV4=; b=h6Pn0XGyUnEerwj4
 0gFVt59oda3ZTK9GGqZlUzTWtCHuBKWwP5h+heAW+GeC2aoRjoxEXKQVkXV/pb+S
 OoGV7zhPGKo1OJWmg34hIqHrIX/qmPw4Xy6sIsWPZQZCOnzszLhwSFW1UxQeiJZc
 VNrKFkq6RtQQi4/2KxON3tuj0TZUXKP/5/M47ZobW1o0gX6+HIHAnTk4eG51L9pH
 CMnm0MYXCCIdIoTrXBbhh015b87PeT2itGk+DCjOD2ZrkqkmX6o9XcZExseqUP/N
 NMvt/oFfKzV4myV8GQMIioem30YNzP1FbnMEMq3LBvcju1JnrZytYGLgkqec8drr
 NFVFEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b7pj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:08:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91431adf55eso15348846d6.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790352491; x=1790957291; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mxB611+hWxACu6YmxPADCJtRZ0wFU7KHtrRoV4JAiV4=;
 b=WK2+9xn1qyO0geDYtPpOyz9KMwvSuFKMAwx9H64iWJUoTBlDNubsPqyHfM5i0HpCbl
 NSccwuS0cPKACTBFuSepRGJgiPyfqaCXGh/yQM1jHbEp692ynJA89rk35Hphgzfk0bJi
 UL4jDZ/WYInT21bvit9IE351ERaRcfvy/Qst9hrujrgi3+qEBqc4ZQWr+X+WCHiVAhz/
 pUb6y9EATyY/bLtcjoCbFp9fCnmkSTDunGguaimByqjtivEXRGmABrA4mq2JULZ5W3/1
 k7ww6RGzTL4GpxbfOoDwSJyS+ScvBiIGt0CMCr1zm5jKsyTopo6TR0pEMm1+M+NBsWPF
 aj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790352491; x=1790957291;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mxB611+hWxACu6YmxPADCJtRZ0wFU7KHtrRoV4JAiV4=;
 b=qJUhZ7/AZdo+UaEyMh1U5JVooQ1bTkRZ4JdlD8E2ePAKpSnfso1eKBdTg/mQkCXZ0C
 SjgsB6t60Lcxdk3jbYbp4Okrs/BQUDh+cWy7xP6yFsBEA8Uej4w+zmub2WLtCoD7RB4A
 PcHFYLtWvBZacPih2SxOkLUgnfJ9D+/bAdPVSZyGvJzi1Yjd0WWI+tCQj8GfKqcfKge5
 kEggHhob/sRRGgiYp69y+wt2gHXaftlBovFFKpGRLKQOyTNL1+3eDZH+Ac373ddOTDP6
 wfwp5UEnAl/YceX6/ZPv6yec2vgVMurAIv4aCt2OGJPBviEaHf7sbbNjNVFw5XbcPR0V
 oGoQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz5P2PmLZP3aGcCWz41p7k69WttzyJB2yebrAB1BcfbCWhI5lNoxHXnnos1exVShnE1T8wlvocMM9lR@nongnu.org
X-Gm-Message-State: AFuF++mZ91qp6rlmdYepfa+rSUZnuwg+R6lMTyKAk4IcVpHP/bXaCMuc
 x0ItSBcDkwtznT9M+2FrNmOpZNwN5TjalxZeLQqE62JRvw12lIbyveqcyYhsaCf5kxhny/zqS7p
 iXWUb6Tfm9y98Hst7pspQ6axeKzG5MM4wnH8MPRRWNLdYvUsZUFwBTaq/Bw==
X-Gm-Gg: AYBFou23vXJcjwCqiKnhL4i63NZZxxLOUiwA/ka/+V+KqFbC1mm8c8/pG8XjeC8r4B/
 1YdzNVIGCDPgu413vodaFfK2ouJ2LjbyTUIWWpr9qH7s4h5ixP7WPd6TYc+dNzSCoNJFKX7cArw
 CbdK287S7IyPVa4K0EWR87aa6EnqJzeAq6gdWTxvbfUcnGnKwv5RJ4+TWeIpuXI3HqBiHMi66sN
 DmNqnu3Dxd6WNgABZK0nX8voqf3SOTftCyaz7KvES3U+oTefsFA4xUq/hdpkneJNMB8ooQWAiyA
 vUC2w9ORyPi4l24v+4APhlWnCqs487bIH704MLcqrm0Z89Gce21FNjyt/oVpVCAM44hg8P9q8Qr
 Y2X7XmWMU584xQo2HW/Tvir9tlu/HS6vjPw==
X-Received: by 2002:a05:6214:1cc5:b0:8ef:e0d0:9fae with SMTP id
 6a1803df08f44-9142f68c10bmr51355436d6.14.1790352490550; 
 Fri, 25 Sep 2026 09:08:10 -0700 (PDT)
X-Received: by 2002:a05:6214:1cc5:b0:8ef:e0d0:9fae with SMTP id
 6a1803df08f44-9142f68c10bmr51354756d6.14.1790352489995; 
 Fri, 25 Sep 2026 09:08:09 -0700 (PDT)
Received: from [192.168.68.102] ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91430dd2858sm20134756d6.21.2026.09.25.09.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 09:08:09 -0700 (PDT)
Message-ID: <9055f131-2091-4c6c-83b9-64980be56911@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:08:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] target/riscv: Require Sscofpmf for non-fixed
 event overflow
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Zephyr Li <fritchleybohrer@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20260910-riscv-pmu-correctness-v2-0-5da5159a0c64@linux.alibaba.com>
 <20260910-riscv-pmu-correctness-v2-8-5da5159a0c64@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260910-riscv-pmu-correctness-v2-8-5da5159a0c64@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fXVAjIfwL1_Q6Sh_AgKHfhMvM5Dbhr2t
X-Proofpoint-ORIG-GUID: fXVAjIfwL1_Q6Sh_AgKHfhMvM5Dbhr2t
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69c6b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=XtTp2mjT3OapW3OsOAEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfXxK693y/3xMl1
 MzG4QBYhcQEGxGSoBNCkQ8XEyW6E4WR9VaBX3HjulFtM0VqseOl7KmAy1Oadw80YHsyJjs7W+QW
 I4mUnPqZwlkg1zrnaYA+yjhEyP8csoAa3TN7QyVxQ8B7SCNdtVXIGiZlJ5vo7Y+OFsAlbDDZaYI
 2en9PyQgpFsBwFB+m0N7uVISg89T5CFNzP/id+r/FNtNxkNu0GdQgazUAu68FYQXWrIuVVTu5gI
 M2w+D4frAd6Ds10zcdlOOD6x7JcWklKmxHauLbSe1Z1mpjc5fu3McHABvU9ADPY4teupHOpAf6d
 kT2ykP+AELZLn6PzoZnUscPoCZnljvh+4CWDoGIemk/iieTiXZjHDNPc4SUSW/F1Q0BONO40xZl
 Di5732XxM6rpg1LGqASwCkXxvVC0jMC7/lpP3ad/+mQfkIJ/Jew9nVitiGnKMpfCr5ShtCPVo6N
 ABHYi2k/s/JrD89RcfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX71DUbzyZL2yu
 VwLvFENihuBfVARiSuATR216KYj3ptrZ3hlfgMrXxkINxK6En519yMiKe22qTrtKUS57fH7kLsP
 JXU2MjZF0Dzd1JP6SabJTSYx4fHzfMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 9/10/2026 11:39 AM, TANG Tiancheng wrote:
> riscv_pmu_incr_ctr() sets OF and LCOFIP on wrap even when Sscofpmf is
> disabled. Use the shared overflow helper to require Sscofpmf and suppress
> notifications while OF is set without stopping the counter.
> 
> Test DTLB overflow with Sscofpmf enabled and disabled, including
> notification suppression and continued counting.
> 
> Fixes: 14664483457b ("target/riscv: Add sscofpmf extension support")
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/pmu.c                      |   6 +-
>   tests/tcg/riscv64/sscofpmf-event-overflow.S | 103 ++++++++++++++++++++++++++++
>   tests/tcg/riscv64/system/meson.build        |  15 ++++
>   3 files changed, 119 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
> index 16942e53489cd5a2d2dd055fdffef07d04d59465..2f600c5a0fc2d7ba380ef34f89af6366e3e27884 100644
> --- a/target/riscv/tcg/pmu.c
> +++ b/target/riscv/tcg/pmu.c
> @@ -448,11 +448,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
>           counter = &env->pmu_ctrs[ctr_idx];
>           if (counter->mhpmcounter_val == max_val) {
>               counter->mhpmcounter_val = 0;
> -            /* Generate interrupt only if OF bit is clear */
> -            if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
> -                env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
> -                riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
> -            }
> +            riscv_pmu_set_overflow(env, ctr_idx);
>           } else {
>               counter->mhpmcounter_val++;
>           }
> diff --git a/tests/tcg/riscv64/sscofpmf-event-overflow.S b/tests/tcg/riscv64/sscofpmf-event-overflow.S
> new file mode 100644
> index 0000000000000000000000000000000000000000..cce06da10f9c7c20c18c7863b58b6dd724c45182
> --- /dev/null
> +++ b/tests/tcg/riscv64/sscofpmf-event-overflow.S
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Non-fixed event overflow with and without Sscofpmf. */
> +
> +#ifndef EXPECT_SSCOFPMF
> +#define EXPECT_SSCOFPMF 1
> +#endif
> +
> +	.option	norvc
> +	.option	norelax
> +
> +	.text
> +	.global _start
> +_start:
> +	/* Unexpected exceptions report the current check number. */
> +	li	t4, 1
> +	lla	t0, exit
> +	csrw	mtvec, t0
> +	csrw	mie, zero
> +	csrw	mip, zero
> +	csrw	mcountinhibit, zero
> +	csrw	mhpmevent3, zero
> +	li	t0, -1
> +	csrw	mhpmcounter3, t0
> +	li	t0, 0x10019		/* DTLB read miss */
> +	csrw	mhpmevent3, t0
> +
> +	/* One load after flushing the TLB must wrap the counter to zero. */
> +	sfence.vma
> +	lla	t0, first_page
> +	lw	t1, 0(t0)
> +	csrr	t0, mhpmcounter3
> +	bnez	t0, exit
> +
> +	/* Only Sscofpmf turns that wrap into OF and LCOFIP. */
> +	li	t4, 2
> +	csrr	t0, mhpmevent3
> +	srli	t0, t0, 63
> +	li	t1, EXPECT_SSCOFPMF
> +	bne	t0, t1, exit
> +	li	t4, 3
> +	csrr	t0, mip
> +	srli	t0, t0, 13
> +	andi	t0, t0, 1
> +	bne	t0, t1, exit
> +
> +	/* Clearing LCOFIP alone must not re-enable overflow notification. */
> +	li	t0, 1 << 13
> +	csrc	mip, t0
> +	li	t0, -1
> +	csrw	mhpmcounter3, t0
> +	sfence.vma
> +	lla	t0, second_page
> +	lw	t1, 0(t0)
> +	li	t4, 4
> +	csrr	t0, mhpmcounter3
> +	bnez	t0, exit
> +	li	t4, 5
> +	csrr	t0, mhpmevent3
> +	srli	t0, t0, 63
> +	li	t1, EXPECT_SSCOFPMF
> +	bne	t0, t1, exit
> +	li	t4, 6
> +	csrr	t0, mip
> +	li	t1, 1 << 13
> +	and	t0, t0, t1
> +	bnez	t0, exit
> +
> +	/* Overflow notification must not stop event counting. */
> +	sfence.vma
> +	lla	t0, third_page
> +	lw	t1, 0(t0)
> +	li	t4, 7
> +	csrr	t0, mhpmcounter3
> +	li	t1, 1
> +	bne	t0, t1, exit
> +	li	t4, 0
> +
> +exit:
> +	lla	a1, semiargs
> +	li	t0, 0x20026		/* ADP_Stopped_ApplicationExit */
> +	sd	t0, 0(a1)
> +	sd	t4, 8(a1)
> +	li	a0, 0x20		/* TARGET_SYS_EXIT_EXTENDED */
> +	.balign	16
> +	slli	zero, zero, 0x1f
> +	ebreak
> +	srai	zero, zero, 0x7
> +	j	.
> +
> +	.data
> +	.balign	4096
> +first_page:
> +	.word	0
> +	.balign	4096
> +second_page:
> +	.word	0
> +	.balign	4096
> +third_page:
> +	.word	0
> +	.balign	16
> +semiargs:
> +	.space	16
> diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
> index 1dd0402631036d0d377bb90d7cb1da2bae34ead4..13ee7954ef4f09559a02a3730fb017ccf2cfd882 100644
> --- a/tests/tcg/riscv64/system/meson.build
> +++ b/tests/tcg/riscv64/system/meson.build
> @@ -99,6 +99,21 @@ tests += {
>     },
>   }
>   
> +tests += {
> +  'sscofpmf-event-overflow.S': {
> +    'cflags': cflags,
> +    'qemu_args': ['-cpu', 'max', qemu_args],
> +  },
> +}
> +
> +tests += {
> +  'sscofpmf-event-overflow.S': {
> +    'exe_name': 'sscofpmf-event-overflow-off',
> +    'cflags': cflags + ['-DEXPECT_SSCOFPMF=0'],
> +    'qemu_args': ['-cpu', 'max,sscofpmf=false', qemu_args],
> +  },
> +}
> +
>   tests += {
>     'sscofpmf-cycle-overflow.S': {
>       'cflags': cflags,
> 


