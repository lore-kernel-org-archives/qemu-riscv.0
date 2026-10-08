Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86D1CA6007
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:43:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEe5s-0002Id-6M; Wed, 07 Oct 2026 22:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xEe5m-0002Hc-S6
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 22:42:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xEe5k-0001Bp-IA
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 22:42:46 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6981hlX11455055
 for <qemu-riscv@nongnu.org>; Thu, 8 Oct 2026 02:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ghvqalr9VubbBF1UNB05zhxlvXYmpog5gp8+epdWL7o=; b=CuHmPqAhuhgA1S+j
 uQkOGkoDZyaNbVPjzAReekViysmopoONlJWq66gstWtDjBLrzJTrDzeNEqqpm8sQ
 FCsUGlSYelwkp1oi7P/ahYcwPwHRVIKdjAwesTWT0KLIhm/K/Jic3ITf0D8mV0ZF
 il4bUMfa669/YaEwmr9HelvqGCnvBeTsZzg4YSEnCjE99Cwf/ku0owvdxBuJekri
 m3LEbU6oEZ/MaPbawLyhib1dduZLu6r/8ELMAKfpTi8TWTmAKfE/FoxYKy/Qrvjs
 x9Dh54+qbGJwlHOCUnUZIyPnktaK/81OOH2zY/3JDymUfQ+ITgCymzYPGUTv5YTL
 wYZpSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe38r0e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 08 Oct 2026 02:42:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5337f26ee19so133370391cf.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 19:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791427362; x=1792032162; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ghvqalr9VubbBF1UNB05zhxlvXYmpog5gp8+epdWL7o=;
 b=GRS80lC7mcP790tL4AXiHxzrwctFflNwPd9kBIRmOONtxeA3rLdWX69eBQtyobx5N+
 zI8f02aVpeZ0vF4r95Kyd9/NmFQ7R5Rt3Ullp77Z9nfTCjaALgSxEEyXdclcg1lvdIQA
 2TeWZUaeHU8oCCjoHR0SH0MtDud5FhXO7QqSoRFiUlRNk1RE3X7n/86xog9dJ1Gytpc7
 Ewn860kFfYiyfhyP6Qqv0YSIZVyQKyJuDKTyeJi3bAUOtHamEk+jzg3bqiZ37Pe/pF43
 LjGlDHzdW9fhnTM9U6uiyuYokufJuuANljg0Cs+d74mSqQIcJ/txtOEZmfZvCd9+eKT8
 oJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791427362; x=1792032162;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ghvqalr9VubbBF1UNB05zhxlvXYmpog5gp8+epdWL7o=;
 b=p6YNIFl75UyrQJPeWKwixHDG6jBEU7C8G000qCGIt6IvXcEu1CqLOgpjqLN5eWtl/j
 UhnDhS3MtHHCCDqVFhO2TRW9MBlyNzfe64hBim+KhCopqxBPeda4iV8dqNMkEILC1yFY
 q/7vkaLtJngOwM/SwH+rY1Q7aDuaberqjLBJHWhKgI/ZtAuKVjjFLi8NZuVOuue6MnyZ
 bgsBPxAVwv6QyhLXLXQG97mtmOdfcV7zSwxY0+vQD0rsrGC0/5dhD5e+BtFjKENgHM0g
 kzcdgVmNA2Imk+GSfGGqVPgm0cII8ZxILOdpYyqeddbZ4TMK+SbeoLCtCvetxwBb/2xm
 2G3w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwuu9954Qt2l4gLbLeNsNS7VQBBR4EG73Ds5+iOmjNOwb7pQBiP3g8ldyEr/PUjHY8blBI6CAQ12Brb@nongnu.org
X-Gm-Message-State: AFuF++n1qFVGpe3YOkA/ngR7olbbWjBEVhFBdylwk7TNasyr67yFc4ep
 bEr04AYepR7FXlWwm1GQoRwJmZKWFHpE6vfFP3rWmrCXvujTanvDshHsypYDbrboobuN2VotFMt
 PFYPcb2IymxVLBt4JyNVVny5fUDuZU2xtOVxlqiOwOWzgMQeApJcKkHZk5A==
