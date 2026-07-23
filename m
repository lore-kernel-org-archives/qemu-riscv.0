Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632B0C531F8
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 16:08:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wmvxv-0004Ie-UJ; Thu, 23 Jul 2026 12:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wmvxt-0004Hz-EK
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 12:08:05 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wmvxr-0007WG-3c
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 12:08:04 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6689f36ae56so996300d50.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 09:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784822882; cv=none;
 d=google.com; s=arc-20260327;
 b=KcotQKN4lpNFdnLyBuwAWW4bm2hygtRmIsq8Kd6X53VqS6DxOeO/hjUTofRRD9iBP/
 +jP2oLtoVZuG0xyAySChOALrUE2sbRugDRRcXpRQcxiwtUVnlL141Uo922kxYUPMv1Ut
 vPcEI3pK1QjbydaX3m0zpShDSCKVB9ySuUsFlk1jGV+AhjgSe5egdwywwTDrRcRoLC71
 sm9iBIY5YaOGO9QIh9BHD5qXQbyuA6A7mMkuL9exSuDb+F2Tk0RFe0gyMF2FP4PZy3lE
 SQWF6IRuk2uTXwflSw064oXZY6DnRnuf6u0Hp00kAeG452VqBNzRse+4C9YIxUtH6emj
 KdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Vp/UAfBxtrNkqiFGWr8HdOUPysHpaod4R8kEC8Gjb40=;
 fh=sEYqtYJ8qSn8wbGRM4Ad4C1Ksm88nX010A7ZoA1pFHc=;
 b=M4eb9vmcjLaQxX+9jc/eLBDdIF2Bu+3Qj51MUaH7WaoL8pfjQRyKEwZ2Z3qg3E/Y9x
 wHcvcCw1mxc2jay5rhOndZ8cP6R+521xkZHWhaz1t8xSjfAYIobQHwHNifw97HoiYAUS
 8XHW+elGmxz/OwoEgCHaYfELmE7WtQ/qw0mjYx5axtREi6MQKPOHsbC1UTYiim1J9Fx8
 ai5D/OYVJCgW4DeZZiM6M2OPUiMHK+0YknbGDDjKpJWbho+mnM9wMagdU9VFh748HZ5y
 SBi8GVRirJ1zwYgXdWFP1JcUUnthLPo146Vbacsh8x0NUNQeJLiomDlnNknBCy8/RBn9
 vvwA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784822882; x=1785427682; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Vp/UAfBxtrNkqiFGWr8HdOUPysHpaod4R8kEC8Gjb40=;
 b=BMMgzEHem2ZR4VM+CGt+ZK9keLlzVzKSXs1wiLRL2zK0t0cP4VL3y1FtdKsfrxZ43o
 vWAiLnHFYoFodz0U+Bb1sjlqI4LKtZwpTBi+LEZG3hxzwvYWZ3K5mUY4uRZUCf/+gEzS
 z64eCk5+4yMGauFlF7/znd30P1RiMwkN+/xosrNrAV01/LiIRu620qcxsIkmZDYVjzZg
 cB70Zv1I6wbPk2LMAri7WmcVD+SaLw7RUitkSAgvsiyhw3ErwX416l+/NwND4IszGuCi
 /B81mDyMLlw8pchxZgkn9CLSzOOPmMUqEiWw7pKN8ugO4iKBbHwdqThov3CjwV+jlhzz
 4gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784822882; x=1785427682;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Vp/UAfBxtrNkqiFGWr8HdOUPysHpaod4R8kEC8Gjb40=;
 b=XtEKoAfnFXbyD1qE7VTHCjl1YwPMPjcKU3J/gy6lbc/GR1IncneKhoo8h+KQDCdM00
 GxBwrxi54hSRqgFh8l2F9g7fnk6lordKnkWVBi7RrjkDzuSYbAgonIpLCc0fVs2BKlZt
 l+ptXZJ+UwJTiSKnMJZWbp0mxrvaQ2I9MyUDVtrwlC0IvmSz7eqI1pvRTHIKiaZKCe+r
 6/mj6zIe7W9OkafHXBz0Xz5lL7m8vMwnSzPyHCBTQ8lScuGbHSYO7MiNsyFk60U+pCCm
 DVBQFKEEsX+aH/yd7wXPWf+mVbVF305u4yDAAl4jAyTH11WR09PXYuuJlTu1E84ZvlIa
 otCQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzwZGeZI1D/VZGyMzlFzaU4mFtilcQboquB/oCTL/wnslzqRXvmXZe0nd/kY04CGbz831OhS2gEA8o@nongnu.org
