Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61312606A319
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 22:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alistair23.me header.i=@alistair23.me header.a=rsa-sha256 header.s=fm2 header.b=Iiej6qJP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ss4Pk4bb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIvlx-0006zH-1k; Mon, 19 Oct 2026 18:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1xIvls-0006yq-Vt
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2026 18:23:58 -0400
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1xIvlr-0002gH-2P
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2026 18:23:56 -0400
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id F286A1D00217
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2026 18:23:52 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
 by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 18:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm2;
 t=1792448631; x=1792535031; bh=JwbIzoAFj7s/tMni55F1SZTrVuBkHFU8
 C4xASiD8/X8=; b=Iiej6qJPhGUTEiNEUh5tJoZjQSs8OSLZO2s8Vrpvqri50SUS
 lfRrL1QJh6UYFGH8ZRlV7DQyD2pdqFSTjbQ0rfLSnRzrv/+yK/eoa/+o9y8Nuq4z
 NeTRdRjv0TcjOCmtcmjCeQr0Q2oXj1I/8jjYZUmy3ikfHYZPZSxcAxVgubxPgl4b
 xlJpb6yX1JxR+j9Gp2HXneA6uW4u32IpegIcXBUHX4Xiw/hGazZsPgZa6WbXLDUV
 M/PT16vB6VGEH0HRE29CFQzLcgLzP6zmBwgdePkCKg5dQxSpn34o0KzgQ+38v8dC
 ABegdcchaM8pZltIzufhNfH8V/a0A2vriX+Jyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792448631; x=
 1792535031; bh=JwbIzoAFj7s/tMni55F1SZTrVuBkHFU8C4xASiD8/X8=; b=S
 s4Pk4bb0QxzMJ9UbDgnpp3FXEW+F2QCx82Gsc9HAq+bq6/ZJ4l4uJI7w6ZHNH3Ps
 lR7slNbasAoiglzoB+dU8socpcU2PcoyRV3pla6WF4ba6dGvaYK4ekaJZNXltXIn
 P2HYA0it8Mz65zTGXUSp0cbPTILq2/vPaFdw8xOG8MLbtzfSCvQBXJceyEHABMPb
 PbGtkw5wygb5dxMHQDdyI57MtiPwlKmWY+z0AInlDtxDW8JI/kNn72n3+aHkdgrh
 wbB8PcczStmz85rI301UDZrcCBeQJB9KxlVtsXY59aPY6ejuQdAPhegAs/389QkF
 TnI4NRpeNigjWyLbMuy0w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
 repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
 action=sign d=alistair23.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792448631; d=alistair23.me;
 mf=PGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+;
 rt=PHFlbXUtcmlzY3ZAbm9uZ251Lm9yZz4=;
 s=fm2:rsa-sha256:dvrPVnAIc4kLgNxxCZvOCJO9aYzjbqWeSMH2NwN1octgRrG
 Bedev3FWRiJToUeFvCAWeM0V8POUlxNqxDj1Xq0n6nhvgx6jSXVoIk7Lcx6gZKCQ
 86Py0lKftZtTs4s2ThZpI476pX5B4iRHel7uamPUAmqaer9NR2rKROtEXvXIr0cj
 tLv2WPgSJ/KQ7ihtjAW+im/aLJpAuh0A63JLucS65xdqsx+MQDOFP4kmdF8YfVDn
 kIUpbr6OFJeotpaG2vO06MX7v8b3bAIXqkTDB048Y/4QxzPRwFb0d2kHj91ZxJXh
 UW1xqMlboQMYM3F3uJdz8IsPQ/inWRaxVZ10uTQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
 repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
 action=mi-m=1; hc=12;
 hn=cc,content-transfer-encoding,content-type,date,feedback-id,
 from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1;
 h=sha256:qKQjxaLqHd1D4iLSyQAZV/XxHJXDTpzQyK9HiaG6nm8=:FtbcGGLUG4SDzZioCwEHlhkf3tyFlA8vb8BTvLbgaY8=;
X-ME-Sender: <xms:dpjWanZyUk2XWRTgPmKQKRtQMCjXJSy1tomxXsj5YWBgAMjvGifldA>
 <xme:dpjWahOUR7N2UIMC84P7vNJwBsX_vp2_2_hqHKtJWOJPd209hvHiMdCDCbmcUNGOs
 16nEMbLLi00o7Hoh25QMsDThSZkRY43drcQWWumlIUnA37filioGxJb>
X-ME-Proxy-Cause: dmFkZTGtph2muZbhyLna+X23pHTdR85Me4lQuTrfHOOsZBYs/Kg/Z1WF+iop5X+9YXu3mb
 qV3jSR8/C4Ylla+EZfb2pxWEa4emeXJrnb78ScoQoewY3wMXucoScf2AxJQLFGIfghZHtx
 8AGIuttibxsTchm5zrfCGrkKN51FHDa0VvQfjY6nADlQBZEFUHjOiKL+ErkRLnyLP2Ofu0
 l2uvd2UNwQj54n2YY2W0hA3h+9U3oQhn5szTl76E2VPpDGiXeBp1H9x3EqSR5hQQChUKe/
 qwXYQpjIZpT2B8wVTPnR4UmOXOy4uLYpzmGJ9bv37scF4JMDrtzIpYxK5tCZIE/gJ+eEOm
 pA2KJOBnBlNr13p5+mqqVEztYdCAOWdnSIDVQvhPNxWjoXTV/r7UeCADtN6zAkSsKBd2nU
 zCkA8qqvd22y/o0UXoW/AVLIVOcyC9V1M7X4phHytLfwYPj480aTx2rm5Hc8AePT5DdIWt
 LEEOjSTNVTFJhbzVcDJaHOQeDQHNcf9zunmFC+RYnNrrfbJws/eQT5Tc/gawbKDuM1N+F4
 Q3e6g9PTY152OnwmWhzGs0IicpXDGbVohhwcM0suF7nX5T8K44GtWZK6SGgUM1JmHFynz5
 XBpca5hk5B3nC3Dv4boTB43W9FcmHrJBBn6j10JYPLFKUM14O2E284ZL+lZA
