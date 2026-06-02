Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FBDCD6E56
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 02:01:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUERn-0005dT-Up; Mon, 01 Jun 2026 22:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wUERm-0005dH-FD
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 22:01:38 -0400
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wUERk-0008QB-CE
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 22:01:38 -0400
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 50DFB14001A0;
 Mon,  1 Jun 2026 22:01:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Mon, 01 Jun 2026 22:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1780365694; x=1780452094; bh=CCHui1JrX6s/eN9eNpwv7JRuRBY8BS2w
 NtieLrJ1xk0=; b=tzKbjdVZ8tcoC196LWKV+Z9VY37ifTGuNAP6R1SK4qr7lukH
 Ol8RYPg6HtyAgsG+Po30ZGSWLQxuuXQWXns9kksiwTbnhiiivo8agllCw5IgftZW
 9iSZpEiEqePdFifzgaAAHQlzDDi3CNGuIh/6cfHrPiU7R7ud32dlNndai2dqIkgI
 gSBmfcb3Q3+qTqblV4MDuSTmEwRQtpG8xEXvjbKU+uo6/r3DHAQFJmO5EHfpNG+T
 6X1R0by10LERgM5NIgNlL2owqNkGUtqpV7/0HvDPfG6QMOEgqFIP2P/gP7cJdR1F
 rwgr68hdppKqnVEFnoQCt6MorlKyABwqNRe3ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780365694; x=
 1780452094; bh=CCHui1JrX6s/eN9eNpwv7JRuRBY8BS2wNtieLrJ1xk0=; b=h
 llu15pcKwMsK0XUs+7eHumwDM0B4/g9AUgYaHDz3u5wJ6nfraB7XBah2jdpthiEL
 a5qXKEkY77YSXoZ3ILuFv+q7uBHWTURhpxiAabxLdAxVOBVav8viGyr95tdlIqj1
 ozitxnc4dZLZUscz8SzdOXLMdt1+QFyxFJwBcFTwXnvaPIwXhUVqIQPjw+DZKd4T
 hCPjdX5XN+mp3n7hXV6tw6TN1WgbjApp8JGiFfXUwKzOOnK1NyRMbHrgJd3AAmxS
 JMJKbvLYgl5YJyJKkqRUnf/grGozWFsUkYTjM02CnNsQ1nSWc9L+/3pFgUlKshGk
 1V+JeK3GJ3Xb0admm42Dw==
X-ME-Sender: <xms:fTkeamKoisOimKceFOhoXTfNQ_XFboCH2nI0fTpnlAcpM4s2yxQPYw>
 <xme:fTkealm1e73JOzDdSGntZIkvKWqwPma-mplB-wrSsSe_rOksuf1w_8r188IIsCASW
 f_g-9aEY-DQy-DNhToLviB83t8KiUDjHOPmF17lXqpy8jjXI-po8g>
X-ME-Received: <xmr:fTkeakE1JGOI3cxbfEZGwbv02G8nvsFcBhtfZ5O309iGa0u6ADQdfFLoDGeT-X-wqA>
X-ME-Proxy-Cause: dmFkZTFCe4swW75GNFtDBNefGuX3TMIKdRHyydzb4n5Awd4GjE7OKZ9qXdLvK5MMLL/iU9
 kVNWDg891FRq0Ob4Udt+HtNruo3ItIX0VejPHa/KFOlkEQVEVuo05g7dI5mvNOS+RWxsCC
 oYqMdbgFiBsALCRU5arxq+sKYr10Nm/tA7tZkUW8wJX+reO/QpLmogtXunDYJtttm7TOUZ
 RKhwS6FFYMws2efngYjfcrLhMBwPKEbwo6zCN3MEiiOnny4+dZ7HgBemU49vPQRIB3kYj/
 YUR2HGA6prdv7ybSZxFMAiOxweco8jFwOInIXcmiZte/ZuD7+Xpc5UiMyuFD+sZSKJ6rcx
 OrXDM44Dwa4eAeQOVIC1yfKO+LlT5m2c07iDLVm0jJcGatV88IT+LoStoI8GNUcyjl1Ooa
 sNW/usjCBBAUJ9w+erbe55OQsDmPlapXgtj6+eAsCyeJkJX05QFon4zxcoM/XTNR0BPGce
 je7vgGpJUVBYpoLntDDO8TNlsyrSgahYEj3GUIUU2mS5zE6Bp2Cq0gqf+l4WrGXk3BVeXX
 IEhAb7g1BVj534CBsaipIFvStTUY7FJ781b/XewkxN2UOq7O32ahRZ6yLGyRHe8ntH4g0E
 AkjlCWs42pKXdXxAEji5cNsgMc8FJePW4pChepPCdtd307nW70d/HI7YCXyw
X-ME-Proxy: <xmx:fTkealGW-Rxh2uVpnFn3KOr3rLtAyrX6_JK1jsoxQCdHuTBGgm2ONw>
 <xmx:fTkeahNCX850mFc9ubY6slomDlcS2a_-scitAyIm-I303qBDwJvGrA>
 <xmx:fTkeakG1AeIPePKu9QHxKtvBEvkTBlrYYFiTTMW12qKW_7jDVgCooA>
 <xmx:fTkeaoOcUacvTKQ2rzRxpoojSuAvLbiBqwoaLoisqaM4DSY0wWK7zw>
 <xmx:fjkeajBHaLIMlGd6wiPQ8iVNxsBnuOyhs5gnGneFT966hxI9CBYhVVH2>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jun 2026 22:01:32 -0400 (EDT)
