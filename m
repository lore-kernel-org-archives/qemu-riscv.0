Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37F0CD8CB2
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 11:02:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXGf6-000809-Tg; Wed, 10 Jun 2026 06:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXGf4-0007hi-Ay
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 06:59:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXGf2-0001lQ-6y
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 06:59:54 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65A7i1Lv470357
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 10:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bz0hZCsgZVUQ2DhIE8i1/BTbeZdjJ7LG6KvcUcn0ZE8=; b=PlYAWSEKVLLpsDQs
 V2o84Y1HWwgwoanDwMxdU0UhIb/CmGlExkdyu3TgqLYNyyr+Q+XqU1ORuIINGkga
 YA/qlhiklNin7jZaqyMIgP14SWMBw6ZSgYpMFGQBxGC0zRDyA0KwFPNqDVB+1bvi
 JDLPgIokKzbm3iz5nMcBSykCqzVAoWaEPZGqL9WXCZ+EP792TtE59p/iHG9RQUoe
 CAwPvgMZR2Xr1no/4+0rcLTIhQKsM9T1AcO+366oTHN1klLWkRc1/xaeCmBDlPxl
 fs2lgVGgaTtbd4lLA8c0Vc7rSI9TntWcmtPtRoogBxsFCPFnLEUlwmGT7V78FoUd
 y3vnbg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvhtp1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 10:59:50 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5a1912d5c85so9495300e0c.0
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781089189; x=1781693989; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bz0hZCsgZVUQ2DhIE8i1/BTbeZdjJ7LG6KvcUcn0ZE8=;
 b=krEP/zw4w3ZdN59oOygzHERFfdR0hj8IZoZGb47PslOoPaI3r+1N1Q4fam8B2qiWEi
 2gsrjcs8FcZ4Ame32uaYNGCQr1Xin0ILkO0PgUe5RzP5qhbisPUqDIZJsok6C9Dly+Ld
 1JBecylHMD8e69sFfOXf+IrCTHVJvhK5dvaTeQeitb1Y45qrlhFetUPu9pAEUaMjJ6n3
 EW75ZMNa7h+ZrSPxRdnodofoImOT6dGH6xEBbzavL8Q5ybIUHNjv/W2rMCVxGXqdqg4g
 Ef5iUGEr8fRNfjS11lxr8REJ16SKY+KA6u1jliDyWZWDkpHgTq/a0hlYvK0IWSmvrwMI
 Ct4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781089189; x=1781693989;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bz0hZCsgZVUQ2DhIE8i1/BTbeZdjJ7LG6KvcUcn0ZE8=;
 b=WAaq2cGEe8ra5a5H/FES4ZMUAPDTxdEdmb8HK0QO6hnrqkBlaN849GlfSccqiAHAom
 zRsPDIDwnsMCQD6kPb5xUgYOvEuUoHa0hDfQN4mh6xBRKMlJTfsovEqSABwvoL/G/Rji
 dLRRQ/BJQ2/IX4maQ3etttYRma6kdu5dSIUy3IWiVBoPrDZxbEX5Atdm3WN37Yja4p/e
 8K8EtkqKpn0hTfBJLDJYMJjl6o5Xyhr1+3/GgMo8qcow6cVVPkYL500H0EE2MjNjVDC7
 M1qlDEWFVtoi6xnIO3GKySV51bb9juQxfj/OeRoFIngDyPZTQaYVxhsHQV1+gLqJqcg0
 eyxg==
X-Gm-Message-State: AOJu0Yw9Dz9wqnxNZQPdQwsH2tSrx4eQO+RzEi5+obU9mpGd77lT3vc6
 yL/AJq6wY1qATq8tp/8FDuDjtHuyf0YP2i/azTBmGwY17AGh7qr+du76ngI0bfyMeFvX7J2HOe2
 XEfy6RyCiXoT2+8kfbY4WsNc/ast243mgMmiPhitYwJzMiGiUFxicGg7yRQ==
