Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AB4C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:14:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzI7w-0003Ex-Nj; Wed, 26 Aug 2026 14:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzI7e-000314-Th
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:13:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzI7b-0004xs-PS
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:13:14 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QHP2Bw404574
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 18:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4Ql5Ylx+NIsh1sezBqRcWzJvr43JL44lD8FsD/4QeSQ=; b=YiITLFwTo4ZmqYfv
 K837S3boQp79xWpbBEoVF/I7njUHt9/cXVc20k9u+RE5SJ/w1xAwMEX+hF3+tQnN
 5NfsVTj4WqFURMqdtcP6UH4AwkjPMrLey+9nkMzh+lMsaxXEqXg4FUWXFtjE+8sL
 DHrbQm71OU5RbFggjjp81vBkCWrIdProVKjf8UvfPHoJ+/zkYD8JeOMcBsDZS7ts
 IwpB1QG3qcbKoL8QF+Z7CgTTvohdChH2Lk8eSeMpkAWHjRJSKrn54UJTVz/EPoqk
 Ok1wMDcDUwHJKOjs+vfFS3eGXg+jbCvarT8U5j9d9TjlAUoQbnG4JXaWRODaZPAd
 G4+5Zw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthtfe5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 18:13:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cfa4e4684bso27336425ad.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787767989; x=1788372789; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4Ql5Ylx+NIsh1sezBqRcWzJvr43JL44lD8FsD/4QeSQ=;
 b=V4qRr/l4lHYwHeN/Iw904UdmmAWAUzI33umFnAgvuUYgigqe+T5az2J0mREZE0LKZA
 OxXeh4yQA18Pd/XSb7yEQe3hyVynxWsjax7qfMkhnkJSUWfDtYD0lvBlmZM5G56IoWTD
 QMjVZ4HAOHARhVJlv/rPVUYivOJHn1JpCkqJrXVU+zv9JFJR6ICeX3ciXszKTW2SYf1/
 kZrV9qBWcFfF3iNFK6xk7j5y/gRle/lA7F7tnQZ3YhU+mc/alzabMS/b2gzlx1VbQr1G
 ARNxJ0svKHPSquZvAdW5B6sCKyUU2tt+knuZXoWRerafKrz/RtM3iVBbe7WNiPPa+i0d
 T8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787767989; x=1788372789;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4Ql5Ylx+NIsh1sezBqRcWzJvr43JL44lD8FsD/4QeSQ=;
 b=f5RQa+aHbxTj3uXqkQQrcH9YFlz2Du2sCFNmYks1daVwq95IF4FmNR1IzpXdI/Lx19
 oIfny+exRXXjGZDejcFX+Bc9416SBn/MgoNvH+UVN/EtZCSEON1N2lwaG+hkz5xstQHt
 mmjoa5rc1zi+oblKDXFUJrCpQjcfblV9dJB9eCy16S6nmKQ/xOJafj8xDKUFsnGL+Q/Z
 T/FJ8cUM7W1BS0bEHul5Kqm7FG1rVUQpl69/xWqND/5D7sJOryitofZCGGxl5GshD3co
 eLeAZVrZNp3MtJKebvfJ6mQeu61oOgpZpk06Psii+1g5AwVKoTQmPHjAjaVrWcXzgyMr
 8wPg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzUG0VSnicfKcarjQZE+EN1JwR4baZ7PB6104tMUTfz9lHM1e4AzdYq3X7ZTwDw5uUrzfTa/+wmlVw@nongnu.org
X-Gm-Message-State: AFuF++kZvwkHiIt0uPzX5hu0SlX0waaycs+GCC8DPX4uRkUYkjNAZVig
 v7EH8hXZbu3R3ZqzTyJ+aiPdzE/Gm68lrWZv9GU9dmKBdm2UzEl/3XoxC/3E7VX3zGE2Ysl751T
 KGv4yq8+Lhjk/k2jKZorTbAZjUWa+3VrG8t1f/9NZ8D5952LdWhDBUPjY5A==
X-Gm-Gg: AR+sD11McaS2aGcZmBCq6L4OWwTEVrYktWTOY2YWSWdr2AClOwSeBsoi4TAfS3gsVst
 sZHmY6AxvDqrZntxWB1o0RIcOq0ksmh7a13mYKIffh5wos6sdF+9fh0bNj9e6z0bOhaE1GHjEvr
 E7CETXuzEZ5X/Ooz+zs5ECi7HFQRrNzTzepRcC81Cz9Sm/v+67f865p+MVSaV0hrG+zuhP4toUm
 NdVRROdp4kt6a2xMmHNEty2xPYK+wJ3w/TzHb7MgP9hPYvr/rVyqP1EnDyLQoFsC6Uc3eTnYl6c
 5vkLqs/ZTRuAhBgfPX3ZYjTAqOVZ3BJFcQUS/JPDF03o8NSyQXOF9BzWxhzjy+3AyTeg/9IYofG
 lrbOxj3mmxbI+/zy7kvCQMjgHUAwDhNLuY4GHJHdpQqzhR0Gk3IZa00U+3PZBU4hCTFJF
X-Received: by 2002:a17:903:3810:b0:2ca:d91d:d3a7 with SMTP id
 d9443c01a7336-2d707aea3aamr172527465ad.10.1787767989287; 
 Wed, 26 Aug 2026 11:13:09 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2ca:d91d:d3a7 with SMTP id
 d9443c01a7336-2d707aea3aamr172526225ad.10.1787767988756; 
 Wed, 26 Aug 2026 11:13:08 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3283d63bb23sm10776870eec.7.2026.08.26.11.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 11:13:08 -0700 (PDT)
