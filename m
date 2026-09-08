Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA3AC79F82
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:02:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3yFE-0004Y5-JF; Tue, 08 Sep 2026 12:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3yF8-0004UF-9W
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 12:00:18 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3yF5-0001Ha-JL
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 12:00:18 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 688Fe2tb2738897
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 16:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GIZpRZawR3KRz/ytpsKcV4EXw08XRfZ2NcVjp/svCQ8=; b=l5wLfJtAPdrVE6Qn
 nt8srEHorwl7aHz3WA/WwPg9MiJf2JScPepbFvzg4S8K6sn+IKtVwfzasRwNlOYk
 NEN0h13vPRKRgliidE80zuzkvCbE/V/VkW0JrDX9/AoxOocdKaEIwRB3T7/m7vxj
 uyX/VbqDA4NHNWyCYFM0Nk89U6jYtrcV/7EIVmOF20bCqKVMVAHTR5djX3G5aCgh
 MO+eXS3OMlea/U247wVSrA92yJnCoxcVc9h2GpIL78f9ZqMoUcA5EUcit4C2ipQP
 bohPgq8w6tRtkJ2wtUyK87EMD8QHClY1Fl0Vnyostq4U5mzpLtiiR5554Pd6q2vB
 LIF/rA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjk00w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 16:00:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91064f6e75bso22508256d6.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788883213; x=1789488013; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GIZpRZawR3KRz/ytpsKcV4EXw08XRfZ2NcVjp/svCQ8=;
 b=Jxy+G93HM7HE5PqDTaqwm0l1oPZFjma5NKSHVr3l+XMq08odMcXXLokLJocfbKvMrv
 0r9SZcUQWsHoyGtAcp5X/+SQ6fikvFw9iZwQVXDmqrjHBTh8CB0zt2pHre1OfzufQMhI
 DoCc8JWvLOfvDCCZkeiWCno/Y/ZQwiZNlvzPFI6K5D+cU7oMzhgkWa0SD28Ib9a59xcf
 KN2HAL2ReLCHHbHBmPAgCgCHus36X6/3jhQnb1VggUBRpJYZ/Tb0xCdG0gYKsuK+hUVb
 3JI/lbvJ/L0rq8dti8s27EzCr1CUTY02mFW8GpAySytQ7pjoWFjguSq76p+FB95FCR3j
 QUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788883213; x=1789488013;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GIZpRZawR3KRz/ytpsKcV4EXw08XRfZ2NcVjp/svCQ8=;
 b=ltluL4Zu44jqoSwcZWI855upFe4VioDQYxEDN1eWM06ijuKbJk6brsW+z74JTi97rs
 uHk6yHPAe0ihyq3uTHrjqb58SOxKKtys1l7fbzknkCViOVGP7EhpRGhk++Vo/7erZPCZ
 P93pzkUYUj075qAuPJq+QBw5ywpJ2CbHZDSalZootG+01PzI+lAbI3ilc2QeTbdj7UM8
 xb95rCncY6H0Q1TN6e/CYy+A2QUs+wzNapbBIVWoZ12z68nWlvNY/8I5tJGLxhYpkgGF
 0FdKEHjdqxHClZaQBt4pl21qVlyc8/93aYv23j0e8ZN5wiwJFmUYCdQCrWFnB/x4N4L9
 SELQ==
X-Gm-Message-State: AFuF++m9W0IVaHp0RW7l2jMuGwOMVX3oPtXJHsBvlWjhRXk6HDsdgPPi
 vA60ii6dje4Ra+Ps+G+FVcmTxONxYEeTgpOQPzRBDaBbc27dHnH19N/3NTE1CNLnmWKni78aVs4
 gOsw4KGNMsLJPdTVB+tzj76trpahC+DwrYwYK4m3/FAdZR78aXkvddExzBg==
