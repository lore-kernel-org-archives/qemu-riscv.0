Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9I7J-0003Sg-FC
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 20:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9I7H-0003Pi-Bs; Mon, 08 Feb 2021 20:46:59 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:39925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9I7F-0002W9-Rv; Mon, 08 Feb 2021 20:46:59 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id k4so16607342ybp.6;
 Mon, 08 Feb 2021 17:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NLsIqepY04rV+dsuHWbbADa6wP2jFShrUtwWU5TSczc=;
 b=W0DUh34gMOo8PPG5CShaxeLSQO2s3d0PPMsC3eeoasR5dcSGy/BwSySN6HYH083NnN
 2zqvIU5CBEQBeX0cVes2c7H5/Gj4TUJYhAv4/7O2R8FAwv0Tr7qVTf+XMQonwR9+xo7g
 yR6aYkdTIdwTlFUfHaP9CSN+QafylOSeVs0LhhmzBckOxagYHD8aNWybdoZwWwgBRoIk
 4/fp3pFnFG7yNFZx7KWF+7DyCvwkKnapw/IaXUnder1Fz1HqUrdeOtS9v5B3VIJ3zFXv
 uouxy7Bzr+GwC4ohXdG2mnD+MOpnyACw82rXTYSwypy86oAC2AcuKbom/1G3fmWb4JyL
 qplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NLsIqepY04rV+dsuHWbbADa6wP2jFShrUtwWU5TSczc=;
 b=oxbF/XTNOBA7YQqP1il/3EtnXRVGYbKRNzU2Oy98K4PRKuv6cioy9RJJxLlXuLIrpl
 21hubhGl+yKMit3AqBvNVtzLdL6cJOn7Y+I6fsK0UpfZinmDwaCx8y7ae8KvsP2HBCdn
 EDh7Ieom1UH4hKhcP6fzywt8CmPQ+kn5ls/apysfKlsOKioKsR2s3vyOMOl34FPOWyTe
 TwzdtpDcU5JQ+0qMuq87dRSyeuMq4v+HwmNMoS2iduJLfjKlsMFHQBhSLsDDq3c5romo
 JMnIrSxETemheK77g68El9ZXjXHPAEevY6dIjjruv0H+1i0h8bEcxp3BKdCsmGCSyFY2
 G1DQ==
X-Gm-Message-State: AOAM532Qe1IM5HLdW1Ub/Jviazs2Oy/fEhlOhQm2fJ9zD3BtOUCg4a2u
 gmZlmDSc0aHyiHJen3UP0Pcno4HbdMMk6rQzNhQ=
X-Google-Smtp-Source: ABdhPJxJ71CgfcNrS1MXbb4ZJ03p7S6QVhklJznRHj54EZ6Vb48wCYUbIRqHPfrdZhI/kcwmq1Z+8oEMjMMAY4mprwA=
X-Received: by 2002:a25:7d01:: with SMTP id y1mr30530489ybc.152.1612835216629; 
 Mon, 08 Feb 2021 17:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
 <20210126060007.12904-4-bmeng.cn@gmail.com>
 <64f493fb-25cb-d3c9-11fe-ca61fca75f50@amsat.org>
 <CAKmqyKM4XSQuAvvUYLa+j_je61-e-OHj_AJP1Q54o1V+bPs9og@mail.gmail.com>
In-Reply-To: <CAKmqyKM4XSQuAvvUYLa+j_je61-e-OHj_AJP1Q54o1V+bPs9og@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Feb 2021 09:46:45 +0800
Message-ID: <CAEUhbmXhMCfgLfDiTc1Ajc9LwHdQS9eS2j1E18dNZ=R4CbQE5A@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] hw/ssi: Add SiFive SPI controller support
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 09 Feb 2021 01:46:59 -0000

On Tue, Feb 9, 2021 at 9:44 AM Alistair Francis <alistair23@gmail.com> wrot=
e:
>
> On Mon, Jan 25, 2021 at 11:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >
> > On 1/26/21 7:00 AM, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > This adds the SiFive SPI controller model for the FU540 SoC.
> > > The direct memory-mapped SPI flash mode is unsupported.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > ---
> > >
> > > Changes in v3:
> > > - Simplify flush txfifo logic
> > >
> > > Changes in v2:
> > > - Log guest error when trying to write reserved registers
> > > - Log guest error when trying to access out-of-bounds registers
> > > - log guest error when writing to reserved bits for chip select
> > >   registers and watermark registers
> > > - Log unimplemented warning when trying to write direct-map flash
> > >   interface registers
> > > - Add test tx fifo full logic in sifive_spi_read(), hence remove
> > >   setting the tx fifo full flag in sifive_spi_write().
> > > - Populate register with their default value
> > >
> > >  include/hw/ssi/sifive_spi.h |  47 +++++
> > >  hw/ssi/sifive_spi.c         | 358 ++++++++++++++++++++++++++++++++++=
++
> > >  hw/ssi/Kconfig              |   4 +
> > >  hw/ssi/meson.build          |   1 +
> > >  4 files changed, 410 insertions(+)
> > >  create mode 100644 include/hw/ssi/sifive_spi.h
> > >  create mode 100644 hw/ssi/sifive_spi.c
> >
> > Missing MAINTAINERS entry (if there are no other comments on
> > this series, maybe the maintainer can directly add one).
>
> Yep, I'm adding this section to the RISC-V machines:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d8b0bf966..c347d49bd2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1359,6 +1359,15 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
> F: include/hw/misc/mchp_pfsoc_ioscb.h
> F: include/hw/misc/mchp_pfsoc_sysreg.h
>
> +SiFive Machines
> +M: Alistair Francis <Alistair.Francis@wdc.com>
> +M: Bin Meng <bin.meng@windriver.com>
> +M: Palmer Dabbelt <palmer@dabbelt.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: hw/*/*sifive*.c
> +F: include/hw/*/*sifive*.h
> +
> RX Machines
> -----------
> rx-gdbsim
>
>
> Can I get an Ack from you Bin that you are ok with that?
>

Acked-by: Bin Meng <bin.meng@windriver.com>

> @Palmer Dabbelt let me know if you would prefer something else.
>

Regards,
Bin

