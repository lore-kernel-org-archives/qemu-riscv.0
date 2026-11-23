Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19659606A331
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 20:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XR1dZXye;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KdMxtzt2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVapL-0001Az-6O; Mon, 23 Nov 2026 15:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVap6-00018w-7L
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 15:39:39 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVap2-0000c1-VB
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 15:39:35 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANJuaTG2973605
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 20:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NLUbQ+pw8kNVH2HWuNKEB/3PR8RGWVT2ZfxbcCHsLWo=; b=XR1dZXyeL20cursr
 OdXnoblqncVEqTs4mDU2eHM76W20t0Pzj4fPXp6b5LqvmhUgwKz7kJOAjCBDu4hI
 K+Ti1h2n5xPFZD4mfmjGM/6mM81iXx2fMcGOgyFERDNTd4sowJXVwg0n8YJNrhOK
 N81khd2pGVz2KbYS0Nu8arra5ifKGMUbFx74XQH5mYG8HKFk7ueQYwh1DA1RDBvu
 NDFryS2hsWgYvmguUujsa89gONbPFX2IlCeIW5Eadz5NbHGWi8Sm+GQjXr3Dqi6m
 cXu4HAzaKI9pCnVRVfF3e+/lFNKE0khgaLNCE89L+6kr6uqLK/9l+xiNhLjnSBxd
 cI9dnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03dmx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 20:39:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-55d2bde4c78so56946421cf.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 12:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795466370; x=1796071170; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NLUbQ+pw8kNVH2HWuNKEB/3PR8RGWVT2ZfxbcCHsLWo=;
 b=KdMxtzt2JADEVhd8kDutub55mgRYinZ19p6F+4CpkiLjfX1yTDz5mWPhMPaxGK12M9
 vKZXja4ryrOQpbZnj98pBZJjNATUOIOUe9RKwrPoNEHjwFcxhh/3s/Pw3hFYHs3C9AeD
 JG1n8/vbblXQ9ocJJBP1y/r8F5Gx9odpOL1DN49WTIJXjMEFcPaSgfpj/d7Nt4LO3Lqe
 Lxb+bmgYiV6SjUdWe383R50Q1sfCrh7LRbvBi5tLZeVD5iPNdls34goDJw51kKvGJd33
 MPFF23byrWMZVISPBu8RazZK8JE19Y9O43+FBfm4wq8h7W9tRaATid8xUzShc3gZZLza
 3sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795466370; x=1796071170;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NLUbQ+pw8kNVH2HWuNKEB/3PR8RGWVT2ZfxbcCHsLWo=;
 b=zGRP70+/pQA0e9lrxMtB8o8BZtCdWSIj2aLLGZvSxSv/T8M+fg1C5OU9fwEVnEomgB
 ejFkjDiFpBxHN6FpUcHAohMHljN7gChVMCDVxVOrfYYDpqbM2bi2mS4Od4zPsvSE2hj5
 lz7Gyx+mMoPf2pQNX00sZXj0T3ISVh/XhOhnCaJekOTDk9WHmUYWatRZArB+ByaajsZ/
 EgoUqzV1Vs4W4YUfWxHfTei86lnN6so4tTtn7n4/OdI7z60hoIBCcAdiP9n/3xRJWrxl
 OaZa83qh1OO+uEXaTLQlFX5XBvpjrPgWEOsmdjr31OAWybIS9xWKv0TYsCHvAsw+4ol5
 RJ5A==
X-Forwarded-Encrypted: i=1;
 AL+hErH5VtS6uUI3D6TZJ7weJEjQr7NH3tZ62avSbMayeCxTXBbQO5ld7eZ8/cMIpx/ajWUnJWL0VBloTMHp@nongnu.org
X-Gm-Message-State: APuU4Z9sjUrFbIlLVjL4wqM8jgIQ5GEL5PjycO9x962oDN2oVouywYW5
 OPUrjb2zLspxJ0QX5AEJhUKNYpj6ThQQ/bQwloULOH9E0j0FOjUw+4dYf0osO1xXbnV9NlQf7QK
 tw5KDd7yDNJV9RoLDjJvT1No9sSs0+y56O/KUAxQ5IAGSXZ4ScUYVDSAdtw==
X-Gm-Gg: AZFdTZfnsg5wkuI9JYokaltNEl67OpqLR0JJ2KByf/lL4s9R2/i/zFzBucJ6pepNlGk
 suHK2aRRFv6BqRhKstUx18jSEHHUPxYbLGTvbLiHHoFTO3kIfI+bIxzKYb7BItk/zs34Nzc6LtP
 ur5+Ew65h2899/W8nbJ/M5fby8/zQElkiYX8ntZrTtxBKcQ62wq40uSS6qt3nwB9bLqS7hcwQZU
 a6MDdiDKh3jTImkJpsJ1uLl9q0m9bmT2l79l2hr/t6L9qVBYz3znTs8VvPu+BIdMdIr80JGG/Uv
 uCLyInT3z0c8qbIxkxIZSa55vYDJcJMsk2ni0uY0afCDvUhYqw/4QYRVRt1cgkaTfXY9F/SwA+o
 D4hFYi+aI9TmjfQktV64sOTfkTQJr6G7nWyQK0mvp7NRgfuPpYTyius+h+9cQgAlxHbH4oMZpBj
 aKS6tTjuP9
X-Received: by 2002:a05:622a:4ccd:b0:55d:17e:f7e with SMTP id
 d75a77b69052e-55d76aa8762mr208061421cf.75.1795466370350; 
 Mon, 23 Nov 2026 12:39:30 -0800 (PST)
