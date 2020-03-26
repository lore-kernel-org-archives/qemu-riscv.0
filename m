Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHa96-0000X6-G1
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHa93-0000RX-DG
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHa92-0006tO-8d
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:34:33 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHa92-0006sG-2u
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:34:32 -0400
Received: by mail-oi1-x243.google.com with SMTP id l22so6931950oii.12
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HknmFa0YRfLIIhNE8hZfw18tHx3/w1ozQbxIJrAl5oo=;
 b=Omqd3PtI3mQcyJ2xNWeF8z6p7opwItOYl20pCfmWzCAM+LvMi89Vlswey280wQt5WR
 YJX6lazpkF788P6Y6pGPVhGhG/6DoFVW5WpA7ssWLoEg65kNg2B2gbXTUFwgjNssiq7p
 4DLU8B4vqmYHwv4XiL0s28x7s4bAjpYWa+ac0dRv4YXW+p3fzl82VNrtJYQrUcASrhv7
 XOXnAvMcXyou9um4tam7aFT4U24EMudcETK7q3uEPKNHF+zoH+ppVO7KcjsnV2uyAE83
 k+EmbYZOBduKa0OmaIJYq4pwzQg0wJ7RX4RG1XjtoyYIWj7/QeJvAhdvMZdHxDV9ptHm
 D73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HknmFa0YRfLIIhNE8hZfw18tHx3/w1ozQbxIJrAl5oo=;
 b=aRA0NJz6ehZqlUeedfvkzEk9Unaf1wwdx6B/HO55ttUIDJX/hdoKcSiFTW/wJMIUdS
 WQUzCDYHMUoTpFlOoboIoSnWS+eNvoGNYsUxRSZ84CNJFTnnidB4Yp/WR3PAnC6a3gby
 DLzwSHvXyZVhlQKlnN38s0303xuD7bAwLxGW/Uno3OOu9LfBU0hBgzCXeE7nM3wiLnHS
 nOcToMw+s1QFnXlfuflPaOvqkIvyezkzUCYsc7Txhklr0Hnx7s28JvoMFow9NMdzPUBL
 4BwA94I3q+KPNDXiPMZmk9QrY9m8vgBLT7Y9cDKsMzenfKBeUdVHBol85eZXJTV6SbqW
 /bYw==
X-Gm-Message-State: ANhLgQ11aUNRXetAZ4+B2QV6JnZp/PHw41Y8z3bQCHvLpX0rtxSB4FPB
 UrKsEhAR6XRP2ziENeaBACbOO760/KHkLkViMYoPmQ==
X-Google-Smtp-Source: ADFU+vsgRovvewGBXHI8bmJ2ustTblZuXorArefOaFYkd3VI8GTLZIl4nSsn0KASmn+awk7Oz0w7SFU1T83lbPgpTEY=
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr1795744oih.146.1585258471238; 
 Thu, 26 Mar 2020 14:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-3-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:34:19 +0000
Message-ID: <CAFEAcA-9w4GRLv=gFUAkNryhDR+8JNTS-=UAe6oh7eso5Uyhag@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 02/12] hw/arm/bcm2835_peripherals: Add missing
 error-propagation code
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
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Thu, 26 Mar 2020 21:34:34 -0000

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
>  hw/arm/bcm2835_peripherals.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index edcaa4916d..a111e91069 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -133,254 +133,262 @@ static void bcm2835_peripherals_init(Object *obj)
>  static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>  {
>      BCM2835PeripheralState *s =3D BCM2835_PERIPHERALS(dev);
>      Object *obj;
>      MemoryRegion *ram;
>      Error *err =3D NULL;
>      uint64_t ram_size, vcram_size;
>      int n;

Is there a reason this patch has such an enormous amount of
context around the changes it's making ? It looks like it's
quoting the entire function.

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

