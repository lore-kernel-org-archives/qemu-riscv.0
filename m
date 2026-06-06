Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0913CD8C85
	for <qemu-riscv@archiver.kernel.org>; Sat,  6 Jun 2026 10:22:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVoA4-0002XZ-Ho; Sat, 06 Jun 2026 06:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wVoA0-0002VC-3n
 for qemu-riscv@nongnu.org; Sat, 06 Jun 2026 06:21:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wVo9u-0001HE-UL
 for qemu-riscv@nongnu.org; Sat, 06 Jun 2026 06:21:47 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65661CCf695121
 for <qemu-riscv@nongnu.org>; Sat, 6 Jun 2026 10:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DejfRrWtCynbs0DyMPq+0tSZ/zxjjbW5L0n/mIpCTPE=; b=A5FeVMf2s7BlKlF8
 BV1MQ/g9MHjlZaB+FL/lv2TKpkH/dREpMOeX0PdyQ9htD2xnnA5kDUeTqAKvC4hD
 027tcyvucZFra7tihFc3eCxVoJi6SKYBBDjXQmpaILpOvjdTacEKEEsh6g8b25Cy
 2uUldPin0o1qtLJxkX79qAN7QCTEmM0JGlaENkGFU0Re6HGUTo4dhfcMsiDDI98c
 t/SNDhWYr2158hZ5zErqMaLMXlCKxCDmYsRMcEpxVl/wmWinrLqoQKoPlPXODyCn
 dDAc+bUL5eDfoBUPFefYp6hZIIpIjQFV+lIL/FWiU8RPrThbD+r//WosMEflaOil
 jeNBfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8rkuu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 06 Jun 2026 10:21:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5177bddf6e0so68247231cf.1
 for <qemu-riscv@nongnu.org>; Sat, 06 Jun 2026 03:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780741297; x=1781346097; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DejfRrWtCynbs0DyMPq+0tSZ/zxjjbW5L0n/mIpCTPE=;
 b=cNog+Tkidq6xHifiAvfeUgNF3KMR5HzQYKTvBF03StVt6mSfnPYVYq6KLz970Nu1XV
 uLnbik/hh4f6BJVeyvNjoBo4JGtVf5NnR8tmlN+/+lTBECeJgtFIcmmQoEN9wAWPPDI/
 dNslNgojs98PcUEgrgCdughEiovZ48qz4W0DF7oNExA11InrePXf36W1ZmTPI6n5daHz
 kgjQETZfGMBbDh5J4XvyVzy2FwFcjTSp++RpLhYdzGa+izDP02CwkrLCIDAf9HTiQck8
 W73rSE11U7Nttc/fsTnLAPkSJmC1qdBQNL80rYHTUFr1IBK+5fmTfnOeauMouyKup1Mx
 qOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780741297; x=1781346097;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DejfRrWtCynbs0DyMPq+0tSZ/zxjjbW5L0n/mIpCTPE=;
 b=NK+zvNSTJ45JS4jmY2QsmiPBKad08IzP9PeyTvQ7/xV8cZaZbdd+mqBUo3mL0yB3by
 smV1jF0PwmX+R4wK5MYgEHe2c/2ymhAmt1yS5WT1WFPJVl4Me0ybFztPAS+CW65uOlGH
 uDq/3LQFsDWHXw0iQIi92vEzXAj7cvxiYFm9wUBAUi7fRgrG3osEYBGfnxW5jOnG6KsN
 Adl5JkLgiaPkkjKm3pwNWxkdXGuNjcPJMXBAJAaLbw2PBuOquFKlkAmsaFMI7YPSC2Re
 1aS9nzNi5+drwWoWN3PzOp7+nS86Wkxhy/Xv0+Hh21Z6oHReKS2K8uZhefr29o1wT1NM
 befw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+/kPH/KMXKJCoTZT8HUs4X0KIIkDAKzzoZanMECeUewMzGIuupFPbtxo/ROWtLcagYL1bsKKx+C6W9@nongnu.org
X-Gm-Message-State: AOJu0Yx8Tx6ttYQu09LpJZZmLbnYw+1n+sycBr2dpXws+iu1BPmH10/L
 8cNBvOHz0Ci/sgMRxG0QSjPDytiqEA9l2YeEMdApFNzj+5bvPvosyx1VvnDscmrdKuh+FCNbHRk
 yH3uOVK3Tzy77emK6mFcKYuyrF7lL3Kh5k1y6yVaXgkHEvPvo/C9F0nAuxA==
