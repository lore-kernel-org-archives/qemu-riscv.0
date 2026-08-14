Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A40BC5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 20:21:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuyOr-0001Co-GV; Fri, 14 Aug 2026 16:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wuyOm-0000z8-I6
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:21:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wuyOk-0004Uu-1s
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:21:04 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67EJgqdQ2250655
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 20:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9EGGwzivmqDbPvMw4r62MH2aOXoE6VihXPV4oI1X00U=; b=frCfgGGl34YqtKdo
 mjLhADstcfzxFcnu7Yictn9MKi42FcklQHuxlUyd/nvgKShb9DpjUbgqkHozuPq5
 44WX4gEyOo9QOuiYFea92Q+sPiXb4abVm0nWfErxqkaQqkHq4+aaibfNN8sIZR1U
 V3Ocum+z8Mfah7s/2oqPnV+4CajYYUnb1B18rY1dQBlkjhbruaiI9iUi0FCsdzqb
 iO8oPj5kkjWvlK84WX/xKaCbvRah1OX86xlIg4AWHaOvdIQ/k9mE8SeGXTUqEbfT
 moQWTO20t+w6NeK5N1syHY4qNLI4r3SHfAjqDUICRAwhLVWBSBGwWAUt6G1IdP+j
 cT4uMg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g26450yav-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 20:20:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8efad04d884so24236186d6.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786738857; x=1787343657; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9EGGwzivmqDbPvMw4r62MH2aOXoE6VihXPV4oI1X00U=;
 b=gEycJXR9Ujfb6DWB4U65kyqbd6JPvpHzzMvmlbaMEd4KzJ0xTPj40CumtKON4bpmfr
 F7UvpigUzSiIJYZs8J4sV2gHYBOI+FK0d5OdbkIE8De9HDhlyB7iIb91acL4H1xoU/DV
 LYPCt6n9SF4T+gbjcc9aFJdtuQju3Kh9sSIR2fKZuvr7xC0g9NKnppQhHYW5TOVT6/55
 vhdjVcqwIcC/a40UGtMYZH5IKJb6c/61WLBMYZI+Enkl4pHbf5QisI2OvHJoCBCwVd0R
 ux6JeU2CAJaygS2ojxF5QrkTw0A16MWiT3brq++SIf2BgEFRkV9yq6fTkTllsMyRbt+3
 aGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786738857; x=1787343657;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9EGGwzivmqDbPvMw4r62MH2aOXoE6VihXPV4oI1X00U=;
 b=opdGy2zdGody4VBNPNRqMcacgqfbleLQN181Kjk57/mKhWC26H4xRxbUlz1T2B7VsS
 l1X9UoD0QdH0gNYTmPjUsF7Xwo1nua1uIXu0tvETqIH7RW3nSms342lUzGTs8CrSNPJA
 GLJIaUTpgQjk9qkyvqm2Nw1NMlO+1+prckbyb2eQthHTpf5UoG1nnMVrHw+2duSunfD8
 4PaoEnDCuCwTS5OmqnLxwDoV0mabxg9yL0nfikpA8cRSZvLJEq/RQnqI2c7dW3Gl+Oi6
 tc8EB9miHEU2qWtvjzv14VYmeKsOBfs3AcumVNUWIk2Cj8dT0B3Djmi1WmbL2z1bM8iS
 qUPg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/vYnMJUCcz6IKjVVkrSFcUgs2U5/H3AaYf4i6tWuAuJDD1UJYdT374Ovo/rYhijqmQaQrIMqs6AfS@nongnu.org
X-Gm-Message-State: AOJu0Yy6YkkShetTAkVpkx+IvI/cjiSeMquEp60GoI0dlL8UEi6gyjyK
 CYqXNd0vpAw/CGOfMbw8Nn3jbuk8+1d9z0FklT1GQ53b6hg8p5/RuUdw4DKXvqAlIEN6HtRBp51
 CN19Jse/vgPCvVGQfIb/PU6e58PFDATX4ouifguWnkAiTvoNfcDEPopceIg==
X-Gm-Gg: AR+sD11jskDq2ZPFWjosklydo+/DqXAvH1WPH5/YqORI8+Mbcpkr7VzQdJQsddLMb+/
 UXIT9Jm8M0N0l/xWb/T1la6Z2/B1WF/qjF0KseQP3LtP8hCmfUr2UQC7cRrspUibcsSx1bXxTDO
 o1sDACIqKd9DNk2DXH7Vb1UI/yUYZmhYdG3nSYlZh8ptdJsesdwdotlgR1g3rrzFJCp6hH+agpI
 chIA+fIsKwZ2TMVduFOLyPjMTW233L1rzj3qyQKNXA/wIhirGDTV6o1BBsBdD9ltooHjOkFxEIh
 RrMzpk7e3hzVDy9gCD5M0MNopfUerZjcBRCAlRkyjHzlulCzmbZelqVT02d7XEgexTwieyZwnyo
 ZMY9IiPUSMLtIY1U+IJ+JjtrWL4n5Ja/cDgYH
