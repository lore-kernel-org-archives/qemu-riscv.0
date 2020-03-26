Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaIF-0001uC-Dn
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaID-0001tn-7F
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:44:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaIC-0008F2-09
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:44:00 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44578)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaIB-0008DI-Pa
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:43:59 -0400
Received: by mail-oi1-x241.google.com with SMTP id v134so6964392oie.11
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xvQuM1t+AMalZIyQmGqvVV5WcXOTpPBqjnsxou10UMI=;
 b=cIfWr7+79kzguSu2V3Sa46UNOBIRSKKuTOhRBj75G5/ncXWZgLWn6rHFUcm58jBz4n
 1NgfoyHMCGsDexQfb4jItOz9nsObsYWhblDWparPVYqQKl7OW40U+KOKc1yqrDzf+hJ2
 U5tPvoCplXbW9n3qzpsn85YX8FM8cRmU3oTG/f5YI84XeUlq1MEJBUw5cAm92XMi5P4T
 FhNnoRWoYb1Ymu8x+uqT2FK0zBNkGv5kvME1PDCjRIsxoYtmPc+cT1lntrSTcjAMOkK+
 yuIyku7CJnusz9cm9VAO480Nr/G+M5MHIyzvIrmFJ//PQl0AtwWEKPXKeUAXB+8I3VvM
 tfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xvQuM1t+AMalZIyQmGqvVV5WcXOTpPBqjnsxou10UMI=;
 b=frJD3bacu//Q9iSwBgTE0YXaSPrp6KG5VblGGQcI35teYyS7A/B629MzXJ/84T3oYI
 igkNu9R55Xv4gfbb57E4OXljZy1R9ggVradb3lgpOjOpiTtRQ9LDrsU0uRC4bK00CCxH
 Y2DiBSClxu+8JwYetJIHXkMA+cmBX5Nwf5nxeBMYYd605ly8MRSWGuZszAeVjuOwIhoI
 z66HODB0OxWCTSXlbgr3PwJSyaDietsuXzHKt5BmWz9OLZ99hWQAiqiI5RTZhOJ4UtmH
 E7/nVyyhW2LW75Cr44tkQrcvBXac68B8i/572dVnIBRYg1x/srMSgmL0MvhZ8xAYD8AE
 2wiw==
X-Gm-Message-State: ANhLgQ3qTetfdRJQMppwl3lpMZF/zFNmXxROOuLm257reCaxevathkCF
 qIDadeiAM/ODSE0tqGqLKc+lgftzTJpokP9Qvz8qiQ==
X-Google-Smtp-Source: ADFU+vvC6zBAgiyeYk9FkMwdMbaDEAxouIAgJE1HYNnwchfSRgte/24c0UTVvCmGcnafcpmvKf5O1XPda63WUNjX0GE=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr1766287oij.48.1585259038796; 
 Thu, 26 Mar 2020 14:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-8-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:43:47 +0000
Message-ID: <CAFEAcA8X5_9G8i31A17DxZDagyHoVYQ7Ctsf5n_9weHqGM6ksA@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 07/12] hw/mips/cps: Add missing error-propagation
 code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm <qemu-arm@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-List-Received-Date: Thu, 26 Mar 2020 21:44:02 -0000

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/cps.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>

>      /* Inter-Thread Communication Unit */
>      if (itu_present) {
>          sysbus_init_child_obj(OBJECT(dev), "itu", &s->itu, sizeof(s->itu=
),
>                                TYPE_MIPS_ITU);
>          object_property_set_int(OBJECT(&s->itu), 16, "num-fifo", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_int(OBJECT(&s->itu), 16, "num-semaphores", &=
err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(OBJECT(&s->itu), saar_present, "saar-pr=
esent",
>                                   &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          if (saar_present) {
>              s->itu.saar =3D &env->CP0_SAAR;
>          }
>          object_property_set_bool(OBJECT(&s->itu), true, "realized", &err=
);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }

I think Coccinelle has been fooled here by the slightly non-idiomatic
use of "err !=3D NULL" in the guard and has inserted a duplicate
check...

>          memory_region_add_subregion(&s->container, 0,
>                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->itu=
), 0));
>      }
>
>      /* Cluster Power Controller */
>      sysbus_init_child_obj(OBJECT(dev), "cpc", &s->cpc, sizeof(s->cpc),
>                            TYPE_MIPS_CPC);
>      object_property_set_int(OBJECT(&s->cpc), s->num_vp, "num-vp", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_int(OBJECT(&s->cpc), 1, "vp-start-running", &err=
);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->cpc), true, "realized", &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }

...but oddly it gets it right here and in a couple of other cases
in this patch.

thanks
-- PMM

