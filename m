Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHD8J-0003c5-SE
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 17:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jHD8H-0003Yp-VF
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 17:00:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jHD8F-00088L-Og
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 17:00:12 -0400
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942]:42788)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jHD8A-00082W-JA; Wed, 25 Mar 2020 17:00:06 -0400
Received: by mail-ua1-x942.google.com with SMTP id m18so1311129uap.9;
 Wed, 25 Mar 2020 14:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MhEUb1T5SzB0U5/6m4YDytBRlOwpm4s/29Ez0LdF7ws=;
 b=MMAgXc05j+qMq1OdnC60taPkx5vAuj3jXVgxdzTOuBRKzdM4JdYZF2TdeRCPTZA7FX
 D5BfW3bsW5ovVsvd2fVuG2zHBzTpJgOWcVYkzJapb5qS8ynWtfqJgMJ3BP6qJ86BTNLm
 5yyMTJgFQXFqguz//ViAXijeiCaiwW2mMJUo6RsswMZa56KJwhk0mjcjc370kPV/Eq5u
 SpL4ZWSYoodQM8UYk10g6salY6EJN+dUHvSE/iyrng9svAnB5HeVfWR0EReLjVBZLtJT
 WGsBCrZ4eqk3KwDZ+t1IeTZM2/Q6txZ620x7qNkbRGbxZqimHbERxDIVB4nlulPvByA3
 lXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MhEUb1T5SzB0U5/6m4YDytBRlOwpm4s/29Ez0LdF7ws=;
 b=K1Ymfyd9FaYLMk3gTVl6T+3Z53C6Ol+7OGmhjRzc4F+hAp6cAD49uSpe4CGlzPAZX2
 k8e0GJn9X1ZwihIVbkeKOGuix7Gv1Yr4vouP58rI0diYgAK+715tsZBs2IN6zUPfBuCf
 sY41wi9bjZjLTnOZTLZ3Zd2KNIdUJaYz9rmXMZxcEE9sL+n5SEAAxEjWmWfYwHf1j3o6
 1Ca3SMtGxQviIn0G8ZqRHeh9nYHjud9ptFslx8L25PTgBSZNZhvFIKD5kBXw7uZeFXcu
 PRK6r636TatYpTZ1Et+AuWz9piWZBsLN1CQ74AvB0NU9RXhYcXb0jXT3cj2fxeQnVjQ6
 7OsQ==
X-Gm-Message-State: ANhLgQ2AAkQa+d+ei0IyX5dAZFAvgZ1q6k3+bu/iaO+xIuiwNx1eYfet
 gTsbbYog5MNDoCSiyBJI011rVGp0NQUAVAA633c=
X-Google-Smtp-Source: ADFU+vuTQvbXTZj20U7hF/huMINTpbhjlpsOTGMp90/fT248kXwiCKcjhK+yMzpa+MPCfULY+pm/NRN69I9jxgxyZUM=
X-Received: by 2002:a9f:2964:: with SMTP id t91mr4004815uat.21.1585170005961; 
 Wed, 25 Mar 2020 14:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-7-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-7-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Mar 2020 13:52:06 -0700
Message-ID: <CAKmqyKNqYcTkxi8S56quu2L19+B73XNEzdFe44D1cNBFvjDPCQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 06/12] hw/dma/xilinx_axidma: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paul Burton <pburton@wavecomp.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, 
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::942
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
X-List-Received-Date: Wed, 25 Mar 2020 21:00:15 -0000

On Wed, Mar 25, 2020 at 12:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
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
roperty_set_link() hw//dma/xilinx_axidma.c:542:4]]
>
> Add the missing error_propagate() after manual review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xilinx_axidma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 018f36991b..6e3406321c 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -521,39 +521,42 @@ static const MemoryRegionOps axidma_ops =3D {
>  static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>  {
>      XilinxAXIDMA *s =3D XILINX_AXI_DMA(dev);
>      XilinxAXIDMAStreamSlave *ds =3D XILINX_AXI_DMA_DATA_STREAM(&s->rx_da=
ta_dev);
>      XilinxAXIDMAStreamSlave *cs =3D XILINX_AXI_DMA_CONTROL_STREAM(
>                                                              &s->rx_contr=
ol_dev);
>      Error *local_err =3D NULL;
>
>      object_property_add_link(OBJECT(ds), "dma", TYPE_XILINX_AXI_DMA,
>                               (Object **)&ds->dma,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG,
>                               &local_err);
>      object_property_add_link(OBJECT(cs), "dma", TYPE_XILINX_AXI_DMA,
>                               (Object **)&cs->dma,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG,
>                               &local_err);
>      if (local_err) {
>          goto xilinx_axidma_realize_fail;
>      }
>      object_property_set_link(OBJECT(ds), OBJECT(s), "dma", &local_err);
> +    if (local_err) {
> +        goto xilinx_axidma_realize_fail;
> +    }
>      object_property_set_link(OBJECT(cs), OBJECT(s), "dma", &local_err);
>      if (local_err) {
>          goto xilinx_axidma_realize_fail;
>      }
>
>      int i;
>
>      for (i =3D 0; i < 2; i++) {
>          struct Stream *st =3D &s->streams[i];
>
>          st->nr =3D i;
>          st->ptimer =3D ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT)=
;
>          ptimer_transaction_begin(st->ptimer);
>          ptimer_set_freq(st->ptimer, s->freqhz);
>          ptimer_transaction_commit(st->ptimer);
>      }
>      return;
> --
> 2.21.1
>
>

