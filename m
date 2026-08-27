Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966FFC61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 10:54:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzXje-0001Ik-HT; Thu, 27 Aug 2026 06:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wzXjc-0001Hy-SN
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 06:53:28 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wzXja-0001oE-99
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 06:53:28 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7f3b01b8996so342566a34.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 03:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787828005; cv=none;
 d=google.com; s=arc-20260327;
 b=DP3aYfAP0t25wgVTc4+xSqfl2Xnh/XjQ3FFaX5M0IfHlBAoeEFxrB/nueYzKkYrvuP
 eyQaXJdTicbfO0QyBWX7QbIGp95amAG/EWLtNGOpyHuC5rX4CMlry5fHWiQYlXVIi+me
 NshkraHQK3bUkPzwV/LbsTNQAA4w2tu2VfzGGkPImLiffqnjMaDW9Jy9wGM/8COscbS1
 ehKM3d4/wsp+KE/baq/YfS7PmgVvxqk3XmpJMU4cNxOG9/lFFvVbBkPH1UJyi4ikYgNE
 c0bNV7j0OL8LiEFuL6e4DMA3zmeAZ6RnN8V8trFYs0J9Q/1HhzMy18kSgmKhsADQBXqN
 bxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8v8GfvZwk7BzWpgG+e3H0fyxQybwxyMNONC30vcpZSI=;
 fh=FFFI7FaWLQfH4rvWh7RCJjXlfZbO/GVxZ7nYPu3BcwM=;
 b=r9ZEgwA1Y1uJHyRSnNhQa+tnCwLtd7+2OoV+vmPTL3QOD5rwANwkr/iXuBll9xZZBY
 40CAGCLcPKXIbeTjEFYWwVNUAYwQpq6Dqm5YId1jpOYrsR+mLUoPlAUygibDdRF5JPI4
 O1xirehkj6go07ehYeoGq3Nh2RopRhBSwhNsBvkGgaXffaqhvl2OooEHCEh1qBEub5gJ
 qB67ib5Pj4pik7neYQol6pNqLFQGN3ZAmLT8OL2hwiTNu13C2fb9DVM6o7bYf9l9aCQM
 BKowjEadLFXNks0kZtMWjgZ3tFZ9c6Ez46GoBB1fcxrxakWaOcHUUJIO23qIzhkB9fvf
 OdIg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787828005; x=1788432805; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8v8GfvZwk7BzWpgG+e3H0fyxQybwxyMNONC30vcpZSI=;
 b=gaNtPc1cautM/+ZcDMHvItNatPhAwLUWLwSH+d51gwOJaCvO7frZsiWuy982w0vPGS
 Rr2mZjqREpN6VKkWTwwRKY9wtlsFJAvPIATeLNIiR1Nl3F7y/Jtop1AT0TDpFQL68lGH
 coLFWTIbKz0ordboRraImU3aSwwZSerLapvXC8eOm1vqCipVaWNFiVW0XUG/1TWN25rt
 f/g3Ssk6io3auiAhK27iXR2JyEqXJ+GyW0lya0QW3Pwm6gN+2t+pblFWsyAyi8EAMZtO
 kyl1QxzoggncVxNcehg2lJUgLzMckEddylaQXcGiFgLa2VUJ9NkWDQoSmafb/9L/sz3Z
 T2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787828005; x=1788432805;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8v8GfvZwk7BzWpgG+e3H0fyxQybwxyMNONC30vcpZSI=;
 b=NxUSy1G4GCuQ6FXITd8S4xAI6abCn/rpI9pf5kzjeZE0Imxhn0GDogsWWcduxSFnI1
 KxY+7c2+prUz8wRvd1m4y58IDm0Z0YBMliXtdpd33uOxgRin0qVlwu8EX2wZ6NQf2jEi
 fG95J1HXBhxIFf1DOxgVqwaBLmjgjyETA9tn8t/pYdm3zGqalrYUwpVLEyb5Rqvykre6
 jZ6cS4u5KjCXPHyFMPmKOOxBTBEmBHGE+GKy5UuceguSFXcqTi/7sTBxMprOBuDqoINw
 trq9IiSBZ/aYgAhj5j9rXSJ1K5JvWfc15odVk6e+XlE6ABdHni/+m/1ZAgSE58Y/h/rn
 QNug==
