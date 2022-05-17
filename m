Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nr4DC-0007hI-FZ
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 16:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nr4DB-0007h6-Bd; Tue, 17 May 2022 16:54:33 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nr4D4-0002VI-3B; Tue, 17 May 2022 16:54:27 -0400
Received: by mail-il1-x12c.google.com with SMTP id b11so181501ilr.4;
 Tue, 17 May 2022 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+DHnimPwkwfEZWjk2imQyCkADHOh/gynavFbiUExZe0=;
 b=IRoQ/QPZb8V3iihgK275OywFj5iCyA4E9VNzX9RNKd+sy0hl9JikGtz1/rzJ4uP1sI
 LR/zLCw+CbTmV6HUzb6fNJm+xSSGmQTQ0hE6a6c//07jfAyobkUPYbw7wEKJsmmTXvCu
 049bF5DA+il/C/3nHJjvYvchx5Iyolaj1mlWcJWxLjI7qmRUe35WP/RgtfxemFL7BPZw
 eF5ELIg1eJQB70BzcOkbCQD9FAkVDpzy8qGMydMBHw3RgLT/5VrqMPIPMbhU6ErfEMsW
 2WLt6M11+Lfh4bpV+f6zpepl9gINzJ9TetdxxSGSGyyvIRpd1ZDsAeKgjUp9WPtPT7g4
 U20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+DHnimPwkwfEZWjk2imQyCkADHOh/gynavFbiUExZe0=;
 b=MPOLKCq9CinwD9RD5zc7mwVdQjbwr1VqNi/Nwsh10VPOpVRtTdvJ6SyrvCS1ISz6kc
 cYEParfeb5U0opcdtBo0UjbXL2gEcytE6Q+TgwdMekXgvL/sL4FELGJTpngmZUsGS5hf
 RhmGDSZdV/nDmvJ4pBk+tgBIoE2p2Q3IsTMMQYqUZqrCpWgZaUb6bYq+hVNnt0kxCnsX
 ZJxTwNSy1KOXM0+5KQnM474ikT81TAC00MHpLwKgnVA4RIlwDL/iiIRhuHeFvLm/XLKi
 2e3ZdPnOwIuXY/T8w19PB1hVhueBmzR3D5JnJiha+vPQbNe9nmhy0oPfAgEIFAWsPsYX
 fGNg==
X-Gm-Message-State: AOAM533oLq9MfeMBYsMKHGAGUG6hwbDhYENPj1Je8Meu7/4+c6SFEjCN
 nGtbRV5YXyF34FwbpbtamIiWvM0lloPq2RUDzkE=
X-Google-Smtp-Source: ABdhPJwZbb3ua4NmYYeCJMLtomqkU/zAeiiia3gmhY9wEW8ddr0F+b++TN6gt+2Uba0j1h3rsA8hFhup5zXRo5JbTOI=
X-Received: by 2002:a05:6e02:1986:b0:2cf:908d:3d0a with SMTP id
 g6-20020a056e02198600b002cf908d3d0amr12754458ilf.113.1652820864157; Tue, 17
 May 2022 13:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
 <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
 <YnTZP1iG+77Cugaq@redhat.com>
 <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
 <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
 <CAKmqyKPK_F7Z4-tM9k8+3yXDdSTSFagieH23vqoW+TciXpnYqA@mail.gmail.com>
 <YoNiPw/3e+CY0v7o@redhat.com>
In-Reply-To: <YoNiPw/3e+CY0v7o@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 May 2022 06:53:57 +1000
Message-ID: <CAKmqyKOC0Fgu7WUXRcAJZNmVR8GeiXHGh4K8fg+5_c+pvZR_7w@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Atish Patra <atishp@atishpatra.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2022 20:54:33 -0000

On Tue, May 17, 2022 at 6:52 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, May 17, 2022 at 03:03:38PM +1000, Alistair Francis wrote:
> > On Sat, May 7, 2022 at 6:30 AM Atish Kumar Patra <atishp@rivosinc.com> =
wrote:
> > >
> > > On Fri, May 6, 2022 at 4:00 AM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
> > > >
> > > > On Fri, 6 May 2022 at 09:18, Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> > > > >
> > > > > On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wrote:
> > > > > > Even if we didn't worry about backwards compatibility the curre=
nt virt
> > > > > > machine would still be what most users want. It's just a small =
number
> > > > > > of users who don't want MMIO devices and instead want to use PC=
Ie for
> > > > > > everything. Realistically it's only HPC users who would want th=
is type
> > > > > > of machine, at least that's my understanding.
> > > > >
> > > > > I'm not so sure about that. Every other architecture has ended up
> > > > > standardizing on PCI for general purpose virtual machines. IIRC,
> > > > > aarch64 started off with MMIO, but switched to PCI as it matured.
> > > > >
> > > > > In terms of having VM mgmt tools "just work" for risc-v, I think
> > > > > it will be very compelling for the general 'virt' machine to be
> > > > > PCI based, otherwise all the assumptions about PCI in mgmt apps
> > > > > are going to break requiring never ending riscv fixes.
> > > >
> > > > Mmm, my experience with aarch64 virt is that PCI is much nicer
> > > > as a general preference. aarch64 virt has some MMIO devices
> > > > for historical reasons and some because you can't reasonably
> > > > do the necessary things with PCI, but I'm actively trying to
> > > > push people who submit new MMIO device features for virt to
> > > > try to use a PCI-based solution instead if they possibly can.
> >
> > Interesting...
> >
> > Ok, maybe calling this "virt-pcie" might be a good start, with the
> > expectation to eventually replace the current virt with the new
> > virt-pcie at some point.
>
> Delaying the inevitable by leaving PCIE support in a separate
> machine type initially is going to be more painful long term.
>
> > The other option would be to try and gradually change from the current
> > virt machine to this new virt machine
>
> Yes, I really think the 'virt' machine type needs to aim for PCIE
> support sooner rather than later, if RISC-V wants to get on part
> with other architectures. The best time to have added PCIE support
> to 'virt' was when it was first created, the next best time is now.

So maybe instead we lock in the current virt machine as the 7.1 virt
machine for QEMU 7.1, then work on migrating to a PCIe only machine
with versions (similar to the other archs)

Alistair

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

