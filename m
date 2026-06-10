Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32505CD8CB9
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 12:29:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXI38-0003xC-7k; Wed, 10 Jun 2026 08:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXI31-0003qM-9e
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 08:28:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXI2z-0002sF-9U
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 08:28:43 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65ACBiin1138115
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 12:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z/pOEDabIAHr7vWEouhlt1hrJIhDp4qoZ9CKkBm8h1M=; b=MOHOZgDRDVvAl1ot
 Ow/Y/e6ipiMntzA6ahYpqBdJlCGCgvIW87q9QVy8k2jK0Gy85PqsayQ1Zle+9g7T
 u0W5dA4GOqeFi3E3OvMkVGVcYMkY0C/KsCJOytjGwGp3vDcHhaYWRlAwXImJWWpu
 TYCEMFfMqXl1gWZqHLoTCSd243eJ9ywiQTtWkMBdvjUoGrDivShkQk6CUgLv7pNw
 iElgs/mDwNlOh/B/N1+TK0h6lRyHYZVg/zZ+7jFhRIzhtAY10OCDJTyecAXHVNaW
 O2W+9ZiX/dVMmodW2F9uK6ovqqWMIguotEZCUqJdbytRLJGyUtsh8oXdP7KQUCSS
 m4DMXA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jd2j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 12:28:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5a2afc494efso9049026e0c.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781094518; x=1781699318; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z/pOEDabIAHr7vWEouhlt1hrJIhDp4qoZ9CKkBm8h1M=;
 b=eUdV3Z1OO5j2oLuVvArWl0yGjiWnpXvIictKBIlfPRMkodZtLY1MC7wpXOs33LCT6p
 Cpby2ibdE0P0Eu6SjidoCxDRpMAHqPJlucnFV2SuCWlR9ZSMl+TaOLl0rteHZYn9XDLr
 oYrwr6QWxrYQNP9I4eKrHFpJNlt2ubf4wq9TqnfBWLIYfQqv1WdZipdwIiotMi+94Lqo
 fbBeKV+u2qT1LcMItUC+19O2YhI5ar6Ffogm+YOKR3dybCfkyMhE8QLV6L7goSbZNL4S
 +d3FDqXOzBwcUrY4DusQAvEuxSZdpizRby6GetfNfPTLEjf6DT1LDjo2P3L/32Oe+3b4
 v/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781094518; x=1781699318;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z/pOEDabIAHr7vWEouhlt1hrJIhDp4qoZ9CKkBm8h1M=;
 b=k/kFaei+wt0jK6L4ZshOBWiywHkKl8g8aY20CkWvO01dV+QwwTjc2UqG6RnLX61CRa
 mJixP3+QxnSHgxFK+/WiRXak8m2mReXARAhemEXS/wN0lVtAjyzb7IFPtJapTdCUShrq
 /9krx6HzmB4OabpP/LcMc66LYLbIJXtUpQviHqxlIU0G5MWEaVI05YkMWFW9KAwKZACR
 EQQh4bRcqAr+EZxzMP05+TToX17lBDTWLSYrKGoMboNHIhksy/RhcZ5XMos8u1YBbECy
 NbWxXQ7eGPWo3KvY5qyZ+cyau6I0C5HzD8qs8pnbIMmXNsNsICZLS/cinxPRvZNBHr36
 Pu1g==
X-Gm-Message-State: AOJu0Ywv54gUhtagndocUt3cHlD0b8G6VK+Ba30pQkZ20qQEdyW01ylA
 P93HEx8Kq+C1dDEzaFvoWx/+g/nIgn8T9iDdg/yO1O8SNMsB1RL9GOzvEyUN7qax+lx3A04i8TC
 Q+v8htk8IXXkzzgD4xP+c3v1KG2J3rR6p0QUw11mnUMbdK06pFnFoNZzI+w==
X-Gm-Gg: Acq92OHkMMFVYME7S39B+ACkz+rOfQV5ElyNCW6qkCbdzV2TtTkxapfz10mPcHXNMHB
 zV8QiCDxb79Ga8S5uioZjU2xJI1zeJ+IL+15xB/7iJsX5OygELzXXA1oGGprX8PASkLqqNjxg7h
 t0a9k7gar8RmBScTT5rNI0qert28mr0FrpGLawTQGmLedwXwOFdZGv9eVuq4kdsMn4Vqy49eCTg
 2excdX0Dq0a022lG5ADiDq2BPmFiYpR30WJ2LabDT1e6GbxW4kf8Ig6GYbV93MDkQ12T7sD0rOW
 wQ9HE0LRtbmB49AD0eJ0FRkavrqJzDrdjJnJhweV5lFfHR7yAVsSDqU2KF1teBNpKXkWCFUPJHd
 TOwr5JvuU/PPBbDRGgy6fHVy9DgFsVRZ5jMmIxWvSofqPCg9/O8lyoBkEhlZnA1ysvN6Q
