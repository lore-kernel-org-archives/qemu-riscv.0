Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9I5G-0002GE-Op
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 20:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9I5F-0002G3-BY; Mon, 08 Feb 2021 20:44:53 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:42248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9I5D-0001Zi-OZ; Mon, 08 Feb 2021 20:44:53 -0500
Received: by mail-io1-xd2e.google.com with SMTP id u20so17145735iot.9;
 Mon, 08 Feb 2021 17:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3qErRPP0ilxDOH7pAbvP7YMgsl2eDNdrwAIvmZaji0Y=;
 b=hWYuBTVNutTQv35qX5usfMbL1IL/5Y435X/DPNlstpjn3PfL4n2BohmuHtrQotEtGs
 l+xc8+1ZKRO3QP3GyhMO3UmvP1khniF3efdGSKwoTrPRFiQC4wsb3IJtZ81bt+o+MJe6
 nph0JA9bwQaXdcRyQE0PCq35T8w0+vmZx7LrCSz2l1jk6B/FDd64a6pWTeEKs8kvsU5y
 0/R2qBKwLoqwJpqopTGPqRbc5Mc1ABiOFWqEbw5ddyw4hPQ//RG9tHIbR2NcEUtZFpaY
 ypXnSQc74vdJMbz121bIE5m6wuZM3GMwHiNn2Qa46rIVX/OQgUPyOiZlLtlN+nk7D35W
 1+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3qErRPP0ilxDOH7pAbvP7YMgsl2eDNdrwAIvmZaji0Y=;
 b=LLLQn12bA4fVN/clM5OgkbxgvJX9B/DgeUAaBQnEqhfAVS0TPH6DXnXeAyVx7YzIXH
 E4ak5rgLvA30iFIhg568dXP4H+u537DcgFiNnV3dMzAGSuORt3iYEdFnRtELhQs4lu48
 93vHr100C9iQX0ZcU3vnS7quvsmDsk/VPJeNT2UTsIkhODfJ5pm2VbZi32sfOibxwxXq
 K0OwnpIh+q0COKKC4Jz2vWBzD6pPGG8kZgSXmZ5cqqeaet5IbrJARK6wkYtgLSrn7EJ3
 +2yutjaFYmrJ6RkyreY/ghoG68MnJkYE7F5x/iWGGWgBQKBP/5kAVohSSjmTHNoMgbYm
 aEvw==
X-Gm-Message-State: AOAM532xd2/Y6MWEgnj96ORe0hpJDq/0PBU4YwlxscZagGDrFNRWmVjN
 zlLDpAVCKhaLtccEn3awBxrDw2WoiDpHKTh1kjE=
X-Google-Smtp-Source: ABdhPJzFS3fUE9dxnDYIQNn5YfJf7gdhhjzIMgkotnd4VY06oMCfRJKkMrDq2L0l7wi5plHYiGTPisfZEEKzNEmv4kE=
X-Received: by 2002:a6b:4003:: with SMTP id k3mr17110021ioa.105.1612835089693; 
 Mon, 08 Feb 2021 17:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
 <20210126060007.12904-4-bmeng.cn@gmail.com>
 <64f493fb-25cb-d3c9-11fe-ca61fca75f50@amsat.org>
In-Reply-To: <64f493fb-25cb-d3c9-11fe-ca61fca75f50@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Feb 2021 17:44:17 -0800
Message-ID: <CAKmqyKM4XSQuAvvUYLa+j_je61-e-OHj_AJP1Q54o1V+bPs9og@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] hw/ssi: Add SiFive SPI controller support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 09 Feb 2021 01:44:53 -0000

On Mon, Jan 25, 2021 at 11:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 1/26/21 7:00 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This adds the SiFive SPI controller model for the FU540 SoC.
> > The direct memory-mapped SPI flash mode is unsupported.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v3:
> > - Simplify flush txfifo logic
> >
> > Changes in v2:
> > - Log guest error when trying to write reserved registers
> > - Log guest error when trying to access out-of-bounds registers
> > - log guest error when writing to reserved bits for chip select
> >   registers and watermark registers
> > - Log unimplemented warning when trying to write direct-map flash
> >   interface registers
> > - Add test tx fifo full logic in sifive_spi_read(), hence remove
> >   setting the tx fifo full flag in sifive_spi_write().
> > - Populate register with their default value
> >
> >  include/hw/ssi/sifive_spi.h |  47 +++++
> >  hw/ssi/sifive_spi.c         | 358 ++++++++++++++++++++++++++++++++++++
> >  hw/ssi/Kconfig              |   4 +
> >  hw/ssi/meson.build          |   1 +
> >  4 files changed, 410 insertions(+)
> >  create mode 100644 include/hw/ssi/sifive_spi.h
> >  create mode 100644 hw/ssi/sifive_spi.c
>
> Missing MAINTAINERS entry (if there are no other comments on
> this series, maybe the maintainer can directly add one).

Yep, I'm adding this section to the RISC-V machines:

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d8b0bf966..c347d49bd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1359,6 +1359,15 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
F: include/hw/misc/mchp_pfsoc_ioscb.h
F: include/hw/misc/mchp_pfsoc_sysreg.h

+SiFive Machines
+M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Bin Meng <bin.meng@windriver.com>
+M: Palmer Dabbelt <palmer@dabbelt.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: hw/*/*sifive*.c
+F: include/hw/*/*sifive*.h
+
RX Machines
-----------
rx-gdbsim


Can I get an Ack from you Bin that you are ok with that?

@Palmer Dabbelt let me know if you would prefer something else.

Alistair

>

