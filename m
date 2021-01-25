Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3pxn-00056f-ER
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 19:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3pxf-00056Q-NN; Sun, 24 Jan 2021 19:42:37 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:42126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3pxa-0006PU-80; Sun, 24 Jan 2021 19:42:31 -0500
Received: by mail-yb1-xb31.google.com with SMTP id b11so11695499ybj.9;
 Sun, 24 Jan 2021 16:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=df5gTLSkEr5Oqen7/8WaYA6Josq7OsVj2loqthhVp3E=;
 b=rP73bkFV5r7eaMf6dZrfqjmVGIqvXTYeWNP9axRGdn7GebkMahxt9//XZ0z4qaXzzb
 TZTpadhD5EKnt3+/f6KptdyTdnAqyZQ3XfLTyXx4vxs52Hq6I+WX0n+hnCRRcHmv/ynu
 53ey90KWuvHaCsoSuA7TXk0T+fmXkqWQnM91+DKcNoiaEoMDMFevXD9vI3ThW/76PcLt
 h9GGdwCzNttKlV+zfJRVvhjYYOXQMY7ePVbuIVeJ9ta5TT0ck52yomVAJ9WgeAx2KD+8
 9xawrsYYyGkfNDH79Vnbzq57tL8sj5xijUA1VBPsosgw3/NyDG/Pm+yoLzLlau29SE6W
 wdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=df5gTLSkEr5Oqen7/8WaYA6Josq7OsVj2loqthhVp3E=;
 b=EZp/QGgvSvCbyXtXNgAPHNq73VL6dfdFiCwUkXInBuSkewezfpF2LCcsC3IQYcuspT
 6HEhbFXMst+bSjf6ROaIS2JPRRWuT6cfZjdEBuxwQjs/Eh2h4tYCqAGmTKfSWA3nYOmc
 BeNcmzki+LkUC8cWjJgKvGjJvjSYCq5D7eLpDMv6r8Mrp04T+wCHRLDvMpFYlyoh16dh
 ODp5qdlwWbAubwVQGqdNWzaWxM3aLc9uTuWkFTKMpatqc54uVd/XcIJEKtO8EBJ0sxQX
 THjLT43udFxR5VpuzOBpwDL31HEWRWTmtmnBnTENNIEYKiv13EEuaHEpNAis1o2Kq1BJ
 Q0cQ==
X-Gm-Message-State: AOAM532/37edNYAYMJdoeT3biPYve9z/VkBMe0dRQAmXJ7mClGL9kw4g
 +8TSivE1712WZFfZezhKBbgbaJjz0b3DjWhevso=
X-Google-Smtp-Source: ABdhPJyezDofMPSUQHFC58HQx3niRj7zhe6Ryge+usfFCNx0WXPuOiH57wieix7Kq/rw0i2PpWGLqj3GdltVXNwvaDU=
X-Received: by 2002:a25:2041:: with SMTP id g62mr130397ybg.152.1611535342388; 
 Sun, 24 Jan 2021 16:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-10-bmeng.cn@gmail.com>
 <13bab35c-4e0a-e92a-24a5-558f33087061@amsat.org>
 <CAEUhbmWpXRj70MemQ0UT5pEyBsi6GtD6cejrLMOyQEOfG0FSAQ@mail.gmail.com>
In-Reply-To: <CAEUhbmWpXRj70MemQ0UT5pEyBsi6GtD6cejrLMOyQEOfG0FSAQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 25 Jan 2021 08:42:11 +0800
Message-ID: <CAEUhbmX3qNAwpOQieNrEL0obVQYrYgAzqseDDqhoSkAc7aMjLg@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Jan 2021 00:42:39 -0000

On Mon, Jan 25, 2021 at 8:33 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jan 25, 2021 at 1:33 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > On 1/23/21 11:40 AM, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > This fixes the wrong command index for STOP_TRANSMISSION, the
> > > required command to interrupt the multiple block read command,
> > > in the old codes. It should be CMD12 (0x4c), not CMD13 (0x4d).
> > >
> > > Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > ---
> > >
> > > Changes in v2:
> > > - Make this fix a separate patch from the CMD18 support
> > >
> > >  hw/sd/ssi-sd.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> > > index 5763afeba0..9e2f13374a 100644
> > > --- a/hw/sd/ssi-sd.c
> > > +++ b/hw/sd/ssi-sd.c
> > > @@ -83,7 +83,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev,=
 uint32_t val)
> > >      ssi_sd_state *s =3D SSI_SD(dev);
> > >
> > >      /* Special case: allow CMD12 (STOP TRANSMISSION) while reading d=
ata.  */
> > > -    if (s->mode =3D=3D SSI_SD_DATA_READ && val =3D=3D 0x4d) {
> > > +    if (s->mode =3D=3D SSI_SD_DATA_READ && val =3D=3D 0x4c) {
> >
> > Patch is correct, but I wonder if we couldn't improve using instead:
> >
> >      if (s->mode =3D=3D SSI_SD_DATA_READ && ((val & 0x3f) =3D=3D 12)) {
> >
>
> (val & 0x3f =3D=3D 12) isn't correct because it can catch values equal to
> 0x7c or 0xfc.

Sorry, wrong calculation. It should read:

It can catch values 0x0c, 0x8c, 0xcc.

Regards,
Bin

