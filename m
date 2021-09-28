Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVLSG-00009j-T9
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 18:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLSF-00007F-30; Tue, 28 Sep 2021 18:20:03 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:34682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLSD-0001TX-Er; Tue, 28 Sep 2021 18:20:02 -0400
Received: by mail-io1-xd30.google.com with SMTP id h129so606743iof.1;
 Tue, 28 Sep 2021 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a7eDbj92mcbWXCHCvyRccZQVfZy3rlCHsAuMwh6E9aU=;
 b=n2xWErAYTcZFg3cnYoT871/x0fTWWfAhmG3SZJt/ZpWcaORMd0h5UrUtIJTMrYATU8
 hVGA/3BGbJwchOv71scHiP3UhRil5BD3a1TiHwQ3LCIWxz1CWng0SDyCn0Qc9UasOtER
 uqY8uVMK9snATAlCluVuoGzmZiKMt0j4D5GkyfLxXfv4sg9gsL5Uqe4wVP3eWatanCta
 BTHe2NwkWOkDy5SVmdKG952zBTut+l8+uUy7BJ06wRPJ62Qwg3xS1Rl1Qn5QyZj/o3Kq
 OBwLyRUSXIZsXCEcPnWqRGcwRFF9MilsFeTi+HSkvOl0NYJP4c8WYHRR+hvFprt/vXXz
 FbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a7eDbj92mcbWXCHCvyRccZQVfZy3rlCHsAuMwh6E9aU=;
 b=EHe6QhPUlp55XiPU82jMjFR6/zNFVcVbcSwIx6eFwSKdVlj0nW1IpnfJevx+438hIe
 9tJ9EvCdXNOFS4sv+oHaPdhpgPScSH+/wNdNl3dwP5Y+vm1kwAB7NswliOr3Fv77HncF
 3PGu4F8o5OTVICoLlEITFlhsw3yHeS/z6jxIaDzf7jETG3ouaFUXwQwykmSyVCqo6p7/
 GiHxyhrWmTPUwpoteZFCBIEkJBpJKcpFVt7/4yz5tKL3sEQHppmapVHoOTd6kZUNeBtF
 GGaLeN17tWEbneu6jI29ALRfx7JwcoWDuJEIjJ0ckXYUHfA9uwVUYVc2BcIiS4Yu/epk
 0lVQ==
X-Gm-Message-State: AOAM533vHW8kZ8Zo4btu9zv/eggvgtRkza6mAsQU1VukEbQ+7NQiHGLE
 jecaUax4hNLWWWmK5XVW85znQzKRAQmHSI4Eds0=
X-Google-Smtp-Source: ABdhPJzdLgGz5Vl9nayVpsgcN3gqtN5VYd7XpMq6XDZQhOgIsNk8mseeI+S1EGD7eg4tUIjqtqKnwRDo8nkMjvkeYZw=
X-Received: by 2002:a02:ac96:: with SMTP id x22mr6660164jan.18.1632867599892; 
 Tue, 28 Sep 2021 15:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-2-f4bug@amsat.org>
 <CAEUhbmWRpcBub4BZu3j4b31jTQsrWEQB3MNw4xv7T8z7PZ+UBg@mail.gmail.com>
In-Reply-To: <CAEUhbmWRpcBub4BZu3j4b31jTQsrWEQB3MNw4xv7T8z7PZ+UBg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 08:19:33 +1000
Message-ID: <CAKmqyKOtAvB44myCeNxY8CHGVccHEjfXnu9WsNdHF+cnTnh+tA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/char/mchp_pfsoc_mmuart: Simplify
 MCHP_PFSOC_MMUART_REG definition
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 22:20:03 -0000

On Sun, Sep 26, 2021 at 6:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Sep 25, 2021 at 9:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > The current MCHP_PFSOC_MMUART_REG_SIZE definition represent the
> > size occupied by all the registers. However all registers are
> > 32-bit wide, and the MemoryRegionOps handlers are restricted to
> > 32-bit:
> >
> >   static const MemoryRegionOps mchp_pfsoc_mmuart_ops =3D {
> >       .read =3D mchp_pfsoc_mmuart_read,
> >       .write =3D mchp_pfsoc_mmuart_write,
> >       .impl =3D {
> >           .min_access_size =3D 4,
> >           .max_access_size =3D 4,
> >       },
> >
> > Avoid being triskaidekaphobic, simplify by using the number of
>
> typo? See https://www.dictionary.com/browse/triskaidekaphobia
>
> Learned a new word today but I have to say this word is too hard for a
> non-native speaker :)

Ha! Even as a native English speaker I had to look it up :)

Alistair

