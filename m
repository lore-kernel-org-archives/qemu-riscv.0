Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C97ECA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 21:34:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOPU-0004WO-TG; Thu, 01 Oct 2026 17:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOPS-0004Uw-3y
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:33:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOPQ-0007XG-Ad
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:33:45 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691IZfiw2019004
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 21:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GU2rG9VK20tQMOCuSS4knDJHDO01gwrYGGOKD6EdP14=; b=WUlnKsWdI3IKcPfZ
 u+3e+42kXoNNmSBHpUdWCvFdE5qfFlMHqsD4NYETHjCT/rPzGIt+r2co9AgshqIz
 RmUPy8TpaGNapTBebD85kPt1PmYpVV6Vss8Yh1eIYaJMLo8qPRRJQjIbcuYwu2aH
 IzWbcVNnS5UIyemQok0atSXMx7swSaiXnc7Vtv4tdFBYYANr1n+aTW8Ip0mQlXyC
 pgODpRGUeqA1BBnJYzkTIDLLcGWKwCERDzoACQudS8gBfEP1+7gl0qFDo08+AKx+
 +79OXrtpC2CIxNeWPSfzxcSPTZlOpPdhWtHS+3pLsUByefA7xIouZDYwOMuljcmR
 d4SYMA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxe8kve-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 21:33:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-34344599f01so8216024eec.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790890422; x=1791495222; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GU2rG9VK20tQMOCuSS4knDJHDO01gwrYGGOKD6EdP14=;
 b=QWvTSbRcawKmF10iVf64Iizj/P9kc9UUdv1yB6mDT2RlE0+zyICXqSpWSVB+xopkGW
 K1a76AzxuLWQC9bFuW61BiJK9hF+/rX3ql/LdGY6VmKz46yeeDyNQn/zHLQWTD7GUiAo
 T1NCVsWYcUhqMU8VWyHx7I+7n3QBhlpGvwfwdgVQfp8C9DIONwtuAECgudy1txcd9CbR
 nWoY9xrYjHXyEUx56roRHsM78wAXeTJgBoYurFpXnYKai16oxsjLIegJDtyIjIrF4Fnv
 v6c+R3opwFLCCMCN7xTY2i/CD2PgGDoZPicRxcbXhDYEthnqVHZPoNNXxXh0aKAIDL9F
 2wZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790890422; x=1791495222;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GU2rG9VK20tQMOCuSS4knDJHDO01gwrYGGOKD6EdP14=;
 b=p0JPepFSvMzb43BBhSA4X/WHQVzJBRIPJy9NRty7YeVD61A+/Ba4mX/F12R3DPL+kP
 Px6Koq6mWtFzc1smLuTV/QxwHFr/4dPBtmgmi35ZrECjCQJFWVafbWKz/eOzyubkYtrv
 iq+3IXYqC6ixGbw2xdGx8p7YItRni+/8C6ksZmXz9hl7EeqJsXhsoWpO2eDDXGIfQME2
 v9oGv2vGeGaAs0Z9k0WJ6+YQ9uilHPT13FX0B+/owziLPlR08TZwZVvUfdUMHTn6VmR/
 RkXyz4QqEeuV/dXuOOhsJVH1usR8SYskeE3kLlUcYtyVAp/5jw5/3SsMGA6/rMvtfgbZ
 Dn1Q==
X-Gm-Message-State: AFuF++nxC//HiuHQDwcRTdp6j02KOh+Zbp3SOeLjMfPj4tM4HQ8CMz0p
 GuV6L1NxtWk0VhpTrVp42GzV5ize5jxXLuEnSQj+L8bE7Uui5aB4UT7Q3awVhyDMMtURsdcBF+G
 FPTmpGFsvabQLoZIJmUWL8gNUWDs8oNY0wLL2GJkSpsUhtzRvsI1qZ5KjGg==
X-Gm-Gg: AYBFou1JtUzTi/QTfNZMLUHezpewEEa5JYyXdgsYUZoBJ0dgIFwytLBMVQNQ12AzYMs
 3F1MWxyADja0soz+CPgC8PS5hyWGYh22pWu9jMIuVwRHw5sLT7CPf0BmyhrwGgJd8dJtFS3GH/z
 UDdOz+bNZIDCQ0kVCHM3+94j2FgnlL7soNqCajX0rSziUr7r1myLh6YOivfhucC8XBD6NHtYZv2
 IekJKwjFi0iRxomBoN4sgxVtY5ao6v/RCtFrLH/AEcSioJAzuxcJCqCw7MrtMRopabif9X7vTA1
 sJ48ByG2ua3VOAfCufW2CCEBlxIICWkgez+Y8aO3/y1CWOu4yJ6DO5U23qOo6OIfoXoKSCIyUuP
 +W/hMIy2ea1CbObUURtICYLSVQVWJkVGhSBGBYdBaHRB2aTEQzI1lvhW+TEdhgN3fLAfF2w==
X-Received: by 2002:a05:701b:4287:20b0:144:eb46:be0 with SMTP id
 a92af1059eb24-14f5b311259mr548820c88.13.1790890421857; 
 Thu, 01 Oct 2026 14:33:41 -0700 (PDT)
