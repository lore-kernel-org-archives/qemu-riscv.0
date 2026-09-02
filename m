Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6163FC624D4
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 20:48:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1rt9-0005JU-Ha; Wed, 02 Sep 2026 16:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1rt8-0005JK-H3
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 16:48:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1rt6-0006Ej-Ud
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 16:48:54 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682KHIoc2417953
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 20:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 08sQKBeUS0Q+DiC5YvSIwZRoNWiSVPDShm7quIIK7hs=; b=Q7dIxGvy3xN6np9f
 RWfg8JTh/1Bi6jg42vlu8o3oaRxWwRwehk+5T5FJ4GhjFHbXp/dTfVvI4SqKRZej
 a16E4w1gfomeQShFllZS325RAmdSXX0Dzf5qrdq+4iwaosLRmNhwkQYGjsiU+Qg4
 0BJ5WMDxU0yccTeOoaShoxnAoI5v6PHiB/fY7wc2KsPIu2GsK4r3JF7mBCUnoLwf
 XP8XvDLPTr0EI/jw1HKb2EbL1eB7h9eybycmAgiCt4WjUODa3DJSJfCqJMkWnMxo
 3vx1o+19AEdg0SOV4/SuMFn7Syt9OQRPVAWpTLyz6ZcOinx+I1QKV9QjZazgKPJw
 IEi8mg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdshx7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 20:48:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93915f50a5cso64156585a.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788382130; x=1788986930; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=08sQKBeUS0Q+DiC5YvSIwZRoNWiSVPDShm7quIIK7hs=;
 b=FQyrGYwZXgbl49omkw9pWOA1xWuHGxXfOxVLjfzPpqRZ8x3h6DkyrAEE1+vxG64Ec+
 jo8yZAFSQpDNe+/QNu9Dxisecqn/1gSJU1X+dz/vPO2kgV+ASHYsR7xATVc931D8iq29
 DwohaAwhqLyjQZ+FnskJEmcvi1tcsYbC99duDOOab67krZk3PumdF0+GGpcp/A+MneAq
 KRBGfI/NGKF0WnJluxauDE3s+78mOt8sWbMwjwXqca0IhpVkPuBgy5svxJj1s6zROcRp
 /Pl0Kr0ymdn/SS74ZgeJm1ObhAXiuk3mEqsHmtWDhX1OoqZoK0TRiZEV1FeVE5Aq6T2C
 8paA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788382130; x=1788986930;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=08sQKBeUS0Q+DiC5YvSIwZRoNWiSVPDShm7quIIK7hs=;
 b=riPDJFn3g4nPbPO3oZ6eHkt3NUw6Q0fuG0PzOrmn86LsWxaaekxa9XC+4ECPRBs8T6
 8hSX4RWA3PQ84tFHj/wdyn/nmD2vIIVp6Hp/2xOaQCLrv3bvEsp19QoHwFmAtqZmMHOr
 eH7TxI5O2BfqXjLlFnLt+8cfgyf2iehrAuwnbxOJbfu2G12FNmd6FwDG8eHdn2iu+WVV
 iz5rNyjcfmrecuG/z2JCeSQTU8+kdwiOfIbfJ5WJ5VBiJhxCe4BfEUuVJv383zdKZT0v
 Ef7m7zDInpL20Oy8tNWPAGQpPjyxqgBki55YP1DhzVG5AiXQIKgum32r/scVzz1ymXkk
 t9Ag==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHCWz59qAObsidXg+n4SC84hw+E+LFEI99szZS1g/14Fl8zmF/xPGgwKmRYJCCHAe06sZdDrHEEiyw@nongnu.org
X-Gm-Message-State: AFuF++m+08AJVszsvaoBRsQkCTb9YlW1ZhUQ3ddNNCh9jMv5FYJAsvb3
 VbyPPyw5gTQS8z8vdXtrgVr0R0Y9UzFLtt/BdtZnxNmISNe11CcSe+jWTEjLnyrw/uuh128Afrb
 WF8+i9Ysy2XcB/dHbHFR9YoocaD+vaV2N+7LDdbBszfjs06Otj6Qnncx+Yw==
X-Gm-Gg: AYBFou3WIm0TPfijDN//q1qB3zuvroyT05aIQ4almdoAxmumapfCzo/A0VnI7umppwl
 7cBNQsGpgUFR+nl7CEzMwE5FP226p0L7JYSw2DkGPYS8uEvKa1j/yI6YIpFPu8KEhyqloG+nDVT
 Zc4aScKxNNfng+ChvraoBsHux11KxP0/VdoHRO5vhGCNlNnidbhQwtIbcA5vppuEJkv8VDNq8xD
 Yy6FySCY9Nz6mPLkeiErCZGMaNRTnrQXzEDsNIz74+k42EWjlVRnPWkGsOLJNwiay82J9MCbFrg
 4Pbw5bOR0rYFFHLz1AbdGYecBq8jJapwUerkpB/hcki0/xq835Jh6nrDwq7Ph0cwc15FOGjuKN3
 sHzmeXUY5rC0O2i5CjlSkzU5ryFMNeaadOQ==
