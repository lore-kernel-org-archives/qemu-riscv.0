Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmjoo-0006GR-Lh
	for mharc-qemu-riscv@gnu.org; Thu, 05 May 2022 18:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nmjom-0006Eq-No
 for qemu-riscv@nongnu.org; Thu, 05 May 2022 18:19:28 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nmjok-0003lT-CJ
 for qemu-riscv@nongnu.org; Thu, 05 May 2022 18:19:28 -0400
Received: by mail-lj1-x230.google.com with SMTP id q14so7266040ljc.12
 for <qemu-riscv@nongnu.org>; Thu, 05 May 2022 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T44pZVB4U9cM8ssUSCLDyYJBjsOMhUljwPIdmZvDgCw=;
 b=g6y8NXx0T5dSbxN9H89qPJd5B9PhhuP8aIET+D6t0MmV9bFWwcYudzxZEEbLJ9/OlQ
 EcTyXiggyhN4WwiFNB4hAmtTtQRQKR+IOkRubqgzNeLprJl6Bycf3FielkcijcJlmVrv
 7UMLLt8ze0UHQ7bASxJdtAtpIzEcDtb2gRnSVzCKmQFkev7ZpAS5giElW9/arUwAMbr0
 BMlVBXxaDyBzTQvQd+ZoGy76u0wXmIRHk88q+/YLfI4SWpcH5t/HaG2jYruAzSJ3ToHQ
 1E9I0r8qg4sJ7FLBkl/X9dnfpH8epjccR/7+hehUGeXir3lANEF0fBpEO78OZNbWOMdJ
 qY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T44pZVB4U9cM8ssUSCLDyYJBjsOMhUljwPIdmZvDgCw=;
 b=fNEZJMl2TtFguCpp+r3v4N+ZFEAN5wEc+iue0QIoeYOUz/Q9bZRaJd3aJl65CTs9q6
 Vbbvo4ocA1KfMKBVV5zqDgo0JiNmI4ESIponyfoCUzKyZdOKsXlsA3WF1wGwYtoOX/pF
 SiVtVYw7FMxeXTyHe2sa+/fZOzc7Kyzi1NTWbVDLA5PyzPKFDlTh0Udclm9RDnaf7dHq
 hPCcnxx9KCBBI9UGI6SrkhgIobw20rRk7xFTBk9Prp399jUq1DAtrdtkkvdQOHRVH+14
 CGRPhZ/qs8fhQHMBSLA5Rb8w3RKwl043ZYqhs0DwQEC9SUSomMeyDGCnlgHcuA2k6Avj
 Atzw==
X-Gm-Message-State: AOAM530/i5rFR5D5yRj99OrInA489lu+y2R7laecSKEYRaVZnnBB9D6a
 riQiG74R69sMZpu9sj8GJOqWIeXdn4crr6USL0pjeg==
X-Google-Smtp-Source: ABdhPJzW1KfsYYsAjwjMEdW2YfqW0FugweHuHvchwUL8PxUdMqwsIX/PTUgwSS5Ch0VDDLeYTtIffGA9cjOM+KrM7sE=
X-Received: by 2002:a05:651c:54a:b0:250:5b67:b7b6 with SMTP id
 q10-20020a05651c054a00b002505b67b7b6mr125700ljp.305.1651789164250; Thu, 05
 May 2022 15:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
 <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 5 May 2022 15:19:13 -0700
Message-ID: <CAHBxVyEOSMSZ9kbHYWXwJ5xYeG7PYA8kdejZ6tOfF=RXUfhfGA@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Atish Patra <atishp@atishpatra.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 05 May 2022 22:19:28 -0000

On Thu, May 5, 2022 at 1:35 PM Alistair Francis <alistair23@gmail.com> wrot=
e:
>
> On Thu, May 5, 2022 at 8:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> >
> > On Thu, May 05, 2022 at 07:36:51PM +1000, Alistair Francis wrote:
> > > On Tue, May 3, 2022 at 5:57 PM Atish Patra <atishp@atishpatra.org> wr=
ote:
> > > >
> > > > On Tue, Apr 19, 2022 at 5:26 PM Atish Patra <atishp@atishpatra.org>=
 wrote:
> > > > >
> > > > > On Tue, Apr 19, 2022 at 9:51 AM Daniel P. Berrang=C3=A9 <berrange=
@redhat.com> wrote:
> > > > > >
> > > > > > On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> > > > > > >
> > > > > > > The RISC-V virt machine has helped RISC-V software eco system=
 to evolve at a
