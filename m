Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqpNV-00025D-3p
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 01:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqpNT-00023n-AA; Tue, 17 May 2022 01:04:11 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqpNP-0000qM-MQ; Tue, 17 May 2022 01:04:10 -0400
Received: by mail-io1-xd2a.google.com with SMTP id f4so18158360iov.2;
 Mon, 16 May 2022 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xoPVRMU0KZLThhMH4YMI64a9QxnB7RHON5csLUFuoDo=;
 b=n/48Ikj8+juy4tVWF5pmu/HA7/tgrxCeoBcwjp70BlNboWMVWHj3r8hdW5+CKFqSsV
 LkaD1FQKHSlLnSM3/yys656GD8UxFVm7R40UAlBH+IB2MQj1ZEuTzJAcCCa/mdnSL+iy
 678jTUYnA11tWHoDPD6k8Gl9d6Vr1Faco6b0nGlGveY9hFFa3O+xcqQKRskkVXdlT571
 2k7dYTqeI7tur1CUiaFNP9Lwe2IWntUGU97Wn28KRvZEdDl9+LTbSkjG80D+9YZaReEb
 wJQ8qRhhSvAQgPYFaguc+vjuzdS6K/MGsKaLZ1ezUyJAnAKQy5I0rYhMcSTavpCaJSRp
 lTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xoPVRMU0KZLThhMH4YMI64a9QxnB7RHON5csLUFuoDo=;
 b=PK2/hMok+fV+M51btyEBfcF7VOt023MEmlqzgMskLDrYubEYzCZhlVsCFcRFrPPtrb
 9NUV/KumZracGe+JCo1IvC8W3BbWZiPEminMOwFZY6aV1BVkMHgsuAvsA1nkfbCrp/DH
 cHLeE9IDUKtiH8GprMeoRwjLoa4eOjSkdwuq460CMr8z8Hch687ZHr9vwb2n9eglYapm
 R0cEgJ9nkY3mT4rDD4Fs/6zcaicgTaHwc4sY0646IFYc315NM9+xn9M9E0u/cDQfNFiE
 6VGugJHQPFf6HM9fQNWoTmt5LgEY//WcLxu8m8E2m+MNWDBDlMAIe6b918eVrIzCojtF
 /sIQ==
X-Gm-Message-State: AOAM53073s1fVK7X29zDhUZrfXVk6zo86bvzOPVUii4AXTH6OOqCDk4B
 3fJwwzFHUuDDjK2f2SQQ6hFQ2Z+WWrWkZe+SsVA=
X-Google-Smtp-Source: ABdhPJx+mzpXRL3hMko4P5jjwkNRDnDPRWJr0qXYr1eHmpbSqXM6dyOOoMmHKHpFd/pavJZiJlctR8y/AWdsUSzAiC0=
X-Received: by 2002:a6b:e406:0:b0:657:baed:ec0b with SMTP id
 u6-20020a6be406000000b00657baedec0bmr9703251iog.27.1652763844195; Mon, 16 May
 2022 22:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
 <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
 <YnTZP1iG+77Cugaq@redhat.com>
 <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
 <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
In-Reply-To: <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 15:03:38 +1000
Message-ID: <CAKmqyKPK_F7Z4-tM9k8+3yXDdSTSFagieH23vqoW+TciXpnYqA@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Atish Patra <atishp@atishpatra.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Tue, 17 May 2022 05:04:11 -0000

On Sat, May 7, 2022 at 6:30 AM Atish Kumar Patra <atishp@rivosinc.com> wrot=
e:
>
> On Fri, May 6, 2022 at 4:00 AM Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >
> > On Fri, 6 May 2022 at 09:18, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> > >
> > > On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wrote:
> > > > Even if we didn't worry about backwards compatibility the current v=
irt
> > > > machine would still be what most users want. It's just a small numb=
er
> > > > of users who don't want MMIO devices and instead want to use PCIe f=
or
> > > > everything. Realistically it's only HPC users who would want this t=
ype
> > > > of machine, at least that's my understanding.
> > >
> > > I'm not so sure about that. Every other architecture has ended up
> > > standardizing on PCI for general purpose virtual machines. IIRC,
> > > aarch64 started off with MMIO, but switched to PCI as it matured.
> > >
> > > In terms of having VM mgmt tools "just work" for risc-v, I think
> > > it will be very compelling for the general 'virt' machine to be
> > > PCI based, otherwise all the assumptions about PCI in mgmt apps
> > > are going to break requiring never ending riscv fixes.
> >
> > Mmm, my experience with aarch64 virt is that PCI is much nicer
> > as a general preference. aarch64 virt has some MMIO devices
> > for historical reasons and some because you can't reasonably
> > do the necessary things with PCI, but I'm actively trying to
> > push people who submit new MMIO device features for virt to
> > try to use a PCI-based solution instead if they possibly can.

Interesting...

Ok, maybe calling this "virt-pcie" might be a good start, with the
expectation to eventually replace the current virt with the new
virt-pcie at some point.

The other option would be to try and gradually change from the current
virt machine to this new virt machine

Alistair

> >
>
> Yeah. That was one of the primary goals of this series. If we have an
> alternate PCI only machine,
> folks will be more motivated to add only PCI based solutions in the
> future. In that case, there will be minimal
> or no change required to the machine code itself.
>
> Just for clarification: We can achieve the same with the current virt
> machine. But it is already bloated with a bunch of MMIO devices
> and will probably continue to do so because of its flexibility. In
> addition to that, any real PCI based platform emulation can not reuse
> the virt machine code which will result in more vendor specific
> implementations in the future..
>
> > thanks
> > -- PMM