X-Received: by 2002:a05:622a:4ccd:b0:55d:17e:f7e with SMTP id
 d75a77b69052e-55d76aa8762mr208060681cf.75.1795466369749; 
 Mon, 23 Nov 2026 12:39:29 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb40ea12sm887679785a.35.2026.11.23.12.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 12:39:29 -0800 (PST)
Message-ID: <a39697db-832b-4746-b16a-d4df27c5171e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:39:24 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] hw/riscv: implement CBQRI bandwidth controller
To: Drew Fustini <fustini@kernel.org>, Sunil V L <sunilvl@oss.qualcomm.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicolas Pitre <npitre@baylibre.com>,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
 Atish Patra <atish.patra@linux.dev>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
 yunhui cui <cuiyunhui@bytedance.com>,
 Chen Pei <cp0613@linux.alibaba.com>, guo.wenjia23@zte.com.cn,
 liu.qingtao2@zte.com.cn
References: <20261111-riscv-ssqosid-cbqri-v8-0-121f6dcfb573@kernel.org>
 <20261111-riscv-ssqosid-cbqri-v8-4-121f6dcfb573@kernel.org>
 <87e5d269-d875-4afb-87cf-2b2658a7b740@oss.qualcomm.com>
 <awSBkD9LuNBoZLm4@thelio>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awSBkD9LuNBoZLm4@thelio>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX54uCWUMWqPdM
 gVdCZ/O3YrGOFPaHi7ujAxGfrZfstSTEhpUclGn132SfwiIMJl+Doyc6CYOw4baS/zifg2mxKLg
 WUVogUNc8Do+wNMGKiIR3cUo3fcayXQTkq+ECzMFpyrIFg0X9u5xAal6xFohFFPCn5upAyGCD3t
 qvKbGST+J+EItq9YuFWheQkib1a2u3OzKuaymuNjZ/+uVeoEm3fAFQX/0QALDVjwNXyaiEjnMT6
 O0tR1y63irxl5oUPNVuGOW/qVtPKmTdHlo/BFRYPjt37b+QCr36yavc/uQUg9oa+MCvdyCYWXNh
 fGAaEHIODFslB/rC2pHaeOCfeI2eh2hQWjV80cn1DtMWZ30ZAaJBC6K6LwXo/oOg0rD/2+S4lvh
 G+tIjcoVshlEzBgXX8AE2EWccrhEMVEysoaX/Mcu5X9205jMf3F/ZVFLZoU7BP7U6ByjJgtxyog
 +fdaBtBa63giP31g8uw==
X-Proofpoint-ORIG-GUID: Fn9YG34VpCFcCE3Xb1vJxlRG6fni95y9
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04a483 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=V1jnuoLLAAAA:20 a=IpJZQVW2AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GlCrJtrt_9WjeoYueIMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: Fn9YG34VpCFcCE3Xb1vJxlRG6fni95y9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX7oFCgJR5MVA7
 RL5J0UUBscUNpycPEL2qfHJOejwpbCRNP16bDR7nsdUNtXDbDZCs5AjjIMgVmx/mwMLy76Xzj0c
 +yIG7uxV9i1VQ0Nb86PM00Myx0ebQeo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230082
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/23/2026 3:10 PM, Drew Fustini wrote:
> On Mon, Nov 23, 2026 at 12:22:03PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 11/11/2026 8:38 PM, Drew Fustini wrote:
>>> From: Nicolas Pitre <npitre@baylibre.com>
>>>
>>> Implement a bandwidth controller according to the Capacity and Bandwidth
>>> QoS Register Interface (CBQRI) which supports these capabilities:
>>>
>>>     - Number of access types: 2 (code and data)
>>>     - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
>>>     - Event IDs supported: None, Total read/write byte count, Total
>>>                            read byte count, Total write byte count
>>>     - Bandwidth allocation operations: CONFIG_LIMIT, READ_LIMIT
>>>
>>> The controller gives the Linux resctrl support for CBQRI a device to
>>> configure and read back bandwidth limits per RCID on the virt machine.
>>> Only the register interface is modeled. The configured limits are not
>>> enforced and the monitoring counters are always marked INVALID because
>>> QEMU does not model memory bandwidth usage.
>>>
>>> Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
>>> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
>>> [fustini: rebase, add fields introduced in the ratified spec]
>>> Signed-off-by: Drew Fustini <fustini@kernel.org>
>>> ---
>>
>> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> 
> Thank you for reviewing.
> 
> Alistair told me in the qemu riscv call last week that I should have a
> tcg test for srmcfg csr. I need to send a v9 with that added.

We had a call?  Guess I missed it :D

> 
> Alistair also expressed concern about adding caches to the virt machine.
> He explained to me that the virt machine is really meant to be used with
> kvm and there really is not a role for modeling caches in that scenario.
> 
> I had recently considered sending v9 with just the Ssqosid patches and
> holding back the CBQRI controller patches until there is a real hardware
> platform to model as a machine in qemu that implements both capacity
> controllers and bandwidth controllers. Atlantis only implements capacity
> allocation for the shared cache with no monitoring, and there is no
> bandwidth controller.
> 
> However, I am thinking this morning that I should probably just post all
> the patches again for v9 and see what people think. I think the RQSC
> series is more complicated since it does need caches added to some
> machine in qemu and I am not sure what the right answer is for that.

Fair enough.  Don't forget to add all the acks you've collected along the way.


Thanks,
Daniel

> 
> Thanks,
> Drew


