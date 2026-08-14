Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5C9C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 20:03:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuy7Y-0000c7-AE; Fri, 14 Aug 2026 16:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wuy7V-0000bK-Js
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:03:13 -0400
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wuy7T-0006lm-S5
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:03:13 -0400
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 255D5EC010B;
 Fri, 14 Aug 2026 16:03:11 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
 by phl-compute-04.internal (MEProxy); Fri, 14 Aug 2026 16:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1786737791; x=1786824191; bh=nUPqNr7BU11Ln7crEF/23H1MlX8gVsEB
 RVwroq5Whgo=; b=Q6xNiw79BdeIQxu4nJpY7nQumPJavTSWYiqLHHl5XO76WHFY
 KbZx85NBBP0UcnxhE7RggHR18Dk/fK3jVyvzomNQ2EVKtM0Tbu88ICKFBD3vOMcc
 RNGvgBKz8Q5w1pOpo2AC/Up/DuanpF76FsgMRWhhpBtPlPMSWlPDdjUUSSoi5jp3
 zqve3MUWYWU1AhHiaj29AmwloDR+acE2VNJC1HGvR/hcoPkEnzysOnbSIhxfgVAz
 1fMiu3LyAOtgG/iRBzOv8oskuOYPpqRbXbwSKsskuUYl6+uXsFotCrE1vX8Y9DA4
 CvhE0ls8Fycn3jM8SPsVTs/ZrKlHE0EKdEFE2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786737791; x=
 1786824191; bh=nUPqNr7BU11Ln7crEF/23H1MlX8gVsEBRVwroq5Whgo=; b=e
 lvPiWINnoYW4P0x+fAZH6aKOmI34yS0tTGgYb+ZnL3P65g1/Hxvb1yldy5D3/J7i
 PM9v/zDbTCzTK9b9fDFk6CWnzTEMi0Q2v+HjjwWct3Xp8tPxYdw/ycVxMwzLYumy
 eXRYr0tMDfYnxzxrLBKrfiU+BX9pZJH7SoS0V3ju1HegJJKZ97kka2KFFVCzkzbt
 Npv224RR82wWwLdn9PU54L71wY//o1oAmKt6doNTp8vzcvHdAy0N/jofKpGVMwN1
 hLDN2xeGWwerqnULhjyU76X1fX1kWiSQ0g9EdQeBJrACE0DSti8ErQV8efmrR0fq
 K/Hau3mTWWQvpBYYHX3qg==
X-ME-Sender: <xms:fnR_av5k1GJafQPrUZyhu0lPo2thlO21xArIVvZlGh2aRyVAeEEa3Q>
 <xme:fnR_avsH4iDM2xoVSmi2y7vl0SWNv-R7m2Lo_hupmfRPWax97IapDN9beHeIqdxvg
 CqqPGD0s_JsCka8b7h271HUy2OG3zu9uytKMgm7X2b8uMoPvwOITPs>
X-ME-Proxy-Cause: dmFkZTGmAxBX9dLDma77Thvhf6vpsVwdvWCXzkIQ0BqPP/7N3OjxargjchjQtt2NXLQW8F
 BoDqeg2pHwaxXMiTM0//zlQNbZP6aZO8qCRSeX4II2PRzf4wuyukGaoorQcj2zFix5A4Xg
 X4AAflH0rPNZ9KG6uG7obgu2FFRMF6QebxhAp/hEuBd9M1+nrYSEszdYXgGbid3P3+g7s0
 XJhMl7ZO6vAKYcWNuBt4eVpC+uFZjcTTo1d5r47aicMBDGN103xFhct5Y37N17Jmfj5n28
 R0hifGGMPWiAb5zbom4vCjn0E2FgPhruHlPgUqFnU6K2DPgY7JpLmpdlG3yRjJK6Z9XHaJ
 QagT0G7LSg5J/xvB9CuOb/2q6bN0mmj2exhFbonKbIuPNKZ+Jz+boiRObfZd08GaCWSd7j
 7yjQQtV/Ur84d/wkZ8sezTVFZnf462F5jpEY+DepifTB1/VPUdM6YeU2DjwEDTtPVijbDB
 YbpdxGB38OcBepRbkDtDwSlYOxSP6CXjzc6FJYj1VqxgNCuH1HniKHTe7Gpq+XcJ6WShsr
 RTOO4/YppaiYjJANTRo6zieQV8uJlu6cokbAhlnNuEtOhaFxMoJhk0p4HVJvEVCGHpv8qu
 qQlE2Mb2uV9MzCl9oXad0SphEGeWw0FfwRzKtJe51Vu1eMIHbu6Y9Df1enxA
X-ME-Proxy: <xmx:fnR_asYmHwl_udZBafudtk8EdViSpEsDTPwIF41TzyLhbYUMVOtm9w>
 <xmx:fnR_aj9NbckTuRTMcwRZXHYACkXTUkEj0XENqJvLOJgfTGOyxXGtzQ>
 <xmx:fnR_ara2qkIlFrSdOPlm7l7nS7XunoAkzluBtvSCZAyf2rS2JDQ_rg>
 <xmx:fnR_atdQFDdD80QZOZLFTatNBoHogczEem5CsbKIHT_GXpV_Q7j72Q>
 <xmx:f3R_au0uolcCLujnarD1AM6H0wgliLo3u-N-65v8CvgxMNFLUSGsHBkA>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id D1E9F2400098; Fri, 14 Aug 2026 16:03:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbA2t0igsNsw
