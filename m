Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwZJk-0004Uo-2a
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jan 2021 18:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwZJi-0004RO-Ad; Mon, 04 Jan 2021 18:31:14 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwZJe-00025R-It; Mon, 04 Jan 2021 18:31:13 -0500
Received: by mail-yb1-xb31.google.com with SMTP id r63so20677828ybf.5;
 Mon, 04 Jan 2021 15:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciDAIg3faoFu1Ru/L9HbHRKNcK1ZeEVHM9a0zUJKd3g=;
 b=s9O0n1lAvuQz4BlOWMYkjah216/PvGrr77sxvGmLjYd6knyGmQJs7ICvWK2MjrLKuu
 pgQpvkDH3n0jBKmbO9HSIEpGHRxArjrtcgcdv3yJPv9cT/cDcd90uSrlXUta0E3kQwxe
 oVN9WNlN1Gpd9dfjwi7z1bO4Ea75GgifK5x3Eyn8kVBBFxXmpaG9aXtLEXCxhihIkADH
 MoF7SQGHfyCfQ+kNvIiwUwtaVd2KFz3i6dLY5/HZDepE5Ld+MoucOPK7hx2zKEsSs1DT
 sWuSD4fyErzrzt5ZiUip5g/4oYXJXbVWTGFY/6yzIFt9eGb5+boXUClrOjduYGXl5ve0
 LmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciDAIg3faoFu1Ru/L9HbHRKNcK1ZeEVHM9a0zUJKd3g=;
 b=TQ0M0dp/dHmtArkhXtd8A9dpBlZmJSCvnQVwEYQYBK3e0KrqGoHyuJhHJ5ixAEBBW6
 Z2qIcZ+4pCbHa8v+DuwfKbVSf9JhlY0pzjPemcWY2hD4Od2VUG2eFjwmBfxJZ1Y6rtBF
 jnt5l81k0+8tnn+yUkUlYkHyiQAEwZgr+AbMvPOBC5L4gSWLRb6VEKi148624eSQ6YaG
 HHtVjROoLmEhJeFk3mR3z9wXj7dG3ZXxSWZ5KOACoeCQtg4D5aIS5zXMAajjGv8hwwbI
 RPa8/XceKXXoKNXHn4Jpve0pw5STsuPOeLZe21OQ8asbzeq/1ylAaeJkpORtyRL7/2Wu
 liGg==
X-Gm-Message-State: AOAM533J2/XVsX2/N8K3yMSD+sNNjkV7USoCYW81nXu5vcP3/2Csea1u
 CDrVfCxpiVotKKBaC0Wo8Mb3UIAKu80wmIvhKio=
X-Google-Smtp-Source: ABdhPJxGJ0b7o02UJp4ZwpGxHJiwGs02Q4NvVWFNKzahfP76goWJ5+zVgwLH9tPzrt43ebK9JzJh4qf4ESXLCwxsvpg=
X-Received: by 2002:a25:5a43:: with SMTP id o64mr54860188ybb.387.1609803068722; 
 Mon, 04 Jan 2021 15:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-2-bmeng.cn@gmail.com>
 <20210104160015.GA26719@fralle-msi>
In-Reply-To: <20210104160015.GA26719@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 07:30:57 +0800
Message-ID: <CAEUhbmXv9RqminQD67JHrnAciodz40DJjfpx2tAz0amYhdN-ag@mail.gmail.com>
Subject: Re: [PATCH 01/22] hw/block: m25p80: Add ISSI SPI flash support
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 04 Jan 2021 23:31:14 -0000

Hi Francisco,

On Tue, Jan 5, 2021 at 12:00 AM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin,
>
> On [2020 Dec 31] Thu 19:29:49, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This adds the ISSI SPI flash support. The number of dummy cycles in
> > fast read, fast read dual output and fast read quad output commands
> > is currently using the default 8. Per the datasheet [1], the number
> > of dummy cycles configurable, but this is not modeled.
> >
> > For flash whose size is larger than 16 MiB, the sequence of 3-byte
> > address along with EXTADD bit in the bank address register (BAR) is
> > not supported. Currently we assume that guest software will alawys
> > use op codes with 4-byte address sequence. Fortunately this is the
> > case for both U-Boot and Linux.
> >
> > [1] http://www.issi.com/WW/pdf/25LP-WP256.pdf
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/block/m25p80.c | 38 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > index 844cabea21..8a62bc4bc4 100644
> > --- a/hw/block/m25p80.c
> > +++ b/hw/block/m25p80.c
> > @@ -411,6 +411,7 @@ typedef enum {
> >      MAN_NUMONYX,
> >      MAN_WINBOND,
> >      MAN_SST,
> > +    MAN_ISSI,
> >      MAN_GENERIC,
> >  } Manufacturer;
> >
> > @@ -486,6 +487,8 @@ static inline Manufacturer get_man(Flash *s)
> >          return MAN_MACRONIX;
> >      case 0xBF:
> >          return MAN_SST;
> > +    case 0x9D:
> > +        return MAN_ISSI;
> >      default:
> >          return MAN_GENERIC;
> >      }
> > @@ -705,6 +708,9 @@ static void complete_collecting_data(Flash *s)
> >          case MAN_SPANSION:
> >              s->quad_enable = !!(s->data[1] & 0x02);
> >              break;
> > +        case MAN_ISSI:
> > +            s->quad_enable = extract32(s->data[0], 6, 1);
> > +            break;
> >          case MAN_MACRONIX:
> >              s->quad_enable = extract32(s->data[0], 6, 1);
> >              if (s->len > 1) {
> > @@ -897,6 +903,16 @@ static void decode_fast_read_cmd(Flash *s)
> >                                      SPANSION_DUMMY_CLK_LEN
> >                                      );
> >          break;
> > +    case MAN_ISSI:
> > +        /*
> > +         * The fast read instruction code is followed by address bytes and
> > +         * dummy cycles, transmitted via the SI line.
> > +         *
> > +         * The number of dummy cycles are configurable but this is currently
> > +         * unmodeled, hence the default value 8 is used.
> > +         */
> > +        s->needed_bytes += ((8 * 1) / 8);
>
> According to how m25p80 models dummy clock cycles above
> means that the command is being modeled with 1 dummy clock cycle (and below is
> modeling the dio/qio commands with 1 and 3 dummy clock cycles). To model
> the command with 8 dummy clock cycles you only add +8 above (+4 and +6
> would be the values to add below). One can look into how one of the other
> flashes model the commands for examples. This might also mean that the
> controller will need a change and do the opposite what above calculation
> does, and convert the dummy bytes into dummy clock cycles (when
> transmitting on 1 line it generates 8 dummy clock cycles for each dummy
> byte, when it uses 2 lines it generates 4 etc..).
>

I now am more inclined to say something is wrong in the Xilinx SPI
models and I just don't have time to check what is wrong there. As I
mentioned here [1] for SPI controllers that use fifo to stuff the
dummy bits on the line, there is no way for hardware to tell what is
dummy bits in the fifo or not. The hardware just sends whatever in the
fifo which is prepared by the software. Hence the only way to get such
hardware to work is to use bytes, instead of bits in QEMU.

[1] http://patchwork.ozlabs.org/project/qemu-devel/patch/1606704602-59435-1-git-send-email-bmeng.cn@gmail.com/

Regards,
Bin

