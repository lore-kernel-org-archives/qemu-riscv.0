Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oT3WA-00043Z-T6
	for mharc-qemu-riscv@gnu.org; Tue, 30 Aug 2022 11:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oT3W8-000410-V1; Tue, 30 Aug 2022 11:51:09 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oT3W1-0005Z2-CC; Tue, 30 Aug 2022 11:51:08 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y29so7684256pfq.0;
 Tue, 30 Aug 2022 08:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=xe5d1mSk0lqNreQ0cpgaPtMY0JUytZvbiYEPDSHq6LM=;
 b=eUhg4ZBliQgFrD+OJWIqv/ThyAObeQWtZX5t9nhn/jUpdxat4dICjVmNSEwOC9EEdr
 /AhaEEAifFo/hW2rsr6H49sZxP+W0fWT81oJtGA1XSkungPQyauwDHt3SsQzUu1BPkQ7
 5tpSPCydUQmFNGn3JJ/ZHWBO50CIG8xkCA5exigJw0ZDzoIzHSLf7D10hsBs/gXbgfu7
 fvxdycfgMAwZOBX9m8W60C92ul7m45SMhc3/5xlNCP8TOxj32jTCTzqaSzTn7FAb25eV
 4y/DfyKU1UfFyvtnxh7GsR3dqvGxgqL0kbJ+FYV6QWp0eB2QF8eA5yFVBlN/LrJLUM6G
 9ozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=xe5d1mSk0lqNreQ0cpgaPtMY0JUytZvbiYEPDSHq6LM=;
 b=vlNI/9kv79g+ndBCIn9gHL8d+T0B9+nL9Dn2Ob4Yd8/EK43wug1iR6hF554F4jrbqw
 c3NQsyrPeHPzeMPhBSMYgBijZm4sRjfkZL2/G71z8pxb29vz9xGVXIvpMZDTg3B6F314
 jbC2lbgJT2QQMjvb5W9OKmuEnjAW5NJO38rN/4fEuLu89FncCuKUyy4FkirCgUQnXDP9
 Nrt4RcpSPqx4GSQaV9I0mvEgYD3aMePnQgpqdwpNXwFk/fJayM1FGgR0rSLwR709ugcI
 cYSHyhUIsy7CYxtyIe56gc+9B6qKpTQShl6n2tSI6Kp4lhGCzXGSNDZJg51WmvEk7oGQ
 WUpg==
X-Gm-Message-State: ACgBeo2zjml6IrZxUpsRoY1GPqZFSM6MiaeQBHsUmSxiXls8gsSWd5d/
 rHzcaCIMwfbC3TqbGILJ9Q8nqRZPQ1cwrzv40Yg=
X-Google-Smtp-Source: AA6agR7mBSVFBEMZZ6+84+8vyWZkhaUlLYm5NWBfq4gxmzPnPWjD7F+WjYX4YSf+7rh2BGmVLtVu/igZ4osEGShg9FA=
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df8 with SMTP id
 z2-20020a056a00240200b0052c81cf8df8mr22309751pfh.60.1661874658210; Tue, 30
 Aug 2022 08:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
 <20220823061201.132342-4-wilfred.mallawa@opensource.wdc.com>
 <c33257a3-645f-9386-52e5-21a15ef0ebe5@amsat.org>
In-Reply-To: <c33257a3-645f-9386-52e5-21a15ef0ebe5@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Aug 2022 17:50:31 +0200
Message-ID: <CAKmqyKMGZrRfMvtAHb9V+C8UU40wEKj9qefvP-ahiOGsFVZATA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] hw/ssi: ibex_spi: fixup/add rw1c functionality
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2022 15:51:09 -0000

On Tue, Aug 30, 2022 at 2:37 PM Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> On 23/8/22 08:12, Wilfred Mallawa wrote:
> > From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> >
> > This patch adds the `rw1c` functionality to the respective
> > registers. The status fields are cleared when the respective
> > field is set.
> >
> > Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   hw/ssi/ibex_spi_host.c         | 34 ++++++++++++++++++++++++++++++++-=
-
> >   include/hw/ssi/ibex_spi_host.h |  4 ++--
> >   2 files changed, 34 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> > index d52b193a1a..40d401ad47 100644
> > --- a/hw/ssi/ibex_spi_host.c
> > +++ b/hw/ssi/ibex_spi_host.c
> > @@ -352,7 +352,17 @@ static void ibex_spi_host_write(void *opaque, hwad=
dr addr,
> >
> >       switch (addr) {
> >       /* Skipping any R/O registers */
> > -    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
> > +    case IBEX_SPI_HOST_INTR_STATE:
> > +        /* rw1c status register */
> > +        if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
> > +            data =3D FIELD_DP32(data, INTR_STATE, ERROR, 0);
> > +        }
> > +        if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
> > +            data =3D FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
> > +        }
> > +        s->regs[addr] =3D data;
> > +        break;
> > +    case IBEX_SPI_HOST_INTR_ENABLE:
> >           s->regs[addr] =3D val32;
> >           break;
> >       case IBEX_SPI_HOST_INTR_TEST:
> > @@ -495,7 +505,27 @@ static void ibex_spi_host_write(void *opaque, hwad=
dr addr,
> >        *  When an error occurs, the corresponding bit must be cleared
> >        *  here before issuing any further commands
> >        */
> > -        s->regs[addr] =3D val32;
> > +        status =3D s->regs[addr];
> > +        /* rw1c status register */
> > +        if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
> > +            status =3D FIELD_DP32(status, ERROR_STATUS, CMDBUSY, 0);
> > +        }
> > +        if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
> > +            status =3D FIELD_DP32(status, ERROR_STATUS, OVERFLOW, 0);
> > +        }
> > +        if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
> > +            status =3D FIELD_DP32(status, ERROR_STATUS, UNDERFLOW, 0);
> > +        }
> > +        if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
> > +            status =3D FIELD_DP32(status, ERROR_STATUS, CMDINVAL, 0);
> > +        }
> > +        if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
> > +            status =3D FIELD_DP32(status, ERROR_STATUS, CSIDINVAL, 0);
> > +        }
> > +        if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
> > +            status =3D FIELD_DP32(status, ERROR_STATUS, ACCESSINVAL, 0=
);
> > +        }
>
> Alistair, does this call to add some FIELD_1CLEAR() API?

Yeah, that's probably something useful to add! Good idea

Alistair

>

