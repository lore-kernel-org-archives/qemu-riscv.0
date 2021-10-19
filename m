Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcepe-0006OZ-Nc
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 22:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcepd-0006Lv-7d; Mon, 18 Oct 2021 22:26:25 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcepb-0003p5-NQ; Mon, 18 Oct 2021 22:26:24 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v195so3300083ybb.0;
 Mon, 18 Oct 2021 19:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uRnUCI2fFMAtu4+fRz98xm2gJWV1dGwA1dUvqU+Wknw=;
 b=Ctfe4rrfJ870LO+iTCUm7CXzhV4wLyJ52ycCvcaWfzk+J+fvyIpAr6uy14DsX8XHkb
 pR8FbSc7aQaxOSXz9xQ4errPtWHP8JXzgPP3i/pHV3facNEUAHNtZZG0/NDsL/9KKRqt
 OlZfWLwQLfYTGQ+CIvQN3x1UZjZzXtV5QSgRsN28c2jM76dUcICuRjSCQOBBwqHX0NLO
 FoUVabp4hsePMY+00tkUpLeOBgeNtMptAmi8Y7bTe5JIRCpMwkC/GOBCmkRVj+10KO0d
 EABAHsXat035B5Ld0bkFuBCmfpLpdUobwYASjQAftbgtSr3uDJMeE5NOrNvOQQV/F8Ti
 yR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uRnUCI2fFMAtu4+fRz98xm2gJWV1dGwA1dUvqU+Wknw=;
 b=xKzHKPsmWBuZl+XGqGHT+xwqmI2SlXzSBFReuJDY0rKIA0/KhfTzi1tKr6f28sqjZ4
 kp/zgzuD/z6aZrd0NhidAnnIfhS0ZaDrLnMQZ6AOhB8jULBzAVJ+GIeJE1QzzJGdDlYn
 1d1mSXptka2lN9bMoNT4VZfWdMRpbnJo3u5Sc4dxs2ogjicge/uensQqtWS2Ap5tPCKM
 9LivK24a99CerPoqrFpzI3FFVgOmsFZJqJlfSB8fEBiEDj+AfeKZ3xdfeaVFelL9gh5I
 CgIJzQfbsDl6rHnN2XQUU6+zlaVAH1E99f7IQm1KaKIEpLMEjM0205z1xiYW1NfJaz9g
 O6Ww==
X-Gm-Message-State: AOAM533QJCy6y+t6dGwUjvbY+umJXhfbE2mDdgcO1XFy1PqD5eYWJf5D
 CH/MhRKB14zFMJHFEk0oXcsBfgCtPB4CTo8AMf4=
X-Google-Smtp-Source: ABdhPJxWJgYEl+FTabzZNBsKrta9tZ2gqIARX/Sx61VND+LRO8riBOIVvtrHEUwsrRbbRaD2ol2FRB2ZVAj5paK1qvc=
X-Received: by 2002:a25:3245:: with SMTP id y66mr33568652yby.332.1634610381900; 
 Mon, 18 Oct 2021 19:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
 <f6ab317d-86f4-9ad0-c108-0705593be3d9@amsat.org>
In-Reply-To: <f6ab317d-86f4-9ad0-c108-0705593be3d9@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 19 Oct 2021 10:26:10 +0800
Message-ID: <CAEUhbmX=xw-gwysp6CFwmqmgV5Ki1eempgNK1XdAn47SJLGBkw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/riscv: Remove some unused macros
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 02:26:25 -0000

On Mon, Oct 18, 2021 at 5:30 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 10/18/21 06:32, Alistair Francis wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
>
> Possible commit description:
>
>  Since commit 1a9540d1f1a ("target/riscv: Drop support for ISA
>  spec version 1.09.1") these definitions are unused, remove them.

I believe the commit tag should come in the same line otherwise it may
break any script that extracts such from the commit message.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu_bits.h | 8 --------
> >  1 file changed, 8 deletions(-)
>
> BTW I strongly suggest you to use git-publish for your
> series / pull requests:
>
>   https://github.com/stefanha/git-publish
>

Regards,
Bin

