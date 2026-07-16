Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2244CC4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 13:47:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkMQS-0003mx-6d; Thu, 16 Jul 2026 09:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkMQQ-0003kc-QX
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 09:46:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkMQO-0007gY-RG
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 09:46:54 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GDJu8R2721923
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 13:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hgWe4RbQzjg7G4t3Q3vNkVvvSUXDfgNtMAM9hs0p2K4=; b=BL5YcntwxzUBMNBc
 Hru+/9leWm1FGxX88npMKyQ3Def8kL6bT6qzkcdqBKcIfRnyJTst97Pr6LpYCoCL
 vuGem/SD6j44ZsloynlnvQa4xlAbps6AtHUImZsjwerwA2ZHp6mmbUxfJtMSh/h4
 EfdcEViKalNl2dOqi7459pQV4QolaltoDebcykcBK4ynThwWHQ574Bg3VLm6S3hU
 zm51stTDl/jP47/DlBwwnjhHdQWh/7subviplktAy1D7fq0q9D+rfx9PyNHL303T
 FVkwg9n6lExSfzieKoHI/W85CIKV+bgORMfcJDQ3zqJQcFUCXtHyMZw9x39vflry
 jeJcLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvc4qa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 13:46:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51a8db414c7so94162931cf.0
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784209608; x=1784814408; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hgWe4RbQzjg7G4t3Q3vNkVvvSUXDfgNtMAM9hs0p2K4=;
 b=HlxQK4QPyvkZf0ikQcbWX3HEbDiRSm9aQW1oVGyPwYSA0xjfvsReJnUJswHOhlVfil
 vrBa1HEePYVMDXRq3DurAkHwdM7CYhBDr+0AoJGffsVoJyn2iUKDYZqzNclrqjbsjM+9
 gPrYvs7sgwKiX2pvJ2KVYSoNtpuovl9ideXdTBWoO1rT1iQOEphn9EMlZahVVE9EGFqv
 GW2u4tfPYnlxV6/LCDlLePmL60+sNeUc17dJxC6BKVvguoymYU12xN18gTHyl8vPOdp0
 j5hO3b+mg12v1E4hl/+o2iuhwSuONpdFTvSfeVf3DLo6y2BV/GGolO/nd3KgjmV2ogOc
 l5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784209608; x=1784814408;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hgWe4RbQzjg7G4t3Q3vNkVvvSUXDfgNtMAM9hs0p2K4=;
 b=cgyYhO/boLe42TdsjYf/fN11AFzPuIRm37J5IPciZOT0g8fP2VWUsGlHpgv/4OsT56
 K8Wsha9cqKtFSTHChD5RM3QYTVB50rS4gag2vOrIsoYihN7Z0Iyga5wdtx6WAWIKM9RV
 BNU2zGS9mClL8yzk7746koo0cHO1zrwvHeWm+R0L13IXtNvC33rAolYYVMYPZJZJWeC6
 eeMzCCK6leMZHq9DsN9/5hOiSIKG91Ok504ISATeILK++rsPmfCgFWW3WM25eXb42hwD
 LtIut+Vi9sDsrBaaid0vTSjDSh0b7asXzf4z30tMVK2ovkmR5Pd+83Z1IVV6D5avAfmy
 bGXw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq6mGLiIIo0HkF+7o5Y3t2aHzOlJkji0oclBtwBxHN+VTTTLAWgKJYYavitwlULEqnzcIBtTfU2pYSh@nongnu.org
X-Gm-Message-State: AOJu0YzuvolRbXFz5fJXIW6VExYERl1Sk7lXRpeoCe01vPyqpjsqEN+Q
 tMMtgUyU97awDLG6ssWaq9aCMv3C+dP3USkTqzU1xsPyqaffNmpQzkMIT3SB6UmZyJZIJIgSUyr
 UuAVrb0wohEWQgXXxNlZctB4x2y/YEyvoIzHsPtB4rcNgt/TC3j/VszcOzA==
