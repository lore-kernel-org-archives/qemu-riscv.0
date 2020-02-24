Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6LBf-0001N2-Ip
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 16:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6LBd-0001Gv-9t
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:22:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6LBc-0007sG-Au
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:22:45 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:37710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6LBU-0007oV-6a; Mon, 24 Feb 2020 16:22:36 -0500
Received: by mail-lj1-x241.google.com with SMTP id q23so11753755ljm.4;
 Mon, 24 Feb 2020 13:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k9AuazKj5Lyr5/IGPo5NEYoU+N88UD1nQwcmMZGXpLQ=;
 b=ZxCKUK7mnNGWgcJdPCeCbRtDmY9Dqt9OpWufgqFslAsrLrrDx3xstVR+u78xUltfOJ
 OfXkk9Qss65ugChez7fi/j3iGAJxbADwTxW4Oi+cu6E4Xc12ihzBTN68gAUewnyax+oP
 W3kQheUDSt16cswmGdviQ0+GTM6HA1JH9eRb68e3SFzOl4ykQMhxhqHWSVDGWUBR/S09
 6FBg4P3/T/n0u0IE3Qdx1Q0WOU0Auklfwh9ltRnGihf1afahO96Tmf/6ovA4TuaYovvC
 goykd1Cx4mBz4cF98WdfjdEDeZl3dCvXzF73ZZDyvNs9WAapSxzYnNJ0nrQMBJzxmhKy
 M2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k9AuazKj5Lyr5/IGPo5NEYoU+N88UD1nQwcmMZGXpLQ=;
 b=Vb6/F6Fw46vczp+CAfWUl86D41+qQRKgRILjD64vPWbSJd/yrbKrrpvPv2xeNZ6ZHJ
 k4DOIYjnciw80jOOfeM6hVeTY3pqnBV0nX88dQNYRxNXGLITHqtS6LZ8DFfxKOlvMYWI
 ajP0baiw8pkpwjgYtMPpevHMJc16sVvmuuAsHEGJBmxyApKOCfe476Uoy5IZ3CwbfFd0
 iCY3y8YRH3CoRaYVPAp3h+37Z/VKeNroCyhwXZFEEKYqw/jER6HQjEXMWmTxDV29jz0N
 a2+Nm6twWXnqPCvgxJ5qDdODSjOlFrJG8/tTV/JMKOUowyZ/NoKJaBuYmllimHwdC/vT
 jvvg==
X-Gm-Message-State: APjAAAW/kkCCpH5m6bdyEbSO76ed27ydY+ZwTYtWlge1F0bGz12AIT9y
 60d5mEABn6KqI9yky8WqFYqIBr0r65iX1l9asg8=
X-Google-Smtp-Source: APXvYqw6NrRbRxTQ9KCys73FK8/6DZ9vhE0vqvhMHTI2T0jK2LoRuJRO1uSjr6avIlPXQVYIcOmiOUYnvqYnq0gNR2g=
X-Received: by 2002:a2e:7818:: with SMTP id t24mr30769610ljc.195.1582579354670; 
 Mon, 24 Feb 2020 13:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20200224204828.23167-1-philmd@redhat.com>
 <20200224204828.23167-2-philmd@redhat.com>
In-Reply-To: <20200224204828.23167-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 13:14:59 -0800
Message-ID: <CAKmqyKMMgSmpuEdGcu1sXrinMMiQCqYz0OcatTALYJ3WVRO=Mw@mail.gmail.com>
Subject: Re: [PATCH v2 01/32] memory: Correctly return alias region type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Joel Stanley <joel@jms.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Mon, 24 Feb 2020 21:22:46 -0000

On Mon, Feb 24, 2020 at 12:49 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Since memory region aliases are neither rom nor ram, they are
> described as i/o, which is often incorrect. Return instead the
> type of the original region we are aliasing.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: qemu-trivial@nongnu.org
>
>  memory.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/memory.c b/memory.c
> index aeaa8dcc9e..ce1179874e 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -2818,6 +2818,9 @@ void address_space_destroy(AddressSpace *as)
>
>  static const char *memory_region_type(MemoryRegion *mr)
>  {
> +    if (mr->alias) {
> +        return memory_region_type(mr->alias);
> +    }
>      if (memory_region_is_ram_device(mr)) {
>          return "ramd";
>      } else if (memory_region_is_romd(mr)) {
> --
> 2.21.1
>
>

