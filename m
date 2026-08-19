Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F802C5DF81
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 23:49:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwq1h-0004k3-KZ; Wed, 19 Aug 2026 19:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wwq1g-0004ju-62
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 19:48:56 -0400
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wwq1e-0004oW-43
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 19:48:55 -0400
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 045C51D00136;
 Wed, 19 Aug 2026 19:48:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 19 Aug 2026 19:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1787183330; x=1787269730; bh=MU+8SS8sC/Dd9D1/HWWOopXDzbhDggIB
 GUWaSChlGg8=; b=rGi7i9n7L6wGHi0/sw5U5zut609ypoktBNiga7si4WjOQ4Mq
 ZSJ7xJpRVBBtA36gJ3VUXGCQd8q+kbL2wqRr7eTnROCYwScOuQTzJmEe6PMdv3Ok
 Xxh9vWFBIr+P8bhSYfp63TTqvKE4ngeyW9D5CYZ2xX76Us0jypcQZohPihdbsC1w
 u09wCZbfZ6sK/ZJbFV8+dNu64YSnq78OVAy0BYCjS7GVW55k9amSNGE1BEQUJ02T
 i/usk/nCkDQGlkNcytIv4TgvrCr1sSLOGL1nn9IeP9MP7FMfS2kcFFORf8BXFb6U
 c/f9k9LHFGfVjImB5qQS3s7MeGiVXSbsa/qa+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787183330; x=
 1787269730; bh=MU+8SS8sC/Dd9D1/HWWOopXDzbhDggIBGUWaSChlGg8=; b=c
 2mIh65j94Ya68d9XdsHBzrs+HKwu+mTMRyz2CSeSGxx7A6KbkyEjoSaWGoviiOfn
 qMH0jWK+q2g1CqcmCX5UepfZHHW1E30OmODw8rl6eeNw8+alAsF3KDXH3OmSndTx
 TfYhZ6P+GsHHDPkFEFkEtHPrtXTetgzL7PoCgzKQ+ACHiDx463PuFkBKeBtc/H+d
 akK24WVfrcGK5Slb83v/ZuiqUDrrlufb8WRQqBOliZgaMbHSguV6pwOWY8cpHmQg
 WU5n3hOAVM6ASUQTvn7BeIpshsFK9quLWGxUrrXVPCYkVfY+LNzC3H077HnLpPFW
 EAa3TVn9jzg08156C7Tfg==
X-ME-Sender: <xms:4UCGahdqbFMRLLJ0PdbwVw6tSopOlI8U9zb6S_b9h2rRSKolHfoLRA>
 <xme:4UCGavqLT72msTIKxROsBbIw2Q5CldX_TL3ICnU3KYjh8WvDU95jYKTNP3JDMlsju
 ieiSlVQDONFfw84m1x6DCjfs4taVEZD8P5VmmHPIWV-oYoXcp_bhQ>
X-ME-Received: <xmr:4UCGarMxILK8SVQP4MXOmrlHAEJ4UV0j0mS-TxIPb42qYrjzrcdxLUSmOmaPiqGKaK1y30Qo-kKaMj7rv5Vooa_vatw>
X-ME-Proxy-Cause: dmFkZTGAK052UVc/fFBi1lrcINtpJz6WnL+We5YdVPtvhAmGvzmQnUhw3Y7gbMBCqJT1sx
 ipuUJFwzfMYifVgPkPIKotZFQc97Kv5Bc0qo4C8yhuSPAKWTR+Fgap+gSBc/K9wDg0Lcpo
 jmJBfNfVBtVxpNWVtjTDDJf+feJpYjO1Y5A7Pz3APLJdC+kaNu458FNNJgk34rfcwVY/Oa
 COwjJGz1XZ2XOl0spOK/Kwux3IJOLe21BhlTZPzCMeB8YsTvbJHLf3egZBchRn4rbfPB7O
 fXlw0avVG4Ln2645nUz/sBWVbjGuYqBs+n8l9R+lw6LX+egKH1/GEIOAbiK7bZfIj8sWEo
 YTHLVTxUcRPgXT4ookAAhJri8Fi4Ea7zpFLPFSb6htMfSuVfeq6qdsd8cbwvQFi1wrFm8n
 zTGrgao+Ozqh2eKYybEJoY192x4IozXQZevPOox8dBx0qntyFMziootcYQTGApqwKD2X0h
 11U+hHAJ4SLRFtMB8Yx3zoioIiqQU3P0CwbQtOlOAhW9zqyvMcE3370kHomF1A0jfcHXGO
 DL3HPlNBNhTvOT9RllSsdu4T7H+5Aht1dfN1hv0QvOf9fMjTqjF7CHE7dQWrpM2aAcu+sr
 fOAYzbeqhByRhi83WkXdq6/JKl/I+aaNAsengRF4g6rwwVk/m17oLCm+AFFA
X-ME-Proxy: <xmx:4UCGaijiK0cymUHF7-vEjgHf7EN2agXz3QWnzuJs5OBLTyIBR0JP0A>
 <xmx:4UCGautzZVvEAWnnzkjX-pS3pxucVw8gpbtUHd_s00puS-sENeFLbg>
 <xmx:4UCGamh-cOcJU8aMR0M6FZA6ExLDP7PRanlS02cFZnxpORYWPcX35A>
 <xmx:4UCGakYadbBGoJnJWcl2rgiy3ROcGBo7DX2Bs34YY3Vp6DM7qXqyKA>
 <xmx:4kCGavTKkhc8uSPQcpQplwb2CUUw-5zGG1M3fk4kR2vy4amRCtCfA5ct>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 19:48:46 -0400 (EDT)
Message-ID: <4a3e61d2f275304f77faab952b285e41c1c1dd6d.camel@alistair23.me>
Subject: Re: Regular QEMU RISC-V Call
From: Alistair <alistair@alistair23.me>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, Palmer
 Dabbelt	 <palmer@dabbelt.com>
Cc: joel@jms.id.au, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org, max.chou@sifive.com, 
 mikey@neuling.org
Date: Thu, 20 Aug 2026 09:48:43 +1000
In-Reply-To: <55a04a68-4659-4431-be27-a3621e44be23@oss.qualcomm.com>
References: <mhng-CF09685E-EE91-415D-BA66-874115494267@Palmers-Mini.rwc.dabbelt.com>
 <55a04a68-4659-4431-be27-a3621e44be23@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (by Flathub.org) 
MIME-Version: 1.0
Received-SPF: pass client-ip=202.12.124.150;
 envelope-from=alistair@alistair23.me; helo=fout-b7-smtp.messagingengine.com
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


Should be the same link as last time, but just in case


Microsoft Teams meeting

Join:
https://teams.microsoft.com/meet/275503449279724?p=3DC2D0EDrqxwFb5LuRnB

Meeting ID:
275 503 449 279 724

Passcode:
kS9Vg23i

________________________________________
Need
 help? |=20
System reference
Dial in by phone

+1
 408-627-4258,,498330396#=20
United States, San Jose
Find
 a local number
Phone conference ID:
498 330 396#


