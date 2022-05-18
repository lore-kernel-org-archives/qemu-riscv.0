Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nrDLP-0002Yk-IN
	for mharc-qemu-riscv@gnu.org; Wed, 18 May 2022 02:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nrDKg-0002H6-WF
 for qemu-riscv@nongnu.org; Wed, 18 May 2022 02:39:04 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:46214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nrDKd-0007h2-Vq
 for qemu-riscv@nongnu.org; Wed, 18 May 2022 02:38:54 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ff39b44b06so13376447b3.13
 for <qemu-riscv@nongnu.org>; Tue, 17 May 2022 23:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dTW8eraBVxpmYsGNcjAJZmD5qCizZxUHHqabUGjRha8=;
 b=fLBhwm4IG//4zdcK9/RTVPGdIcne1+2LMdtBLKW6YcfGGEVMPHvnGmfNz0MGeV7plp
 f8oCmYX+MFm2p6iwn1IdTht0q/Nvkny75go5l1FbBvgVdentB3xJF9hYo/OTMjlBUWh1
 1VMjgDQ/70/MClg6v2B8PLcOnQ2nxEsABj1a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dTW8eraBVxpmYsGNcjAJZmD5qCizZxUHHqabUGjRha8=;
 b=0HlvduqJfNkmWy1aXF7FyEJkW+kIwuysfR2P17TDUQ7eM4xpe+E1MXh0R59UJ5lNk1
 VtNuyNgywFkDRUtMDObq6TElCi5MC9LY2mxrTaz80PCy5Dmj09KfDKh/1FOC+mEcNp8v
 T9vIIqDJXB9c+CiekgO89pN9MV430h5bLbFRWQAGkE6SBPzDWq3+Hcpl1xDEopfvi4OL
 +xHikX/2hLTbX7Q66pG0dwlt/L0WXj1aaM5pYC9c5dmyo3dSLt+2rr/TOpZhZovmwCRe
 StI9ohLx0B2xANVGKJv/NVnMsrIcr7fV0GgjVanfr6ux2fqHHTgfAmyEBM+pYTO8rIQJ
 Re8g==
X-Gm-Message-State: AOAM532ikd1PmXJ/YOwgMA3bkH1t0bKtXlNzfBe2dlacg+ytphRSElHI
 odGyhaud3BsUIiKjSFCKI6DfG8xzWcHhi+Qte05M
X-Google-Smtp-Source: ABdhPJxQ3Iqtsqfvz/i02B4yfZF4XJupSjFshGRybEb/AiO9huUohfWehFFbiTZJ2mdZLYyHA58Mi87/sy5alIhowzc=
X-Received: by 2002:a0d:e88c:0:b0:2fe:da96:1b77 with SMTP id
 r134-20020a0de88c000000b002feda961b77mr19438917ywe.262.1652855929928; Tue, 17
 May 2022 23:38:49 -0700 (PDT)
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
In-Reply-To: <CAKmqyKOC0Fgu7WUXRcAJZNmVR8GeiXHGh4K8fg+5_c+pvZR_7w@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 17 May 2022 23:38:39 -0700
Message-ID: <CAOnJCU+i3m5OjM-wBf+t58YP9k5Jd0VeBK_yoPSPtzoE68H2EQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x112d.google.com
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
X-List-Received-Date: Wed, 18 May 2022 06:39:14 -0000

