Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmy5F-0006I7-7I
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 06:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34095)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hmy5D-0006FS-6e
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 06:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hmy5C-0004wn-8C
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 06:19:47 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42360)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hmy5C-0004wD-2v
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 06:19:46 -0400
Received: by mail-ot1-x344.google.com with SMTP id l15so16372073otn.9
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2019 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lIY1LG0oQiWA/CK7da0hwk56l330aVFg5UDC40kBwXQ=;
 b=NJaxPXR7Jxrl287frgOPqUvn3TPAGVR8D51mxlNs4wgqa9WpgxvFK8ZBEC6fIl+NC6
 I2fp5C0ZBV2mjBtqlf8ZbeLgHO9v8InYaR/XrVnMCDaCDkn6wTO7TftqhWeH5eaKBlwW
 0pl68SOIoc5Q5sttFlzXlwrOHDUbYFcw8j85xotZ+eG4iP8gtWxP5nSX4qIXdSiOxtjN
 zwrqlsLcBV3Jkh3uTBLPstjqKp3tXJ2j4Xm+D2YfB6GjE1bEgF+wqXLAV4rHrkZL4znH
 ffufe8v+PsSRimk6XO9RWMDDATh8LAlMspwMZVUF7WFu1KCPmn9H6Lbo8aWjmadLpvD4
 UewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lIY1LG0oQiWA/CK7da0hwk56l330aVFg5UDC40kBwXQ=;
 b=VbMFW/yhK7WRqFkAixY5U15UTpIiOGCI/uYLXmKmIkz0958Gxkx5qror2zaW3+HTE0
 j7nx4hKKy8ghe8UYC9xwB6n0FG7pmoc3Rx8TXrgzpTUEY/OoS6uEhpFhamPc2Zos5U/l
 zh4nePsKlbxQtyAIORatRT3ICX37eYsFrcWcl/5iU7m11Lh3WIF1zjqPtPsiYpCCqaKx
 ZxjMjdIeQbXc9bJzGUaTwI7kXjchUo36IG9g75lgaMNr3SWAY8sB3hdNciZfmFjTGtDR
 jzrbTAmGhU/mGU8f1WUtzJUoTTG88XA0HZioaeojX9Z2Lw+cObUiYPXqMCZBoUpaDIZj
 rICw==
X-Gm-Message-State: APjAAAUuwlyc44kZj5+bWjpz/hPlynFtveTnVgZgCp3LPn77ba/Ty83e
 VY6ZPS3R7eplN8TcqJmQgww6ewa4Dx0h77kqN98OCw==
X-Google-Smtp-Source: APXvYqwY5x2NdkXEmb5pW4QRgblB22LwfzhIEghQtU0ZM7P+StztfmQHnnRzLE05wNJOPoy/IMlOSOz8hjPWBYoXMoc=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr14428381otn.135.1563185985085; 
 Mon, 15 Jul 2019 03:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
In-Reply-To: <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jul 2019 11:19:34 +0100
Message-ID: <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390" <qemu-s390x@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>, Richard Henderson <rth@twiddle.net>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 qemu-ppc <qemu-ppc@nongnu.org>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Helge Deller <deller@gmx.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [RFC PATCH 1/3] hw/Kconfig: PCI bus implies
 PCI_DEVICES
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
X-List-Received-Date: Mon, 15 Jul 2019 10:19:48 -0000

On Mon, 15 Jul 2019 at 11:15, Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/07/2019 11.55, Philippe Mathieu-Daud=C3=A9 wrote:
> > If a controller device provides a PCI bus, we can plug any PCI
> > daughter card on it.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---

> > diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
> > index 77f8b005ff..0f7267db35 100644
> > --- a/hw/pci/Kconfig
> > +++ b/hw/pci/Kconfig
> > @@ -1,5 +1,6 @@
> >  config PCI
> >      bool
> > +    imply PCI_DEVICES
>
> No, please don't change this. This was done on purpose, since almost all
> PCI_DEVICES do not work on s390x (so s390x does *not* imply PCI_DEVICES).

But that means that every board that provides PCI has to have an
"imply PCI_DEVICES" line, which is pretty clunky just to work
around an s390x limitation.

Is there some way in the Kconfig syntax for s390x to say
"no PCI_DEVICES" so we can have the corner-case be handled
by the s390x Kconfig in one place rather than in 20 places
affecting everywhere except s390x?

thanks
-- PMM

