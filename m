Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnXdg-0001qy-Us
	for mharc-qemu-riscv@gnu.org; Tue, 16 Jul 2019 20:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45151)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hnXdd-0001eH-L4
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 20:17:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hnXdc-00085F-JO
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 20:17:41 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46084)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hnXda-00084a-An; Tue, 16 Jul 2019 20:17:38 -0400
Received: by mail-lf1-x142.google.com with SMTP id z15so10737633lfh.13;
 Tue, 16 Jul 2019 17:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9QZgh22M+ts7wnAbDENlpUJosc80GCJNMZ0pBHax8eo=;
 b=c2dA8701kQn0EekbAY01J+yXbXh/aboG0LWQK36XQQioVFkTingJnOA14inTctiIUs
 0/yaoJzjUWn98aeFAs6XkSnHPMDufjel6pCcCRaK+mVbJ6gLHwg63UeQxPsDPQ/AQ2+O
 hdjReAXZhsSjtfgypkdKXvXV3iEsejBOWobrW6rGLV55RQLAZQuG44b7m+dsbUBwriRN
 fjw9Hd1Cg52w1oGjtJvQ6utTHQnPWDTYFTgCDl6KeJYeCQnQGFQsg5EG52ZaRFx8Xl+H
 L5261LmYDSCPs21tHJydWXQszR49sb3HoRuGplNw1cZSK9jsNq961i/LpkQ1qXyKNj3X
 h7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9QZgh22M+ts7wnAbDENlpUJosc80GCJNMZ0pBHax8eo=;
 b=JohE8/+cp5RWQf+7VJ+1m82C0tzrII+FeAoJSkeIW1mySKRWufM9P3FWJ0tIo6qshV
 2rsqTbXmvIlk3W9SF2AQEtONOQV+xJCnYzXJKYz8l2X+hb/gsvPEqbCkgdFyPrIVMC0+
 5whm9E97pEdcxBJbvm3KL9EUhDmf3lcQ1k1lKTfaUHUoMyZlSy7PnaAjcoCYQQedydo3
 k9wrqeHv/eDdwww8IeDw0XxLXRgNzGm6VIoebzSPGtcqWZ+vRUOh3OEg28+ycpnLoxIQ
 LYMDw/lfvrGyzQfBHLkAgZgxkM0W1k2emYGD52sPxxC69QSp3Oayubauz8pMQOfRU3Ws
 7v3w==
X-Gm-Message-State: APjAAAVXsYfzjjItJXWuf61iLD/qFHNVo1HgJULBnREXJg43PyvKGKsw
 9N7xG5/ZPxi4ZW62F4l5v0EHihdNqeVQ4vx1K4M=
X-Google-Smtp-Source: APXvYqxzfkqUOIdzwY9KPSNiAhGUAHkFiE7yoOUqg1CGC3tfVS4eX5Q3pQSifAWW5jgTMCVyAAbulK6lJFhdCtyMmAk=
X-Received: by 2002:a19:7709:: with SMTP id s9mr15246531lfc.86.1563322657174; 
 Tue, 16 Jul 2019 17:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559944445.git.alistair.francis@wdc.com>
 <CAFEAcA95grVBoiCbMAeZYTXYxc6nhjx1EM6=05G_3Qqpp8obNQ@mail.gmail.com>
In-Reply-To: <CAFEAcA95grVBoiCbMAeZYTXYxc6nhjx1EM6=05G_3Qqpp8obNQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jul 2019 17:14:19 -0700
Message-ID: <CAKmqyKPPtSHSBMvrVxwi1aX=oPSEfxxpD-QQ=ym2ymvcvk5z0w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 00/27] Add RISC-V
 Hypervisor Extension
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
X-List-Received-Date: Wed, 17 Jul 2019 00:17:43 -0000

On Mon, Jul 15, 2019 at 5:00 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 7 Jun 2019 at 23:03, Alistair Francis <alistair.francis@wdc.com> wrote:
> > At the moment this spec is in a draft state and is subject to change. As
> > QEMU is extreamly useful in early bring up I think it makes sense for
> > QEMU to support non-frozen extensions. I would like to decide with this
> > series how QEMU will handle all future non-frozen extensions. That is a
> > standard way that QEMU users can test future RISC-V extensions while
> > still understanding things will change. One idea is just to disable it by
> > default, another option is to maybe use the Kconfig to make it a compile
> > time option which developers can use. Should we also display a warning
> > when running non-frozen extensions?
>
> We had an instance of this for Arm (though in fact the
> relevant patches to QEMU didn't end up getting into master
> before the spec was finalized in the end). My suggestion
> would be at minimum:
>  * by default non-frozen extensions should not be provided

Yep, these are off by default.

>  * they should be enabled via a command line option (cpu
>    property) whose name starts with "x-", which is our standard
>    way of flagging properties that are experimental and subject
>    to change or removal in future QEMU versions

Sounds good, I'll rename the property in the next version.

Alistair

>
> That way end-users know they're doing something non-standard
> that won't necessarily be supported in future by newer versions
> of QEMU, and if people copy recipes/commandlines/random guest
> images off old blog posts there'll be a hint that there's a
> reason why they don't work on newer QEMU that adheres to the
> final spec.
>
> thanks
> -- PMM

