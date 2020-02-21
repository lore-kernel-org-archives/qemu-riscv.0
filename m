Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j51Gb-0008OZ-JQ
	for mharc-qemu-riscv@gnu.org; Fri, 21 Feb 2020 00:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1j51GZ-0008OF-99
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 00:54:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1j51GY-000139-BO
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 00:54:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37186)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1j51GX-0000v9-Sy
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 00:54:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id a6so401093wme.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Feb 2020 21:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FOGTHs9kui+0Fe8cbcIr0Sj9QwDBZZ90d+AJJ7QZ3lk=;
 b=mzsQTFQFszhk8PfM/9N6jEzfshHdsvNnLqGx2qxXUO0b705U44qnlbFUWkCv1bhpiV
 26Yyly2crA+048vhj7qfZllsYOyzE73GorV3QKzQiHevSPzo6pX5K21Pw/LcqNO2/vMz
 CW46IludijItbxTVhARDI/lCm+pUx3CjyPP2V6avXa8BqGnVgjQLRfKONhF9kLMoPu+0
 hNOU4nbEvcgmLiaD92qng1RQD83N62NCNQV2M81IZaiuD8HPKM1PdlrBI5/+eZwKTefu
 U2fAhoB0vAnQA3ZMus949oucf/YqwqWQ4QhK54DpjgxOuvKyFRISIDFXCCbmHfR4QoCO
 gp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FOGTHs9kui+0Fe8cbcIr0Sj9QwDBZZ90d+AJJ7QZ3lk=;
 b=kjhrFxSA5XuK7Pt+Giq7GrEfQGE0O70olfsKg/kpwSKUnidlljxZRWs6F3S5fDUJ8J
 BBVojxUmnh1FaYiT90JKIJF+Czt7al9YfR/KDw99naTA827dfYYqefbWk0Rs/rpKHNiO
 3UtojKsBZAzy4/C34cfp6y8MU6PG1bYiyORW5NVVHmfg5ixQQZLLKLws9SZM+H/lM9AL
 LfpUieSXzKgxWwycjZCZYz05BsQGUi8JtcbiMF63Wmi68kXcKKSDyx5uYltTUbnsDt2T
 FVnhcBlADosPaVR/fo0Ti4Jv6xh249Sla2C2GEDiwBiqT7OqB8Es7fgIp8NNVfJzmL/s
 dJCQ==
X-Gm-Message-State: APjAAAXHqX4Iy5WZkfO/sy4TrWYrq1ZMOVtMUG0NwmyZ8VTIMFfQd03I
 ExrEKbC7T4PcZF08fVQL205Qx9EwJJ1uKN1IVRzU2Q==
X-Google-Smtp-Source: APXvYqzmkFq7NiMPgFDWtrKSJiSEIn/Atd6Dg2LhhoF0siIz8MKKFZRQS5Am8aJv2c/6Q1eS9WTEZKhJNd8Ln1J59SM=
X-Received: by 2002:a1c:1984:: with SMTP id 126mr1495374wmz.78.1582264459711; 
 Thu, 20 Feb 2020 21:54:19 -0800 (PST)
MIME-Version: 1.0
References: <1582209758-2996-1-git-send-email-bmeng.cn@gmail.com>
 <f92f1ec7-ac03-a012-f232-32c533beb9d2@redhat.com>
 <CAEUhbmV9ouup0aqrUvEfpGFAoggVNJXw-PLD0xYurBXg+h3OMA@mail.gmail.com>
In-Reply-To: <CAEUhbmV9ouup0aqrUvEfpGFAoggVNJXw-PLD0xYurBXg+h3OMA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Feb 2020 11:24:07 +0530
Message-ID: <CAAhSdy0edkypzbhhLw2g52F2w6GrS46OKi461Fghuk5AZfCjgQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: roms: Add 32-bit OpenSBI firmware image for
 sifive_u
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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
X-List-Received-Date: Fri, 21 Feb 2020 05:54:24 -0000

On Fri, Feb 21, 2020 at 8:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Philippe,
>
> On Fri, Feb 21, 2020 at 1:31 AM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> > Hi Bin,
> >
> > On 2/20/20 3:42 PM, Bin Meng wrote:
> > > Although the real world SiFive HiFive Unleashed board is a 64-bit
> > > hardware configuration, with QEMU it is possible to test 32-bit
> > > configuration with the same hardware features.
> > >
> > > This updates the roms Makefile to add the build rules for creating
> > > the 32-bit OpenSBI firmware image for sifive_u machine. A pre-built
> > > OpenSBI image (built from commit 3e7d666) has been added as the
> > > default bios for 32-bit sifive_u machine.
> >
> > With QEMU:
> >
> > fatal: ambiguous argument '3e7d666': unknown revision or path not in th=
e
> > working tree.
> >
> > This looks like an OpenSBI commit but QEMU only include up to v0.5.
> >
> > Can you build v0.5? Else can you update the submodule?
> >
>
> Will do in v2.

We plan to release OpenSBI v0.6 on monday (24th Feb 2020) so maybe
you can update all RISC-V ROM images based on OpenSBI v0.6 ??

>
> > Also, can you add a CI job to build this, so we have reproducible build=
s
> > (see QEMU commit 71920809ceabed as example)?
>
> I cannot find any document for how to test CI job with gitlab CI. Does
> QEMU has a public CI runner for testing?
>
> Regards,
> Bin
>

Regards,
Anup

