Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F52AC5DF70
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 08:48:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwFUX-0007Nc-Q7; Tue, 18 Aug 2026 04:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwFUW-0007NJ-2c
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 04:48:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwFUU-0003nj-5a
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 04:48:15 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67I8BIYR243018
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 08:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pXwYInvkmu8G0HskQ5AMBGpvs8HO0gTNnQT0ehKDGbE=; b=VW9S/1PcvukBaX1c
 Drso6g0D/d/vOFaNfI7unjbwudlDiVqY1jVY0RLlu7QgL8br8ozRgN696vQJizBX
 5ICGX01nLKiY2Awj/FnRiEOoTk7oW/xwcgrKcAa2pMWPuXJuxbJ6LT8yZvHlwXx9
 1nYAbCfD6Q7JeSC/H3std++KzodM8SG/YXYQ4pm0M+kr6WSOmJDbSqGA+WgTw4cF
 8Yr5VpudpKtvCZEupt3HWY3DHzsl9DbWbFmUyrrWKEu6434yMSjY2A4n6Lv3eBXa
 L2N8lKfDi2stJ5z8+S3V4r4PCEMEjEe9/2exGt4mNm5BByleOJhzMs3VOvkRpOBg
 1dCAjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hm04-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 08:48:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-936cadb0e8bso373863185a.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787042889; x=1787647689; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pXwYInvkmu8G0HskQ5AMBGpvs8HO0gTNnQT0ehKDGbE=;
 b=kDaKQVzR64B1q2g9Viw/YEbPjbddqGMegeqrzORMefb2uC+Zj/K6OfnHB7ItnAMPY6
 dGXAB5aXvgRwZ3tCpoAOgN2pmRdWF1RIBqMLmxTxP7cQLNmw1K6LXPyH1P6LyEstqmTO
 lLQ2XwVJM1enNFZJn1bA+HjV0plfMDTxr9zFEJntHeWJd1KiMm/o8x7FAhz/KYHIPXGs
 AieCPGsa1odDOVG7PTiTTaVgYvOdU2UWy/WqNKPIrePIx7SunXPl9JdohLf2vAHnWG1I
 yleOCVJv2278BLezqCCwH8E4Qqyqk4SMH0//ifDYdU5mo07AHboJu0CNHWR/GNkEbhWi
 Hysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787042889; x=1787647689;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pXwYInvkmu8G0HskQ5AMBGpvs8HO0gTNnQT0ehKDGbE=;
 b=LW27cS2DgBUiPMBziweJ31tZgzDgD4kC0mfrFRChGmqkUwpDS69OtWDLGPmtzifmZR
 R67TH9TatALSFBjGLAXXt6dtDWXo4xrWIXJ9CYTgTqcp9QwJ8brgAinIrjCBzGZHxx16
 lxBMhF3c+GBPe6McAobOFQnWbo/biD2fkA37hV3Ju5zaefkYFX3iQh2a4p+AZ6wNn1Yj
 CqwQjmAaVidA09yI0tzpkzp07H4Fw7jvHVeVSkctsjtoVzMEZk0jTvNl3Nk+sk6s1rY8
 Kv/hzE+huvWH6n31/VdkuYE6z1Gt686hDDbUs8qDFbJNIHwa9zdHHxnTrwEcOecWGg5r
 FfcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrmaiMREzJDFNUK2oBf3CDzYwRAW62yYE6p0l7CieuUkd2Ff4soXegUrQlzeoI2ynPd8XOrEz8fvui4@nongnu.org
X-Gm-Message-State: AOJu0YwMvaNq2gxj6h1zJ+v/BOsjafSZKGVY2r7EgotVPqaFqheCcVJr
 NI1YVhlZYGzVzk6WKZ49HTfip9PTgzE+KqfL7UObdNFVlZFMzK/55mErbDSnsv+WmVhL+0EH2X5
 mEELC0gonvO+LFiE8Wr6z5axgif2GcCXLJNv7H7ytxSx58MSJ95km4GQ8LA==
X-Gm-Gg: AR+sD13DkPgkxnccUTEu37Zc5PM4cdNFyLcRhu8DpG8Ri0b2AZcYaGp5jKwzXVn/aNK
 NwuWHKSahZ2hJPgosbo/LFP80UogtZG7m/Z1PZWne9VsTvLw0yiYoWIiVEF30XJmOKkoYu/mACm
 Hv3lfncW2on3jLu7h65wCxEqqHBQJ+y3v5xLKV83qtQxOCcNjWxzdN7NbAx+ckIBk1/tXTJkd07
 9lyJSJUr7UHGk3U+YXgHL2B0x86c5lAZt/DjvPFing72kZRqlQ3D/3hSwpcdKarudEQgWUN5BD8
 TjeEQIbmPZGUDDYZEccM7NPGQ7DqzeBNcRLogfHeF739idEbxTa+Ep/hQYRBsbjUpdW6KpvE4mo
 1b6zSGxa/Jp8IG9K3UHvwEs7hV4jHXMGKpKc=
X-Received: by 2002:a05:620a:408d:b0:923:45bb:a95c with SMTP id
 af79cd13be357-936d1fd9bdemr2856006685a.10.1787042889434; 
 Tue, 18 Aug 2026 01:48:09 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:923:45bb:a95c with SMTP id
 af79cd13be357-936d1fd9bdemr2856005085a.10.1787042888909; 
 Tue, 18 Aug 2026 01:48:08 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d078517sm103963505e9.5.2026.08.18.01.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 01:48:07 -0700 (PDT)
