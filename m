Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3poz-0003UA-Fd
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 19:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3pox-0003Tv-R2; Sun, 24 Jan 2021 19:33:31 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3pou-0003KH-ML; Sun, 24 Jan 2021 19:33:31 -0500
Received: by mail-yb1-xb29.google.com with SMTP id b11so11679869ybj.9;
 Sun, 24 Jan 2021 16:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/dtsJ4JDAd1wuYazp4xz5qMapkl5KRr9G0Pd3aTCEBY=;
 b=lfsJInPYal+1s5IZo7eIvnZn/xIh3Njq1sPuKBezm2zhjt6F8wDzs7T4Zhd5OUq87r
 H1Cu6EXtpohmszZE3lEBeQSRFxLNb+fnbDSbkYqiuB7aKyirsiaii/Z/rmle4S2pHPAF
 kzfFt4xXKyPjDnEUmKUvwWqJb3W5095avNpezuSRzi5LbnhEGM7V0WLW/zpsbPVJYAJ3
 vLBDpypOwsPOxgYeOThYNOZpvs5WDbhN7jAJqTsBhBj1p7XWWTViY+xk2sZ8Xpjke+zR
 NamEsK7puO5OAJvJRo6uZlDhEdR4knMC66SojnyDQVJW/RZvgWX0GERZcmwYMUTgTYp+
 bFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/dtsJ4JDAd1wuYazp4xz5qMapkl5KRr9G0Pd3aTCEBY=;
 b=uGlGRQTfEbQhUcPSjF/zwF4lB1ebBcHVmfQgFWc1KNT+NTRl+vyjuNxX9l4MqeaC77
 gKvONebRhkcrmSmrE9gMZ/vjwWh03QNQ0oAZ2bAy7UbUTmhB/Yfu98+AV8qPewy0FJds
 Qn8TFzNcON2B2VLBpattxLUQty2RqoowJxOoErQDGWEYPtUFu28XZ7VkkDs3mTL43bvG
 YBhRHTGlDBQCwveVyvMSkwweUUHs2jQ2e2myyV9ZJpE2uxlJ/LOBLaEfdqxYZGJ1H76P
 dYZWKsQdhhq6xVBzJyu+v9i1+1EMdUURUFOwBvcxJB3+uCpJFcSJOtBDl9QemCmAdZ0d
 ghaQ==
X-Gm-Message-State: AOAM530cRrMGmIGWGbpT66Pny5C+h5BGXEmxDidka7tinUXALTqIEpZf
 VZtXdWYuAmUWd61NM7pNL90E0kZlcAEwnWzcuUw=
X-Google-Smtp-Source: ABdhPJxWC3Yh/o2AqlkqO/ELmxW4IvlePiT0uc9kzdrKu38r4cCfucVIUoVPaaLE5nBJNzCGCuolAZ3zDGMDpfJuYbw=
X-Received: by 2002:a25:cacc:: with SMTP id a195mr615806ybg.306.1611534806654; 
 Sun, 24 Jan 2021 16:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-10-bmeng.cn@gmail.com>
 <13bab35c-4e0a-e92a-24a5-558f33087061@amsat.org>
In-Reply-To: <13bab35c-4e0a-e92a-24a5-558f33087061@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 25 Jan 2021 08:33:15 +0800
Message-ID: <CAEUhbmWpXRj70MemQ0UT5pEyBsi6GtD6cejrLMOyQEOfG0FSAQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/25] hw/sd: ssi-sd: Fix the wrong command index for
 STOP_TRANSMISSION
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
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
X-List-Received-Date: Mon, 25 Jan 2021 00:33:32 -0000

On Mon, Jan 25, 2021 at 1:33 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 1/23/21 11:40 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This fixes the wrong command index for STOP_TRANSMISSION, the
> > required command to interrupt the multiple block read command,
> > in the old codes. It should be CMD12 (0x4c), not CMD13 (0x4d).
> >
> > Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v2:
> > - Make this fix a separate patch from the CMD18 support
> >
> >  hw/sd/ssi-sd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> > index 5763afeba0..9e2f13374a 100644
> > --- a/hw/sd/ssi-sd.c
> > +++ b/hw/sd/ssi-sd.c
> > @@ -83,7 +83,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, u=
int32_t val)
> >      ssi_sd_state *s =3D SSI_SD(dev);
> >
> >      /* Special case: allow CMD12 (STOP TRANSMISSION) while reading dat=
a.  */
> > -    if (s->mode =3D=3D SSI_SD_DATA_READ && val =3D=3D 0x4d) {
> > +    if (s->mode =3D=3D SSI_SD_DATA_READ && val =3D=3D 0x4c) {
>
> Patch is correct, but I wonder if we couldn't improve using instead:
>
>      if (s->mode =3D=3D SSI_SD_DATA_READ && ((val & 0x3f) =3D=3D 12)) {
>

(val & 0x3f =3D=3D 12) isn't correct because it can catch values equal to
0x7c or 0xfc.

Regards,
Bin

