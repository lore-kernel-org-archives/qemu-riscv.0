Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itr1f-0002lG-7i
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 05:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1itr1c-0002h2-G9
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 05:44:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1itr1b-0006Um-Iq
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 05:44:48 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:41951)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1itr1b-0006UM-CG; Tue, 21 Jan 2020 05:44:47 -0500
Received: by mail-lj1-x241.google.com with SMTP id h23so2210452ljc.8;
 Tue, 21 Jan 2020 02:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBCTh5HwTl9ddrB9gE8PK+L3swUoYyQPLEhhi4wxcuE=;
 b=CeceOeGbtWCnlbssy9q4E2tNMoywoVxi3M6FSTgi7hdg6Sr94LCYLUG8N4EodndEgd
 y+JAKg5E2kQqTp/7zg8V67WIUQv3bqz65Cqc0gbyIKMwaXoERDtnVeDdkdEJbOSX6CuI
 FrZUr2UXsZYJWOW6DGs0vOV2gyFRpL7fA666NZpscskyJffsHPocEWwBqEol/doTKbm9
 xzNVUbjIM2yDIuPEMHWKUr39p/b8Cz0aYnP3Xjwce+GMVhNgo5khA5Z6woIOSDvGGsYl
 LufqhjUSj0ONuUjrNYPUGPA/vyul5M76SfTRJq698HR1qZ6l8jKnilgWY7Guv1S/1yZN
 7Ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBCTh5HwTl9ddrB9gE8PK+L3swUoYyQPLEhhi4wxcuE=;
 b=mSInmTZtGaJmzwEhg2HZlN2mmULFO2XcLEDZlLPbFK5s9qCqonPwdV7yYOl7FSINu5
 AJQ5ZzIRxK5eVU0rxKXwmsiYMW6aXwlyFrfs5qVldBEqP5NyYY9TkIB66oN1HYID/wSL
 d3iuN8CKOcQIsU2vW/+bpbdZLsTp+4jcobdWIWQSat/bwcw609kKmaALCuLyCvvxf82T
 j5jgxsIyAmC8FSbw+VwEVDJDfL7T/p8RaE7pxjhpvxc+Y+2JFSf9Iv+zgaFheuteuQ/V
 M8PyTPnFYWzz4YTn9YNJwSfbaSkcmnFIcxiYT1jmt3fEs92RIthu27l4T2gKIf1ZjgmU
 Hn8w==
X-Gm-Message-State: APjAAAWn6cyU5nVJhvWAeSbGx7K2LdO1W5qJJ0SVe2vm2gqiGAh5F4Tt
 y1e5fnqXHqT+setvih+cXiByud20BjUSHdvJFPk=
X-Google-Smtp-Source: APXvYqz0tLH4PmP9F6REfutfksROAEKHuPt1C2fVw0dOY7SE+5+l6PpOI1CRw3kJ7cR4fnWwgHFlIYgYz120zTocifQ=
X-Received: by 2002:a2e:9a51:: with SMTP id k17mr16066036ljj.206.1579603486168; 
 Tue, 21 Jan 2020 02:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20200121085910.28834-1-anup.patel@wdc.com>
 <20200121085910.28834-3-anup.patel@wdc.com>
In-Reply-To: <20200121085910.28834-3-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Jan 2020 20:44:19 +1000
Message-ID: <CAKmqyKOiWkqFbikTwbT51vZJ3hKj=oSFFQwJYUXLZT0kB--7Ow@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: Provide rdtime callback for TCG in CLINT
 emulation
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <Atish.Patra@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Tue, 21 Jan 2020 10:44:49 -0000

On Tue, Jan 21, 2020 at 7:04 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> This patch extends CLINT emulation to provide rdtime callback for
> TCG. This rdtime callback will be called wheneven TIME CSRs are
> read in privileged modes.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_clint.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> index e5a8f75cee..805503dc27 100644
> --- a/hw/riscv/sifive_clint.c
> +++ b/hw/riscv/sifive_clint.c
> @@ -236,6 +236,7 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size, uint32_t num_harts,
>          if (!env) {
>              continue;
>          }
> +        riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc);
>          env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                    &sifive_clint_timer_cb, cpu);
>          env->timecmp = 0;
> --
> 2.17.1
>
>

