Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hj7WD-0008Pz-1h
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jul 2019 15:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hj7WA-0008NL-Ny
 for qemu-riscv@nongnu.org; Thu, 04 Jul 2019 15:35:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hj7W9-000803-M2
 for qemu-riscv@nongnu.org; Thu, 04 Jul 2019 15:35:42 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36670)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hj7W8-0007yr-GQ; Thu, 04 Jul 2019 15:35:40 -0400
Received: by mail-lj1-x243.google.com with SMTP id i21so7095546ljj.3;
 Thu, 04 Jul 2019 12:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E6Tcmt5otAUU2XTXCLw1nuAqN5iG/uBQgQi3iOtPumc=;
 b=qHLW2V5O7gtnNeTdoLPa83c0cebJN/VbaSL7HP4WIo7iDvcCXALcAd53v/nzqQ36ep
 jAaghOBBpducG4406sfuFHzJSe+3v+DFdbhMqk3fkjO7owVOyOx6FtDfBZq+ExgaSPLY
 pLztlcIi+rdBqE9wQVm2Gt0MSHyD1ZBD62r1ndd/drZ2zhUYUVwaE1SItPJ7Luhc5Dlv
 pzz2o7atPBqjmB3tjOJYqEWefWNWe7SSew0YYgYrDZnrOcQa2ZhofMBfrW8ITndfMExL
 /HI53XWA6do7xTMnFNBSLoPyXX1Rn7lVM0KD4+i576sIhDh6vzh8TLp3uNx0bOyOH8bh
 1oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6Tcmt5otAUU2XTXCLw1nuAqN5iG/uBQgQi3iOtPumc=;
 b=gVKbLr4j0TzGCLunJn0SVTQOeO2ixLdS1Cj1YHDxRp5elQ1t3rVJbxtB3n9t5NrUnR
 2/oGYrsFKuh+Eng7SeXwBGq5+WeRCICQMu+jIDyshDHao5QrTzX9jgwYAEYEVZf1/OTY
 JBY9kDLTp86DWi3qRPnEIeOlnYWszcX4d5bk0OSodxAKMAjAkpG1UzZJLT36LwaSYfgY
 ErgE3ps59wi2BfexZuYlJNG01eQ68RuZz3NoVfOTjTI6iFghFOpwnvX/pnFTRedv/ehR
 dyz3tdSZONB3ox8OUesZ5otsmcUn8XgmXAfvMERMX12Yp9hXnANWwugkv1aBQnRi6tjY
 VMQw==
X-Gm-Message-State: APjAAAVfpHx+k0JlDEXLg2pbZmrY5Cdo244VVIJy/t0M1mzBWm3NtUXL
 lma30WZyIoP5dIcz13ZQ0dd25+ZnJPzviaWm5pA=
X-Google-Smtp-Source: APXvYqztp20KGV7BgMUNNQKoDLCsYmWq67+Ef8IVLBcmo+DPQzuBUZ4149vLtBB40Sw2LmdtOZN9Rz58oZRq3US698I=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr20206890ljg.33.1562268939114; 
 Thu, 04 Jul 2019 12:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-34-palmer@sifive.com>
 <CAFEAcA8sscJQ2GCwL1gM+EcRtfHQb1v0BwORt6ncH54x51TCVg@mail.gmail.com>
 <5896113812cd914308e5b617377f8e8205224cfe.camel@wdc.com>
 <CAFEAcA_-h6b_f1fuWh7NkGo+FT0xSyCDXgd3b4pwEvNDN8HcJw@mail.gmail.com>
 <20190704160055.GH1609@stefanha-x1.localdomain>
In-Reply-To: <20190704160055.GH1609@stefanha-x1.localdomain>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jul 2019 12:35:12 -0700
Message-ID: <CAKmqyKPxu-vWmfHsv=L=60_aU8JRtc5mQrS9KTcbWSA5j6siig@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "palmer@sifive.com" <palmer@sifive.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 Jeff Cody <codyprime@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 33/34] roms: Add OpenSBI
 version 0.3
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
X-List-Received-Date: Thu, 04 Jul 2019 19:35:43 -0000

On Thu, Jul 4, 2019 at 9:11 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, Jul 01, 2019 at 07:01:12PM +0100, Peter Maydell wrote:
> > On Mon, 1 Jul 2019 at 18:50, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> > >
> > > On Mon, 2019-07-01 at 17:54 +0100, Peter Maydell wrote:
> > > > On Thu, 27 Jun 2019 at 16:24, Palmer Dabbelt <palmer@sifive.com>
> > > > wrote:
> > > > > From: Alistair Francis <alistair.francis@wdc.com>
> > > > Also, new git modules in .gitmodules should be qemu.org
> > > > URLs, not random external ones. (ie, we should set up
> > > > mirroring of any new external repo we start shipping
> > > > code and binaries for). We can set this up and fix up the
> > > > gitmodules file after the fact, but the ideal is to do
> > > > it in advance rather than afterwards.
> > >
> > > Ok, who can setup a git mirror for the QEMU repo?
> >
> > That would be Jeff or Stefan (cc'd).
>
> Please let me know when you're ready and I'll set up a git mirror.

I'm ready whenever. We have a long weekend here so I'll be back at
work on Monday and send the new version of the patch with version 0.4
of OpenSBI.

>
> Your commit can be merged as normal and then I'll send another one
> updating it to a git.qemu.org mirror.

Works for me. If the mirror is setup by Monday I will use it in the
first commit as well.

Thanks for helping with this Stefan

Alistair

>
> Stefan

