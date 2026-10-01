Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2E9CA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 21:25:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOHa-0002Ff-5d; Thu, 01 Oct 2026 17:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOHZ-0002FK-Du
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:25:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOHX-0006gR-9E
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:25:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691HUvBJ2353174
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 21:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SofIKIpgWS9k/TIH1V5xmRBvQ2KZH8GY2HlqxDspFKY=; b=iZ5SmAHi7SviEg9E
 IriEf9hUeb3IZ8vbFm8O3C7dDeWcORKqyE302ia6/c4YKrjzFWeWyy+FUBbfaROF
 WKRLD5vE03bTQDxVr4cfd4onzinLVTYFzmRx5npKNsTp3iSC4geWFittJg1B2HN2
 t04mS/ELTnYZRenY1IdbKDBaF1UXqFg6AG4vqoWa20iM9QeycNmX6HYVFlWwlETV
 lMuq7Txkgar1AvjOjFmoMyXpB5ckKf1S9LyHiIWmmDWiZj7IkruLMAX7cd6EqrjK
 WljpXsKdW/jxsSsu3qiwbdtQXUiC4SSKsE69ysRnT3UZuipvI9i3Av35M6bIChrS
 /MGpEA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v030x14-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 21:25:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30bcb065bfdso5353067eec.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790889932; x=1791494732; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SofIKIpgWS9k/TIH1V5xmRBvQ2KZH8GY2HlqxDspFKY=;
 b=NxcFjlDxbyfb1y0qPV29DHGl/iJAyYHTdTKX3hP/hAvkkyBLDrRhdjCiZv4Fd3hXz2
 Q6eTaA5qV68beHY/UQs92USEvG13ARscCj5eWF0FG2OxGWO+dT3WFJzIZr4vhwjp/wLb
 0cByVriLz4jP4sYR8EbIiDzmLPzZEhnJPZ3j7eK5Y9GhyDNKotYvzYQjtlPCRPbfIBhk
 FWv74PjXAoJR0FapuwxnCQJN1iIXRqUVStqacAqzv1x4RvPtyLdWC2q6NKEksmzrb3TL
 6/bee5kMoCgYRPlRV+qEqcJNj0Ipv+rrEhpWb41SsTSKeLJbd83q3XCUlMjRJuSMDSQV
 PzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790889932; x=1791494732;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SofIKIpgWS9k/TIH1V5xmRBvQ2KZH8GY2HlqxDspFKY=;
 b=FfXVkH2ZqthWWeqaY8l4BvCJg5im2ieGeajNQO1kgZD0jvk8nT0TD2Wmt54c0WAbpS
 8ihybzXZeOXJs7MCJ+eWfpj6Uxy4ScZ6BKLMyukq8EiL3vPbFR4eRpiVoQSNZKXmtEUb
 gxS61e8JC9A0CVqfFKGdesLc/BUxE0T/GDJdrhKDMHNmLuw5GMwDnAT9U7F4woKCnmPh
 1oTh5FkbUDx6j1aHAXOLsIjrF6WFJ27Cp/wtjl6+n6WsjHoj6sTS5RHNlbqnUxuPmu2R
 PAiS0DzI8hKCND7JbGFdRyUgIDwwrpuFtm5IvAwhtipJ+E19matlSCtgMVG9SmmL18tk
 mYzA==
X-Gm-Message-State: AFuF++nL+9iAex/5rYk4LLkWntpEugt8J1ZRb7IKaD51BxbRdj4olku0
 yKjByG9RLGaY0wl+5eQa8yUTpLND57TAJpjKAonMxMOejrOOka2v/h+TLWbImzfxIJVKxU8Q7aT
 2061Yz9il0Fg4CuA506ReMIqouWS1RE+BlQO34c3yXs5dGdTUTaJttukSmA==
X-Gm-Gg: AYBFou3oUtb7ak9ECAels7FeBjmFqu2ZyXYfMCV4V70K/8wYq3GygZMMFj3kSqW/4xq
 KVtZBHjUFaiGu049yn+l/POFycewqF5PyrFc7hJvoo0NGXhzuHzf6x6DopXgNmm5Gk7eiBdK0xm
 daFS6ROFvmeuFOs8VgvzKH2kRObOxCTuAKPiukNYiTNBvgy2GPsDUeVBtBGUXmqoqaNOmcxF63m
 kBXbiIec71RRiC7lkFvkzTIPKWwetbRDy0vPWY4yeQaHYOD/h2HWFESFNxKazaspaU8L2jocUuV
 Y3dx25buutJCUCUXOybe/Xvubl3lnp2diqG6xOMBMqaPkoYCFj32dApKdLPHPETcuzQ/8QNOHEh
 DuwOsMBwNUqf9Dd0Cm4sX9vYbjr4De/60ZannKtv/kulXYvs47Po++E4H2xguMnpRw+BlNQ==
