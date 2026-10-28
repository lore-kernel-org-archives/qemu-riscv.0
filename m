Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCFD60A262F
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUHovhfy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8PeHtsi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM8zE-0008Bh-OU; Wed, 28 Oct 2026 15:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xM8z3-00089r-Hj
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 15:06:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xM8z1-0004J4-FL
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 15:06:49 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIPKii2995055
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 19:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 guHAVwe04KeT4IVaHQCoWACYVPLVhXO727jLFKVDgT8=; b=KUHovhfyG+yugCAS
 snA++VlCECnI9eQKWxRZ1jya8JAs1c3ID3ELwbtNmyLbvW9BGix1eKlBUKEknxBL
 b9xY7RNVfjh4EA3XxFyYFc+x0PtuQ5zbFdJxaBBqdbySagRbp2ziPrZX14tCerzK
 MwCDlauG6sMp0DY+wORgBwVy/HLR3AdhAgfDcJr1ijIY/ppfEJN0oo2jqcVaW4Gk
 a4vUmOoBxFeOLpGQagAQbhpX/gKVux7ZD3A076r5+o6Toj9mu/bJaOHR5loBmYGx
 qN610HMMXMNlASsyKhb9Yi7aGd4D1iDslMz8d/BA1U17buKjvWZU8tObe0ufCF/p
 cqkbXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurdsy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 19:06:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-36a223755e4so4155941eec.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 12:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793214405; x=1793819205; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=guHAVwe04KeT4IVaHQCoWACYVPLVhXO727jLFKVDgT8=;
 b=d8PeHtsidE/7PUtZiSpFuWur/IxK8yxYf7ZU4wjFk7/GP5hTZWOIPfhjogRm549Ark
 0798lARuBlaKAJbFd2EnNQtfDr0yYW8sQkxg+tQp509CXonJm66UlunDq10FE3NMfCsr
 ljbqIb7/j6I9ghKLQ7NLEkLJ1TMwEZoMmQsV1rwlPHLSRBfRDF/ZKROoBS4PalnNrBy1
 aaAU3snKA8OYBmpqG0eTEllcyjDXn8rEP50gClkzJba5+tWs/u2/WWETyIHIwtCPTZM/
 0ByZePwaqd3lt5lruRWD5OXE/X1KoUmcm3Mus8k3YDWJone2GByOZegCe9Gn86rWwgUm
 lXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793214405; x=1793819205;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=guHAVwe04KeT4IVaHQCoWACYVPLVhXO727jLFKVDgT8=;
 b=RmxXH9tdDHhSbcJDzWk6o12zBfXbTWxDf7dmnsHyat5VoXWjk+kqX+uIZx6ztlfSwu
 pontsENA6Xwx78TC9ZhkSqAakYqeIXEZdrOPcYAKyWRFaSGWzvBIDTXF3m4Zbd3jWfDK
 177AnJYkOuGeqVAxL5RIQAKmRM+AQvbWfgw7z9gbH989kohQOA/7dbD/NivC577+J6ub
 xmUqCSfZ9wM6R9TumNyPsXDoWZDZCk3M0mJagWaHcvsMx7n53msO5wE79OTYWj3Z4mOy
 64n7zM22OhWITTGR41cPWWpa8Ywy33/s5lZXElZNY927xkl8c5c7kAVs05GHYjROctEv
 yi1w==
X-Forwarded-Encrypted: i=1;
 AKwUvBx5P2ei/5k5JYrCJD+Q6/lenjuY64wqRKcVg3cVgUhCoIOVAzTIyXr6pU6T3jqgdV4FYAOUMdaNERzB@nongnu.org
X-Gm-Message-State: AFq9FYLb9DYnBNRBPoCdKi+kuKDKYoILL3sICOm4eSWTlLrjGWFZmAKS
 8U6kj6+rhtiHUeDO/ToUhEn9TQKacYnpPIVX5bnFWoOa6XyRHEORdFhR/RWF3so8ZOq4b27ZIdW
 3WQd/kepEEVpIsqYszqRPMg8xIRgevlUJbDHmrrDDDO21Dw32S1WQ1XxnkQ==
