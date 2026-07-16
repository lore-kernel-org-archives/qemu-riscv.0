Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF2DC44512
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 18:46:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkR5w-0003n5-6h; Thu, 16 Jul 2026 14:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkR5q-0003mX-43
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 14:45:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkR5n-00082o-Js
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 14:45:57 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GHZwG1386097
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 18:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mmZxylGgR4VBT+W0L9gDebXQzAn7Oer8v5uC/gz439I=; b=gJETXO3KAR+5eHap
 uaeHeDmkR/oPVyOqmVHke/8d6w+DOaQ3BXMW3HHookYHPHWu2/ppMcF4A522dlNi
 s9WyLtO6OFRxeT8k0PCW71pL88GHkgPhhtITmvqyyi9+QHAtkOGKDfuzd86mmPxn
 2jmDSCRZPAfFT0Po0cc3rG76X5MuRamYzI14pSbMy4qB80HzgY6QV+uxv4Avrffq
 tWuDAxtDKqKIxZkYNldLJY9GOo3wP3HytlOMMl3fPPa0rDIjNAVYZygDDRMFeSeU
 nyKWSsMT53daf7nAHAbEwjRB5jOrEz7HE9f2BgVSbkM4dkl16USD+12ICu5C7JlQ
 T+TQSw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6g8d9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 18:45:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-90410c668adso124745706d6.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784227552; x=1784832352; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mmZxylGgR4VBT+W0L9gDebXQzAn7Oer8v5uC/gz439I=;
 b=jfCa8BG7kZ0Pk3ScdnGYfcjQiUPrikk220Ybl8+dUVCUF/6pFCZR/08+GHpq9gaYVx
 KaVVHAd18l3H9V4/Zni7UHcecUlRO/iX/owjBjThAOptttmFn778aLA3ToXmldHqRlpH
 3KJXy03djx6Kt4mkc/WF7sYZ8OczSFpWL6EHlBPYJnSePrxFSacIuDRL6/TTxNzwI869
 Nkot9N6TMlb9oKb0QpyNXFpfgWn+931hUIX7u38Ytvc3ndH1rXmuUsKVhAB1hsKf5YNp
 uL7bkSOaNowWSpME0ZtoJa0UYrHpj7xx5uMeMs256Qhuy5i8JbLtpJ0ZsauDeLpkCKI7
 CXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784227552; x=1784832352;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mmZxylGgR4VBT+W0L9gDebXQzAn7Oer8v5uC/gz439I=;
 b=K+ZI3JSXqnfiLm716RYx/wIFm9SbnqMwjyLYbSpK8uLremjBeQ4WZx0grbtjhNw4no
 tBDL+eTx41pMvJsfWjmkb72tSeJ/ShwPetAeqxe4+EjETlI0HluYwuk7PL4e8WYTnow0
 JCjEAK7Ja0KKquaNLPKMq8eiSpYlYrT2hotVIxN/eIYNZxEQggwhvo3nFkv4MMRolbnU
 K4HqkDLwy+W3P/ZZEvAlqlKl4OuqQ1317fXAi6rlXV/OOj4dbsp3LQcJg2T7xgofa767
 CqqqE6dgc+lFTuKJiTWi2MFZPWS3bDvI1yl+RwsSCKQpu69uXg4Py41At7sCViR/2nSi
 M4zQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrssJwat85i806WJNOKA85bXjivyhggW+FZoo76eqKeU9HcwiIPid0XDFo0RcNbS/309t0HKY2JRLKh@nongnu.org
X-Gm-Message-State: AOJu0YzObzldNFkAHPGJPlx9GHG3gAev6cH8OX2AnVY3DaVVy3JjshMe
 jF+wV6d9NnfSCuwr+0nqRXQDRcC9AE7t/vAHjv6tUAYHTIodgubvswG47OXTndpIvCjZxpFk425
 EpwN+bvWXtK7QQ59W8JhR32cS3dmtWnyDuE3Fo9ep7+wewM87bTnR8afP9A==