X-Received: by 2002:a05:6102:80a4:b0:6dd:ea46:e3d0 with SMTP id
 ada2fe7eead31-6ff068c6a31mr13859915137.19.1781094518099; 
 Wed, 10 Jun 2026 05:28:38 -0700 (PDT)
X-Received: by 2002:a05:6102:80a4:b0:6dd:ea46:e3d0 with SMTP id
 ada2fe7eead31-6ff068c6a31mr13859903137.19.1781094517480; 
 Wed, 10 Jun 2026 05:28:37 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-6eb5745d325sm19749199137.4.2026.06.10.05.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 05:28:36 -0700 (PDT)
Message-ID: <2a49811b-65b6-48fa-ac0e-b80331254097@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 09:28:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: add 'trigger-count' debug property
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260609213905.1126795-1-daniel.barboza@oss.qualcomm.com>
 <6db02c91-83fb-4021-91ec-72e6b56afeb3@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6db02c91-83fb-4021-91ec-72e6b56afeb3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a295877 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HKLopmrgcaturD48b0AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExOSBTYWx0ZWRfX0F8LGcDKCKp8
 weUvgUXKb0RQV3cLuOhIUfXp427gMPRPf2l0xUtepc9osMuzTFkqQa9H7lawjeF+pHvm1UjrTpL
 4rzahZBJopTiyqFI99YTy7JDJVPoXYlucZ8EMO1ItxwFpDBLsNnVbS2I3jgaE7UI7dKw6aK+5g0
 jjANBFQf+usd1Cv8hbWUnH/JHd+COGHq/EmTLmdTCFzrmkHyatYWyfLKMDKYnm0AKPvZt7XXr+q
 KAJiUqP/S2SlJG0dBOR+NtM9MZh9M+3tvsT3nkfMKJX9KEn9IV37G08gmFWUWFBmu++FCNeR5/v
 RyaPeNt7dIs+2euLYLAA868/UeoOU17CesfmZtl5LOdX2/HnJ5GyBL4fmbENZAem14wASyBM2ke
 upz26vf3HnDfGt0Hag+63sWZfBKhbNhThz2q0OhDgGeoesUmtpUfu8wrJSuKLlj3Jszq/UaukNq
 AASMkLe//m/xDfFDq5g==
X-Proofpoint-ORIG-GUID: ey4sqP4sYnpJZxzx5DoSPirqMCNvnwKl
X-Proofpoint-GUID: ey4sqP4sYnpJZxzx5DoSPirqMCNvnwKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100119
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



On 6/10/2026 6:04 AM, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> On 9/6/26 23:39, Daniel Henrique Barboza wrote:
>> All CPUs have the same amount of triggers: 2 triggers per hart, set via
>> RV_MAX_TRIGGERS.  This is not enough anymore: we'll have at least one
>> future CPU that will demand more triggers per hart when implementing the
>> RISC-V Server Ref Platform, requiring at least 11 triggers per hart.
>>
>> Parametrize the trigger amount using a new 'trigger_count' env property.
>> The default amount is kept at 2.  Set the new maximum to an educated
>> guess of 128 triggers per hart (which is less than 2^XLEN theoretical
>> maximum by the spec).  All relevant callers (csr.c and debug.c) will now
>> use env->trigger_count instead of RV_MAX_TRIGGERS.
>>
>> We're also adding two ways of setting the property:
>>
>> - a '.trigger_count' CPU definition flag, allowing CPUs to set a custom
>>    amount inside the CPU def in DEFINE_RISCV_CPU();
>> - a new 'trigger-count' user property.  The user property has a higher
>>    priority than an existing '.trigger_count' CPU def setting.
>>
>> Assuming a hypotetical case where a CPU 'X' is defined with
>> '.trigger_count = 8':
>>
>> - -cpu X,trigger-count=30 => trigger_count set to 30
>> - -cpu X (...)            => trigger_count set to 8
>>
>> For a CPU that doesn't set '.trigger_count':
>>
>> - -cpu rv64,trigger-count=30 => trigger_count set to 30
>> - -cpu rv64 (...)            => trigger_count set to 2
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   target/riscv/cpu.c         | 11 +++++++++++
>>   target/riscv/cpu.h         | 23 ++++++++++++++++++++++-
>>   target/riscv/csr.c         |  2 +-
>>   target/riscv/debug.c       | 16 ++++++++--------
>>   target/riscv/machine.c     |  4 ++--
>>   target/riscv/tcg/tcg-cpu.c |  7 +++++++
>>   6 files changed, 51 insertions(+), 12 deletions(-)
> 
> 
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index 6e70b145a5..a667c06b17 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -240,8 +240,8 @@ static int debug_post_load(void *opaque, int version_id)
>>   static const VMStateDescription vmstate_debug = {
>>       .name = "cpu/debug",
>> -    .version_id = 3,
>> -    .minimum_version_id = 3,
>> +    .version_id = 4,
>> +    .minimum_version_id = 4,
> 
> Since you bump the migration version, we can also change the array size
> to only serialize the number of trigger used:
> 
> @@ -246,9 +246,9 @@ static const VMStateDescription vmstate_debug = {
>       .post_load = debug_post_load,
>       .fields = (const VMStateField[]) {
>           VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
> -        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
> -        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
> -        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
> +        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, env.trigger_count),
> +        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, env.trigger_count),
> +        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, env.trigger_count),

