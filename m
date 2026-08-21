Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D9BC5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 15:52:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxRX4-0002u4-HX; Fri, 21 Aug 2026 11:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxRX2-0002tb-QY
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 11:51:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxRX0-0006Ak-Oz
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 11:51:48 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67LFmIRT2645596
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 15:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cfP8MJxy40HOTEywgI/VTTe7IZzMoEsu0wp5QrPzZIg=; b=aAqIGITBgNEuEPtA
 MEcaGPVD9xW9+8tsjeJkcPRie/ypzUyiPBMPfoAgaivMx+caMHcHnigubScTNXzm
 lYHeVpgcShad/Bqfx4e8gW1EqFBWBUidZg9FLwcFSBK27y0avISToupvm4k7tI7o
 XHUjdoVeDxmpaZWTM1Aj6rxPSVxeCfgSx1epaBuvmVaAunFPyZB58CPV4ySUvC1v
 ZU4RBHziS1OaCkX6/yqph6DAO4MbQZbRED9Ac2NJjrxmAHrE45vw5oXnuGRygg6G
 FRjZc6bV9yG/q5MdKL7o6TykvrA/+3BhW9oAxQoho2gtunS9INzH8b08AMGHpYk1
 BXUeaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecbaq0g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 15:51:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5276aa86d00so12308581cf.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787327504; x=1787932304; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cfP8MJxy40HOTEywgI/VTTe7IZzMoEsu0wp5QrPzZIg=;
 b=hNDN28+3tYNoKjumcj6phGahWhv7i4RFMn+tB037pBeAM8IwcFW9J2xiZLVNkyzG6s
 Aq5LGVAi/TfbhxRIrOt02+INgJGt1dM8QCCGGSpr0Y3pY6EqNNpslhJ6R8pasGgT58OQ
 AQ4v6neUcyxeA0bPWdn/HxOy838GaB8zZcAoYlHGE5JPKf/+04Z1JrKTvOFYqTCxu8Zr
 zQdyl9hTOSQKgcCg1vMlvKU4GSbax9RkUxvUVUqvYowINpQkWjxa+KuUxm8Wt/meWPsC
 Rp7uU8ha9fdq+2qiIPF7pRidF+LTYB18S6eAaoaQwnxABx5D2yVf9eKW7LxKsoytmsGn
 W3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787327504; x=1787932304;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cfP8MJxy40HOTEywgI/VTTe7IZzMoEsu0wp5QrPzZIg=;
 b=UGqXI7nnCgfRp714CKUk8s/bwRbmt6WqW5L0IW2PntObk8Nvv3GeAmJdnITIfnLRAA
 TA3hPD0x947XUw9qeEqEGYwVS63XWVMSnXChzRSOipK6je5LHsGDmWVNnYz9s0sxtpvM
 x8D2ol9lclNE+Dvf0oszIzQZHiME2ZJgPCO6/tciGa7UiW//XDSMOVorBTUC6atEml06
 q6mZi58ppt05deKr3uTiFB6lJQHttw+J8f4CKKRTRBFrONh46055dvRUwHStnTLsTow+
 tzhDxojBJAOZm0va/9+Lwt4J2zGhbEGHuj7NijUzedk1/Y8ouXT6zc63QPuVxX1M/Sue
 C2dQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4DNhKMIPSSwWyQcgU6slLzGeKsbkQu/xHlra0UGm/AaqnJQd8nGv8plcx/va60NF6kd68BQ0wWaZG@nongnu.org
X-Gm-Message-State: AOJu0YwgEtu4T3y0vo3lCKHAZt87T01DM7BYPtofd8Fy8niQVQpqBrgA
 uZjcZIcpvkLcPgqjiFJPgN1RQSZsq5IN/yRWfMvQWAZ42lbAOqihGDRzPXEocCkWCFxUxtznbFi
 l8ShmE5JsOgcSOp5CHB+OvUSl/8YFHeDonaOnrh1j2uNWQuH0tbnImrjx6w==
X-Gm-Gg: AR+sD12oy9Nod4NkGjk6vIWSEO3M+JDeVp4fuZ1kQrwt+QJNCLj9flgO9YCrJcs2m3+
 8QC37fZGSTx6KECRtrjldWB9Sc+d2301z+tllivrb5oHjlTl4o4dTvWdDEvlGO2Dl5cDkRunwC1
 ie9MgfjXhJ1bWkorS3UFIAI41qHHpbvIoOlwz+5BStOjHVhcxamjuydXOO7olIz5bVvunYiJuwq
 p5mfF19Z+9yFBnCg/nVWb5tJGTFL8TP9NfvTh64RrkK+WoC78eO9VHrVco2YjaV5o2fdmCEQSFO
 Y4y+6c0UklEWDSyVGhqjOc9QKiE64qFg2qK2kzOduB/LWIFq7QQz/gR+IcA1mIvmAecLSP238hD
 hHdcZoV6bkwsB54UePSYyqVA=