X-ME-Proxy: <xmx:dpjWan5hKBP3-UW9BBVZA50mUvL0wqcpiQf7RFv3f7GuMBNhpDhh9Q>
 <xmx:dpjWapedvAsGtJ18zlXS9MI9uy-5VgZPwS1PvTImNedgWLNkcVbwGQ>
 <xmx:dpjWai78viHdGBm0NmRuHQEES44qEAMUle7s4pYbFe76pou0aKV7vg>
 <xmx:dpjWau-0v4OA_H3an0tQPivAlRGbJLzCOQ1qce2zqJ4f0tTXMP6urQ>
 <xmx:d5jWaqUV8mQ4O7POKcCgnvJaWoIt1lvX_L46KCzhieOG9G99B5fqHu8C>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 7C83D2400098; Mon, 19 Oct 2026 18:23:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbA2t0igsNsw
Date: Tue, 20 Oct 2026 08:23:30 +1000
From: Alistair <alistair@alistair23.me>
To: "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: "Joel Stanley" <joel@jms.id.au>, "Weiwei Li" <liwei1518@gmail.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>,
 "Chao Liu" <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org,
 "Max Chou" <max.chou@sifive.com>, "Michael Neuling" <mikey@neuling.org>
Message-Id: <0dd5d8a1-ee0c-474c-a7e9-f5176c747c82@app.fastmail.com>
In-Reply-To: <347b3e242afbee1221ae9ce10cd0f6b59b269bfc.camel@alistair23.me>
References: <mhng-CF09685E-EE91-415D-BA66-874115494267@Palmers-Mini.rwc.dabbelt.com>
 <55a04a68-4659-4431-be27-a3621e44be23@oss.qualcomm.com>
 <347b3e242afbee1221ae9ce10cd0f6b59b269bfc.camel@alistair23.me>
Subject: Re: Regular QEMU RISC-V Call
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.146;
 envelope-from=alistair@alistair23.me; helo=fout-b3-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 11 Sep 2026, at 10:08 AM, Alistair wrote:
> On Fri, 2026-08-14 at 17:20 -0300, Daniel Henrique Barboza wrote:
> > 
> > 
> > On 8/14/2026 5:06 PM, Palmer Dabbelt wrote:
> > > On Fri, 14 Aug 2026 13:02:50 PDT (-0700),
> > > alistair@alistair23.me wrote:
> > > > On Sat, 15 Aug 2026, at 6:01 AM, Palmer Dabbelt wrote:
> > > > > On Fri, 14 Aug 2026 13:00:04 PDT (-0700),
> > > > > alistair@alistair23.me wrote:
> > > > > > On Wed, 22 Jul 2026, at 5:02 AM, Daniel Henrique Barboza
> > > > > > wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 7/21/2026 3:37 PM, Alistair Francis wrote:
> > > > > > > > On 17/6/26 09:18, Alistair wrote:
> > > > > > > > > On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis
> > > > > > > > > wrote:
> > > > > > > > > > On 16/6/26 16:07, Joel Stanley wrote:
> > > > > > > > > > > On Thu, 11 Jun 2026 at 13:52, Alistair
> > > > > > > > > > > <alistair@alistair23.me> wrote:
> > > > > > > > > > > > For the time, I'm picking Wednesday the 17th of
> > > > > > > > > > > > June at 10AM AEST (UTC+10). Hopefully that works
> > > > > > > > > > > > ok for everyone. If it doesn't let me know and we
> > > > > > > > > > > > might be able to move it around.
> > > > > > > > > > 
> > > > > > > > > > That means the meeting should start in a little less
> > > > > > > > > > then 13 and a half
> > > > > > > > > > hours! I'll send out a Teams invite tomorrow
> > > > > > > > 
> > > > > > > > Hey!
> > > > > > > > 
> > > > > > > > I realised that it's now been a month. I leave for
> > > > > > > > holidays in a few days, am currently recovering from some
> > > > > > > > sickness and don't have any agenda items. So let's skip
> > > > > > > > this month and start again in August
> > > > > > > 
> > > > > > > In fact the meeting was yesterday according to the calendar
> > > > > > > invite Palmer sent
> > > > > > > :D figured that ppl forgot about it and I dropped the call
> > > > > > > after 10 minutes.
> > > > > > > 
> > > > > > > If we're going to stick with Palmer's existing invite the
> > > > > > > next meeting will be
> > > > > > > August 18th 10AM UTC+10.
> > > > > > 
> > > > > > My Teams meeting thing had the 17th of August.
> > > > > > 
> > > > > > I only get back on the 17th, so let's do the Thursday the
> > > > > > 17th at the same time.
> > > > > 
> > > > > I'm super lost now...
> > > > 
> > > > Thursday the 20th of August I meant
> > > 
> > > OK, I've attempted to update my calendar and maybe you guys will
> > > see that ;)
> > 
> > It worked for me. Thx Palmer!
> 
> I think we have a call scheduled next week.
> 
> I'm away next week travelling, so I won't be able to make it. After
> that Plumbers is only 2 weeks away, and I think a few people will be
> there.
> 
> So let's skip this months meeting and we can chat about anything at
> Plumbers.

If anyone has any agenda items for next month please let me know. There are no items for today and most people were are LPC so we don't have anything to discuss.

Alistair

> 
> Alistair
> 

