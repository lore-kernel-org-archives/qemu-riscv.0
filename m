Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93A2C531CB
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 11:36:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wmrig-0003Dk-4c; Thu, 23 Jul 2026 07:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmrif-0003DN-Aj
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 07:36:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmric-0006w7-Ui
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 07:36:05 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66N8qVvL3648545
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 11:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xKeV2PUBGzSXkTO1r3ppSa6Eo4Pc/7kJNJqPSG+mvG0=; b=nFbuRmk19xKxE1BU
 5PwD8jNmzyYPQjO7jBFvUPzUPvAqXFpE+ZFva9hwTgTKFo8Rjn6lIf6FEluuXXBx
 2okKQJbzaswap1wvgXaCL8kU35diBipb+H+Pgr2Ye8d7hhSX3DE4Iq9QaCM0h0ru
 P4/lJg0YWMvfRQNzkNQIB6XaCqkNhFRcqvYqQ1BzwbZLLmIDHP1suUucDxvC5TUv
 HJ+bdiBZdLA8WJzBfUZB24Ru8OSYBeg95ba4RaonOcjCvNs7Yd6TnJVtn2A6Ngkw
 yPsA3EcIxbLwtaT3BBmX/z1sRKULFGJTl61fNexpQKcVHqchPMB8d8tKGLXFG3Jm
 LCuifQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jssr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 11:35:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0199faafso11563951cf.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784806559; x=1785411359; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xKeV2PUBGzSXkTO1r3ppSa6Eo4Pc/7kJNJqPSG+mvG0=;
 b=EfrsQ6OLUm4M0qNSNt775YX2o2aGHvEhF3fqLqCY9LhSjqx3YwArPEPzT0heHOlbgz
 A80EUI3jZ7VKu3CS7boy/Da/irH+6daxs8MVxv/cCO6Rya/yMvwqA+pBDKJCRXqp6ITc
 K6afbk4DpVFDDPt+bGvxcwgWIQiAUJJRdIugdlpHJOPwg32+TYpwC/brjahxhExYBdvH
 xlFWmiCFSx4KO5tEE03InQRZV6ssOvoegpANDkhZ5ZtWz27dFU63tPrcX8VFEHkC26gA
 9QzCVFrAx0rMg81Yhd0npo4cKDdA5Jpv7xw8XZabZiiQjATAsXXZNX26stuzOFBucpli
 vJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784806559; x=1785411359;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xKeV2PUBGzSXkTO1r3ppSa6Eo4Pc/7kJNJqPSG+mvG0=;
 b=Q0ebHagfAjcSv2BRR2VP90/dDBAoTRP88WzQK5tNUwuuf645JgVqNzirKUDNpaT6LJ
 PuzvDJRfsz96oqOsCoHTwXGAky3FFykdyGXrcy2w0LanHxeSRduutV2WbLd0dMVYuWXu
 wuopgL1nLcS2/05cj4BTlnIQQHim1f1hk8bRWl5RdwnRQTFivQ9tWMe385LVwGNHARoX
 RMhWc5bWjWZnv1Ldb0bvu0PYPm45RVicC0Ma8C9quE60byaY5CBFeia0uk0iNeIAa2Hk
 xEZCirkPbCRlgdpOYMG/daR4BemV1tIe4Iv0T5p0otw0p18OFCrT33jBL2LBh2rnjCoc
 t7lw==
X-Gm-Message-State: AOJu0Yyb7/EqkLUPcZ8srtjLnUf2JyZysWgcn3juXW8tgXthWGFC8L3H
 U3Fa3A6ZC8vaaUDU1NTgRD/Kq4bkvs0a59A1KxuXH84JmRtF2weTOOBnDF2puKtFqr7F2UuNOoc
 3bmHxLlVyTAXviwB9Mw/mPvbzKV0AYGnokeNBWgNcjwgTsK9/FjSuaY9JHA==
X-Gm-Gg: AR+sD10P2nS9ycg1czq4DVi9KX1VrhGXd3aha5BiTAt7Iau9UVvLsi2BmzhTa0x0mar
 NyIQGhExxQN/a+Nu2BmG2cm5q1d8DH6ZxRvXOzKEidwsPVb+r2Sz60Qq9dRbcivOk5H9G9svUfi
 W6IUbljdRAtyhw9eqTzfn+KtPlzYRWV/bFWNNOFexNmIfVwAxA8On1fUCnS08xMi4X6aA4Tlnwj
 hs3s3GizBQwfQwsWkA9IpkU1Ur+ADDmITrrvBeLUNMrSxjw8Ec8ZevDSbdbFV4iR54e1KjpGhIX
 jnkANq1rbcsHWEF+5X540s5K297P1ixtXohOGk6SHGo0cUYopla5dDzPAFVkFukkLi0AWqmiNGZ
 8oSt3sgQ6MLT4xTZ7p1zCVV7v688SRmrvUkHWkDt+2mTQ6TLUkKg=
