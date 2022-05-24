Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntL2b-0000hT-K7
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 23:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ntL2a-0000gY-5S
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 23:17:00 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ntL2X-0006JS-O9
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 23:16:59 -0400
Received: by mail-yb1-xb36.google.com with SMTP id p139so28680604ybc.11
 for <qemu-riscv@nongnu.org>; Mon, 23 May 2022 20:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1u0Z2bVhq0pp04kSfRgLAhi3mMIoxmNaBi919Dw0/BY=;
 b=aEBgEaeyzkR2+xOLDO3QJOw2somqBNmT+lMmIaJrhuD/67GsWndvkf6mIQcQXvPBUI
 xlNCenh1PbWYbdTR6aeSF15nfTZhuqexwATuDDc0Zh7Uj3rcUvnxb+jyjcseXGSit03Z
 /I3gXqgc6utA5KYJcxl65gn1LkNP28GDG3WG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1u0Z2bVhq0pp04kSfRgLAhi3mMIoxmNaBi919Dw0/BY=;
 b=gA3c8zLu1ftjj5klV+Dh74FcWLfFZhrglrMLVSfU5WUeuGhEIwcbRVKGltm9zDUAdj
 KkXfYw0mVGT7eiXROwHyEfwDoAfdc7Bf16oUEVx3yPXa6I9ELHona78+/Bkb3GLBulw3
 /aZ8xvgRDAcoSo70LudFbYXBJo1sOjQzGc+W4DgKNoJPl5w1hevoJPZg4m6sT7LiBe/V
 n6KgpLgLP8bCMRJ0R+NjoA9/CBYhcFKP1qK2bOy6wqmnxvnyfekS1gMxzdEGwWL8Ae+D
 BFOqkWdK65suSyLpTUmQwGYGjdoCgcMMCsngIIMAt5qClP8WdXNYTphKKm46/4gnqfpm
 sEwQ==
X-Gm-Message-State: AOAM530WQnbqLgjrAIKWkcCL7wlZXfXEwRKBezkEXtqdOqTFF3aSg/+4
 mLH86bGZPiAzywobvrU1R5DEIhd4ZLnHkxxr73F+
X-Google-Smtp-Source: ABdhPJxyRdb+uAXRfiXy9M3kRicV7C2LGGqU0M/mFY+oxqoRwQitVu4pTu7J683odoPTsTW4vFqgbQmfiefZLabajRg=
X-Received: by 2002:a25:dfc9:0:b0:64f:6564:bb38 with SMTP id
 w192-20020a25dfc9000000b0064f6564bb38mr16613357ybg.74.1653362210867; Mon, 23
 May 2022 20:16:50 -0700 (PDT)
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
 <CAKmqyKOC0Fgu7WUXRcAJZNmVR8GeiXHGh4K8fg+5_c+pvZR_7w@mail.gmail.com>
 <CAOnJCU+i3m5OjM-wBf+t58YP9k5Jd0VeBK_yoPSPtzoE68H2EQ@mail.gmail.com>
 <CAKmqyKO5sUspA5d57r62phQ7qpBs7A0S_3XdF+sLmUV5kKwZMg@mail.gmail.com>
In-Reply-To: <CAKmqyKO5sUspA5d57r62phQ7qpBs7A0S_3XdF+sLmUV5kKwZMg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 23 May 2022 20:16:40 -0700
Message-ID: <CAOnJCU+Pos0fTWj7C7rhVEa1QV7YsJa4MyO57CFMGFfs_hHR5A@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 24 May 2022 03:17:00 -0000

On Sun, May 22, 2022 at 10:59 PM Alistair Francis <alistair23@gmail.com> wr=
ote:
>
> On Wed, May 18, 2022 at 4:38 PM Atish Patra <atishp@atishpatra.org> wrote=
:
> >
> > On Tue, May 17, 2022 at 1:54 PM Alistair Francis <alistair23@gmail.com>=
 wrote:
> > >
> > > On Tue, May 17, 2022 at 6:52 PM Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote:
> > > >
> > > > On Tue, May 17, 2022 at 03:03:38PM +1000, Alistair Francis wrote:
> > > > > On Sat, May 7, 2022 at 6:30 AM Atish Kumar Patra <atishp@rivosinc=
.com> wrote:
> > > > > >
> > > > > > On Fri, May 6, 2022 at 4:00 AM Peter Maydell <peter.maydell@lin=
aro.org> wrote:
> > > > > > >
> > > > > > > On Fri, 6 May 2022 at 09:18, Daniel P. Berrang=C3=A9 <berrang=
e@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis =
wrote:
> > > > > > > > > Even if we didn't worry about backwards compatibility the=
 current virt