X-Gm-Gg: Acq92OGkVv2ndM5dC2mio/X00UETlXPyH7E5JZSglADuwbZ+LzCCoJzJIqXocsCJLno
 L8ThZjWJh+8TbxpjJ1ddT/t73Ee5NvbXX3Xi/luf0V2Dt++GghbUgF6+D5GqH16mTVSbLdt+fb9
 9tJHcay1xJlpoIjmNG2g7ta/tW5IjItm7pCVk9fwXaO5O3ij2O3u3xyqNOMW3Qy29piKYQetGC8
 P/tUytAF4g0uhWJxa6z95YH7NrD8w9mUeutoGHp0lUWk4vpIocLCftw9pc4PdcgBgH1gFPN8T23
 3PbmFiIaO8dbV2FQ7+Da3vhknZUeD3D/jd4PAS3qQhpNyQMFahzCDtI2cOU4zSgDgX1QQZrL49R
 AIi8uhi5Mck3Xmbq4wB1JLALPXkuiYKw/BqbcLjvHSoyDtLGnsl01/s2oEz9kBk5Vbd49
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id
 d75a77b69052e-517987df585mr68619991cf.27.1780741297271; 
 Sat, 06 Jun 2026 03:21:37 -0700 (PDT)
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id
 d75a77b69052e-517987df585mr68619661cf.27.1780741296789; 
 Sat, 06 Jun 2026 03:21:36 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cecd0708cfsm105976426d6.38.2026.06.06.03.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Jun 2026 03:21:36 -0700 (PDT)
Message-ID: <eb4169a9-6f28-4104-884a-62249f7ccdbd@oss.qualcomm.com>
Date: Sat, 6 Jun 2026 07:21:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] target/riscv: Add server platform reference cpu
To: Icenowy Zheng <uwu@icenowy.me>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, leif.lindholm@oss.qualcomm.com,
 Fei Wu <wu.fei9@sanechips.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
 <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
 <4acb210eea217195fa733a4f42369c01591d5499.camel@icenowy.me>
 <a77a1891-214e-4788-8cc3-a5729f5cd182@oss.qualcomm.com>
 <9b05368c-972a-491e-bddb-7e015100eee2@oss.qualcomm.com>
 <5y2sdlx3pu5oyhrm3yxxkvkwv6pl3bpvuzdpnlqg4xt3l2zrxd@yi4h5x2f2xze>
 <3f9d50fb-304c-4ef3-bd63-9fd215b45965@oss.qualcomm.com>
 <17b395009bef17cc056ae4a58a83c744ebb12798.camel@icenowy.me>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <17b395009bef17cc056ae4a58a83c744ebb12798.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fdJ1omqGxuxu6YPyy22zteXWQLjWDMGP
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a23f4b2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ulUEThHsuaDsgZ1WON8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEwMSBTYWx0ZWRfX4X2qF/HQHpJl
 5PyceGBk01I75yWcAFgUQ5cg82WYB5pZssc/VvAXp12tMFJGxXMdr6oe+bwdd5OGsJ63w+r/25v
 rW4cp1H19zPjdwsNFagQGC9d0VfbpSC6H2rMSINiw4Mda2TLWURRHUnF2RCHCx8QjkmU79dQlVk
 3uLFptnlrsbuXAfqqXJ0e1UJI+gcHbe3iWtyfrby4lTI645uzlN1hXRC8z0XMSiK61cuJj+pMkC
 JkEHzZCwD1UeK8Yn828nxdRFeVCCEdS0d1TismV6oJ92zjm4b+bgPB0Bp4/6sr5JpU8kME33qLg
 ZjaJjYzN0oOHNnMzLahsyUL+LK8Dy5taK9dRzVznijirN9U4hzjSOqOkjI5Hp/uKNl+gPr0xSRP
 9x6cx8DHkn6Vb08P2K4dAJ5UuVsd90Y1U9tdEIxOWgOhtalYWRLAcQ5uarb4gDI5uNZ5zezoAcs
 Ry+M+pKO3Ak1ySpAw/w==
