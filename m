Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1Lvi-0007ZF-CX
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 00:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1LvY-0007WJ-Ez; Thu, 08 Jul 2021 00:46:22 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1LvU-0001gZ-EE; Thu, 08 Jul 2021 00:46:20 -0400
Received: by mail-io1-xd31.google.com with SMTP id l18so1679884iow.4;
 Wed, 07 Jul 2021 21:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w66p/XItl8gWRlnxAF80OR6feipBU7ceu4ak70WbxnA=;
 b=VtXafLIFes/037ul/iWjZxEFLeNI0/HwJ5S3MHVMgi6tubfDEFUR0Xl2YF7ZI4lVXk
 WIQMpYQ22K9vdimOLjMbHw//NlZaweDgAmfB4Q4Y4r4N6w/S1pxFr3GYFhA1L9Pl603a
 FsQ9RxS3PR6UsIr216MdSrzF2cNz+sfnpwGiIaMrwomp9ERP6MXXYyJ2E5DOE7i7V349
 NuTYNhUyUMBgPpGFsTi0WOstTDLAhikWT3sHRvLm2u7dbAy0AaB1OY46p+UlTguey+Th
 FiHBzEhNxmJvM/tIlAhr3bNzua/fMi0qjnX/879821hznwPqhjYrOzdaPH9pDJMR8YuA
 iuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w66p/XItl8gWRlnxAF80OR6feipBU7ceu4ak70WbxnA=;
 b=Hjn5KWUHbI1GhTy08zo/yXZ8GefaPNMQMooY0Gd3+3Oy87HILiC9goxWs7fllAFptj
 Rzpwvc5/pY3WxugphJESpj6mSD/Q4CgMBYrYR6nRJoRDIqi/eUkYsYkUOiZe1Iakh4Ui
 qmCQMPi8FAbsVLRmKzupilf4l5FjGLBO4MAPMipvasQ8zNeMyL0mTmjyZ//fbQumMMcV
 CsSvSyyDnF+5xQdT0hl/myxlfBmGwAXZMYXwdPn4xEwavn2uFuWw7mdLy9JMtnEAXx21
 L8kMJ7qqfx+BBJ2gaw1SUBfv1vRO41kAxu0IBV/SusMOF2aZLVLE535LBxxwei2bkgrT
 14pw==
X-Gm-Message-State: AOAM533V+t82PZ0Z1kCgAlfbJf8YGrN6XC2zhMEpfmX9ZT+Nn1kefazR
 MhPr0fgDp3BDK2GBRkTEQRqVQmlses9yLqRf7fY=
X-Google-Smtp-Source: ABdhPJz6jT0RWsgRPwYk78gTKXSqJ/G/Vp4FoJ6mI1FGMuszluq+EvTA7ZebDNh9CLiZgOTPed7leMsn45IqGu+Rf1s=
X-Received: by 2002:a5d:8453:: with SMTP id w19mr22142836ior.105.1625719573748; 
 Wed, 07 Jul 2021 21:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210522155902.374439-1-josemartins90@gmail.com>
 <CAKmqyKMvaLn5YUPVBngDjziud-t8P717cp-LsrOBo-VG18BMiw@mail.gmail.com>
 <CAC41xo1Fuo6NiOE0quviuFuJXT_E5PdPOYfA1s=gdHN0vWjGnA@mail.gmail.com>
In-Reply-To: <CAC41xo1Fuo6NiOE0quviuFuJXT_E5PdPOYfA1s=gdHN0vWjGnA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Jul 2021 14:45:47 +1000
Message-ID: <CAKmqyKPn6nBye35=VFNXhH21BHf2nvNR2jt0259wKwFM=jiOhA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: hardwire bits in hideleg and hedeleg
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 08 Jul 2021 04:46:24 -0000

On Thu, Jun 24, 2021 at 11:48 PM Jose Martins <josemartins90@gmail.com> wro=
te:
>
> > > +static const target_ulong vs_delegable_excps =3D delegable_excps &
> > > +    ~((1ULL << (RISCV_EXCP_S_ECALL)) |
> >
> > > +    (1ULL << (RISCV_EXCP_VS_ECALL)) |
> > > +    (1ULL << (RISCV_EXCP_M_ECALL)) |
> >
> > These two are both read only 0, shouldn't they not be included in this =
list?
> >
> > >  static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong=
 val)
> > >  {
> > > -    env->hedeleg =3D val;
> > > +    env->hedeleg =3D val & vs_delegable_excps;
> >
> > Because we then allow a write to occur here.
>
> Note that the list is being bitwise negated, so both of these are
> actually not writable (ie read-only 0). There is still the question
> regarding the VS_ECALL (exception 10) bit raised by Zhiwei, since
> table 5.2 in the spec does not explicitly classify it. However, I
> believe it is safe to assume that exception 10 is non-delegable.

Ah, I see.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Applied to riscv-to-apply.next

I improved the indentation and rebased this on the latest master.

Alistair

>
> Jos=C3=A9

