Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUPg0-0001JW-Hi
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 04:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUPft-0001Gj-4Z; Sun, 26 Sep 2021 04:38:17 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUPfp-0004Zt-Sb; Sun, 26 Sep 2021 04:38:16 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id f133so16331568yba.11;
 Sun, 26 Sep 2021 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X6vH14M3cNEwL74vqYJumh/hQ0a2dklGUYwGnYcoqJ8=;
 b=O1HDoNRQStM/xne30syd8fi5dz0nJIo3H2x6d+vjmVAWIsQRVmlbNI7hiza1t1GQs8
 abA+BlCK3ijMIyG9CL+0qukWGzHofOcBBB6BFy9qz1AUMqf5sGMq8/vNB4sQDnzmJjZW
 QIe1zx6+75AxSMjPHmhXWDZWLby2S7khjcWbVKcfojks1Dilp36fejJz4JJlWW6OX8jM
 hyszq3mi7p2ryRmSuJyA5zlPGmuFsDNLF9oMIyblXTjiA4Y9+/wr1YeSRByf8voiVwOH
 cWY7x3rQ+F7NSvpKe1YfsGI5D2R/TzyE4bYMXAQUODb3aUQWP+ePi9JxsNYe6HHWFVFg
 xQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X6vH14M3cNEwL74vqYJumh/hQ0a2dklGUYwGnYcoqJ8=;
 b=4UiUaZWNhVywvM/d34JPcRoecejQ0Vk/mACiavpzez3bY5XOWvq4HOB098B13xqayy
 zgOXMceqfuUkOFBXig4ZvN6OIOEM4WZqhVHN/wWBp79+qNLRB6xtlFyHTSgxEnIr44xO
 QjDS89TSDYTgQeYaKU6acdTHPK/WcP5r9E6lZuPbfKtljY+MBfHmryU69UR/1reNZPEb
 FH5gCzVpaXIedU/44G4SVr/soOKEw098KcZezaA7lyZWu8vO+i9hvgLkMJiltifRRpVQ
 XD68GeEv3tyHQxuoXh8rCE8VhZHcZxMRqExXS4bWboVRUqa0uKIseDn27LeiVhhq85JD
 FANw==
X-Gm-Message-State: AOAM53150Obdg4G18KCgdmJKFzLasc2NcWn28KNDzf3jj5lpZn9gT0Fj
 Qk6t2sin8ivhiAfDJw3X2YXO9Y8SMtV5+J+cbW0=
X-Google-Smtp-Source: ABdhPJzQvRgUW9qQiETfXqrvDQhPDFhyFzyVQuZFvy5O+oaVBCUzbqb7jwekuWUfr6oE5quvZq58SqIu+If3VrxNh7M=
X-Received: by 2002:a25:5956:: with SMTP id n83mr21832868ybb.109.1632645492043; 
 Sun, 26 Sep 2021 01:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-2-f4bug@amsat.org>
 <CAEUhbmWRpcBub4BZu3j4b31jTQsrWEQB3MNw4xv7T8z7PZ+UBg@mail.gmail.com>
In-Reply-To: <CAEUhbmWRpcBub4BZu3j4b31jTQsrWEQB3MNw4xv7T8z7PZ+UBg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 26 Sep 2021 16:38:01 +0800
Message-ID: <CAEUhbmV7uHjPsdkRpqXGYDepXnV-A9CtqL2K-Ot6auFryezq1w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/char/mchp_pfsoc_mmuart: Simplify
 MCHP_PFSOC_MMUART_REG definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 26 Sep 2021 08:38:19 -0000

On Sun, Sep 26, 2021 at 4:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
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
>

Never mind, triskaidekaphobia is a noun, and triskaidekaphobic is the
adjective which is grammarly correct :)

> > registers.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  include/hw/char/mchp_pfsoc_mmuart.h |  4 ++--
> >  hw/char/mchp_pfsoc_mmuart.c         | 14 ++++++++------
> >  2 files changed, 10 insertions(+), 8 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Tested-by: Bin Meng <bin.meng@windriver.com>

Regards,
Bin

