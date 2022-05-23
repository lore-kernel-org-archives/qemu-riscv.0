Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nt16n-0007hy-43
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 02:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nt16j-0007hi-DN; Mon, 23 May 2022 01:59:58 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nt16f-0006rb-LR; Mon, 23 May 2022 01:59:56 -0400
Received: by mail-il1-x12f.google.com with SMTP id l15so9169335ilh.3;
 Sun, 22 May 2022 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4CcTaRfMXkaHVmysF5cM9D41ZTGwC8cPZK5AwezWo7I=;
 b=RpqEu4oGrDPncUdVk4uQPLDRTGKjdAH93w0Bfwdk1laYzUo0J7bleyW5Oc0dTgYBEI
 p8vvDtSpzrD1Zd64ZiTjBZHEMcRel+SgsJI7P2pRwTTFNAOtreTN3RZUrZtqFhGOoRHH
 xkEYIarPPotZnZEmYeOM7m2OGcqEFzxkZl/lZ1uAKyFOMxNt7bGhhmQd/wqsPRkF+V7H
 5DA2LdY4F8FvhR5LHBigMxjVl1hfqCFnu1fI/O9lTVdJnP+h8Po/rBvE1hFOWQ5nLY06
 kELciD34UAm2F1tanUjRT+Aiaddq/mFs1ATcNX/OsnD2C2eWeVqVTyWpbsRb9m3YZ1wR
 5mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4CcTaRfMXkaHVmysF5cM9D41ZTGwC8cPZK5AwezWo7I=;
 b=w7v3NnrkYbTtirjVA9YJytY71nUroMhjlwNpRySOe2/yThMC6ZFgc0NHhsK1kFKKMe
 QkDzmAaoONdvS4sQAsw5aWeRIrEfMcwtEnoTCdcE2uTKdua4v8yJVgJV1Uf6uP1KElby
 tb0/IehdG5Zd2ssffns5m/F9sd8t1ot4ZncZxrOWb4nCY6Euz2fW2lYg01yZ2VvX8B/M
 zVgrSvzyL9M+NMWpzHGLMBFjfS5l3ZWjHfGd1pOcGM7N9FewPCyQfjGCzrgawAatYAE+
 bpdi+JqzCaFo+0i6LP2pJls2ojIJfUd8rRbTsbelldgIgEFlyG59CnkHDa+rTRKHd9gt
 bj2Q==
X-Gm-Message-State: AOAM533Rraghb+pu1+L2Q04BCYZS3nkEZh5llYQBBNAE84P/MpQbzlDH
 K4XeKhF/0hKKd2sd/kcKD4+Im2T0gs6l05SiFB0=
X-Google-Smtp-Source: ABdhPJxQCg3eaKlV66qeto4HVdv6bCDgZUAUfti5CHLghLciZ2+wgmz4Kb3p3CdmhzqYOiOrmZ0OqLQxqkUOZOHEZlQ=
X-Received: by 2002:a05:6e02:188f:b0:2d1:58f:41a6 with SMTP id
 o15-20020a056e02188f00b002d1058f41a6mr10583940ilu.86.1653285586159; Sun, 22
 May 2022 22:59:46 -0700 (PDT)
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
In-Reply-To: <CAOnJCU+i3m5OjM-wBf+t58YP9k5Jd0VeBK_yoPSPtzoE68H2EQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 May 2022 15:59:18 +1000
Message-ID: <CAKmqyKO5sUspA5d57r62phQ7qpBs7A0S_3XdF+sLmUV5kKwZMg@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Atish Patra <atishp@atishpatra.org>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Mon, 23 May 2022 05:59:59 -0000

