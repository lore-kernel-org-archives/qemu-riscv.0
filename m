Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F05C02181
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 14:34:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tabnn-0002y6-1i; Wed, 22 Jan 2025 09:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tabnO-0002ur-TS
 for qemu-riscv@nongnu.org; Wed, 22 Jan 2025 09:33:31 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tabnN-0007yv-3X
 for qemu-riscv@nongnu.org; Wed, 22 Jan 2025 09:33:30 -0500
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so12424892276.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jan 2025 06:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737556407; x=1738161207; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILzJBeVeOJaRt3x33tApk0oBq1fwp9tG/YCqca+lHK8=;
 b=ufCx//4E5Y9H3ZCQYoPBxaOt7IIKlbGmheuvuQZzDOzP7kiUu13bg8XdtFO1eMOjnv
 NFUxa8Gb13InhDYulMvrAn4gkta2IZnEIuEZx+Jo8AnY1hXMq1CALqnUKvaQecPh1w8q
 Oq37NJ1FW8yUPNOif46beW5GpZhUjx6dHwphB9IoIxuT8Ki2/b5Y02RE6Rv/b8GHL9Qm
 TxbjRXULKu5/sCCbmuVl57ezWycO1DGqoD8OufZUcKOZaOIIgQmcZ4IaPczo0n6q9q6h
 p8a0WP5aeD6rPG5vRtLXXc1aJCMX/z5RpW+jxnnHysFBmtki7+CVNFLboA/QYJfFWhuz
 C79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737556407; x=1738161207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILzJBeVeOJaRt3x33tApk0oBq1fwp9tG/YCqca+lHK8=;
 b=c0LH6/HdU/SSkXxdl5L+XNzOBkqa0TPZtBGBqD5P4i0BSF8/Cx4OuTQtp4KYA1KDBF
 v7r/9EmZ/RbPKX+M7pAGkGYP8RtE4+65CyjCsyv9+gqrV++6loi9VinxGNVPMl51m9ZA
 B4Q1b1mab0gpzs+y0ZxSxd/1hxO/5W5f2uEs9S00z6jM411lUUAX40L7yF3Blppl7FZU
 zEe8C/i5SIrlRYKNZlJ4tG6eyb20uY95mnoK8EfeTCL0jJ9aNqimSX/2u7sH+6awddoL
 oDF5zKQpH8O7a82WDodYnbjwqMI1caWBmYAIZ/wYyqvehgX3IbBbfSwHEEj0AejMyTLY
 m70g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZQAB5RTFeHLwm3cmxUPR8JUhXDQ/mt2ZxlkGmnQlxKbL6Hk0EYdYGrzT0T+CvGwSbQoEqNnln9tH8@nongnu.org
X-Gm-Message-State: AOJu0Yyb1u9sN4+aUs6n2hjN6lLiJ3nalnOrYoSTLnf8+HNlebwFWu88
 qnZ2DspNFG4Twyo4KYHriPA7pN2s5XpGEQ+cf/HXVeZ9wIlntYKIKkuG3ZVeJ8UrOvtVyKk87NK
 FZDepK2+swfWdUNIl/DNiXF26rvACtN27hMSswA==
X-Gm-Gg: ASbGncuAPO2vXPLy1yfijcH31hy1MUC6Wxc+lvRac3QAyzwY05MblVnlCvsZi0MLvwS
 atIzVHb1vp5ywAtWlb4WRg3WUVhK3mgdrlO2mVQ56DHkeAnChPQk0
X-Google-Smtp-Source: AGHT+IFVL8AtuKGf7k45657vuRUJUq7An+jskfJi1SyJiVO60AbiRFok5TWAQiQPPSowUpindKJtIsMrlbu1TfeabG4=
X-Received: by 2002:a25:d34a:0:b0:e57:d22a:1914 with SMTP id
 3f1490d57ef6-e57d22a1a98mr9243264276.16.1737556407155; Wed, 22 Jan 2025
 06:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20250122103223.55523-1-philmd@linaro.org>
 <6393ca88-0613-415e-8178-18a34778b2ab@redhat.com>
In-Reply-To: <6393ca88-0613-415e-8178-18a34778b2ab@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jan 2025 14:33:15 +0000
X-Gm-Features: AbW1kvaNKBFSOoDang2ocA2MTL_mQ3HqVlrsCrKIuJElqBfV3yrn1D-l1GHiPFg
Message-ID: <CAFEAcA-+9xhH+gXWGfN9bN=rnsShyRs0i+Kd0NDfMYrSNVbF4w@mail.gmail.com>
Subject: Re: [PATCH] hw/boards: Convert MachineClass bitfields to boolean
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Wed, 22 Jan 2025 at 12:36, Thomas Huth <thuth@redhat.com> wrote:
>
> On 22/01/2025 11.32, Philippe Mathieu-Daud=C3=A9 wrote:
> > As Daniel mentioned:
> >
> >   "The number of instances of MachineClass is not large enough
> >    that we save a useful amount of memory through bitfields."
> >
> > Also, see recent commit ecbf3567e21 ("docs/devel/style: add a
> > section about bitfield, and disallow them for packed structures").
> >
> > Convert the MachineClass bitfields used as boolean as real ones.
> >
> > Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   include/hw/boards.h        | 14 +++++++-------
> >   hw/arm/aspeed.c            |  6 +++---
> >   hw/arm/fby35.c             |  4 ++--
> >   hw/arm/npcm7xx_boards.c    |  6 +++---
> >   hw/arm/raspi.c             |  6 +++---
> >   hw/arm/sbsa-ref.c          |  2 +-
> >   hw/arm/virt.c              |  2 +-
> >   hw/arm/xilinx_zynq.c       |  2 +-
> >   hw/avr/arduino.c           |  6 +++---
> >   hw/core/null-machine.c     | 10 +++++-----
> >   hw/i386/microvm.c          |  2 +-
> >   hw/i386/pc_piix.c          |  2 +-
> >   hw/i386/pc_q35.c           |  4 ++--
> >   hw/loongarch/virt.c        |  2 +-
> >   hw/m68k/virt.c             |  6 +++---
> >   hw/ppc/pnv.c               |  2 +-
> >   hw/ppc/spapr.c             |  2 +-
> >   hw/riscv/virt.c            |  2 +-
> >   hw/s390x/s390-virtio-ccw.c |  8 ++++----
> >   hw/xtensa/sim.c            |  2 +-
> >   20 files changed, 45 insertions(+), 45 deletions(-)
>
> So if you are touching all these files, why not go with an even more
> meaningful rework instead? Flip the meaning of the "no_*" flags to the
> opposite, so that we e.g. have "has_default_cdrom" instead of "no_cdrom",
> then new boards would not have to remember to set these ugly "no_" flags
> anymore. It's quite a bit of work, but it could certainly be helpful in t=
he
> long run.

Well, that depends on what you think the default for new
boards should be. I suspect these are all no_foo because
when they were put in the idea was "all boards should
be default have a foo, and 'this board defaults to not
having a foo' is the rarer special case it has to set"...

-- PMM

