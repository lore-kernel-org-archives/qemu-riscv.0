Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmiBy-00024G-Qr
	for mharc-qemu-riscv@gnu.org; Thu, 05 May 2022 16:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmiBx-000237-6T; Thu, 05 May 2022 16:35:17 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmiBv-0002Q7-BK; Thu, 05 May 2022 16:35:16 -0400
Received: by mail-io1-xd2f.google.com with SMTP id f4so6011258iov.2;
 Thu, 05 May 2022 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AgheOU6A2DSvGleqdw8tSZMy1qepbyZu1Zm0nE5FbEY=;
 b=qJQzHdr4emoiCTR8ZC+0dR5blfa1ofzxcFCVZFbnbhAIzBC9UGwDFXeSssAy0AAKi5
 il9p9Bnai4x72prL4GLbvXN0Dy5RjUcTzJXyLhQ1JAPkSrds+I7xf52X/6kSO4wRtj8J
 H2FJsd+cIrvrHG9nWAG3ost7RvZNiWa70WJD73PSq0wsfr+mjHmdoi2reo65pAFiCkK4
 ASwGbEDHTsnHzvtSS2t9ZGnc8C9u6+/i2n1Sl9lH2Uma4M+sP9iBPNP2CnP0nbV9vOqD
 khVS6JvdgZTC/nWl/7iEy+IWEciy6pqzeZPlzpx7hXYzc+1ZAd4OKzqOPK/tpOiylLGo
 iLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AgheOU6A2DSvGleqdw8tSZMy1qepbyZu1Zm0nE5FbEY=;
 b=4xusDqV6992xUz/So/WLCQFOjWSFw9Kn4AZ9PWHYfQRqePNhCV3C7Y+XoiRlGAfK/L
 23x7zG8i9jZL9YoYrUqfglzq6SAoCHPiwfk1vRIwd8ZHlDKnXImvBdQf7B6HpixJkRJl
 wx8Lv6Ab8b4AFg0DWpWR/6IMkli09ZvV3/si2pB0uGdf/kE2uXMLv9kxUiYaXmk2Aw8L
 RtLW4LEnLmPNezUiQIEiTc2vfd5Lhseo4SC0HMhLVCUKQNhEWWBFGqQS0pTJuFXmS/hd
 wgD3S2TAz7ZGuSuLl+co1lNrlGmkl7MMeOiCkKnCRC12wvdcTAv7eDgNNXwyYBiWyQF6
 BFPg==
X-Gm-Message-State: AOAM532okyR9aUbrvKqCPVfW7H06ZN+2JtHtB9/MU/KKUZsjpCYuEJaC
 DzWu26VmlxYWp4C5vnQuWu7gGmE6YKcWbnMeWL0=
X-Google-Smtp-Source: ABdhPJywesMdKlULvB81AsrFTfrmyzLG6KjAe7jzNQr33VAO0gpTCY2jhdV+A9Pj9d+8Cvi6jljPS7xMr/jyWgoZTsI=
X-Received: by 2002:a5d:948a:0:b0:64d:23a4:9afa with SMTP id
 v10-20020a5d948a000000b0064d23a49afamr4233ioj.114.1651782913810; Thu, 05 May
 2022 13:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
In-Reply-To: <YnOhHZGJphk30SmJ@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 6 May 2022 06:34:47 +1000
Message-ID: <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Thu, 05 May 2022 20:35:17 -0000

On Thu, May 5, 2022 at 8:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, May 05, 2022 at 07:36:51PM +1000, Alistair Francis wrote:
> > On Tue, May 3, 2022 at 5:57 PM Atish Patra <atishp@atishpatra.org> wrot=
e:
> > >
> > > On Tue, Apr 19, 2022 at 5:26 PM Atish Patra <atishp@atishpatra.org> w=
rote:
> > > >
> > > > On Tue, Apr 19, 2022 at 9:51 AM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> > > > >
> > > > > On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> > > > > >
> > > > > > The RISC-V virt machine has helped RISC-V software eco system t=
o evolve at a
> > > > > > rapid pace even in absense of the real hardware. It is definite=
ly commendable.
> > > > > > However, the number of devices & commandline options keeps grow=
ing as a result
> > > > > > of that as well. That adds flexibility but will also become bit=
 difficult
