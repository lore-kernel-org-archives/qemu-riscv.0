Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iyHNW-0007BR-6R
	for mharc-qemu-riscv@gnu.org; Sun, 02 Feb 2020 10:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46637)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iyHNT-00077W-1X
 for qemu-riscv@nongnu.org; Sun, 02 Feb 2020 10:41:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iyHNR-0003i7-Vg
 for qemu-riscv@nongnu.org; Sun, 02 Feb 2020 10:41:38 -0500
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:45359)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iyHNP-0003hf-WA; Sun, 02 Feb 2020 10:41:36 -0500
Received: by mail-yw1-xc44.google.com with SMTP id a125so10801048ywe.12;
 Sun, 02 Feb 2020 07:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VpU2W+xxgZ2vfl3s+1srXH3KZg4ei/nLlAhyyMcYKzM=;
 b=SgE9efZGKBVBCEY8dBywF1JSUUruDbtuAUeCxNYr/QUlmKoP73v1hgdwelNd8QeNoX
 qLG9/zrr71avw4KF8bAHborGSHnGRthSAmrfhpRb74L6D5dxTq7wVb2trBzsF5cfKKPV
 Ub3WYjkLk91mWmv381HnSJSka2/D/MCuHHUvrX5JDqhAEqePtPp9TqmK6N3yXFc/RS0U
 q513g3w7oaMPrUt4v7ayfqliOBr8IuA9NWPzyev1bffWenfBtcNJKhx/XYHy5skP3Pn7
 8WY7b2ALgJcWYwxGoSHetpZ/TlipF3s5tmmgS14/xMBoDGkAtLJt1/JJ9rjm+HbI8/re
 eWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VpU2W+xxgZ2vfl3s+1srXH3KZg4ei/nLlAhyyMcYKzM=;
 b=RDlQLqAH2rBg84LnHWZV+CFJHa7D7cJxbpnrkvUJ+ZyvNOMGZXuIZVqlBrHD56Ezim
 b0QRRiBAQB0Wr5u/oaueL8vhshd1K3X41MZJfZe1EkDXfvbIES+P4UiKNmefMMVrGTif
 eYj7b94frVJ9dOpd2sIyZQUQUh7IcjGi4x1iTi6Yn1EgMJRvjko23zj2Ybgiv9/eqRYN
 9zJkaUJDjex99Hj25E2s8lj/Noj2E2GcvFfmSVdyJlLzb2keuPa9dsPs8rMl7FvNRkkO
 bZeW0zsbzq6onoMXdNolQJp5hMFwwmStiEUGrcGLCniqSBw4H9PbLkK75I4b3UpMfyy2
 NnCQ==
X-Gm-Message-State: APjAAAWHWCilLHGrD999WjBr/XMLa3BkQiO6Q5cOT2xJYculLyOZEcjI
 bE9c7DlSotLeENtYa5UykSp1ECb43C8aHl+xwrc=
X-Google-Smtp-Source: APXvYqwe9tYehsgARO3bjUMAjtloO9yutDhefTOUvVYgy30EeVjgQnLDM6kXOBPivhrN3cdgI6qGiKUZrpi3oVW/0o0=
X-Received: by 2002:a81:4685:: with SMTP id
 t127mr14542067ywa.280.1580658095048; 
 Sun, 02 Feb 2020 07:41:35 -0800 (PST)
MIME-Version: 1.0
References: <1574436472-6017-1-git-send-email-bmeng.cn@gmail.com>
 <mhng-9c6e7c80-7375-4bba-8ba5-7b9a6eb141d7@palmerdabbelt.mtv.corp.google.com>
In-Reply-To: <mhng-9c6e7c80-7375-4bba-8ba5-7b9a6eb141d7@palmerdabbelt.mtv.corp.google.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 2 Feb 2020 23:41:25 +0800
Message-ID: <CAEUhbmXK7rmgkjP1XtQArtSiFQMH3tazWnRnF8MJDMMi0x-EFQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: virt: Allow PCI address 0
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
X-List-Received-Date: Sun, 02 Feb 2020 15:41:40 -0000

Hi Palmer,

On Sat, Nov 23, 2019 at 6:41 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Fri, 22 Nov 2019 07:27:52 PST (-0800), bmeng.cn@gmail.com wrote:
> > When testing e1000 with the virt machine, e1000's I/O space cannot
> > be accessed. Debugging shows that the I/O BAR (BAR1) is correctly
> > written with address 0 plus I/O enable bit, but QEMU's "info pci"
> > shows that:
> >
> >   Bus  0, device   1, function 0:
> >     Ethernet controller: PCI device 8086:100e
> >   ...
> >       BAR1: I/O at 0xffffffffffffffff [0x003e].
> >   ...
> >
> > It turns out we should set pci_allow_0_address to true to allow 0
> > PCI address, otherwise pci_bar_address() treats such address as
> > PCI_BAR_UNMAPPED.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/riscv/virt.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 23f340d..411bef5 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -603,6 +603,7 @@ static void riscv_virt_machine_class_init(ObjectClass *oc, void *data)
> >      mc->init = riscv_virt_board_init;
> >      mc->max_cpus = 8;
> >      mc->default_cpu_type = VIRT_CPU;
> > +    mc->pci_allow_0_address = true;
> >  }
> >
> >  static const TypeInfo riscv_virt_machine_typeinfo = {
>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> I've put this on for-next, as I don't think this is 4.2 material.

Looks you missed picking up this one :(

Regards,
Bin

