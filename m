Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D59C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 18:24:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUAKk-0008CK-Hs; Thu, 10 Aug 2023 14:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUAKh-0008BO-QV; Thu, 10 Aug 2023 14:24:27 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUAKg-0004oa-DE; Thu, 10 Aug 2023 14:24:27 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-487169d5e32so355625e0c.3; 
 Thu, 10 Aug 2023 11:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691691865; x=1692296665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c14ii2w0y2og4KpObD6ldwMVL3lmkBgDbR4SDnq/wUg=;
 b=j5LDHKRkbSghY7PyNgPwPB4zqNfwsubo36VUO3TdPHkjvHYZqMAaZvX7fNB1xXf2P6
 E0k66hrAvCF8yp6iYm8zWH69qgOLpacIlqmQKNeXIiI6udEfLJ1gtYy0Lpufk7955rmL
 cUhdQgKTkTrOz7FcNgbsEdW3bcfvxF7p9rFOXYiSkEds7gF0vc2GoDUjMSbTOQ5jwGsn
 gwsFRAtHHQdXqgfw28Kp5jBFI1ZgQSyLYvsDBwsxNUDJU2KFhw7BUnS6STwkIChjKVB+
 3TsSEr4hiNIfbBkjY/FKdeK9eU5xNZaZeV1ATrhfRwJZK90g1yFdAkVqL+M/ycqLDHeP
 ztwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691691865; x=1692296665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c14ii2w0y2og4KpObD6ldwMVL3lmkBgDbR4SDnq/wUg=;
 b=d5SUfH1uA7gjzYm8yixnMz6tuI7ftvVxAmzRJ+y1MuhR4wReI3fh5J8F5t0AauZsB3
 c/PVT0CZUlbYIyqxiYTnR100ZsNlN6OpkS3SAu/DZEm7doISDilqRgPUzkwTm/iGH+Ka
 yzghsW36I3dTSAf3Xpq1VGeTCmC8MagGp+1JYCnLU5docvY0u9S+3khcbAWHzYZWWh9Z
 8AmroLgKRFFJO99L2Iy5fg8S74eRDeJ2BJOtiNlygLXln4ldLr2CXZr6tTBLzBoiM63E
 EwY1aOM5oUjsSo+VZ7Ru+Mbnyr5w/Huj23LIkowedPpgzDCcrodPIdllhsv5OszRNAYn
 TaAg==
X-Gm-Message-State: AOJu0Ywc1+f5kWlWSFIoC79T3dpcO3KBkgEaFpxDTjfVIuuvwfivDvnW
 790yrBw0C1VQJS8xWHLmdxA4Z5z9iwgrXAnNIrc=
X-Google-Smtp-Source: AGHT+IGt0rRMZ09denkCSYcEiNzMYWsx88c3AmI1baGehikd/Cfz2YOfMrofmYk5XuLOQBZF1VFIKiyas674LFxBNGE=
X-Received: by 2002:a67:de0a:0:b0:447:bf92:f262 with SMTP id
 q10-20020a67de0a000000b00447bf92f262mr1803966vsk.18.1691691864870; Thu, 10
 Aug 2023 11:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230728082502.26439-1-jason.chien@sifive.com>
In-Reply-To: <20230728082502.26439-1-jason.chien@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 14:23:58 -0400
Message-ID: <CAKmqyKNx15Jr7XsyQ0uLt9JmORodhQXmQtfj-+waY32EvLf19w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/intc: Fix upper/lower mtime write calculation
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Fri, Jul 28, 2023 at 5:13=E2=80=AFAM Jason Chien <jason.chien@sifive.com=
> wrote:
>
> When writing the upper mtime, we should keep the original lower mtime
> whose value is given by cpu_riscv_read_rtc() instead of
> cpu_riscv_read_rtc_raw(). The same logic applies to writes to lower mtime=
.
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aclint.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index b466a6abaf..bf77e29a70 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -208,11 +208,12 @@ static void riscv_aclint_mtimer_write(void *opaque,=
 hwaddr addr,
>          return;
>      } else if (addr =3D=3D mtimer->time_base || addr =3D=3D mtimer->time=
_base + 4) {
>          uint64_t rtc_r =3D cpu_riscv_read_rtc_raw(mtimer->timebase_freq)=
;
> +        uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);
>
>          if (addr =3D=3D mtimer->time_base) {
>              if (size =3D=3D 4) {
>                  /* time_lo for RV32/RV64 */
> -                mtimer->time_delta =3D ((rtc_r & ~0xFFFFFFFFULL) | value=
) - rtc_r;
> +                mtimer->time_delta =3D ((rtc & ~0xFFFFFFFFULL) | value) =
- rtc_r;
>              } else {
>                  /* time for RV64 */
>                  mtimer->time_delta =3D value - rtc_r;
> @@ -220,7 +221,7 @@ static void riscv_aclint_mtimer_write(void *opaque, h=
waddr addr,
>          } else {
>              if (size =3D=3D 4) {
>                  /* time_hi for RV32/RV64 */
> -                mtimer->time_delta =3D (value << 32 | (rtc_r & 0xFFFFFFF=
F)) - rtc_r;
> +                mtimer->time_delta =3D (value << 32 | (rtc & 0xFFFFFFFF)=
) - rtc_r;
>              } else {
>                  qemu_log_mask(LOG_GUEST_ERROR,
>                                "aclint-mtimer: invalid time_hi write: %08=
x",
> --
> 2.17.1
>
>