X-Gm-Gg: AYBFou1ThZhXIy45PjWDRRbzmsjKTSdHLq9Wa6mG0QnRxlKUlK8JVjanM8apknvpwij
 TnjjLVM8qFPJR/3CNg6T3j4C1GxKwGs6VoRy/I8IBuc79l+a7nELhGWID6arYUClyqwg/ICgBLc
 48hLnMe+Ys44fEiEmamTCJQ97NFH6ki0PGe+QH8aqAGd2pavp95V6PBXAMZ19e3ljFc8dTFAC7S
 sra/E1N+4nSqwcuyexz0BvDQZSQj7I3aUAOBDzXQFgI3amKQnpYbcicyXoyhvsTvzrlPsUc3JAr
 YgPLHcIK5cxwKqrZmvGxEoTHNFFjg5j0cn+94vFXh/AmmBRH3/dpjTJ/G2dvd6K6tPsoZHBllWb
 TtXo1weEGgsRLRRZpIye7XrQRGFmidBa0nWxK
X-Received: by 2002:a05:622a:1b02:b0:535:52c:a2e7 with SMTP id
 d75a77b69052e-535755c3374mr81312011cf.44.1791427361526; 
 Wed, 07 Oct 2026 19:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1b02:b0:535:52c:a2e7 with SMTP id
 d75a77b69052e-535755c3374mr81311761cf.44.1791427361042; 
 Wed, 07 Oct 2026 19:42:41 -0700 (PDT)
