Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F956C531F9
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 15:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wmvlX-0001pp-SS; Thu, 23 Jul 2026 11:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wmvlW-0001li-A2
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 11:55:18 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wmvlT-0006ML-Hp
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 11:55:18 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-81e9d8f3289so7830407b3.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 08:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784822114; cv=none;
 d=google.com; s=arc-20260327;
 b=gVzpLZcCw0/1l2j1qmjP6CadDopdrfzYX74GJDR6ynGSDp8jozDGZoNPDlc7z93HrD
 oCs2d7mFhmxvwk/ns6utK34HGKAFZcRkO/yvGFf3u4ufk53srIPJ0YlaIMNAJH7lus44
 QW62gDR85GF/XrpB+6Nv1gPR9zGrHiyADlGL+9DcYA0nlHbXIeYTQflt8bJbYVwdl+sX
 Lyduy9AGaK8b1MrU6wPpQR0ZGGM+026Vy5eRiPaqwnI7PKZBpVx1d7Es/YblBa0pie/f
 g3ohIDPFViYJL3DsGBX10XbSYnsKOP65FIHJWEJC2/Pw06lPbgA7ibJICDjEQovaqkmo
 s8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pJwSn3ukjKM+JqNAYqgEihjr16ONhDRfENkHSdoCMqw=;
 fh=PMULw9YSg1lE/pelBperRIwmiJ6rDIg8B2NXNiUjfwI=;
 b=ayr9zpCJd8424fd6hsWxlsZP47ZrzWywNTgkZzMBnARVPr4XFH162wyb6DPXWkW1CJ
 ZjXHg+PdQqklXKA3OknXRb5axtJKTFjX55YI9h7CnqBqpw0Rl2fn3qxABy+y/Bi04xZR
 NTSFczFuVRvSYzydesYeRWLKHSddt7xMGXUKNGaNDP45MBuKZj+jrXjRp84GLa+On/gq
 ssFglX6QOO14qnMXDcs1gSbDDiD+YjoiuLn53IsXIyHZ1q0UX0rKNqdxHV237JUYUDv/
 bpriMgkpHsm/GB72DOQkt/TC+H+iK0cEwj84wxW/YIbsNMxBguOhjSznl1vG2SXuX9Vd
 9TkA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784822114; x=1785426914; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pJwSn3ukjKM+JqNAYqgEihjr16ONhDRfENkHSdoCMqw=;
 b=XUcBM809ggQh0g1NUiPKP4UXlnS8JHGiTLC6NAXVdi0szDfqhScm9MQk/JAIWubncY
 G2+fLdDvP6tpNmmMq5Ie/uGxVJzChgFG9crQ+3RD3TpW/BcUk9lvSDsBeyEArM//sfYK
 gTp1ZGu0AQGxWxEVQKsopiZJNiiufzg85RvjwAHaCbvlAfbY5MVbUw67seO0mQR1nEsw
 xHbIAqCYeVHVOKhgH8KtbXva1pW2LXtkf++Xl4LXoBjaq/5/eFjTA/FcOYz/70/a30bi
 uKHTJ6Kxr3lBGdbpzcTRD5kEs2bznrdP0ur+gRrw8QU6YmekkK6UHaXzuj3BL+dhLCrd
 6OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784822114; x=1785426914;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pJwSn3ukjKM+JqNAYqgEihjr16ONhDRfENkHSdoCMqw=;
 b=Fsa+ZYY6pvvIz8iNGVPjkqxD4ab8X9kPFzZn51InmrLkIL4cCybkJYYlHJ1aMP4D2r
 HAluy1WsZnGMRjFdI7kiFjJlDOx8IFxa9g5Zr5e1Yxl1jJJjTjajQJd27aH9LLFlb3P8
 k/fMA/ZQnmfV7CGM0dp89cQ49SocfCSK5FPQlPg0nixfp6rU8dIgIa9kGG+8dUqjCUWL
 GgEf6ytNcEesc6it29NFnfZQgP2amxKYyUJsNaop2gL/Lo09G5XyWQKjK9CAem/H4XOL
 2Z2stShHrxufRCQwAUHph+TUtaMZySbJOO5zEbrBmLHbccQO7J+v6b66l2Vgf6kSnmJa
 OtdQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqUfny4IN5E6aqplgIKUP/59LSMcJWYi6yUpyFgFnkYSt6+oCW7bIJ/3gsp6ny8bwV45hxpG0JfHLv2@nongnu.org