On Wed, May 18, 2022 at 4:38 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, May 17, 2022 at 1:54 PM Alistair Francis <alistair23@gmail.com> w=
rote:
> >
> > On Tue, May 17, 2022 at 6:52 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Tue, May 17, 2022 at 03:03:38PM +1000, Alistair Francis wrote:
> > > > On Sat, May 7, 2022 at 6:30 AM Atish Kumar Patra <atishp@rivosinc.c=
om> wrote:
> > > > >
> > > > > On Fri, May 6, 2022 at 4:00 AM Peter Maydell <peter.maydell@linar=
o.org> wrote:
> > > > > >
> > > > > > On Fri, 6 May 2022 at 09:18, Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
> > > > > > >
> > > > > > > On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wr=
ote:
> > > > > > > > Even if we didn't worry about backwards compatibility the c=
urrent virt
> > > > > > > > machine would still be what most users want. It's just a sm=
all number
> > > > > > > > of users who don't want MMIO devices and instead want to us=
e PCIe for
> > > > > > > > everything. Realistically it's only HPC users who would wan=
t this type
> > > > > > > > of machine, at least that's my understanding.
> > > > > > >
> > > > > > > I'm not so sure about that. Every other architecture has ende=
d up
> > > > > > > standardizing on PCI for general purpose virtual machines. II=
RC,
> > > > > > > aarch64 started off with MMIO, but switched to PCI as it matu=
red.
> > > > > > >
> > > > > > > In terms of having VM mgmt tools "just work" for risc-v, I th=
ink
> > > > > > > it will be very compelling for the general 'virt' machine to =
be
> > > > > > > PCI based, otherwise all the assumptions about PCI in mgmt ap=
ps
> > > > > > > are going to break requiring never ending riscv fixes.
> > > > > >
> > > > > > Mmm, my experience with aarch64 virt is that PCI is much nicer
> > > > > > as a general preference. aarch64 virt has some MMIO devices
> > > > > > for historical reasons and some because you can't reasonably
> > > > > > do the necessary things with PCI, but I'm actively trying to
> > > > > > push people who submit new MMIO device features for virt to
> > > > > > try to use a PCI-based solution instead if they possibly can.
> > > >
> > > > Interesting...
> > > >
> > > > Ok, maybe calling this "virt-pcie" might be a good start, with the
> > > > expectation to eventually replace the current virt with the new
> > > > virt-pcie at some point.
> > >
> > > Delaying the inevitable by leaving PCIE support in a separate
> > > machine type initially is going to be more painful long term.
> > >
> > > > The other option would be to try and gradually change from the curr=
ent
> > > > virt machine to this new virt machine
> > >
> > > Yes, I really think the 'virt' machine type needs to aim for PCIE
> > > support sooner rather than later, if RISC-V wants to get on part
> > > with other architectures. The best time to have added PCIE support
> > > to 'virt' was when it was first created, the next best time is now.
> >
> > So maybe instead we lock in the current virt machine as the 7.1 virt
> > machine for QEMU 7.1, then work on migrating to a PCIe only machine
> > with versions (similar to the other archs)
> >
>
> I am not quite sure what exactly you mean here. Do you mean to modify
> the current virt
> machine to be PCIE only after QEMU 7.1 or the new PCIE only machine
> (with the versioning)
> which will be the default machine in the future

I mean that we call the current virt machine the virt machine for QEMU
7.1. Then for future releases we can make breaking changes, where we
have the old 7.1 virt machine for backwards compatibility.

>
> If you intend to say the former, few issues with that approach.
>
> 1. virt machine is not well documented and already bloated. There is
> no specification for virt machine as such.
> Putting restrictions after a certain release will lead to confusion.
> 2. Do we support existing MMIO devices after that specific version or not=
 ?

Yeah, so I guess this doesn't achieve the same outcome you want. I
would say we would still include some MMIO devices, like UART for
example.

But we could simplify things a bit. So for example maybe we could use
AIA by default and then remove the PLIC code. That would help cleanup
the board file. Then we could add a `msi-only` option that would be
similar to https://github.com/atishp04/qemu/commit/d7fc1c6aa7855b414b348467=
2a076140166a2dcd.
But without the PLIC it should hopefully be cleaner

We would need AIA ratified before we could remove the PLIC though.

> 3. The user has to be aware of which version of virt machine it is
> running in order to test specific features (i.e. flash, reset, wired
> interrupts)

That's true, but I think we are going to have this issue someday
anyway. We don't want to use the SiFive CLINT and PLIC forever,
eventually we will want to use the newer hardware.

> 4. Based on the version of the virt machine, the command line options
> will change. This may also be confusing.
>
> On the other hand, the second approach will be much cleaner without
> any baggage. The RISC-V eco-system is still maturing and this is the
> right time
> to start something fresh. Let's call the new machine virt-pcie for
> now. Here are a few things that can be implemented for this machine.
>
> 1. It must support versioning and any changes to the machine code must
> modify the version of the machine.
> 2. It must only support MSI based PCIe devices. No support for wired inte=
rrupts.
>     The only allowed MMIO devices are
>            -- mtimer/mtimecmp (there is no other option provided in ISA)
>            -- reset/rtc device (If there is a way we can emulate these
> two over PCIe, that would be great)
>            -- flash
> Beyond this, adding any other MMIO device must be strongly discouraged.
> 3. The virt-pcie machine must be well documented similar to a hardware
> specification (including address range, restrictions and
> implemented/allowed devices)
> 4. No dependence on virtio framework but must work with virtio-pcie backe=
nd.
> 5. Migration must be supported.

I'm on board with these! They would all be great to have.

I'm open to a virt-pcie, but as others have pointed out it might be
easier to just make the switch now to the general board.

> 6. No command line option is required.

I don't see this being achievable unfortunately

> 7. Any other ?
>
> Once we have these policies in place, this can be the preferred virt
> machine and the current virt machine can be phased out or continue to
> co-exist
> as a more flexible experimental platform.
>
> Thoughts ?
>
> > Alistair
> >
> > >
> > > With regards,
> > > Daniel
> > > --
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dbe=
rrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berran=
ge.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dbe=
rrange :|
> > >
>
>
>
> --
> Regards,
> Atish