X-Gm-Gg: AfdE7cnZzg2JGOPYJL3AaddmTMrFM1I34k4NtBe6H+WibbZYpjgBztRn3VES6WlToSj
 p2DhY/FStDBB2VXjuIWAu9R4oIFio5RYDoTPUZg0TZpgQ+6wdTfLgTPJgH3hdEnU8fb2TBzOIMs
 USamsy7tIecNmyduj/t5Uallat4bytNuu8A+BughgY945T5NjCXQK6uJ6bCZ64qZJT39N598z0g
 JewagG9zLxHWMvpidSNevjE4IaR0vSJHQSu9ej2SDp51cCdovsYbabRQ810yWdUbcAzc/2kVv1x
 DFQMXriI4uudT8TZQmuPBsUZA87Q1Dfs1U3C0trz580KBxRpW7SB5OLHI8cWAABg2E9nCT7gm7o
 Xt4R/3+kTQubxCrj2gwGI9fSCDgqCPEiOjwUcOQ==
X-Received: by 2002:a05:6214:4292:b0:8f4:8950:37ce with SMTP id
 6a1803df08f44-90747b5f834mr156227926d6.0.1784227552638; 
 Thu, 16 Jul 2026 11:45:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4292:b0:8f4:8950:37ce with SMTP id
 6a1803df08f44-90747b5f834mr156227616d6.0.1784227552216; 
 Thu, 16 Jul 2026 11:45:52 -0700 (PDT)
Received: from [192.168.68.105] ([152.234.123.183])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd50e081dsm225174586d6.9.2026.07.16.11.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 11:45:51 -0700 (PDT)
Message-ID: <3b172ec2-1506-406f-96ad-763380023788@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 15:45:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] target/riscv: Support the true Zicclsm extension
To: Alistair Francis <Alistair.Francis@wdc.com>,
 "frank.chang@sifive.com" <frank.chang@sifive.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
References: <20260713035135.3996990-1-frank.chang@sifive.com>
 <6c50f31be3a11f34f9cf9f507cb7a7d1fdea1532.camel@wdc.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6c50f31be3a11f34f9cf9f507cb7a7d1fdea1532.camel@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE5MiBTYWx0ZWRfXxUY9YFymwTBq
 5OnWw6fYnVpoN7YF7MhYoSH+Qns8JgxN2vIGvVx7LgGu6SpIViYXuE2CMBJEhO5kzrWY0bKKYpf
 dvnxHhlq1+x8nQ8wfJ6ynBulsgcfopTCn39EdTiuLOZd02ZDh3J/JU7ciEilpyplurihE5TUO/R
 03Muaxzt6DRBq6N+AwZPNz793VfZwYC9JfMbku0ZFnE32l+uCb4jhUPhQ+sdlj60wWWzEs/E9n3
 5jTVgVtaV2Q1SwhV0oFjcO73ZfVg9NCR1UiFxhtTnkc0pNrTbfq95luV7QX0lA57CPQrIGod/0O
 S6KZKc/3ck5DODP8jyQRA+uhFszAHNGzI/lrlgubXXzoPZigHeeyDXBq2xIXkVF6LE+kv0Q770+
 /DmcKYYuaG1D8kEgGmx7cMtMJ3TfJLjEzbuqw0IgkEgiXJUq4ESycMqrxWFrf9ii/7KXtXpbOTR
 pvwvhdgS8HTEwLcHkuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE5MiBTYWx0ZWRfX5ySiPu9DOV0B
 Vm0h4hzN7ykMEZcOJa5IIXZ/XWHFf5MLzWttSth9W1eOYuo1k5EKAFxi+kdLJiPD1BfUCiM+uWi
 9I69B8MhF/perTngfi66znCCvspKTxs=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5926e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=szoPuAicwqWYzOEwwuIrwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ID6ng7r3AAAA:8 a=xvfqbYfxAAAA:20 a=pFyQfRViAAAA:8 a=2OcK-xkllQftIlSRpdIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AkheI1RvQwOzcTXhi5f4:22 a=oJz5jJLG1JtSoe7EL652:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: UE0s2CDuapd_rZl4riMUyvf5sKR37NZq
