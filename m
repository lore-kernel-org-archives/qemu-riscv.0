Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E339CA5FDD
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 14:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCeOf-00060Z-E3; Fri, 02 Oct 2026 10:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCeOd-0005za-Nr
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:37:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCeOa-0002vQ-IK
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:37:59 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 692D9qWW974696
 for <qemu-riscv@nongnu.org>; Fri, 2 Oct 2026 14:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q01vJyQDyv1J1ozQrWF7M+LRg215kjPSt9JFVc4UZRk=; b=Qj2rgvif9TI3+rq7
 +IL0oIqjCsuPBMgF1t0RP4aE8FfFcQDmhRtUV8A+9+hRzBvltKWcWXsMg7aWI/Rt
 kXd+j9h5+zjnSkj+FKk/xrDe7bWkrQVCIcJ+cVkNuPJwFDCbyUzJM6CQw600JpDV
 cAu2smGRplf8wf6dQo2qvpd4sDFgAmfXpryu8f5DV8+6VNiE0Ia2L2YQoVAyJkUI
 FtPidUr3hM/EEL31tNRw+JLtOHkVPjUUIGxrgxcl5oAU112nNbK7gIXZuRa746x0
 S1kRfQvTerFG4F06DJObTy5rtcpe/ukL64/HD/BAbuoUstBBkfesVfI4YPCwdEwD
 VEbaMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgcf4a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 14:37:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cb7f9bb86so404924385a.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790951871; x=1791556671; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q01vJyQDyv1J1ozQrWF7M+LRg215kjPSt9JFVc4UZRk=;
 b=NPKbfTKh9YoigBT9q0SNPj3nEFb3Ed8js8XfrMhi1id1KfxUox1fitnFfgNU7g26g4
 zeAgTSuhfobfU8BUCxkuA+Rd74u+XkKI/hVsl9hLQAgjuraxyef/X+jT1YpMC2xVVE6V
 67B9REi/bHeyv92wfGFd5FSojf1gd/zIeRdYxu0pQbplvXXr7YnczOSpndWmWHvv1Jvo
 ia01uk4LJYcK8DXrg68tAqLRn67R8PAsYflULt7pXalBCTAODrjDPhtHam9H1Pc3TgS9
 7KL7fm20jKMvbBrsV7+9iyJi6YhXdD+LZVOgmZ5ewCyC8Zs5pXY/S3B+8aIr3t2HAJA6
 of2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790951871; x=1791556671;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q01vJyQDyv1J1ozQrWF7M+LRg215kjPSt9JFVc4UZRk=;
 b=Kz91sUm+gPRbv9pPmEnim/qCVyglwx2CCVqSwge/vPf6Yjdfv3d2119kyityOMrgI+
 CUW6xApYcT9cEOUDN3zakn7y6KncPVzx4mNkd6vkeaWmkEcsk+x0Lrxus7YBjMH5ugzX
 u0566AzNFGpBEIfqgr+++jvNQ0xoZMAFQPLLMrijWpyJspPGB3rtJGHwKr3Ue/7aQFxv
 FJZArmbITVAARd8q/aNjZzOUz70sJb8ApoyrI8q8Pqwi2hnAvIrfWfwcfCHtVQx+rOnH
 cuYpZV6RaErzJ+CPJ4Vm85v4K1U8l0NRNhsJiWSUoAnl8esomwn4yUjwhb6b8L0Yy8js
 Ywmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzUyfhN//ows3fo4kqRRj9ZCpqEU7tgAxL9JOkp/vkzch+n6SdWoKI0TFl3UEM9GSpmLIXuwb/kqlBS@nongnu.org
X-Gm-Message-State: AFuF++nASOrESZVbBuAsVK6kn5gu261QSFe4grkL8PtMV8sFT4r3a8lD
 4QFW/YTPvL/LtiEgJcy+5OeD8K3kadG++uKRQSILqRjackCQpP+DXSZTHnNHHD0SBNeE18arzIM
 KzIu44iVvaeeQk32MWNO6/6W6lFnZlAbOZ07Jm4vt9li07xgNGZV1gBrZKQ==
X-Gm-Gg: AYBFou36C+894Jd6jB9jnSnvdQalB34H0rJ6pbTNvz2R1weY4KX3vvKdjiUtaVktcj0
 n5p9XvZy8y7fvKQ0+6FgX6JaXec7SI9r/pIbNKWM/inZPyDa0xuMzEiWSVxbYyVMTvqj2g1Zxsa
 TV3igxPNM1yv660lyYv0T9cV5ZtEgRJuRsi6t/WlEazpz+ewujl0VMkPgIV3obA0KEVvjqda+zc
 bvngGgadnJqXRF8XQtq7zxRP5iiOZIZ+liTNNJXMep7tpnfJkhq0HbHvK+5iyFsRebkhFtZptqS
 tka1poTZSf9slejqyu7pZEcMzuXHQkh89pa1yesqRYQ0tuqeFs64vUjuLvvoUZxl7KOwv/jrTdO
 Yd1kvjOOxkAeRRkfo3L7ISw==
X-Received: by 2002:a05:620a:d88:b0:93b:d7a0:d9e6 with SMTP id
 af79cd13be357-93cf19ccb7dmr525640485a.64.1790951871341; 
 Fri, 02 Oct 2026 07:37:51 -0700 (PDT)
X-Received: by 2002:a05:620a:d88:b0:93b:d7a0:d9e6 with SMTP id
 af79cd13be357-93cf19ccb7dmr525631985a.64.1790951870747; 
 Fri, 02 Oct 2026 07:37:50 -0700 (PDT)
