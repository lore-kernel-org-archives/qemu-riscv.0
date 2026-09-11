Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A317FC88E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 01:28:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4q3A-0000Os-Qr; Thu, 10 Sep 2026 21:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1x4ooZ-0000Gx-Cv
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 20:08:28 -0400
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1x4ooU-00047H-Ta
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 20:08:21 -0400
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 7F25F1D000AE;
 Thu, 10 Sep 2026 20:08:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Thu, 10 Sep 2026 20:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1789085294; x=1789171694; bh=hRJ1jnvBAbuoucpQRIAcVPs5xs68sOBc
 lId/yuMNZSI=; b=jVgxGQEkiKXmvwtM3zZUiyRzztZjMRnBt/38xiJQAUlVO7Xd
 YzZeXmqn2txbpwWoaXrhRN3pcw+QJ75Jd9mIeDgZ6dz1RBv7vHdL81z82zu5w3v4
 cnc3dWFhqruhrbqAaL1gIA6wk8isWIMz+BToml03/DcyzkkUYFv8UWUaqVnh6Zpt
 xi3PF/DqMvvxq59P0w0CMCHOeYKvEJj/W9qzL6va9AxVPFJKFRj6HKYMWRl5SXZo
 wiJIKJhh2qSpR+SR/u389S9+CtIg2hT75//Rij4CHldoso0aZNd8MB+6JcOOZrOL
 3bk6ZQuKLN7IT6Jk51s/EfkANBPCfHfK+Jw5gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789085294; x=
 1789171694; bh=hRJ1jnvBAbuoucpQRIAcVPs5xs68sOBclId/yuMNZSI=; b=O
 cqe/8KpZsLfbK+cJ09k7ghkexogrfFBk8HjZ73qpQUK+vQ1agXEfLsgKn059Cefz
 ot0a9SlBASWNxXSY/OtjPUL4Z1xedtq2wLyAqBa0ZKBdN5cWdWrnBFo0DXtovRby
 ReSi4AOex7QMyTbZzicG2XNnLO6ayWee/pM2YibQDeDoDgew5y4ERTu1+rrh/dS1
 lbl/RjncsX169vZZAf/UqOTpv+nCgZy1YLx59B99bjRe9h4fI8mULp91Sg4NnnWW
 9zBIrldWBsGOx5u4G7MAKObbT+awBgHfk/23xDUN3aUkpV93jsCFm2IxteDJh3Rk
 D6E3cdPX8/gbpoSL2kJEg==
X-ME-Sender: <xms:bUajaiuddeLTfuRDcTNztgbEuXhuGuH_gDQ7jkk7AiBqf5epBQsBJg>
 <xme:bUajan5DjlbYeVScVHX-apaGJl13771TBsU79LYr2-vbzDo7wvjuz5-vrjRn7tv3c
 IMOywxblyEBfKxdkwwtUlISW9YsTFSwBPjAS9jHn72TEcaEwt-D3SDS>
X-ME-Received: <xmr:bUajaufsZPAeNrZ-Uqxs-4wbem74AmeSAvn-yrv9oRhCCxu2zUw-2FFugaYfJur1sLyS1Em9KWzDW0dt8AZl1wRg_6M>
X-ME-Proxy-Cause: dmFkZTESqWJJYFnRJe6LwOnBUrEcIEMyylv2dqnQBgTV6aCdjzyVFw/BBFFJC+oBVhpzuy
 Qzsv/w31mpQEWn083V9FtTzMenQF6jgAnu2ue0rCK8IsRAS6cDMI0pwQKasRh8euN/HhFK
 wOB4C5mglwmk3EFwULGhCZs7dAOtx7fiyfJ5GBDlTAZ9DRbaNbE0d1C7KskaCFAOOWNAkB
 XM1vfE+zlfZFzlcx2F4i1m4ELyHye+KufhAyaP60MvYyz9ep8ei6IIseZKJbxOAykiK++i
 HNm+cUC+cxK9zPOtz+TefyIg1ZTiW+CMHKFaN/VBa0kJP5Tk2GX+OZLrfTPHeAKP1GxVTv
 qCQyVBwMDidHHAyFfo27baoOjKRDg1Nt0ty7hFW3GANck7ILpDpCXUycr6Cwje0P8meTkL
 nd2Q+TYIcHa1N7hn1GRjbK9wOUSU6T3Fuk3YMT4s82ZI2+5QmQSdHedJwzvfrDHoEFz4R3
 86vgUhk/apzYik8/fzwJ2O41Je4SeoYlFu0zaOXGKrGNz5gpmvp2zJpeHDKBERX/p2W9Hr
 /onV7ZCTQdYo3A848sXKlSeDn7Mcq8pvp0yV4ebIryhdS5IsJps5jjlvpyyF4Bpl6WdOUZ
 2FztMOvsG673tpQdDzPgA/Ftpn6AoqrUROPmYTvsrb1K8LT6E/H2NHX6rezQ
