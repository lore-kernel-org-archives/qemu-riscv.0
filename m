Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iRl1V-00039v-TA
	for mharc-qemu-riscv@gnu.org; Mon, 04 Nov 2019 17:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iRl1T-00037e-HH
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2019 17:40:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iRl1S-0003kr-Cs
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2019 17:40:31 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:37302)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iRl1P-0003gJ-6S; Mon, 04 Nov 2019 17:40:29 -0500
Received: by mail-lf1-x144.google.com with SMTP id b20so13524663lfp.4;
 Mon, 04 Nov 2019 14:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2cIpAjPc41+e7P4cRjqrUQVw/JW7p81Z/d31MMfW6eA=;
 b=E1JY7D2OHT8naxqBzXI4Lk746YT/18cJSWto1ff6Cm8SmwdJNrWZyutagX3RaH2EEO
 8MS/rj1KQ3Ss9xZbPlOy9+PVUazcGBDlq6FW8gqGtssp2RYkXDOrMjMtVVjebe4Mq8mu
 TMb2icyq197UrxvgR34QvOeXy5m10tEooqfz+cK22cfv5DW48acjdnv0/rrNbWWPEpmS
 iSFZbvViz7Z8DJOcSutJijt1oUDdRzAb7n8Q3fKSTVjMoNrOpqk1wPr0SA5QuuqOR2vN
 95vN+EFWrDOdwzrE6gUuEy1T/sA6aSklfLWpQhX/V0Sdh8y7m3O66vMv1/MbJ+pHiaKH
 AdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2cIpAjPc41+e7P4cRjqrUQVw/JW7p81Z/d31MMfW6eA=;
 b=eMXNmbn14eAT/eykpAq+ffvMsvqMX47aq+3H7fkONF6AIheDAueTp+TG0QbjOHgMiU
 WXpTDoTP1H+qCrZE2y6ws83tSVMbTRw76crJzdU3Tw+kRwcKRUgpG0IvxDIiNKAFaHQ+
 zwksD1ubBUMEhL7YNmjP9bKzIrBTlQ9NITBuLYSKCXlVGOXkIzDAuCG/ohr/QILBzFtX
 bJIYIiVCZraQktuMriBtgjdx3rcPohjTgeUAJyOKwRraBS6RiC/0V724ttvLkFCo00Ef
 chpZCrN95OxaGrnkjTRe6cWK8M6kVNtB3bbXB1Hqgs8q7YhgvSSUjZi4nAMITxP3ZaSH
 3GJg==
X-Gm-Message-State: APjAAAXBRBhQVafVUDm7+JhzTS33/cy1x3kIQq8bKvwDGgIIh2/1Kcsk
 zHyU5mniqZ4F6RDd4tPcF9UgXyX+24yi2O6ttGs=
X-Google-Smtp-Source: APXvYqxoqJ1zQwDRAVke54BKjRap2c800WUFXAfnWIxkJEuRNo7ZL1cNGJCnY4gdgZZorpuM5Ms92fx7HXiaOHTFTwo=
X-Received: by 2002:a19:855:: with SMTP id 82mr17959039lfi.44.1572907223563;
 Mon, 04 Nov 2019 14:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20191103075353.86497-1-anup.patel@wdc.com>
 <20191103075353.86497-4-anup.patel@wdc.com>
In-Reply-To: <20191103075353.86497-4-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Nov 2019 14:34:45 -0800
Message-ID: <CAKmqyKPQr2u0_KQWRFUo-aFc3nDRoA46Uo54i=5XvCouBP0RGQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] MAINTAINERS: Add maintainer entry for Goldfish RTC
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Atish Patra <Atish.Patra@wdc.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2019 22:40:32 -0000

On Sun, Nov 3, 2019 at 12:55 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> Add myself as Goldfish RTC maintainer until someone else is
> willing to maintain it.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2a68555ae..f200e985da 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -558,6 +558,13 @@ F: include/hw/arm/digic.h
>  F: hw/*/digic*
>  F: include/hw/*/digic*
>
> +Goldfish RTC
> +M: Anup Patel <anup.patel@wdc.com>
> +L: qemu-riscv@nongnu.org
> +S: Maintained
> +F: hw/rtc/goldfish_rtc.c
> +F: include/hw/rtc/goldfish_rtc.h
> +
>  Gumstix
>  M: Peter Maydell <peter.maydell@linaro.org>
>  R: Philippe Mathieu-Daud?? <f4bug@amsat.org>
> --
> 2.17.1
>
>