X-Gm-Gg: AfdE7cm56trsx66P6kd1fTLjJ79ZwLeHQ8UBFW7sj8AGCQQpksL6MR6U7i6YX1o9kW4
 p6UPcktYdJuGSrhE3A7kyeusDxO+DhItQFlLsWzb7U+XrmbY/DUT8kq17WYjvFUXnOMzFHs8O6N
 mpp9BgOWhucV2YxYf4CfScsz9dyppkswiO+r0+/xNs8R0JEDuB5ZazpNK3cQFs9Qguh0zu68wE1
 LLdtBKuOHyQ5BhjVYsPX6cuS3fTt8la0leP5un9QW9x90lhx0rD4sTFJYJe5FKiFMKAj4iVgaAb
 ckLVq8jhPlO2zhxXvSwdgy8nM3dloWxueEZ3wsf2PMcEHQ1kIGSb6GHWFo6HPOvNSSVRSvBlE9+
 5WVDGlWHmojnWLT5+F27cimVXvfsh62mNlg==
X-Received: by 2002:a05:622a:590a:b0:51c:7b11:41a5 with SMTP id
 d75a77b69052e-51e4f22de35mr83827741cf.82.1784209607814; 
 Thu, 16 Jul 2026 06:46:47 -0700 (PDT)
X-Received: by 2002:a05:622a:590a:b0:51c:7b11:41a5 with SMTP id
 d75a77b69052e-51e4f22de35mr83827361cf.82.1784209607392; 
 Thu, 16 Jul 2026 06:46:47 -0700 (PDT)
Received: from [192.168.68.105] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51e9b9cae5fsm29611421cf.17.2026.07.16.06.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 06:46:46 -0700 (PDT)
Message-ID: <5faad858-25f5-46ed-8420-e0b548fb3e13@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:46:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] disas/riscv.c: Correct indent for checkpatch
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: julien.thillard@univ-grenoble-alpes.fr
References: <20260715190737.1381701-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20260715190737.1381701-4-frederic.petrot@univ-grenoble-alpes.fr>
 <c06253bf-6e56-4ef8-9fd0-43d8a062190e@oss.qualcomm.com>
 <3bcc4074-eaac-4318-b572-bcd45e27786e@univ-grenoble-alpes.fr>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3bcc4074-eaac-4318-b572-bcd45e27786e@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58e0c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gxBMOhO55VL23jA08JIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0MCBTYWx0ZWRfXzUHTOIjX+CDH
 hcuGvDNn48SVWDpZNHwSMFHtggYOiASL2DKO9alx+7yoyoFdM6PRJKrZJwURXS/n8kvIXD7HySP
 Mcfh2vmE81lE08hTa48yxWB8VBWbrzgoYOCVP4KjKOUgJcaic4tBB4E6t0ZYe1YFjEW5PueJoG5
 ovCC4uTNPz3Q+653r8KLhj6kpVpf39ooekVOOWk4FflhyY5b2mtP7SqfTGQa+pTa01e5IpNd0tq
 PZJmSUeU7Les1bW8qomqZiMRYYrsxF2mR0yjfjHKaCPOMEHU1QxaGoA9cuBidKwRAw2dqHVYOzc
 eib0WP2aXE8u5/PbRcd+9mC8tF78fTNJ9bTjWk9kFQf84QYK1ib7+zlaKkkH45hfMUshWmHphBL
 6L1PnsAVRXkAbOnprBEbT7jfMwrc4FRm/i8MnLbRaI08SZcnpfGv1LNlBigi+6OP8o9Lg725FUW
 zNAAP5MMwXFGu+8ORUQ==
X-Proofpoint-GUID: FdE_tXGuG97q7dRKOI1ev3SvxsQKZZLq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0MCBTYWx0ZWRfX7qNFKFt3axcG
 6qGAULjBEg7Aropi9zSiAHC3JY6zyfoHfvoxwhew5PDgF2nYl4cmg506vE+ZAI/1SvcsWMHliN7
 KJnqAWXoN3xg2gzX1HU8D9c/sw+yHgU=