X-Gm-Gg: Acq92OGKBLXTOr+o8qIa98WV+J/D3h+zenCCaNSAkxe+vTxDvjEfAL43J4oSgHt7b5Z
 jh8/Lg1aiTcYzOkaamqcg3FRrIeMBEzX+aqRiLlHN/AKaAGy5jgJn8IDllf0ZVQVYO23izIsBON
 9PR4yPByMMIycL4bZu8DGpViM8CB/A563aWM/fP/fbqeuAoo1HcnKVq+HnCD28hXa78LxW+kKpO
 VgcxQj16TVeHPKM7XuQVkc15Lcr7/wuLXWzV4ygOuAKfMocyuSL27FqvUSEKBjZu0fUdpDtE+uF
 Ynx38zL5cemkc50AcZ4+PCjAHV+e3ggLpZYfWlLkrP8OeNPP/C7e2E/vy/Gwi01uEY+khfgheiJ
 9zTOZkrlbs/CB3ZOzhC7vH2CGs9ljELw7rIw5+ySjtxXDqaGir1aroNzms2urnUngwcPi
X-Received: by 2002:a05:6122:1d55:b0:575:178f:62d2 with SMTP id
 71dfb90a1353d-5ac512abacemr12776930e0c.14.1781089189077; 
 Wed, 10 Jun 2026 03:59:49 -0700 (PDT)
X-Received: by 2002:a05:6122:1d55:b0:575:178f:62d2 with SMTP id
 71dfb90a1353d-5ac512abacemr12776914e0c.14.1781089188473; 
 Wed, 10 Jun 2026 03:59:48 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5a6dc1696d0sm19621463e0c.12.2026.06.10.03.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 03:59:47 -0700 (PDT)
Message-ID: <33a655e5-2f4f-498e-92f7-38f0fdb7f10b@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 07:59:42 -0300
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
 <25dc379c-7421-44e2-98a7-15593db4f93c@oss.qualcomm.com>
 <affa4048-c00e-44b9-b06b-06a5e38df47b@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <affa4048-c00e-44b9-b06b-06a5e38df47b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wYUhsvmJ8UZaUnTFceQxknOH8jzC4IBR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNCBTYWx0ZWRfX61lSVAq4bVFh
 8Llqbl89qYDM31YPVw955cptFMS5nDkMLBJEkSxiobJHWJvld0fTRBLjbuNlLqWz+fMgpMBa/ar
 hwxnEM63KP9fsHP2V8GcgxUtO//syMJ/DyaKwSoyNOPW1ARq+r1x1u7ryV18JdAhw2Uc3CGA83d
 w/GxCR/kawNAKWhI+Up1APa4qNHhhlIwF/V7LFrNHqzsDxQ7w6lmfgz+7dm87/vjQ1lQVU+ZanG
 zluenUReHDIGkLOQgzKGvLOkel+AiogjMmCJviPYal6XZH9fzTmW5rCWasvuf0+Vc+ihBP8Lgm1
 t7T5rf8djUVdUwHzxhlyOPbJXg/bkDBZHiCvQf3zfIMvxvBUU2xVIj1hjouNI1StHHx4dqQAc2g
 nRJTytAUXc2tp0vRNBy3T0/DFchpKLQ7ktyumnMb8OdqEvYsQWPofB+EQ/rQqnqoZeFV+2xD0+l
 KkJ3yUnaiwLYKs/IWnQ==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a2943a6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iZKn5K4OfQFu3fuxHm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: wYUhsvmJ8UZaUnTFceQxknOH8jzC4IBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100104
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



