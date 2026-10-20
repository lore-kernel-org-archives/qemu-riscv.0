Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB4606A31B
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQqu7xTC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wx0H3aVH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJ4mV-00053H-Gp; Tue, 20 Oct 2026 04:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJ4mO-00050i-D3
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 04:01:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJ4mM-0007Oc-DM
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 04:01:03 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69K7kNaq1025998
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 08:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kqdUQZ5WOVbFKmWnSIDXR3DCl1yA6xbzJRYh//OQAIs=; b=ZQqu7xTChU3gUb/b
 iAAZI4AJWKHqkimc9gOgtVjFOM+i69YoYT3rjxDLqJSboxiFrdYmhF97A636rt3t
 p5FKAIF2ac+08lR8RJT6BfFRQHKU3nVONa/X37vU51HmCTAXPOQJRuLITzSKwj3w
 0dwo4/zGNVqPNTCK8istxJyQD8IFGiunuJ/CRvw4ncRTMIaR8DyWsss8mW7zxm6G
 2CiibpK0r/SUwwbVfToVf00KjjFc7cB7aAjI/AYckynUCjI0RYcWIg7jJYdqpIV2
 JWS8ZQO5I4q9gZKGHEXNKWvZFYa2vTpHJYHqtzNc59Sbm4x3DFJ3iNfpbZc2NMs4
 SS0Zog==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1hby-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 08:01:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91bebff9fcaso82168936d6.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792483260; x=1793088060; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kqdUQZ5WOVbFKmWnSIDXR3DCl1yA6xbzJRYh//OQAIs=;
 b=Wx0H3aVHHtAlGV+h5qJp+c+O5LDBDWcNoYEyMNq9vpyb/XxsKCFXn0DN2vKqrAZ8QF
 3JUA4zb4r+qkVaGcXQ6Ing3zW1MFp/177t2hP5WzdOzoi6oSfGdgkTBzsw8+SVJUP6I2
 9IdAVWilL7ayEHm8K61oD52ZcbJAGR9GtZDZjl90+OMfR/beDfElcXHiNufmlmCAKMFt
 MjdGC/bYMYKRq2tHEClLVE8qGxRn1CsArz2XWfJq+YPu+47ZKFIK5eS6O9jkgjoe5P+s
 KQYcSrXCGSX9OeIoVfi5/rIXAiJXc4aE3fwJYWlj6R0UGyS90SO7OsWBX2arlZ+vVlNz
 KLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792483260; x=1793088060;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kqdUQZ5WOVbFKmWnSIDXR3DCl1yA6xbzJRYh//OQAIs=;
 b=mNQeMWeicFG7/FtS/L8aNiWohNyfB41OncBCyQkDqHaW+qWy9Bqe2WF03iaz+0hk3t
 gIGLH9s2OOqebEorqUMaNmIrm95S6tNgu5v7mvYAHMvPq1Y/e3gFK6oKyoH0Llp61v7W
 q1yaA9D5kjR/d3S9YmNmFwB0zgZ5GWkRXYIcbltuXStOOXG5PBEWD1LrxpO4+t0NRbhw
 OrQX8PGNLsl/8VioFiMyvej+F/Tfr8ELRAwxzoPWHWUDYH7slyUPRNRmhOOkAC6U5lZA
 znZHY1P5gcBgXBy4rNY017XcukSacKoDHoMsBoM1X6Yzk6hro6hhdAgwCk4QF9yScdss
 o/XA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCYsM3/dO1CPUOC140ewGFWCRuv7zIRW+P8jiZJwIoulbjRiuCZ1EUpGyPKy/E2HABvbkXk4u5lHdM@nongnu.org
X-Gm-Message-State: AFq9FYLXVBUmnbn4GX8OEDJp5Li3ZVWGF3vYaPqkP9wmnEoLwGyjRUkQ
 nvo/w1IgV69FpDus5GQ45WGSrPhBWXTIk8BUHb0HPo2ATJWTnWrKWaNSkchiLqI/LxVqInbUE75
 73/LFv1qwCdIj3o8JIGatTr8cBdaA0ZKToeWF2EvVM8mPZng4iHshKdYa+2gbJNI/zUvb
X-Gm-Gg: AYBFou1vdBYhOyFYC6bPMAmfuYy3x8HOLQyFMjlD7Thy5qzSa21ZrZiWiPZmdA3MfKx
 +uUkdnUxvtiVNAw/R+aQx44fNwV+kuASi6yp9G7GCepqMPQQ64W/+5fPjqPyNnKowzfn3iEirbd
 /R7dUUHuAaDK3sIeDBpRKX7iX91cwUbiJHrrdLXN/93FRbx4xCuNztM+vHZ7Fhcasgpfvl+/fAz
 GRWzsFQjfMDKlkyldT8FJSAHLfh+ykdGrXOA4X8yYQjgBJ5+NLBl1/k3smuaLRzioJopCtRLhhq
 tU3va7nAtT3XER9U21fnv+gzYBdv0b5t9x41CqlzJ0DHiz+EeCa0StTY/NhMBx6CeG0lbBQk8gE
 3UDHTAXTvD52gowQ7Q84QhNY6RTfcOQFOnQ==