X-ME-Proxy: <xmx:bUajakxPkDZZ91V7i9oI6irhUm_vE62TVWT6G117WXYcoFpSJ2QExA>
 <xmx:bUajaj9EZlgTg3g8221d6ME_5YMp0nyIR4cWmvRSmDEtT_kLignV7Q>
 <xmx:bUajaiyqZEG7eMtUec7Jyxt_9bXbIjeCHDt6ZfrHVcMM_jEv90UjaA>
 <xmx:bUajarrUba0fNDMBmrQLkE1U4B5CUGnLHmhGwtWDdZgKnY7Yv64IzQ>
 <xmx:bkajahgiyKy4YJVXdmwdvUMZ6wKPELosrN5e5eRo9KiKYqAhwxREFJl5>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 20:08:10 -0400 (EDT)
Message-ID: <347b3e242afbee1221ae9ce10cd0f6b59b269bfc.camel@alistair23.me>
Subject: Re: Regular QEMU RISC-V Call
From: Alistair <alistair@alistair23.me>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, Palmer
 Dabbelt	 <palmer@dabbelt.com>
Cc: joel@jms.id.au, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org, max.chou@sifive.com, 
 mikey@neuling.org
Date: Fri, 11 Sep 2026 10:08:07 +1000
In-Reply-To: <55a04a68-4659-4431-be27-a3621e44be23@oss.qualcomm.com>
References: <mhng-CF09685E-EE91-415D-BA66-874115494267@Palmers-Mini.rwc.dabbelt.com>
 <55a04a68-4659-4431-be27-a3621e44be23@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (by Flathub.org) 
MIME-Version: 1.0
Received-SPF: pass client-ip=202.12.124.151;
 envelope-from=alistair@alistair23.me; helo=fout-b8-smtp.messagingengine.com
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

On Fri, 2026-08-14 at 17:20 -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/14/2026 5:06 PM, Palmer Dabbelt wrote:
> > On Fri, 14 Aug 2026 13:02:50 PDT (-0700),
> > alistair@alistair23.me=C2=A0wrote:
> > > On Sat, 15 Aug 2026, at 6:01 AM, Palmer Dabbelt wrote:
> > > > On Fri, 14 Aug 2026 13:00:04 PDT (-0700),
> > > > alistair@alistair23.me=C2=A0wrote:
> > > > > On Wed, 22 Jul 2026, at 5:02 AM, Daniel Henrique Barboza
> > > > > wrote:
> > > > > >=20
> > > > > >=20
> > > > > > On 7/21/2026 3:37 PM, Alistair Francis wrote:
> > > > > > > On 17/6/26 09:18, Alistair wrote:
> > > > > > > > On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis
> > > > > > > > wrote:
> > > > > > > > > On 16/6/26 16:07, Joel Stanley wrote:
> > > > > > > > > > On Thu, 11 Jun 2026 at 13:52, Alistair
> > > > > > > > > > <alistair@alistair23.me> wrote:
> > > > > > > > > > > For the time, I'm picking Wednesday the 17th of
> > > > > > > > > > > June at 10AM AEST (UTC+10). Hopefully that works
> > > > > > > > > > > ok for everyone. If it doesn't let me know and we
> > > > > > > > > > > might be able to move it around.
> > > > > > > > >=20
> > > > > > > > > That means the meeting should start in a little less
> > > > > > > > > then 13 and a half
> > > > > > > > > hours! I'll send out a Teams invite tomorrow
> > > > > > >=20
> > > > > > > Hey!
> > > > > > >=20
> > > > > > > I realised that it's now been a month. I leave for
> > > > > > > holidays in a few days, am currently recovering from some
> > > > > > > sickness and don't have any agenda items. So let's skip
> > > > > > > this month and start again in August
> > > > > >=20
> > > > > > In fact the meeting was yesterday according to the calendar
> > > > > > invite Palmer sent
> > > > > > :D figured that ppl forgot about it and I dropped the call
> > > > > > after 10 minutes.
> > > > > >=20
> > > > > > If we're going to stick with Palmer's existing invite the
> > > > > > next meeting will be
> > > > > > August 18th 10AM UTC+10.
> > > > >=20
> > > > > My Teams meeting thing had the 17th of August.
> > > > >=20
> > > > > I only get back on the 17th, so let's do the Thursday the
> > > > > 17th at the same time.
> > > >=20
> > > > I'm super lost now...
> > >=20
> > > Thursday the 20th of August I meant
> >=20
> > OK, I've attempted to update my calendar and maybe you guys will
> > see that ;)
>=20
> It worked for me. Thx Palmer!

I think we have a call scheduled next week.

I'm away next week travelling, so I won't be able to make it. After
that Plumbers is only 2 weeks away, and I think a few people will be
there.

So let's skip this months meeting and we can chat about anything at
Plumbers.

Alistair

