Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3EC61DF0
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 06:01:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0v55-0002It-Pp; Mon, 31 Aug 2026 02:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0v53-0002IQ-MO
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 02:01:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0v51-00040H-U1
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 02:01:17 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52Tce2617662
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 06:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WiXJF3DxZb/fqCuONACVZvc3FPcRbbeV91Fdb3T81tk=; b=AlpowcBgQylnqXXe
 N//MM+h1XRMT0D84dqGF7kPeLodSwW/RQjOCzTYq3qhZZ+KiAVXLFn4NGw1Pb9hS
 U3KdVE6lhEf/6cEeu3lnUgXWc2EkdRutqBI+xeeTpe5s2jxj2diZW31e6CMiQLqa
 RDh2rg4Grdt8kHQ2jyFKKMnueEr5EpOPOGPwL5Ea/CH4ybwFvLb6MwOeF14AI2m1
 cVdAJ4KVr/HxoRXt7O8bVJK331zT/KJdyDxufj7LZuCoV95dthFIfWlBZoSG92hT
 VofnKaf8KpecOzm50JRHlwVuYaj+uoQoRZiskjQSPys/5bGkYp9fIOATUixv+OTE
 Q2GATQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2msm9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 06:01:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93494527488so520131085a.3
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788156073; x=1788760873; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WiXJF3DxZb/fqCuONACVZvc3FPcRbbeV91Fdb3T81tk=;
 b=I+wp8pnoPQvBhdbdji9J2LnVKDy3Bq8nnxT810kG3W79DDV3KYtJs1gI/j5WxUpugZ
 Fvc5oY+UQUY011Rn2FPGCAoiHRtsQ+8CS2tFNLB9ibjorWYT/LjvvEa6mbYdoKsEHFjm
 O0219/nQIHdZCHI6mZZOAp22wtmR5VtMCs/6WhDaRMe4NfQKn+uxIjY8tUua+/Uz+1cj
 LQsBjJBFBE4ViDKJjRSHrRs7SUGJDfhpcfMviXYAgb1ByGU8kxlM16Lvhw6oSarRovr4
 IszAOw4RDYPULGbm6kFC/gxgsFwEXuqFJU2ltFJwL3NaOppaYXEyY5yp6xl+hkh2t8y6
 gQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788156073; x=1788760873;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WiXJF3DxZb/fqCuONACVZvc3FPcRbbeV91Fdb3T81tk=;
 b=ZacR4CHydxuilRLlvz+fHSeJSTs5NVboK6jG38hIxtoQ/E7yh7yNyhzJbnIWOOE0fR
 JpSQ/98pUziJBhd2MWHenh6Tv9y5UAziC6dG04GwvmcATLGeYEeGMud4ZlfPrSi/CQJL
 q9P3NPrF2XmB0WuPcb+WqD5uk3tYZ/LKn+p4HaEpaZjA4Srx14dCeVIQg1wOQYTD4Vfg
 Fi6IMwk1faA4+15uL9ris6SguLOYIhYVNjAsSPmur5yZvFCOWzBhHRVb6wHQT/ObsIO9
 n2V2Z0pjyoUA9Id6hUhTuIbaQQpSaay8xyg1bMNQmWnHhxp9LzX5Q+J1NM9bzRJI2kEF
 qk0Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RplmkEOQiiH6y68v8GkirlZ4rpnHKNNirHgikAnwd81Yt6n+KsfPhQe54t/E64fXbvXnSbUcmahoOdy@nongnu.org
X-Gm-Message-State: AFuF++kTvkmHJLeR8BnxbMve4JuFXsisHgd2fMo7BdZHJU9ec1pLOEJb
 Hfi1fqrlrmq3ojVP6imeAOpgt60R1RPX0m2OcbVhimwVp+gt91hwmyVCpHHDUDQcvzYMQox39hB
 Av4k9l9czlQLL1gAVr+ZZIrnSQbA/qE9+Hk2+wTGxInzxAqaeN0Y1l1849Q==
X-Gm-Gg: AR+sD105ksEPpW9sULnexZevCDcNjFV72kNg/2WNOrgyJ9hOaHtpOrC6Br6xB5icufv
 PDtVFNQxUC/yra8C7VXgKxaOm4SCHaYdFxIa7jvaqaFUc6YDrqOuXASMLwDoQiwdw0yybN7U3nx
 kLo++NFZ9FcpTkEFJGu7fFZv6oTIbd33Of/siDJPTT5KfV4BCF/SHvvIsTmMDRI9u4YAVeli1D1
 AKz7ZMV+cJUt4zlXl2dF0ionHturuG6LTE8TI5X77y3cDkgK1j/RItcnFzwhPGSXRMH/QrdK0e6
 HCOdif1u8e2E2oxB05l4enxqVs/TR0pn5iYJRy7AiWBxxUciiw2YLkms9QCsIgo7zC540OqQ2Wq
 RRW4zZPw57ybH7pAKdYdZKENC2xxOhGwzPQ==
