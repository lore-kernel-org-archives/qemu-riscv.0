Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43616CA5FDD
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 15:08:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCerZ-000633-23; Fri, 02 Oct 2026 11:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCerW-00061y-Gn
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 11:07:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCerU-0005fQ-Td
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 11:07:50 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 692D9ai51605425
 for <qemu-riscv@nongnu.org>; Fri, 2 Oct 2026 15:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +dBTReFVPOMQ8NCk/rb/dTabM7Ldzum7OVhpPV1Xt8k=; b=ZVD5BQTrMXqVT6KT
 9BZ+Md+RRHnZoDQEuvxCzuEXA2Mq8+vuQAhr0VHL0tyKwt9ouRUm8f8BUJpNt9c2
 hdee/AemN+xMOVnxS9BakCkW8uMiwNTBJ6ugFaRb1JG4fCEKHRB4z2EsYIzsRvGb
 HEphEPsHeA2ys/UilEt/0/CQXIL3u9383yivQsOHP74ah/xcYE+2fbBgI+E3pQ4r
 VAkQ8diJtdahY8HuyunYPxYmZT9e/msZ6pIpNHN45T93/7rCSa9I4bg57N7AMhrb
 mXeNQ/qJCb5y/xipmElDWRWgChI/B8L2nupAku19TX1r+bXJRBywA+RuxotxAjtT
 hr42PA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tkn2y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 15:07:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7bfa915da7cso1444944137.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790953666; x=1791558466; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+dBTReFVPOMQ8NCk/rb/dTabM7Ldzum7OVhpPV1Xt8k=;
 b=dtsgq300mM71Eb4FruY4TVToB0u5db+8wzxTgcUygLzYeujFF55LdpmKf2a9J+YtNI
 GMCg5Anc4y8FBiPt+TbZftXgKuQsjfS8eaqG/PQ59LDBZoS/GLoFS9KL4IoaOmHM92zP
 bqwd5MNZTXGdEB6iq8BVb7I7HllPshXRYaE003B5uiyv5hayzKErn0PGUhNHRjMm8jfw
 ppXAiL1JrtfNebS0JnKxnCu6lTWdDmPPhW1LGsNsXYBU1Mc0NrYb/j8QkzEUmPcm2srD
 DOiLbXeUlSjEzaWW3NZ2kvgL7dOaBhwUecoBzrHrVotOANIYQD4ZnnFnmpxm+Hpfw0d5
 kHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790953666; x=1791558466;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+dBTReFVPOMQ8NCk/rb/dTabM7Ldzum7OVhpPV1Xt8k=;
 b=FNEPu4rYBkYS+q064jyFIsLjZrL05qkmNPtSAxGwXQ25oSqwdSUNWIhjaIAqoB5SNG
 mSjbeghkCkSxTe94cale87VwiF8c2POXX/2DmtjStPE+/VZRU2scOk7JoC48GJu8uUBO
 kbwcM3egoUMm7RWtYw0lnXuVwDuO53vlmNqZry/fR9W/9uW89ncI3U8W89vXcWnWmAVn
 4m/vL2ttvs8m51EKMRN26iYKSJYEWTibWQyCjVuDXaMGZOd2gV/gysnTdz6X4mx84Z9g
 8w8QyVTG9RWo+6L1DiGRZXTpRjzKw6GIjhLUNvb/dNf8xzTG2M2+JbC5j7dLfIr/RWpz
 H5xQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByqMcjoHxOaZkRurPRfqQxjRn3soIOaJg11aNO+74WlnyKy7uz8+B8jBSmjx1l+L8orK9s+MyBP7No+@nongnu.org
X-Gm-Message-State: AFq9FYJlSX1Lr2AcQ6kqeHUGshhIbvz1vZpQdbw9E/NiBNGsKe1bdOJf
 a26SNppMrjlLYgx/SNkaeq38r/x7O+YGPoqTqN9D59EucrjhkMXE6exnIoSo5Pei5kZivrnKGPa
 6nN9WW+ZQAm0RwXn2g0Q/+EieXMn8YHwHv2eVeTz5RQM+waINMj7UJjPeUA==
X-Gm-Gg: AYBFou1TtB9SUloklH6F7I3XwLkdqLOYmHHSrvXhmrLeDj+CclCrYLoG2JTitJNa15U
 DGdVhVsVR6PdruPOHg4f1xFV01f2LItGmaRhDKRbjypaAcpgDjHtX7RBNtKQ7K9n5jf5lxRDalT
 XQiMbQmTo7z2sCF0n7XTMxg+I0qW5sxnHGe3moM6SgpDxS/9QXS8oUmgn57kVxUdNSjKft7zeia
 xNaksMylT8YJRVxzoRe+bn0ug07GvVZY8+hYfT7d3dIFTOo0yfvBrInOGZuEu5HZlnd/cBy04YS
 1VJF3bDX/HHNQx7LUWGGE3kRlIiXSkH98oZ8kzKNlY8PBlxnMDrDyMXCyy/iic056LafYHN5Q7C
 yrt35Wpc=