X-Received: by 2002:a05:620a:88e:b0:930:9cbc:7121 with SMTP id
 af79cd13be357-9396deacbbdmr203134185a.3.1788382130563; 
 Wed, 02 Sep 2026 13:48:50 -0700 (PDT)
X-Received: by 2002:a05:620a:88e:b0:930:9cbc:7121 with SMTP id
 af79cd13be357-9396deacbbdmr203128885a.3.1788382130074; 
 Wed, 02 Sep 2026 13:48:50 -0700 (PDT)
Received: from [192.168.69.200] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484492ce236sm9890668f8f.35.2026.09.02.13.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 13:48:49 -0700 (PDT)
Message-ID: <08547223-7789-45de-a0a2-251f412cedda@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 22:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] accel/tcg: Document do_interrupt() callback
 contract
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-6-philmd@oss.qualcomm.com>
 <1251f0e3-237f-4f31-8d2c-0dae5e9962b5@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <1251f0e3-237f-4f31-8d2c-0dae5e9962b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a988bb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6ax27t2Q9qs3WTDDNCkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WxZoHrnMVR3qTJn9O7528nNEpSYNhnDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4NCBTYWx0ZWRfX3ApFKa5jVK7z
 0VvboJdE/AOndrztYyRLL9u8/+fsJMeW4HpjG71AlLLd49TCZ9ATHHCD0a8C4V6tf56SovwMjVI
 TwY3dqoHxrm2R8Ywlh5B8lPHLL2xwDAEQDrsdECPXntfMONr3NKqY/Mc9kxP9G+Fc52L06eaLcq
 BbSj/U8MSHPSnbH7tpTpEQZCS7t7I3UqV+oW0NoucgVOkMgkwRGxz3CPWCKwOrJg9I2xol/gU/v
 8caUIAYY7EqdkGli5s2ktBT93MKKEvVypDh/RWBstqrhYR7B5nT+HYBUru4FnhBcmAMKeV/nSlV
 ElX+zkDSXDmEWejS5Wal90V0tg2lp+lYa57GALhDavr31dsK8NFuzoo6mLT/VAG0MBEHBPEZiVv
 sx4LKywuYdpUiQfXXr1nCCThiqRMVLMbQ4kJdGQhcXmfy9KvAz+rYKZtw7sJogIntABrSHMbfX4
 OzV1Qb76qZiZ25+pXSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4NCBTYWx0ZWRfXxsNmVL1cGMP9
 rck6VRIAnPtDXO+7Zomw259zqQvLJ+J2M4etx99iJ/NATkXixJ1gkeJRQhRcDMa8uQWqxGCNYCL
 dcEqE/TuUmHZ0OO49DyxD82LB8gJPMc=
X-Proofpoint-ORIG-GUID: WxZoHrnMVR3qTJn9O7528nNEpSYNhnDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020184
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 2/9/26 21:54, Pierrick Bouvier wrote:
> On 9/2/2026 8:20 AM, Philippe Mathieu-Daudé wrote:
>> Expand docstring to clarify the handler is called with BQL held.
>> Add assertion that this callback is mandatory and never NULL, since
>> all targets must implement interrupt handling.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   include/accel/tcg/cpu-ops.h | 11 ++++++++++-
>>   accel/tcg/cpu-exec.c        |  1 +
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
>> index 87850402203..13df70eaa9f 100644
>> --- a/include/accel/tcg/cpu-ops.h
>> +++ b/include/accel/tcg/cpu-ops.h
>> @@ -169,7 +169,16 @@ struct TCGCPUOps {
>>        */
>>       vaddr (*untagged_addr)(CPUState *cs, vaddr addr);
>>   #else
>> -    /** @do_interrupt: Callback for interrupt handling.  */
>> +    /**
>> +     * @do_interrupt: Deliver a pending exception/interrupt to the CPU
>> +     * @cpu: cpu context
>> +     *
>> +     * Called when cs->exception_index contains an exception code to deliver.
>> +     * Updates CPU architectural state (usually before executing a guest
>> +     * exception handler).
>> +     *
>> +     * Called from cpu_handle_exception() with BQL held.
> 
> Would that be clearer to ensure this with an assert instead or relying
> on comment?

This docstring contract is a help to implement callees.

> 
>> +     */
>>       void (*do_interrupt)(CPUState *cpu);
>>   
>>       /**
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 609931a0d6e..2fae2c024b8 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -1059,6 +1059,7 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
>>           assert(tcg_ops->cpu_exec_halt);
>>           assert(tcg_ops->cpu_exec_interrupt);
>>           assert(tcg_ops->cpu_exec_reset);
>> +        assert(tcg_ops->do_interrupt);
>>           assert(tcg_ops->pointer_wrap);
>>   #endif /* !CONFIG_USER_ONLY */
>>           assert(tcg_ops->translate_code);
> 
> 


