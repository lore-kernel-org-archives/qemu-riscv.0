Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A9F606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH7Rx2Tz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kTZ9w1mc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM9oD-0000xD-9L; Wed, 28 Oct 2026 15:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xM9oB-0000wT-7l
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 15:59:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xM9o8-0000W9-7m
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 15:59:38 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIcTqe1918688
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 19:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gMzvjR8asBcUnu8BI/zhu68U5fL5XTnOpItUHF2C3WI=; b=MH7Rx2TzIW1qTzU/
 x4OxMWmJTJTozyiuZ3I5Yf2IsRRkX2XkMZUuJm5unolrdWpUurgaQOP23s2RcHki
 HA+P/GRGX+Kk/dKpD2jhfiIX206UCxB14ZKnpRseRerDaQmkemiA/42Ecc85+Zdb
 U/uAQIVU6mL+I3pP6+/TNezP0sCl/HloNJT88uT0NXvbP4eVeiqWgJ+ZvkKFRxSX
 5chCYuRD71ZHtVgXrJbBO6j1X9eRvavT/oHdHJZdruhKxh5Ss7kgzS43wGZ5tpKF
 4cyjAJuWgPm4UBOL5gWADY3Kdu1EYNSKCwhjaudMnbwVUsRdwPE/N7hARyakZ21m
 QI5vrg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpr9pu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 19:59:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-36998507c13so2018342eec.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 12:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793217573; x=1793822373; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gMzvjR8asBcUnu8BI/zhu68U5fL5XTnOpItUHF2C3WI=;
 b=kTZ9w1mcw2d6jFdSgDFzCc2oJ/vmMIGYVAp4xr5kMV7bN5OsmYAq1BMDGta+urNSQo
 5fwrL3AOIwT36yC13Mc5c+ScYmEpMZo+exu5VykMHjpapNQZ+b9WSyueL3cNmqFD2TeD
 bFwS4OuStctN+xrWVeMdrvWdHWCGueWcTY94aAVlMTBxT56pbR138kd/Nr8TSaiOLVaj
 DEQAab61dLH6xI2UZE+c6uWqpoL9rapzW2wMVYRXU3KlYVe3UjQt6ExeTJ6dVjkT5jhR
 usDdJiigJN9l4GrwT0ykfIa2yj+zTqGFNcfRuINL0GjKriJb+hAaQz8/B5H4loNjXHJl
 LzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793217573; x=1793822373;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gMzvjR8asBcUnu8BI/zhu68U5fL5XTnOpItUHF2C3WI=;
 b=Jtk+5uxmYf3FHUpzjj71gIuhb6Kj5c1FrwzJnDY0WWF1B4jElKakkLobi0a1GtPjYP
 LaeVpnqOY6GAxbK/AV9JIpthTbtt7zJA6mPFecU4QGjCN8mKS9aZBviW9zNHPhMLYr2Z
 PO4kLJD0unaixXfNaNv+0TSlqmbLsZncu9D5SN2gc6jpKjsoJoSvXPQT2ACWGkkcSBux
 KxdfeF+WVaYJLbNgNn57+zG8oaQ2HaJqcQCiXYgv9vHzoQOKw2nV79ffh3KxvNpt4qd6
 DVL1iCQLtTUwOOH8SLd/kBcmPllKbsaPYgq8mvAuo3+MDAlmWbJ6EcCt3/bXccQBMZ/K
 jJEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzP0Pi2t+YUMJgTXUqsz72+5FWbTiUjzY7GgArzLOvPn8mEedu0v7LqYZq7SfSTfOZ0i1k3CtEPnCYh@nongnu.org
X-Gm-Message-State: AFq9FYI+VueyGlbL950RAHSp6nPR54FZNiD7ym4eTVthxiCepxQC4Ws/
 gImzb+Vdm0puGY6/3L6qgb4OLnlnBrFX8MlLpwuD+O8XIRIeUUVMwrNQAGhroBzkUQ0XZU36oZP
 fVSO+RZ7NbS/WFhxvgwjFeCktAQrmCZcHIoNCW/a13Kblv11bNUJuMYpvjQ==