X-Received: by 2002:ac8:5812:0:b0:51c:7b12:5fde with SMTP id
 d75a77b69052e-5283dfdd4e4mr22431901cf.74.1784806558913; 
 Thu, 23 Jul 2026 04:35:58 -0700 (PDT)
X-Received: by 2002:ac8:5812:0:b0:51c:7b12:5fde with SMTP id
 d75a77b69052e-5283dfdd4e4mr22431451cf.74.1784806558356; 
 Thu, 23 Jul 2026 04:35:58 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a63fa41sm157661405e9.14.2026.07.23.04.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 04:35:57 -0700 (PDT)
Message-ID: <9882f9e7-5c05-4a76-95f0-eb8ae8366f62@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix memory leak in riscv_trigger_unrealize()
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zeng Chi <zeng_chi911@163.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, zengchi@kylinos.cn
References: <20260723095911.3951185-1-zeng_chi911@163.com>
 <0d68a8df-d742-497c-a59a-aab6cda454c5@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <0d68a8df-d742-497c-a59a-aab6cda454c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yE13XAqGHpS-p-xCM8oAbXzKFVND-eyO
X-Proofpoint-ORIG-GUID: yE13XAqGHpS-p-xCM8oAbXzKFVND-eyO
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61fc9f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0p7LdH0Lr5XH2CsbspMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExMyBTYWx0ZWRfX1/dcBSwGhkB7
 k9JjWE+y0PD96no2fBzz1Jztd/i7wxzILir3a+0VxqnaJfCGO3eGusHlNmWN58KR7ibFHBLDk9M
 K4BnA2dDp7dhpifcRPJyTeXhB4MM5bI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExMyBTYWx0ZWRfX6IdaMfiSkwW7
 2yuqNdbbOOYJm8toKhdImDS5lKHu2fOZNe13BTO/oixaTx7sr2r1Ri43JbnDCydkhjiNAaQ2gC8
 RGUQROCWhoIRpDxmDwzLgrNe/FupbJPrw1lUwhX1KC+FA5gh4GkWm7xCYKGCdbyDC8jEc/w78EC
 +WC3YugV/1cFaWXbJLsv/F01qsIOrsj4qrqMcJ/R5/MwoHdEDJ7MLyxvyvQPBlKGMPgKzfbKF38
 9MoSpt99N2oFTAqj803pBy0xmXVjHk5YPo+ttV0iARWjz68tMEbVadZNgOG9x76/69IuYDaT+uR
 pSBFXZCcAduLNYEyjXI3MJxxow3xqvqU1jVLLSHpxKyxfHtd13zUsE3NZbbjz84Vohms4gvlZeG
 MBruJ1eYyuSPn4OdBsFuWB0IR9OIWZkp1z25OSlgZBwPU491KZLXPj63EkTTln+IpOZz2Lh72Za
 JEKlXpnJPYS5KdEvomw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230113
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

On 23/7/26 13:12, Daniel Henrique Barboza wrote:
> 
> 
> On 7/23/2026 6:59 AM, Zeng Chi wrote:
>> From: Zeng Chi <zengchi@kylinos.cn>
>>
>> In riscv_trigger_unrealize(), the per-trigger QEMUTimer objects are
>> created in riscv_trigger_realize() using timer_new_ns().  However,
>> unrealize only calls timer_del() to cancel them, but never frees the
>> timer objects themselves. This results in a memory leak every time a
>> CPU instance is unrealized (e.g., during hot-unplug or machine teardown).
>>
>> Fix it by calling timer_free() for each timer after timer_del().
> 
> I made the assumption that timer_del() calls g_free() under the hood.  
> Seems
> like the best assumption is always to not make assumptions ...

Same, I always gets confused by that method. I once asked on IRC whether
to rename timer_del() to timer_cancel() or not but don't remember the
outcome of the discussion, I suppose there was a reason for not doing
the mechanical change, like "delete" is the appropriate action to cancel
a timer?

> 
>>
>> Fixes: 820552a92e32 ("target/riscv: dynamic alloc of debug trigger 
>> arrays")
>> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
>> ---
> 
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> 
>>   target/riscv/tcg/debug.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
>> index 3c0fe70101..ffbdc17023 100644
>> --- a/target/riscv/tcg/debug.c
>> +++ b/target/riscv/tcg/debug.c
>> @@ -1081,6 +1081,7 @@ void riscv_trigger_unrealize(CPURISCVState *env)
>>       for (int i = 0; i < env->num_triggers; i++) {
>>           timer_del(env->itrigger_timer[i]);
>> +        timer_free(env->itrigger_timer[i]);

timer_free() also cancel/delete the timer. Could we simply replace
timer_del() -> timer_free()?

>>       }
>>       g_free(env->itrigger_timer);
>>   }
> 
> 