Message-ID: <9e83f348-0d27-49a0-babf-789a8817d78b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] target/arm/hvf: Lock BQL outside of the vCPU inner
 execution loop
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, Alexander Graf
 <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Scott J. Goldman" <scottjgo@gmail.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
 <20260813181640.6537-14-philmd@oss.qualcomm.com>
 <3fa59521-1420-49e3-9d73-652148f946ea@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <3fa59521-1420-49e3-9d73-652148f946ea@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfX4L3higQsF7v0
 xP2UbfYnBZ+eHwhF3M4xX/e9c/Gu9yI6N/bn19D8KCKoZ/5bk7wo1ilW1One0jx8MtioP/Or1lS
 rW5E9T3gaVuJXiI8TaHjxERutb8RgeAooVjWrzWwajaUJ1gRRCAyeBwH9nknbGK0pBcGP8X+pAi
 +NRKT3SvUbr+7VO/f1aNlAa81ZPXuYMT74yZ02khBTQjg2sSkTyvElNMWY+jUFq8WP9+tFi24+j
 65FXVrhDxXhemKJHQXTv7OhaRzNoA+jr3aBf3kS9ohqJGmiJ2cbvxPRjyGNKFqLPVc1jyWdtyAK
 2wPq/MBVi8/Xjlc/8bjs04gYHTLSER8buEtNOui2Gttm/pI1YovFCPHkVr14ubhGlde/VEZa8KO
 vAMWfPoA0o5A/ebOx6vedG0W718FFCP50TdUDTX5GgAUeewOlWaLFNTi8Q6XE2fZAf7rcxzTE06
 Yb6v+D47ypkgdN2pCCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfXxolVDwfNAsy7
 8+QNliZUS3cO350rnT7V7JHQ0TuiniDJm1pSbXJtNxSpB9OBR1SZRQHp4W9pUshhqf52+2dx03j
 t8gCyS8GTsrva5/+q9jnrDp1K110Xuo=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a841c4a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mLG9MJvJpvtZyw53qYgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BwqlzvJiALfQU9lT7K5XbuzmAu_hwsc6
X-Proofpoint-GUID: BwqlzvJiALfQU9lT7K5XbuzmAu_hwsc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180064
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

On 17/8/26 18:11, Paolo Bonzini wrote:
> On 8/13/26 20:16, Philippe Mathieu-Daudé wrote:
>> Reduce lock contention by acquiring / releasing the BQL
>> outside of the entire vCPU inner loop.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   target/arm/hvf/hvf.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index c14ea54a67f..9c6408d2e25 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -2598,20 +2598,20 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
>>           }
>>       }
>> +    bql_unlock();
>> +    cpu_exec_start(cpu);
>> +
>>       /* Inner vCPU loop */
>>       do {
>>           if (!(cpu->singlestep_flags & SSTEP_NOIRQ) &&
>>               hvf_inject_interrupts(cpu)) {
> 
> It always return zero, so you can make it void and change to
> 
>            if (!(cpu->singlestep_flags & SSTEP_NOIRQ)) {
>                hvf_inject_interrupts(cpu);
>        }
> 
> However, a bigger question: who calls cpu_reset_interrupt() here:
> 
>      if (cpu_test_interrupt(cpu, CPU_INTERRUPT_FIQ)) {
>          trace_hvf_inject_fiq();
>          hv_vcpu_set_pending_interrupt(cpu->accel->fd, 
> HV_INTERRUPT_TYPE_FIQ,
>                                        true);
>      }
> 
>      if (cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD)) {
>          trace_hvf_inject_irq();
>          hv_vcpu_set_pending_interrupt(cpu->accel->fd, 
> HV_INTERRUPT_TYPE_IRQ,
>                                        true);
>      }
> 
> and can this be changed to do something like arm_cpu_kvm_set_irq() instead?
> Having the function called only with level == true is a bit unsettling...

Digging further this other change from a86024eb2df56f looks dubious:

  int hvf_arch_vcpu_exec(CPUState *cpu)
  {
      int ret;
      hv_return_t r;

      if (cpu->halted) {
-        return EXCP_HLT;
+        if (!cpu_has_work(cpu)) {
+            return EXCP_HLT;
+        }
+        cpu->halted = 0;
+        if (!hvf_irqchip_in_kernel()) {
+            timer_del(cpu->accel->wfi_timer);
+        }
      }

> 
> Paolo
> 
>> -            return EXCP_INTERRUPT;
>> +            ret = EXCP_INTERRUPT;
>> +            break;
>>           }
>>           flush_cpu_state(cpu);
>> -        bql_unlock();
>> -        cpu_exec_start(cpu);
>>           r = hv_vcpu_run(cpu->accel->fd);
>> -        cpu_exec_end(cpu);
>> -        bql_lock();
>>           switch (r) {
>>           case HV_SUCCESS:
>>               ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
>> @@ -2624,6 +2624,9 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
>>           }
>>       } while (ret == 0);
>> +    cpu_exec_end(cpu);
>> +    bql_lock();
>> +
>>       return ret;
>>   }
> 
> 


