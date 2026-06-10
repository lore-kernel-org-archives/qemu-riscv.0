Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BAECD8CB9
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 13:12:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXIjH-0006bx-1r; Wed, 10 Jun 2026 09:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXIjF-0006bg-KU
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 09:12:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXIjD-0006Fu-B0
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 09:12:21 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65ACC0dK1606472
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 13:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aZCz9NC0qKlf2ypiTxfvKRSNnZVqQojeqyg9eN4sgkY=; b=cABHfxNezV45IPNF
 JXYEVjEm9belNi1i9kAqx+FSSlqe0j0w9JbqRRy9ZISP/M4zJlrVZZvOhgjVriZ0
 0gUrsywIp4EPxWI11ZaiX6LuHjr84k/kYcGGyd4EGr2XgHe5XDiXGDRuiwpP6CtC
 mLs/+oVfV4B8D/wxTwaqbPRnZ+WHtM+zVCtYsJhR4GT/Q8iRmQ6PMhz97S7UUNRW
 S9h61c6aEcGUT7kBhqdpgedl2OsLc1zbP/btRJ8Skj/ribOGIouEq7kwuGsd7BNq
 HICcDl9mk8rXZCNDsoS4ZDROJ5krKNJtE8405qfhJUZXu3nf3gRG8Hly1GERQsMK
 DjohJQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a9x2k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 13:12:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-6c5794db0eeso7288065137.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781097135; x=1781701935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aZCz9NC0qKlf2ypiTxfvKRSNnZVqQojeqyg9eN4sgkY=;
 b=jRmqDIhif48MJP4cC/V9TLw09In2zXGXbtFi+jxNVnYOBtuUSpKTqStlIjouM2iu1l
 /QWwQTtsDslF5XPcYNVO2Pbi7daWCTbgmofhil/y26at2TG+uIeBRoH9pSqchiDbc7iw
 sEjEAEJGYpqevRQu6ODTA6a2D19Thpk/FkZBti+5yFDH8eQzxH3Wodew9qO2aRu7Al3d
 abUPzwG16ZdAMZwIhnPNKKSZZwtP2f8BTQNLU+kANlOoW4t6jJ+sr4b5NFAgZsPY6exZ
 cZnI7txmws/8cWuEJgWWS5CMZejJTRp/wkiBQ0MFeu831x4r9W2B7WbaR3JL3xoVIks3
 6w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781097135; x=1781701935;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aZCz9NC0qKlf2ypiTxfvKRSNnZVqQojeqyg9eN4sgkY=;
 b=py4z92dXNzRUxRQNwvAglAJeFHTj6b30phquzRFrURNL9kp840PwcfyNcbmPYKRtLf
 wkyYa3pUmaBlT5e31HNLIZOo0rqTUiAzdYLYjWcIdyHTGmWqjE1tFbkI9/jaCCGfbu5G
 hJ0UvcFOpl1c5paEx6W8gdobv7Lc8KtwFp7itYflIR0n8Wc0xr7aMyp14TqQj0wy2Un8
 9SvFFPRPh97qdp7aUVLqamFUIsmylH6PolEm3fIMnYVDWF3OtZG9cx3Ws6cNmMRiKG4e
 gHGchvbFPk7Q5Y9qVoHSZ229zE6F7TwZwlD4urLciplVBXBDVjWHykK3LlYD7cFhCSh6
 VhBg==
X-Gm-Message-State: AOJu0YwOmgGkxDRqeaik+P8EhQYaU/YWL9i0kOqkOAnHEBxXbA+EYHfO
 +hSRUgojhQyOMYzRa1fWmDnXhkUMGk0cd16VNQFC/F3TAwpUygKYE2srnDjXSj7YU+7yE6m0V5D
 O07gfiqaqfPDTUBU/7vU4W1BfT0zIhk5DNgrPbryo7Q5zYmaXLxt34uIcnw==
