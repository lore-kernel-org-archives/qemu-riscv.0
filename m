Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75779CA5FFF
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 04:38:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEJPT-0004YL-Rj; Wed, 07 Oct 2026 00:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEFfI-0004bN-W4
 for qemu-riscv@nongnu.org; Tue, 06 Oct 2026 20:38:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEFex-00056P-8j
 for qemu-riscv@nongnu.org; Tue, 06 Oct 2026 20:37:37 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 696LeZiQ2389447
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 00:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +6vVuKuCSgviNdFD8wSclp4swCA05YmB26dklRg3+KE=; b=lrrs/unUBX8uYJ7C
 S9RLuqPBY2AX1JW9m7hJY7GuI8uZHvozeUyCM6b1qeX/tdYpW8Trhgp0fiHgEs71
 h9Gcmud9fAdVPZ0uGyqc59h1qH6LPNUptGezptQZxBFJK1312Bic4CAS9xZQWLVH
 2Bq/G88h2sem+0Jv05yH0egCPHHVv+GRuSPCXPiYKVXG8b8+MrmB0/HU6JIBBbpt
 D5N1anXtdPCYecHS09G5CGTdkTcF33L1plkcqOK8wbTrCriyguy63dHZUcJC0Q0P
 6R2aREOlyR0N36uVHu3uMk1Z6K563qYt0DHfWcDANhyC2yWLhswNvlpeCVfw1vft
 USPuMg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbk9y4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 00:26:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3510562ef98so4640214eec.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Oct 2026 17:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791332806; x=1791937606; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+6vVuKuCSgviNdFD8wSclp4swCA05YmB26dklRg3+KE=;
 b=Qg5LyUxO6lX61j2RFOMaNVFeGM5oiEuwbTxDwXdQRb6SeNbH+PbvOHeSpQqBBCGwYV
 2qpHsvOLUDda1x3ytt0fYYAi8xmKqTqDsJTW8cwLF9m0lur3XwdBnZm5MoLIOCZb79b8
 Y/7ZugvBXaFWjDlVj4DK04NigYuHlJXQvHmQsppOMugmn8Wkoas23N719eHF4Z1iZ/y3
 /we3kY5gv047RupyfYB3Kin70qletWXCSL3UY1rg9DGBA7D0cPOGC8d2QApuq332rnd5
 2ttfSnvs3X5gtZKDQON8TR04/OPq8EVur76esLXYtSX3fj38hkU5II94Ou5fgxebBYgs
 zWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791332806; x=1791937606;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+6vVuKuCSgviNdFD8wSclp4swCA05YmB26dklRg3+KE=;
 b=IZt7Ka0tteJpga/g5GPngJgluzR2fV/LhPfeuOEO3xGUB0QX6TNs6UTWjMEnJoPVB3
 2Ss7ykRqkkj8t3zFGuYud3KjKivYjZAFoGLMtAJ5Cgym2LDz+HBVHyTae+fxiEZb4p5t
 b14HcuI998IUne3MC1g8gF7f7p7963GpNv+1VvV4GROPrLnS/J14pZ2ImcUwk2tbmad4
 WpvC5RUJFYFOWnZqPvADAxpqy2xtTLFKPJVcNf+Q1BtaSy8Ipy9+8oqg2hr7jHNypksg
 zlG4KexZo72sN6iND0PBqfewFAVV8YEXaGvywcW3YsSR/Myi9D1h84j1u6GhK1Wyqzwp
 VbSw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwpe8nX2uU0h0jP+f48uyqL33LWvDUZ3/y04DAr9pHtnBLO5Lj+e9ZoTSv1HfJYyf80htHBgXIUaWx9@nongnu.org
X-Gm-Message-State: AFq9FYLAENOLzjUaBFPd+u+8BAjdNsrpP2nHhdJO797oAOb5mZM6rIHc
 LiDBoGnapNZpjNPSxDeJwzZuNCFuOsSnJ2lWKin73scTZAKapaK11ScosXVSR2g9L3e4LG/VffK
 4ibHIYhQkJQ6AYt7Pgz9Zeq+V3yVoKZdVK+MUUqYbrT+rWZd6mDNVZybwcQ==