X-Gm-Gg: AYBFou3h3sTKbokRWUqia7VoMBW82O/VcRXs+I1bCR9UjY5s3PmqCXpm9rUti9O2R/l
 pCOgvkTTL/ZT87qt2Smoq0057lay37SFJjv4KP3zhvvb+/x4Sggzgc1DkKBlTCF8gQyDzOQ8XDE
 3pgJQRye/qefBGrwmFwcZo81MplcjrQgcs5P6j3XEWGXl0t4bcOx8fC0XbCXE4rSKtHn3jv5tS9
 leSh4QYN9GMcr0qxcaSs2v9dZKj/UnOLdzabd+MnU4xYLPCQuAZQMsb3tKKPLENUli2lT/pCquR
 ULxPwuSorQIylrKc7P8AtZLd5u1h9eG/jnYOVxotWsAocOu7IFXN1esqh0yWWWoU6U5be8Sj8yq
 wZN2sd2l8UKYfr/7NKEvdrcELjT5leWp1yZY=
X-Received: by 2002:ad4:4ee4:0:b0:90c:b635:df18 with SMTP id
 6a1803df08f44-9103f003460mr368011756d6.27.1788883211614; 
 Tue, 08 Sep 2026 09:00:11 -0700 (PDT)
X-Received: by 2002:ad4:4ee4:0:b0:90c:b635:df18 with SMTP id
 6a1803df08f44-9103f003460mr368009086d6.27.1788883210639; 
 Tue, 08 Sep 2026 09:00:10 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91058416847sm53399996d6.4.2026.09.08.09.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 09:00:10 -0700 (PDT)
Message-ID: <fe6bccf3-f845-4bcb-89a5-119ac95c3773@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:00:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: fix RV32 fixed counter accesses
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260905092810.660-1-fritchleybohrer@gmail.com>
 <61be29dd-2aab-4d7e-b199-10aa49b82418@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <61be29dd-2aab-4d7e-b199-10aa49b82418@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfXzqq1LWTHvLzV
 +1lzUQCb2yAIqqG6NsWL6cf4FkXedo32QCbLqTh8z2lqVnOraTtZeeconhjchZI8C/ZkcvDcL6U
 MkBs6LXFf47r0aUJYouNcrTt7iS7cEM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfXzd5Vqze96M36
 l9zEosTzPeLzXD/WdLL3zOcUGsnSOKkIcRhu2zgCY4ewHFyr9yAYlNvhj1ynGSFHyLsH/4/yQDj
 7g8BBtGGhZVQGef9dOO1BCNB2Q+LcbFy9mBwEdRa8QXV7LV5bSSGWKN84f0fBRNPNvTM4ZxMcGB
 yWsF4hVXB5+tN6prYqzmlGV4ZAJKmULf7PqdtNTUW3uYDIRAXo2ZkIQkRxvPosJW6rbyjIxZtHj
 8Aqiclhd171Iq4IEtDIOfv6He1GH5ubp/bDicHLVOiMzWoaV7jAmQqZJn6ASbOksTMtOcqF2uFH
 TARnfmCvaXX66Cm3xfCs+m/s3kvKgL0ctY88/VjTqvHKJb9/9zlSBJuaqVbvyCQ61ogQp1EKbIc
 J0FIGwMUnkHnM4PJTFX+mPZNKqHKaIfBBqkF9xm7JYVzHVbyzPFuB4wBxdixnuah5MtUHAr7ypj
 cGGLbKO98aO+8UK37nw==
X-Proofpoint-ORIG-GUID: EWPINmfo-oiZ-yq3JOo0vp3QJ4a4WUcK
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa0310d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BClNRUz20HDGL1W_lggA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: EWPINmfo-oiZ-yq3JOo0vp3QJ4a4WUcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080172
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



On 9/8/2026 8:17 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 9/5/2026 6:28 AM, Zephyr Li wrote:
>> Since commit cfc96df65e01, riscv_pmu_ctr_get_fixed_counters_val()
>> returns the complete 64-bit fixed-counter value. The RV32 counter
>> access paths, however, still perform parts of the offset calculation
>> on separately extracted 32-bit halves.
>>
>> In particular, riscv_pmu_write_ctrh() deposits the low 32 bits of the
>> complete fixed-counter value into the high half of mhpmcounter_prev.
>> riscv_pmu_read_ctr() also subtracts a 32-bit half of the previous value
>> from the complete 64-bit fixed-counter value. Consequently, writes to
>> mcycleh can be lost and carries between the low and high halves are not
>> handled correctly.
>>
>> Keep the fixed-counter offset calculation entirely in 64 bits. Before
>> a running counter is partially written, materialize its current
>> architectural value and reset the fixed-counter baseline. On reads,
>> calculate the complete 64-bit counter value before extracting the half
>> requested by RV32.
>>
>> Add an RV32 system TCG test for high-half writes, low-to-high carry, and
>> preserving the carried high half across a subsequent low-half write.
>>
>> Fixes: cfc96df65e01 ("target/riscv: Remove upper_half from riscv_pmu_ctr_get_fixed_counters_val")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4219
>> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
>> ---
> 
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Actually there's a test related change I would like to suggest:



