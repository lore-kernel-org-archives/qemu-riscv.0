Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iMYIP-0000RI-8b
	for mharc-qemu-riscv@gnu.org; Mon, 21 Oct 2019 10:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMYIL-0000MM-Pl
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2019 10:04:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMYIK-0001UA-As
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2019 10:04:25 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34978)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMYIK-0001TV-4X
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2019 10:04:24 -0400
Received: by mail-ot1-x341.google.com with SMTP id z6so11090587otb.2
 for <qemu-riscv@nongnu.org>; Mon, 21 Oct 2019 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qqxI4t9USoPXl/JeHuyCe4X2D/XmhhmC7h27Axw+udQ=;
 b=o23sY8aJNwQHkKw0xxxs+ejPMiYWNoiKAiNdVrvd+aNE0cw1SVjrEncfNwtbM0yQ2s
 2L78NOBuOrgoqBdzvgjiHtetQU6YBH0eXDA1VJVVktzgG9lHv2Q7Cb44boNbrKg8ZBq/
 4fDJyMgfmKeZO0GyUq8hjXe3D74w5QLxsTCFWkpl0+jNFzp/L+AqFTfAK19UmeHpt3ez
 ylRKIPHiMOX1Zqi2qjbb7TyrmON+9UHWhcH4UKSiqQa/W/K4rf/ibMa3hQKLrj8LfO5P
 Ja7xWg4yMeuJc2cLeo+nQcAQFEVrYL9EoYpXjsrpIN5zKB5rPAScXLGz3/4GTaO8K8kH
 O57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qqxI4t9USoPXl/JeHuyCe4X2D/XmhhmC7h27Axw+udQ=;
 b=dFNRLIMzLxaLeKUmcDzd/1uq9nWQHtNGzQDum8KaFVmFMuNaJEU7aup7GVNb+sba5y
 LXAK1xqeV9TRvKc0WE5ZTKUVZeT8hSmU9IBJRtSIsxZ51Xb+o6dk68QM104M02vXB+Eh
 Gla7nNIv8OH4+ue1wyA+M3DJX32wIZoPQWQrZVdmQNBTA70ag16QRerFMDTMqlHHLoR+
 TuaGWbfFnMeFuNqAY+UVhVn58ptQ9t4TUOgjsoQN4e9BsUE+Ufn55K3pAevsAnhVKhEh
 vpQOZrgYoCr6P/R2gYstGICSTdZEjISNI+eOwcVpT4TaMGcV5Ag3htPZB/RnIo1gh+kc
 um2w==
X-Gm-Message-State: APjAAAWILhsK+qM2Bs0VmpIlBfoet0z4WxW6hSQZji9oPTYzwrtZlhT+
 aYHqzumm6EjS9sRuJeM1W4vAsJnASsLEfYT3CaxibA==
X-Google-Smtp-Source: APXvYqyNOCrySGod8QA3BC5EBBZqk9MeXy2YqV0GnibpdtzqRWbeStOOOVeQ9r/mLSqJJyRqgi4C/DnC+TWWQH3ENdU=
X-Received: by 2002:a9d:398a:: with SMTP id y10mr17897600otb.97.1571666662819; 
 Mon, 21 Oct 2019 07:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-3-alex.bennee@linaro.org>
 <5be164f7-6a8a-07b8-8d16-18300638f9b5@vivier.eu>
In-Reply-To: <5be164f7-6a8a-07b8-8d16-18300638f9b5@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 15:04:11 +0100
Message-ID: <CAFEAcA9oCNT9t_WT8uMzit12J7=vDt4+W6UTqAbZZd3J8UytGg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 2/4] elf: move elf.h to elf/elf.h and
 split out types
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Chris Wulff <crwulff@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>, 
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>, 
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Marek Vasut <marex@denx.de>, Jia Liu <proljc@gmail.com>, 
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>, 
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, 
 Fabien Chouteau <chouteau@adacore.com>,
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Cornelia Huck <cohuck@redhat.com>, Michael Walle <michael@walle.cc>, 
 "open list:PReP" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
X-List-Received-Date: Mon, 21 Oct 2019 14:04:27 -0000

On Mon, 21 Oct 2019 at 14:54, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 10/09/2019 =C3=A0 21:34, Alex Benn=C3=A9e a =C3=A9crit :
> > Most of the users of elf.h just want the standard Elf definitions. The
> > couple that want more than that want an expansion based on ELF_CLASS
> > which can be used for size agnostic code. The later is moved into
> > elf/elf-types.inc.h to make it clearer what it is for. While doing
> > that I also removed the whitespace damage.
> >

> The patch looks good, but why did you call the file "elf-types.inc.h"
> and not "elf-types.h"?

This is our usual convention for files (well, that or .inc.c)
which get included multiple times with different preprocessor
defines to specify how they behave, i.e. which aren't standard
"simple header with multiple-inclusion protection guards".

thanks
-- PMM

