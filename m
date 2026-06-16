Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01619CD8CA8
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 06:15:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZN4k-0004X3-PU; Tue, 16 Jun 2026 02:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZN4b-0004T1-Mg
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 02:14:58 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZN4Z-0006xk-G3
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 02:14:57 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6626cd98209so4328954d50.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 23:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781590494; cv=none;
 d=google.com; s=arc-20240605;
 b=GCbz0jvDzg/+HdEfEipJMbJkdWsBv/WFKPNQ/vKUeeIfxA0loYBqxzwmasdVgZOyaS
 QKUqTkdxqwYotTg8dFG26JaScQYitCLo6ffwGSzyAzCdDqblsiRe/a8xwVVhWpFUZW8x
 7BLBqz2n44OBKoQB6UBwUqjWGCrt5hw/KfQYs9tR4+LBBwvQa77luWqyD1n+YIoyr8Za
 F7wPNJR4Yp1TebSOd0MdskjzH8SzcJ14TTHv0v1zMu2ceYLVzV/GX/akbYDRU2XF/G1J
 QDMSu2zI9LFq00HwC7yrbkUAwr7vedwlxBtvAbPMg/i6fIf4dptDmcYzqjlk7UAxMI8c
 4iTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ghu/IoeU6SlJcGB5NCMH+LG0EJhSG/y5nN9JRSXPP94=;
 fh=chn0x83K2miJxxkLiA1605jodZDc769d6R6bJWmQzM4=;
 b=XiptGJdzv5RDVEA/KlUD10RawxjS1tCRWiMldizJ5slz3simnhN8iYlk9KLlzuLfA/
 MjJiaftkgOc9pGfQIakWrEY2tNb5zQ6LyRjkMxfBHLIfPVXxWs55Qkrp7BsJM+/B1X1R
 Ozu7T61V2ArwrmakySLOa21dq+DHzOgzYl/XwETXnK3Zy35NeSbeO0DcrfAF2c71raJp
 2FdtKRg9voJniw/JGQ4XxzhkQWGg1F21oKpo3lViOqwNSe/88ly/vH+d9eiGEblDZ7nh
 Kh+Wz12cLdbb+N1XN418NLiMmiv+7GqWpt+73Bq9ijM5zJLjPXSBqljrG1AIFueY3u6c
 OHqQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1781590494; x=1782195294; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ghu/IoeU6SlJcGB5NCMH+LG0EJhSG/y5nN9JRSXPP94=;
 b=doD+lloqUq7NsjdGExYWR2EDMJtFlYpPqKXZd6j6UReamyPnCxobq663E48c531hP/
 1DLxD8U4nv8tMeqP98fWEmt6SomLQ+IS6AKy/3Wtv842DKbSUgic4kXB1oF80NvCQ7qi
 wHM20paffT88fG0fo6TZN5f2OpfzBhEBpTEQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781590494; x=1782195294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ghu/IoeU6SlJcGB5NCMH+LG0EJhSG/y5nN9JRSXPP94=;
 b=RErp7gIGLHxESheIKesKAmyJ7OWYiP3fJYKZI1lKvNiADW+3yCDhQHHUgmgDIBEBYg
 qIj4H2AOHsPhHaMq/a67WIOhmBlqFKUu2xniYprZZPtsPtip7PcHnx0YD6kN+cDBr0RJ
 W82z5TGajKFPUG/6S4zATExeAs55U6vdbkGxL29gIs6Y6rpKtwQSFcWWB/4NSRt1ZRQn
 7z/fjZR3DIdkbDutSFmH5t2zG9vjN9rlO8Q0fBlG61MaZuNOkn7J6+lJml5EQ07kz2nG
 ihSnAfYa1bu6XVemWC65pFw7p2RJ2JdzWfGKER6sm69k/o9sjWwOjZW/Sqd1r1BL49Qa
 k6yw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+uVjaIxqm+uKoYMD5MlOaoslvIZYzOxTnNspTRtEJ5n7gkIJ3KN2luRm8q1LVerLhbLCwYPeWGA8p5@nongnu.org
X-Gm-Message-State: AOJu0YxGmYx1vXkUZBNagM6HmHFNHvGPdJm6cs2IasyUGlXpIdPTpsIW
 CYdx34R7gq1upTfIJcFRldYPDerLNIRrCvVmBztr90IWMsBjM/6LQoA01c6HKTXRzGJ+m7N+tM6
 z1N02ljFYbcpVBB2Exjgx6XBLR70YYwY=
X-Gm-Gg: Acq92OFFDWBEHBdde1KvFRbtYhBvKnnGPDHqpN/kEwlKzCJWcU8iG4upRObXLD9/318
 VxIupQd5y9xlJ9B4KTgP7IbjjdgDs8UNnTYPVsyV1PECL9zYEosszDT1HqEsiNZl7fvM0RKcZ8B
 SBWkWQITfibK9I90nwEIUPqPxEVdBTj+vWnbMNIiFgXg5vm533vZQXmoVyBnKSTJiLyM5tRdUpG
 /JffT8SWx1nLnb6io6TLOxA86f2ySyWuRLRMIM2jSZanemXOIUBjKiMTqQOs0CEhklwzIQzuDp4
 5IjqbZSHr0eThrmQSzk7rq0WR/EN6VFrlZnBkwn/H4ZHe2ox9FFJs7/WUYcYmmJDJZxX5fXeu66
 BMLIvYnUiDwlYC+3r4WBW2H+S
X-Received: by 2002:a05:690e:1444:b0:660:5c10:deed with SMTP id
 956f58d0204a3-662b616900amr1534701d50.55.1781590494444; Mon, 15 Jun 2026
 23:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260603065859.592063-1-joel@jms.id.au>
 <20260603065859.592063-13-joel@jms.id.au>
 <CAKmqyKOYeG24747aN-OyOCFi-Knb3vc5E0FV2PM-FstCmf3Xgg@mail.gmail.com>
In-Reply-To: <CAKmqyKOYeG24747aN-OyOCFi-Knb3vc5E0FV2PM-FstCmf3Xgg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jun 2026 15:44:43 +0930
X-Gm-Features: AVVi8CfUnkwXtytYjrmcjeYD2biQsxmAoOt1ge56ktua4LY6enzGXHKCKmdozco
Message-ID: <CACPK8Xf4LNGg7DbqW+Rkf+jWqE+mgUymTqyqKTiv3=n7wVGw1A@mail.gmail.com>
Subject: Re: [PATCH v8 12/12] hw/riscv/atlantis: Add some i2c peripherals
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 15 Jun 2026 at 21:23, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Wed, Jun 3, 2026 at 5:03=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrot=
e:
> >
> > Add an I2C RTC device and a temperature sensor. These are not present
> > on the board but help for testing.
>
> It might be best to leave this out, if these aren't on the board
> should they really go upstream?

Without something to stimulate the device we're not testing the
designware model, nor the integration into the machine. IRQs, memory
maps, as well as the model's state machine all get some coverage by
having devices present. The specific devices were chosen as the
existing test kernels have drivers built in.

We did something similar with the aspeed arm machines when adding them to q=
emu.

Cheers,

Joel