X-Received: by 2002:a05:622a:481a:b0:51c:805:1be3 with SMTP id
 d75a77b69052e-52df5a5167amr66445991cf.31.1787327504292; 
 Fri, 21 Aug 2026 08:51:44 -0700 (PDT)
X-Received: by 2002:a05:622a:481a:b0:51c:805:1be3 with SMTP id
 d75a77b69052e-52df5a5167amr66445431cf.31.1787327503811; 
 Fri, 21 Aug 2026 08:51:43 -0700 (PDT)
Received: from [10.111.143.150] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90d3046sm32881335e9.1.2026.08.21.08.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 08:51:43 -0700 (PDT)
Message-ID: <22188776-edeb-44e6-b79d-0b877292221d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 17:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] cpus: Add const-qualified CPU environment
 accessors
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
 <20260821104950.32108-3-philmd@oss.qualcomm.com>
 <3c9fe944-2b51-412c-bd30-26bf013cff46@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3c9fe944-2b51-412c-bd30-26bf013cff46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyMyBTYWx0ZWRfXyC7F6jbUtjRO
 7wWBwn6wbja6HQU9mpaPjPQLvPWMDa54lhrT2Marrt+3dfE7k1VAacv1wQvtrylLM0b6YA748JS
 uGIKRG7q+RrDCEQOgjOE7+i5DbRff/XUBhoRhKT6AcycivaKeuOusMJVrayt38uOIB4tfFFOv0Y
 Hltt5m1R69/A+1HWuNGhRHJhqZnNuveaXVjO1qspXNwi+Q0WCHFLyTr7gfm6YWXs2kKO74kX7uj
 lRg1sQSYOVfd0mLUTvmfUVBMHXM1gSlOtzM471oW5gz6I0pARgYLibkcCl/kixioQYiy4kZKjqY
 5II9psIaRaZoi1Aa8xjwlgCm3fBAAwZ3c5z0TZ1M86EFn+lUeataEVRFo8JZN6/owYDUkCE5GCR
 ehBEn7SYVN4kKmFBmEfAb0f5w+Fo3WdqbZ+BvgftvEKmOXqcW0nt1E4zYW4rRWS+19mGQ2nenm9
 MYngO10jfhxViOIsskg==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a887410 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=dE4Oo_SCXb6TKsHij4QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: a5Qt1Rd1VU0DCGSZvPaGWTt-pzbwhv2W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyMyBTYWx0ZWRfXziNn3KQeIF5Y
 +FZSi3dxTRn6D+8hSuOSuPDjqeaMietUoYaImT0rR1zCqy0z2VXL4F2IBtqESp3keEsdUebzlvv
 tJBHuaiNA6boFTdXm8RM9gXpJnWyGH4=