X-Gm-Gg: Acq92OFa3vu7XFuG+Q88PC5/VKEeYek4KeqTczrn22vmdpT0n6V0dWQ7lbmWjbZZ/WR
 EBlPyf+D0jnhY0AyelWE5ISEi/QAHqEavdLa5VDYKnCCyDdQ45a21FsWIFs4ahE/8iKxO/hyJXv
 pEkip2lto3DKw0gJXd+yidKZS38T26NFT1ypukGqHAmKgDtt27QgferXZKPe82z55P5cueGU0Dr
 G+JUPA1TJb1A10kqNos3pS6OO/SgAQxNgDbZLCTxo7ra+/ECc6TwtstrdTPMx4BVbWDrEDlE+S6
 /FycYJk75DfqwlcitnbFf8QXLa+NaqphF1sl4PBdcC6Alllq1UhZxrJZjlcfe0GITJdg0t/2TRU
 UTXtt1flVWMM9s+9DuF95gU+94SkoY45OeENAzQgeOenR1371wir//kayIm0PP3CF3yI7
X-Received: by 2002:a05:6102:390f:b0:6cd:84ba:6f51 with SMTP id
 ada2fe7eead31-6fef8531ff2mr14067986137.19.1781097135449; 
 Wed, 10 Jun 2026 06:12:15 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:6cd:84ba:6f51 with SMTP id
 ada2fe7eead31-6fef8531ff2mr14067901137.19.1781097134774; 
 Wed, 10 Jun 2026 06:12:14 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-6eb5549144csm19870360137.3.2026.06.10.06.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 06:12:13 -0700 (PDT)
Message-ID: <94c772b0-5231-40e4-9cab-6ac39b9e4d45@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:12:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: add 'trigger-count' debug property
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260609213905.1126795-1-daniel.barboza@oss.qualcomm.com>
 <6db02c91-83fb-4021-91ec-72e6b56afeb3@oss.qualcomm.com>
 <2a49811b-65b6-48fa-ac0e-b80331254097@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2a49811b-65b6-48fa-ac0e-b80331254097@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a2962b0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DdRnI1LRVO2qfNExBiUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: VSEFoBTDNIKjsAfhyH1RhzKW51PIGftH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNiBTYWx0ZWRfX4Sa1AUS4nOoH
 Q/HJkOd7ecMlzMubxcHyJqAHiBMDVePBeVHAfB1d8OggOpd79Ef1hnEsExJBV2dc6BSLxph6vEp
 Rvgmy445ElMouqSV7U92tgTrQfOSulJMYBnfG2IQRunCNc6By4la3Q/7tLTb3qNdXdYSYUp7Tm7
 auugrmPV1EPuk0MUu6UefvFt/uyXD9CzTIAfVPLdz8cU7zDonFwncNQiGmGBV795ljanptmQWWX
 7nASchRhh4Wk447R+BMm6j7B8W1mNxNZu0RITFs5JInf02F6E65iOD1tGK/+UCHPLjsbxN40dD8
 1X4DUDHx+mwqRx8ieRDuNO7T2IfOoPcEyDdpyi4QTmI6VcnVUFB9K/Ln6vnXhlzlPUxqzz+DrTL
 RH5OMUIw9sng2ZHIhVGeaygM401uyiIxLq7gYsBC++yhZujbkJth9Bn8ucNXE2QXG3eI1/IwamZ
 k2QH2ku4Tve/s+gJZYw==
X-Proofpoint-GUID: VSEFoBTDNIKjsAfhyH1RhzKW51PIGftH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100126
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



