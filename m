Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFD9C5DF66
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 15:46:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvzXZ-0000Js-RZ; Mon, 17 Aug 2026 11:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvzXI-0000EZ-6i
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 11:46:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvzXC-00038W-6y
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 11:46:01 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67HFYtvk1840293
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 15:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qJomhp4E4/0nAHnYLCMRRJVWnnFs3olnM/6sAXdkmJE=; b=pXUq5vwNeT8UfXSD
 T3K3yFySmigWkvf1EeR40akxCNMUfY9WLs363VxnCtA9fp7uFnEs8Ae5iFi754yx
 FAIFeTzoI5IZsKuV1VR7rgKhGfDIk/KrdIy+eG59TTnMg/rXN+4YlI1Avkq92je/
 L9vPrp4p/RgHsRgd2aFVMlDU6+hhhBAUrKPi332a8gmMhn3/H158qaMS73kd0r4U
 QGCF2U7rAgRkB3wIyXms6HsrNqN6Zvrya9QGmvLPGIlv+xvBLmpdWu2tJa1rEoFU
 4xxbZa0layysLXr5Tsr3fVe7LgZeZ8lXr0SDzQUKMkmRcXVSwEe4rfUhg5W6uN5L
 hBKa1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30hvfx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 15:45:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e8004d60eso633315185a.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786981554; x=1787586354; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qJomhp4E4/0nAHnYLCMRRJVWnnFs3olnM/6sAXdkmJE=;
 b=ITDRIyrae2gkJds10NJ37leSZypsH/odv3AhOAjTnV5DtC1n4ewujVgN4uWqXtvzIk
 lC80FAARAEILY8PadDQpO9R+Lf8sIdkx32Xu0pUE8SGwf7M3g7JxiboVbb60IUJIZER3
 AOpajNz3uP3+mS41xk0MLLeEvYrvytHulSTeo+EDCjbDvn+/nShU52rlG74xbFhLBNcc
 AavPIvAwZ/UU2UtriFrm/7I1jTy8G+AKwbJHEyu9P17dDoLguLK7PP4XowYsMkDKILGY
 XC3FK9GYWxN5QM5VBbC6vQ6zPlo/sgKyYDjJNsuLn3DV4DO63XNIAg0JRITBEjCSvoLM
 eCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786981554; x=1787586354;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qJomhp4E4/0nAHnYLCMRRJVWnnFs3olnM/6sAXdkmJE=;
 b=OfEFcSldRQDiVOq/7v8a1VJamvKVs66ZQ8btOqHA1jEAYeFaOuzeAIua/ZrPo0rp4c
 W7kzjDH3fsxbUSiLybVxmuJ/c1alNEm5LNvr1enL/vOumq6WmniBqs6JlyACDiLKe529
 WNaPGJmIYJvKxUNk6axkftKZREB3bZo3BoN/ViVtlWVCE3xpon+ikzD9PEgz2GA0wFBx
 I6v2/O5AzReUExfpogOfCdoqzDmIIFcjOrynovt3g+uBS9nm1gWDTrUYg8yNSg4xmlwy
 McCzb7CgYvwj5rsxBPvo0jiUUA76RnZuU4sjGN33yIP7X+TdgaCC5vKFSPERKUC/TeO+
 v53A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp4OzVLx3ORhw532tJu5NVtlDXj4Id2Lxdc3jCLEFVW6FPjlkqzmP/d8SNPHfXFrWuyNIcamLRJtnZT@nongnu.org
X-Gm-Message-State: AOJu0YwF+4q25GJnr+ewkyQJ1KLlDQ3ds0xs5xSToojWloHLlF7vvxV/
 ZLRv8rzgE+t29D1bgRoRHsBkgfgCXzvmsRTh+SM+QtQ+jxz8oEGTem6uXfdjXGhEDc5C/taz0yk
 sjFTzBMTJv1kAOsVhsuQp12VBr0p7DpNQYeQ1HAOqK5wmOgpnvOPwf2Kvxg==
X-Gm-Gg: AR+sD1115kDRmhVmX+O/XRUeqs+tcDpbh1p6lLD7znauPlSc/cAzQ2jddrU9lDZ6Hz3
 Q8ofCQzCILCDCj8X3mll1s5sJLbuL6zoHF1MNifyeTlHFoK4/4YqgYhCFR/KXaMchlqW2E9b5gw
 QX/bTU9rY4VejV4Zs+6Dpa6ElnGBMPJfxeQeMPCf3FhZbmI+l33W0m0MkEGr7rnPmHW62ZFZ+U+
 ZI2kaKVFYOHa+PzAMAS7KGu6QYY9Q6/Hst5DJ6PMFb7oEdf4BSV3mSnzdWB11gPmdFUrpurIaa5
 ZH9dZFTuyl1KvBwAaH2Cc9hiHvx9QgP69zbUIdxlLAUvn5DT9xaWcEl50qWKP4PnNQtyoTUfI3s
 4uMzIgMnNQ7b5gHe7u6rj1h5k5AORKScbyUg=
X-Received: by 2002:a05:620a:9445:b0:936:cf5a:6061 with SMTP id
 af79cd13be357-936d2341930mr1742760485a.45.1786981554045; 
 Mon, 17 Aug 2026 08:45:54 -0700 (PDT)
X-Received: by 2002:a05:620a:9445:b0:936:cf5a:6061 with SMTP id
 af79cd13be357-936d2341930mr1742754585a.45.1786981553582; 
 Mon, 17 Aug 2026 08:45:53 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999610966dsm205095575e9.5.2026.08.17.08.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 08:45:52 -0700 (PDT)