X-Gm-Gg: AYBFou2xvnyu3Vp2hDdq5qvUBcZD9yLb/k15RjcGtAIp6jnIy7xPZjvm7wdqZgZBfny
 iq0kAEqcohyIfa5kTk7UDovJhxt+yW6lVWXJp37DOZiv98D4MAy9IOJAv9eWTfnEkqgt7YkvyLw
 R6K7XA1LeOibCwj/vg7q0DCMYQZDbQ6ugLUPP+Uov0FBx3H22u1QIlSvN9heVeXKZ+3NXiEjsE0
 hLHk3hRMxvKAb/NwI+dPLjeyTkqR8fq64Hep86q85Jr7AhxckZIUB5q/2zXBENaZbt+jgSiWu45
 V3zzqzp2B6v51s/hitKYgAafTx4ZzT0v5a+0JJwcAVLu4B1jZs8HbaIHfEWvAOgac65JlMj9jI6
 VUqWEQgvkB3/O9nFaP7t+0nLuX28et+biPnOARNJ2jINIxy+Ufl13xIRwxGoVLwiK5bJS3g==
X-Received: by 2002:a05:7300:4f24:b0:351:35d9:ebae with SMTP id
 5a478bee46e88-3515ddfba5dmr367782eec.24.1791332806389; 
 Tue, 06 Oct 2026 17:26:46 -0700 (PDT)
X-Received: by 2002:a05:7300:4f24:b0:351:35d9:ebae with SMTP id
 5a478bee46e88-3515ddfba5dmr367764eec.24.1791332805655; 
 Tue, 06 Oct 2026 17:26:45 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3515abb5389sm2351363eec.2.2026.10.06.17.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 17:26:45 -0700 (PDT)
Message-ID: <94b585f0-9135-4dae-bfb5-c39381528e6b@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:26:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] target/riscv: Make internals.h target agnostic
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 daniel.barboza@oss.qualcomm.com, philmd@oss.qualcomm.com,
 palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-1-ea69b07afd31@rev.ng>
 <d379ac03-6d53-4532-8f5b-5e635dde0699@oss.qualcomm.com>
 <asV_najmI5UsUvKT@hive.localdomain>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <asV_najmI5UsUvKT@hive.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac591c7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-HqBmVX_Dvv-yfMDhnwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: LGu2cVILnZzcJE5OdrDUfnwy3bsELqqH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAwMSBTYWx0ZWRfXyZVe9owW8ZlQ
 el3reC8Fnx58EwrkN4a+erBFEnH5036gRkh5FJXOGPLLgv2JS8ZfhHT1EQ06rC8jBDR386qOqwe
 obXerBnRdxWJwUiMtQceSSOrr6EWzcg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAwMSBTYWx0ZWRfX6b3hrIESuquF
 Yy1Chy3z2koTwVf14GybZOIc5g16Qp5RzFnfi1lTJpOPHBnoHHDHTCjF7waoqgB7iyZL3ZG21Jx
 zvMa8ikzFFHFpRu180/ioi2uUdxgfNU/5v8Sh6/6qaUYVF07XsCWHfk/hfHc73Sl1iP5R6Y2T9t
 h9eIdm8t/NQ/Nl2AKv3bEvKE5OFlXkD4TNZMrpl26WScujKPBDHbr6adBUkJ9yXXumtgXDpJYHp
 8Kq6dL3zG3K4hDKPKB0FxGuYkaz1MasqArN6S7K4V2T8ARfj5/dMSqFQ0u40lQCoRetRaPhuuvR
 8pNWG3zfswrT5LKe+0ADFlGGJQB2xrZc7AiTOYYUObPT3TkPDmdY2eqykVwWFrbllDog1FPpl1t
 qgtVRACiLZaPZQdD7IHArP2ejjuYiBperxBda3NYlXI4We1V/k8eaENKSqedbXvNvGcHTxYVScO
 VF7WzYnicLeSLa32aVA==