X-Proofpoint-ORIG-GUID: UE0s2CDuapd_rZl4riMUyvf5sKR37NZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160192
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



On 7/13/2026 1:01 AM, Alistair Francis wrote:
> On Mon, 2026-07-13 at 11:51 +0800, frank.chang@sifive.com wrote:
>> From: Frank Chang <frank.chang@sifive.com>
>>
>> Support the true Zicclsm extension so that we can trap misaligned
>> accesses
>> when Zicclsm is disabled.
>>
>> To enable/disable Zicclsm, simply set zicclsm=[true|false], e.g.:
>>    -cpu rv64,zicclsm=[true|false]
>>
>> QEMU will raise a misaligned load/store exception when executing
>> misaligned
>> load/store instructions if Zicclsm is disabled.
>>
>> Changelog:
>>    v6:
>>      * Reorder and squash Zicclsm CPU property and RVA22U64 profile
>> patches to
>>        make every single commit to pass `make check`.
>>    v5:
>>      * Add Zicclsm to RVA22U64 profile explicitly.
>>      * Rebase to the latest riscv-to-apply.next.
>>    v4:
>>      * Align ROM reset vector data at 8-byte aligned offsets.
>>    v3:
>>      * Enable Zicclsm for the compatible CPUs.
>>      * Rebase to the latest riscv-to-apply.next.
>>    v2:
>>      * Use (size_memop(size) | mo_endian_env(env)) to calculate MemOp.
>>      * Use (log2_esz << MO_ASHIFT) to calculate aligment MemOp for
>>        vector load/store whole register instructions.
>>
>> Frank Chang (6):
>>    target/riscv: Add Zicclsm CPU option
>>    target/riscv: Enable Zicclsm for the compatible CPUs
>>    hw/riscv: sifive_u: Align ROM reset vector data
>>    target/riscv: Support raising misaligned exceptions for scalar
>>      loads/stores
>>    target/riscv: Support raising misaligned exceptions for vector
>>      loads/stores
>>    target/riscv: Expose Zicclsm as a CPU property and update RVA22U64
>>      profile
> 
> This has missed the 11.1 release window [1]. So it will now need to
> include unit tests and a user of the extension (submitted toolchain
> support patches) according to [2].
> 
> 1: https://wiki.qemu.org/Planning/11.1
> 2:
> https://wiki.qemu.org/Documentation/Platforms/RISCV#RISC-V_Foundation_Extensions

zicclsm is supported by GCC since

-----------
commit 5c18df44fd1387653595869c9145c63fffb8cfac
Author: Monk Chiang <monk.chiang@sifive.com>
Date:   Thu Feb 1 17:14:18 2024 +0800

     RISC-V: Add minimal support for 7 new unprivileged extensions

     The RISC-V Profiles specification here:
     https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#7-new-isa-extensions

     These extensions don't add any new features but
     describe existing features. So this patch only adds parsing.

     Za64rs: Reservation set size of 64 bytes
     Za128rs: Reservation set size of 128 bytes
     Ziccif: Main memory supports instruction fetch with atomicity requirement
     Ziccrse: Main memory supports forward progress on LR/SC sequences
     Ziccamoa: Main memory supports all atomics in A
     Zicclsm: Main memory supports misaligned loads/stores
     Zic64b: Cache block size isf 64 bytes
-----------


I think we're good w.r.t a user/use for it.  Thanks,

Daniel



> 
> Alistair
> 
>>
>>   hw/riscv/sifive_u.c                         | 11 ++--
>>   target/riscv/cpu.c                          | 10 +++-
>>   target/riscv/cpu_cfg_fields.h.inc           |  2 +
>>   target/riscv/tcg/insn_trans/trans_rvi.c.inc |  6 ++
>>   target/riscv/tcg/insn_trans/trans_rvv.c.inc | 18 +++++-
>>   target/riscv/tcg/vector_helper.c            | 65 ++++++++++++++++---
>> --
>>   6 files changed, 88 insertions(+), 24 deletions(-)
>>
>> --
>> 2.43.0
>>