On 6/10/2026 9:28 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 6/10/2026 6:04 AM, Philippe Mathieu-Daudé wrote:
>> Hi Daniel,
>>
>> On 9/6/26 23:39, Daniel Henrique Barboza wrote:
>>> All CPUs have the same amount of triggers: 2 triggers per hart, set via
>>> RV_MAX_TRIGGERS.  This is not enough anymore: we'll have at least one
>>> future CPU that will demand more triggers per hart when implementing the
>>> RISC-V Server Ref Platform, requiring at least 11 triggers per hart.
>>>
>>> Parametrize the trigger amount using a new 'trigger_count' env property.
>>> The default amount is kept at 2.  Set the new maximum to an educated
>>> guess of 128 triggers per hart (which is less than 2^XLEN theoretical
>>> maximum by the spec).  All relevant callers (csr.c and debug.c) will now
>>> use env->trigger_count instead of RV_MAX_TRIGGERS.
>>>
>>> We're also adding two ways of setting the property:
>>>
>>> - a '.trigger_count' CPU definition flag, allowing CPUs to set a custom
>>>    amount inside the CPU def in DEFINE_RISCV_CPU();
>>> - a new 'trigger-count' user property.  The user property has a higher
>>>    priority than an existing '.trigger_count' CPU def setting.
>>>
>>> Assuming a hypotetical case where a CPU 'X' is defined with
>>> '.trigger_count = 8':
>>>
>>> - -cpu X,trigger-count=30 => trigger_count set to 30
>>> - -cpu X (...)            => trigger_count set to 8
>>>
>>> For a CPU that doesn't set '.trigger_count':
>>>
>>> - -cpu rv64,trigger-count=30 => trigger_count set to 30
>>> - -cpu rv64 (...)            => trigger_count set to 2
>>>
>>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>>> ---
>>>   target/riscv/cpu.c         | 11 +++++++++++
>>>   target/riscv/cpu.h         | 23 ++++++++++++++++++++++-
>>>   target/riscv/csr.c         |  2 +-
>>>   target/riscv/debug.c       | 16 ++++++++--------
>>>   target/riscv/machine.c     |  4 ++--
>>>   target/riscv/tcg/tcg-cpu.c |  7 +++++++
>>>   6 files changed, 51 insertions(+), 12 deletions(-)
>>
>>
>>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>>> index 6e70b145a5..a667c06b17 100644
>>> --- a/target/riscv/machine.c
>>> +++ b/target/riscv/machine.c
>>> @@ -240,8 +240,8 @@ static int debug_post_load(void *opaque, int version_id)
>>>   static const VMStateDescription vmstate_debug = {
>>>       .name = "cpu/debug",
>>> -    .version_id = 3,
>>> -    .minimum_version_id = 3,
>>> +    .version_id = 4,
>>> +    .minimum_version_id = 4,
>>
>> Since you bump the migration version, we can also change the array size
>> to only serialize the number of trigger used:
>>
>> @@ -246,9 +246,9 @@ static const VMStateDescription vmstate_debug = {
>>       .post_load = debug_post_load,
>>       .fields = (const VMStateField[]) {
>>           VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
>> -        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
>> -        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
>> -        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
>> +        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, env.trigger_count),
>> +        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, env.trigger_count),
>> +        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, env.trigger_count),
> 
> This doesn't seem to work:
> 
> 
> .p/target_riscv_machine.c.o -c ../target/riscv/machine.c
> In file included from /home/dbarboza/work/qemu/include/migration/cpu.h:7,
>                   from ../target/riscv/machine.c:23:
> ../target/riscv/machine.c:250:52: error: ‘env’ undeclared here (not in a function)
>    250 |         VMSTATE_UINT64_ARRAY(env.tdata1, RISCVCPU, env.trigger_count),
>        |                                                    ^~~
> /home/dbarboza/work/qemu/include/migration/vmstate.h:427:20: note: in definition of macro ‘VMSTATE_ARRAY’
>    427 |     .num        = (_num),                                            \
>        |                    ^~~~
> /home/dbarboza/work/qemu/include/migration/vmstate.h:1228:5: note: in expansion of macro ‘VMSTATE_UINT64_ARRAY_V’
>   1228 |     VMSTATE_UINT64_ARRAY_V(_f, _s, _n, 0)
>        |     ^~~~~~~~~~~~~~~~~~~~~~
> ../target/riscv/machine.c:250:9: note: in expansion of macro ‘VMSTATE_UINT64_ARRAY’
>    250 |         VMSTATE_UINT64_ARRAY(env.tdata1, RISCVCPU, env.trigger_count),
>        |         ^~~~~~~~~~~~~~~~~~~~
> [72/908] Compiling C object libqemu-riscv64-softmmu.a.p/target_riscv_translate.c.o
> 
> 
> 
>  From what I'm gathering the macro accepts an actual number/value in '_num'. It can't
> deal with a field type like env.trigger_count.
> 
> It seems like there's a "VARRAY" macro that is supposed to deal with variable
> arrays, e.g. in riscv_aplic.c:
> 
>              VMSTATE_VARRAY_UINT32(sourcecfg, RISCVAPLICState,
>                                    num_irqs, 0,
>                                    vmstate_info_uint32, uint32_t),
> 
> 
> But, for some reason, we don't have VMSTATE_VARRAY_(INT64/UINT64), and the fields we're
> dealing with happen to be 64 bits.