X-Proofpoint-ORIG-GUID: FdE_tXGuG97q7dRKOI1ev3SvxsQKZZLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160140
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 7/16/2026 10:41 AM, Frédéric Pétrot wrote:
> Thanks Daniel for the quick review.
> 
> The style issue is (I am afraid) due to your patch 9273cda7229 (indent of 3), but in your defense checkpatch didn't not catch it until I added the 'if ...'.

Ooops ...

> 
> If that's ok with you, I'll send a v2 that first corrects the style issue
> on the switch and then adds the rest.

Works for me.  Make it the first patch of the series so we're sure the style
is fixed before you drop your fixes.

Please also add the "Fixes" tag with that patch.  We're now on code freeze and
only bug fixes are going to be landing in the tree.


Thanks,
Daniel




> 
> Cheers,
> Frédéric
> 
> On 7/16/26 15:21, Daniel Henrique Barboza wrote:
>>
>>
>> On 7/15/2026 4:07 PM, frederic.petrot@univ-grenoble-alpes.fr wrote:
>>> From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>>>
>>> Trival indentation patch on the cbo/lq relevant code.
>>>
>>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>>> ---
>>
>> As I said in patch 2 this patch is fixing style issues that patch 2 itself
>> is introducing.  We want this patch squashed into patch 2.
>>
>>
>> Thanks,
>> Daniel
>>
>>>   disas/riscv.c | 38 +++++++++++++++++++-------------------
>>>   1 file changed, 19 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/disas/riscv.c b/disas/riscv.c
>>> index 831ff526ad..27bf4d9954 100644
>>> --- a/disas/riscv.c
>>> +++ b/disas/riscv.c
>>> @@ -2887,25 +2887,25 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>>>               case 0: op = rv_op_fence; break;
>>>               case 1: op = rv_op_fence_i; break;
>>>               case 2:
>>> -               /*
>>> -                * 'lq' shares the "(...) 010 ..... 0001111" opcode space
>>> -                * with 'cbo' insns, but assumes rd != 0.
>>> -                *
>>> -                * cbo_inval  0000000 00000 ..... 010 00000 0001111
>>> -                * cbo_clean  0000000 00001 ..... 010 00000 0001111
>>> -                * cbo_flush  0000000 00010 ..... 010 00000 0001111
>>> -                * cbo_zero   0000000 00100 ..... 010 00000 0001111
>>> -                */
>>> -               if ((inst >> 7) & 0b11111) {
>>> -                  op = rv_op_lq;
>>> -               } else {
>>> -                  switch (inst >> 20) {
>>> -                  case 0: op = rv_op_cbo_inval; break;
>>> -                  case 1: op = rv_op_cbo_clean; break;
>>> -                  case 2: op = rv_op_cbo_flush; break;
>>> -                  case 4: op = rv_op_cbo_zero; break;
>>> -                  }
>>> -               }
>>> +                /*
>>> +                 * 'lq' shares the "(...) 010 ..... 0001111" opcode space
>>> +                 * with 'cbo' insns, but assumes rd != 0.
>>> +                 *
>>> +                 * cbo_inval  0000000 00000 ..... 010 00000 0001111
>>> +                 * cbo_clean  0000000 00001 ..... 010 00000 0001111
>>> +                 * cbo_flush  0000000 00010 ..... 010 00000 0001111
>>> +                 * cbo_zero   0000000 00100 ..... 010 00000 0001111
>>> +                 */
>>> +                if ((inst >> 7) & 0b11111) {
>>> +                    op = rv_op_lq;
>>> +                } else {
>>> +                    switch (inst >> 20) {
>>> +                    case 0: op = rv_op_cbo_inval; break;
>>> +                    case 1: op = rv_op_cbo_clean; break;
>>> +                    case 2: op = rv_op_cbo_flush; break;
>>> +                    case 4: op = rv_op_cbo_zero; break;
>>> +                    }
>>> +                }
>>>               }
>>>               break;
>>>           case 4:
>>
>>
>>
>>
>>
> 


