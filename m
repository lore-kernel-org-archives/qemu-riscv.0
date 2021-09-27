Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUqT4-0000vB-Hi
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 09:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUqT0-0000o9-5n; Mon, 27 Sep 2021 09:14:47 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUqSx-0000P0-H3; Mon, 27 Sep 2021 09:14:45 -0400
Received: by mail-yb1-xb31.google.com with SMTP id m70so23873378ybm.5;
 Mon, 27 Sep 2021 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dbgXx+FoyOGtpljJGxz4wF7d6fU4OseGG73rw3GaxSk=;
 b=C95+J+v3VAEMLlVsB0LVBx8AMC+MOW5P5CULqpAojzGzltHpz14ey9gRoqKeCQ2thC
 T423oGB9w3hEHmIKDDJM5tTQH1wWWxXqmHz3QU+MmWzlfuVJA3Op2yI2qc+87e05zt2H
 QVEoyftdJbO8tL+ro9rC2HdVhIQx4+UH573K2RGWdr+MkN+GLmbd99oYYFDNjdGN6vlz
 3GyZlzJD1RoIQJB+Wjb8vmewVMU7+fj6hpfJP1C3p0bo23vUuY/kPY/7bqJcX/wrNkSF
 NCM08Qe9I3uQrD24+i41jcPlV4bF5i0g7j1hGV40HYCRGRtMUHD7Bk2Q/vvR7iKkTNQF
 kk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dbgXx+FoyOGtpljJGxz4wF7d6fU4OseGG73rw3GaxSk=;
 b=QuSr3TQCV9uiyXtUVPDRXLYTnZBk+Q+FpIC8c6GZRht1LIXnQkXD5Bum4GXhfMw3DM
 uBmrrJ7JG/5nUwE4uJzlNOfLkirzM/XggW6QFc0wvP3chH9wdTc0PL3itA/l6Cd/P26F
 tIOIyJRC5FUP2SAwpjGThqwxdQwS86Zaj3PW9fEYA0ZQa8M5G+yszjyhgILqYl9HRSvu
 U+zVRHBaT7b8DfaMLK721jya1gt6WhMm5Q+ZT+97/sd0f2elJkzRTzJIwrX3ERwQERhO
 bhPQm9i7KYyHNEOCcZHszPZAe6hWBVXXCRzcfa0SYKADnggkSdCZ7lQhWOsKWgrGA1+C
 uKPA==
X-Gm-Message-State: AOAM531Gle4nippf1iq1JnUSCI1oADEbpMkzKmw9pBWHY3jO0lyt0jVg
 dkEAZKhASEMZMFEI3QYm8kzDJiF1rNXdJqA6FLQ=
X-Google-Smtp-Source: ABdhPJxjP50qiZager2c+jupGh5CpvP7UIem8J2hIjPGyklqna1SCxBnsnj3ER1GIwy+VYR5AeQt37b3GIjO46N+loE=
X-Received: by 2002:a5b:88a:: with SMTP id e10mr6386933ybq.467.1632748481607; 
 Mon, 27 Sep 2021 06:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210927072124.1564129-1-bmeng.cn@gmail.com>
 <3e1507b8-81a4-aa98-5079-e07021be5a73@amsat.org>
In-Reply-To: <3e1507b8-81a4-aa98-5079-e07021be5a73@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Sep 2021 21:14:32 +0800
Message-ID: <CAEUhbmU+N65N7NB=AO3O10Y_k0Hu9wnESk6AZ6r2PT4XH+AJAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/dma: sifive_pdma: Fix Control.claim bit
 detection
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Mon, 27 Sep 2021 13:14:48 -0000

Hi Philippe,

On Mon, Sep 27, 2021 at 8:56 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 9/27/21 09:21, Bin Meng wrote:
> > At present the codes detect whether the DMA channel is claimed by:
> >
> >   claimed =3D !!s->chan[ch].control & CONTROL_CLAIM;
> >
> > As ! has higher precedence over & (bitwise and), this is essentially
> >
> >   claimed =3D (!!s->chan[ch].control) & CONTROL_CLAIM;
> >
> > which is wrong, as any non-zero bit set in the control register will
> > produce a result of a claimed channel.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Maybe worth adding:
>
> Reported using GCC 9.3.0 on Ubuntu 20.04:
>
>   suggest parentheses around operand of =E2=80=98!=E2=80=99 or change =E2=
=80=98&=E2=80=99 to =E2=80=98&&=E2=80=99 or =E2=80=98!=E2=80=99
> to =E2=80=98~=E2=80=99 [-Werror=3Dparentheses]

Actually GCC does not report this as CONTROL_CLAIM happens to be 1 in
this case, as I wrote in the v1 commit message. :)

Regards,
Bin

