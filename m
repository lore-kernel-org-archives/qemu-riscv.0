Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB921CCF2E4
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 11:54:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIlwW-0005xk-3P; Mon, 19 Oct 2026 07:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xIlwU-0005xU-UV
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2026 07:54:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xIlwS-0002ch-LC
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2026 07:54:14 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69J8P1QI2041968
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2026 11:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 seflFJn6QYQmQe1vaD2wNIDBThztECEZBMdyfT8OQAQ=; b=Ds2CG1vTuWEFF8qz
 mlFS3gh6YHo8sU2wY3r1HM2KdoczR0RSPUBSdLnzGQWzbtpzsBUPXw97a2Ti1qzW
 aydJ/JstbZwfIW4EYxWcIgMG4wI3XR45wfiloOvRDVNc1qGoJHdppTMS1XU+bG20
 emc7ekmhnW3ukV45qr+DZ3UByBWyE2vqRE/JbAfZmG+aSFoADYQUk/wZEXz7LlTL
 ut0CIqxdeHT+SvHhMkwEkiH0+9hg6gGNH89ZLx4aj0bf15OQGiCfe+t40QeWxq0N
 9uATAZmX2Pxuof9gmcZ/BTXPoEFo2MC+xUs6IaiajHvr1artAJa0M3Hr0afzgFQv
 B251Iw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2jdj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2026 11:54:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91bcd0247edso39556126d6.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2026 04:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792410850; x=1793015650; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=seflFJn6QYQmQe1vaD2wNIDBThztECEZBMdyfT8OQAQ=;
 b=I5XQh1AyExL/A0W/vvXrgepSoviJOBbr/y7ZAwyyaDTcUx2hb2KdgqdfOMsabB2IKs
 q2rFDPQQTvdeZ0AaFlbvokefiio4T8jj3lCxDs7fOzkS/LRuU9olOgfjL/KhZ57GtAEU
 nKO+2Cum7fI1PAuQlQnlupw1A1FVX4N09OPKYiKk7aB3mRMeTmVVqfTMfhOfKh9eJcq/
 dkhP1U9R1tv4vO99IaNsm1iMB3vP8a8oiqrCHnbIHYGvs2tGxtiVsdePhkC9Oy/maNYt
 WhB4ke0sgKoJytFzMujHnATH3h1PweaTNcCMXcSPMwKk3fFy9zYfXpkls3+NBj4b0vvW
 1Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792410850; x=1793015650;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=seflFJn6QYQmQe1vaD2wNIDBThztECEZBMdyfT8OQAQ=;
 b=AJ9LoCbqBaZtvq5/cSNQs7JU5U6b13XEAWTWMwcnIQfqx7UL4uFl9L5AZL+w4m7J/y
 fqrBqNIfGIVgJuJJ2xNiFvl17/d0+GU+HWnqOSI4XcnrCjNBPol4YaUZlnweUj39jt2x
 ZLMADGUbVzX/hpkD22VCLPd6da/cVR4yxXA4DZYKGr76QrYvPHVBoYJEV+oEYx89cC7d
 dUvkD0S3TTGFFH+VsUepyqmFCdjizbURsrrm7jpMsZP+SpQz3xCmqhIE/eGITdJOZ5wF
 ULqTUDs2d+yVdnsnlwb9pH59FGTiwIz44MBkv8sxXucquhvDm30gkmIsIKYtXiFw37Aj
 +P5Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxYJ4TRRrvZx0ZBgeEeFClCQZwxvAl1Fik/pWWavLPIsN78XzU7sVq46N1iqsDb2a5Ijvjd2IyFrn1J@nongnu.org
X-Gm-Message-State: AFq9FYIUylCGvF/DZC5xcOCoMzjJq7hhT7/DM4w4xo/aAztTM30KQX7+
 INQzs2/xfeJynpNPZr5xiFxGYO3D2YOF+t8yFmrY3IwmHZVgIXgYAQdmfMPh5s9h247ej/zg/zC
 Q7l6FT7pbfwMVo6kU8sl4N6Txz9fuTI5hgqG7pkjzRh+F3R8+cH0cBbn8QQ==
X-Gm-Gg: AYBFou1pFezEHX3SbbHODMm9c6Ta5TgX1VNGJvNzge8Myg86sNbRLBBicCIMvtxazz8
 243PIdEUaZmFxd67of25/Mc3YsOd85zzywLuGZ5SoBEqrZ0zi83x8Ipf6w/nhuYMcjjC+owvq5o
 IxeodNruvEasacSWXDCnlNm2HOGt9AXnqL1nEvQOQEwTb6Jlo9R3F0i9wifoz65X201Q1BX0zil
 AzDkP1YZ9LnembEM4qpbw09DXLiYgwOwLabaSkzadVVTAlA70mwpgxCbuX1GoyO2KIFDFaJY1CR
 iO5vav5/tq4jI1OYvgboBpd41g2A4nJRwGr93TMLhdWmJwBaC7klq0qy2TopxluyVGkS3A5kc73
 OxDjfBBG6E9EATu/EC3k3faH6tbZBwR3fddihK3QBzOenZerNT8MbVYXRwxPNBM2XSyBL0RSS
