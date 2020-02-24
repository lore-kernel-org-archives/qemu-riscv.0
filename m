Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6LE7-0005jd-3L
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 16:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6LE3-0005bI-Qx
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:25:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6LE2-0000Cu-0c
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:25:14 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:34709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6LDq-0008VV-Bw; Mon, 24 Feb 2020 16:25:02 -0500
Received: by mail-lf1-x144.google.com with SMTP id l18so7940475lfc.1;
 Mon, 24 Feb 2020 13:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f/ifAF9KuPku19Cn2OwygyTt91U6QCUjnSpXcB6RnSA=;
 b=Plbot5xXUC22k6W/VTeAJm1AvN3NYvMbKqo67/KxfYVWbRkmnwPR3mUJskptCA2KIj
 hI6Ny1bkzn8uiujqqRZwEFMMo5siZWfChYcskfACv78pRbJt8xomgP7l35C42JeCpNVJ
 ebztbymX7FWbV3cbH3Y5bs7U6WpvfoA9rcUu3JvuAuBwo4/V/DEewzRBY5uEIvjw/Rg4
 NU30G1iMSh7d+HcrHyYa5ubYUbu5K0WYvg2YQjWClpSFja6YxzBYgxoUCVo05yQWv5LL
 aNHHXy1lNIKhSnStsTw/aeA9Tr3lZ7YUk4A0TlC5dzQ2Hnp3+t2BsIcIrjXflHDNVTcI
 7HEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f/ifAF9KuPku19Cn2OwygyTt91U6QCUjnSpXcB6RnSA=;
 b=So54aTbND/mXb/mA75FbO0NnmYOTohu/ZaJvXpeZEQW0qMdDTSBIyVAYhn/4tNklB9
 x3dh6kZs9I7ddFvDf9mCsZ9ld7dRO0JD/GYySoHvSBLw1muQhnNCh0Hz/qYrwnCf+/XC
 wf+1e2pvD6SaPRJkNZMoDpCt1Ej+IPRH9mfjlPjbQcRvbAmgBa87bhI/HZK004nAge2w
 oUt23vZIFkHit4RKOZFP2+V6cRuNE74fzg+2GdKGh0nPBHjvzotEuc2VgplHxPiamZ+P
 rHe0S6WVnqLQL+wAVmvs2H1sNMn6AcHmzBbuPtCJmibByZvGnA8bo3zxZW/cdf5ilhPU
 vvww==
X-Gm-Message-State: APjAAAXElYXx9EQsrDEidvjPPK87Mhvi7BLugRZRTIiJ9m60UYJ4AaPv
 jq7NZPWrPbBm1Jgcy2Lua5gcresSRKb/tYNZAeI=
X-Google-Smtp-Source: APXvYqySC87RZ6THrzxQfoiedyAF8Jsw569kdlkpa6OHERHWsgTO6woeWJbTVOAp4d3gl43rg7hmb7kO6pXMlKg12Wo=
X-Received: by 2002:a19:8585:: with SMTP id h127mr7476613lfd.196.1582579499762; 
 Mon, 24 Feb 2020 13:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20200224205533.23798-1-philmd@redhat.com>
 <20200224205533.23798-3-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 13:17:22 -0800
Message-ID: <CAKmqyKPYOtVjK0z6JWzDv+HK6oNg0BS2RLSHWzVHreiLAFQrbQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/32] memory: Simplify
 memory_region_init_rom_nomigrate() to ease review
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>, 
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, 
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>, 
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
X-List-Received-Date: Mon, 24 Feb 2020 21:25:17 -0000

On Mon, Feb 24, 2020 at 1:10 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> memory_region_init_rom_nomigrate() has the same content than
> memory_region_init_ram_shared_nomigrate(), with setting the
> readonly mode. The code is easier to review as creating a
> readonly ram/shared/nomigrate region.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  memory.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/memory.c b/memory.c
> index ce1179874e..6a327a54ed 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1659,19 +1659,8 @@ void memory_region_init_rom_nomigrate(MemoryRegion=
 *mr,
>                                        uint64_t size,
>                                        Error **errp)
>  {
> -    Error *err =3D NULL;
> -    memory_region_init(mr, owner, name, size);
> -    mr->ram =3D true;
> +    memory_region_init_ram_shared_nomigrate(mr, owner, name, size, false=
, errp);
>      mr->readonly =3D true;
> -    mr->terminates =3D true;
> -    mr->destructor =3D memory_region_destructor_ram;
> -    mr->ram_block =3D qemu_ram_alloc(size, false, mr, &err);
> -    mr->dirty_log_mask =3D tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
> -    if (err) {
> -        mr->size =3D int128_zero();
> -        object_unparent(OBJECT(mr));
> -        error_propagate(errp, err);
> -    }
>  }
>
>  void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
> --
> 2.21.1
>
>

