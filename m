Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBWct-000706-NW
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 02:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBWcq-0006zS-Aq; Thu, 05 Aug 2021 02:13:04 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBWco-00055A-Dl; Thu, 05 Aug 2021 02:13:04 -0400
Received: by mail-il1-x132.google.com with SMTP id a14so4022439ila.1;
 Wed, 04 Aug 2021 23:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+2eH+ityX6DFApHcVez8VOFjizWl3DW5ckWR+eYOx0A=;
 b=PlvlRU7SEVcQddQN8Rbb16PBUgsCGXVKRBkRZPZsJGEe90zMJR0rDyINjnbXuRtPJ2
 yATVnxxXKIe0VKv4Hq+9IlzKbKgTknazvxnE89a3kzZ2wCk+TM+QHBPv12M4ZmgIkJbJ
 bfYn8IdNukEduz8gSum+cvudGrn/Nj3oyRi4xchJN3D2lc39VVI6HP3a+btg48EhuwQL
 1MVU3jVZRU+EnMxKFTFEiC1UTIFV7myT7vOnn4TgALR0/lWYlU9UBlce4dWMXLX7Rtg1
 oYs5qd8cSrlb08oZ69fHqTSZkDafVh76hrnzpixxik/CkGzIf19s7VC3fXLY/Pat8zx+
 btyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+2eH+ityX6DFApHcVez8VOFjizWl3DW5ckWR+eYOx0A=;
 b=MAuVlikgApuKeaBmX93of8P/F/C/H6hy7/xmLfjtY9MXhmCi6beC1H7tU8FeFoKSoY
 7GntuzyAbOUYvjkgaEugR+Yv272HUr0yfQpwmhoyVRqH19BJndPBIHK2ZC91U4Zr2Xzl
 7pymT/B4pTblIvOLsXNUfEiUcOheb9CaTvKwb2FdQsMt/z0bWNoLI3LnoF19piDmf1BW
 Hj79KviRYuCyIJmTcz3uIBZczsktvuWKlAoQUru/CyF97+eSvpKG3OKzu+2zfAA2EvqH
 ApHKpV5tJ/wz9BqRp4mHXLP0WU+mCmMQ+BFf4sF3qNZLYhXPcUJmaapGVlnNUzY8N9c+
 L2VA==
X-Gm-Message-State: AOAM5314F515/67j3v8coJ+nwRYTl0i9cAckg1vjN7auFcXLqG2I+ZvR
 Ml44WZXRhA3+q5KcrevAx3quKYl76CMm+5Tkf28=
X-Google-Smtp-Source: ABdhPJxTpdRRchqt7tXHpEyqerCkJnRICV/DzPavZCs+VeuQzdw8UhbQscgqr1q2k5u9u3LkNfUAoSS3AljAdbq9lvI=
X-Received: by 2002:a92:8707:: with SMTP id m7mr889ild.177.1628143980788; Wed,
 04 Aug 2021 23:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210724122407.2486558-1-anup.patel@wdc.com>
 <20210724122407.2486558-5-anup.patel@wdc.com>
 <CAKmqyKN2J7_Sa69bxuzEpaQqDu42EYTQR48Rf7Lkb_EdLcKaRA@mail.gmail.com>
In-Reply-To: <CAKmqyKN2J7_Sa69bxuzEpaQqDu42EYTQR48Rf7Lkb_EdLcKaRA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Aug 2021 16:12:34 +1000
Message-ID: <CAKmqyKNSg6D4=-grY5Pdd--MoVDmEU3h9=gWba7qjUYvOuFXhg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/riscv: virt: Add optional ACLINT support to
 virt machine
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Thu, 05 Aug 2021 06:13:04 -0000

On Thu, Aug 5, 2021 at 4:09 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jul 24, 2021 at 10:27 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We extend virt machine to emulate ACLINT devices only when "aclint=on"
> > parameter is passed along with machine name in QEMU command-line.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  hw/riscv/virt.c         | 113 +++++++++++++++++++++++++++++++++++++++-
> >  include/hw/riscv/virt.h |   2 +
> >  2 files changed, 114 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 48c8b4aeb2..7259057a74 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -49,6 +49,7 @@ static const MemMapEntry virt_memmap[] = {
> >      [VIRT_TEST] =        {   0x100000,        0x1000 },
> >      [VIRT_RTC] =         {   0x101000,        0x1000 },
> >      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> > +    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
>
> Couldn't we use the same address as the current CLINT?

Whoops, nevermind.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