X-Received: by 2002:ad4:5dce:0:b0:91b:5d39:e142 with SMTP id
 6a1803df08f44-91bdf631e9fmr125353506d6.55.1792410849726; 
 Mon, 19 Oct 2026 04:54:09 -0700 (PDT)
X-Received: by 2002:ad4:5dce:0:b0:91b:5d39:e142 with SMTP id
 6a1803df08f44-91bdf631e9fmr125353056d6.55.1792410849099; 
 Mon, 19 Oct 2026 04:54:09 -0700 (PDT)
Received: from [192.168.68.103] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bcbae1e06sm96564086d6.27.2026.10.19.04.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2026 04:54:08 -0700 (PDT)
Message-ID: <943c16d9-1880-44a6-9982-4fac725cf982@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 08:54:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Remove stale chapter on RISC-V 'Z' CPU properties
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261018230741.6560-1-philmd@oss.qualcomm.com>
 <8360ad12-6dab-44e6-a930-17ed8e92a09b@oss.qualcomm.com>
 <CAFEAcA8thrNkzvR_UVnfYUjaSNiaax6Xupw=DsBapHDyPbpdEg@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA8thrNkzvR_UVnfYUjaSNiaax6Xupw=DsBapHDyPbpdEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfXxxr7QSSqCaEa
 ArIud6VfF/ysTKQCRX+0AVYud9V+ayfWkyNsthOjnhcMYPVqjrxXwTK0bOpVA7lorHAbCKGwMMe
 Ol89r6CL8UY++EvYEtvyUzRbbtvBRjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX8I9PXbXYdJud
 vLdokt1D2z6axx0cN1tfSODNJ/fJkeYjaeIg7YCwJNcD8Kc4CzqofZgcQuarXnb4tm2w+JSRd2W
 Y3LU9GTE+8/ZgrmI3yE7xPcbSdHNimdkdA+l+cnA+cMnT2lEvunleD+uy3QQ5IlWHUc7/6kUuGo
 lN/SPB8kfxbut3D5kEtfqp6mIlNrLUoglKevQiGD130zcdu78bfCR1eD9WbAnSfq9cuc7eojnug
 ctQzwhKPcynEQutJH7xTqtPCob+Vy631ZtBjCae9PSudmE4Rwtv5myPMbvn2YqVoqdhN0SdpVPl
 KiZGiijHW2+LFh5J+YTrnbVHdjghtY8qa/JB/Lt7Nw20TKFBSuBRmv4Tcom4Z1egsbmRCjEsaVH
 hPL+amF2pCg9R1YXN9BeelgSiszoiwhJA2KWygnTsZEcj5Q4J5p7A/yeSGRh2Keg7kncJyyaLio
 0mfpCGriVDuSE7QUwlA==
X-Proofpoint-ORIG-GUID: UIo1JY9A1IDJ9hMELFiT236awBpMGYmo
X-Proofpoint-GUID: UIo1JY9A1IDJ9hMELFiT236awBpMGYmo
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad604e2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r6Uv-rxiSxc7U83AazAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190047
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



On 10/19/2026 6:48 AM, Peter Maydell wrote:
> On Mon, 19 Oct 2026 at 10:42, Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/18/2026 8:07 PM, Philippe Mathieu-Daudé wrote:
>>> RISC-V 'Z' CPU properties were removed in commit 455c0fa9eef,
>>> for the release v10.1.0. Remove the stale comment.
>>
>> I wasn't aware that we need to remove stuff from deprecated.rst after
>> awhile.  Thanks for taking care of it!
> 
> We are supposed to move the section from deprecated.rst to
> removed.rst (adjusting it as necessary) when the feature moves
> from "deprecated" to "actually removed". We didn't do that in
> 455c0fa9eef, so we should do that here, rather than just deleting
> the section.

Got it.  Thanks for clarifying!

Phil, can you please re-send the patch moving the text to remove.rst?


Thanks,
Daniel


> 
>>>    docs/about/deprecated.rst | 24 ------------------------
>>>    1 file changed, 24 deletions(-)
> 
> Alistair, could you unqueue this, please, as it doesn't update
> removed.rst ?
> 
> thanks
> -- PMM


