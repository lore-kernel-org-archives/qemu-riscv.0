Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C87BCD98D2
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 23:19:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZd3W-0001yp-FQ; Tue, 16 Jun 2026 19:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wZd3U-0001yH-Vs
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:18:53 -0400
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wZd3S-0005l8-VC
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:18:52 -0400
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id D7DA01D0015D;
 Tue, 16 Jun 2026 19:18:48 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
 by phl-compute-04.internal (MEProxy); Tue, 16 Jun 2026 19:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1781651928; x=1781738328; bh=NZtgvQLoa1cqADapuzgSrBUi2/HbTuzM
 Bay0dZAOWdM=; b=K0/Dcp5mY8tqQrsVEEJZkCrhouFn1qRnxwaFZN7nT+7xLWBW
 dzQfzjai1xT19vhj5znGS/thS/pp1LGXVFGvbYW5OmnsjauR/uOMV17OFV6ZtchV
 DkxNbwC8gVWbAshyjun+TiKghOlp4Lq9SmtLeGBgiVrhPZeYyonMIJaWJScy9Co/
 xnu4p2HyBq+5SLkrxScD/r5Li7YSvstauIf9kUiVQJW4FTW9Pb/Uw+dw0CMJEt0F
 2aiNiKAe2BE8pQWwN2eajeUUwc2h7z6qOMGBO+I1jqQ6TpxD2FkQUuvo1zJv2Up6
 iVldUNqrUZhTt1PFta57EllLskBHpJGo6jEB3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781651928; x=
 1781738328; bh=NZtgvQLoa1cqADapuzgSrBUi2/HbTuzMBay0dZAOWdM=; b=g
 eq+3mvK5RBVjxzvazXRysf+6UMjN9E+9+/hRIbbg7z4IN+a58GjU67jKE0Ae3cau
 iasm+jWr6o8tSZ9GdYzNR0crh3TvnPDZXIuPCmrSbcXsxR/sia4QXkrGdcEIu/SP
 mzpJdMadQsw7oRFC3kjwSq+AC5Gp/k4hU8JhirfPcKWfU+WhjV3tfV8ChnqWQirs
 r8OaquZnvUIwZwa0Go7Myi5if3bFi7rdCDua843hIswPmMPkkmNw6yoHIlzrV0Cf
 AeTyVYJiYYUmPXSa/jwVK19flW/mh0U5VgkUCRjL9zwS+zEkRWCwYq9WSnREV/Db
 ev+UjQSnpSBQ/EkYGhcYg==
X-ME-Sender: <xms:19kxauLylemmFFW5jQ8ppONhWdDzNhvY3YVjS9_uL7ADrC3cMMvG2w>
 <xme:19kxag9K9uzWSc4LPCoqeUqRvg_eSI9n90d6hk8Y_DbVctNhPIYwUjpgU0ogbRdJO
 fjkbbYDpYs7X2B4jkWUAnZonp6_PaYcdCNwJvcTNBLh6F4O2mgQdQ>
X-ME-Proxy-Cause: dmFkZTGOoGJNK4cOmDuPXG4DG0o/RKBAJ3m3PFO2SFkuN8f5CMcXv9KceE0UZxeTGkxA1L
 sKfwrccIrQ70Sa+xMkpD6J7KU4cDFzt2pX+0n0BKxg1SYSXMFyZFGCQCYEBH9Xst7QIBmh
 S8/8EFzNYi2nQoxgVRX+qp4HnRylrD325WkDLm31n/Q5PzYpAe2cp/iEq/2MH1BkjWDhmg
 2MzArDCZn7Dh3FYQL85TFHhpaqHqetW/nnREs1ND9CheUCgu4mxlJzyG9wMogPwJ7bt/Mt
 fioj1w9KzF+HjnYfYTd8dM1ABlTu/VJaAaOaIMSEYA55Dzp6GEpirizpM8KElxIzugcLdc
 HbTTCZjLgEhzR0VTbIGnmOd1/HhOjPjeDyeL4JmCZ5fqDrxZ+r9V/bRASTPSSLOz9mOhNz
 4bU7oiV+MyrbVx4anCntohaIS4TTmc0KZM7Lx0o3QI55Jo1dVqvqFX5WZ/ghyHq9MgLCk9
 jQnYrAz4wkIfbkRFu28hT2DgZvjAI07qGp5txRscT2pedqY8LRI502TzHoG4wVGmDz3Uyt
 VZJQeiXtTE7R36xBWhFaHWr9Mm/p4rlpm6FmqwVY7Z/GjuXncc5kA0/owj1eHXL6VBQ5oR
 dCJNa4KbjXELYiQ9q3C2qa19A9zz4iQmpTY72LVY199mZbPtTWjU9892qnDw