> 
>>   target/riscv/tcg/csr.c                    | 32 ++++++++--------
>>   tests/tcg/riscv64/Makefile.softmmu-target | 12 ++++++
>>   tests/tcg/riscv64/test-mcycle-rv32.S      | 45 +++++++++++++++++++++++
>>   3 files changed, 74 insertions(+), 15 deletions(-)
>>   create mode 100644 tests/tcg/riscv64/test-mcycle-rv32.S
>>
>> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
>> index 002f7e69c1..ffdd5c4aa6 100644
>> --- a/target/riscv/tcg/csr.c
>> +++ b/target/riscv/tcg/csr.c
>> @@ -1337,23 +1337,23 @@ static RISCVException riscv_pmu_write_ctr(CPURISCVState *env, target_ulong val,
>>       int deposit_size = rv32 ? 32 : 64;
>>       uint64_t ctr;
>> -    counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
>> -                                         0, deposit_size, val);
>> -
>>       if (!get_field(env->mcountinhibit, BIT(ctr_idx)) &&
>>           (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>>            riscv_pmu_ctr_monitor_instructions(env, ctr_idx))) {
>>           ctr = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx);
>> -        counter->mhpmcounter_prev = deposit64(counter->mhpmcounter_prev,
>> -                                              0, deposit_size, ctr);
>> +        counter->mhpmcounter_val += ctr - counter->mhpmcounter_prev;
>> +        counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
>> +                                             0, deposit_size, val);
>> +        counter->mhpmcounter_prev = ctr;
>>           if (ctr_idx > 2) {
>>               riscv_pmu_setup_timer(env, counter->mhpmcounter_val, ctr_idx);
>>           }
>>        } else {
>> +        counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
>> +                                             0, deposit_size, val);
>>           /* Other counters can keep incrementing from the given value */
>>           counter->mhpmcounter_prev = deposit64(counter->mhpmcounter_prev,
>>                                                 0, deposit_size, val);
>> -
>>       }
>>       return RISCV_EXCP_NONE;
>> @@ -1363,20 +1363,22 @@ static RISCVException riscv_pmu_write_ctrh(CPURISCVState *env, target_ulong val,
>>                                             uint32_t ctr_idx)
>>   {
>>       PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
>> -    uint64_t ctrh;
>> +    uint64_t ctr;
>> -    counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
>> -                                         32, 32, val);
>>       if (!get_field(env->mcountinhibit, BIT(ctr_idx)) &&
>>           (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>>            riscv_pmu_ctr_monitor_instructions(env, ctr_idx))) {
>> -        ctrh = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx);
>> -        counter->mhpmcounter_prev = deposit64(counter->mhpmcounter_prev,
>> -                                              32, 32, ctrh);
>> +        ctr = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx);
>> +        counter->mhpmcounter_val += ctr - counter->mhpmcounter_prev;
>> +        counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
>> +                                             32, 32, val);
>> +        counter->mhpmcounter_prev = ctr;
>>           if (ctr_idx > 2) {
>>               riscv_pmu_setup_timer(env, counter->mhpmcounter_val, ctr_idx);
>>           }
>>       } else {
>> +        counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
>> +                                             32, 32, val);
>>           counter->mhpmcounter_prev = deposit64(counter->mhpmcounter_prev,
>>                                                 32, 32, val);
>>       }
>> @@ -1407,12 +1409,11 @@ RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
>>       bool rv32 = riscv_cpu_mxl(env) == MXL_RV32;
>>       int start = upper_half ? 32 : 0;
>>       int length = rv32 ? 32 : 64;
>> -    uint64_t ctr_prev, ctr_val;
>> +    uint64_t ctr_val;
>>       /* Ensure upper_half is only set for XLEN == 32 */
>>       g_assert(rv32 || !upper_half);
>> -    ctr_prev = extract64(counter->mhpmcounter_prev, start, length);
>>       ctr_val  = extract64(counter->mhpmcounter_val, start, length);
>>       if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
>> @@ -1431,7 +1432,8 @@ RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
>>       if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>>           riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>>           uint64_t cntr = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx) -
>> -                                                             ctr_prev + ctr_val;
>> +                        counter->mhpmcounter_prev +
>> +                        counter->mhpmcounter_val;
>>           *val = extract64(cntr, start, length);
>>       } else {
>>           *val = ctr_val;
>> diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
>> index 6a219c306c..15c7371acd 100644
>> --- a/tests/tcg/riscv64/Makefile.softmmu-target
>> +++ b/tests/tcg/riscv64/Makefile.softmmu-target
>> @@ -28,6 +28,18 @@ EXTRA_RUNS += run-test-minstret-ecall
>>   run-test-minstret-ecall: test-minstret-ecall
>>       $(call run-test, $<, $(QEMU) -icount shift=1 $(QEMU_OPTS)$<)
>> +RV32_CFLAGS = -march=rv32im_zicsr -mabi=ilp32
>> +CLEANFILES += test-mcycle-rv32

Note that you're adding specific rv32 tests in tests/tcg/riscv64/Makefile.softmmu-target.
A better place is the tests/tcg/riscv32/ dir - we want to avoid mixing rv32 stuff in
rv64 makefiles and vice-versa.

I suggest keeping tests/tcg/riscv64/Makefile.softmmu-target untouched and
use tests/tcg/riscv32/ for this new test.


Thanks,
Daniel

>> +
>> +test-mcycle-rv32: test-mcycle-rv32.S $(LINK_SCRIPT)
>> +    $(CC) $(CFLAGS) $(RV32_CFLAGS) $< -Wa,--noexecstack -c -o $@.o
>> +    $(LD) -m elf32lriscv $(LDFLAGS) $@.o -o $@
>> +
>> +EXTRA_RUNS += run-test-mcycle-rv32
>> +run-test-mcycle-rv32: test-mcycle-rv32
>> +    $(call run-test, $<, \
>> +      $(QEMU) -cpu rv32 -icount shift=1 $(QEMU_OPTS)$<)
>> +
>>   EXTRA_RUNS += run-plugin-doubletrap
>>   run-plugin-doubletrap: doubletrap
>>       $(call run-test, $<, \
>> diff --git a/tests/tcg/riscv64/test-mcycle-rv32.S b/tests/tcg/riscv64/test-mcycle-rv32.S
>> new file mode 100644
>> index 0000000000..189d1e13a2
>> --- /dev/null
>> +++ b/tests/tcg/riscv64/test-mcycle-rv32.S
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +    .option    norvc
>> +
>> +    .text
>> +    .global    _start
>> +_start:
>> +    /* Exercise writes while mcycle is running. */
>> +    csrw    mcountinhibit, zero
>> +    csrw    mcycle, zero
>> +
>> +    /* A write to the high half must be immediately observable. */
>> +    li    s0, 0x1234ffff
>> +    csrw    mcycleh, s0
>> +    csrr    t0, mcycleh
>> +    bne    t0, s0, fail
>> +
>> +    /* Check carry from the low half into the high half. */
>> +    li    s0, 0x12345678
>> +    csrw    mcycleh, s0
>> +    li    t0, 0xfffffff0
>> +    csrw    mcycle, t0
>> +    .rept    32
>> +    nop
>> +    .endr
>> +    csrr    t0, mcycleh
>> +    addi    s0, s0, 1
>> +    bne    t0, s0, fail
>> +
>> +    /* A low-half write must preserve the carried high half. */
>> +    li    t0, 0x22222222
>> +    csrw    mcycle, t0
>> +    csrr    t0, mcycleh
>> +    bne    t0, s0, fail
>> +
>> +    li    t0, 0x100000
>> +    li    t1, 0x5555    /* FINISHER_PASS */
>> +    sw    t1, 0(t0)
>> +    j    .
>> +
>> +fail:
>> +    li    t0, 0x100000
>> +    li    t1, 0x13333    /* status = FINISHER_FAIL, code = 1 */
>> +    sw    t1, 0(t0)
>> +    j    .
> 