Message-ID: <0f3d8fe9-b3ad-40c5-9078-c13738997998@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:13:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] target-info: add -target and program-name selection
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <20260823150731.896-11-luoyonggang@gmail.com> <ao7gGVuiDcVZSN6v@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ao7gGVuiDcVZSN6v@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8f2cb6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=T6xLaqk5IrJfH2V9iLQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: emhQCNPLTAPDu8cNrYRiFVE4GHbhqOlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfX5bGWcjVdsBsP
 HIlZgDWf+yks767RjmoABGUXD6OAG3/SxFXepob6ooBI9CYZzgZimXSsNh20+oYut6hqwd41T0x
 ZG9P+JuMHWfHADSFuLVjC7ZKmCciYQ39MwJbWY5wmz4HqkYJtqlOvMq32n2AYKRxyO6VykWq90x
 +LKN74GJdC+0CH6deqgzPOUlnW7RyluQ0r1BwUyijhxVUZZOirJdsOJF26bhky9QE79x8U6iFNn
 CImCSnlf9pDIPRKr507H1k0TEHOHi4iC0BJplBRJbrXnr+E3ML1I4oAEPubamlQ0fChan6P+PI7
 279yXD15t8ESCRVoH6R5b9xFecPxFjTehwyzWtJtjea4ciUtibCZN4ndpAOAIWnnAfjMxheA55v
 F86ZTmPYKJgPD2bLuoy1goXAL8sEXdYvF5fLb63nJb3jDxm2/yANEe+0S+AiL1LjKRZwEfUWJ84
 Ve3bQYXS/qiyZHXLPQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfXzrDdhdP4e28Z
 Ar5l6KajKZWxtxbgNlj+ML3bJeUht+t7i7IoMzFiAlfA0oWBUzQEiILalBiPVbAW6k/w2k7xiYO
 uw3xtjplaxf8ulTxzPz2sGK9X2zPxLg=
X-Proofpoint-GUID: emhQCNPLTAPDu8cNrYRiFVE4GHbhqOlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 8/26/2026 5:46 AM, Daniel P. Berrangé wrote:
> On Sun, Aug 23, 2026 at 11:07:28PM +0800, Yonggang Luo wrote:
>> - Parse -target before TargetInfo is fixed; CLI overrides the program
>>   basename.
>> - Tokens are target_name or target_name-be / -le; -target help lists
>>   registered names in sorted order.
>> - When -target is omitted, infer the token from g_get_prgname(): strip
>>   .exe, take the longest dash-separated registered suffix, and retry
>>   without a trailing w for Windows GUI binaries.
>> - A basename that matches no registered token falls through to the
>>   unique default. Combined binaries with no suffix require -target
>>   when more than one default TargetInfo is registered.
> 
> IMHO this -target argument and the target interference from
> program name is a mistaken direction.  We're being led off
> course by the attempt to make the new qemu-system be identical
> to qemu-system-$TARGET.
>

Heterogeneous emulation has been discussed for a very long time in the
community. The main breakthrough that we (precisely Philippe and I) made
in 2025 was to offer a simple path towards it. The approach is as simple
as "let's put the code together and make sure it links", and it worked
incredibly well, bringing our attention to all the details we needed to
take care of one after another. No more, no less.

By implementing *strict* identical behavior with existing binaries, we
indeed didn't add any new feature, but:
- we reduced total number of compilation units by 30%
- we cleaned up a lot of headers and did a lot of refactoring
- we have a systematic approach to add new targets in single-binary
while being able to reuse all existing tests without any change.

From my point of view, what you see as a detour was precisely what made
us progress so far in a year.

> If we ignore historical compat and treat qemu-system as a
> clean break, then I'd suggest that 'target' is not a concept
> to be exposed to the user at all.
>

If your only problem is with having a new -target option, I would be
happy to just keep the behavior to derive the target from current binary
name. That's a very small compromise on my side, and -target is just
here for convenience. It's not the end of the path.

> The user cares about the machine (and CPUs) they want to run,
> and their choice in this respect is what should determine the
> target(s) QEMU needs to enable. We should take
> 
>   qemu-system --machine vexpress-a15
> 
> that tells us we need the arm target. If we need to distinguish
> arm7 vs aarch64, then the choice of -cpu should determine 32
> bs 64 bit.
> 
> This extends better into the future world where we have
> machine type that could involve CPUs from multiple targets.
> 
> IOW machine config option / QOM class is what we should pivot
> off rather than a global target config option.
> 
> This likely implies that the MachineClass should gain a class
> method to query the QEMU_ARCH_XXXX bitmask required. Initially
> restricted to only a single target, so you can wire that through
> to the current global target info at startup. Later expanded to
> support multiple concurrent targets.
>

While it sounds nice on paper, you will be doomed to ambiguity with this:

qemu-system -machine virt -cpu max

What is your next plan? add an environment variable to solve it?
Name aliases that require us to use gdb or -d qom_debug to know what is
really instantiated?

Deriving target from argv(0) or -target is explicit, predictable, boring
and reliable, and it's exactly what we need now.

There are other paths for heterogeneous, and I would ask you some
patience, so we can talk about it at/after KVM Forum 2026, where I'll
present a talk about Heterogeneous emulation and some of our exploratory
ideas on how to run this.

Meanwhile, let's all focus on having a boring/predictable single-binary
please, and then we can all have fun reinventing the wheel.

> With regards,
> Daniel

Regards,
Pierrick