X-Received: by 2002:a67:ce8a:0:b0:7c0:28e2:f9c9 with SMTP id
 ada2fe7eead31-7c028e2fcdfmr893053137.29.1790953665866; 
 Fri, 02 Oct 2026 08:07:45 -0700 (PDT)
X-Received: by 2002:a67:ce8a:0:b0:7c0:28e2:f9c9 with SMTP id
 ada2fe7eead31-7c028e2fcdfmr893040137.29.1790953664068; 
 Fri, 02 Oct 2026 08:07:44 -0700 (PDT)
Received: from [10.111.137.66] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280bcf0fsm99189415e9.6.2026.10.02.08.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 08:07:43 -0700 (PDT)
Message-ID: <ba7ed9e4-e53e-411b-8bd3-e4258fa23fb4@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 17:07:41 +0200
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
 <19c91bbd-894b-4d23-86eb-00d68482aa8c@oss.qualcomm.com>
 <CAFEAcA-7DDa1u4OsH05EuD6xt0rCVwTVeQE+ppRX3tdCqg9kxQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA-7DDa1u4OsH05EuD6xt0rCVwTVeQE+ppRX3tdCqg9kxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t_3elVwAW8dib4ilXO19H4J4icfk_kQk
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abfc8c3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DB6GxJfrPxAoVkK3jkkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MCBTYWx0ZWRfX2EOJteROCTPo
 8cZy7CQ6HUUony8W+fq94Bt9T5LEDgNfM2q5na9dTjFBMDwWgDavvvq4DwzE4w82tG4aNOEibQ9
 esdajpafgyM4fm/ru126WQfrA3H3XkhLcJiEIyxI4vVP9JBnNPM8JK4sAk0U6X4LuMIm51PGIEE
 d9QgVV1KkMfKq5pvKVcKyZtSOhV+/7Ez3OxIGYGEp5Qdgo1y7/3G3xFCdUjOz1n+svwKUZfpfBS
 MCTuw015m0HXOXHMQUssYBe0kumOmgZK4UC1ZVwepvuKWqZcajJdMNIF0AbeWK7WSGt046JKO9N
 aG/60RgjM8Snj+avH7Sz8ONrewucJJZLWPI4FGnaESI26DMBZfSu2w5s+c/n5rNsCz7JFMFQ4bE
 PrYiLm75+SZwtVzT7Pe9OEEDzZwxtrDb07vEiMVHLFssv8JPnArfi3gwmAHjWCbCErm50mxYlM1
 2KNY6yHjV3qQHAVtrQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MCBTYWx0ZWRfX4hx5y8AajrZq
 crEZTsUd9X1tynsH06OSKtyt2/23CjinTRA77wBAKCu0+FxPJ4JzLlJehwig0GnbZ1Ze8au13dw
 d+2JWcaYFEz1IBQMm6LfS4L4qsPosaM=
X-Proofpoint-ORIG-GUID: t_3elVwAW8dib4ilXO19H4J4icfk_kQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020060
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

On 2026-10-02 16:46, Peter Maydell wrote:
> On Fri, 2 Oct 2026 at 15:37, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>> Does that update sound good to you?
>>
>> * Called from cpu_handle_interrupt() with the BQL held. Identify which,
>> * if any, of the possibly multiple pending interrupts specified by
>> * @interrupt_request should be taken, using the target architecture's
>> * prioritization and masking rules. If an interrupt can be taken, update
>> * the emulated CPU state for interrupt entry.
> 
> Looks good to me.
> 
>> With the update desc I wonder if we should rename the
>> helper as cpu_take_interrupt()...
> 
> Mmm. the "exec" in the current method name is "because it's
> called by cpu_exec", I think (compare cpu_exec_reset,
> cpu_exec_halt), which is not necessarily a very useful thing
> to encode in the method name.

(also IIRC they were first defined in cpu-exec.c but got
moved around)

> 
> I guess my opinions are:
>   * don't bother renaming unless we think we have a clearly
>     better name/set of names
>   * if we rename one of the cpu_exec_foo then we should probably
>     rename all of them in some consistent way

OK.

>   * a new set of names would ideally make it clearer what the
>     difference is between do_interrupt and cpu_exec_interrupt
>     (I can't remember myself why we need both or what the difference
>     is offhand...)
/* main execution loop */
cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
{
     /* if an exception is pending, we execute it here */
     // examine async requests
     // per-target mask / prioritization
     // select (accept) intr
     while (!cpu_handle_exception(cpu, &excp)) {
         // target consume selected intr
         while (!cpu_handle_interrupt(cpu, &last_tb)) {

So an option:

- cpu_handle_exception() -> cpu_select_interrupt()
   (examines pending interrupt_request bitmask)
- cpu_handle_interrupt() -> cpu_enter_exception()
   (intr / synchronous exception)