Message-ID: <b43aaa95-9a94-4ae9-931b-9dbc21ad66cf@alistair23.me>
Date: Tue, 2 Jun 2026 12:01:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alistair Francis <alistair@alistair23.me>
Subject: Re: QEMU RISC-V Call
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>
Cc: qemu-riscv@nongnu.org
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
 <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
 <ahkrD2h1kaubNtXq@sifive.com>
 <443d2b53-a613-4d46-b750-3a22aa72f67c@app.fastmail.com>
 <3c88b75c-3658-4516-a655-d500de323d8c@alistair23.me>
 <a02f618f-7e0e-4bac-9748-afa0469c3a60@oss.qualcomm.com>
Content-Language: en-AU
In-Reply-To: <a02f618f-7e0e-4bac-9748-afa0469c3a60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.159;
 envelope-from=alistair@alistair23.me; helo=fhigh-a8-smtp.messagingengine.com
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

On Mon, 1 Jun 2026, at 7:32 PM, Daniel Henrique Barboza wrote:
> 
> 
> On 5/31/2026 10:56 PM, Alistair Francis wrote:
> > 
> > 
> > On 30/5/26 20:43, Alistair wrote:
> >> On Fri, 29 May 2026, at 4:00 PM, Max Chou wrote:
> >>> On 2026-05-28 21:37, Alistair wrote:
> >>>> On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
> >>>>>
> >>>>>
> >>>>> On 5/27/2026 9:15 AM, Alistair Francis wrote:
> >>>>>> Hello everyone,
> >>>>>>
> >>>>>> There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
> >>>>>>
> >>>>>> So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
> >>>>>>
> >>>>>> I was thinking 1PM on Monday the 1st of June.
> >>>>>
> >>>>> Can we make it 10AM AEST?
> >>>>
> >>>> Sure! Let's do that
> >>>
> >>> Both work for me. Thx
> >>
> >> Great! I'll send a meeting link out on Monday.
> > 
> > Hello everyone,
> > 
> > We had the meeting today.
> 
> Oh, Monday 10am AEST is still Sunday for me.  Got stuff messed up in my
> head :D I thought it was today (Monday for me, so it would be Tuesday
> morning Australia).
> 
> > 
> > A few of my key takeaways after the meeting:
> > 
> >   * We need a new stricter extension requirement as there are just too many extensions being submitted.
> >      * I'm thinking requiring upstream tests to use the extension and at least some proof the extension is used and provides value before it is reviewed. Thoughts?
> 
> 
> The root problem is that we have a lot of people that consumes the code
> silently, i.e. they're not vocal about "I care about this feature".  This
> makes a criteria like "proof the extension is used" harder.

Just to be clear, this proposal is for new extensions being reviewed. It 
wouldn't apply to existing extensions.

At the moment we are pretty much in the position where no new extension 
will be accepted as I don't have time to review it, So we need to do 
something

> 
> And the main nature of how qemu-riscv is consumed, enabling development
> of other pieces of the stack (OpenSBI, kernel ...), promotes this behavior
> where having stuff in QEMU earlier helps.  Recent examples are the Server
> Ref Platform board and the smmtt extensions Zhiwei sent last month.

Agreed, those extensions have clear justifiable uses, so they would be fine.

> 
> 
> I'm not sure if we can put a process on it.  Maybe we should go case by
> case instead ... and note that a patch sent to the ML doesn't mean
> auto-acceptable either.  As an example my e-trace patches are buried
> since January.  I'll eventually re-send those (maybe this week).  If there's
> no reviewer interest then it's up to the maintainer to take them or not.
> So maybe the existing process already works ...

Ha, but the existing process is I just don't get to them. It would be 
better to try and prioritise extensions a bit.

> 
> 
> >   * Someone? Tenstorrent? will submit documentation to QEMU to describe a few key Vector options that people should test their code against
> >   * Joel to send Sdtrig patches supporting both debug spec versions. Otherwsie deprecate current 0.13 version
> 
> In that case I ask to name the older version "sdtrig-0.13" and make
> the current "debug" an alias to sdtrig-0.13.

The new one should be called "sdtrig", I don't think the old one was 
called sdtrig so I think we are stuck with "debug".

> 
> And if we could make this happen ASAP that would be appreciated - the
> current sdtrig situation is holding back the "sdext" patches from Chao,
> which in turn are holding back the riscv-server-ref board.  If we could
> make all this happen for this release (code freeze beginning of July)
> that would be terrific.
> 
> >   * Anton to send vector patches
> >   * Schedule these regularly, but not on a Monday. How about 10AM (so same time) on a Wednesday?
> 
> Works way better than Monday 10am AEST :D
> 
> > 
> > 
> > Portia kindly took notes that are below:
> > 
> > 
> > QEMU Community Meeting Notes
> > 
> > QEMU RISC-V extension policies
> > * There are too many extensions coming through and cannot keep up with reviews.
> > * Is there even code that runs using them?
> > * Discussed requiring some test as part of accepting these, TCG test or kvm unit tests
> >      * RVI is supposed to do compliance test, we could ask for these tests, but they generally don't seem to exist
> 
> 
> RVI is doing compliance tests using riscv-arch-test:
> 
> https://github.com/riscv/riscv-arch-test
> 
> They're working on a sort of certification process with QEMU and other RISC-V
> emulators (Sail, whisper, Spike ...).  I suppose more bugs will be coming
> our way.
> 
> RVI got me involved directly in the last 2 weeks because they claimed they
> were opening Gitlab bugs and they weren't seeing action, and it would be
> nice to have some stuff fixed before RVI Summit Europe.  I did some work
> on them and now seems like we have more people from the community joining
> in fixing bugs, which is awesome.

Great!

Alistair

> 
> 
> Cheers,
> Daniel

