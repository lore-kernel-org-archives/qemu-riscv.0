Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2E3CD8C88
	for <qemu-riscv@archiver.kernel.org>; Sat,  6 Jun 2026 02:34:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVgrJ-00079O-00; Fri, 05 Jun 2026 22:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wVgrD-00078h-R0
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 22:33:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wVgrB-0005no-DB
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 22:33:55 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6562Ng4A197568
 for <qemu-riscv@nongnu.org>; Sat, 6 Jun 2026 02:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v1TIM0TZiva7fNh2VBKZ3XJJtWrkbwQ8XgKvXUXyoqM=; b=makyiGJwu3P+dWTn
 Y+//qSxq4WLwjc9OEiVv34lcqQuMnWaJWa+TsYPMLUuNrvOVRzDRtBoIVRdGkEBW
 Io+b/7kKwIet2ff/KBxHn1m9Tz1fZRZi5zf0It0+nleOg5yJk6lfzMcbYzW/iRoA
 RYwiylz/MAPRyDOT6F69qoPGv/ni3fyvv7FZQg7eslgZsbNjLMgDvwn1CIPO40Bk
 1nfLp7QOylF7DSiW25RQQGN6QouOY0uo2IWzudn5wquh5QNFWG0ztkFyOTjo/cJr
 ULEKtL91Rhvpf5WeJWuGqaij81jrqsIDW82IDqsxWa8O/HqvpLbDQZ6hExcTlz15
 1yVMZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3g76u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 06 Jun 2026 02:33:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9158f2c4b55so528284185a.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2026 19:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780713230; x=1781318030; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v1TIM0TZiva7fNh2VBKZ3XJJtWrkbwQ8XgKvXUXyoqM=;
 b=XTMB2z1v4YkBLZnWktL6aRHmtdsG7i7oaVnxmvKM6nBjCnQ/yK2e5DLcDbWZr9ZN1r
 hdrRwy8QTXXP9pkKVI1NmJei9MCkqt45lwu13vJIXLdZZ+g3VwqjRtr6LVhlU37BgdIS
 FlsaLoClMaW9uUcce0QTG7U0qzHbUlBq+JS9UBkahWjZEDuJoHrhO/dNDmZkx10mFhjE
 S42qXVO/T4B/xsH+JvQ8kt7NBGvXmyXSrzL4JupCaAG28i2UDGE4/zlwodoRWPetM8MA
 88BV32zBHGp754dUOZu1AmGcRnjF82YDVoEgWWWtza/3gEt/YJXEaI/ND+vSJs9iRy0X
 tVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780713230; x=1781318030;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v1TIM0TZiva7fNh2VBKZ3XJJtWrkbwQ8XgKvXUXyoqM=;
 b=W9JokhTSCXermJoXQio+TzqWtZ1JbdfMU2LfMI5u8O4Q/waNuTqFuGbFH8LF/sQQIV
 br1Oo3PHjs4h9sHUIke76j73gKZMIPaYIyy7XcnxMCkx7kpQvlhdEnbUXLKTHyun3oJA
 90/Nh77LxrlCw9MmX5sgqplz2NlRGSSDtq7e1Mmt5M/+ZhV6Y0LnxjHW7mLK3+UrPv7B
 0VGew3Q7UC3ZunZASZOTpqVDhOUFcmB+Nr/IczsT+vHiGk1EgUb3nZVyiU5vcZ1XTs1N
 bWnn7rHTqXJcL8ZQpKtwv9ReWhKpqYpaQb9JlmsWUmRV8q2t1JwD4+awaH6lL4wAMerX
 XelA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8THdlGchVf4THRVg2olH3Ca02Q+W0RabnIFUjq12ibW0wuorEhcD+SDb2ZAD5hsb0a1GS+NZLlq2UZ@nongnu.org
X-Gm-Message-State: AOJu0Yxg5/3b3fnzCCilEgzgjZpFCvj5Sbsh0KgNT/lqM9Lwd/79fX6A
 33gTHGyvUa9ugkhnOayPrX2IMzus8H/AcT6SpDr2mdN8GGaQCHJrO4w9swcITQrZP5KbU68Jr0i
 upTiodE3FrQMvItMz2z9DZSpI63T2MzYHA4AtMCzpWa69fc6JrX4WkL4XDw==
X-Gm-Gg: Acq92OEvyVOagEGvUV6Rihv4GWneZDk/NkoqpRWpPS9fxsNDavGcyzUO+Mjn90ev4Pg
 4JoYbu4cwS9hRqkBDBvJ2ZPk2WyTwAi9PTK5sGqVmcU5NNy1Pk3Lrb9eeyPsRKkH5pnVSFEJSL2
 7jxZyFu+TAVROe82hZ436bdCOrtI6evBNXd7AF9i4yEz+0QNm3/MrwpRMY2ldM0j4a2jdnfZLnn
 QbGgKhPS6xJJK1WWc2tO3GLg3t4lZnrkO6616unWrOszXt1R1gWtJWN9z4o7LcSx7Ed+3wg4VCm
 rkm8mJj2j3GGhY3O6uZpJ7P9socyv8bGbrxzneFwoOQ3l5zVdfxFv491WDy3+3vjhq2IPiHJFYh
 mgjsL+SXGuj7Tw4ZU+73rLZ0U/APfPv0XkUND3e5GLAVf57FiskABanc6hk0uFuzbHdiH
X-Received: by 2002:a05:620a:2945:b0:915:40ff:4e10 with SMTP id
 af79cd13be357-915a9c4a2d5mr1126917985a.4.1780713229744; 
 Fri, 05 Jun 2026 19:33:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2945:b0:915:40ff:4e10 with SMTP id
 af79cd13be357-915a9c4a2d5mr1126914985a.4.1780713229238; 
 Fri, 05 Jun 2026 19:33:49 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9158a00a4f4sm1130666285a.3.2026.06.05.19.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 19:33:48 -0700 (PDT)
