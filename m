Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaPe-0001Hx-Qy
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaPY-0001DS-Jg
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaPX-00021D-Ef
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:51:36 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaPX-00020f-9u
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:51:35 -0400
Received: by mail-oi1-x244.google.com with SMTP id d3so2437922oic.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8BMXqbjT3kX//KtodTDd18z0mS/t6iRmsiJbA2ZZ/PQ=;
 b=rQJCkE0qjJlZR0HC6ppwJYHbUAheHiJkesuE9U/Cf37JdnC46ZbJwz6fWf/Ph2uXEW
 JbmZPfGM3AeUKgvazyihtc5hsltwtAdkr8YxkudpVInrZMGK+4jPJyCgPiIig0LzsV6M
 IXJYA2WkYdKzc7PxuMH37zrtzgqAD1ldbZVGi8EoYbe2eL9/5yVmyJDheqhFuMHA37Ro
 zSY9Rqq3dtnErHRW5w14eTusrjE2OqsPIP9bx2Lx4PB98n8mFUBHP4kSzeQWvaauHDbd
 U+b2mQ3+zeiRYnQTKCf53Ga151u/TxNrlgIiJqIXsc4REBb+agKiN7GN48MaYziZwkus
 k7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8BMXqbjT3kX//KtodTDd18z0mS/t6iRmsiJbA2ZZ/PQ=;
 b=saGYLGMNB1NE4WhZQZxCcgllq9NPbWLU8oe1ag2zP5DV3ZJ1T0Z0EyHuEkd/WgAfCz
 HXXtIap1Box1Cox2A+wTqSxQmMPUJsC/zIlCbyg31hEXPJST0g5oXzatT32nANw112jQ
 dRWDDbVjEbVHmkXuzBsV2n2Nte7QlbGzJJ2d6eD+ldOP3QLeBWCEWgJjwjX2w63k+5Qv
 RLqiE6mS82pkXQC/UEg0yhV2zGHFmj3Iqy3PhFACH80vhzyRM0xxki64jBFdka6Cbqt6
 2WQhhA/SuRkmUE1qic3gItHuRAxMB3ZMMRy4W7vIMrjtDt0gJuGuhgJr5ek2iSnESnf6
 TLkg==
X-Gm-Message-State: ANhLgQ1yU6Goo5ADGC9bTUKCNqXriOHPAR+dgV3uTP5iIcygCviRFeNb
 DOCeAce17a8r8p9oecIFcX/a+ETY/NZG8oHIg4LXbQ==
X-Google-Smtp-Source: ADFU+vsfXtyhEgC13An493SR00v2heVfee/q0q5OV+9BLDG877ISClA2BQhtsoYt2Oh8Fz6drxbwuzFzOYvM9WS3uyI=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr1784335oij.48.1585259494308; 
 Thu, 26 Mar 2020 14:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-12-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-12-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:51:23 +0000
Message-ID: <CAFEAcA-68xvoVRjS8xBrGUsa7AqXRACC0NYK4uE9oy3zgX5-vQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 11/12] hw/net/xilinx_axienet: Add missing
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
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Thu, 26 Mar 2020 21:51:37 -0000

On Wed, 25 Mar 2020 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Running the coccinelle script produced:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --dir hw
>
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_link() hw/net/xilinx_axienet.c:969:4]]
>
> Add the missing error_propagate() after manual review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/net/xilinx_axienet.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 704788811a..f11510a71e 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -948,39 +948,42 @@ static NetClientInfo net_xilinx_enet_info =3D {
>  static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>  {
>      XilinxAXIEnet *s =3D XILINX_AXI_ENET(dev);
>      XilinxAXIEnetStreamSlave *ds =3D XILINX_AXI_ENET_DATA_STREAM(&s->rx_=
data_dev);
>      XilinxAXIEnetStreamSlave *cs =3D XILINX_AXI_ENET_CONTROL_STREAM(
>                                                              &s->rx_contr=
ol_dev);
>      Error *local_err =3D NULL;
>
>      object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
>                               (Object **) &ds->enet,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG,
>                               &local_err);

Again, Coccinelle seems to have not spotted the missing error check here...

>      object_property_add_link(OBJECT(cs), "enet", "xlnx.axi-ethernet",
>                               (Object **) &cs->enet,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG,
>                               &local_err);
>      if (local_err) {
>          goto xilinx_enet_realize_fail;
>      }
>      object_property_set_link(OBJECT(ds), OBJECT(s), "enet", &local_err);
> +    if (local_err) {
> +        goto xilinx_enet_realize_fail;
> +    }
>      object_property_set_link(OBJECT(cs), OBJECT(s), "enet", &local_err);
>      if (local_err) {
>          goto xilinx_enet_realize_fail;
>      }

thanks
-- PMM

