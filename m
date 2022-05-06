Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nn4ag-0000oM-UJ
	for mharc-qemu-riscv@gnu.org; Fri, 06 May 2022 16:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nn4af-0000nl-6B
 for qemu-riscv@nongnu.org; Fri, 06 May 2022 16:30:17 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:34707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nn4ac-0002VQ-Mv
 for qemu-riscv@nongnu.org; Fri, 06 May 2022 16:30:16 -0400
Received: by mail-lf1-x130.google.com with SMTP id u23so8738619lfc.1
 for <qemu-riscv@nongnu.org>; Fri, 06 May 2022 13:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q1fiHO3eZkwGYGPxATm9BLAnzUfQTW37oe0wgPPdwPE=;
 b=38fqm1u3cWg+qQrvOswfh06vQXqDUF/DYxclkuIts8vJ3q38Ux+8q65i0ovHNAI9GO
 CbRq9gOdflqIxa+Imof8K9KYwvvhOQlgf+SsX86Kux/5x97PSutBHqQWE7T6cmGpmisA
 lc/x3e+LPetNfX/KTPPR8IuwiXV/IIzd4+GAo0U2FFZFZaht7ePQJeubEEFTbiEA4GqL
 vi5914MshlDlMXxw+oHL0i79hdBbHrEF3GbCtlH5alRjNeMWI1zSFzACnH3UPu7KlbgB
 dyTmXs935wXTIYDVtmENCEuzCrI2eT915ZgktBkj8nx4tyFR5yuwhBuPA1YgzV/M+T5G
 VJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q1fiHO3eZkwGYGPxATm9BLAnzUfQTW37oe0wgPPdwPE=;
 b=In1dmIa3O+gFpqv7YK1R1z/9kQZYcIYHxMAR9xR0jC45Dro65FPCLnhO8xB/FAE8Wi
 WjlXueSEY1obFtHqRK3rjBNH80woHu+m4WhNzVRHBM2TPEEDCGjAgSNO0zbEV8tQiDpg
 wRMAJmg0nH6vrKwsGhULLgHXBEiwg+wrnDgAvKNKjXyPJXnrRJyzHQPSq7vV/YMGw+Pf
 4mybJtlb3s4Kl4Ka/GHtSLcjFOhaA9DP3Pr54f9Wmlc9hvw+XBT4bg9S8WEXTpFCiv7c
 XDtIieQJSPARTiD1yLdQHSB7RAnL0t/nZ403Ouovt0bjYhjjPA2pDGgwZ6hIfYstRK5j
 S0ow==
X-Gm-Message-State: AOAM5303h6gUJB/MJ3wivyGATZ6IHl4IjKsSolRom+haTdmX+36N9a+H
 IIo5+fT7hXhAjVtSX0+aRjeZnz/gBiZmfNHBF/pfrQ==
X-Google-Smtp-Source: ABdhPJz76jJ354W4yCi91Miki0tfOCN1/HEP9IHCfgCVRa6fEKN1n46uDLvzeittSy6L1Q3IUaVt+dOmZGYVLTG3QtU=
X-Received: by 2002:a19:8c1a:0:b0:472:315:48db with SMTP id
 o26-20020a198c1a000000b00472031548dbmr3594173lfd.235.1651869012902; Fri, 06
 May 2022 13:30:12 -0700 (PDT)
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
In-Reply-To: <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 6 May 2022 13:30:01 -0700
Message-ID: <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Alistair Francis <alistair23@gmail.com>, Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x130.google.com
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
X-List-Received-Date: Fri, 06 May 2022 20:30:17 -0000

On Fri, May 6, 2022 at 4:00 AM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> On Fri, 6 May 2022 at 09:18, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> >
> > On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wrote:
> > > Even if we didn't worry about backwards compatibility the current vir=
t
> > > machine would still be what most users want. It's just a small number
> > > of users who don't want MMIO devices and instead want to use PCIe for
> > > everything. Realistically it's only HPC users who would want this typ=
e
> > > of machine, at least that's my understanding.
> >
> > I'm not so sure about that. Every other architecture has ended up
> > standardizing on PCI for general purpose virtual machines. IIRC,
> > aarch64 started off with MMIO, but switched to PCI as it matured.
> >
> > In terms of having VM mgmt tools "just work" for risc-v, I think
> > it will be very compelling for the general 'virt' machine to be
> > PCI based, otherwise all the assumptions about PCI in mgmt apps
> > are going to break requiring never ending riscv fixes.
>
> Mmm, my experience with aarch64 virt is that PCI is much nicer
> as a general preference. aarch64 virt has some MMIO devices
> for historical reasons and some because you can't reasonably
> do the necessary things with PCI, but I'm actively trying to
> push people who submit new MMIO device features for virt to
> try to use a PCI-based solution instead if they possibly can.
>

Yeah. That was one of the primary goals of this series. If we have an
alternate PCI only machine,
folks will be more motivated to add only PCI based solutions in the
future. In that case, there will be minimal
or no change required to the machine code itself.

Just for clarification: We can achieve the same with the current virt
machine. But it is already bloated with a bunch of MMIO devices
and will probably continue to do so because of its flexibility. In
addition to that, any real PCI based platform emulation can not reuse
the virt machine code which will result in more vendor specific
implementations in the future..

> thanks
> -- PMM