X-Proofpoint-GUID: fdJ1omqGxuxu6YPyy22zteXWQLjWDMGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060101
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 6/6/2026 2:16 AM, Icenowy Zheng wrote:
> 在 2026-06-05五的 23:33 -0300，Daniel Henrique Barboza写道：
>>
>>
>> On 6/5/2026 7:24 PM, Andrew Jones wrote:
>>> On Fri, Jun 05, 2026 at 05:48:18PM -0300, Daniel Henrique Barboza
>>> wrote:
>>> ...
>>>>> You're correct.  We're not initializing satp_mode to
>>>>> max_satp_mode, so the
>>>>> default value is being set to sv39.  This seems to be the case
>>>>> for all
>>>>> CPUs, not just this one.  For some reason I thought we were
>>>>> defaulting
>>>>> to the max_satp_mode.  I need to understand why sv39 is being
>>>>> set as
>>>>> default (i.e. why not BARE?).
>>>>
>>>> Got an update.  It turns out that what we're seeing is something
>>>> that is
>>>> only happening to this CPU we're trying to add.
>>>>
>>>> The way satp mode is set on QEMU assuming no command line input:
>>>>
>>>> - "Bare" CPUs, aka CPUs that has just I or E enabled: default to
>>>> BARE;
>>>>
>>>> - Profile CPUs: default to the minimum required by the spec.
>>>> E.g. for
>>>>     RVA23 the default is set to sv39;
>>>>
>>>> - all other CPUs: default to satp_mode_max from the CPU
>>>> definition.
>>>>
>>>> The riscv-server-ref CPU is a BARE CPU that is using the profile
>>>> framework
>>>> to enable extensions.  So for all intents and purposes the code
>>>> is treating
>>>> it as a profile CPU with extra stuff.  Which is good, but then
>>>> the
>>>> satp setting from RVA23 (sv39) is overwriting satp_mode_max from
>>>> the
>>>> CPU definition.
>>>>
>>>> I believe the way we're creating riscv-server-ref here is
>>>> correct, so what
>>>> I'm going to do is send a couple of fixes to allow riscv-server-
>>>> ref to use
>>>> RVA23 as a base and honor its satp_mode_max value too.
>>>
>>> But setting satp_mode_max to sv48 is not correct if that really
>>> means
>>> _max_ since we want the reference platform to default to the
>>> minimum
>>> (sv48) but also support the supported optional extensions and sv57
>>> is
>>> a supported optional extension.
>>
>> QEMU only works this way for profile CPUs.
>>
>> For non-profile CPUs: cpu.max_satp_mode is set internally as part of
>> the CPU definition.  This is the maximum satp value that the CPU
>> allows
>> users to set via cmd line.  If the user does not provide a satp mode
>> then we'll do curr_satp_mode = max_satp_mode.
>>
>> E.g. the thead vendor CPU defines .cfg.max_satp_mode = VM_1_10_SV39.
>> In the command line we can't set anything higher than that:
>>
>> $ ./build/qemu-system-riscv64 -M virt -cpu thead-c906,sv57=on
>> qemu-system-riscv64: satp_mode sv57 is higher than hw max capability
>> sv39
>>
>>
>> For profile CPUs things are different: they are bare_cpu types, which
>> are
>> initialized with max_satp_mode sv57, and then during profile init we
>> set the current satp_mode (current, not max_satp_mode) to the minimum
>> the profile requires.  Thus the rva23s64 CPU, by default, starts with
>> sv39 but it can go up to sv57.
>>
>>   From what I'm understanding we want the riscv-server-ref CPU to work
>> like profile CPUs.  In fact I believe we can make it official by
>> adding a 'default_satp_mode' setting in the CPU definition and
>> allowing
>> all CPUs to define a default satp and a max satp.  CPUs defs that
>> don't
>> set a default mode will keep working as today (default_satp_mode ==
>> max_satp_mode
>> if no user input).
> 
> I think we can just make RVSP a profile, and rvsp-ref CPU a BARE CPU
> based on that profile; then set the profile's min SATP to Sv48, and the
> BARE CPU's max SATP to Sv57.
> 
> In this case if any other CPU complying to RVSP is added, it can just
> reuse the profile.

Having riscv-server-ref being a profile CPU seems compelling indeed ...
new CPUs could instance it with .profile = &rvserver-ref to have everything
already sorted out, we would also have a flag to enable the profile for
existing cpus, e.g. -cpu rv64,rvserver-ref=on.

Drew, any thoughts?


Daniel

> 
> Thanks,
> Icenowy
> 
>>
>>
>> I'll make changes and see how it goes.  Cheers,
>>
>> Daniel
>>
>>>
>>> Thanks,
>>> drew


