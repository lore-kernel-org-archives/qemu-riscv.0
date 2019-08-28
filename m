Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2moE-00041C-RF
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 21:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2moB-0003xg-Q4
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 21:31:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2moA-0000iw-Ij
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 21:31:35 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:37736)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2mo7-0000hr-BU; Tue, 27 Aug 2019 21:31:31 -0400
Received: by mail-ed1-x542.google.com with SMTP id f22so1071564edt.4;
 Tue, 27 Aug 2019 18:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W7dqPjoSbujUxcBOuGdafKg8+6+k+/MwA4ZEmbNW6HQ=;
 b=gCVGmlhT9NSMSsWn1mE5n5q+ie7vrCOaa9zxZfJZxFv/XpoifWwC94nvmFCEESCWRP
 pNTNU6cMphGbAcV/He9qM9v6+WHVGpRgtNchFx69tP/x+0pD+zMEI8Yy+1PKSd27cKgx
 Tlq75Uq3pHRP9lLzyS3sTmblu1NgGN3xoRsgQ2Iq00avEkSTgjMJvN2ZSkDNA3kaq7Lk
 jG8/sBSWmTFB0qSaRDWR7GIqUrdxAHVPniXoww8C/RC1KTH/UiVL6GRFKovWdTGH+jK5
 MGsxqJyolaOs2oDWDc51wlfcB7QbYm86Ynr6vg56fG/O092HcSymlghw9Qz3v+vR35gW
 TM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W7dqPjoSbujUxcBOuGdafKg8+6+k+/MwA4ZEmbNW6HQ=;
 b=GtvLOAPZBb5bEAWBW09CZscYzEaIBSkUUTTyGRsBg01o2TJ8DzCyVKa3mEwG4DOaMP
 Kf/PVFbsh9qcdTY97yz1qDgkLIjMUnXTHuorTBbaJJyN8orGM7LKO/rgPl5RSmDtAqVM
 WVldlM3HIYReU7Bgqjl6L7N8g/fsFRrxoK6dadsEhNJpimrkj+I/O5Sc4UHHJa8IHZM2
 EkiZx/b7sTpIGpoWN8/Qjp/58aRL9opOGgxkEkcA39OyLXBOXzUFd+Il8SW3HwXY41n3
 xXWIyAa7EmgNbtj3YiAjDgrebVLeiC3sML5jEhzNF6VHDxXLC5XBZVQr1BQT9SnlgdR3
 E4Gw==
X-Gm-Message-State: APjAAAVtRjXpPuej7cq99NMpAe1GgckKRi4XPgiBvISptzM1awOZCOTo
 4EXyUqZPe0y5gA4JbwwdooQCCNCVmAome1O3/ls=
X-Google-Smtp-Source: APXvYqyY9Dw02zpxxovA8non56TB0CpUV/k//pmrrwSgEqS73a+rD42nLY66UZYVtQS3KYjoPvz0hWBVdoG2cSEbq7o=
X-Received: by 2002:a17:906:81cb:: with SMTP id
 e11mr1002656ejx.37.1566955889911; 
 Tue, 27 Aug 2019 18:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmWacQtwTRYhCw6GwfGBabrWbe2Ss2JVCJ5XE7s3bVE-gA@mail.gmail.com>
 <mhng-e6db993a-530d-4220-8345-59a8b642a5ac@palmer-si-x1e>
In-Reply-To: <mhng-e6db993a-530d-4220-8345-59a8b642a5ac@palmer-si-x1e>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Aug 2019 09:31:18 +0800
Message-ID: <CAEUhbmV5fWqzPcdWW52n7DTczTtoLfbmE0HhLCz1jsgcNbLwRA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-riscv] [PATCH v4] riscv: hmp: Add a command to show
 virtual memory mappings
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
X-List-Received-Date: Wed, 28 Aug 2019 01:31:37 -0000

Hi Palmer,

On Wed, Aug 28, 2019 at 7:18 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Sun, 18 Aug 2019 22:59:54 PDT (-0700), bmeng.cn@gmail.com wrote:
> > On Wed, Aug 14, 2019 at 11:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> This adds 'info mem' command for RISC-V, to show virtual memory
> >> mappings that aids debugging.
> >>
> >> Rather than showing every valid PTE, the command compacts the
> >> output by merging all contiguous physical address mappings into
> >> one block and only shows the merged block mapping details.
> >>
> >> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> >>
> >> ---
> >>
> >> Changes in v4:
> >> - restore to v2, that does not print all harts's PTE, since we
> >>   should switch to a cpu context via the 'cpu' command
> >>
> >> Changes in v3:
> >> - print PTEs for all harts instead of just current hart
> >>
> >> Changes in v2:
> >> - promote ppn to hwaddr when doing page table address calculation
> >>
> >>  hmp-commands-info.hx       |   2 +-
> >>  target/riscv/Makefile.objs |   4 +
> >>  target/riscv/monitor.c     | 229 +++++++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 234 insertions(+), 1 deletion(-)
> >>  create mode 100644 target/riscv/monitor.c
> >>
> >
> > Ping?
> >
> > What's the status of this patch?
>
> This is in my patch queue (for-master on github).  I'm still a bit backed up on
> email, but when I get caught back up I'll send a PR.

I double checked your git repo, and found you applied an older version
of this patch.

Please drop that, and apply this v4 one.
http://patchwork.ozlabs.org/patch/1147104/

Regards,
Bin

