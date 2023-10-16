Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B062CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 03:46:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsEYo-00031z-QF; Sun, 15 Oct 2023 23:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEYn-00030z-3c; Sun, 15 Oct 2023 23:46:29 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEYl-0005Vu-IQ; Sun, 15 Oct 2023 23:46:28 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-49b289adca9so1569550e0c.3; 
 Sun, 15 Oct 2023 20:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697427986; x=1698032786; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mbB3Ku0FBInv3CsQiiwijSGD2zWc7sbvbA/76if6b6E=;
 b=kZ+X2MGUgsiOreqfueQguq51yqSK7zkD0mgO500ww4ISDrS6WwBDY37xSzqb3d9ghL
 sIvjvNZksDID9uQTIY/bnpjkSAG/2szBwb+iUq1I3SebzWTDtVrqL5a9+jFiy2VgJQqt
 J1nJaST4qY3taUNwsypuPaIDGka0wmtdkLjxTmUrzrIHS6t17yk5Qc/Qxoow5ILBDZrM
 cse93wRdzfAHXkYWSLvnDWJgHvToHOkc0LHtkns+ZfW4PyTQnxOeAqK+xGYG8R+30FUw
 3PN+a+7Ei/CbMb40mRctit1KVpGLTCzhvY2qxHSjuxZS7r7OWutdAlqVfdc4ortozzMI
 YHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697427986; x=1698032786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mbB3Ku0FBInv3CsQiiwijSGD2zWc7sbvbA/76if6b6E=;
 b=wy5tPBRRUaVgFKvQO6nqmP5YgVfd+MHivTPAiYZgrwmTMDBIz1fBm2htuLCALgjUwi
 FZg7VVY7LMD9jeUlveMKoXLKRmoGDmSnK7YY3B8nibhnjAqSIyQlnYvvTs4D6VAAdxE3
 VksJu2SAlYEK7lxZrbo9DguCLuTWGU1fhuOajLfafBu7/A3XNkq4ERNH1aAM5aRhOv0V
 0WyFDs6XKgppRCgHe/n8BjXqHueHCagP7jXoOC4PFIeHyjeBhRSGTJOrVgj+O+LJC3ba
 3KRT4k5alO+ruB1qbx6ABU3qiaGjxxXgebAbeX+PMZc+bl/JO6Jo5Dg4YxlCn1F9HN6k
 p4tQ==
X-Gm-Message-State: AOJu0Ywe8RUtqo4CnXBA28Yxak6d4+BCAkXgoP0cRFdp8TYXPJNhZNmW
 WkVXKQPiizPD4XEsi5MiKZqLH6VADplBLRokV+w=
X-Google-Smtp-Source: AGHT+IHnsRgb+w29wAcj/ADulZiCFZpEPc2yZVFn2zJ/neK4KnJhkqvd35OiFWBjuGHwtqHOiSl1ddB9wnvwcPGbw28=
X-Received: by 2002:a1f:e404:0:b0:49a:1a56:945c with SMTP id
 b4-20020a1fe404000000b0049a1a56945cmr27099496vkh.13.1697427986191; Sun, 15
 Oct 2023 20:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-5-rbradford@rivosinc.com>
 <89b2bac3-56c1-47e3-92d7-0907d0bf0ecb@linux.alibaba.com>
In-Reply-To: <89b2bac3-56c1-47e3-92d7-0907d0bf0ecb@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 13:45:59 +1000
Message-ID: <CAKmqyKPBe8dgGCHuy5AWdQAym21ntYvAajsdQ1XZM9bKpXe89A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] qemu/bitops.h: Add MAKE_32BIT_MASK macro
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 atishp@rivosinc.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Oct 12, 2023 at 6:53=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibab=
a.com> wrote:
>
>
> On 2023/10/11 22:45, Rob Bradford wrote:
> > Add 32-bit version of mask generating macro and use it in the RISC-V PM=
U
> > code.
> CC Richard
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> >   include/qemu/bitops.h | 3 +++
> >   target/riscv/pmu.c    | 2 --
> >   2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> > index cb3526d1f4..9b25b2d5e4 100644
> > --- a/include/qemu/bitops.h
> > +++ b/include/qemu/bitops.h
> > @@ -25,6 +25,9 @@
> >   #define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
> >   #define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_BYTE * size=
of(long))
> >
> > +#define MAKE_32BIT_MASK(shift, length) \
> > +    (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> > +
> >   #define MAKE_64BIT_MASK(shift, length) \
> >       (((~0ULL) >> (64 - (length))) << (shift))
> >
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index 7ddf4977b1..360c76f63e 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -24,8 +24,6 @@
> >   #include "sysemu/device_tree.h"
> >
> >   #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> > -#define MAKE_32BIT_MASK(shift, length) \
> > -        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> >
>
> We can always use the MAKE_64BIT_MASK instead of MAKE_32BIT_MASK.  And
> MAKE_32BIT_MASK only used in target/riscv. I am not sure  whether this
> patch will be accepted.

Good point, can we use MAKE_64BIT_MASK instead?

Alistair

>
> Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Zhiwei
>
> >   /*
> >    * To keep it simple, any event can be mapped to any programmable cou=
nters in
>