Message-ID: <3f9d50fb-304c-4ef3-bd63-9fd215b45965@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 23:33:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] target/riscv: Add server platform reference cpu
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 leif.lindholm@oss.qualcomm.com, Fei Wu <wu.fei9@sanechips.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
 <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
 <4acb210eea217195fa733a4f42369c01591d5499.camel@icenowy.me>
 <a77a1891-214e-4788-8cc3-a5729f5cd182@oss.qualcomm.com>
 <9b05368c-972a-491e-bddb-7e015100eee2@oss.qualcomm.com>
 <5y2sdlx3pu5oyhrm3yxxkvkwv6pl3bpvuzdpnlqg4xt3l2zrxd@yi4h5x2f2xze>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5y2sdlx3pu5oyhrm3yxxkvkwv6pl3bpvuzdpnlqg4xt3l2zrxd@yi4h5x2f2xze>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDAyMiBTYWx0ZWRfX3j1HKrOJ3BTh
 PN/Yt0fDXOXZVq7i9CiMnRn4RpioU2mkJddeFkIR5HTyHSgS6AhG7KZab/vcfTMfNZWvAKdrtnz
 HIwMvU93JKh/H8t1vIB/HY7wsCB17yLFQpRfiuTwBWSM0KFkCylYiiJbO4ih7Ht0HLWC8RqxyB0
 fSoGleJcpzMj5iqJYw2gi4KF/uJuCKDW8ZSJ974ruHcyhtzxZbZprugxt2Rtj2065p6/I8xllkN
 vxcJFjqT/LvCFSXKgE1PVt+5v221vOE5R8vii4FzdpX4AjKzYNSe6PtSEE0VEHLHicvbc92o3/U
 SW5tJcjwA+DWj6JhrSX9vXF0XtLpHJA02Nvm2T2FLtEMXe8BHVrKrF0HUd49SQoQtKmbiN4ju3A
 aXtKz0+OJ+Q98yp0hNVi0pkv07jbjOz4kIBFfGjuIlCDEGFiYqwt3JwZfkOmGa0BIkLMDWXCUWq
 Unvo7P8Pvdowzz0u8Rw==
X-Proofpoint-ORIG-GUID: EFqD1zVFeCJ02ZL1ZXw6vWdSADrkvgr7
X-Proofpoint-GUID: EFqD1zVFeCJ02ZL1ZXw6vWdSADrkvgr7
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a23870e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=5l_fwqxPi-CwV5iqmxsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060022
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 6/5/2026 7:24 PM, Andrew Jones wrote:
> On Fri, Jun 05, 2026 at 05:48:18PM -0300, Daniel Henrique Barboza wrote:
> ...
>>> You're correct.  We're not initializing satp_mode to max_satp_mode, so the
>>> default value is being set to sv39.  This seems to be the case for all
>>> CPUs, not just this one.  For some reason I thought we were defaulting
>>> to the max_satp_mode.  I need to understand why sv39 is being set as
>>> default (i.e. why not BARE?).
>>
>> Got an update.  It turns out that what we're seeing is something that is
>> only happening to this CPU we're trying to add.
>>
>> The way satp mode is set on QEMU assuming no command line input:
>>
>> - "Bare" CPUs, aka CPUs that has just I or E enabled: default to BARE;
>>
>> - Profile CPUs: default to the minimum required by the spec.  E.g. for
>>    RVA23 the default is set to sv39;
>>
>> - all other CPUs: default to satp_mode_max from the CPU definition.
>>
>> The riscv-server-ref CPU is a BARE CPU that is using the profile framework
>> to enable extensions.  So for all intents and purposes the code is treating
>> it as a profile CPU with extra stuff.  Which is good, but then the
>> satp setting from RVA23 (sv39) is overwriting satp_mode_max from the
>> CPU definition.
>>
>> I believe the way we're creating riscv-server-ref here is correct, so what
>> I'm going to do is send a couple of fixes to allow riscv-server-ref to use
>> RVA23 as a base and honor its satp_mode_max value too.
> 
> But setting satp_mode_max to sv48 is not correct if that really means
> _max_ since we want the reference platform to default to the minimum
> (sv48) but also support the supported optional extensions and sv57 is
> a supported optional extension.

QEMU only works this way for profile CPUs.

For non-profile CPUs: cpu.max_satp_mode is set internally as part of
the CPU definition.  This is the maximum satp value that the CPU allows
users to set via cmd line.  If the user does not provide a satp mode
then we'll do curr_satp_mode = max_satp_mode.

E.g. the thead vendor CPU defines .cfg.max_satp_mode = VM_1_10_SV39.
In the command line we can't set anything higher than that:

$ ./build/qemu-system-riscv64 -M virt -cpu thead-c906,sv57=on
qemu-system-riscv64: satp_mode sv57 is higher than hw max capability sv39


For profile CPUs things are different: they are bare_cpu types, which are
initialized with max_satp_mode sv57, and then during profile init we
set the current satp_mode (current, not max_satp_mode) to the minimum
the profile requires.  Thus the rva23s64 CPU, by default, starts with
sv39 but it can go up to sv57.

 From what I'm understanding we want the riscv-server-ref CPU to work
like profile CPUs.  In fact I believe we can make it official by
adding a 'default_satp_mode' setting in the CPU definition and allowing
all CPUs to define a default satp and a max satp.  CPUs defs that don't
set a default mode will keep working as today (default_satp_mode == max_satp_mode
if no user input).


I'll make changes and see how it goes.  Cheers,

Daniel

> 
> Thanks,
> drew