X-Gm-Gg: AYBFou0opdKwFgjnmrk03RkGYz2KIgizhYPRWqS4D7iJmuW/OTRkL3wMiQMJZ9/duQ3
 o/Ha0gmaqE0fpRzvI7mL6IN5R1BySWj/rB/kU4HjuJ5b0hjAQJWZlAaIyeDErA2MowiDWf34o89
 qG+YeTam00yg+m8xTK3RPOz8b0cKOJ4vYtmNy1Ytf7xHBmBl58WYIA6N/a7DuWA+AJMKDvn0Ct2
 iL4eUtYfK7S30JqOOr+d61rX//8lEf9AR2SIHNCTX6byTH0T5d0ecm+Z/pFL2Rriki5I+v/EbWN
 XnNXK39KogVmYvqH0QF4GmWrwo+fZ39d1adNmWH9jhTqEvnjnrQQXMZ/DH8MUg1IwDwcJI4qgCo
 6BJxaNpH91aoBz2CmiLv6h7O7LWSIZi3HL3VdXQxC9i+4LlbWH0g2iKsrfr+iaZTIfb0d3aprzG
 TnKRqrt1RCRhWIt9MaqKfHVtEFqyYik8fWdsc/CM+JWks=
X-Received: by 2002:a05:693c:4010:b0:36a:eee:bb41 with SMTP id
 5a478bee46e88-36a202bc3ccmr4740946eec.1.1793214404582; 
 Wed, 28 Oct 2026 12:06:44 -0700 (PDT)
X-Received: by 2002:a05:693c:4010:b0:36a:eee:bb41 with SMTP id
 5a478bee46e88-36a202bc3ccmr4740917eec.1.1793214404010; 
 Wed, 28 Oct 2026 12:06:44 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a2395bee6sm8813926eec.21.2026.10.28.12.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 12:06:43 -0700 (PDT)
Message-ID: <7bd5d577-63db-4356-a19e-4b7e030d58d9@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:06:42 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] accel: register CPU parent for each target
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Weiwei Li <liwei1518@gmail.com>
References: <20261028063049.2530-1-luoyonggang@gmail.com>
 <20261028063049.2530-2-luoyonggang@gmail.com>
 <bc5bad6e-fbc2-44e1-a4b4-41bdfd41d33a@oss.qualcomm.com>
 <CAE2XoE_r3gZXzS+TFUd+GRs-8ZtCTajsJK0wJpTHNoXx_Cf3dA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE_r3gZXzS+TFUd+GRs-8ZtCTajsJK0wJpTHNoXx_Cf3dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NiBTYWx0ZWRfX5RWJbL0/GMiB
 2wEzkbilwOdSWTZBIzU22eLyzgYXHjsbopEqF6Nwqlwcaj4fhgo5bq2q/FOflZDgMECTMKV/eAf
 G2p2NZrSCkaZKOYtn8sZEhhra3JvhH0LaoL7E91/YnecBJghquQAqW5HVsXzLlUdes91KefQF7p
 4CpqT4/ZEKxFZZSW7EBvp0ESBO55s6hfTGPEbp99QGbCvhFIclGzIig+FYW+/W4fjcz1ZSVWJZh
 VdiFI0zg26jT68etwu4Yb6tksriJKxblg3QgQjKF5ILECSiV5oSMZPFaiKAAv33wkzyPb+vkQME
 XAxC2ZkqwQ0rZ+DrkKlv4qvPOeahxXma7mH1BmsQlQNPi8sZTTQmtmDV35bf7tpmITb8StUgoPS
 Zl6WgM4S3/e/B7P9h46IogAeR+/oB5njulxo/8rltqOmkZnN8Yp5BX+sxkcBba6dXcL99ZlkODk
 wcF/YlfbdnjFTn5dcIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NiBTYWx0ZWRfX9QtSeEKOz8PI
 XJUIPfXmUuJYkuu/CmgqLU2PI/oYt+FtUc6h+coo29Db14l2jidbMadgnRHMJjhC/kpXwD+jH9J
 gP+O779WfhQeGGW/yXkDIW4EvDb63pE=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae247c5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8y7-PkDap2zE0UGPBckA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 0V6OEMSVaK4wptbh5m3wqrh6wzWipmPq