X-Gm-Message-State: AOJu0Yxd9JSktD0a7mVb42peCLrUqIJjCOs4Gmf+0JgI/K1hRtPUGCCF
 fzBz2wiTmLCc0t0NHISt22+8dz6q4h+b7ADZLYhhnaGEDc5EQW6LrpJxJLrqcuUmDVqw9s6KA60
 Ts4jCxfGp4TyepDGO8jikL3VN9tQiVsY=
X-Gm-Gg: AR+sD11qLPQcRXbb6MFK8rRopB9kqno/PFcKHSqVFGstYYsvP5z8xsDNjQw+O12n7b8
 glVVQEc0H9BnMeZ1R8itJVBCJnYscQgUwmuFqEyfpz88xv3/RoRFoBPGGoyOJufr4NUdnxflcZu
 ho+edBqfFGvqYjQaRr7tCdWCEEmhBjZK+wCC8q5o0wnbkuxaQAvDTcgCBXhBD+Fdi+ufN6U8uNf
 CTgxEhk3+O45kFmfyks3gZyhF+up+Z64wcsUcEcxoGK+w2u8Qk5G1X+yqGx1JI=
X-Received: by 2002:a05:690c:7093:b0:81d:6af3:bbca with SMTP id
 00721157ae682-81f4c37a8d1mr11663757b3.54.1784822114011; Thu, 23 Jul 2026
 08:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260723151853.2143177-1-bin.meng@processmission.com>
 <20260723151853.2143177-17-bin.meng@processmission.com>
 <20260723-seducing-plunging-ef7d4c60d917@spud>
In-Reply-To: <20260723-seducing-plunging-ef7d4c60d917@spud>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 23 Jul 2026 23:55:03 +0800
X-Gm-Features: AUfX_mza-ENc2gHXL57pFrPB1UXge9cWPqvHb4WnBi1nO7WAOzspKzKmMyv5-EE
Message-ID: <CAEUhbmVYdwUbp_y8TKZggoz7oNRWo7+sfe1Q+vbqApawp7jEmg@mail.gmail.com>
Subject: Re: [PATCH 16/26] hw/rtc: Add PolarFire SoC RTC model
To: Conor Dooley <conor@kernel.org>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
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

On Thu, Jul 23, 2026 at 11:29=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Jul 23, 2026 at 11:18:43PM +0800, Bin Meng wrote:
> > The PolarFire SoC exposes an RTC with binary and calendar modes,
> > programmable prescaling, alarms, and wakeup and match interrupts.
> >
> > Add a standalone device model with explicit MMIO handling for time,
> > commands, alarms, interrupt state, reset, and migration. Add its
> > Kconfig and Meson entries and list it under the PolarFire SoC
> > maintainer section.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > +
> > +#define RTC_REG(offset) ((offset) / sizeof(uint32_t))
> > +
> > +static uint64_t mchp_pfsoc_rtc_get_count(MchpPfSoCRtcState *s)
> > +{
> > +    if (!s->running) {
> > +        return s->frozen_count;
> > +    }
> > +
> > +    return s->tick_offset +
> > +           qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;
> > +}
>
> Just to be sure, this is done to match the hardware's behaviour of
> resetting the count when the device is power cycled?
>

Yes, the rtc_clock + tick_offset scheme is commonly used by other QEMU
RTC models, such as PL031, etc. It is not specifically intended to
model the counter being reset on a power cycle. Instead, it maps
QEMU's clock source to the guest-programmable RTC counter value.

Regards,
Bin