X-Gm-Gg: AYBFou2liAQkm+gEbqrS6IVDT46IlCgxzRa8X0Sxy+oVPJasCDl8ULyWR2lgm63+rY6
 mVWpmg2joggjJHopFaZxeWtjp1MDwOVF/i34CD651HrFN6ZgE/w0AHVAGxPRAVzuQFBjLivCiaA
 0vwCjRpr5RY4/+NwTpLd3G90epuE8hRBjUoBUvDH8ASW/7DW5VkIDjuIa7R7+4hCs+6lzrnXerO
 urAkL8EX67jZBQ14/wZO+VyzZTR9jWGgHDZVcB1ZQ2RHUnsfSZDG4YaNVwg46caPjKvnY1CDisJ
 bMpi/0QEBQud7pA1KUJlWpwbvIKuhLdnVFUXEpSL9gIN3qVSnE4GcFlNi6xAEECBXNabrzijK+g
 eSlxTjYK99oesKWmAXqlQa7PIhgeiXZSEUqQX40zezkFBFyDstQAgaFxEos3zJxIZkL2QjMKZFO
 RKIBOgk7kDwv2GQd5iFidDQoh7J91eJLedA9yOOFgq1n0=
X-Received: by 2002:a05:7300:7a8d:b0:369:d84e:eba5 with SMTP id
 5a478bee46e88-36a20391cf7mr4150267eec.11.1793217573020; 
 Wed, 28 Oct 2026 12:59:33 -0700 (PDT)
X-Received: by 2002:a05:7300:7a8d:b0:369:d84e:eba5 with SMTP id
 5a478bee46e88-36a20391cf7mr4150212eec.11.1793217572225; 
 Wed, 28 Oct 2026 12:59:32 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a23641e78sm9864920eec.0.2026.10.28.12.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 12:59:31 -0700 (PDT)
Message-ID: <f4cc75c8-c947-48dc-a1cd-93b03e3af157@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:59:30 -0800
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
 <7bd5d577-63db-4356-a19e-4b7e030d58d9@oss.qualcomm.com>
 <CAE2XoE-0zECt6yYURkTbUDBWfG63r_6Dr1oxc5XUcUXr9Wk61g@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE-0zECt6yYURkTbUDBWfG63r_6Dr1oxc5XUcUXr9Wk61g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3OSBTYWx0ZWRfXwzSDhzD8/dg4
 QLawkMRG3MJB3C0+n9xl8ynd84aVtSfTDptqS+dqbEC4buIS5fexi4vfqG4RDDMSh5ayaHquEp5
 hWyJ48RK60dDupvxj/8+4vwDojuLo8jMyLuQukN0aXuYe7ytI2xFdRMpEqkb/lOTpyCH051EjK0
 tufyF3LyJ9YVsTlFCqDbTco15ITLhl9Vu6VQPJNQ8JZatPUYLE0Aha93Kb6K6Qm5p3D8VHVzg5J
 u1XV1jviUZbA780bOdlZrKAenNkkOHEFJW0vv7F43mmFgzJkyAS7twPNpXVIXd0BnrLGz4UjyAC
 zFyWbtb6p+JkhBckK0d0OCuWpkaobYbbCO18StfmaECt3hHm2FTgcryCR/tddAUq7tmVfgHIb/K
 WEQ9STfeFTbyDUNCYTNgDL+4uQjegGyrKFLcjAIOu7hZ591lskVJmwJ7kqugs1gvnXrfvEEvKpU
 xGI7CWHRhJhMu95c0yQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3OSBTYWx0ZWRfX5P2CBIl4n4Yz
 wVSekzXuo3dkNJ2WAPigAVdx+96cVo7OWFY3rdv/1H0MuqQHqNhfeng7z+/Hv3loVqpo04bzLTx
 g6XhBKUAKa6N0nwv52H5IVLnjMDWbBI=
