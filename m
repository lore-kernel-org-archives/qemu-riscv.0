Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcd88-0008BI-PT
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcd86-0008AU-Lf; Mon, 18 Oct 2021 20:37:22 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcd85-00014n-0s; Mon, 18 Oct 2021 20:37:22 -0400
Received: by mail-io1-xd31.google.com with SMTP id b188so13498735iof.8;
 Mon, 18 Oct 2021 17:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zv+uYias9p3F1MI0WRzZJpOFHCV3Aroe2y85IEB5qS8=;
 b=RZyRPqEdXMyTORYh83mkW5D5Uhjrxe7/RPYr6gPqhEKJIS73Qa5rvWdnsoe0m3eXUR
 nFoIHlyCqbl74ySZ0wlGy/kYu/TbWxJM8liAchC30W0GX71XC2XCgebBuP1i+1k0X0gF
 /UiBhE/8SVZ8Zo9kcEcL/Lt2ZeLr69cFJxKYeGrZLOsB0rMPSDxQu3uSUhp1a2dz4Vam
 cp6e8m2Xjghlv/IamXcG6hmqgZcBMO6heg2vNZFOPRTDEgZa2ui0cw+fh1gWUKRxuKor
 WoA/eeR80JXOCGtwTnKXgmeSBLYP7Xi47X95gsMcC437GRiiwFwyfwzkteqteYDq1hsE
 sloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zv+uYias9p3F1MI0WRzZJpOFHCV3Aroe2y85IEB5qS8=;
 b=7mM0d7glcLG9zSXCZQgB0qoiW8GUoGpiSuAFb4rlXd4zSp07MHB/AOXcrmutwZqCUW
 ufSVNymH3bKd9ZUhA+n3lUFUZDpqQr8ujT3oFflyJX/U6LbPiVUdoKGuVPKn3so8b77O
 E8dXHKMUe35mOrq8dkzgh7HG/mUskbs3YJv4edp+5OnZuQitDT0vvALJllI24hGzC6x9
 DNzzZnDrAJt/h4eZR9ooXNPaKoJBPQmp8MJ4GhrTjcBnRQ50u+oieEJ4W4aQ827coRV8
 0As6+99UoR/4pbxSlC0WZ/Emg7c2nX4UaJh9h8032QQApTsYEH5tYeAEzKqPDcjkfOhE
 Y0CQ==
X-Gm-Message-State: AOAM530rNUD6k2HeLlf/2pUHKPnND2NCT6+Rdt58drDAx7M/V07Wiyu4
 iu7wxtXHmKlAR0Jm/O/ohYY7BccClvJ40d61rVg=
X-Google-Smtp-Source: ABdhPJxjTZwFpNdg380DyjNjInDbRowiEfwCEW0d0B7Py5R8cIqWVUe407LFzUfBDy8vuPFYnZlZAhVe0oepC/8moY0=
X-Received: by 2002:a02:a786:: with SMTP id e6mr1921950jaj.117.1634603839119; 
 Mon, 18 Oct 2021 17:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
 <f6ab317d-86f4-9ad0-c108-0705593be3d9@amsat.org>
In-Reply-To: <f6ab317d-86f4-9ad0-c108-0705593be3d9@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Oct 2021 10:36:53 +1000
Message-ID: <CAKmqyKNOTZeXhoyi+w+GEPUPGAKTiy9+rQ0aEPye=YZU4FVfTw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/riscv: Remove some unused macros
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
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
X-List-Received-Date: Tue, 19 Oct 2021 00:37:23 -0000

On Mon, Oct 18, 2021 at 7:30 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 10/18/21 06:32, Alistair Francis wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
>
> Possible commit description:
>
>  Since commit 1a9540d1f1a ("target/riscv: Drop support for ISA
>  spec version 1.09.1") these definitions are unused, remove them.

Thanks, added.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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

Cool! I'll check it out.

Alistair

>
> Regards,
>
> Phil.

