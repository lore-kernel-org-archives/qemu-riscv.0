Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5199CC79FBF
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 17:02:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4iAe-0005xx-Ix; Thu, 10 Sep 2026 13:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4iAc-0005xN-CM
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 13:02:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4iAZ-0000Ob-Kw
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 13:02:42 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68AF55LI650817
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 17:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hXbMnF90nmSK3niPsTBCS4VPFoZe36J2Y3z6Ib8D140=; b=m7vLcwEUzU5DAUcl
 Qci/2KDpvced37wBbxcCVFmU+UaXR/beqemICbysS8ohVjURaaau0e7sYybj6sD3
 vL9q29X7FDLnM8Ge/RNl+rYJEc+32N65ARAT/qqcKQSAmikBXecJb9UNDNT23KBb
 +I+lv1K9I9q8AC0Vc/Q/dPdqzA9WSyFpB02jv4O0JeiEnbWbLQJH6MjiIA4or378
 c2bDnxTDBgL/UnsU7id0lbCQujmCUbCl/cK81DPVesZKmq11ZXVVD/GoRhLgaXWQ
 DEr/Ve7u8Jv8sGPlLfFZL+hIH0QxRtCDPz3Hcsx1youXQRPyYjb36UR3oDm0fVC9
 eJtenA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv78krs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 17:02:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e82060977so665185a.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789059755; x=1789664555; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hXbMnF90nmSK3niPsTBCS4VPFoZe36J2Y3z6Ib8D140=;
 b=eCSj/ywU+qGLIhi2XjkuRYgK1fvdNI8yhKe8qvb+9i+4ts+ELo6MMYhvPOTug+h+2K
 rCxwu0lRyIN/AadgWXz6Xyea7mBiMln7c7P+4o2sthfmWJ/0ry5bKgY2y5iX0z+ThvRB
 6Mwpgi0plSiLzO9gT6oQb/fDPqNiXkHxT+uNvGUley449R/lsnMIc1K6Tnc82xWClqLL
 4uHRbtvHYGQ0FfpGx/XVRwqb5ZRV9yQ0MnIdplSaNgmYHg8YPffxIeNKFBBk+oH5mW4o
 sQgQ6uJ2xcGjz511tECCKL9D16sbs17uklN6z2hZxgh8E8uvoIsOuSm/+tBa6pnr0LYU
 7Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789059755; x=1789664555;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hXbMnF90nmSK3niPsTBCS4VPFoZe36J2Y3z6Ib8D140=;
 b=at07AgoalRhYlwYvIaLKAnk9VBnurYvKIdAPA2zwK3l/skfbBvk9Y69Sa3R9uJs0O7
 W5JezWhQPiizQQwrFGf75zjNnptsEHLp+dlXpmDyEFlmiRiAPmxW14RWUQMr5qS3Q/wB
 mOeyEN1hdeav6dceE6A/tz23VvmtGU71axEVKsqwxfmYnbHaoo7bg/nFyEBDnzKyb+EQ
 3K1plUD19xcOymtMOKUq5Yd0t6SfV4MyytHkkMW+wIcd/4utF3UjunTi9tl07mQ1Lta1
 wDUGUvwGMx/SY2oS1Z725YGEoukHR+9pKUdX+E6F8n0ZdbivBTQt9VBfgncVjQzQnOEi
 8bWg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHuJ8hr0J9Q3OtqvR4hlEv4QRX9Cufrj8AyPk11bYpY4e4w2AC1fBTIhT0HunrvZT95/UQmVyV2tgB@nongnu.org
X-Gm-Message-State: AFuF++kwEZAjLeYtKMsYfCitD7TYvQK1yLMJV4Xxq6cdVnNknyKgruxv
 HMK995NK+ktLkEdyUF6ZIXYLv7Qcr0PXlyOsVxm92lf8sZuh+BpLY2IjDuy4SOPkV4Wvcs+kdqk
 /SyNWbpwJrmP4guBeAsub4eForBJM1CjozmPwZmGw28zYcqEjuAYkv4Na9g==
X-Gm-Gg: AYBFou3QejkogGg7xpS79kWJ4WIOGEN13yC6NihUr0uYd8fY8bpHcPl3N8E4RtqMDwV
 ZpJoeXKZqQqPZBTPMToSfiJagIubSrErKrxNPbLMoj8Z6O+TmmEWlWtFM3P/AhzjE49t0Hnpwf8
 fRJn2zP7rS5/0GPLX1yf5vC6yTcl/0YI5sROZuKD6VWJa8+6Y4kOmHA7XxMUqZjdbDFiGsYII4z
 gpSCBCr5fy2kVE5teP8jlxS3yu64m5cIjz+wNKzCvjdYKqkh0ZKYkrj77CSfqBSP2x2LQkhh9n0
 +TYl7pqYE5mH1smYM+YSN7aSbZ4QxzVyaVfD6drmzanDMbiT5CsnGhg0zBwy1F2JtE02J0CZ3uo
 WG+Qph+i6WqrFKpkoEeWMXzEDq2/BTYxJoqY=
