Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A90C61DCD
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:04:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzXuC-0005jI-UF; Thu, 27 Aug 2026 07:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzXuB-0005gT-Mp
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:04:23 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzXu9-0003kt-VI
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:04:23 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-81f3b227a4aso35281347b3.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 04:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787828660; cv=none;
 d=google.com; s=arc-20260327;
 b=MPxDiFfGR+WajG78xuXss8D5NNGm7w+u8kziIngTxuCd+LFR0V5Tlru7VqoLtZ7KLm
 uMB1ojwNPEzRnBcn8WpYvQufN+csCukFTDUT7Su5RO8jAiic2I+1oTgEN+3dSDkrVZdp
 RW0x4CYkgpsNgvr9XXWb2jJTt8DEPh+X0p6xdIC4bemx2TZcUn6jIOAegCDcljJV68qD
 qFYBDgCJMu7DgxzUqOH7H+11T0Qlt1ZdGc9e8OONEQzDD7oJ0GxOaqVkdXF6xb4Fvcsi
 yVV9CcfcLW/95iGwHOBSOj/s3K5POCpMtp9rjqLxaz2lD5EfwhXLPQkzac3ylAOXsngK
 Maxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Iu0DYiwTBjZAqxBhxvWkXCRfBRIlAnV57KmL/gKnpn8=;
 fh=6Hin8GNoW6gbYaNDrVHa33P/hE0esnS5VwpLbaisJMk=;
 b=nionUBHWAoy6N6ndAS0EOYBdsrCg2dyeJKxjgT6TAfVKcFREqRIATBq+nUXx3QBf3B
 Hs6w6x8JKAdHXUpztlEKKvi36/ENbTQjhS3+j5KoG6A/2LbRhicQLgeps6biWPnlVlE8
 75mvivsUqzjdBZXCNAiRLlKFtEtV/MCFempkTst8QHzDMeDQXetP7/k0YgdsRElg+8st
 q/LdLRMiGiajihWjz7jFwNeMvIGr99tga+d6fh2f0ve1u9G4Ce4s+5KYbPws2uOihYVc
 FVeDkUyB/bWYL68dgH4ZLao4Xhytf21c8jFfCZI2aSOS6/fimpL3BhZWF0PKWAsTjEV6
 EHIQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787828660; x=1788433460; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Iu0DYiwTBjZAqxBhxvWkXCRfBRIlAnV57KmL/gKnpn8=;
 b=JzB2CeTDmjOetgIY81T2uuUGxHJfGv6Ks+LfIXdcOsKptODdxu/gU8JiqLal6K9CUF
 x1ilPnXOA1rltU8dXqtaq60Bn4K/1kQ6KfF8PkARy6yP1Q8xTHRf63SjxOlG4WbEzg1p
 cttRJ0GfvqACBaZZqh62D34NWOdWRr3y7gyH+TLHHkDvt5GLiM3gJ+vnTmFm4vvdLtUI
 V/OCZQWfIAjGM30kVk9GJ7fqBptMavuJpW4RRBbzGJ/8N1kyfN1ay1ysRocBRGZMx03A
 stgop1qTmcjbkC3UeVJ8yc5GTyIs9HVAdgf3a+P2QEBJ3EWQ4YE4z0irdBx1CyC2Sl7k
 fJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787828660; x=1788433460;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Iu0DYiwTBjZAqxBhxvWkXCRfBRIlAnV57KmL/gKnpn8=;
 b=YAeUvIwb9TW0GTH64CuUwHtAUUvxPy/9H2tGQ901Sv0uJlPogQv5ZjqnLc+BiXyQkr
 HgmA9sU2TfWnTpipMHCfNn9AbMmr4vq0o/HhM7bp5ixIUbC0hClA9NYkYlWcx0F2yVSC
 azx4StrOP6HhQgcFusm7w586YelsgRx3Cvch4M82gM59k46o/ZyetP6SwkdoN9VLVHhV
 BDZdCuxpThA6w0FBA/Q89FWovWd7TWaX8KGIxcUWM5OATfrj0TzzrMnlkToLpG1R+4Kt
 Godgqkpt3Q9ejPBcQQwtKWYvRkPWwaC39U1Muh/qzSX9Vcs9bRDUBtEooVOVfVygzEMe
 3AAQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlmAtFqL3Vq8G0i1t6jvlmeuUbczqvwI8yD8olMeBmbJTZt+DpmlyA+KH1dcw/fMi+qu8x68XUKfaQ@nongnu.org