Received: from [10.111.137.66] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b382f9bc0sm6159426f8f.41.2026.10.02.07.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 07:37:50 -0700 (PDT)
Message-ID: <19c91bbd-894b-4d23-86eb-00d68482aa8c@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 16:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] accel/tcg: Document cpu_exec_interrupt()
 callback contract
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-5-philmd@oss.qualcomm.com>
 <CAFEAcA-9R6ov530pA5FV6=ECr9qj5HP7yz=O4YtyCDJDP3qc6Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA-9R6ov530pA5FV6=ECr9qj5HP7yz=O4YtyCDJDP3qc6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1OCBTYWx0ZWRfX0xNn3ZKSkF9Y
 YQA5GSe2JXxGNGCno87KNAKpqjVyR/joHnUs4c9HTHx8HfP5Gbfvp8gW06NQomOW6CTPW/pn7RM
 aAAFx4yPOVKjcvONCLhFqecCCHnfYao=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abfc1c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yKpZr8mYJqjc3PTj-vgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1OCBTYWx0ZWRfX86Dg1Pj+Dr9W
 rXE8E/zE6V3oIs04BOZ1KH9QbSdDuDUlyeQnOF4Rg6jX3/q7ooBg/kuxKY3O2OYWcM5eTzlgy3m
 YL7MeAEkRdWMiafC8YKT44dXdyw8QGaApTVAB+/9odcQp5rrBa/ZHDC5RH85pKYZNppudS++blM
 oOHeoUPhQJFwbDPYoKx/Q0Npa+EJ8HvZXdcujckXljmZctCn9JFbV48JMU6BthOJa/tScacWXz5
 6Ft0Btgm7sfqE5MT5PuJqJrOkLl7M+dQEzitHjaUsGaz7llQ6cDYRJOy+FPFL9dPHMpbVVP5Cew
 h3f3JjN0NF0YdYm15GbGpGC7WgbUr3SX6GvNzE47W6Qm3OmMVXUJtOylvDhXKV7qhH09pA/Ok/n
 jDEkUsyteCXIfv9safOu7cLRgNExH0YJIKforat9FuJXd0NpLk+HAu+6gKIwhZwpO4Mq8g1ayOL
 mN8CcEnV7w5K+t/BTdg==
X-Proofpoint-ORIG-GUID: ctgvwMzz3-ERLvC3CmOvfBAAIok5NeSj
X-Proofpoint-GUID: ctgvwMzz3-ERLvC3CmOvfBAAIok5NeSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020058
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

On 2026-09-08 18:25, Peter Maydell wrote:
> On Wed, 2 Sept 2026 at 16:21, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> Expand docstring to clarify that @interrupt_request is a bitmask,
>> the handler is called with BQL held, and document the return value
>> semantics. Fix typo in arm_cpu_exec_interrupt() documentation
>> (s/inrerrupt/interrupt).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   include/accel/tcg/cpu-ops.h | 15 ++++++++++++++-
>>   target/arm/internals.h      |  2 +-
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
>> index ded7cc700df..87850402203 100644
>> --- a/include/accel/tcg/cpu-ops.h
>> +++ b/include/accel/tcg/cpu-ops.h
>> @@ -171,8 +171,21 @@ struct TCGCPUOps {
>>   #else
>>       /** @do_interrupt: Callback for interrupt handling.  */
>>       void (*do_interrupt)(CPUState *cpu);
>> -    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
>> +
>> +    /**
>> +     * @cpu_exec_interrupt: Callback for processing target-specific interrupts
>> +     * @cpu: cpu context
>> +     * @interrupt_request: Bitmask of pending interrupts
>> +     *
>> +     * Called from cpu_handle_interrupt() with the BQL held. Process the
>> +     * pending interrupt according to the target specific @interrupt_request
>> +     * masking rules.
> 
> I think we could clarify this a little to explain what to do with
> multiple pending interrupts. How about:
> 
> Identify which, if any, of the possibly multiple pending interrupts
> specified by @interrupt_request should be taken, using the target
> architecture's rules for interrupt prioritization and masking.
> If an interrupt can validly be taken, take it (by updating the
> emulated CPU state for an interrupt entry).

Does that update sound good to you?

* Called from cpu_handle_interrupt() with the BQL held. Identify which,
* if any, of the possibly multiple pending interrupts specified by
* @interrupt_request should be taken, using the target architecture's
* prioritization and masking rules. If an interrupt can be taken, update
* the emulated CPU state for interrupt entry.

With the update desc I wonder if we should rename the
helper as cpu_take_interrupt()...

> (I'm trying to get across that the function sets things up
> for execution of the interrupt handler as the next thing, it
> doesn't cause the whole interrupt handler to run. But maybe
> that's obvious enough we don't need to say so.)
> 
>> +     *
>> +     * Returns: %true if an interrupt was processed and the next TB should
>> +     * be restarted, %false to continue normal execution.
>> +     */
>>       bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
>> +
>>       /** @cpu_exec_reset: Callback for reset in cpu_exec.  */
>>       void (*cpu_exec_reset)(CPUState *cpu);
>>       /**
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index 1775835ad50..551a6b4a872 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -1248,7 +1248,7 @@ static inline const char *aarch32_mode_name(uint32_t psr)
>>   }
>>
>>   /**
>> - * arm_cpu_exec_interrupt(): Implementation of the cpu_exec_inrerrupt hook.
>> + * arm_cpu_exec_interrupt(): Implementation of the cpu_exec_interrupt hook.
>>    */
>>   bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>>
> 
> -- PMM


