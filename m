Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2oGe-0007rm-U0
	for mharc-qemu-riscv@gnu.org; Mon, 12 Jul 2021 01:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m2oGc-0007nr-SF; Mon, 12 Jul 2021 01:14:06 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m2oGb-0007Of-7c; Mon, 12 Jul 2021 01:14:06 -0400
Received: by mail-io1-xd30.google.com with SMTP id h6so21081836iok.6;
 Sun, 11 Jul 2021 22:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9QZRpV09CZBscQ2RY08UzchYJOMsRsIIC0RYod4A7U=;
 b=Ifome3/oHGYQNPItfdQtT8ifHkNXtyEBaIb788Qei/6EJ94TxY/BR91TwqJjgWIvO3
 NljRvlx3UzJKIoi/fmRjJSquaHJzkeJfT1i37JGSkrhj0Cvr5nclcZMT+mmzys1aAgb7
 UAZRqfL6JIZH7gnnRzcURRgC5u4+5PRYlZKqk9CLsDqCFxWIj0n9EJQdxR0kDb7PQCFn
 hoX8YMacNtNPYtUZBlTdN+xNLBbgZWmlzLnk5Y8RFfC08nnMS2JX6tHzQQvWi7Y7aUPM
 M48caCIed8GR6lKYEc3Li24fXiYSaglet9TuBtc0qQZLRIEfyIOXorGSfkRvhmWcjwor
 uxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9QZRpV09CZBscQ2RY08UzchYJOMsRsIIC0RYod4A7U=;
 b=coZlP8uaIXTnYu5q/gm/uedbfIA1Z9bY+Lw+/m4S+9mez494ZIswG5eCZm4Y3DmYEB
 708Y1uwWUjSZr95ArYUK/gLtCIKriXf0LQPiNv/oLOcg2USFF9NHTvKrzMepYVoIt+k/
 B1wxcaoG7T0oIe/mJMYG+KGqiD/lXM1gZf+H8gcCMa/cIrITHWIl+9QrQJADXkNlsFIa
 ydcLgTl4oM8hEfjupfn9cU2KhQr8u3QvsK07fhiBqu9CoFDJiIE8IgIKfN+Cu2+4fX6N
 kZM+lsrV4JCJB/St+4k+IsrFClKvpB2PxzuidDgRdEcv1WwFCM2KjejOVYPnDzLf8wP8
 Gmkg==
X-Gm-Message-State: AOAM53396GnD8Oq40ty6cCbnWs1lXBB8Kdlolae0Xm9phsE9jwqP7N7k
 n0B4GJW9xEZKukKyd+HTNM+syO701gOyfkwbgSY=
X-Google-Smtp-Source: ABdhPJxqceAkqYOEIRD0V4yEDj+3tFm2Un5fOiQ1kZZTPm/nAP76p8poSDz1IOsubeKcQXGI9INvSQkXvD+pbBGXkTw=
X-Received: by 2002:a05:6602:140e:: with SMTP id
 t14mr38481971iov.42.1626066843734; 
 Sun, 11 Jul 2021 22:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625801868.git.alistair.francis@wdc.com>
 <c9cfbd2dd840fd0076877b8ea4d6dcfce60db5e9.1625801868.git.alistair.francis@wdc.com>
 <CAEUhbmUP9fWzZHEc3hir2fJ15k07VmDcmrc=FzbRy_CZMC6_fg@mail.gmail.com>
In-Reply-To: <CAEUhbmUP9fWzZHEc3hir2fJ15k07VmDcmrc=FzbRy_CZMC6_fg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jul 2021 15:13:37 +1000
Message-ID: <CAKmqyKMK5UkaGuH05vjUfAfuFhAebGWErmMc6MbboWR7jEMTtw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/riscv: opentitan: Add the flash alias
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 12 Jul 2021 05:14:07 -0000

On Fri, Jul 9, 2021 at 10:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jul 9, 2021 at 11:38 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > OpenTitan has an alias of flash avaliable which is called virtual flash.
>
> typo: available
>
> > Add support for that in the QEMU model.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/riscv/opentitan.h | 2 ++
> >  hw/riscv/opentitan.c         | 6 ++++++
> >  2 files changed, 8 insertions(+)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