X-Gm-Message-State: AFuF++ldSl3gnARCInoKUXkopZpsY6RcYdAB3FAAaGEQc+v/Mq9jct7r
 AtKKADMrfgX5ny+oUuPJuZrEY+heRkW0rX3YR+7uhKmvv+CCZb2gsGLSt0+6WfsQYqk1j05Rint
 ipWPwQCECl6OK3X4tiCr0r1d7obHK1yQbwH1ic76YkQ==
X-Gm-Gg: AR+sD12Z+akRexwI7S+KdDxIfCZPfpKG2QDgIf+dJWUVlf7Gh146sCurEAZMheKVOMS
 5aZQzalSUym/R7wOfT0JJApAFELwmcayj9X3wr5qJV4ulllxcWgq0Irja3mH1oePj1t9iUG7meY
 5MdG2J+eFLAQiKCRSL4lD7nBdc3wj0Nq8xJUAvrCZDamCBNYu3C4/paoA8xY0ePGD4Xkt7QbVA3
 RWFmiqbOhsnHlYVEAeUmh9O3EMSLfiiMANER2fJLUagD0RM9mRYgD//X3wWzVusOps2TmQ8zmHM
 vIK1vjbvCN7kiqadJX9a3mmQ8f+yBwfZiZVFl45/f752wSnXtDkBp2YDJfQ+du/x//SEgvO+pM0
 xE3YT3EMMbITdqIkrM2jzfQSf3GuV
X-Received: by 2002:a05:690c:6712:b0:80c:f6bb:565d with SMTP id
 00721157ae682-8573f8d4651mr64851937b3.19.1787828660205; Thu, 27 Aug 2026
 04:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <20260825040452.1322251-4-stephensportia@gmail.com>
 <CAFEAcA8h4JwFFxnTQwxgC2HPAE_YA8CnLSgJo6pdhFcJeLyGmg@mail.gmail.com>
 <CACYNXwKkh6zAha=ChX_456TF0pyaS-mQsdZsJ_JtP7Fq7EP2RA@mail.gmail.com>
In-Reply-To: <CACYNXwKkh6zAha=ChX_456TF0pyaS-mQsdZsJ_JtP7Fq7EP2RA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 12:04:08 +0100
X-Gm-Features: AcwNN1WRfq0VDNfulzacLodd4hvR8x9Yz0LzdqgafYzvSA0joHTAn0j5Gax1e2w
Message-ID: <CAFEAcA_PS9VWXh7tagR3_kYHJQwZkVzhfxNS=9c293B3mdp54w@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/strongarm: Fix dropped upper byte of ssi
 transfer
To: Portia Stephens <stephensportia@gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 27 Aug 2026 at 11:53, Portia Stephens <stephensportia@gmail.com> wr=
ote:
>
> On Thu, Aug 27, 2026 at 7:09=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
> > >
> > > From: Portia Stephens <portias@oss.tenstorrent.com>
> > >
> > > The strongarm model intends to transfer a 16-bit value over SSI. Ther=
e
> > > is no machine using this model with a peripheral attached so it is
> > > impossible to know what the intended SSI peripheral is.
> > > There is no in-tree peripheral support for 16-bit transfer, update to
> > > use 8-bit transfer.
> >
> > This is the strongarm synchronous serial port; the manual says it
> > "is used to interface to a variety of analog-to-digital converters,
> > audio and telecom codecs, memory chips and keypad controllers
> > as well as other miscellaneous serial devices". I don't know
> > if it's actually connected to anything on real 'collie' hardware,
> > but if it is then  I don't think QEMU's ever emulated the connected
> > hardware.
> >
> > The data is between 4 and 16 bits long. I think the intention
>
> In this case, how can the device transfer function know what the
> expected transfer width is? From my reading of the current
> implementation, there is no way for the device's transfer function to
> know what the transfer width the controller or guest software expects,
> only a value is passed, or am I missing something?

The device is just implemented as "I am a device which has a fixed
transfer width of X". The software running in the guest knows "the
device on the other end of this PL022 is specific device A which
has a transfer width of X", and it programs the PL022 with that
width X.

thanks
-- PMM