X-Proofpoint-ORIG-GUID: a5Qt1Rd1VU0DCGSZvPaGWTt-pzbwhv2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210123
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 2026-08-21 13:33, Philippe Mathieu-Daudé wrote:
> On 21/8/26 12:49, Philippe Mathieu-DaudÃ© wrote:
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Use _Generic() controlling-expression to add the const-qualified
>> variants of cpu_env(), env_cpu() and env_archcpu(). This allows to
>> safely access CPU architecture state when it should not be modified.
>>
>> Alias env_cpu_const() which is still used.
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> Following checkpatch.pl errors ignored:
>>
>>    ERROR: spaces required around that ':' (ctx:VxE)
>>    #46: FILE: include/exec/cpu-common.h:89:
>>    +            CPUArchState: \
>>                             ^
>>    ERROR: spaces required around that ':' (ctx:VxE)
>>    #62: FILE: include/exec/cpu-common.h:101:
>>    +            CPUArchState: \
>>                             ^
>>    ERROR: spaces required around that ':' (ctx:VxE)
>>    #90: FILE: include/hw/core/cpu.h:605:
>>    +        CPUState: \
>>                     ^
>>    total: 3 errors, 0 warnings, 64 lines checked
>> ---
>>   include/exec/cpu-common.h | 30 +++++++++++-------------------
>>   include/hw/core/cpu.h     | 17 ++++++++++++-----
>>   2 files changed, 23 insertions(+), 24 deletions(-)
>>
>> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
>> index 6594f7fa1be..bffef677607 100644
>> --- a/include/exec/cpu-common.h
>> +++ b/include/exec/cpu-common.h
>> @@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const 
>> CPUState *cpu)
>>    *
>>    * Return the ArchCPU associated with the environment.
>>    */
>> -static inline ArchCPU *env_archcpu(CPUArchState *env)
>> -{
>> -    return (void *)env - sizeof(CPUState);
>> -}
>> -
>> -/**
>> - * env_cpu_const(env)
>> - * @env: The architecture environment
>> - *
>> - * Return the CPUState associated with the environment.
>> - */
>> -static inline const CPUState *env_cpu_const(const CPUArchState *env)
>> -{
>> -    return (void *)env - sizeof(CPUState);
>> -}
>> +#define env_archcpu(env) _Generic(*(env), \
>> +            CPUArchState: \
>> +                (ArchCPU *)((void *)env - sizeof(CPUState)), \
>> +            const CPUArchState: \
>> +                (const ArchCPU *)((const void *)env - sizeof(CPUState)))
> I was testing with a C17-ready compiler. Apparently C11 is ambiguous in
> how it treats qualifiers inside _Generic:
> 
> ../../target/arm/internals.h:1777:25: warning: due to lvalue conversion 
> of the controlling expression, association of type 'const CPUArchState' 
> (aka 'const struct CPUArchState') will never be selected because it is 
> qualified [-Wunreachable-code-generic-assoc]
>   1777 |     const ARMCPU *cpu = env_archcpu(env);
>        |                         ^
> include/exec/cpu-common.h:91:19: note: expanded from macro 'env_archcpu'
>     91 |             const CPUArchState: \
>        |                   ^
> 
> Using typeof() makes it happier:
> 
> -- >8 --
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index d67d008236f..e3a5e40899f 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -87,6 +87,6 @@ static inline bool cpu_loop_exit_requested(const 
> CPUState *cpu)
>    */
> -#define env_archcpu(env) _Generic(*(env), \
> -            CPUArchState: \
> +#define env_archcpu(env) _Generic(typeof(*env), \
> +            typeof(CPUArchState): \
>                   (ArchCPU *)((void *)env - sizeof(CPUState)), \
> -            const CPUArchState: \
> +            typeof(const CPUArchState): \
>                   (const ArchCPU *)((const void *)env - sizeof(CPUState)))
> @@ -99,6 +99,6 @@ static inline bool cpu_loop_exit_requested(const 
> CPUState *cpu)
>    */
> -#define env_cpu(env) _Generic(*(env), \
> -            CPUArchState: \
> +#define env_cpu(env) _Generic(typeof(*env), \
> +            typeof(CPUArchState): \
>                   (CPUState *)((void *)env - sizeof(CPUState)), \
> -            const CPUArchState: \
> +            typeof(const CPUArchState): \
>                   (const CPUState *)((const void *)env - sizeof(CPUState)))
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 372485a2e54..ee522e1e705 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -602,7 +602,7 @@ QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
>    */
> -#define cpu_env(cpu) _Generic(*(cpu), \
> +#define cpu_env(cpu) _Generic(typeof(*cpu), \
>           /* We validate that CPUArchState follows CPUState in cpu- 
> target.c */ \
> -        CPUState: \
> +        typeof(CPUState): \
>               (CPUArchState *)(cpu + 1), \
> -        const CPUState: \
> +        typeof(const CPUState): \
>               (const CPUArchState *)(cpu + 1))
> ---

No, this now fails distinctly on Ubuntu 24.04:

In file included from ../accel/tcg/tcg-runtime.c:26:
../accel/tcg/tcg-runtime.c: In function ‘helper_exit_atomic’:
/home/runner/work/qemu/qemu/include/exec/cpu-common.h:100:31: error: 
expected expression before ‘typeof’
   100 | #define env_cpu(env) _Generic(typeof(*env), \
       |                               ^~~~~~
../accel/tcg/tcg-runtime.c:135:26: note: in expansion of macro ‘env_cpu’
   135 |     cpu_loop_exit_atomic(env_cpu(env), GETPC());
       |                          ^~~~~~~

I'm a bit clueless. In case you want to have a look, the
series is available here:
https://github.com/qualcomm/qemu/commits/refs/heads/philmd/cpu_has_work_const/

Thanks,

Phil.