Date: Sat, 15 Aug 2026 06:02:50 +1000
From: Alistair <alistair@alistair23.me>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>,
 "Joel Stanley" <joel@jms.id.au>, "Weiwei Li" <liwei1518@gmail.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>,
 "Chao Liu" <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org,
 "Max Chou" <max.chou@sifive.com>, "Michael Neuling" <mikey@neuling.org>
Message-Id: <36034205-c5ff-47a7-b7ce-210ef43b4371@app.fastmail.com>
In-Reply-To: <mhng-CD4B9E6C-F77D-4A7D-9118-A21A9776D3FA@Palmers-Mini.rwc.dabbelt.com>
References: <mhng-CD4B9E6C-F77D-4A7D-9118-A21A9776D3FA@Palmers-Mini.rwc.dabbelt.com>
Subject: Re: Regular QEMU RISC-V Call
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.144;
 envelope-from=alistair@alistair23.me; helo=fout-a1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

On Sat, 15 Aug 2026, at 6:01 AM, Palmer Dabbelt wrote:
> On Fri, 14 Aug 2026 13:00:04 PDT (-0700), alistair@alistair23.me wrote:
> > On Wed, 22 Jul 2026, at 5:02 AM, Daniel Henrique Barboza wrote:
> >>
> >>
> >> On 7/21/2026 3:37 PM, Alistair Francis wrote:
> >> > On 17/6/26 09:18, Alistair wrote:
> >> >> On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis wrote:
> >> >>> On 16/6/26 16:07, Joel Stanley wrote:
> >> >>>> On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
> >> >>>>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
> >> >>>
> >> >>> That means the meeting should start in a little less then 13 and a half
> >> >>> hours! I'll send out a Teams invite tomorrow
> >> >
> >> > Hey!
> >> >
> >> > I realised that it's now been a month. I leave for holidays in a few days, am currently recovering from some sickness and don't have any agenda items. So let's skip this month and start again in August
> >>
> >> In fact the meeting was yesterday according to the calendar invite Palmer sent
> >> :D figured that ppl forgot about it and I dropped the call after 10 minutes.
> >>
> >> If we're going to stick with Palmer's existing invite the next meeting will be
> >> August 18th 10AM UTC+10.
> >
> > My Teams meeting thing had the 17th of August.
> >
> > I only get back on the 17th, so let's do the Thursday the 17th at the same time.
> 
> I'm super lost now...

Thursday the 20th of August I meant

> 
> > So 2 days later then Palmers event. Does that work?
> >
> >>
> >> As an agenda for next call I have a couple of topics:
> >>
> >> - ongoing Debug related work.  Hopefully we'll have some Debug 0.13/1.0 patches
> >> under review by that date;
> >
> > I see them. Hopefully by then I can review them.
> >
> > Alistair
> >
> >> - there is a chance that common efforts led by ARM folks (single binary, multi accel ..)
> >> will spill in the RISC-V tree.  I'll talk with Phil and Pierrick later this week and see
> >> if there's something to do on our side.
> >>
> >>
> >> Cheers,
> >> Daniel
> >>
> >>
> >> >
> >> > Alistair
> >> >
> >> >>
> >> >> Call in details are below. Starting in 40 minutes!
> >> >>
> >> >> ________________________________________________________________________________
> >> >> Microsoft Teams meeting
> >> >>
> >> >> Join:
> >> >> https://teams.microsoft.com/meet/275503449279724?p=C2D0EDrqxwFb5LuRnB
> >> >>
> >> >> Meeting ID:
> >> >> 275 503 449 279 724
> >> >>
> >> >> Passcode:
> >> >> kS9Vg23i
> >> >>
> >> >> ________________________________________
> >> >> Need
> >> >>   help? |
> >> >> System reference
> >> >> Dial in by phone
> >> >>
> >> >> +1
> >> >>   408-627-4258,,498330396#
> >> >> United States, San Jose
> >> >> Find
> >> >>   a local number
> >> >> Phone conference ID:
> >> >> 498 330 396#
> >> >>
> >> >> Join on a video conferencing device
> >> >>
> >> >> Tenant key:
> >> >> wdc@m.webex.com
> >> >>
> >> >> Video ID:
> >> >> 119 833 426 2
> >> >>
> >> >> More
> >> >>   info
> >> >> For organizers:
> >> >> Meeting
> >> >>   options |
> >> >> Reset dial-in PIN
> >> >>
> >> >> ________________________________________________________________________________
> >> >>
> >> >>>
> >> >>>>
> >> >>>> I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
> >> >>>>
> >> >>>>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
> >> >>>>
> >> >>>> Two agenda items:
> >> >>>>
> >> >>>> * RISC-V Code Policy
> >> >>>>
> >> >>>> https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
> >> >>>>
> >> >>>> Good idea writing down your expectations somewhere everyone can see.
> >> >>>> Do you want to raise it as a topic and we can talk it through?
> >> >>>
> >> >>> Yep!
> >> >>>
> >> >>>>
> >> >>>> * Machine model use cases
> >> >>>>
> >> >>>> I wanted to share my perspective on the system emulator machines, what
> >> >>>> they are for, who they are for, and hear what others had to say.
> >> >>>
> >> >>> Sounds good as well
> >> >>>
> >> >>> Alistair
> >> >>>
> >> >>>>
> >> >>>> See you on the call tomorrow.
> >> >>>>
> >> >>>> Cheers,
> >> >>>>
> >> >>>> Joel
> >> >>>
> >> >>>
> >> >
> >>
> >>
> 