X-Received: by 2002:a05:620a:470f:b0:93c:7e9c:3bba with SMTP id
 af79cd13be357-93f29d2c0b9mr1746212385a.41.1792483260104; 
 Tue, 20 Oct 2026 01:01:00 -0700 (PDT)
X-Received: by 2002:a05:620a:470f:b0:93c:7e9c:3bba with SMTP id
 af79cd13be357-93f29d2c0b9mr1746207985a.41.1792483259548; 
 Tue, 20 Oct 2026 01:00:59 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d810035sm4688542f8f.13.2026.10.20.01.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 01:00:58 -0700 (PDT)
Message-ID: <6337a90b-b14c-4df8-aa0b-570cac47e965@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:00:57 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Remove stale chapter on RISC-V 'Z' CPU properties
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261018230741.6560-1-philmd@oss.qualcomm.com>
 <8360ad12-6dab-44e6-a930-17ed8e92a09b@oss.qualcomm.com>
 <CAFEAcA8thrNkzvR_UVnfYUjaSNiaax6Xupw=DsBapHDyPbpdEg@mail.gmail.com>
 <943c16d9-1880-44a6-9982-4fac725cf982@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <943c16d9-1880-44a6-9982-4fac725cf982@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mcuWvmzAK1W9QDjISbEmInr3ubifeq_R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX+WJ8wAVONOho
 00lJQpiTiCvL6kSHfzzM6pCzxzW8LuPXVrzSktsPHCIugLzbebVS8MdAt2nM5TLV/C1cCo4rjNC
 we2FYdvlUHAgoPmMQQD0M+ZcZCiio7c=
X-Proofpoint-ORIG-GUID: mcuWvmzAK1W9QDjISbEmInr3ubifeq_R
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad71fbc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0JJvY9oDge711AmrAkMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX49B7l2iC2LBY
 2jB565GasAHFhAldzE/FV9uggfXclFiBLC5oY3XAczz7tpv1GQ3g+O4T+vg6x5mTW1nJqXPdRuL
 kwNQ5OFEF48rq9F0+FpNlKYbA/NvlfzRO4L0oSUZNiNJSY2Yqbx/+eB3eQWJBpXwHvcX4kJcHCe
 V0lkKNF/IIALSJBDMx8xD4rRAcdY5AZPiX9UVGTCAdySVVaY9yu23EfJC2Qq8MZKioQ10jXa7GA
 pkiNVKO93J/toGqfyG6j6lKgsH8AAlOckPKtQkdcDmFSHfh1Wh2AisI4JLo0QGO2RhbWT/1MwOv
 noV+FPSmfLS2J9paOkPlFFj9A8287qfNZtUuBrNwp+uEFN38hXONBTi0RoOFyZwmknJsZ88CU4m
 dsR7zZlP2CX0krEe/hiFbWUYVIBfVqOxJyijYoXKp+UHEs3WldSr9lasyH5APYSecQZZ2vX53+Z
 xezhI9R/N6xJ+MkiFUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/26 13:54, Daniel Henrique Barboza wrote:
> 
> 
> On 10/19/2026 6:48 AM, Peter Maydell wrote:
>> On Mon, 19 Oct 2026 at 10:42, Daniel Henrique Barboza
>> <daniel.barboza@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 10/18/2026 8:07 PM, Philippe Mathieu-Daudé wrote:
>>>> RISC-V 'Z' CPU properties were removed in commit 455c0fa9eef,
>>>> for the release v10.1.0. Remove the stale comment.
>>>
>>> I wasn't aware that we need to remove stuff from deprecated.rst after
>>> awhile.  Thanks for taking care of it!
>>
>> We are supposed to move the section from deprecated.rst to
>> removed.rst (adjusting it as necessary) when the feature moves
>> from "deprecated" to "actually removed". We didn't do that in
>> 455c0fa9eef, so we should do that here, rather than just deleting
>> the section.

Oops...

> 
> Got it.  Thanks for clarifying!
> 
> Phil, can you please re-send the patch moving the text to remove.rst?

Fixed in v2:
https://lore.kernel.org/qemu-devel/20261020075927.56983-1-philmd@oss.qualcomm.com/T/#u