X-Proofpoint-ORIG-GUID: Ib7rTAivPOgPiMM3b0arkGpe1-V4itXa
X-Proofpoint-GUID: Ib7rTAivPOgPiMM3b0arkGpe1-V4itXa
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae25426 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=hdkVIfFkLkAALpxKQBQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280079
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/28/2026 11:18 AM, Yonggang Luo wrote:
> On Thu, Oct 29, 2026 at 3:06 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/28/2026 11:02 AM, Yonggang Luo wrote:
>>> On Thu, Oct 29, 2026 at 2:25 AM Pierrick Bouvier
>>> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>>>
>>>> On 10/27/2026 10:30 PM, Yonggang Luo wrote:
>>>>> A multi-target binary registers one accel-$cpu_type parent per linked
>>>>> target. accel-target.c is compiled once per target and calls
>>>>> accel_register_cpu_type() with that target's target_arch and
>>>>> CPU_RESOLVING_TYPE. A bool array keyed by SysEmuTarget records which
>>>>> arch already registered. Targets that share one CPU_RESOLVING_TYPE
>>>>> reuse the parent from the earlier arch.
>>>>>
>>>>> test-multi-target checks that each target's accel parent exists after
>>>>> QOM init.
>>>>>
>>>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>>>> ---
>>>>>  accel/accel-common.c           | 31 ++++++++++++++++++++++++++++---
>>>>>  accel/accel-internal.h         |  2 ++
>>>>>  accel/accel-target.c           | 21 +++++++++++++++++++++
>>>>>  accel/meson.build              |  1 +
>>>>>  tests/unit/test-multi-target.c | 22 ++++++++++++++++++++++
>>>>>  5 files changed, 74 insertions(+), 3 deletions(-)
>>>>>  create mode 100644 accel/accel-target.c
>>>>>
>>>>> diff --git a/accel/accel-common.c b/accel/accel-common.c
>>>>> index 00a400243f0..0d04b8c5749 100644
>>>>> --- a/accel/accel-common.c
>>>>> +++ b/accel/accel-common.c
>>>>> @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] = {
>>>>>
>>>>>  DEFINE_TYPES(accel_types)
>>>>>
>>>>> -static void register_accel_target_type(void)
>>>>> +static void register_accel_target_type(const char *cpu_type)
>>>>>  {
>>>>> -    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
>>>>> +    g_autofree char *name = g_strconcat("accel-", cpu_type, NULL);
>>>>>      const TypeInfo accel_cpu_type = {
>>>>>          .name = name,
>>>>>          .parent = TYPE_OBJECT,
>>>>> @@ -143,4 +143,29 @@ static void register_accel_target_type(void)
>>>>>      type_register_static(&accel_cpu_type);
>>>>>  }
>>>>>
>>>>> -type_init(register_accel_target_type);
>>>>> +void accel_register_cpu_type(SysEmuTarget arch, const char *cpu_type)
>>>>> +{
>>>>> +    static bool accel_cpu_registered[SYS_EMU_TARGET__MAX];
>>>>> +    static const char *accel_cpu_types[SYS_EMU_TARGET__MAX];
>>>>> +
>>>>> +    if (accel_cpu_registered[arch]) {
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    /*
>>>>> +     * Keyed by target_arch. Targets that share CPU_RESOLVING_TYPE already
>>>>> +     * have a parent from an earlier target_arch.
>>>>> +     */
>>>>> +    for (int i = 0; i < SYS_EMU_TARGET__MAX; i++) {
>>>>> +        if (accel_cpu_registered[i] &&
>>>>> +            g_str_equal(accel_cpu_types[i], cpu_type)) {
>>>>> +            accel_cpu_registered[arch] = true;
>>>>> +            accel_cpu_types[arch] = cpu_type;
>>>>> +            return;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    accel_cpu_registered[arch] = true;
>>>>> +    accel_cpu_types[arch] = cpu_type;
>>>>> +    register_accel_target_type(cpu_type);
>>>>> +}
>>>>
>>>> No need to do this, just move the whole type registration in
>>>> accel-target.c and type will be present at runtime for all present targets.
>>>
>>> The issue is that CPU_RESOLVING_TYPE is not unique for each
>>> target_arch, you may not realize it.
>>> for example:
>>> arm/aarch64 sharing same
>>> ```
>>> #define TYPE_ARM_CPU "arm-cpu"
>>> #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
>>> ```
>>>
>>
>> Oh right. In this case, the accel-target has to be added once per base
>> architecture (in each target/*/).
> 
> So you mean call register_accel_target_type at each target/$base/cpu.c?
> too much duplicated code scattered.
>

You may need a new file as cpu.c will run for each variant.

>>
>>> And the same name can not be registered twice, that's why this
>>> accel_register_cpu_type should be
>>> in a global shared place. We need accel_cpu_registered/accel_cpu_types
>>> for deduplication.
>>>
>>>>
>>>> Regards,
>>>> Pierrick
>>>
>>>
>>>
>>
> 
> 