X-Received: by 2002:a05:701b:4287:20b0:144:eb46:be0 with SMTP id
 a92af1059eb24-14f5b311259mr548792c88.13.1790890421271; 
 Thu, 01 Oct 2026 14:33:41 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f45fed1c1sm1333392c88.3.2026.10.01.14.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 14:33:40 -0700 (PDT)
Message-ID: <651ff294-ff5b-4f66-934a-4e7cb182d0ae@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:33:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] target/riscv: Make internals.h target agnostic
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-1-ea69b07afd31@rev.ng>
 <d379ac03-6d53-4532-8f5b-5e635dde0699@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d379ac03-6d53-4532-8f5b-5e635dde0699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abed1b6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sDW_NOtA-zPGPE0VL1gA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xsrEGW6Pc89FK0QtI1xZqCTH00lf9spH
X-Proofpoint-ORIG-GUID: xsrEGW6Pc89FK0QtI1xZqCTH00lf9spH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfX0qBBUL4hj18a
 TU3+VknPNdsjnRewExIv6EMzsUxXHg4Fz9LaQK6Deki/NAEcLeNiF+6CVPRbzt4lpgBWK7HVoyA
 GsJO/IZehDLdMLpUwAeAMYcInENWo6ye9tcsHSTUnM0JQnWQ6oLK/yuTAxreb2aKH7fs/+toEIY
 Td42qvtTk25xLj/+qMWluRR4aGbaTfE1DSu4ecCbXy+kqinKCpJdBkqUWxLm4MHtnfnnVZ26r7W
 xB8TKM+bZ0v147/cZBwSo5JXT/zZQBloRMSfDGLacFSSLIHpBtBgINdqaDsxoh4Lu2ESF86jlm5
 8l53IpXvKEDjipoS4dPUaFEwamGX93ti3qexHw3KLa3YGPyY03zcnEAcy0hHqMAB77yz8rKDqDg
 nkcZEKaMHLqMBJr4eoyBFYnnrg8SXTofFwcr85r9pTFzPOGaxzt2YoGJo7l6ZgyJxAhvDQq+o1f
 2jrQxdeZ6/pCasOFHLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfX9Jhp9K1W3QlK
 jtVANci+0t/0aakJ2VmQuHpvS7bvxul5H2tgaq0nG0asQsIhQQtnKfUb5hy8XgOpWGL/cLtEiYp
 9m1KMt9Sfz64RagS7wWv1gx+83dA/kc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010085
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 10/1/2026 2:25 PM, Pierrick Bouvier wrote:
> On 10/1/2026 8:59 AM, Anton Johansson wrote:
>> Replaces uses of target_ulong with fixed-size integers, this is a
>> prerequisite step to compiling cpu.c once for system-mode.
>>
>> Note: the widening of target_long to int64_t in adjust_addr_body() is
>> safe as rv32 is ruled out earlier in the function via the check
>>
>>   /* do nothing for rv32 mode */
>>   if (riscv_cpu_mxl(env) == MXL_RV32) {
>>       return addr;
>>   }
>>
>> meaning target_long must be equal to int64_t anyway.
>>
>> Duplicate includes between vector_helper.c and vector_internals.h are
>> removed.
>>
>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>> ---
>>  target/riscv/internals.h            | 31 +++++++++---------
>>  target/riscv/tcg/vector_internals.h |  5 +--
>>  target/riscv/tcg/vector_helper.c    | 64 +++++++++++++++++--------------------
>>  3 files changed, 47 insertions(+), 53 deletions(-)
>>
> 
> ...
> 
>>  /* Zjpm addr masking routine */
>> -static inline target_ulong adjust_addr_body(CPURISCVState *env,
>> -                                            target_ulong addr,
>> -                                            bool is_virt_addr)
>> +static inline uint64_t adjust_addr_body(CPURISCVState *env,
>> +                                        uint64_t addr,
>> +                                        bool is_virt_addr)
>>  {
>>      RISCVPmPmm pmm = PMM_FIELD_DISABLED;
>>      uint32_t pmlen = 0;
>> @@ -239,7 +238,7 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
>>  
>>      /* sign/zero extend masked address by N-1 bit */
>>      if (signext) {
>> -        addr = (target_long)addr >> pmlen;
>> +        addr = (int64_t)addr >> pmlen;
>>      } else {
>>          addr = addr >> pmlen;
>>      }
> 
> I think this one is incorrect, since for a 32-bit addr, value will not
> get sign extended, so shift will be unsigned.
> 
> ```
> #include <stdio.h>
> #include <stdint.h>
> #include <inttypes.h>
> 
> uint64_t out64(uint64_t in)
> {
>     return (int64_t) in >> 1;
> }
> 
> uint32_t out32(uint32_t in)
> {
>     return (int32_t) in >> 1;
> }
> 
> int main()
> {
>     printf("32: %"PRIx32"\n", out32(0xffffffff));
>     printf("64: %"PRIx64"\n", out64(0xffffffff));
> }
> ```
> 
> Output is:
> 32: ffffffff
> 64: 7fffffff
> 
> We need to add a:
> if (target_long_bits() == 32) {
>   addr = (int32_t)addr >> pmlen;
> else {
>   addr = (int64_t)addr >> pmlen;
> }
>

s/target_long_bits/riscv_cpu_mxl/
but you get the idea :)

> Regards,
> Pierrick


