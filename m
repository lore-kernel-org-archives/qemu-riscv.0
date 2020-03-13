Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCqFy-0002or-6N
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 15:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jCqFv-0002o0-SX
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 15:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jCqFt-0007UD-L9
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 15:46:03 -0400
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:34889)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jCqFr-0007Kp-Cw; Fri, 13 Mar 2020 15:45:59 -0400
Received: by mail-vs1-xe44.google.com with SMTP id m9so7005117vso.2;
 Fri, 13 Mar 2020 12:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZO4PnrTuUVTtq2EjFzz8ZaUx+/viaySWIkdpaUeET6I=;
 b=C/WQE8vp+38vC6GqUaLBXwNFSHBv4kASjk4GODqJrHjq5ns2SZTxLbc30q0pzNno7N
 scotDPBn93nMOVp1I+IePhSq4GSnKqeduKcCYr3oxwcTy4vomJngnZcKce0eP/hRiqLw
 ecmQQrnyFNOV1TAX2/fFnAeqNtKEqDt7AToWGAfUDfVIEb5zD/1mlESpYLRT3dlaRYTK
 no5kZP9zIUn0sdCfuttNOklmvB1K03qBZZbGAJBnnTdvJd9nL9RSH9mnhwOot167dzYI
 BdI/c5uXhUDDWU6aN9b4oL4KbH29tkVKhWudWpk3XW9S3F1TBFem+gF72yB6eVslOQKe
 H29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZO4PnrTuUVTtq2EjFzz8ZaUx+/viaySWIkdpaUeET6I=;
 b=gsJ1DAxppipdDUkLV+QGAWKXa97l1uM/iarDN+XXUiwbhFkR+tZx50V0RCW7/OaWF6
 eTQngRUjlN4rvXbdk2sPWjgtG+07b8mt2KSx+mVczRyqujWwCSYqIKOQSCGTHYjid7Yn
 kCcCPueBGf3M9cFsENyGaBLdJFMZxO8rQXFr+04IEroaxnIjfarQpqx1MSiETU9shHJj
 xBppWnRk3T/BK01cynt1+Uru5pUjdHvRYvyyfGDS+c2jcN6ekEpSS1YdvoctUnuSfabj
 YTVWVBvNM2GQN7BgJurzQ7kn3h24MJaJEl9M6nKbqoikHcXRT4kO+xW8LW2/6znBekPv
 W74g==
X-Gm-Message-State: ANhLgQ1x8c9fPAudDutIVbbd8LscnmfSjo7mEoEnS5pNcgKuX6VFOfAn
 lx14e08SughVBH2TUFWwXosLq0epWalVK6zVTTQ=
X-Google-Smtp-Source: ADFU+vviP32q1fsE+cEj9VjsOLyUAIDfTrT73l7cuSbTHaLIrRUIjbliGdn3ettHl6SVIvDQanhSdM/grYNl4wbXXMM=
X-Received: by 2002:a05:6102:3c2:: with SMTP id
 n2mr10349575vsq.172.1584128758599; 
 Fri, 13 Mar 2020 12:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-4-philmd@redhat.com>
In-Reply-To: <20200313183652.10258-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2020 12:45:32 -0700
Message-ID: <CAKmqyKO+kEGj4-=hb+N3PRLkxBUxRpToGCzx1Mo61jtYV=2h+A@mail.gmail.com>
Subject: Re: [PATCH 03/14] tests/Makefile: Only display TCG-related tests when
 TCG is available
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x <qemu-s390x@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e44
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
X-List-Received-Date: Fri, 13 Mar 2020 19:46:04 -0000

On Fri, Mar 13, 2020 at 11:39 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/Makefile.include | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 67e8fcddda..99db5eb3e0 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -12,8 +12,10 @@ check-help:
>         @echo " $(MAKE) check-speed          Run qobject speed tests"
>         @echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
>         @echo " $(MAKE) check-block          Run block tests"
> +ifeq ($(CONFIG_TCG),y)
>         @echo " $(MAKE) check-tcg            Run TCG tests"
>         @echo " $(MAKE) check-softfloat      Run FPU emulation tests"
> +endif
>         @echo " $(MAKE) check-acceptance     Run all acceptance (function=
al) tests"
>         @echo
>         @echo " $(MAKE) check-report.tap     Generates an aggregated TAP =
test report"
> --
> 2.21.1
>
>