X-Forwarded-Encrypted: i=1;
 AHgh+RomUwGvDbUcvtyJ1kvjya87Pak+5VV5lVfc/kViv492kBf2sty4pygEuDKF1kq+PDPVBOkJSG4CYi+f@nongnu.org
X-Gm-Message-State: AFuF++mZwJvjH2T9Mg9zyBBNKllY0GQAg5Pm6bP35dvjqHcECpG3RAkh
 GliZXTk5tEprp1QX3gZL5pTwQt7j+rBOIXrFSuOVlEsjCPjFaCwPthBDZKFo0Po7ij9+hxwsXxZ
 DM5tfFkP8EFGYZtFWME6sEzxChHuZeZQ=
X-Gm-Gg: AR+sD10qtlUMidBS9q4cVp50En43zlrWII1YuiPKmE9rxwcs+gkK9L4XW7eLi4HeLlf
 sylJvX+CTFTs6gwwBX6PRRcpmmhdk1J+GahtYJMxQHyZQYiexSCIbVhh2yf12FnVTEpKnw/Qb+d
 ukAtrAPDTGl4mnrHObrgoIgUbEug76Uo1VsiB7j4eClRnUlJGK52JPVDZXZgP3T5XFr+ksgA8I4
 R9f3reSIaR9zzdy7Xpc84b2ChMuuK2Bykmmd6CUpS71HpdOhRuLqSb26/H1Z6fN1+n8Thc/Blpx
 gwHOlLD3mOl2+QwO+gVU4NhQbdaQ5LQqIh/SSyHiLnK77KdV1dFzuGk5+fCj32enxXFXlqQsKA=
 =
X-Received: by 2002:a05:6820:218:b0:6b1:b91f:e26e with SMTP id
 006d021491bc7-6b1b92015b2mr1859451eaf.16.1787828004652; Thu, 27 Aug 2026
 03:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <20260825040452.1322251-4-stephensportia@gmail.com>
 <CAFEAcA8h4JwFFxnTQwxgC2HPAE_YA8CnLSgJo6pdhFcJeLyGmg@mail.gmail.com>
In-Reply-To: <CAFEAcA8h4JwFFxnTQwxgC2HPAE_YA8CnLSgJo6pdhFcJeLyGmg@mail.gmail.com>
From: Portia Stephens <stephensportia@gmail.com>
Date: Thu, 27 Aug 2026 20:53:13 +1000
X-Gm-Features: AcwNN1UBTXOM2sA-Q8fvUMea08dCNL4ND4ttlq2O0VKoNWoo4xudaklyYJg4f_8
Message-ID: <CACYNXwKkh6zAha=ChX_456TF0pyaS-mQsdZsJ_JtP7Fq7EP2RA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/strongarm: Fix dropped upper byte of ssi
 transfer
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=stephensportia@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, Aug 27, 2026 at 7:09=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
> >
> > From: Portia Stephens <portias@oss.tenstorrent.com>
> >
> > The strongarm model intends to transfer a 16-bit value over SSI. There
> > is no machine using this model with a peripheral attached so it is
> > impossible to know what the intended SSI peripheral is.
> > There is no in-tree peripheral support for 16-bit transfer, update to
> > use 8-bit transfer.
>
> This is the strongarm synchronous serial port; the manual says it
> "is used to interface to a variety of analog-to-digital converters,
> audio and telecom codecs, memory chips and keypad controllers
> as well as other miscellaneous serial devices". I don't know
> if it's actually connected to anything on real 'collie' hardware,
> but if it is then  I don't think QEMU's ever emulated the connected
> hardware.
>
> The data is between 4 and 16 bits long. I think the intention

In this case, how can the device transfer function know what the
expected transfer width is? From my reading of the current
implementation, there is no way for the device's transfer function to
know what the transfer width the controller or guest software expects,
only a value is passed, or am I missing something?

> both for this hardware and for QEMU's ssi_transfer() API
> is that the guest software is supposed to know what the device
> on the other end of the SSI connection is, and program the
> controller appropriately. If it programs the controller to
> transfer 16 bits to a device that only expects 8 then things
> will go wrong in both hardware and QEMU; conversely if it
> sends 8 bits to a device that needs 16 that will also break.
>
> -- PMM

