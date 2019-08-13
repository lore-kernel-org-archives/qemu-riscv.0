Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxWPd-0002T6-S8
	for mharc-qemu-riscv@gnu.org; Tue, 13 Aug 2019 09:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55649)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hxWPT-0002Pq-N5
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 09:00:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hxWPP-00015I-Sk
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 09:00:17 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39193)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hxWPO-0000vp-H5
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 09:00:14 -0400
Received: by mail-ot1-x344.google.com with SMTP id b1so3875350otp.6
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2019 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SD3PU5S1bg8AfupUXQScTw0ujoqLYw+MEu0wWMAtd8w=;
 b=YFuaIXKIxsZSHMkmP9+R7mvSo3nGVD4vANc5asjXTxrhqwRpk7dvETViYpKzC2D2pl
 4B4KhsBCEKSqyRjRhsoR8qmehoqeH6NQ9ODso+BtGM28hSih2dDgQv6DJWsRzVEGiE12
 pcKHm2e86PzMyTMeMgHo6yyWCN54845T1llwwY2x+AK0HTqP3DLdqw74rroA0yEZRvFA
 dh8iLf+/H1k+yxPYix/cM5y0PqqSocb+ujr3WHLjNV+1GKMG0jcECyXwfN2EjAM4Nt0l
 ORMJeL5jOurNyPnwncopAkiI0c6gxjwFmbQZbwCbcPgJO4HteOsUERe6hnPagTmecf6k
 nckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SD3PU5S1bg8AfupUXQScTw0ujoqLYw+MEu0wWMAtd8w=;
 b=CPqMBWlmKFflFeRKr0n8IyGJhfE0+7IKp8ncmFjrImqcxUkvN3/7x2yDGQykPABBTr
 nswS8JmJdWZvXqaL3oAvMYivKg9wJslGHTQpTQ6YYsqylglwbUsFBN7CMzGlFqv6J6GY
 bpTpQd9DMLOYPuY45ypSTlGwVjDHmvRjFYeY5hCfv5WHCRTjPAi6JY14xIeo3sBRCdaC
 L0fNzqVilyqRWQ478plyVykZk4GeuFrCVBOBacPGs71E8Zf3OFL/0MXBHkzCQYEA8EGN
 4IzjqxR9nxnt0K2yh5yoTEgHvtrFnXGItiu4g8DjP64utgKAZvKiTfqbsumE4CKFnRke
 USBg==
X-Gm-Message-State: APjAAAVR2eyLKSLcY/KT/Fkgo2Buwtcr5txFb0yxuI+BudRxP/HyhnUq
 FogUbce95E6lzTRfRSohi9KDMJt4o1E3f2VX5269MA==
X-Google-Smtp-Source: APXvYqwNsREV+X2QIy5JwHGjXSn70VVyCSgWmtwNhXj6Cq1Nk6DojSdQ3tIyzfrJidIz00kMpZuy3JzDWZfiGk4bXEM=
X-Received: by 2002:aca:4a57:: with SMTP id x84mr1467802oia.170.1565701212317; 
 Tue, 13 Aug 2019 06:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <1564812484-20385-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPW-nMc2zV-VwG_sY9ca7uSenUJW+mEcV2qaKT5dELmgA@mail.gmail.com>
 <CAEUhbmWwkMR4xKu9v=10ePj=feJ7b7e5Ko75zv1xMBf+JrVwwA@mail.gmail.com>
 <CAFEAcA91uvheC1gdu7DZSkaVtgA3Laoob6G+bQMQOdfsQj9aSA@mail.gmail.com>
In-Reply-To: <CAFEAcA91uvheC1gdu7DZSkaVtgA3Laoob6G+bQMQOdfsQj9aSA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Aug 2019 14:00:01 +0100
Message-ID: <CAFEAcA-J_QHUX4cnrTgtKLrRmOtBwzEP1fg1HTjWP5geENw50A@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [Qemu-devel] [FOR 4.1 PATCH] riscv: roms: Fix make
 rules for building sifive_u bios
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
X-List-Received-Date: Tue, 13 Aug 2019 13:00:26 -0000

On Mon, 12 Aug 2019 at 09:38, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 11 Aug 2019 at 08:17, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Palmer,
> >
> > On Tue, Aug 6, 2019 at 1:04 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Fri, Aug 2, 2019 at 11:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > Currently the make rules are wrongly using qemu/virt opensbi image
> > > > for sifive_u machine. Correct it.
> > > >
> > > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > >
> > > Good catch.
> > >
> > > @Palmer Dabbelt can you take this for 4.1?
> > >
> >
> > Is this patch merged for 4.1? Thanks!
>
> Sorry, it doesn't look like it is, and it's now missed the
> deadline for 4.1 (only critical showstopper bugs and security
> issues would go in at this point).

Since a very late ppc pullreq turned up which needed to also go into
rc5 and meant we couldn't just have a single-change rc, I figured this
was safe enough to also apply for rc5, so I've put it in.

thanks
-- PMM