X-Received: by 2002:a05:7301:4547:b0:33b:e75b:cc42 with SMTP id
 5a478bee46e88-34f150c2f6amr498798eec.19.1790889932351; 
 Thu, 01 Oct 2026 14:25:32 -0700 (PDT)
X-Received: by 2002:a05:7301:4547:b0:33b:e75b:cc42 with SMTP id
 5a478bee46e88-34f150c2f6amr498776eec.19.1790889931693; 
 Thu, 01 Oct 2026 14:25:31 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm1941980eec.18.2026.10.01.14.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 14:25:31 -0700 (PDT)
Message-ID: <d379ac03-6d53-4532-8f5b-5e635dde0699@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:25:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] target/riscv: Make internals.h target agnostic
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-1-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-1-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfX+KHT/qcblgYm
 KUrF04k0X2TF3mkRQs8oNmPd6vmLHiSCK5oCjnHdNf4QpgpBBsD07eGw10+6awiL0C5gTzu0qxs
 Spn+NhvO9f+7xPca+wHcFAQMgAiyFj0=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abecfcd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Fuw05WkPVCXsvbvGtSIA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: PfuiP-845whiTxSPyWMvuhzKUWWQuAgd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfXyNdkXoii5jJ6
 GEA6AjUjSFMuNNXkbyUnox6OrBqoJJfxdgzoqu6gVe04hmlw4g/pXis1KJFVi7G/jgCsykACuUR
 BN/hZgYcipcJbUMkO/mtT1LXnjIz3qjvd+D8X3t4Aod5+sWDwh9D2/7p/0wi1Q/Xm5aBAa2/UQF
 vHXSwT2bIehpxDoZYsogwEqerfs3lS22R663IXe6uBfsG4Ho6zJ0Y9BFyNi6HmQF4dMqBPPVGcT
 PDAQUQtrFxT+DpbyGO+/u7etCVDPWvKxfwNY55pNx26nW4txOmBYjikv5jfMlH1X4ZOH63d81ZJ
 HuhH/pissbs61QhvqQt2NsHBN2Q+FwM2lLBVSIT1G18PxykSGnSZpuGsAgTdUvU6z+opX0xHbNK
 ok1ytND6Q2q6qSV0v95YUJQEBIcBP+g2oAVOxk+52dC5w1EDkUGFfPs/D1zXDH4E/L4NsTT4/cr
 ZJ3KmXq3wXpf/gw2F6A==
X-Proofpoint-ORIG-GUID: PfuiP-845whiTxSPyWMvuhzKUWWQuAgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010085
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

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> Replaces uses of target_ulong with fixed-size integers, this is a
> prerequisite step to compiling cpu.c once for system-mode.
> 
> Note: the widening of target_long to int64_t in adjust_addr_body() is
> safe as rv32 is ruled out earlier in the function via the check
> 
>   /* do nothing for rv32 mode */
>   if (riscv_cpu_mxl(env) == MXL_RV32) {
>       return addr;
>   }
> 
> meaning target_long must be equal to int64_t anyway.
> 
> Duplicate includes between vector_helper.c and vector_internals.h are
> removed.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/internals.h            | 31 +++++++++---------
>  target/riscv/tcg/vector_internals.h |  5 +--
>  target/riscv/tcg/vector_helper.c    | 64 +++++++++++++++++--------------------
>  3 files changed, 47 insertions(+), 53 deletions(-)
> 

...

>  /* Zjpm addr masking routine */
> -static inline target_ulong adjust_addr_body(CPURISCVState *env,
> -                                            target_ulong addr,
> -                                            bool is_virt_addr)
> +static inline uint64_t adjust_addr_body(CPURISCVState *env,
> +                                        uint64_t addr,
> +                                        bool is_virt_addr)
>  {
>      RISCVPmPmm pmm = PMM_FIELD_DISABLED;
>      uint32_t pmlen = 0;
> @@ -239,7 +238,7 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
>  
>      /* sign/zero extend masked address by N-1 bit */
>      if (signext) {
> -        addr = (target_long)addr >> pmlen;
> +        addr = (int64_t)addr >> pmlen;
>      } else {
>          addr = addr >> pmlen;
>      }

I think this one is incorrect, since for a 32-bit addr, value will not
get sign extended, so shift will be unsigned.

```
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

uint64_t out64(uint64_t in)
{
    return (int64_t) in >> 1;
}

uint32_t out32(uint32_t in)
{
    return (int32_t) in >> 1;
}

int main()
{
    printf("32: %"PRIx32"\n", out32(0xffffffff));
    printf("64: %"PRIx64"\n", out64(0xffffffff));
}
```

Output is:
32: ffffffff
64: 7fffffff

We need to add a:
if (target_long_bits() == 32) {
  addr = (int32_t)addr >> pmlen;
else {
  addr = (int64_t)addr >> pmlen;
}

Regards,
Pierrick