This doesn't seem to work:


.p/target_riscv_machine.c.o -c ../target/riscv/machine.c
In file included from /home/dbarboza/work/qemu/include/migration/cpu.h:7,
                  from ../target/riscv/machine.c:23:
../target/riscv/machine.c:250:52: error: ‘env’ undeclared here (not in a function)
   250 |         VMSTATE_UINT64_ARRAY(env.tdata1, RISCVCPU, env.trigger_count),
       |                                                    ^~~
/home/dbarboza/work/qemu/include/migration/vmstate.h:427:20: note: in definition of macro ‘VMSTATE_ARRAY’
   427 |     .num        = (_num),                                            \
       |                    ^~~~
/home/dbarboza/work/qemu/include/migration/vmstate.h:1228:5: note: in expansion of macro ‘VMSTATE_UINT64_ARRAY_V’
  1228 |     VMSTATE_UINT64_ARRAY_V(_f, _s, _n, 0)
       |     ^~~~~~~~~~~~~~~~~~~~~~
../target/riscv/machine.c:250:9: note: in expansion of macro ‘VMSTATE_UINT64_ARRAY’
   250 |         VMSTATE_UINT64_ARRAY(env.tdata1, RISCVCPU, env.trigger_count),
       |         ^~~~~~~~~~~~~~~~~~~~
[72/908] Compiling C object libqemu-riscv64-softmmu.a.p/target_riscv_translate.c.o



 From what I'm gathering the macro accepts an actual number/value in '_num'. It can't
deal with a field type like env.trigger_count.

It seems like there's a "VARRAY" macro that is supposed to deal with variable
arrays, e.g. in riscv_aplic.c:

             VMSTATE_VARRAY_UINT32(sourcecfg, RISCVAPLICState,
                                   num_irqs, 0,
                                   vmstate_info_uint32, uint32_t),


But, for some reason, we don't have VMSTATE_VARRAY_(INT64/UINT64), and the fields we're
dealing with happen to be 64 bits.

There's an alternative that ppc64 uses called VMSTATE_STRUCT_VARRAY_ALLOC(). It would be
used like this:


         VMSTATE_STRUCT_VARRAY_ALLOC(env.tdata1, RISCVCPU,
                                     env.trigger_count, 0,
                                     vmstate_info_uint64, uint64_t),


But then we have another set of errors:


In file included from /home/dbarboza/work/qemu/include/migration/cpu.h:7,
                  from ../target/riscv/machine.c:23:
/home/dbarboza/work/qemu/include/migration/vmstate.h:736:19: error: initialization of ‘const VMStateDescription *’ from inco
mpatible pointer type ‘const VMStateInfo *’ [-Werror=incompatible-pointer-types]
   736 |     .vmsd       = &(_vmsd),                                          \                                                    |                   ^
../target/riscv/machine.c:250:9: note: in expansion of macro ‘VMSTATE_STRUCT_VARRAY_ALLOC’
   250 |         VMSTATE_STRUCT_VARRAY_ALLOC(env.tdata1, RISCVCPU,
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/dbarboza/work/qemu/include/migration/vmstate.h:736:19: note: (near initialization for ‘(anonymous)[2].vmsd’)
   736 |     .vmsd       = &(_vmsd),                                          \
       |                   ^
../target/riscv/machine.c:250:9: note: in expansion of macro ‘VMSTATE_STRUCT_VARRAY_ALLOC’
   250 |         VMSTATE_STRUCT_VARRAY_ALLOC(env.tdata1, RISCVCPU,
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/dbarboza/work/qemu/include/migration/vmstate.h:319:44: error: invalid operands to binary - (have ‘uint64_t **’ {aka ‘l
ong unsigned int **’} and ‘uint64_t (*)[128]’ {aka ‘long unsigned int (*)[128]’})
   319 | #define type_check_pointer(t1,t2) ((t1**)0 - (t2*)0)                                                                      |                                            ^
(...)


It really seems to me that I need to turn the static arrays into pointers
and alloc them during init().  Then maybe we can use this macro to pass
env.trigger_count as a size.


I'll give it a go.  If it works I'll add an extra patch converting stuff
first before introducing trigger_count.


Cheers,
Daniel





>           VMSTATE_END_OF_LIST()
>       }
>   };
> 
> Orthogonal, we'd need to replace these target_ulong at some point
> (likely bumping the version number again).


