Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB95C5B572
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 20:00:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuy51-0008NU-3W; Fri, 14 Aug 2026 16:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wuy4q-0008Jt-Ol
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:00:29 -0400
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wuy4o-0005tM-MR
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:00:28 -0400
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B1D9214000DB;
 Fri, 14 Aug 2026 16:00:25 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
 by phl-compute-04.internal (MEProxy); Fri, 14 Aug 2026 16:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1786737625; x=1786824025; bh=yaC14BGXD4vQWkPG/M5T4oHI+wm/H9j8
 ko/7a/ICsPs=; b=aFzOhzHOcGL5J2H6F4dl05Oyt8KWdFhME2vbdmalGacm/m6s
 WZ7rtkqD0+hVQPwdsaEtHL2lgRrnkJm5WU52Wf4toGU2Z/hQ+GmbxWJVC58FhUF8
 cMY0YD0g6ExLp1xVmLNBtr2h7YE/4PNDdVqkTXC4FZxX7kFy9Z0oQF3bXuIrVmco
 ZtaagqzGah4Py0CdsjMeGX+4y3Z3AGdRdD4Gq45oJdwgc70+L3GAfn50E7YRo3B/
 IFZfEtizIcAfaO0P2B87FxR8yXpFw414gFtUTqNbNtk8ceB2VcAiyf7TvEoqjyA0
 fGmvv5TGrPjF/jjhKWcGg8BJ1kqO94k6ldZhIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786737625; x=
 1786824025; bh=yaC14BGXD4vQWkPG/M5T4oHI+wm/H9j8ko/7a/ICsPs=; b=H
 fQXUz+AQsR72Zt4P4vkqO04wqFZlu082xadctXr4fz/qUFlxEw5p/TDQvYBjS5OK
 GjLUM9OAWcFxuJq20wzoemapD/CCufoNIcZgvwGOXl0TAUEG/Hr2T3RtGAr9ZY33
 ANx+wLRBJFwsuAKKwgc8nSUjrbHYP0lj4kz4MLn9qi/bwal6Vem8BatSzcFoGQX5
 3tBKh7pSW8IaFG97s5zaPQq0nyZBWtnkh6TJ4k0oY3M5fgqepineJCTNhhs2IEO4
 OD08W2gYfknUPxoHHFHU2Q0cdSqFhFlfG6B7U5C1xUxWVNlT11wYzXTxGI9Y44sU
 l6vY9H2GsFnMN8gQ4iPgA==
X-ME-Sender: <xms:2HN_auh_F3LaBgWzeCVllNQEptyHSUrYIFWlZfCChTXQet3OHWLLAA>
 <xme:2HN_ap25WqZNmFS9X-xqsm0mfcHl0LV8Po9AnMmW82KLN_dZQuwwlNe32X8onJjlP
 5Za5-R1b4JsK_Ly-r9peiOleWAcIfZhBizRfPHxMPr0QdsgXEOkVA>
X-ME-Proxy-Cause: dmFkZTGl5LfF/yVBchoiqABTAiXeCindbFiMofX3XS4fdkROMozYJ+P08vaKrd2B3lhkdH
 B0ufIgsUweWjSMISxaFtrbx0Shgfun1qX7bIwW/EQVUn/fuIYMHsyjUPi2RURMZQ432VDH
 LdbtkP5XOXTlUB+rJ840xX/y4gf/w2R/ekiTA6GtpGJZ5Wz4kb5eaH33xeLknRQuIHAhSh
 tfnSl/MGLT/oPiwkKGb4uqryKbE3K4air/EEhB6u+INA4I37kyRwethX1C6CPn51PNbKwn
 GrRx9JVEMR7RTeGnVlgU2KiUbfpUI6ALp1HdtfL7VhDipO9mKvxkQdYAxxqGe1tbHljTfj
 gNcQiucPZ40JzRO0+W+yfYP6bGImaMsVVENhquqRDWJBYbxl822SOUQAZbpV9shk1I3EBn
 DoqTKYcPQOLxB3RauT9UaFkfPmP1v4jVJMcFiNv4H++v0kMVj8exW8BpdPWDyJS6Z15nPr
 HajZ/1jeh+C94t8wsRol8lRJiEFO566o/P2OC6Eqoyl+NYqjqbrmWtx2MLPb4MH9iEbz2k
 F7B3999C8ldHZmcghQbkOyp3v3peUrTgh/YrO5mbnoKdKwt2ACKLb9SD2fyhHS8vaknqWr
 6hhVSOiSLIpea0cvWiJtZF3XFRwniCM9RdU2S/j5VAqYcXMd+2/4dOhAi32Q
X-ME-Proxy: <xmx:2HN_aiCzg_UFdUi4AwzcWJYcyseumjo9fAGDL2TwpwjLi681YF-lpw>
 <xmx:2HN_apHrTTUXOv6vBV-_XF2ta_Mie4DboaCmQaWxG1JCtGDmh94nOA>
 <xmx:2HN_aqDLIw8y967yUnA-zAmM-C8knt1McNDDIYW3HTotdlZuxaG74Q>
 <xmx:2HN_anl0JEOCxiU0KCaUGfsUmlGsQDRSKp4EreMadf-g-FG1xhZk-A>
 <xmx:2XN_akfEw0phuYtk0-kNjHmSjk8b-Kdfk71_w5cHcGhHjnULIqLpgEKf>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 7B2AC240009B; Fri, 14 Aug 2026 16:00:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbA2t0igsNsw
