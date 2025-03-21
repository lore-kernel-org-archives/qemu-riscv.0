Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05FCC36000
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 16:05:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tveof-0002T6-QX; Fri, 21 Mar 2025 12:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1tveoA-0001Te-L7
 for qemu-riscv@nongnu.org; Fri, 21 Mar 2025 12:01:25 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1tveo3-0004kD-7x
 for qemu-riscv@nongnu.org; Fri, 21 Mar 2025 12:01:18 -0400
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-85b4277d0fbso79269739f.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Mar 2025 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1742572866; x=1743177666;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/j24HTeIuy/kxPZcpyaYAUbMTp2d4MrtvnI0K5CHXk=;
 b=L64IZttejAKKKqOuTrGFqdkPtk3WMTjqIDeoa5++oZv2BYHl//NiAqlI/eC6cIyqpP
 p8+Ipnvfiyu0xAzM8Aji91h4/CGkOb+WFmOwWewMhDGZr1gUXrdCTFAjPnEg8pvdq8g7
 XLAxfPa1wQoOr5Ervqu0YDdjweQQC9yXdAqBPM8P1KY9HFVAqIinmYZ12Mgwhx5osijM
 oeYoesyRpzxjvv5bYPQHyKTm06mDx8dxU1SG41m5Lczreyyg+Asc+NpHIUGR9zYct8T1
 QumgV/q23kUoK4IYaecB7WpK3GUgXGzjSc9Il5C5DXisODH3Jr2s3bH40DqUjsl5Brzx
 eSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742572866; x=1743177666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/j24HTeIuy/kxPZcpyaYAUbMTp2d4MrtvnI0K5CHXk=;
 b=T+L3bTVSbEfEt0MyXNg7ed1NdFRO1iDA8H1zD166Qq7n84cpdiNpxYoVKU/jbF+b5y
 rygYnW9XOq2Z6xQQxbhfDqvIkMcPLjJkODoOVFzmY/aoFX8DmiJ4hO1TQhKZ79AOpDGV
 DH/xwXsH4tkBXPRuGt2q9Wh0aNKBVoyLf9GQcS3tcduUwrb5Q8uvndBMVskwtTB9pIQI
 m975TdOUvWcndEBqh20fFdwEiNzRhuOE9OJxY03tlOJiYySIulDBAr53v0TSQn7K6oox
 4UWNDAW+AX15ohBhdZ929/8X3CXHumnDQRAY2sigdtc0rw7a3/oBZEvdm8q36/noduIf
 7Zag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBGb/tw59E8Zw06k7IDuyibz2oy+ZopxMecC5R9NEht7YskrOmbiAM1PRt9Z/MB4AHb4mJtLz0fzQN@nongnu.org
X-Gm-Message-State: AOJu0YzVpBqgJIx4Jc1WLebS2/Inh3nwB7rXVCUT8LzWrVX1ykz8aT+o
 uzLzLW4llEvup7BLboYl1h62A8+E30WTDSuxHrNZs/oJhJvhk6ylYnmqKL54HtABxA8+h/o3R+4
 xLVYfuPOPfHMQ+7zBLInIywVBkgQHj6L50yxx9g==
X-Gm-Gg: ASbGncupsnUyYv5t7xBNWa75r30WYlVqN1xOKYqcFL8YCbBP6117/prhQb3B+fbfr4W
 Y/rVWiEOIUgudHBhvpyGH65uIFDvhVFajilgBsVou40LKC1yjY/LmpndoIlecXo3dbR0HmpkZdh
 WkKwwNDJtdLmCrkxSeOJ3uz43QKCRhDrlEWXXN
X-Google-Smtp-Source: AGHT+IFHC0WgHO1hs1MRYjdrNIEJ+K6XADSfT+e0WaYBEyFfCQ3bsGoJpq8Iy8xdQO17qNvdeJUFA/pb9vgNq4pzFI0=
X-Received: by 2002:a92:c26e:0:b0:3d5:893a:93ea with SMTP id
 e9e14a558f8ab-3d5961193acmr34830285ab.13.1742572866127; Fri, 21 Mar 2025
 09:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250321081255.30564-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20250321081255.30564-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Mar 2025 21:30:55 +0530
X-Gm-Features: AQ5f1JoXJNtw-CO8w94mR-2xPp88vq8YfUpV_cUkoWVlKv6o4h9GCm8mf4zQsfI
Message-ID: <CAAhSdy0-we9B19wRRqk_rRFkjY2LPPMRGaTdE=_4Ge_pCR4Y4Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] goldfish_rtc: keep time offset when resetting
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Frederik Du Toit Lotter <fred.lotter@canonical.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=anup@brainfault.org; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 21, 2025 at 1:43=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Currently resetting leads to resynchronizing the Goldfish RTC with the
> system clock of the host. In real hardware an RTC reset would not change
> the wall time. Other RTCs like pl031 do not show this behavior.
>
> Move the synchronization of the RTC with the system clock to the instance
> realization.
>
> Reported-by: Frederik Du Toit Lotter <fred.lotter@canonical.com>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  hw/rtc/goldfish_rtc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
> index 0f1b53e0e4..203a343511 100644
> --- a/hw/rtc/goldfish_rtc.c
> +++ b/hw/rtc/goldfish_rtc.c
> @@ -239,15 +239,8 @@ static const VMStateDescription goldfish_rtc_vmstate=
 =3D {
>  static void goldfish_rtc_reset(DeviceState *dev)
>  {
>      GoldfishRTCState *s =3D GOLDFISH_RTC(dev);
> -    struct tm tm;
>
>      timer_del(s->timer);
> -
> -    qemu_get_timedate(&tm, 0);
> -    s->tick_offset =3D mktimegm(&tm);
> -    s->tick_offset *=3D NANOSECONDS_PER_SECOND;
> -    s->tick_offset -=3D qemu_clock_get_ns(rtc_clock);
> -    s->tick_offset_vmstate =3D 0;
>      s->alarm_next =3D 0;
>      s->alarm_running =3D 0;
>      s->irq_pending =3D 0;
> @@ -258,6 +251,7 @@ static void goldfish_rtc_realize(DeviceState *d, Erro=
r **errp)
>  {
>      SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
>      GoldfishRTCState *s =3D GOLDFISH_RTC(d);
> +    struct tm tm;
>
>      memory_region_init_io(&s->iomem, OBJECT(s),
>                            &goldfish_rtc_ops[s->big_endian], s,
> @@ -267,6 +261,12 @@ static void goldfish_rtc_realize(DeviceState *d, Err=
or **errp)
>      sysbus_init_irq(dev, &s->irq);
>
>      s->timer =3D timer_new_ns(rtc_clock, goldfish_rtc_interrupt, s);
> +
> +    qemu_get_timedate(&tm, 0);
> +    s->tick_offset =3D mktimegm(&tm);
> +    s->tick_offset *=3D NANOSECONDS_PER_SECOND;
> +    s->tick_offset -=3D qemu_clock_get_ns(rtc_clock);
> +    s->tick_offset_vmstate =3D 0;
>  }
>
>  static const Property goldfish_rtc_properties[] =3D {
> --
> 2.48.1
>
>

