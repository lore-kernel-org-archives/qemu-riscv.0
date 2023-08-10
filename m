Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A7CC04A6A
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 18:25:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUALY-0000Dv-Jk; Thu, 10 Aug 2023 14:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUALW-0000Ay-PL; Thu, 10 Aug 2023 14:25:18 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUALV-00057K-Ak; Thu, 10 Aug 2023 14:25:18 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-4873cd125acso479558e0c.0; 
 Thu, 10 Aug 2023 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691691916; x=1692296716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKiU6fcl3ioxaFD58YYYLrdRvrhrVTXNyW1fSBOV2zM=;
 b=WRuXM7MyxBEYGbk6tQa7GQux0l+rTmiKKsP23bedc9Ow19w4PuKri7R6asj5pRbdlU
 EdfcNwfMPn/Ccn4pOWt2SvdBmU/ObVYJo+i844IPhfFYaCkrdDsCbamazM5nCnH5lI5x
 PcQvni9it7Sv/kJh1giAP8H0Y/EPDar8PtrFD1IJK24950LCxRJ/4w8dGiZOyz7m60fj
 hUl4/mkFbvD62a0h4kAirLyhUCPcvysKiuWfakionlFZG6FESnbOipP+ajN7rCq1kCkV
 KzquKBtnUswHfmFCX9Xm3pbBrHJp3gPXChKVoEPq2fZAcFirMuxAOLYrG12CvGo1AS8B
 GqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691691916; x=1692296716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKiU6fcl3ioxaFD58YYYLrdRvrhrVTXNyW1fSBOV2zM=;
 b=WOwNaEnhy6reEZkQ/xVAvjTjuqdZ6VLydLk+BPTVWlkBZRLI6Jm3SA442nZ1FOYEgP
 UWI9ph4Esrbg0L/JGfhuIcbARx6UriYYhgjgVf6wfJAcFJRt6IVoZUwR/bBnxmVoTAPN
 30MYCKTT/+zMnTVNbyO5mUic72nKnxEiHX2WgIke+eqgHQCUVfvua7W7khFka7Fn4LN8
 6YOSL3CErrMfHckLUGkTduDNv7wZeDTtNphHj2+Zu72ryZ2Y6gPXNAGy13YkzTmduUHy
 smPDpMkg9LsY2pwuH+/86kmXr/yvNB/qqgXNzn1eo8IioFeCtbxcacM4hmm1RHYDQp1X
 l4Vw==
X-Gm-Message-State: AOJu0Yx6YyYCqhSw/MlFKPqLYWdhSAEQZDSb3TaE6tro+3SlYsVrbmPi
 iW8oXJ7jJw8S8UN0lI2NVZIgRw9WdHN+9Xi7x8A=
X-Google-Smtp-Source: AGHT+IFkjp2wrB9u5R+oyIrefT3wSdPVZRps7v9BXfdJuuDl5BQ3wzdX0y+V40GfX0nUSgXpQZ8p2yUb9Q+W2CAH0QA=
X-Received: by 2002:a67:b308:0:b0:443:63dc:5275 with SMTP id
 a8-20020a67b308000000b0044363dc5275mr2237253vsm.29.1691691915980; Thu, 10 Aug
 2023 11:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230728082502.26439-1-jason.chien@sifive.com>
 <20230728082502.26439-2-jason.chien@sifive.com>
In-Reply-To: <20230728082502.26439-2-jason.chien@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 14:24:48 -0400
Message-ID: <CAKmqyKMX=Q3+kdaKAJrQHeya7ctnyt0HSt=NUQWUAOj9JEPZ8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc: Make rtc variable names consistent
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Fri, Jul 28, 2023 at 4:57=E2=80=AFAM Jason Chien <jason.chien@sifive.com=
> wrote:
>
> The variables whose values are given by cpu_riscv_read_rtc() should be na=
med
> "rtc". The variables whose value are given by cpu_riscv_read_rtc_raw()
> should be named "rtc_r".
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aclint.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index bf77e29a70..25cf7a5d9d 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -64,13 +64,13 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAc=
lintMTimerState *mtimer,
>      uint64_t next;
>      uint64_t diff;
>
> -    uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);
> +    uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);
>
>      /* Compute the relative hartid w.r.t the socket */
>      hartid =3D hartid - mtimer->hartid_base;
>
>      mtimer->timecmp[hartid] =3D value;
> -    if (mtimer->timecmp[hartid] <=3D rtc_r) {
> +    if (mtimer->timecmp[hartid] <=3D rtc) {
>          /*
>           * If we're setting an MTIMECMP value in the "past",
>           * immediately raise the timer interrupt
> @@ -81,7 +81,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAcli=
ntMTimerState *mtimer,
>
>      /* otherwise, set up the future timer interrupt */
>      qemu_irq_lower(mtimer->timer_irqs[hartid]);
> -    diff =3D mtimer->timecmp[hartid] - rtc_r;
> +    diff =3D mtimer->timecmp[hartid] - rtc;
>      /* back to ns (note args switched in muldiv64) */
>      uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND, timebase=
_freq);
>
> --
> 2.17.1
>
>