On 6/10/2026 7:54 AM, Philippe Mathieu-Daudé wrote:
> On 10/6/26 11:37, Daniel Henrique Barboza wrote:
>>
>>
>> On 6/10/2026 6:04 AM, Philippe Mathieu-Daudé wrote:
>>> Hi Daniel,
>>>
>>> On 9/6/26 23:39, Daniel Henrique Barboza wrote:
>>>> All CPUs have the same amount of triggers: 2 triggers per hart, set via
>>>> RV_MAX_TRIGGERS.  This is not enough anymore: we'll have at least one
>>>> future CPU that will demand more triggers per hart when implementing the
>>>> RISC-V Server Ref Platform, requiring at least 11 triggers per hart.
>>>>
>>>> Parametrize the trigger amount using a new 'trigger_count' env property.
>>>> The default amount is kept at 2.  Set the new maximum to an educated
>>>> guess of 128 triggers per hart (which is less than 2^XLEN theoretical
>>>> maximum by the spec).  All relevant callers (csr.c and debug.c) will now
>>>> use env->trigger_count instead of RV_MAX_TRIGGERS.
>>>>
>>>> We're also adding two ways of setting the property:
>>>>
>>>> - a '.trigger_count' CPU definition flag, allowing CPUs to set a custom
>>>>    amount inside the CPU def in DEFINE_RISCV_CPU();
>>>> - a new 'trigger-count' user property.  The user property has a higher
>>>>    priority than an existing '.trigger_count' CPU def setting.
>>>>
>>>> Assuming a hypotetical case where a CPU 'X' is defined with
>>>> '.trigger_count = 8':
>>>>
>>>> - -cpu X,trigger-count=30 => trigger_count set to 30
>>>> - -cpu X (...)            => trigger_count set to 8
>>>>
>>>> For a CPU that doesn't set '.trigger_count':
>>>>
>>>> - -cpu rv64,trigger-count=30 => trigger_count set to 30
>>>> - -cpu rv64 (...)            => trigger_count set to 2
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>>>> ---
>>>>   target/riscv/cpu.c         | 11 +++++++++++
>>>>   target/riscv/cpu.h         | 23 ++++++++++++++++++++++-
>>>>   target/riscv/csr.c         |  2 +-
>>>>   target/riscv/debug.c       | 16 ++++++++--------
>>>>   target/riscv/machine.c     |  4 ++--
>>>>   target/riscv/tcg/tcg-cpu.c |  7 +++++++
>>>>   6 files changed, 51 insertions(+), 12 deletions(-)
>>>
>>>
>>>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>>>> index 6e70b145a5..a667c06b17 100644
>>>> --- a/target/riscv/machine.c
>>>> +++ b/target/riscv/machine.c
>>>> @@ -240,8 +240,8 @@ static int debug_post_load(void *opaque, int version_id)
>>>>   static const VMStateDescription vmstate_debug = {
>>>>       .name = "cpu/debug",
>>>> -    .version_id = 3,
>>>> -    .minimum_version_id = 3,
>>>> +    .version_id = 4,
>>>> +    .minimum_version_id = 4,
>>>
>>> Since you bump the migration version, we can also change the array size
>>> to only serialize the number of trigger used:
>>>
>>> @@ -246,9 +246,9 @@ static const VMStateDescription vmstate_debug = {
>>>       .post_load = debug_post_load,
>>>       .fields = (const VMStateField[]) {
>>>           VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
>>> -        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
>>> -        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
>>> -        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
>>> +        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, env.trigger_count),
>>> +        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, env.trigger_count),
>>> +        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, env.trigger_count),
>>
>> Good stuff.  I searched a bit yesterday to see if there was a way of putting a
>> variable in the array size of this macro and figured this wasn't possible.
>> Didn't find any example after searching for like 2 minutes, then convinced
>> myself that the vmstate array should have a static size.
> 
> Same happened to me, unfortunately there is no documentation at all.
> 
>>
>> I'll send a v2.
>>
>>
>>
>>>           VMSTATE_END_OF_LIST()
>>>       }
>>>   };
>>>
>>> Orthogonal, we'd need to replace these target_ulong at some point
>>> (likely bumping the version number again).
>>
>> I suppose we should do that in a separated patch that handles all ulongs
>> from all vmstate objects of this file.  Then we can do a mass bump on
>> everything.
> 
> Sure :)

Btw, on Alistair's branch, this change was already made.  This code is now:

     .fields = (const VMStateField[]) {
         VMSTATE_UINT16(env.mcontext, RISCVCPU),
         VMSTATE_UINT8(env.trigger_cur, RISCVCPU),
         VMSTATE_UINT64_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
         VMSTATE_UINT64_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
         VMSTATE_UINT64_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
         VMSTATE_END_OF_LIST()


This was done by a patch from Anton Johansson in that branch:

"target/riscv: Fix size of trigger data

mcontext is at most 14 bits in size with the H extension, fix to 16
bits. trigger_cur indexes into tdata*[RV_MAX_TRIGGERS] which holds 2
elements, fix to 8 bits.

This patch also adds a migration entry for mcontext which is used in
tandem with other debug data that is already migrated.
Note, the cpu/debug VMSTATE version is bumped, breaking migration from
older versions."


Cheers,
Daniel


> 
>>
>>
>> Thanks,
>> Daniel
>>
>>
> 