X-ME-Proxy: <xmx:19kxagpF6Dpl2yHgdE8s-9iecaUFCa58SJtUIaTdoWbuDeNQid7ImQ>
 <xmx:19kxajNI8IvB0GmUy4AfY89ksaqpU9gKPCRAnJS40cLMWZ9_89PhkA>
 <xmx:19kxaprI1rKksqjDkqwOG_Y_VUfBthYoo42q9u0yD1YGyp7RO1XcuA>
 <xmx:19kxauvGGsiZYt1nEw2uRJVE9Yj0AZy4MS8HxSyDzrTMzBIPwLHpiw>
 <xmx:2NkxajGHF73HXL2YTRWdO0YjFtIG2s1vtB9oT2Rfs1ZrhXjsbRKVvJsu>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 056A52400098; Tue, 16 Jun 2026 19:18:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbA2t0igsNsw
Date: Wed, 17 Jun 2026 09:18:26 +1000
From: Alistair <alistair@alistair23.me>
To: "Joel Stanley" <joel@jms.id.au>
Cc: "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Weiwei Li" <liwei1518@gmail.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>,
 "Chao Liu" <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org,
 "Max Chou" <max.chou@sifive.com>, "Michael Neuling" <mikey@neuling.org>
Message-Id: <68917b26-32a2-49e6-94ea-1ca587948f23@app.fastmail.com>
In-Reply-To: <ad259828-65b3-4c4a-bf3f-73cc195c19f5@alistair23.me>
References: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
 <CACPK8Xe9JVggXzX9kku-zm7RYzM++fqcr=fx-MdkKiViHdiMYw@mail.gmail.com>
 <ad259828-65b3-4c4a-bf3f-73cc195c19f5@alistair23.me>
Subject: Re: Regular QEMU RISC-V Call
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.151;
 envelope-from=alistair@alistair23.me; helo=fout-b8-smtp.messagingengine.com
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

On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis wrote:
> On 16/6/26 16:07, Joel Stanley wrote:
> > On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
> >> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
> 
> That means the meeting should start in a little less then 13 and a half 
> hours! I'll send out a Teams invite tomorrow

Call in details are below. Starting in 40 minutes!

________________________________________________________________________________
Microsoft Teams meeting

Join:
https://teams.microsoft.com/meet/275503449279724?p=C2D0EDrqxwFb5LuRnB

Meeting ID:
275 503 449 279 724

Passcode:
kS9Vg23i

________________________________________
Need
 help? | 
System reference
Dial in by phone

+1
 408-627-4258,,498330396# 
United States, San Jose
Find
 a local number
Phone conference ID:
498 330 396#

Join on a video conferencing device

Tenant key:
wdc@m.webex.com

Video ID:
119 833 426 2

More
 info
For organizers:
Meeting
 options | 
Reset dial-in PIN

________________________________________________________________________________

> 
> > 
> > I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
> > 
> >> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
> > 
> > Two agenda items:
> > 
> > * RISC-V Code Policy
> > 
> > https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
> > 
> > Good idea writing down your expectations somewhere everyone can see.
> > Do you want to raise it as a topic and we can talk it through?
> 
> Yep!
> 
> > 
> > * Machine model use cases
> > 
> > I wanted to share my perspective on the system emulator machines, what
> > they are for, who they are for, and hear what others had to say.
> 
> Sounds good as well
> 
> Alistair
> 
> > 
> > See you on the call tomorrow.
> > 
> > Cheers,
> > 
> > Joel
> 
> 