On Tue, May 17, 2022 at 1:54 PM Alistair Francis <alistair23@gmail.com> wro=
te:
>
> On Tue, May 17, 2022 at 6:52 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> >
> > On Tue, May 17, 2022 at 03:03:38PM +1000, Alistair Francis wrote:
> > > On Sat, May 7, 2022 at 6:30 AM Atish Kumar Patra <atishp@rivosinc.com=
> wrote:
> > > >
> > > > On Fri, May 6, 2022 at 4:00 AM Peter Maydell <peter.maydell@linaro.=
org> wrote:
> > > > >
> > > > > On Fri, 6 May 2022 at 09:18, Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
> > > > > >
> > > > > > On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wrot=
e:
> > > > > > > Even if we didn't worry about backwards compatibility the cur=
rent virt
> > > > > > > machine would still be what most users want. It's just a smal=
l number
> > > > > > > of users who don't want MMIO devices and instead want to use =
PCIe for
> > > > > > > everything. Realistically it's only HPC users who would want =
this type
> > > > > > > of machine, at least that's my understanding.
> > > > > >
> > > > > > I'm not so sure about that. Every other architecture has ended =
up
> > > > > > standardizing on PCI for general purpose virtual machines. IIRC=
,
> > > > > > aarch64 started off with MMIO, but switched to PCI as it mature=
d.
> > > > > >
> > > > > > In terms of having VM mgmt tools "just work" for risc-v, I thin=
k
> > > > > > it will be very compelling for the general 'virt' machine to be
> > > > > > PCI based, otherwise all the assumptions about PCI in mgmt apps
> > > > > > are going to break requiring never ending riscv fixes.
> > > > >
> > > > > Mmm, my experience with aarch64 virt is that PCI is much nicer
> > > > > as a general preference. aarch64 virt has some MMIO devices
> > > > > for historical reasons and some because you can't reasonably
> > > > > do the necessary things with PCI, but I'm actively trying to
> > > > > push people who submit new MMIO device features for virt to
> > > > > try to use a PCI-based solution instead if they possibly can.
> > >
> > > Interesting...
> > >
> > > Ok, maybe calling this "virt-pcie" might be a good start, with the
> > > expectation to eventually replace the current virt with the new
> > > virt-pcie at some point.
> >
> > Delaying the inevitable by leaving PCIE support in a separate
> > machine type initially is going to be more painful long term.
> >
> > > The other option would be to try and gradually change from the curren=
t
> > > virt machine to this new virt machine
> >
> > Yes, I really think the 'virt' machine type needs to aim for PCIE
> > support sooner rather than later, if RISC-V wants to get on part
> > with other architectures. The best time to have added PCIE support
> > to 'virt' was when it was first created, the next best time is now.
>
> So maybe instead we lock in the current virt machine as the 7.1 virt
> machine for QEMU 7.1, then work on migrating to a PCIe only machine
> with versions (similar to the other archs)
>

I am not quite sure what exactly you mean here. Do you mean to modify
the current virt
machine to be PCIE only after QEMU 7.1 or the new PCIE only machine
(with the versioning)
which will be the default machine in the future

If you intend to say the former, few issues with that approach.

1. virt machine is not well documented and already bloated. There is
no specification for virt machine as such.
Putting restrictions after a certain release will lead to confusion.
2. Do we support existing MMIO devices after that specific version or not ?
3. The user has to be aware of which version of virt machine it is
running in order to test specific features (i.e. flash, reset, wired
interrupts)
4. Based on the version of the virt machine, the command line options
will change. This may also be confusing.

On the other hand, the second approach will be much cleaner without
any baggage. The RISC-V eco-system is still maturing and this is the
right time
to start something fresh. Let's call the new machine virt-pcie for
now. Here are a few things that can be implemented for this machine.

1. It must support versioning and any changes to the machine code must
modify the version of the machine.
2. It must only support MSI based PCIe devices. No support for wired interr=
upts.
    The only allowed MMIO devices are
           -- mtimer/mtimecmp (there is no other option provided in ISA)
           -- reset/rtc device (If there is a way we can emulate these
two over PCIe, that would be great)
           -- flash
Beyond this, adding any other MMIO device must be strongly discouraged.
3. The virt-pcie machine must be well documented similar to a hardware
specification (including address range, restrictions and
implemented/allowed devices)
4. No dependence on virtio framework but must work with virtio-pcie backend=
.
5. Migration must be supported.
6. No command line option is required.
7. Any other ?

Once we have these policies in place, this can be the preferred virt
machine and the current virt machine can be phased out or continue to
co-exist
as a more flexible experimental platform.

Thoughts ?

> Alistair
>
> >
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> >



--=20
Regards,
Atish

