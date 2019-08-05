Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufYO-0003LY-8I
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60837)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufYL-0003IP-IQ
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:09:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufYJ-00079p-Vv
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:09:41 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:44347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufYJ-00077Q-Cp; Mon, 05 Aug 2019 12:09:39 -0400
Received: by mail-ed1-x542.google.com with SMTP id k8so79193750edr.11;
 Mon, 05 Aug 2019 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xfqPt+uOeXJnvtJQ1eeLGHOCKPxOAyHacceChXWj/yc=;
 b=I7kx4Guelsa7Wit9/p0ThVIjMCkOkuaT1AoWPu2bv4BqPq+v53buKJ9yDp8JYlCuMz
 hK46mi7ILqJNmI0VF6IYoClV573NnfBObTXYQrTvgNwLZtZBj4HDs90maE1CBr3PTN2W
 xccTdrLQYbPZZcGERp61YQqZY1XoKFSaFHj6RBvHYZ4VoxKro5u6mO5RcOfThqkJ2QzW
 ldVoafbMQzrit5C1zIuajAb+2pHF3Os5e+TTFCd04Lt3bCnC97vt8/d8VCpJlCyyythB
 mEWUFE97W/cQmKc+S1cu56nPPKm8e3Ft5Cf4xMd9f7mz9sYErb6g0pi3BfuMx8CuZmgr
 /eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xfqPt+uOeXJnvtJQ1eeLGHOCKPxOAyHacceChXWj/yc=;
 b=TIGjeATqD/TJJZKaCXJ+gHx0ulxDyyHIW7hHvNUi55FBiAueJvHLDkuvEB1J4VgIAl
 f5Nh+GWIq5Dz6R/qeRMsOLdwfS1RA8eKqXYm+HcdcuEdbGrGJxpXURc/Py3zlkdoF1vv
 g0c/G+Qf2Lyk6UysdI0GzFOyRH/zuumgDqb7EfsvOLLZanng4GvtGkqXPSirjZZSXGg3
 m2R3mfaUTtP9em6NamnmMtI+kUtddblrbdWt84zUloIW8UeAqNSatTwuyswxzHJtAIqy
 MyiH4NdVu+gnDPRlSf37GXtjCDFc/KKU1hF2Zy1dCo58r/MWcPybTHlIVU5dZDjJHXlU
 MgAg==
X-Gm-Message-State: APjAAAXSCeZsYQApx3qKDjlmxFKjICVkUboeZ9am271gnn3tJ8oScf8g
 DWIIb/v70ZAy2Pl/+ICacYz4FpHRL+/CBPOVXsg=
X-Google-Smtp-Source: APXvYqyPn/B48yLfsfsWOkWUmiyWdHupakx8ZNCW0HxZoxIDHOeyIbYVmp8J4cx0NOr0OTfn0+3CYGoAgdLEJ9Ij0/M=
X-Received: by 2002:a17:906:fcb8:: with SMTP id
 qw24mr119308778ejb.239.1565021377947; 
 Mon, 05 Aug 2019 09:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <1558108285-19571-1-git-send-email-bmeng.cn@gmail.com>
 <1558108285-19571-2-git-send-email-bmeng.cn@gmail.com>
 <9338c7b4-6a05-2189-b93d-25cb2bd4dd54@adacore.com>
 <CAEUhbmUtdvkYPm4DZL4MSeV5imaj82x2xtPkQ0yLKF599N=vXw@mail.gmail.com>
 <CAKmqyKP1BcTOQJDJoFiEL4NhMwTHQHmSDn=ZPiq8eDMB_hVSkw@mail.gmail.com>
In-Reply-To: <CAKmqyKP1BcTOQJDJoFiEL4NhMwTHQHmSDn=ZPiq8eDMB_hVSkw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Aug 2019 00:09:27 +0800
Message-ID: <CAEUhbmXcOMuQiSfSYD2-_vR+5HqTfou1XhoC_Vi7m9EGb1K1kw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Fabien Chouteau <chouteau@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 2/2] riscv: sifive_u: Update
 the plic hart config to support multicore
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
X-List-Received-Date: Mon, 05 Aug 2019 16:09:42 -0000

Hi Alistair,

On Tue, Jul 16, 2019 at 5:33 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jul 13, 2019 at 8:23 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Fabien,
> >
> > On Tue, Jul 9, 2019 at 12:31 AM Fabien Chouteau <chouteau@adacore.com> wrote:
> > >
> > > Hi Bin,
> > >
> > > Thanks for this patch.
> > >
> > > I know I am very late to the game but I have a comment here.
> > >
> > > On 17/05/2019 17:51, Bin Meng wrote:
> > > > +    /* create PLIC hart topology configuration string */
> > > > +    plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) * smp_cpus;
> > > > +    plic_hart_config = g_malloc0(plic_hart_config_len);
> > > > +    for (i = 0; i < smp_cpus; i++) {
> > > > +        if (i != 0) {
> > > > +            strncat(plic_hart_config, ",", plic_hart_config_len);
> > > > +        }
> > > > +        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
> > > > +                plic_hart_config_len);
> > > > +        plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
> > > > +    }
> > > > +
> > >
> > > This will create up to 4 MS PLIC devices. However on the Unleashed FU540 the PLICs are M,MS,MS,MS,MS because of the monitor hart #0.
> > >
> > > This means a different memory layout than the real hardware.
> > >
> > > For instance address 0x0C00_2080 will be hart #0 S-Mode interrupt enables in QEMU, instead of #1 M-Mode interrupt enables for the real hardware.
> >
> > Thanks for the notes! I agree to better match the real hardware, it
> > should be modeled like that. However I am not sure what the original
> > intention was when creating the "sifive_u" machine. Both OpenSBI and
> > U-Boot list sifive_u as a special target, instead of the real
> > Unleashed board hence I assume this is a hypothetical target too, like
> > the "virt", but was created to best match the real Unleashed board
> > though.
>
> I thought (Palmer correct me if I'm wrong) that the sifive_u machine
> *should* match the hardware. The problem is that QEMU doesn't support
> everything that the HW supports which is why U-Boot and OpenSBI have
> their own targets. The goal is to not require special QEMU targets, so
> this is a step in the right direction.
>

I've sent a series that improves the emulation fidelity of sifive_u
machine, so that the upstream OpenSBI, U-Boot and kernel images built
for the SiFive HiFive Unleashed board can be used out of the box
without any special hack.

Please have a look.
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=123386

Regards,
Bin

