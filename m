Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mELW3-0004Qa-VC
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 20:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELW1-0004Pv-QS; Thu, 12 Aug 2021 20:57:41 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:45023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELW0-0008DK-C3; Thu, 12 Aug 2021 20:57:41 -0400
Received: by mail-il1-x136.google.com with SMTP id i13so9090005ilm.11;
 Thu, 12 Aug 2021 17:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BJELDdo/Vw8F6VWMt1U+3Qx7I97Tle9WvtxsfBgqfVE=;
 b=SlRsXN51XIUUIVs2WDOf6UOQN8GcPm/FHEGwOwdrR6HvnAO3uDTz1jmuqtVEeNL4iZ
 4B6yeZeOBchEFIh0EBjmvPGtwWHKLtBWY91htJjGGE5KA3XJm/hFhXpCtfNoLFFypYPV
 BleYXS1aPBvwTDd3VkMmgtrp1+jIv7jEz+dW2I1W2/1jEz/hATh6JyJpDfY0JBsMSp1U
 7WOAf2Qzk7BmkooJc5Mf2C794poV2yLwUyJjHUaeIJvPColiEQw0bDQhMz7oXJjhEmD2
 uv++dzXznX9z2TocHpH1RngLYf1f5RalRmfVdhjX0RxHv3xalx8uCQhGoVQe2kGVlU/s
 iRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BJELDdo/Vw8F6VWMt1U+3Qx7I97Tle9WvtxsfBgqfVE=;
 b=OB0jLB20i0ciRyVaBafT3gTuUhfkBYca2KdOnhV87c36Ov5d9OSVQXKqWw7bWelFtS
 VAvFSYAIuRO0wPjfYXdWPOA2510J3IUpuSnhO/rOIhwa8S8iNbOhur8HcGDy2ke6kmRX
 6GYe0Ncru5Qy8e+cStheTtYKPqQjP+uxZkf3IwCpVxpTrY2CpDxS4Zk73/xqnjOrpUjb
 4wPBlCg6wZE6GZw1eqZaQicm0xQsxD7LpI7TZaCODMjDCDt5HWn2gqNk1xbnP7rrJgfr
 m6O2bGP0bjftgXcGUvyDGw9387OPQDw/rZW8qdsHz4yIpky6B+12N1kF2daIGSyu8hv5
 NPVQ==
X-Gm-Message-State: AOAM532VXJwKjIPA8ZIwObdvS66i4AF3AYBfrHBU18lb7trlhkaZuzPo
 mzqt/bGulVzb/2ZUsyze9ctmY6AZW6Ugxjo15OI=
X-Google-Smtp-Source: ABdhPJxqq2PRlLW5I3l3Mw5qxLe8w3BwpWAXZaMgjSWiSKbqq4W9CJPIIm0zGlEwGmin1m+ikjDn8MTvo9QtCfGOEmI=
X-Received: by 2002:a92:c24d:: with SMTP id k13mr876016ilo.227.1628816258825; 
 Thu, 12 Aug 2021 17:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210812144647.10516-1-peter.maydell@linaro.org>
 <2465bcc8-7e8b-8b5c-71ed-d696f69e0f78@amsat.org>
In-Reply-To: <2465bcc8-7e8b-8b5c-71ed-d696f69e0f78@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 10:57:12 +1000
Message-ID: <CAKmqyKNFpPJqQ5DTTvSQGBWfB9UW2xrhFf6DJQgB6Zt4ZGp+mw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/virt.c: Assemble plic_hart_config string with
 g_strjoinv()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Fri, 13 Aug 2021 00:57:42 -0000

On Fri, Aug 13, 2021 at 2:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
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
>
> hw/riscv/microchip_pfsoc.c:267:            strncat(plic_hart_config, ","
> MICROCHIP_PFSOC_PLIC_HART_CONFIG,
> hw/riscv/microchip_pfsoc.c:268:                    plic_hart_config_len);
> hw/riscv/microchip_pfsoc.c:270:            strncat(plic_hart_config,
> "M", plic_hart_config_len);
>
> hw/riscv/sifive_u.c:826:            strncat(plic_hart_config, ","
> SIFIVE_U_PLIC_HART_CONFIG,
> hw/riscv/sifive_u.c:827:                    plic_hart_config_len);
> hw/riscv/sifive_u.c:829:            strncat(plic_hart_config, "M",
> plic_hart_config_len);
>
> hw/riscv/virt.c:612:                strncat(plic_hart_config, ",",
> plic_hart_config_len);
> hw/riscv/virt.c:614:            strncat(plic_hart_config,
> VIRT_PLIC_HART_CONFIG,
> hw/riscv/virt.c:615:                plic_hart_config_len);
>
> include/hw/riscv/microchip_pfsoc.h:141:#define
> MICROCHIP_PFSOC_PLIC_HART_CONFIG        "MS"
> include/hw/riscv/shakti_c.h:63:#define SHAKTI_C_PLIC_HART_CONFIG "MS"
> include/hw/riscv/sifive_e.h:83:#define SIFIVE_E_PLIC_HART_CONFIG "M"
> include/hw/riscv/sifive_u.h:147:#define SIFIVE_U_PLIC_HART_CONFIG "MS"
> include/hw/riscv/virt.h:74:#define VIRT_PLIC_HART_CONFIG "MS"
>
> Obviously someone else could do that as bytetask, so meanwhile
> for Coverity 1460752:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks for fixing this Peter. Would you like this in for 6.1?

If you want I can fix the other boards?

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