X-Received: by 2002:a05:620a:198f:b0:939:72cb:bae1 with SMTP id
 af79cd13be357-939d7f878d7mr681046085a.24.1789059755081; 
 Thu, 10 Sep 2026 10:02:35 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:939:72cb:bae1 with SMTP id
 af79cd13be357-939d7f878d7mr681038285a.24.1789059754335; 
 Thu, 10 Sep 2026 10:02:34 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e7dacd3esm30239985a.5.2026.09.10.10.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 10:02:33 -0700 (PDT)
Message-ID: <3fe48325-21bc-469b-a400-d565f5300bdd@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:02:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/5] target/riscv: add riscv-server-ref CPU
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, Icenowy Zheng <uwu@icenowy.me>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Sunil V L <sunilvl@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
 <20260909210756.1767711-3-daniel.barboza@oss.qualcomm.com>
 <7jkwao2hlaqtkdi44zkvgfe6rij7rpz6dd7qqwm6gw7xmta6vp@biexkhgtrofw>
 <w44ujiuswgc4adzlmgimorjgad34vav6vdfcgqtbkbifjjczqa@43b4y5n5pqwv>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <w44ujiuswgc4adzlmgimorjgad34vav6vdfcgqtbkbifjjczqa@43b4y5n5pqwv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIwOCBTYWx0ZWRfX+NFi/HpAbowV
 PD8NS29t7CPbNZZrvl3C5UBkvJjV2yqN1keu4txhsvYWIrtd3rA30RQd2q5JmVW/4zGIPp8eqAB
 fOZ12lBnJjdepl5vn4axjVt/T3KQN+w=
X-Proofpoint-GUID: t6N8h8y3DQkOJn9855iKYojGBMYeRMj4
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa2e2ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=PXcuKL70AAAA:8
 a=FRSEYCzRAAAA:8 a=aYUwt7bNCLrai9CsiyoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=xVlTc564ipvMDusKsbsT:22 a=1qLaeP4TCVy2vqIEy19U:22
 a=H4N_Y-AU75W7NKDNhZlT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIwOCBTYWx0ZWRfX/q5DTYSbR0gc
 bw6q/0d4JJAF0Zl3mlSX1nUG8UUXvilI6oWoW5YOMql1ckqLFFBlTM/inzX5iB3vGXCv2ePTWfQ
 WAQ8cENmxRTWnQ0RQgyWyem9OVGkxKJF2byv6YzTvuJ9+FWStoBVGQJUBklxcyUYH6NyEYW/Kxi
 mMQnQQCxXARUotIGLMOV6od3kj32HY6q+KOsnP2fBM+B4IoSDl2dbWDWyzB5vX0j307QKYxDyJn
 SOIjfNP5K4tskGAIIrBBXX0MqYvtPQ6VAXCHpGrUT19zaez7RkK/yVS2pFMEQjw83OwYGkZLNPz
 cX/MxYS7Q1rEx1lff/jD8BnFrxyuI8waNZ4c+gwEcvLxBtwB4owLt/bgudHfAIV+JlrzmNYIWfT
 j6kAW8deo0ranH7vs69rXH0XtDSoAMWYwUCTLc/DMs5JKfLudQuH7MrscRbrBr5ij1PbHTYCQUI
 PZhLXh89D0IqjcaAFwQ==
X-Proofpoint-ORIG-GUID: t6N8h8y3DQkOJn9855iKYojGBMYeRMj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100208
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 9/10/2026 11:17 AM, Andrew Jones wrote:
> 
> More comments...
> 
> On Thu, Sep 10, 2026 at 09:47:27AM +0200, Andrew Jones wrote:
>> On Wed, Sep 09, 2026 at 06:07:52PM -0300, Daniel Henrique Barboza wrote:
>>> The harts requirements of RISC-V server platform [1] require RVA23 ISA
>>> profile support and others.
>>>
>>> We're going for a profile-based implementation, instead of a regular CPU
>>> that can inherit RVA23, to allow future CPUs to use it internally as a
>>> starting base for their own extension sets.  There's also a new
>>> 'rvserver-ref-1.0' flag that can be used to set the extensions in the
>>> command line for other CPUs, which can be used for testing/debugging
>>> purposes.
>>>
>>> Note that for all intents and purposes "riscv-server-ref" is a regular
>>> CPU and no, we're not trying to set a precedent of calling the riscv
>>> server platform spec a profile.
>>>
>>> [1] defines in rule SEE_020 that we must support at least 11 debug
>>> triggers (4 for insn address, 4 for insn load/store, 1 for icount,
>>> one for int, one for excp).  We're going for the minimum.  If more
>>> triggers are needed users can set any trigger amount with:
>>>
>>> -cpu riscv-server-ref,trigger-count=N
> 
> s/trigger-count/num-triggers/
> 
>>>
>>> Note that N must be <= 128.
> 
> Why? Isn't the limit RV_MAX_TRIGGERS == 1024?