> > > > > > > > > machine would still be what most users want. It's just a =
small number
> > > > > > > > > of users who don't want MMIO devices and instead want to =
use PCIe for
> > > > > > > > > everything. Realistically it's only HPC users who would w=
ant this type
> > > > > > > > > of machine, at least that's my understanding.
> > > > > > > >
> > > > > > > > I'm not so sure about that. Every other architecture has en=
ded up
> > > > > > > > standardizing on PCI for general purpose virtual machines. =
IIRC,
> > > > > > > > aarch64 started off with MMIO, but switched to PCI as it ma=
tured.
> > > > > > > >
> > > > > > > > In terms of having VM mgmt tools "just work" for risc-v, I =
think
> > > > > > > > it will be very compelling for the general 'virt' machine t=
o be
> > > > > > > > PCI based, otherwise all the assumptions about PCI in mgmt =
apps
> > > > > > > > are going to break requiring never ending riscv fixes.
> > > > > > >
> > > > > > > Mmm, my experience with aarch64 virt is that PCI is much nice=
r
> > > > > > > as a general preference. aarch64 virt has some MMIO devices
> > > > > > > for historical reasons and some because you can't reasonably
> > > > > > > do the necessary things with PCI, but I'm actively trying to
> > > > > > > push people who submit new MMIO device features for virt to
> > > > > > > try to use a PCI-based solution instead if they possibly can.
> > > > >
> > > > > Interesting...
> > > > >
> > > > > Ok, maybe calling this "virt-pcie" might be a good start, with th=
e
> > > > > expectation to eventually replace the current virt with the new
> > > > > virt-pcie at some point.
> > > >
> > > > Delaying the inevitable by leaving PCIE support in a separate
> > > > machine type initially is going to be more painful long term.
> > > >
> > > > > The other option would be to try and gradually change from the cu=
rrent
> > > > > virt machine to this new virt machine
> > > >
> > > > Yes, I really think the 'virt' machine type needs to aim for PCIE
> > > > support sooner rather than later, if RISC-V wants to get on part
> > > > with other architectures. The best time to have added PCIE support
> > > > to 'virt' was when it was first created, the next best time is now.
> > >
> > > So maybe instead we lock in the current virt machine as the 7.1 virt
> > > machine for QEMU 7.1, then work on migrating to a PCIe only machine
> > > with versions (similar to the other archs)
> > >
> >
> > I am not quite sure what exactly you mean here. Do you mean to modify
> > the current virt
> > machine to be PCIE only after QEMU 7.1 or the new PCIE only machine
> > (with the versioning)
> > which will be the default machine in the future
>
> I mean that we call the current virt machine the virt machine for QEMU
> 7.1. Then for future releases we can make breaking changes, where we
> have the old 7.1 virt machine for backwards compatibility.
>
> >
> > If you intend to say the former, few issues with that approach.
> >
> > 1. virt machine is not well documented and already bloated. There is
> > no specification for virt machine as such.
> > Putting restrictions after a certain release will lead to confusion.
> > 2. Do we support existing MMIO devices after that specific version or n=
ot ?
>
> Yeah, so I guess this doesn't achieve the same outcome you want. I
> would say we would still include some MMIO devices, like UART for
> example.
>

Why ? We can just rely on the pcie based uart (virtio-serial-pci or
serial-pci) should be enough.
The only MMIO devices that should be allowed are the ones that can't
be behind pcie.

> But we could simplify things a bit. So for example maybe we could use
> AIA by default and then remove the PLIC code. That would help cleanup
> the board file. Then we could add a `msi-only` option that would be
> similar to https://github.com/atishp04/qemu/commit/d7fc1c6aa7855b414b3484=
672a076140166a2dcd.
> But without the PLIC it should hopefully be cleaner
>
> We would need AIA ratified before we could remove the PLIC though.
>

And AIA patches available in the upstream Linux kernel.
Even after that, can we just remove the PLIC ?
That would mean everybody has to use the latest kernel with AIA
support after that.

> > 3. The user has to be aware of which version of virt machine it is
> > running in order to test specific features (i.e. flash, reset, wired
> > interrupts)
>
> That's true, but I think we are going to have this issue someday
> anyway. We don't want to use the SiFive CLINT and PLIC forever,
> eventually we will want to use the newer hardware.
>

Agreed. But It should be disabed by default at first. In the future it
can be removed.
Otherwise, we end up breaking a bunch of user configurations.

> > 4. Based on the version of the virt machine, the command line options
> > will change. This may also be confusing.
> >
> > On the other hand, the second approach will be much cleaner without
> > any baggage. The RISC-V eco-system is still maturing and this is the
> > right time
> > to start something fresh. Let's call the new machine virt-pcie for
> > now. Here are a few things that can be implemented for this machine.
> >
> > 1. It must support versioning and any changes to the machine code must
> > modify the version of the machine.
> > 2. It must only support MSI based PCIe devices. No support for wired in=
terrupts.
> >     The only allowed MMIO devices are
> >            -- mtimer/mtimecmp (there is no other option provided in ISA=
)
> >            -- reset/rtc device (If there is a way we can emulate these
> > two over PCIe, that would be great)
> >            -- flash
> > Beyond this, adding any other MMIO device must be strongly discouraged.
> > 3. The virt-pcie machine must be well documented similar to a hardware
> > specification (including address range, restrictions and
> > implemented/allowed devices)
> > 4. No dependence on virtio framework but must work with virtio-pcie bac=
kend.
> > 5. Migration must be supported.
>
> I'm on board with these! They would all be great to have.
>
> I'm open to a virt-pcie, but as others have pointed out it might be
> easier to just make the switch now to the general board.
>
> > 6. No command line option is required.
>
> I don't see this being achievable unfortunately
>

I meant no command line configurability options for the machine
itself. We probably should
allow using different versions of the machine via command line.

> > 7. Any other ?
> >
> > Once we have these policies in place, this can be the preferred virt
> > machine and the current virt machine can be phased out or continue to
> > co-exist
> > as a more flexible experimental platform.
> >
> > Thoughts ?
> >
> > > Alistair
> > >
> > > >
> > > > With regards,
> > > > Daniel
> > > > --
> > > > |: https://berrange.com      -o-    https://www.flickr.com/photos/d=
berrange :|
> > > > |: https://libvirt.org         -o-            https://fstop138.berr=
ange.com :|
> > > > |: https://entangle-photo.org    -o-    https://www.instagram.com/d=
berrange :|
> > > >
> >
> >
> >
> > --
> > Regards,
> > Atish



--=20
Regards,
Atish