X-Gm-Message-State: AOJu0Yxqv0722yldJYs/p/BuK9qWvyajFiTblZ8WMziE/JSdm/+/62mb
 dfqoh6GBtWAeoTzzBfCDqHHnCUcdl9x5y/cUaQ9+CrYM/oTr9KU47nbV/giQG/LNrOnT4Gd5qji
 59wFxgT6Bu6RwDx6gQTY1QnHLqXqxxv4=
X-Gm-Gg: AR+sD10vJuZD3Ywli//G6T5fIQyqz5U3JE61a/8FXpe94AO8Ztvy4o8JlSgo7XZDQw6
 /dgQ9U93cHjXL6MSG1MNpUOfZJQp20fWZ7tMxOpZCQwFhqFPtAE3fizkrK9YOSU5xzvBFGeoUsq
 jSjLpzSYoO2oRKSWUfj/70dXUqlqB+qaQMMJHq5Y8WN/uQbWm4OjNJwSWtwi1VQn9im44L1SuOJ
 Da87i7TBj+URcaTMmakjniFiIMbRbGMmuSnll/jNE9xCp3mxktwuol+gfAARRM+TWrr6yYs
X-Received: by 2002:a05:690e:1583:20b0:667:d808:af7d with SMTP id
 956f58d0204a3-668a4bae19fmr849846d50.14.1784822881671; Thu, 23 Jul 2026
 09:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260723151853.2143177-1-bin.meng@processmission.com>
 <20260723151853.2143177-17-bin.meng@processmission.com>
 <20260723-seducing-plunging-ef7d4c60d917@spud>
 <CAEUhbmVYdwUbp_y8TKZggoz7oNRWo7+sfe1Q+vbqApawp7jEmg@mail.gmail.com>
 <20260723-sliding-plural-bf980dc1e567@spud>
In-Reply-To: <20260723-sliding-plural-bf980dc1e567@spud>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 24 Jul 2026 00:07:49 +0800
X-Gm-Features: AUfX_mx_3-qV5-6YKA0203tBzlND2xWQFxjH3QqwMXHNVbrbPC2l9RaiC5nat74
Message-ID: <CAEUhbmUVQ5M4Gw_viYq3BShCYCuA1HCDufKy9xV+TmfWKbpv8w@mail.gmail.com>
Subject: Re: [PATCH 16/26] hw/rtc: Add PolarFire SoC RTC model
To: Conor Dooley <conor@kernel.org>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, Jul 23, 2026 at 11:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Jul 23, 2026 at 11:55:03PM +0800, Bin Meng wrote:
> > On Thu, Jul 23, 2026 at 11:29=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > On Thu, Jul 23, 2026 at 11:18:43PM +0800, Bin Meng wrote:
> > > > The PolarFire SoC exposes an RTC with binary and calendar modes,
> > > > programmable prescaling, alarms, and wakeup and match interrupts.
> > > >
> > > > Add a standalone device model with explicit MMIO handling for time,
> > > > commands, alarms, interrupt state, reset, and migration. Add its
> > > > Kconfig and Meson entries and list it under the PolarFire SoC
> > > > maintainer section.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > > > +
> > > > +#define RTC_REG(offset) ((offset) / sizeof(uint32_t))
> > > > +
> > > > +static uint64_t mchp_pfsoc_rtc_get_count(MchpPfSoCRtcState *s)
> > > > +{
> > > > +    if (!s->running) {
> > > > +        return s->frozen_count;
> > > > +    }
> > > > +
> > > > +    return s->tick_offset +
> > > > +           qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;
> > > > +}
> > >
> > > Just to be sure, this is done to match the hardware's behaviour of
> > > resetting the count when the device is power cycled?
> > >
> >
> > Yes, the rtc_clock + tick_offset scheme is commonly used by other QEMU
> > RTC models, such as PL031, etc. It is not specifically intended to
>
> You say "yes" here, but the rest of the sentence is addressing something
> I did not ask so it is not clear if you actually mean that this matches
> the hardware's behaviour.
> Could you clarify please?

I mean yes this formula is commonly seen across all other RTC models.
The resetting of the RTC model is not controlled in this routine here
but in mchp_pfsoc_rtc_reset(). Currently the counter is reloaded but
maybe it should be left as it is and just initialize once.

>
> > model the counter being reset on a power cycle. Instead, it maps
> > QEMU's clock source to the guest-programmable RTC counter value.
> >

Regards,
Bin

