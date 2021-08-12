Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mEDZo-0000bm-LF
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 12:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEDZn-0000a7-Hf
 for qemu-riscv@nongnu.org; Thu, 12 Aug 2021 12:29:03 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEDZg-0001l9-Vk
 for qemu-riscv@nongnu.org; Thu, 12 Aug 2021 12:29:03 -0400
Received: by mail-ej1-x632.google.com with SMTP id qk33so12652198ejc.12
 for <qemu-riscv@nongnu.org>; Thu, 12 Aug 2021 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZEZv0heoKfcEGyN59PnNr9+YckUCtIZFhFdk+1LOVWo=;
 b=SgBxUE5Bu3fPEh3RcQTxWu8PmGWsA/0Tg6/HX7bSPGMQ4ZzyEqhuw9kVF+g0YO8ubi
 fA4wbhs4EheAxmA9UIah0OvVwivS1w4oVmvODWVKakLjXpktNixJSfaFUy42i2eg2O0y
 w1egmeJp2gzdWeFWrSkZ8qmOFkR7rw9fbPx/DQrEt5qH6fpByouHtSX9cDuahpU7UO5D
 s40rZI8aydYmoDGaienAeRoBdiTuM2qnpZU1qs48biBMrwtLhOJVrdNW9XWdOTE7PqW3
 ELXvY6qhnbWgXsKmTjxyRT1u1X5lqM6TgW+KF+NJoCq5vwyaaT3OEPw280WWDYlFrFeT
 1LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZEZv0heoKfcEGyN59PnNr9+YckUCtIZFhFdk+1LOVWo=;
 b=tk//0zQ/RkkqZGsUwQxlARF1ob9n+gbB6CBpAvft6Uy4Q7paPftM/Pt5wHmHyJGX9U
 qn/UlC2kri8vXLzLgwVFP0TCSMhszsviYBVZgtloeqWaTtFbAdtB9XDsaSxlczkxsHns
 9YsyEP5DwT4N5MOmsCYulXhpAZP0rIUm4CcAlaQi91AybMhf2gQgYRg50sUi6ktdaTsa
 b0ViUlWhlKJqjpIe3FKnyzVVH/NHrYnkCuP535kxQuIavKsE/1NhtF0yy6SO1yD7iuGQ
 2C4wdCt3XdJkr3d6YJpXtiJ7NN2sUU/WupXCksEvLeb74qt5LJJNZ4RnaUFvUKit71S7
 4m6Q==
X-Gm-Message-State: AOAM5302CPvhd88iMNB3uz6K0wSTe7xVJNJiiQShxO+fYqiDaGr12ela
 Kf8xVk+x4sYTa4R/iPwq89xdicX4bDqosrnXXqiuxA==
X-Google-Smtp-Source: ABdhPJx6ycOfpFcc09oe8AFagBwGr6FSPYu8GExPmq75FB6Rgvnv4yStX9YUwmz9x+0e4wmwQFF8B0thnTSp1N08K5Y=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr4592385ejb.4.1628785734766; 
 Thu, 12 Aug 2021 09:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210812144647.10516-1-peter.maydell@linaro.org>
 <2465bcc8-7e8b-8b5c-71ed-d696f69e0f78@amsat.org>
In-Reply-To: <2465bcc8-7e8b-8b5c-71ed-d696f69e0f78@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 17:28:09 +0100
Message-ID: <CAFEAcA-mm-nk=yHcqDjbcU+tgkGuSJmMr_-Bm6O29tyL-MB6eA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/virt.c: Assemble plic_hart_config string with
 g_strjoinv()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 12 Aug 2021 16:29:03 -0000

On Thu, 12 Aug 2021 at 17:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 8/12/21 4:46 PM, Peter Maydell wrote:
> > In the riscv virt machine init function, We assemble a string
> > plic_hart_config which is a comma-separated list of N copies of the
> > VIRT_PLIC_HART_CONFIG string.  The code that does this has a
> > misunderstanding of the strncat() length argument.  If the source
> > string is too large strncat() will write a maximum of length+1 bytes
> > (length bytes from the source string plus a trailing NUL), but the
> > code here assumes that it will write only length bytes at most.
> >
> > This isn't an actual bug because the code has correctly precalculated
> > the amount of memory it needs to allocate so that it will never be
> > too small (i.e.  we could have used plain old strcat()), but it does
> > mean that the code looks like it has a guard against accidental
> > overrun when it doesn't.
> >
> > Rewrite the string handling here to use the glib g_strjoinv()
> > function, which means we don't need to do careful accountancy of
> > string lengths, and makes it clearer that what we're doing is
> > "create a comma-separated string".
> >
> > Fixes: Coverity 1460752
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/riscv/virt.c | 33 ++++++++++++++++++++-------------
> >  1 file changed, 20 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 4a3cd2599a5..26bc8d289ba 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -541,6 +541,24 @@ static FWCfgState *create_fw_cfg(const MachineStat=
e *mc)
> >      return fw_cfg;
> >  }
> >
> > +/*
> > + * Return the per-socket PLIC hart topology configuration string
> > + * (caller must free with g_free())
> > + */
> > +static char *plic_hart_config_string(int hart_count)
> > +{
> > +    g_autofree const char **vals =3D g_new(const char *, hart_count + =
1);
> > +    int i;
> > +
> > +    for (i =3D 0; i < hart_count; i++) {
> > +        vals[i] =3D VIRT_PLIC_HART_CONFIG;
>
> Have you considered adding plic_hart_config_string() an extra
> 'const char *plic_config' argument (declaring it in a new
> include/hw/riscv/plic_hart.h)?
> We could use it in the other boards:

I hadn't noticed those, because Coverity doesn't complain about them.
Both sifive_u.c and microchip_pfsoc.c would need slightly different
code, though, because they are setting up a string like "M,MS,MS,MS"
where the first element is different from the others.

This is (I think) because they have the same misconception about
strncat()'s length argument, but they have a counterbalancing bug
where they reduce the 'remaining bytes in buffer' argument by 2 each
time round the loop even though the length of the first element in
their comma separated string is only 1 byte -- so they are accidentally
turning the length value into what it ought to be.

So those other board files should definitely also be updated to
use g_strjoinv(), but I'm not sure that we can usefully share code.
(We could have a function that takes an argument for the string
for the first CPU and one for the other CPUs, which would work
for all the boards we have now, but that feels a bit contrived
and maybe some other boards in future would want to make different
entries in the list be different...)

-- PMM

