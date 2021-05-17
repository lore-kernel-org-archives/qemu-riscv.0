Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liTPD-0004OU-8R
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 22:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liTP7-0004NK-LM; Sun, 16 May 2021 22:54:51 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liTP2-00033E-RU; Sun, 16 May 2021 22:54:49 -0400
Received: by mail-yb1-xb32.google.com with SMTP id m9so6598961ybm.3;
 Sun, 16 May 2021 19:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GMhgl/R2eCDhQNjEi2rHWPn0aE/8xd3gRFWeW62YlM0=;
 b=lRQV5ceC6fwDTZ+iuerEaWhNz5r3EhsWtNX8Xtv0RquNpdxS7md/DTleF3sPhDyqLO
 srLElIosnAEBKYrgVV5qA3fB7THdB6xLh0452xXAWDzTtsj/Q/bcEF/Me5dEK0wyfsRz
 zMBaeYcCdUWKbWUMmLkvOLmvjXE6ohBSVe8yaGNzzaaccrFj5TG4VUCsDF4FY3iScjCv
 F0a3WRTjJiHrC6iBauMTxlOFjF4EZdvctynI6G2m7CAPKFc90ym4uxDipUe1Ku9AXfZO
 t7vcS/M2UNcjg44eP439kwrcivBW3/2veWVTMYBRqB7nSKmlABt+Wv8O5+mXxlXYOYZ0
 b71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GMhgl/R2eCDhQNjEi2rHWPn0aE/8xd3gRFWeW62YlM0=;
 b=DCY/rky14/JYFTWKxzRft75alMJt71Z/I5dWareeG/miZf6JQmyF4ITaXU1iOnKrXN
 Mjm907iwE+ATrnDqlX428JVJI4r6uLx0WK/NLXHSZtSw2+gRTePjq9EDaV8H4EmCDOAu
 nykK1qEWVQEu3HxtFQVj5axCZeRCzX3ciY0RBAbopx/NaWVzXr1ZXzUOPHVbW+IPABgT
 FHvZ9OmA9w1k+eFOPXYl3AG58foqSOMHVuIaz9zGIjRXGrf/7+oQ/Mei89UE7sf2PTNQ
 ipLkZvrBEYznJWlOIIIXAzJnI4nvJpBtwiCcRF4DTt5yz/+hzLZeNAPZgoPRQB6KwVBj
 xwdA==
X-Gm-Message-State: AOAM530EzAFOAl7pOPA5fvdei+F6zzRlx0v7JkufBHVGQH3cs+hbMRPY
 T9/lOe0EabsJFTppaYIvPh1KUnl/mzMiG5mnC6k=
X-Google-Smtp-Source: ABdhPJyR4eGQ2C9TVsB/NIC1S1nlI3UvqsDSWhJBRCyOQaeeWu/yEsdmcCcu5qDMueS5P/IfYqV93FV+4xtm1F88MiI=
X-Received: by 2002:a25:afcb:: with SMTP id d11mr13803572ybj.306.1621220082364; 
 Sun, 16 May 2021 19:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-13-philmd@redhat.com>
 <e164f246-80a6-d65b-3dc-8b9cb16d0e8@eik.bme.hu>
In-Reply-To: <e164f246-80a6-d65b-3dc-8b9cb16d0e8@eik.bme.hu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 10:54:31 +0800
Message-ID: <CAEUhbmWpV=TycM8ndRZA3WMMeokcTdeW8tJ6FiCo4WKKPAk2BQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] hw/ppc/Kconfig: Add dependency PEGASOS2 ->
 ATI_VGA
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
X-List-Received-Date: Mon, 17 May 2021 02:54:51 -0000

On Sun, May 16, 2021 at 3:41 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 15 May 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> > From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> > While the ATI VGA device isn't a requisite (no crash without it):
> >
> >  $ qemu-system-ppc -M pegasos2
> >  qemu-system-ppc: standard VGA not available
> >
> > it is useful to have it with the Pegasos2 machine:
> >
> >  $ qemu-system-ppc -M pegasos2 -vga none -bios pegasos2.rom -device ati=
-vga,romfile=3D
> >  qemu-system-ppc: -device ati-vga,romfile=3D: 'ati-vga' is not a valid =
device model name
> >
> > Add it as an implicit Kconfig dependency.
> >
> > Fixes: ba7e5ac18e7 ("hw/ppc: Add emulation of Genesi/bPlan Pegasos II")
>
> You can list it as a fix but I regard this more an enhancement or
> amandment to that commit as it was not broken in this regard as the commi=
t
> message above also explains. To me Fixes tag means more that something wa=
s

Agree. This patch is more like a feature, instead of a fix. So the
"Fixes" tag isn't appropriate.

> broken in that commit that this one patches up but I don't care much abou=
t
> this tag. It would probably make more sense in your other commits fixing
> missing dependencies (although not clear which commit those fix as the
> missing dependencies were probably also missing before the latest clean
> ups).
>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

FWIW:

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