> > > > > > to manage in the future as more extension support will be added=
. As it is the
> > > > > > most commonly used qemu machine, it needs to support all kinds =
of device and
> > > > > > interrupts as well. Moreover, virt machine has limitations on t=
he maximum
> > > > > > number of harts it can support because of all the MMIO devices =
it has to support.
> > > > > >
> > > > > > The RISC-V IMSIC specification allows to develop machines compl=
etely relying
> > > > > > on MSI and don't care about the wired interrupts at all. It jus=
t requires
> > > > > > all the devices to be present behind a PCI bus or present thems=
elves as platform
> > > > > > MSI device. The former is a more common scenario in x86 world w=
here most
> > > > > > of the devices are behind PCI bus. As there is very limited MMI=
O device
> > > > > > support, it can also scale to very large number of harts.
> > > > > >
> > > > > > That's why, this patch series introduces a minimalistic yet ver=
y extensible
> > > > > > forward looking machine called as "RISC-V Mini Computer" or "mi=
nic". The
> > > > > > idea is to build PC or server like systems with this machine. T=
he machine can
> > > > > > work with or without virtio framework. The current implementati=
on only
> > > > > > supports RV64. I am not sure if building a RV32 machine would b=
e of interest
> > > > > > for such machines. The only mmio device it requires is clint to=
 emulate
> > > > > > the mtimecmp.
> > > > >
> > >
> > > Any other thoughts ?
> >
> > I don't *love* this idea. I think the virt machine is useful, but I'm
> > not convinced we need a second one.
> >
> > This feels a little bit more like a "none" machine, as it contains
> > just the bare minimum to work.
> >
> > >
> > > > > I would ask what you see as the long term future usage for 'virt'=
 vs
> > > > > 'minic' machine types ? Would you expect all existing users of 'v=
irt'
> > > > > to ultimately switch to 'minic', or are there distinct non-overla=
pping
> > > > > use cases for 'virt' vs 'minic' such that both end up widely used=
 ?
> > > > >
> > > >
> > > > Nope. I don't expect existing 'virt' users to switch to 'minic' as
> > > > they aim to cater to different users.
> > > >
> > > > Here are the major differences
> > > > 1. virt machine supports MMIO devices & wired interrupts. Minic doe=
sn't
> >
> > This seems like the main difference
> >
> > > > 2. virt machine doesn't support the MSI only option yet (can be add=
ed
> > > > though[1]). Minic does.
> >
> > This could be fixed
> >
> > > > 3. Number of cpu supported by virt machine are limited because of t=
he
> > > > MMIO devices. Minic can scale to very
> > > > large numbers of cpu.
> >
> > Similar to 1
> >
> > > > 4. 'Minic' only supports PCI based MSI capable devices. Thus, MSI i=
s a
> > > > mandatory requirement for 'minic' while
> > > > it is optional for 'virt'.
> >
> > I'm not fully convinced we need this, but it also doesn't seem to cost
> > us a lot in terms of maintenance. It would be beneficial if we could
> > share a bit more of the code. Can we share the socket creation code as
> > well?
> >
> > I don't like the name minic though. What about something like
> > `virt-hpc`, `virt-pcie-minimal` or something like that? That way we
> > indicate it's still a virt board
>
> We're not versioning the 'virt' machine type right so. IOW, we've not
> made any promises about its long term featureset.
>
> If the virt machine type isn't the perfect match right now, should
> we change it, in a potentially incompatible way, to give us the right
> solution long term, rather than introducing a brand new machine type
> with significant overlap.

Even if we didn't worry about backwards compatibility the current virt
machine would still be what most users want. It's just a small number
of users who don't want MMIO devices and instead want to use PCIe for
everything. Realistically it's only HPC users who would want this type
of machine, at least that's my understanding.

Alistair

>
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