Mostly because 1024 triggers is a silly number, a theoretical cap I came up with
to not revisit the value later.  Most CPUs in the wild has less that 16.

Alas, we're not doing any check for <= 128 triggers anyway so this part of the
commit msg is misleading. I'll remove it to avoid confusion.  The 1024 limit will
still be enforced in the trigger code.

> 
>>>
>>> [1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
>>>
>>> Suggested-by: Icenowy Zheng <uwu@icenowy.me>
>>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> Reviewed-by: Chao Liu <chao.liu@processmission.com>
>>> Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
>>> ---
>>>   target/riscv/cpu-qom.h |  1 +
>>>   target/riscv/cpu.c     | 32 ++++++++++++++++++++++++++++++++
>>>   2 files changed, 33 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>>> index 1a28f1369c..61234842e3 100644
>>> --- a/target/riscv/cpu-qom.h
>>> +++ b/target/riscv/cpu-qom.h
>>> @@ -42,6 +42,7 @@
>>>   #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>>>   #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
>>>   #define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
>>> +#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-server-ref")
>>>   #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>>>   #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>>>   #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-e")
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 773aeba8da..0b0b8e0a99 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -2424,11 +2424,36 @@ static RISCVCPUProfile RVA23S64 = {
>>>       }
>>>   };
>>>   
>>> +/*
>>> + * This riscv-server-ref entry isn't a profile per se but its
>>> + * CPU definition can be modelled as a profile that extends
>>> + * RVA23, with additional things on top of it, and allowing
>>> + * future CPUs to derive from it via
>>> + * ".profile = &RVServerRef1_0;".
>>> + */
>>> +static RISCVCPUProfile RVServerRef1_0 = {
>>> +    .s_parent = &RVA23S64,
>>> +    .name = "riscv-server-ref-1.0",
> 
> rva23 mandates Ss1p13, so shouldn't we have an explicit
> 
>   .priv_spec = PRIV_VERSION_1_13_0
> 
> here?

We have code that updates priv_spec based on the highest priv version required
for the profile.

I don't mind adding it explicitly here though, so might as well.

> 
>>> +    .satp_mode = VM_1_10_SV48,
>>> +    .ext_offsets = {
>>> +        CPU_CFG_OFFSET(ext_zkr),
>>> +        CPU_CFG_OFFSET(ext_sdext),
>>> +        CPU_CFG_OFFSET(ext_sdtrig),
>>> +        CPU_CFG_OFFSET(ext_ssaia),
>>> +        CPU_CFG_OFFSET(ext_ssccfg),
>>> +        /* ssstrict is always enabled for PRIV_VER_1_12 */
>>> +
>>> +        RISCV_PROFILE_EXT_LIST_END
>>> +    }
>>> +};
>>> +
>>> +
>>>   RISCVCPUProfile *riscv_profiles[] = {
>>>       &RVA22U64,
>>>       &RVA22S64,
>>>       &RVA23U64,
>>>       &RVA23S64,
>>> +    &RVServerRef1_0,
>>>       NULL,
>>>   };
>>>   
>>> @@ -3766,6 +3791,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>>   #endif
>>>       ),
>>>   
>>> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF, TYPE_RISCV_BARE_CPU,
>>> +        .profile = &RVServerRef1_0,
>>> +        .misa_mxl_max = MXL_RV64,
>>> +        .cfg.max_satp_mode = VM_1_10_SV57,
> 
> To stick to our minimalist approach, we could default the number of
> counters to six
> 
>   .cfg.pmu_mask = MAKE_64BIT_MASK(3, 6),
> 
> See RVA_060. The user can get more counters with pmu-mask/pmu-num.


Fair enough.


> 
> 
>>> +        .num_triggers = 11,
> 
> Outside the scope of this series, more debug-trigger work is needed for
> complete SEE_020 support. In particular, QEMU still needs interrupt and
> exception triggers and the required VMID/ASID filtering. The 11 slots
> configured here provide the intended capacity, but do not by themselves
> provide all the required trigger capabilities.


Right.  This is sdtrig/sdext code (I guess) and we'll have to address it in a generic
manner.  We'll address that in a follow up.


Thanks,
Daniel

> 
>>> +    ),
>>> +
>>>   #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>>       DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
>>>           .cfg.max_satp_mode = VM_1_10_SV57,
>>> -- 
>>> 2.43.0
>>>
>>>
>>
> 
> Thanks,
> drew
> 