X-Received: by 2002:a05:6214:3292:b0:8ec:cdb2:5e11 with SMTP id
 6a1803df08f44-90a91c90429mr99911396d6.2.1786738856747; 
 Fri, 14 Aug 2026 13:20:56 -0700 (PDT)
X-Received: by 2002:a05:6214:3292:b0:8ec:cdb2:5e11 with SMTP id
 6a1803df08f44-90a91c90429mr99910806d6.2.1786738856278; 
 Fri, 14 Aug 2026 13:20:56 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a921e6f51sm27082426d6.8.2026.08.14.13.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 13:20:55 -0700 (PDT)
Message-ID: <55a04a68-4659-4431-be27-a3621e44be23@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 17:20:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regular QEMU RISC-V Call
To: Palmer Dabbelt <palmer@dabbelt.com>, alistair@alistair23.me
Cc: joel@jms.id.au, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org, max.chou@sifive.com,
 mikey@neuling.org
References: <mhng-CF09685E-EE91-415D-BA66-874115494267@Palmers-Mini.rwc.dabbelt.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <mhng-CF09685E-EE91-415D-BA66-874115494267@Palmers-Mini.rwc.dabbelt.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U-8TDKVC8NUTT28tyTvZ4P8y1GaJdbsT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE1NSBTYWx0ZWRfX2vEjpRptyTl5
 1YOuENQ/l5K8Nw3Ya+P9JeGQOji54kape7MQEkdiJHd89xP1OJxX8VqZARWcqAJ3VnwqoxZe5Pd
 Q7XfwwVVCaT1VKwKgJFdRiul0U0B6Nk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE1NSBTYWx0ZWRfX0lalMsWt6yNh
 0bN1QfmHxWcJExWPBYF1N17Dhsk/nNmb3LIse9g+MyDqxUxYOsrwkRpCb+7s4lzP0nEsUerHo6q
 grMXE4tz3pCHCH4GOxcfuNo4kLElMlD6T3JPvTkAKqeHpPh0p/mLQp4y19nNgGjVEQprW4ARDhX
 bmGOt1KTi9Vr1R3v5zD16yGcOyWBo7hvbybwiHThJQyJLvJU9WRGXvKHITdXt5dTo88KReC9+vz
 kpCRRcxA20j4sbpV3sHPOlMgKLXJOcJmkuchZIX5Hyx7f6Bw7sdXriUY4xr4qMG9VemI8Zj+c3W
 uXvXssGuuiZHIUdO648j2AzJ39nsfo9DGSQAM0pHTZcLuib3qQbH1hKqtZBw/EMElbP8t047z9I
 jQF9WAYKgAMj88QluyxjBXNTkrMh3ghwEXDMp55Bn7X1zzmakxL0kbnBmQhPXr9lZgQtVO0t77K
 8BgV8NPbf1T0rmMELQQ==
X-Proofpoint-ORIG-GUID: U-8TDKVC8NUTT28tyTvZ4P8y1GaJdbsT
X-Authority-Analysis: v=2.4 cv=OamoyBTY c=1 sm=1 tr=0 ts=6a7f78a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=yMhMjlubAAAA:8 a=VwQbUJbxAAAA:8 a=NojvYFcnAAAA:8 a=F_3bKxq2DUFRWEdKJrsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=D5talKjwNa0n2BCLPXqP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140155
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 8/14/2026 5:06 PM, Palmer Dabbelt wrote:
> On Fri, 14 Aug 2026 13:02:50 PDT (-0700), alistair@alistair23.me wrote:
>> On Sat, 15 Aug 2026, at 6:01 AM, Palmer Dabbelt wrote:
>>> On Fri, 14 Aug 2026 13:00:04 PDT (-0700), alistair@alistair23.me wrote:
>>> > On Wed, 22 Jul 2026, at 5:02 AM, Daniel Henrique Barboza wrote:
>>> >>
>>> >>
>>> >> On 7/21/2026 3:37 PM, Alistair Francis wrote:
>>> >> > On 17/6/26 09:18, Alistair wrote:
>>> >> >> On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis wrote:
>>> >> >>> On 16/6/26 16:07, Joel Stanley wrote:
>>> >> >>>> On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
>>> >> >>>>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
>>> >> >>>
>>> >> >>> That means the meeting should start in a little less then 13 and a half
>>> >> >>> hours! I'll send out a Teams invite tomorrow
>>> >> >
>>> >> > Hey!
>>> >> >
>>> >> > I realised that it's now been a month. I leave for holidays in a few days, am currently recovering from some sickness and don't have any agenda items. So let's skip this month and start again in August
>>> >>
>>> >> In fact the meeting was yesterday according to the calendar invite Palmer sent
>>> >> :D figured that ppl forgot about it and I dropped the call after 10 minutes.
>>> >>
>>> >> If we're going to stick with Palmer's existing invite the next meeting will be
>>> >> August 18th 10AM UTC+10.
>>> >
>>> > My Teams meeting thing had the 17th of August.
>>> >
>>> > I only get back on the 17th, so let's do the Thursday the 17th at the same time.
>>>
>>> I'm super lost now...
>>
>> Thursday the 20th of August I meant
> 
> OK, I've attempted to update my calendar and maybe you guys will see that ;)