Received: from [192.168.10.208] ([185.243.168.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53571d0e9d4sm35011191cf.0.2026.10.07.19.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 19:42:40 -0700 (PDT)
Message-ID: <73bc69a4-a3e6-47c8-9c7f-92443706b250@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:42:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] target/riscv: Implement Smsdid and Smmpt
 extension
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, chao.liu.zevorn@gmail.com,
 liwei1518@gmail.com, qemu-riscv@nongnu.org, rahul@summations.net,
 xiangyi.zeng@linux.alibaba.com, cxx194832@alibaba-inc.com
References: <20260723200325.24969-1-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723200325.24969-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac70322 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Adc43iEMMYzOb2FTIT2GVQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=xvfqbYfxAAAA:20 a=mDV3o1hIAAAA:8 a=JfrnYn6hAAAA:8 a=NEAV23lmAAAA:8
 a=GaQpPoNlAAAA:8 a=SRrdq9N9AAAA:8 a=bHPTYyKsEsybeaz2o74A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22 a=xF5q_uoM5gZT5J3czcBi:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMCBTYWx0ZWRfXzqSjUAf8mo9U
 7awgeAOUHTWNFYnU585xoAegQ5m1+Stn2mmG28twdIsMacduGjDp7WCkZfCce+H5WgxfaAsyMFc
 ZUF2CQW5So1VxqF4R2bPAUuepGcTJ+I=
X-Proofpoint-GUID: yqdwwyvoPnVSQR_p7mQSV2JjUZ0gn3-8
X-Proofpoint-ORIG-GUID: yqdwwyvoPnVSQR_p7mQSV2JjUZ0gn3-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMCBTYWx0ZWRfX51H0iV50pYSx
 pp9rxgvJVIKOASubP+qmVHIdeFMk3KftXj1lJPq8tdYiTm/FostGuI9kDGc6Nmp1FTtXL7l/oxB
 EHbwcrCq4TNJ9OIsdLCAOHVYgtn34n1x1YbJTjsTC/dSEAgdTPfxe557UAP80T/GxZKmmlWSE0S
 canjFvA4tSLWwj263Zi2cJ5pFW9frSQ06ylJLJ8scJXLTkKeSwyuoZjBZKO8OJETxE1ztFCP1DP
 KU7hQLnwv6W3P46UG24Qz+IvSVBvOFDhBRpEnYmMPweav6L3PRprD60VeobZ7nUmPk6/sxhPAG8
 QYKGfBBHqMrr54+boOlRIH26hjz5ozzvTwaC0L5wPoJM+kmVjneeYEGYgmXJAXp1CFPou6rIMNN
 4OXmoBN+8klqeXXkxnf8SMqp4jPUvlzAPGrL0fFAbMOt6AH/GSlU93DNfMf1jilultNyv1BhH50
 ichhgcpQesa9cl6OvCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080010
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=unavailable autolearn_force=no
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

Hi Zhiwei,


Sorry from taking this long to take a look at this work.  I am afraid I'll
need to ask you to send a v9 due to the following upstream changes, aside
from some review comments I made:

- upstream changed how tcg tests are invoked (we use meson now), i.e. you
need to add changes in tests/tcg/riscv64/system/meson.build instead of
Makefile.softmmu-target;

- upstream also changed how we declare things in disas/riscv.c.


If you send a v9 I'll prioritize it for review.  We can get this done for
11.2.


Cheers,
Daniel

On 7/23/2026 5:03 PM, LIU Zhiwei wrote:
> This patch set introduces support for the RISC-V Smsdid and Smmpt
> (Supervisor Domain Identifier and Memory Protection Table) extensions
> v0.4.9(https://github.com/riscv/riscv-smmtt/releases/tag/v0.4.9).
> Smmpt provides a hardware mechanism for fine-grained memory protection,
> checked after address translation, which is particularly useful for
> supervisor-level sandboxing and security monitoring.
> 
> The rfc patch set:
> https://mail.gnu.org/archive/html/qemu-riscv/2025-09/msg00216.html
> 
> Rahul Pathak is working on SMMPT OpenSBI support -
> https://lists.infradead.org/pipermail/opensbi/2026-July/010235.html
> 
> based on his QEMU SMMPT branch -
> https://github.com/pathakraul/qemu/tree/rpathak_smmpt_v1
> 
> As we all agree -
> https://patchew.org/QEMU/20260715145016.17369-1-zhiwei._5Fliu@linux.alibaba.com/
> , we will collaborate on this work and not duplicate efforts. Rahul will
> focus on OpenSBI upstream and I will update the QEMU patch set to v8.
> 
> Xiangyi will review the OpenSBI SMMPT patch set and may collaborate to
> upstream the other parts, such as SMSDIA and IOMPT.
> 
> v7->v8:
>      1. Update the mfence.pa and minval.pa instruction encodings to match the
>         upstream riscv-opcodes definition
>         (https://github.com/riscv/riscv-opcodes/pull/389/): mfence.pa now uses
>         funct7=0b0011001 and minval.pa uses funct7=0b0011011. The decoder,
>         disassembler and the system test are updated accordingly.
> 
> v6->v7:
>      The implementation is updated from the v0.3.4 specification to
>      v0.4.9. The main changes are:
>      1. Update the mmpt CSR number to 0x382 and msdcfg to 0x74E.
>      2. Update the mmpt register layout: the SDID and PPN field positions
>         changed and the RV64 PPN is now 44 bits.
>      3. Rework the MPTE format: the N (NAPOT) bit now lives at bit 2, the
>         non-leaf NAPOT form is removed, NAPOT leaf entries encode a single
>         XWR tuple plus a G granularity field, and non-NAPOT leaf entries
>         hold per-page XWR tuples.
>      4. Treat XWR=000 as "no access" and a non-leaf entry with N=1 as a
>         fault.
>      5. Enforce the Smmpt64 root-table PPN alignment (low 3 bits zero).
>      6. Rename the fence instructions mfence.spa/minval.spa to
>         mfence.pa/minval.pa.
>      7. Drop stale Reviewed-by tags on the substantially reworked patches.
>      8. Introduce the configurable "smmpt-sdidlen" CPU property.
>      9. Add disassembly support for the Smmpt.
>      10. Add bare-metal M-mode system tests.
>      11. Rebase to master.
> 
> v5->v6:
>      1. Use explicitly bit fields extract instead of mpte_union_t.
>      2. Use the same exception behavior for MPT valiation as PMP
>         valiation.
>      3. Use PAGE_* instead of MPT_ACCESS_* as they have same value.
>      4. Use address_space_*_le instead of address_space_* for SMMPT.
>      5. Only print SMMPT address check log when SMMPT is enabled.
>      6. Add implied rule for SMMPT as it depends on SMSDID.
>      7. Rebase to master.
> 
> v4->v5:
>      1. Rebase to master.
> v3->v4:
>      1. Add missing review tags.
> v2->v3:
>      1. Fix build error in patch 2.
>      2. Rebase to master.
> 
> rfc->v2:
>      1. When ext_smmpt is false or BARE mode, make other fields in mmpt
>         CSR zero.
>      2. Add patch 5 to fix smrnmi ISA string order.
>      3. Fix patch 6 smmpt and smsdid ISA string order.
>      4. Make smmpt and smsdid experiment extensions.
>      5. Add review tags.
> 
> LIU Zhiwei (11):
>    target/riscv: Add basic definitions and CSRs for SMMPT
>    target/riscv: Add smmpt-sdidlen property for the mmpt SDID field
>    target/riscv: Implement core SMMPT lookup logic
>    target/riscv: Integrate SMMPT checks into MMU and TLB fill
>    target/riscv: Implement SMMPT fence instructions
>    target/riscv: Fix smrnmi isa alphabetical order
>    target/riscv: Add disassembly for Smmpt instructions and CSRs
>    target/riscv: Enable SMMPT extension
>    target/riscv: Add system test for SMMPT extension
>    target/riscv: Add system tests for Smmpt52 and Smmpt64
>    target/riscv: Add system test for Smmpt34
> 
>   disas/riscv.c                                 |   9 +-
>   target/riscv/cpu.c                            |  60 +++-
>   target/riscv/cpu.h                            |   8 +
>   target/riscv/cpu_bits.h                       |  27 ++
>   target/riscv/cpu_cfg_fields.h.inc             |   3 +
>   target/riscv/insn32.decode                    |   2 +
>   target/riscv/meson.build                      |   1 +
>   target/riscv/riscv_smmpt.c                    | 339 ++++++++++++++++++
>   target/riscv/riscv_smmpt.h                    |  26 ++
>   target/riscv/tcg/cpu_helper.c                 | 119 +++++-
>   target/riscv/tcg/csr.c                        | 106 ++++++
>   .../tcg/insn_trans/trans_privileged.c.inc     |  30 ++
>   target/riscv/tcg/pmp.h                        |   3 +
>   tests/tcg/riscv64/Makefile.softmmu-target     |  12 +
>   tests/tcg/riscv64/smmpt-common.S              | 257 +++++++++++++
>   tests/tcg/riscv64/test-smmpt.S                |  85 +++++
>   tests/tcg/riscv64/test-smmpt34.S              |  97 +++++
>   tests/tcg/riscv64/test-smmpt52.S              |  91 +++++
>   tests/tcg/riscv64/test-smmpt64.S              |  98 +++++
>   19 files changed, 1354 insertions(+), 19 deletions(-)
>   create mode 100644 target/riscv/riscv_smmpt.c
>   create mode 100644 target/riscv/riscv_smmpt.h
>   create mode 100644 tests/tcg/riscv64/smmpt-common.S
>   create mode 100644 tests/tcg/riscv64/test-smmpt.S
>   create mode 100644 tests/tcg/riscv64/test-smmpt34.S
>   create mode 100644 tests/tcg/riscv64/test-smmpt52.S
>   create mode 100644 tests/tcg/riscv64/test-smmpt64.S
> 
> 
> base-commit: 499039798cdad7d86b787fec0eaf1da4151c0f05


