Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTczl-0005Kp-Eg
	for mharc-qemu-riscv@gnu.org; Fri, 24 Sep 2021 00:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTczj-0005IU-Eu; Fri, 24 Sep 2021 00:39:31 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:33591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTczh-0000Ob-Pf; Fri, 24 Sep 2021 00:39:31 -0400
Received: by mail-io1-xd2e.google.com with SMTP id n71so11112630iod.0;
 Thu, 23 Sep 2021 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=64QTVO8Ev61Ie3oFphXDezfMdKzP7uUxaM9xJ0MMM6g=;
 b=cMsgWWso1IWjS5lvSeaNYkYpSRKDJWv6UhqehdyXINqaSa4MSoUas0v9RRtngF71j0
 LvnmvvhyZXl55AfSYa16MUl2lRXW8lvXTFljIujgznZQj40i75QNJD6CWijEOTw65efk
 GN4ryYwgeLdrGLINw63ULyewA0vyXDc9501fWqP53zGv3SbTyLT5joRYiqMmWZdKAVx3
 Nm5TGteXSRcOznCLMHU1AxagtSa2DI0IkdOTbX6Xiiyu+6WiTHeEQw5BlH8fGayI+au4
 VaISlcPJPSQQ35LiFTnVTZKQtaJ5qaw466cwY5zD5FFAZBZ4uPfD43SXC9fGGg0biF4F
 putw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=64QTVO8Ev61Ie3oFphXDezfMdKzP7uUxaM9xJ0MMM6g=;
 b=Bnydl+s6tj+Z/jdDrHBm3NV3bPeScr0C3wkmU6hcYtBYKAN+XSfN3WxrCDUWJyIhyj
 0heSVqV3bHoMhfqIX9zjuy2bo/d/xpKsnW3AasgMaPf3/WPAkZSvOOoxh+qW9uQKOpIp
 jPZQaQqXg4pJbemQwY7DKbMItk1xs2nNiHSRGL675z+aZR4D7eRx2rE3lOvAbpBm6Yez
 2y/TU3KWmj+T4C1MJN8V0kZXgEFceW44breU0ZV9pB1Ax2vENj1yaIKmLiu7DPvUHHtT
 oZFOXFeFT0yyhQmDTa64t28bx5lB9yo08F3XCKcYd1UHSsaCa3Z5nvvFr4uONiT5gmTj
 3UdQ==
X-Gm-Message-State: AOAM5325IBMsDXI2kCENiblA9a5D59TwTm418m9B9R1BO/vfRgdSh72B
 6+G1+1WE5cdeUwA8YmR5gFY4H67a0buTxddTkas=
X-Google-Smtp-Source: ABdhPJyb4248/SSqtio4orhNNxjafXt7PtV8K+3tdo8AmSGtBG54Q9D68F1uE43tlQSG6oPix4w6kJz3JqKxa2CIz9g=
X-Received: by 2002:a05:6638:61c:: with SMTP id
 g28mr7290834jar.117.1632458366498; 
 Thu, 23 Sep 2021 21:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 24 Sep 2021 14:39:00 +1000
Message-ID: <CAKmqyKM2qM3pQaTN06S+TwWBCd2cB4pusex9z7NvdypZC7Nbiw@mail.gmail.com>
Subject: Re: [RFC 00/10] add the rest of riscv bitmapip-0.93 instructions
To: Eric Tang <tangxingxin1008@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Fri, 24 Sep 2021 04:39:31 -0000

On Sat, Sep 18, 2021 at 6:20 PM Eric Tang <tangxingxin1008@gmail.com> wrote:
>
> These patches fixed some issues about srow/sroiw/clzw instructions and
> add the rest of riscv bitmapip-0.93 instructions except fsri/fsriw &
> bext/bdep & bextw/bdepw for opcode coding or name conflict problems. The
> problems had been fixed in riscv bitmapip-1.0 version.
>
> I have tested these bitmapip instructions, passed by compare the results
> that produced by qemu and spike.
>
> Please review and give your opinion kindly :)

Hey Eric,

Thanks for the patches!

Unfortunately there is already a series "target/riscv: Update QEmu for
Zb[abcs] 1.0.0"
(https://www.mail-archive.com/qemu-devel@nongnu.org/msg839086.html)
that adds support for the v1.0.0 bit manip extension. That has been
reviewed and queued to be merged.

If you have fixes or features that apply on top of that please send
them though :)

Alistair

>
> Eric Tang (10):
>   target/riscv: rvb: fixed an error about srow/sroiw instructions
>   target/riscv: rvb: add carry-less multiply instructions
>   target/riscv: rvb: add cmix/cmov instructions
>   target/riscv: rvb: add generalized shuffle instructions
>   target/riscv: rvb: add crossbar permutation instructions
>   target/riscv: rvb: add bfp/bfpw instructions
>   target/riscv: rvb: add CRC instructions
>   target/riscv: rvb: add bit-matrix instructions
>   target/riscv: rvb: fixed an issue about clzw instruction
>   target/riscv: rvb: add funnel shfit instructions
>
>  target/riscv/bitmanip_helper.c          | 351 ++++++++++++++++++++++++
>  target/riscv/helper.h                   |  28 ++
>  target/riscv/insn32.decode              |  36 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 215 ++++++++++++++-
>  target/riscv/translate.c                |  14 +
>  5 files changed, 641 insertions(+), 3 deletions(-)
>
> --
> 2.17.1
>
>