X-Proofpoint-ORIG-GUID: LGu2cVILnZzcJE5OdrDUfnwy3bsELqqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070001
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/6/2026 4:14 PM, Anton Johansson wrote:
> On 01/10/26, Pierrick Bouvier wrote:
>> On 10/1/2026 8:59 AM, Anton Johansson wrote:
>>> Replaces uses of target_ulong with fixed-size integers, this is a
>>> prerequisite step to compiling cpu.c once for system-mode.
>>>
>>> Note: the widening of target_long to int64_t in adjust_addr_body() is
>>> safe as rv32 is ruled out earlier in the function via the check
>>>
>>>   /* do nothing for rv32 mode */
>>>   if (riscv_cpu_mxl(env) == MXL_RV32) {
>>>       return addr;
>>>   }
>>>
>>> meaning target_long must be equal to int64_t anyway.
>>>
>>> Duplicate includes between vector_helper.c and vector_internals.h are
>>> removed.
>>>
>>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>>> ---
>>>  target/riscv/internals.h            | 31 +++++++++---------
>>>  target/riscv/tcg/vector_internals.h |  5 +--
>>>  target/riscv/tcg/vector_helper.c    | 64 +++++++++++++++++--------------------
>>>  3 files changed, 47 insertions(+), 53 deletions(-)
>>>
>>
>> ...
>>
>>>  /* Zjpm addr masking routine */
>>> -static inline target_ulong adjust_addr_body(CPURISCVState *env,
>>> -                                            target_ulong addr,
>>> -                                            bool is_virt_addr)
>>> +static inline uint64_t adjust_addr_body(CPURISCVState *env,
>>> +                                        uint64_t addr,
>>> +                                        bool is_virt_addr)
>>>  {
>>>      RISCVPmPmm pmm = PMM_FIELD_DISABLED;
>>>      uint32_t pmlen = 0;
>>> @@ -239,7 +238,7 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
>>>  
>>>      /* sign/zero extend masked address by N-1 bit */
>>>      if (signext) {
>>> -        addr = (target_long)addr >> pmlen;
>>> +        addr = (int64_t)addr >> pmlen;
>>>      } else {
>>>          addr = addr >> pmlen;
>>>      }
>>
>> I think this one is incorrect, since for a 32-bit addr, value will not
>> get sign extended, so shift will be unsigned.
>>
>> ```
>> #include <stdio.h>
>> #include <stdint.h>
>> #include <inttypes.h>
>>
>> uint64_t out64(uint64_t in)
>> {
>>     return (int64_t) in >> 1;
>> }
>>
>> uint32_t out32(uint32_t in)
>> {
>>     return (int32_t) in >> 1;
>> }
>>
>> int main()
>> {
>>     printf("32: %"PRIx32"\n", out32(0xffffffff));
>>     printf("64: %"PRIx64"\n", out64(0xffffffff));
>> }
>> ```
>>
>> Output is:
>> 32: ffffffff
>> 64: 7fffffff
>>
>> We need to add a:
>> if (target_long_bits() == 32) {
>>   addr = (int32_t)addr >> pmlen;
>> else {
>>   addr = (int64_t)addr >> pmlen;
>> }
>>
>> Regards,
>> Pierrick
> 
> No this is not necessary unless I'm missing something, see commit comment.
> MXL_RV32 is ruled out earlier in the function
> 
>   static inline uint64_t adjust_addr_body(CPURISCVState *env,
>                                           uint64_t addr,
>                                           bool is_virt_addr)
>   {
>       ...
>   
>       /* do nothing for rv32 mode */
>       if (riscv_cpu_mxl(env) == MXL_RV32) {
>           return addr;
>       }
> 
>       ...
> 
>       /* sign/zero extend masked address by N-1 bit */
>       if (signext) {
> 	  addr = (int64_t)addr >> pmlen;
>       } else {
>           addr = addr >> pmlen;
>       }
> 
>       return addr;
>   }
>

I have to confess I didn't open the full body in my editor to double
check that. In this case, that's correct.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick




