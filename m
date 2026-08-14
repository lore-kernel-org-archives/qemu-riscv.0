Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850C3C5B572
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 20:06:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuyAU-0001Dx-S2; Fri, 14 Aug 2026 16:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1wuyAT-0001Dl-4E
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:06:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1wuyAR-00087X-8w
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:06:16 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-84a2c90e383so2057422b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1786737973; x=1787342773;
 darn=nongnu.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:to
 :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=xK2gcTTvRshzJG0evuI67zmi6/n2jJU4xXmoMq60lLw=;
 b=qwaPnx+IQ5C0dCY7YLnvFxJtqRUtkrM9zH1N8uzdrDOJofchAW7zDGLbXjj2A1AnUh
 pPBCl2PKmhMsnznnHzKnt8u0V4oXYXvqscQ54eskuoSbOr6OXRl7iFmHAQvIPj3tKc1d
 b+RMQLES3FOXojsBNrAEfTkVmyyBOiOEGlaPgi74Dy1EbiyecyCFdVd391CTCs4gD84w
 DkQYDWSFMfKXzyGucOLCV4zjgX1qXEvmolJhXWTCNSuCa6J4CZtqf56bzKPPXzMfKoYZ
 LcBrQyFJidR4knrekYDxpZnnLu85hCVBLqHvSkYJFvtkYOrw1LQRry1/NW40lawQgchK
 T1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786737973; x=1787342773;
 h=content-transfer-encoding:content-type:mime-version:message-id:to
 :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=xK2gcTTvRshzJG0evuI67zmi6/n2jJU4xXmoMq60lLw=;
 b=b+Z/eYTxvEd8QAoFNBCvZLVw52YBI8ApZwzHsgYn2hXMOv+erI+pvH5iZ/sleCzVbJ
 sZLxuwDpxtKKZevw0kr2rtRbo1tLBEy+B9rWWfXiweENg2aZGG09PT/VyLrvIt2+v7ny
 F0ngOivuyg7esV6vyU+m/Zcrj6J53sorHP0/ZyltB/KkY+Vrxq1FSDGwd9Z0fq+EaGyM
 qVd4Knm3AZeAPgwfvuqJZuAMJe9TGJCal3uJ9wXjqaAH1ywIgVfETB2OfvMJzyGxuvCb
 XwB8H9XYpBmMGCFn+wsn+mrT3qAemwL8JXfOwPMgeJhIu5uQZymVugtVJXZHJw91vUg5
 W7mw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoTevL+GzOWBsigDZDYIPcdCqJKq6nzDF4uOgTdsoKM0y3MM4/nWgWa09lcbVySKYMiMezOwbYr9Cjo@nongnu.org
X-Gm-Message-State: AOJu0YzyYWgBjFw1PRBiJm8X4YW3mMjFbIT58t5roKq0AGCQX2Nkl+oB
 wA83rCjSwZnvmICFlE2ay7Dmn2+1L1gTSCKl1UBEbPVUPx+xT8Lmo44ohqGHaHNtQsw=
X-Gm-Gg: AR+sD13wfpqXl//0VWbRTZRaYrnBCQRV6O5VZvcOv6f1zzYBX5QHR1MX2c5hLVKUOVT
 eRqoKGNdHOj3qSKDDNbVBz7e9GO/fXggvAkn0vBI8l8bADm4peZb9kuLsPsF7u53HIUfO6X/tqV
 /gexo0Y4b5abbU83Y+2r5XfQPrDuWpAx7qtVg3DLs+OxEYbbqncQXeYuNTH6a3TvUnw14klRxww
 E0dReCCeHHe6qBAYpLAdOqCgAOnT7dTcXPvms2fYCI2aXtP5+4oDx5fQeSUzGkXzqYWsnOfHvLz
 iE3I85hxJyv0dq/DllamMJ1NzuBSz9BpIW0cMaEWihKJjHBKi6wuCBCh1W6kD6JRceFJsbuspUP
 6q9LCpP3lZIb0w6RIYVfTerB+DEOHxoKQqKWTaEjE75GCTQ2NudVWaedtRU5ByvtjhWDTGlbznx
 CaFHB0LZoKP2P8FMMs26TJLgvgGVObzmH4crnCsLZ8oqPBPUufHuwwpYaRxlroxORDDOvC+AH6l
 g==
X-Received: by 2002:a17:90b:4d90:b0:38e:c1ba:4f94 with SMTP id
 98e67ed59e1d1-3931f44ddfemr12522440a91.2.1786737973172; 
 Fri, 14 Aug 2026 13:06:13 -0700 (PDT)
Received: from localhost ([192.184.165.199]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-141387c6f95sm16203416c88.6.2026.08.14.13.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 13:06:12 -0700 (PDT)
Date: Fri, 14 Aug 2026 13:06:12 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2026 13:06:11 PDT (-0700)
Subject: Re: Regular QEMU RISC-V Call
In-Reply-To: <36034205-c5ff-47a7-b7ce-210ef43b4371@app.fastmail.com>
CC: daniel.barboza@oss.qualcomm.com, joel@jms.id.au, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org,
 max.chou@sifive.com, mikey@neuling.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair@alistair23.me
Message-ID: <mhng-CF09685E-EE91-415D-BA66-874115494267@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 14 Aug 2026 13:02:50 PDT (-0700), alistair@alistair23.me wrote:
> On Sat, 15 Aug 2026, at 6:01 AM, Palmer Dabbelt wrote:
>> On Fri, 14 Aug 2026 13:00:04 PDT (-0700), alistair@alistair23.me wrote:
>> > On Wed, 22 Jul 2026, at 5:02 AM, Daniel Henrique Barboza wrote:
>> >>
>> >>
>> >> On 7/21/2026 3:37 PM, Alistair Francis wrote:
>> >> > On 17/6/26 09:18, Alistair wrote:
>> >> >> On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis wrote:
>> >> >>> On 16/6/26 16:07, Joel Stanley wrote:
>> >> >>>> On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
>> >> >>>>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
>> >> >>>
>> >> >>> That means the meeting should start in a little less then 13 and a half
>> >> >>> hours! I'll send out a Teams invite tomorrow
>> >> >
>> >> > Hey!
>> >> >
>> >> > I realised that it's now been a month. I leave for holidays in a few days, am currently recovering from some sickness and don't have any agenda items. So let's skip this month and start again in August
>> >>
>> >> In fact the meeting was yesterday according to the calendar invite Palmer sent
>> >> :D figured that ppl forgot about it and I dropped the call after 10 minutes.
>> >>
>> >> If we're going to stick with Palmer's existing invite the next meeting will be
>> >> August 18th 10AM UTC+10.
>> >
>> > My Teams meeting thing had the 17th of August.
>> >
>> > I only get back on the 17th, so let's do the Thursday the 17th at the same time.
>>
>> I'm super lost now...
>
> Thursday the 20th of August I meant

OK, I've attempted to update my calendar and maybe you guys will see 
that ;)

>
>>
>> > So 2 days later then Palmers event. Does that work?
>> >
>> >>
>> >> As an agenda for next call I have a couple of topics:
>> >>
>> >> - ongoing Debug related work.  Hopefully we'll have some Debug 0.13/1.0 patches
>> >> under review by that date;
>> >
>> > I see them. Hopefully by then I can review them.
>> >
>> > Alistair
>> >
>> >> - there is a chance that common efforts led by ARM folks (single binary, multi accel ..)
>> >> will spill in the RISC-V tree.  I'll talk with Phil and Pierrick later this week and see
>> >> if there's something to do on our side.
>> >>
>> >>
>> >> Cheers,
>> >> Daniel
>> >>
>> >>
>> >> >
>> >> > Alistair
>> >> >
>> >> >>
>> >> >> Call in details are below. Starting in 40 minutes!
>> >> >>
>> >> >> ________________________________________________________________________________
>> >> >> Microsoft Teams meeting
>> >> >>
>> >> >> Join:
>> >> >> https://teams.microsoft.com/meet/275503449279724?p=C2D0EDrqxwFb5LuRnB
>> >> >>
>> >> >> Meeting ID:
>> >> >> 275 503 449 279 724
>> >> >>
>> >> >> Passcode:
>> >> >> kS9Vg23i
>> >> >>
>> >> >> ________________________________________
>> >> >> Need
>> >> >>   help? |
>> >> >> System reference
>> >> >> Dial in by phone
>> >> >>
>> >> >> +1
>> >> >>   408-627-4258,,498330396#
>> >> >> United States, San Jose
>> >> >> Find
>> >> >>   a local number
>> >> >> Phone conference ID:
>> >> >> 498 330 396#
>> >> >>
>> >> >> Join on a video conferencing device
>> >> >>
>> >> >> Tenant key:
>> >> >> wdc@m.webex.com
>> >> >>
>> >> >> Video ID:
>> >> >> 119 833 426 2
>> >> >>
>> >> >> More
>> >> >>   info
>> >> >> For organizers:
>> >> >> Meeting
>> >> >>   options |
>> >> >> Reset dial-in PIN
>> >> >>
>> >> >> ________________________________________________________________________________
>> >> >>
>> >> >>>
>> >> >>>>
>> >> >>>> I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
>> >> >>>>
>> >> >>>>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
>> >> >>>>
>> >> >>>> Two agenda items:
>> >> >>>>
>> >> >>>> * RISC-V Code Policy
>> >> >>>>
>> >> >>>> https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
>> >> >>>>
>> >> >>>> Good idea writing down your expectations somewhere everyone can see.
>> >> >>>> Do you want to raise it as a topic and we can talk it through?
>> >> >>>
>> >> >>> Yep!
>> >> >>>
>> >> >>>>
>> >> >>>> * Machine model use cases
>> >> >>>>
>> >> >>>> I wanted to share my perspective on the system emulator machines, what
>> >> >>>> they are for, who they are for, and hear what others had to say.
>> >> >>>
>> >> >>> Sounds good as well
>> >> >>>
>> >> >>> Alistair
>> >> >>>
>> >> >>>>
>> >> >>>> See you on the call tomorrow.
>> >> >>>>
>> >> >>>> Cheers,
>> >> >>>>
>> >> >>>> Joel
>> >> >>>
>> >> >>>
>> >> >
>> >>
>> >>
>>

