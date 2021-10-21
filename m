Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdbWX-00044Z-0y
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 13:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mdbWP-000434-1X
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 13:06:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mdbWJ-0005Br-5f
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 13:06:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso436827wmc.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tEGhx5P3FcpsCBX6IaldfqX9RQtIXBdFtyUSKwEgIPQ=;
 b=wi84dFsfa2KJZdXM1ZIgbSVV9JFNKXLRun5LkWmI3p3eLFZ1LI3G4qdVz0ejAK2Mf4
 x1beFqehB8OIjG5vd1nPIJVaXfTUiKH/yvcoMKy4b/qu1XRudBzUv69/SCUERo8Ykrqz
 gVXpNbLQqUMs68Z1ZT1jpqr1OHCogkutGyncbgVPR1TJcxqvGQFIldspIDd4NyUdidVp
 krql+V8voXNe1ka/nyZUxYcayZNkP7cTf1vGnkSuBdZGaO5kW0wPVQc08+ZeH05VsfUT
 ICOqrIVKo5mIicLiNum+dIGMVwytU4ks3D8QcJgTNKGm7dCSnduQ8oVMmaWagLns2woQ
 s73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEGhx5P3FcpsCBX6IaldfqX9RQtIXBdFtyUSKwEgIPQ=;
 b=F0cOZ2wBiXBtd3tSryrtVlME4fSXy+C2yBAgVoDdGhkbyekv3IAbHJaUZ2IQs4I2M5
 Gp98G2U78Jwmf+TAw7k2htqERW9k/4G+R1amCMaJ2jvcbIr1kPJTim2/O1MaJcvNZqPS
 X+l8GByvxfvFmIQoOl27R9eXvHSs0HHSVg6oEkgVhQDP/mdykMsDpYRbHBoqDJNW4zlc
 7wBG02lFa4yyWysCDNktkGt+LY61mTWOpUroqmSxLKo7v2CFBo5NVQ1zqHJSHRv1Yn6m
 Q+3oX1W8n32aIYoNDaICC86fqZdlItO2+oTBF4+/7uF1GgHFSfcfE+6C510/VT1ds4F3
 Saqg==
X-Gm-Message-State: AOAM531IqzShMowpshmMd7bCjkhiqnh7hy4aW9IfSPf8K4fJEJ6StLNr
 IpRlpVb4eQBmuD3fIYNkPNTRt6DAaOJ6hb6ht7sWWw==
X-Google-Smtp-Source: ABdhPJw1tvqSTLGhSFTfRea8Wuwo+wjgf9id9lEqBd77jlyX+Fq7eczxDL8GHlyNYamcUD+q3Zw3D3pO7z87FFquRnI=
X-Received: by 2002:a7b:c742:: with SMTP id w2mr8178932wmk.61.1634835980038;
 Thu, 21 Oct 2021 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-6-anup.patel@wdc.com>
 <CAEUhbmUiq4hPgEP9xiEsb0kbDwYJyBqet+gnn+ydrJekxwnNyg@mail.gmail.com>
In-Reply-To: <CAEUhbmUiq4hPgEP9xiEsb0kbDwYJyBqet+gnn+ydrJekxwnNyg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Oct 2021 22:36:08 +0530
Message-ID: <CAAhSdy0Eq2kDojgZMof93AqbL6P6DBJXC85rNxzE7cXPGZ4GcA@mail.gmail.com>
Subject: Re: [PATCH v2 05/22] target/riscv: Allow setting CPU feature from
 machine/device emulation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::335;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Oct 2021 17:06:32 -0000

On Sat, Sep 4, 2021 at 8:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Sep 2, 2021 at 7:42 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The machine or device emulation should be able to force set certain
> > CPU features because:
> > 1) We can have certain CPU features which are in-general optional
> >    but implemented by RISC-V CPUs on machine.
>
> on the machine
>
> > 2) We can have devices which require certain CPU feature. For example,
>
> a certain
>
> >    AIA IMSIC devices expects AIA CSRs implemented by RISC-V CPUs.
>
> expect

Okay, I will update the commit description based on the above comments.

Regards,
Anup

>
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.c | 11 +++--------
> >  target/riscv/cpu.h |  5 +++++
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >
>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