So, quick update.  VMSTATE_VARRAY_UINT32() doesn't mean "this is a variable length
array of uint32_t elements".  This means "this is a variable length array, in
which 'length' is an uint32_t variable, and it has elements described as vmstateinfo
and type".

This means that changing 'trigger_count' to a supported type (we don't have
VMSTATE_VARRAY_UINT16()) and changing the static arrays to pointers make
VMSTATE_VARRAY_UINT32() work.

I'll see if I can put this in a preliminary patch.  Thanks,

Daniel

> 
> There's an alternative that ppc64 uses called VMSTATE_STRUCT_VARRAY_ALLOC(). It would be
> used like this:
> 
> 
>          VMSTATE_STRUCT_VARRAY_ALLOC(env.tdata1, RISCVCPU,
>                                      env.trigger_count, 0,
>                                      vmstate_info_uint64, uint64_t),
> 
> 
> But then we have another set of errors:
> 
> 
> In file included from /home/dbarboza/work/qemu/include/migration/cpu.h:7,
>                   from ../target/riscv/machine.c:23:
> /home/dbarboza/work/qemu/include/migration/vmstate.h:736:19: error: initialization of ‘const VMStateDescription *’ from inco
> mpatible pointer type ‘const VMStateInfo *’ [-Werror=incompatible-pointer-types]
>    736 |     .vmsd       = &(_vmsd),                                          \                                                    |                   ^
> ../target/riscv/machine.c:250:9: note: in expansion of macro ‘VMSTATE_STRUCT_VARRAY_ALLOC’
>    250 |         VMSTATE_STRUCT_VARRAY_ALLOC(env.tdata1, RISCVCPU,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /home/dbarboza/work/qemu/include/migration/vmstate.h:736:19: note: (near initialization for ‘(anonymous)[2].vmsd’)
>    736 |     .vmsd       = &(_vmsd),                                          \
>        |                   ^
> ../target/riscv/machine.c:250:9: note: in expansion of macro ‘VMSTATE_STRUCT_VARRAY_ALLOC’
>    250 |         VMSTATE_STRUCT_VARRAY_ALLOC(env.tdata1, RISCVCPU,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /home/dbarboza/work/qemu/include/migration/vmstate.h:319:44: error: invalid operands to binary - (have ‘uint64_t **’ {aka ‘l
> ong unsigned int **’} and ‘uint64_t (*)[128]’ {aka ‘long unsigned int (*)[128]’})
>    319 | #define type_check_pointer(t1,t2) ((t1**)0 - (t2*)0)                                                                      |                                            ^
> (...)
> 
> 
> It really seems to me that I need to turn the static arrays into pointers
> and alloc them during init().  Then maybe we can use this macro to pass
> env.trigger_count as a size.
> 
> 
> I'll give it a go.  If it works I'll add an extra patch converting stuff
> first before introducing trigger_count.
> 
> 
> Cheers,
> Daniel
> 
> 
> 
> 
> 
>>           VMSTATE_END_OF_LIST()
>>       }
>>   };
>>
>> Orthogonal, we'd need to replace these target_ulong at some point
>> (likely bumping the version number again).
> 


