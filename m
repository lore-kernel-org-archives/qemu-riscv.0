Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDFQb-0006iW-NV
	for mharc-qemu-riscv@gnu.org; Sun, 17 Jul 2022 21:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDFQZ-0006gx-Ma; Sun, 17 Jul 2022 21:20:03 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDFQY-0004FJ-3x; Sun, 17 Jul 2022 21:20:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id a15so10446737pjs.0;
 Sun, 17 Jul 2022 18:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3jTjD2ES5JtLgCp5yeRBFz5zXh7/g8p/yqeuGiVdOe8=;
 b=lGeo8bfmeikQwwX1QvoLAYGRSn2knDUdeYpYBK6i/3ulnVQvs3aDZEnuAvCpzScdHi
 aVVY6kzXKhQ6p/qhPv/BYohkz4B719NwuLY8RUBKhx0QhK22qPNsL5jB+qvd7Nbe8a80
 TLhq3fyZaxXJ2gT+ulmtmqG5wbTveoxKs5qbs5isizUEZvuiL5EOHUmJKOFp5h0JtOA1
 nRWLkaRNG9slycm00mY6fH0jEC8eRwOCC6OmXTsqWCS3pEZIOMlgBQxIPzBzFkZEodLd
 uN4DDQEji0QaDDg4zdD16Z+b8HCQFKuDk7zYBlRfpWzAUB/bSM5sILnNhDkeYs7K1xKJ
 M0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jTjD2ES5JtLgCp5yeRBFz5zXh7/g8p/yqeuGiVdOe8=;
 b=kOYJyIfEnSZK6Fs7O2Xet7IG3OJyHna4S3ghxUek9achEznwAwHtSdSFTdDbVrf/TC
 n/++y0hMJqSI+XYN9FjcpHrJapA6B42hLNqsl4LKXVe5kN51ueoJmhnLw6lmI38ZHUXf
 lZgUWIGJcp+d1lFZdD/HzWW6cIjWpojA7qgw7E2u2njrHlpuxzc7kPTSptOQHYH+CG5K
 T6lpm+aI4myoJsbUBWwte1AuNTp4lEVbGxM+3qH+rnlHyaeRp6e3P8LJ27fv3PCWW8qN
 hDQjZmQuh/Dpbf2v6IeSHy9YKS4re2sU+JN8q/sikRgVuciRDeK+6hzZWMmOjrE4HV5e
 BI9Q==
X-Gm-Message-State: AJIora/ejQ9nJaCUkxgLVrjWSjgp+KbPxYcojaurlbTyzE+46YCpSaA+
 8WmQ+q/2jgk27WrHxf516vu3qIT5GN4+fWk2420=
X-Google-Smtp-Source: AGRyM1tmySQAFgQ7nSATXbVi3Ksr7I1ovqo777Igl/7l0XG8GizgyAtbO81gkmF1aciUtcSFZoXQgZYYIboXgxsFm4Y=
X-Received: by 2002:a17:90a:e611:b0:1ef:92b6:d31 with SMTP id
 j17-20020a17090ae61100b001ef92b60d31mr35492879pjy.166.1658107200405; Sun, 17
 Jul 2022 18:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220714180033.22385-1-palmer@rivosinc.com>
In-Reply-To: <20220714180033.22385-1-palmer@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Jul 2022 11:19:34 +1000
Message-ID: <CAKmqyKM78vOCmtQuWwKCnk3XYhS3sRjaCYCJh=iFF1G=FpLJZQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow both Zmmul and M
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Mon, 18 Jul 2022 01:20:03 -0000

On Fri, Jul 15, 2022 at 4:13 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> We got to talking about how Zmmul and M interact with each other
> https://github.com/riscv/riscv-isa-manual/issues/869 , and it turns out
> that QEMU's behavior is slightly wrong: having Zmmul and M is a legal
> combination, it just means that the multiplication instructions are
> supported even when M is disabled at runtime via misa.
>
> This just stops overriding M from Zmmul, with that the other checks for
> the multiplication instructions work as per the ISA.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db2b8e4d30..cab74faaca 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -709,11 +709,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_ifencei = true;
>          }
>
> -        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
> -            warn_report("Zmmul will override M");
> -            cpu->cfg.ext_m = false;
> -        }
> -
>          if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>              error_setg(errp,
>                         "I and E extensions are incompatible");
> --
> 2.34.1
>
>