X-Proofpoint-ORIG-GUID: 0V6OEMSVaK4wptbh5m3wqrh6wzWipmPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280076
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 11:02 AM, Yonggang Luo wrote:
> On Thu, Oct 29, 2026 at 2:25 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/27/2026 10:30 PM, Yonggang Luo wrote:
>>> A multi-target binary registers one accel-$cpu_type parent per linked
>>> target. accel-target.c is compiled once per target and calls
>>> accel_register_cpu_type() with that target's target_arch and
>>> CPU_RESOLVING_TYPE. A bool array keyed by SysEmuTarget records which
>>> arch already registered. Targets that share one CPU_RESOLVING_TYPE
>>> reuse the parent from the earlier arch.
>>>
>>> test-multi-target checks that each target's accel parent exists after
>>> QOM init.
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> ---
>>>  accel/accel-common.c           | 31 ++++++++++++++++++++++++++++---
>>>  accel/accel-internal.h         |  2 ++
>>>  accel/accel-target.c           | 21 +++++++++++++++++++++
>>>  accel/meson.build              |  1 +
>>>  tests/unit/test-multi-target.c | 22 ++++++++++++++++++++++
>>>  5 files changed, 74 insertions(+), 3 deletions(-)
>>>  create mode 100644 accel/accel-target.c
>>>
>>> diff --git a/accel/accel-common.c b/accel/accel-common.c
>>> index 00a400243f0..0d04b8c5749 100644
>>> --- a/accel/accel-common.c
>>> +++ b/accel/accel-common.c
>>> @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] = {
>>>
>>>  DEFINE_TYPES(accel_types)
>>>
>>> -static void register_accel_target_type(void)
>>> +static void register_accel_target_type(const char *cpu_type)
>>>  {
>>> -    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
>>> +    g_autofree char *name = g_strconcat("accel-", cpu_type, NULL);
>>>      const TypeInfo accel_cpu_type = {
>>>          .name = name,
>>>          .parent = TYPE_OBJECT,
>>> @@ -143,4 +143,29 @@ static void register_accel_target_type(void)
>>>      type_register_static(&accel_cpu_type);
>>>  }
>>>
>>> -type_init(register_accel_target_type);
>>> +void accel_register_cpu_type(SysEmuTarget arch, const char *cpu_type)
>>> +{
>>> +    static bool accel_cpu_registered[SYS_EMU_TARGET__MAX];
>>> +    static const char *accel_cpu_types[SYS_EMU_TARGET__MAX];
>>> +
>>> +    if (accel_cpu_registered[arch]) {
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * Keyed by target_arch. Targets that share CPU_RESOLVING_TYPE already
>>> +     * have a parent from an earlier target_arch.
>>> +     */
>>> +    for (int i = 0; i < SYS_EMU_TARGET__MAX; i++) {
>>> +        if (accel_cpu_registered[i] &&
>>> +            g_str_equal(accel_cpu_types[i], cpu_type)) {
>>> +            accel_cpu_registered[arch] = true;
>>> +            accel_cpu_types[arch] = cpu_type;
>>> +            return;
>>> +        }
>>> +    }
>>> +
>>> +    accel_cpu_registered[arch] = true;
>>> +    accel_cpu_types[arch] = cpu_type;
>>> +    register_accel_target_type(cpu_type);
>>> +}
>>
>> No need to do this, just move the whole type registration in
>> accel-target.c and type will be present at runtime for all present targets.
> 
> The issue is that CPU_RESOLVING_TYPE is not unique for each
> target_arch, you may not realize it.
> for example:
> arm/aarch64 sharing same
> ```
> #define TYPE_ARM_CPU "arm-cpu"
> #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
> ```
> 

Oh right. In this case, the accel-target has to be added once per base
architecture (in each target/*/).

> And the same name can not be registered twice, that's why this
> accel_register_cpu_type should be
> in a global shared place. We need accel_cpu_registered/accel_cpu_types
> for deduplication.
> 
>>
>> Regards,
>> Pierrick
> 
> 
> 