Message-ID: <32b54253-a109-44b2-bbdf-ab6440814522@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 17:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] cpus: Improve qemu_cpu_kick_self() docstring
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
 <20260813181640.6537-3-philmd@oss.qualcomm.com>
 <13c02cbb-79db-4ebd-9fa1-63ffeb0b43f4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <13c02cbb-79db-4ebd-9fa1-63ffeb0b43f4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExOSBTYWx0ZWRfX+b/0rqhfUaW/
 OaUGdiSpdBHn3s5nyRAijck6jo7DuCKApNYzQmOH4IwgVQMCW1p3JJlAbA1nUuTUb7A2laIIx1o
 /W5STwUV+JjsWcDXo7NwTrwsIhtCzpVSZwfsYleBAQdtjiZvljI0akovbl13jl+G7aWKd7eZWtZ
 cYl2JnR0QZNAM3ClpWfUeb7MuaX8TOM4ITl78EKegwKwnf0WDnEw8rjY3u1Ioym0rDBp07RgTsx
 3eW4svhK9YCZK0Ah1vlWn3vePjfEvnx19Gfet548Kxc+DrOeEU3JKhEhhSH4cTf4FEGTkyrUzD7
 0aGT197bo0fairpvTmuNS25Fs+NIkIQMZ8AWz3L8iflcxXMvEZ6FQ58zOA72zZ9Zf3GVKt0YWcC
 64zUJq+Q771kMw78o5soPfUd2UTsWe0IC9eYj9wxUKL76MgZaxvEmLfzrzLxHo9D/fwt5byBtM6
 MUbGt3hXtqXKGzYH/uQ==
X-Proofpoint-GUID: 3Cy1FTfZrguUtDWWHalT7kwUR1Sig2GT
X-Proofpoint-ORIG-GUID: 3Cy1FTfZrguUtDWWHalT7kwUR1Sig2GT
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a832cb3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NSIYWwr6F1QkDLxMasYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExOSBTYWx0ZWRfX87a1ZG+5wZK3
 Mxhy0NiM/2mYa9fG0KxMb6mGosbcWMOhqA8iyuliGkwajQ3dejjMAo15gLEUgm/qosNgnHYJgVQ
 gbNyQOioKj7ASpZC3KVQL8C+rRh43EU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170119
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

On 17/8/26 17:28, Paolo Bonzini wrote:
> On 8/13/26 20:16, Philippe Mathieu-Daudé wrote:
>> Be a bit more descriptive than "Unblock cpu" :)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   include/system/cpus.h | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/system/cpus.h b/include/system/cpus.h
>> index 508444ccf1c..ade13e068eb 100644
>> --- a/include/system/cpus.h
>> +++ b/include/system/cpus.h
>> @@ -30,7 +30,15 @@ void resume_all_vcpus(void);
>>   void pause_all_vcpus(void);
>>   void cpu_stop_current(void);
>> -/* Unblock cpu */
>> +/**
>> + * qemu_cpu_kick_self - Force vCPU to re-enter to its inner main loop
>> + *
>> + * Signal the current vCPU thread to exit any blocking operations and
>> + * re-enter its inner execution loop to process pending requests,
>> + * possibly returning to its outer execution loop.
>> + *
>> + * Must be called from within the vCPU thread itself.
>> + */
> 
> Neither is correct.

"Must be called from within the vCPU thread itself." is because of
the assertion:

system/cpus.c:452:void qemu_cpu_kick_self(void)
system/cpus.c-453-{
system/cpus.c-454-    assert(current_cpu);
system/cpus.c-455-    cpus_kick_thread(current_cpu);
system/cpus.c-456-}

>  What it does is force the vCPU not to enter the
> accelerator, and immediately exit again to process events.  This is only
> needed because KVM doesn't want you to process events because KVM allows
> you to do so.

I got confused by this comment in accel/mshv/mshv-all.c and interpreted
too much:

/*
  * The signal handler is triggered when QEMU's main thread receives a 
SIG_IPI
  * (SIGUSR1). This signal causes the current CPU thread to be kicked, 
forcing a
  * VM exit on the CPU. The VM exit generates an exit reason that breaks 
the loop
  * (see mshv_cpu_exec). If the exit is due to a Ctrl+A+x command, the 
system
  * will shut down. For other cases, the system will continue running.
  */
static void sa_ipi_handler(int sig)
{
     /* TODO: call IOCTL to set_immediate_exit, once implemented. */

     qemu_cpu_kick_self();
}
> 
> I'd rather have something like:
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 83cbd120a84..e5d068e341f 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3292,7 +3292,7 @@ static void kvm_cpu_kick_self(void)
>       if (kvm_immediate_exit) {
>           kvm_cpu_kick(current_cpu);
>       } else {
> -        qemu_cpu_kick_self();
> +        cpus_kick_thread(current_cpu);
>       }
>   }
> 
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index 8a1af35ed32..b9b1ee39850 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -753,7 +753,7 @@ nvmm_vcpu_loop(CPUState *cpu)
>   #if NVMM_USER_VERSION >= 2
>               nvmm_vcpu_stop(vcpu);
>   #else
> -            qemu_cpu_kick_self();
> +            cpus_kick_thread(current_cpu);
>   #endif
>           }
> 
> and get rid of qemu_cpu_kick_self() completely.

OK I'll take that route.