It worked for me. Thx Palmer!

> 
>>
>>>
>>> > So 2 days later then Palmers event. Does that work?
>>> >
>>> >>
>>> >> As an agenda for next call I have a couple of topics:
>>> >>
>>> >> - ongoing Debug related work.  Hopefully we'll have some Debug 0.13/1.0 patches
>>> >> under review by that date;
>>> >
>>> > I see them. Hopefully by then I can review them.
>>> >
>>> > Alistair
>>> >
>>> >> - there is a chance that common efforts led by ARM folks (single binary, multi accel ..)
>>> >> will spill in the RISC-V tree.  I'll talk with Phil and Pierrick later this week and see
>>> >> if there's something to do on our side.
>>> >>
>>> >>
>>> >> Cheers,
>>> >> Daniel
>>> >>
>>> >>
>>> >> >
>>> >> > Alistair
>>> >> >
>>> >> >>
>>> >> >> Call in details are below. Starting in 40 minutes!
>>> >> >>
>>> >> >> ________________________________________________________________________________
>>> >> >> Microsoft Teams meeting
>>> >> >>
>>> >> >> Join:
>>> >> >> https://teams.microsoft.com/meet/275503449279724?p=C2D0EDrqxwFb5LuRnB
>>> >> >>
>>> >> >> Meeting ID:
>>> >> >> 275 503 449 279 724
>>> >> >>
>>> >> >> Passcode:
>>> >> >> kS9Vg23i
>>> >> >>
>>> >> >> ________________________________________
>>> >> >> Need
>>> >> >>   help? |
>>> >> >> System reference
>>> >> >> Dial in by phone
>>> >> >>
>>> >> >> +1
>>> >> >>   408-627-4258,,498330396#
>>> >> >> United States, San Jose
>>> >> >> Find
>>> >> >>   a local number
>>> >> >> Phone conference ID:
>>> >> >> 498 330 396#
>>> >> >>
>>> >> >> Join on a video conferencing device
>>> >> >>
>>> >> >> Tenant key:
>>> >> >> wdc@m.webex.com
>>> >> >>
>>> >> >> Video ID:
>>> >> >> 119 833 426 2
>>> >> >>
>>> >> >> More
>>> >> >>   info
>>> >> >> For organizers:
>>> >> >> Meeting
>>> >> >>   options |
>>> >> >> Reset dial-in PIN
>>> >> >>
>>> >> >> ________________________________________________________________________________
>>> >> >>
>>> >> >>>
>>> >> >>>>
>>> >> >>>> I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
>>> >> >>>>
>>> >> >>>>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
>>> >> >>>>
>>> >> >>>> Two agenda items:
>>> >> >>>>
>>> >> >>>> * RISC-V Code Policy
>>> >> >>>>
>>> >> >>>> https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
>>> >> >>>>
>>> >> >>>> Good idea writing down your expectations somewhere everyone can see.
>>> >> >>>> Do you want to raise it as a topic and we can talk it through?
>>> >> >>>
>>> >> >>> Yep!
>>> >> >>>
>>> >> >>>>
>>> >> >>>> * Machine model use cases
>>> >> >>>>
>>> >> >>>> I wanted to share my perspective on the system emulator machines, what
>>> >> >>>> they are for, who they are for, and hear what others had to say.
>>> >> >>>
>>> >> >>> Sounds good as well
>>> >> >>>
>>> >> >>> Alistair
>>> >> >>>
>>> >> >>>>
>>> >> >>>> See you on the call tomorrow.
>>> >> >>>>
>>> >> >>>> Cheers,
>>> >> >>>>
>>> >> >>>> Joel
>>> >> >>>
>>> >> >>>
>>> >> >
>>> >>
>>> >>
>>>


