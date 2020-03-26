Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaKY-0004Gr-5K
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaKV-0004Bz-A2
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:46:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaKU-0002Ym-1c
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:46:23 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43229)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaKT-0002XB-Sv
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:46:21 -0400
Received: by mail-ot1-x341.google.com with SMTP id a6so7606043otb.10
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rVZuRcHd0GmuI3bIUNO+YkcCkes9OHEppSpMgTRHnBY=;
 b=sCJH995egRSBc3CgCREQwxEeTRMJ3e0A7kMk1Ocjtro1myFTiqLRSIiV0VDBIVW0Cf
 rqr3luwSCcaabVUJp0Nd2VnAwmm3Bo+3y26s6RETM4BtB9k5IUsh4RhiBmROmrvQGbTk
 KWpx3H8wjxJ/fnrr4wDZ1tBd0h6SdUlQSSnnw77dQaAgVFf/ygJhyxOWaKGxpX0Tgg0j
 oSnhbwZDnyOw7WYP2AxsfGam11rH2TX6hQFhEKz13XBSF0v643xn/IHMFhnHefeKyO65
 ahS4tGg0XGLVKU6J9TTAfrIFIKjC7vy5N+EhvCVwJPbA4bMoOumpfdWlpR4j0owfnhX3
 z2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rVZuRcHd0GmuI3bIUNO+YkcCkes9OHEppSpMgTRHnBY=;
 b=BxVT8W/6It7/H9HRcv5OSOSGhUmJPL0GGbVEpj0RU7eMSEWQyMdBy30+0VRMgr+1+L
 7G6xttMLy9D5mKixbV2abOXVpxY8Iw5w9Z/6+MP429nUNTTUW3JjGE5c/V5/ZQBhhtn8
 nuDM3uhPfnRccS8eaUIiUTN397tRNoIEWqp1QIszikFPbiZwELODg6k1V0/XbZyIlYZE
 7KOdurlkdPEuQUzyflFjvbJAjCB66MOzo4KnDJPh6UvyTf+I5zEgiiMu/K3T9kSbLgyP
 QHXmiyfalfNwLmEM2iYT5PPKE7sQiCUSufoiQ+ZF1izgDmK9Z6KmqEt7k838LmZc8GVi
 XpfQ==
X-Gm-Message-State: ANhLgQ204KDeuiybpAadpv17fItx7lmkIFn6hKDyKhvS6egAp2Haa4/7
 BPNTsCI6oZdDQ7p7UheVSPV+AHWEK09TqKzgFnut8A==
X-Google-Smtp-Source: ADFU+vtsnowzu7TJWuapTCqru0b80QfmWi1zJfj2KLVnmfyKS1vjNS4GUYBAgZtd2s0VDThZWfTEJXgVR5zjiSSwEUY=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr8142040oth.135.1585259180913; 
 Thu, 26 Mar 2020 14:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-7-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-7-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:46:09 +0000
Message-ID: <CAFEAcA8Bb8r-vSWmh97tjnydG9CHS-Kh4qCnU1rAGYF689BEYQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 06/12] hw/dma/xilinx_axidma: Add missing
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
X-List-Received-Date: Thu, 26 Mar 2020 21:46:24 -0000

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
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
roperty_set_link() hw//dma/xilinx_axidma.c:542:4]]
>
> Add the missing error_propagate() after manual review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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

Isn't there also a check on local_err missing here ?

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

thanks
-- PMM

