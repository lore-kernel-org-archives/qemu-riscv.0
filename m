Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poazr-00074y-Iv
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 22:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poazp-00074V-Bj; Mon, 17 Apr 2023 22:23:05 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poazl-0005Zl-Fh; Mon, 17 Apr 2023 22:23:05 -0400
Received: by mail-ua1-x92b.google.com with SMTP id p12so5929563uak.13;
 Mon, 17 Apr 2023 19:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681784579; x=1684376579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVRwk7yTI4TAsFz0GmW6Gtz4Sf8AhKpKrpjdiQp9B14=;
 b=QgB2SLzMZ4lV8Q/JeR+aEAXqqKrP5IhAwwdnnAo7Bm1hMXe6eeyuS36wO/Mp5MlgRt
 e0Ie7h3TysGXkvd9HmuWwJXDMjXPjrFRMT7GGWOptRZQ3lMaAXR/ixZKyJ1T1NGCg1h1
 ClR65ErVx+cpI3f2KL0LKCSsBlA9Y9QbAZYYvedqSYUZONEUl3pJOLfRuw68Hdd89h0t
 MS9xQ6Pk9+dbaDZbacKFEM0e/NkXlGN9Nj191OLi+AjnGMP23/PoCxFbKPYDTW6+4JJB
 lWnR9ghsjw2OeLqoAIOv520omS8MCzI2xoGBTSi6gjhpxzCtNUC4kKfpk5WnklXTNfAe
 m68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681784579; x=1684376579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVRwk7yTI4TAsFz0GmW6Gtz4Sf8AhKpKrpjdiQp9B14=;
 b=UYe9oEqV5eeio0fmHDcs6NVWrDjeSva8AtjAFhz685pOKbouJk4KnEnskpoFcJqV2t
 oh7G6b48PVgfDbZ5Y0fj2sQ6bibhaaKuNS9xu+Bqy2Hes3ZbVAaIK7nibx3F+0663S/V
 a6/OgSJ41+A4Zxvzn+zSt4gvNtZpLdxA5O5O9FurKT2ferEPc8iqXe96sKXHUblec6/I
 S6pBBzgiFNWTgqdrU/Zu9POYR3zcaw5qccpFdUdxb9bAzKPojbFd/BtgSHAWYgXnWdj0
 TuBe0tctmcJtl7QDY06v6E4goFl8rnaqLok16SY4U+dwCPuEgEpb165gGH7C39EyV4bd
 mWuQ==
X-Gm-Message-State: AAQBX9c2ANW8va4Ir/qYamQDrodksQoCcKDHVUR86H4RLX3ytLcx8mWJ
 ERsEn5JEbJU74J8XvQ/kuBMZWnzB0b2kZN298/g=
X-Google-Smtp-Source: AKy350bPpfyA9GYrwKx/czDMNbmXwdPxF9EbPs+CXMTF8Cgf7QpCp2WzVoNSHMKrzpYze6RNkI2J0eP5bp05lGkTYgs=
X-Received: by 2002:a1f:5ed7:0:b0:43f:ec5d:51e1 with SMTP id
 s206-20020a1f5ed7000000b0043fec5d51e1mr5088777vkb.9.1681784578789; Mon, 17
 Apr 2023 19:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230412091716.126601-1-alexghiti@rivosinc.com>
 <CAKmqyKNkyakGCFG0DqX02GpqhAPEq=tkt-EVctas5m2XjRuXJg@mail.gmail.com>
 <ZD0jos2r4uZocw/5@andrea>
In-Reply-To: <ZD0jos2r4uZocw/5@andrea>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:22:32 +1000
Message-ID: <CAKmqyKNVf4tba=mpqZrwtaFC5Pn6-787cQy9Hnf3u=Xodcx09g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Raise an exception if pte reserved bits are not
 cleared
To: Andrea Parri <andrea@rivosinc.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
X-List-Received-Date: Tue, 18 Apr 2023 02:23:05 -0000

On Mon, Apr 17, 2023 at 8:47=E2=80=AFPM Andrea Parri <andrea@rivosinc.com> =
wrote:
>
> Hi Alistair,
>
> > > @@ -936,6 +936,11 @@ restart:
> > >              return TRANSLATE_FAIL;
> > >          }
> > >
> > > +        /* PTE reserved bits must be cleared otherwise an exception =
is raised */
> > > +        if (riscv_cpu_mxl(env) =3D=3D MXL_RV64 && (pte & PTE_RESERVE=
D)) {
> > > +            return TRANSLATE_FAIL;
> > > +        }
> >
> > Isn't this caught by our existing check?
> >
> >             if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
> >                 return TRANSLATE_FAIL;
> >             }
>
> Thanks for checking this out.  AFAICS, the existing check/code doesn't
> work if either svnapot or svpbmt are active.

svpbmt uses some of the reserved fields right?

I'm not sure why svnapot excludes the check. The correct fix should be
to change this check as required (instead of adding a new check).

Alistair

>
> Please let me know if you need other information.
>
>   Andrea

