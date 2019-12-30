Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ilxHu-0007CO-Sr
	for mharc-qemu-riscv@gnu.org; Mon, 30 Dec 2019 10:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1ilxHr-0007Au-Dv
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 10:48:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1ilxHp-0005jh-0j
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 10:48:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39794
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1ilxHo-0005jN-U3
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 10:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577720932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eie/6KGuYr/9B08JptfZ0j1vbtpHyZvG/k91jGibVJI=;
 b=U7SrG0GZRALE9LI+quLHuM/1NPTegvkCuBNBq9M/1U1tpTo038WDe+8J7amnudxQ9E+M8k
 ApJ72Ab05Wkc5dsb54wUxQYqS9q49t8c3H+H3AUBLv+9qvYT1UTrXFZBJpXOwafUs0YR28
 /IoibORBlHh8JZrwX3MmeUcamhv1fw4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-8Obu1WltOjKn2SxgOa6ScQ-1; Mon, 30 Dec 2019 10:48:50 -0500
Received: by mail-wr1-f70.google.com with SMTP id b13so200635wrx.22
 for <qemu-riscv@nongnu.org>; Mon, 30 Dec 2019 07:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eie/6KGuYr/9B08JptfZ0j1vbtpHyZvG/k91jGibVJI=;
 b=LBJtruM3EHAfaZA02Sejuu2fvqlGmCrk9JpXsLtpj1wg0T8MicHcvugvmTI+v1srzs
 NyhaUJhaNyLeLYg11kRoN31DaoyT2FzAO/ETfz3BTGG+BuHwm0PdLpHTSX2Ha42jO+yY
 Um2gE2LK4IAI7aConK2lx739xUcTzZA4ABM5DC2zGWQgCuLtUPNmOCYCTLJXcxOPUvR4
 R5BgiY8WQcQ1kw8pWG3KZKCTwCF738H9KulDwczaSYXpDXxlci0fNSSt/j4QK9dPPvG9
 xa1Hkzlgcx6DcEAh+6hI5nINwojgJGNlUXE5MLJ9GqV1xvYN/feLjfckNxjolOLaRmXo
 GoNg==
X-Gm-Message-State: APjAAAVD0NA6bhTunPORrlIeZ+NdJ48rZ7hK/2i5wEbH3KBj4QkIpjU5
 q5dhWKG6b3BE5WwvDbUKj8Hy+5fvMIcZa5w+Cqs0qaaBZiW+eR8mjMMkGXSPHl6pZFDFUqUucEW
 NQgPdN4SOKy08qjcJlM2mx9UO99Bj2aQ=
X-Received: by 2002:adf:f20b:: with SMTP id p11mr65711255wro.195.1577720929466; 
 Mon, 30 Dec 2019 07:48:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqy3CnY+as7x2kI0Y6CBZEeBLW/sV1Fr9aas6dYnp/Xbl2nb3n59pazc3GXJTotgX7e+xWtVEzEAKTxk0ILTwPE=
X-Received: by 2002:adf:f20b:: with SMTP id p11mr65711205wro.195.1577720929179; 
 Mon, 30 Dec 2019 07:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
 <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
 <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
 <cd2746d2-8f88-2012-def9-dfce47d8e764@redhat.com>
In-Reply-To: <cd2746d2-8f88-2012-def9-dfce47d8e764@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 30 Dec 2019 16:48:38 +0100
Message-ID: <CAP+75-WjOfJeFooQnrhC8y73dCWrfJbHhtYUG3LzZRxpbhTwCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, "open list:sPAPR" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>, 
 Claudio Fontana <claudio.fontana@huawei.com>, 
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>,
 qemu-arm <qemu-arm@nongnu.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Michael Walle <michael@walle.cc>, 
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
X-MC-Unique: 8Obu1WltOjKn2SxgOa6ScQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 30 Dec 2019 15:48:56 -0000

On Mon, Dec 30, 2019 at 3:02 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 12/30/19 11:33 AM, Paolo Bonzini wrote:
> > Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m
> > <mailto:philmd@redhat.com>> ha scritto:
> >
> >      > I'd prefer not changing those files.
> >
> >     OK, I'll wait to see what Richard/Markus prefer.
> >
> >
> > I think it's best if you keep the include directives as-is for files
> > only needed from tcg/, and move the other headers (those that are neede=
d
> > from other directories only) to include/tcg.

Assuming we don't want to add include/tcg/ in the path search list, we
still need to update the tcg/*.c include directives to use "tcg/":

tcg/tcg-op-gvec.c:21:10: fatal error: tcg.h: No such file or directory
   21 | #include "tcg.h"
      |          ^~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/tcg-op-gvec.o] Error 1
make[1]: *** Waiting for unfinished jobs....
  CC      mips64el-softmmu/accel/tcg/translate-all.o
tcg/optimize.c:27:10: fatal error: tcg-op.h: No such file or directory
   27 | #include "tcg-op.h"
      |          ^~~~~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/optimize.o] Error 1
tcg/tcg-op-vec.c:22:10: fatal error: tcg.h: No such file or directory
   22 | #include "tcg.h"
      |          ^~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/tcg-op-vec.o] Error 1
tcg/tcg-common.c:35:10: fatal error: tcg-opc.h: No such file or directory
   35 | #include "tcg-opc.h"
      |          ^~~~~~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/tcg-common.o] Error 1
tcg/tcg-op.c:28:10: fatal error: tcg.h: No such file or directory
   28 | #include "tcg.h"
      |          ^~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/tcg-op.o] Error 1
tcg/tcg.c:51:10: fatal error: tcg-op.h: No such file or directory
   51 | #include "tcg-op.h"
      |          ^~~~~~~~~~
compilation terminated.

> I thought moving headers to include/tcg would diverge too much from
> libtcg, but this project already did it, so why not:
> https://github.com/S2E/libtcg/tree/master/include/tcg


