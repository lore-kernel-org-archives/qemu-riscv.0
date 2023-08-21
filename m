Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4882EE49A8
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 17:54:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qY95m-0008Hm-0A; Mon, 21 Aug 2023 13:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qY95j-0008HA-AT; Mon, 21 Aug 2023 13:53:27 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qY95h-0000p1-62; Mon, 21 Aug 2023 13:53:27 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7a257fabae5so600903241.2; 
 Mon, 21 Aug 2023 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692640403; x=1693245203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9V0JYwNJGD/Q1F4fHVf20yyX7lrdyu/+kS2h/lvFlPw=;
 b=RFHIuQYJ7mVv1RUhRaeL77CUYZrcjTyV2CCwVQ8TCez7yteVecloxaFBTIxRkp5O/1
 QecEX7z+vnx7NDm4EU15nzvdS0VqLPNEtMBzKfKM/mrBmLQoUdhguemDpMa5qSDtQqIs
 PAzrutdnTQwg9SJX6RTylUM+6Ljz5vjhEkpx5dR7yK+tnMZdW/imSwtCjFdE5+qJeEpO
 yKBCdqNoiVpZDcS1zF5Fxzb7bL1RsZBp3BLN4Xdz0xvDvgVTLa4iL9+JfYisYy6kt+so
 N7BB3918t1gRk8CcDXbLWGp1gg7zLK+Fm0gej6TsnWCZS12zr16JlguCx3UHeAV4l6in
 8fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692640403; x=1693245203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9V0JYwNJGD/Q1F4fHVf20yyX7lrdyu/+kS2h/lvFlPw=;
 b=WwyhZLEk9zDOPt3vLIismAqJFY5vSX7/qpAnKczkw20r1pNE+tAOOYuHfRSXVZcj8s
 V2PwHsjg9XamgknKktibNPhy9H5iPPfPGIkBIQP/RY2Xj4dDDXW+R+/LEJnD4yDR//5N
 nUqtuQTrnWRy+y0Voe2iaXz3NX8CaOiV1UpE5j/n4nJd5h0yX0N7mk/u7CyN+jK4DaLK
 zW9wcvwjiGiv7SC2HZh/hqhdHOpPT0OdvgWSvmUvANnLIhAAfeSMtnSEu9YYlWjkeYZ/
 vVv8rRKQOzNAtS7VJ1kvxVeVC4Ew2DEVReSGdQQK7YdOqXh2hqlXqm5Yyi3tdJkxPRGx
 iNUA==
X-Gm-Message-State: AOJu0Yxk9yBkt7dBJjEcD0um6UP4qGSO7DHe5R9Q4qUOdD4nS9wo9QhT
 7+ZURnLN3KDqWLG2/nUx4vqnkFEtCTcQs/I8i7I=
X-Google-Smtp-Source: AGHT+IFvubk8PvL/NDxy1UShka18AzmG181cva5pqrV5I6srl4QVKNIkNkrEZV9No3JhekHU6pgw3UmkGZdl7HfKL44=
X-Received: by 2002:a67:d09a:0:b0:447:6c24:7d86 with SMTP id
 s26-20020a67d09a000000b004476c247d86mr5612562vsi.4.1692640403203; Mon, 21 Aug
 2023 10:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230728082502.26439-1-jason.chien@sifive.com>
 <20230728082502.26439-2-jason.chien@sifive.com>
 <CAKmqyKMX=Q3+kdaKAJrQHeya7ctnyt0HSt=NUQWUAOj9JEPZ8g@mail.gmail.com>
 <CADr__8rmCu9F2ktxYGtZfUeD_z+pNVa4KKsZ8XvxxVGmMJfrcw@mail.gmail.com>
In-Reply-To: <CADr__8rmCu9F2ktxYGtZfUeD_z+pNVa4KKsZ8XvxxVGmMJfrcw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Aug 2023 13:52:56 -0400
Message-ID: <CAKmqyKPCyx0fbiBzFDACDPHGYAdkjBJgcqHCVPFx0ETzRYpk3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc: Make rtc variable names consistent
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Mon, Aug 21, 2023 at 12:15=E2=80=AFPM Jason Chien <jason.chien@sifive.co=
m> wrote:
>
> Ping.

This has been applied to the RISC-V tree. It will go in after the QEMU
release freeze is over (probably a week or two).

Alistair

>
> On Fri, Aug 11, 2023 at 2:25=E2=80=AFAM Alistair Francis <alistair23@gmai=
l.com> wrote:
>>
>> On Fri, Jul 28, 2023 at 4:57=E2=80=AFAM Jason Chien <jason.chien@sifive.=
com> wrote:
>> >
>> > The variables whose values are given by cpu_riscv_read_rtc() should be=
 named
>> > "rtc". The variables whose value are given by cpu_riscv_read_rtc_raw()
>> > should be named "rtc_r".
>> >
>> > Signed-off-by: Jason Chien <jason.chien@sifive.com>
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> Alistair
>>
>> > ---
>> >  hw/intc/riscv_aclint.c | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
>> > index bf77e29a70..25cf7a5d9d 100644
>> > --- a/hw/intc/riscv_aclint.c
>> > +++ b/hw/intc/riscv_aclint.c
>> > @@ -64,13 +64,13 @@ static void riscv_aclint_mtimer_write_timecmp(RISC=
VAclintMTimerState *mtimer,
>> >      uint64_t next;
>> >      uint64_t diff;
>> >
>> > -    uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);
>> > +    uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);
>> >
>> >      /* Compute the relative hartid w.r.t the socket */
>> >      hartid =3D hartid - mtimer->hartid_base;
>> >
>> >      mtimer->timecmp[hartid] =3D value;
>> > -    if (mtimer->timecmp[hartid] <=3D rtc_r) {
>> > +    if (mtimer->timecmp[hartid] <=3D rtc) {
>> >          /*
>> >           * If we're setting an MTIMECMP value in the "past",
>> >           * immediately raise the timer interrupt
>> > @@ -81,7 +81,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVA=
clintMTimerState *mtimer,
>> >
>> >      /* otherwise, set up the future timer interrupt */
>> >      qemu_irq_lower(mtimer->timer_irqs[hartid]);
>> > -    diff =3D mtimer->timecmp[hartid] - rtc_r;
>> > +    diff =3D mtimer->timecmp[hartid] - rtc;
>> >      /* back to ns (note args switched in muldiv64) */
>> >      uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND, timeb=
ase_freq);
>> >
>> > --
>> > 2.17.1
>> >
>> >