X-Received: by 2002:a05:620a:6881:b0:939:4f9:bfaf with SMTP id
 af79cd13be357-939139a0b5bmr2898166485a.40.1788156072664; 
 Sun, 30 Aug 2026 23:01:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6881:b0:939:4f9:bfaf with SMTP id
 af79cd13be357-939139a0b5bmr2898055085a.40.1788156064928; 
 Sun, 30 Aug 2026 23:01:04 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b95018ee8sm258654755e9.15.2026.08.30.23.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 23:01:04 -0700 (PDT)
Message-ID: <e087aa35-5189-4891-94fc-6b1adbd4eccd@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 08:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] hw/riscv/cps: Map interrupt controllers in SoC
 container
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260831021500.82565-1-joel@jms.id.au>
 <20260831021500.82565-7-joel@jms.id.au>
 <b6dde536-bc21-48b3-91c1-03bf900b1e5d@oss.qualcomm.com>
 <CACPK8XcOwv4JLrO-UnbJWoi_jgkARBZ=DMFf7_6RWs2QLiX4Mg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CACPK8XcOwv4JLrO-UnbJWoi_jgkARBZ=DMFf7_6RWs2QLiX4Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M30RpJAwzlIkMqPfmFBx-fAnz3aXcZDB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfX9eDo7h2no9mM
 XvlK0MyX37oBz5nd2Lv11kqjSyV4AyO2ygPrrH/lYo1GiL+Y0vtPUsqIQeDWHe1Uyebwqup7q42
 3e9TF0twYYKnpyEeZddTB7Wehn5Dq/nluN65YTZdEM4hH20WJEhQY1SPK7lw2TCztnDuypu9hPw
 BZrgcM+H2ssrOIY8cZOdgW9tV1faQVaK1c3ERUpKzU1VKZmcasbTnN15Rz4nwfG3tLzt+fmcA9W
 A1LS3Mja6XSyzkSQ9bGUN9etXoAzu/enM9zM9Dl09GLQrf62ZCZEgQsuM1hEKTGkkQ4CbRM8Qd0
 Ya62m44BfyFjncGRjGSQfr54dOwqTd+zWOxDxzknNi6NGepinfWT1nUGszXZKk67hyS29CgpOid
 zaFqzSn1t+n4CRwy0eY/H1zhw8Tnem3ZZE3wZKXA1dZVqf7ahu5R30NERmRpYtowBO2aBKWOyYQ
 auAOjk+mDrIadWvfkGA==
X-Proofpoint-GUID: M30RpJAwzlIkMqPfmFBx-fAnz3aXcZDB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfXw2ODgMm0Hl9R
 NqlwWkIQ13usgBC2hTtM4FiE0y/3/kxuyjOBhRL/EANan7S2lGVYWXRedCDrCXW7yvWZKylr/c8
 1p++Z/eaABbq0H6Ki6YPUHkCquE98rs=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9518aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8-sKEpKnhSKuG9pYr00A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310049
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 31/8/26 07:50, Joel Stanley wrote:
> On Mon, 31 Aug 2026 at 14:35, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 31/8/26 04:14, Joel Stanley wrote:
>>> The CPS device maps some devices into a container region, but the
>>> ACLINT and APLIC were mapped directly to system_memory.
>>>
>>> Pass the container memory region to the interrupt controller helpers so
>>> all CPS devices live in the container. The location of devices in memory
>>> for the boston-aia machine is unchanged.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>>    hw/riscv/cps.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> (I'd have expected this as 1st patch in this series)
> 
> This is a fix that is enabled by the first four patches; only possible
> now that we can pass a MemoryRegion.

Oh right, good then!

> 
> So the first few patches modify the cps machine to pass
> system_memory() to preserve behaviour. Then this patch switches them
> over to use the container.
> 
> Usually a no-no, modifying a line that was modified in an earlier
> patch. I could fold this change into the first few patches, but then
> the change in behaviour wouldn't have been as clear to reviewers.
> 
> Cheers,
> 
> Joel
> 