> > > > > > > rapid pace even in absense of the real hardware. It is defini=
tely commendable.
> > > > > > > However, the number of devices & commandline options keeps gr=
owing as a result
> > > > > > > of that as well. That adds flexibility but will also become b=
it difficult
> > > > > > > to manage in the future as more extension support will be add=
ed. As it is the
> > > > > > > most commonly used qemu machine, it needs to support all kind=
s of device and
> > > > > > > interrupts as well. Moreover, virt machine has limitations on=
 the maximum
> > > > > > > number of harts it can support because of all the MMIO device=
s it has to support.
> > > > > > >
> > > > > > > The RISC-V IMSIC specification allows to develop machines com=
pletely relying
> > > > > > > on MSI and don't care about the wired interrupts at all. It j=
ust requires
> > > > > > > all the devices to be present behind a PCI bus or present the=
mselves as platform
> > > > > > > MSI device. The former is a more common scenario in x86 world=
 where most
> > > > > > > of the devices are behind PCI bus. As there is very limited M=
MIO device
> > > > > > > support, it can also scale to very large number of harts.
> > > > > > >
> > > > > > > That's why, this patch series introduces a minimalistic yet v=
ery extensible
> > > > > > > forward looking machine called as "RISC-V Mini Computer" or "=
minic". The
> > > > > > > idea is to build PC or server like systems with this machine.=
 The machine can
> > > > > > > work with or without virtio framework. The current implementa=
tion only
> > > > > > > supports RV64. I am not sure if building a RV32 machine would=
 be of interest
> > > > > > > for such machines. The only mmio device it requires is clint =
to emulate
> > > > > > > the mtimecmp.
> > > > > >
> > > >
> > > > Any other thoughts ?
> > >
> > > I don't *love* this idea. I think the virt machine is useful, but I'm
> > > not convinced we need a second one.
> > >
> > > This feels a little bit more like a "none" machine, as it contains
> > > just the bare minimum to work.
> > >
> > > >
> > > > > > I would ask what you see as the long term future usage for 'vir=
t' vs
> > > > > > 'minic' machine types ? Would you expect all existing users of =
'virt'
> > > > > > to ultimately switch to 'minic', or are there distinct non-over=
lapping
> > > > > > use cases for 'virt' vs 'minic' such that both end up widely us=
ed ?
> > > > > >
> > > > >
> > > > > Nope. I don't expect existing 'virt' users to switch to 'minic' a=
s
> > > > > they aim to cater to different users.
> > > > >
> > > > > Here are the major differences
> > > > > 1. virt machine supports MMIO devices & wired interrupts. Minic d=
oesn't
> > >
> > > This seems like the main difference
> > >
> > > > > 2. virt machine doesn't support the MSI only option yet (can be a=
dded
> > > > > though[1]). Minic does.
> > >
> > > This could be fixed
> > >
> > > > > 3. Number of cpu supported by virt machine are limited because of=
 the
> > > > > MMIO devices. Minic can scale to very
> > > > > large numbers of cpu.
> > >
> > > Similar to 1
> > >
> > > > > 4. 'Minic' only supports PCI based MSI capable devices. Thus, MSI=
 is a
> > > > > mandatory requirement for 'minic' while
> > > > > it is optional for 'virt'.
> > >
> > > I'm not fully convinced we need this, but it also doesn't seem to cos=
t
> > > us a lot in terms of maintenance. It would be beneficial if we could
> > > share a bit more of the code. Can we share the socket creation code a=
s
> > > well?
> > >
> > > I don't like the name minic though. What about something like
> > > `virt-hpc`, `virt-pcie-minimal` or something like that? That way we
> > > indicate it's still a virt board
> >
> > We're not versioning the 'virt' machine type right so. IOW, we've not
> > made any promises about its long term featureset.
> >
> > If the virt machine type isn't the perfect match right now, should
> > we change it, in a potentially incompatible way, to give us the right
> > solution long term, rather than introducing a brand new machine type
> > with significant overlap.
>
> Even if we didn't worry about backwards compatibility the current virt
> machine would still be what most users want. It's just a small number
> of users who don't want MMIO devices and instead want to use PCIe for
> everything. Realistically it's only HPC users who would want this type
> of machine, at least that's my understanding.
>

Yes. You are correct. Virt machine will continue to be useful for
platforms with MMIO or wired irq devices.
The new machine is more suitable for platforms where everything is
behind PCI. HPC platforms certainly
is one market segment. However, future RISC-V PCs (similar to x86 PCs)
may also fall in this category.

> Alistair
>
> >
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