Date: Fri, 14 Aug 2026 16:00:04 -0400
From: Alistair <alistair@alistair23.me>
To: "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>,
 "Joel Stanley" <joel@jms.id.au>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Weiwei Li" <liwei1518@gmail.com>, 
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>,
 "Chao Liu" <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org,
 "Max Chou" <max.chou@sifive.com>, "Michael Neuling" <mikey@neuling.org>
Message-Id: <da7e0e41-50d0-4fbf-a733-567a563f2692@app.fastmail.com>
In-Reply-To: <7c85ba9f-a9ef-4880-9905-61f6397c23b4@oss.qualcomm.com>
References: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
 <CACPK8Xe9JVggXzX9kku-zm7RYzM++fqcr=fx-MdkKiViHdiMYw@mail.gmail.com>
 <ad259828-65b3-4c4a-bf3f-73cc195c19f5@alistair23.me>
 <68917b26-32a2-49e6-94ea-1ca587948f23@app.fastmail.com>
 <e282de71-5390-41d8-8a8d-6156aae01079@alistair23.me>
 <7c85ba9f-a9ef-4880-9905-61f6397c23b4@oss.qualcomm.com>
Subject: Re: Regular QEMU RISC-V Call
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.153;
 envelope-from=alistair@alistair23.me; helo=fhigh-a2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Wed, 22 Jul 2026, at 5:02 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 7/21/2026 3:37 PM, Alistair Francis wrote:
> > On 17/6/26 09:18, Alistair wrote:
> >> On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis wrote:
> >>> On 16/6/26 16:07, Joel Stanley wrote:
> >>>> On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
> >>>>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
> >>>
> >>> That means the meeting should start in a little less then 13 and a half
> >>> hours! I'll send out a Teams invite tomorrow
> > 
> > Hey!
> > 
> > I realised that it's now been a month. I leave for holidays in a few days, am currently recovering from some sickness and don't have any agenda items. So let's skip this month and start again in August
> 
> In fact the meeting was yesterday according to the calendar invite Palmer sent
> :D figured that ppl forgot about it and I dropped the call after 10 minutes.
> 
> If we're going to stick with Palmer's existing invite the next meeting will be
> August 18th 10AM UTC+10.

My Teams meeting thing had the 17th of August.

I only get back on the 17th, so let's do the Thursday the 17th at the same time.

So 2 days later then Palmers event. Does that work?

> 
> As an agenda for next call I have a couple of topics:
> 
> - ongoing Debug related work.  Hopefully we'll have some Debug 0.13/1.0 patches
> under review by that date;

I see them. Hopefully by then I can review them.

Alistair

> - there is a chance that common efforts led by ARM folks (single binary, multi accel ..)
> will spill in the RISC-V tree.  I'll talk with Phil and Pierrick later this week and see
> if there's something to do on our side.
> 
> 
> Cheers,
> Daniel
> 
> 
> > 
> > Alistair
> > 
> >>
> >> Call in details are below. Starting in 40 minutes!
> >>
> >> ________________________________________________________________________________
> >> Microsoft Teams meeting
> >>
> >> Join:
> >> https://teams.microsoft.com/meet/275503449279724?p=C2D0EDrqxwFb5LuRnB
> >>
> >> Meeting ID:
> >> 275 503 449 279 724
> >>
> >> Passcode:
> >> kS9Vg23i
> >>
> >> ________________________________________
> >> Need
> >>   help? |
> >> System reference
> >> Dial in by phone
> >>
> >> +1
> >>   408-627-4258,,498330396#
> >> United States, San Jose
> >> Find
> >>   a local number
> >> Phone conference ID:
> >> 498 330 396#
> >>
> >> Join on a video conferencing device
> >>
> >> Tenant key:
> >> wdc@m.webex.com
> >>
> >> Video ID:
> >> 119 833 426 2
> >>
> >> More
> >>   info
> >> For organizers:
> >> Meeting
> >>   options |
> >> Reset dial-in PIN
> >>
> >> ________________________________________________________________________________
> >>
> >>>
> >>>>
> >>>> I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
> >>>>
> >>>>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
> >>>>
> >>>> Two agenda items:
> >>>>
> >>>> * RISC-V Code Policy
> >>>>
> >>>> https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
> >>>>
> >>>> Good idea writing down your expectations somewhere everyone can see.
> >>>> Do you want to raise it as a topic and we can talk it through?
> >>>
> >>> Yep!
> >>>
> >>>>
> >>>> * Machine model use cases
> >>>>
> >>>> I wanted to share my perspective on the system emulator machines, what
> >>>> they are for, who they are for, and hear what others had to say.
> >>>
> >>> Sounds good as well
> >>>
> >>> Alistair
> >>>
> >>>>
> >>>> See you on the call tomorrow.
> >>>>
> >>>> Cheers,
> >>>>
> >>>> Joel
> >>>
> >>>
> > 
> 
> 

