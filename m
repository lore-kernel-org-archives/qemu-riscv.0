Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A0C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 06:35:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvqvv-0005y8-E6; Mon, 17 Aug 2026 02:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wvquB-0005th-01
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 02:33:30 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wvqu7-0004UM-W7
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 02:33:05 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-669944f60b3so3181265d50.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 23:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786948382; cv=none;
 d=google.com; s=arc-20260327;
 b=UaGrl6LmweP9ZjnIOLSlD5kHbseieCyQAYCxx05TA4HDHJlRmMTI/tC4aEgNyTQbp0
 2IIh6mAlsvlC5QDq2JNw0/6RtGGqyxDloEJd1caOpXCgvwE8wB9sd8wZQYgudBacdU5e
 OF7BwT/PHomjAye5EO6YuvPFj8QDvkt1nDLDJBcKHFa4Xro6jxz/z5ke/lcoE6XwajLC
 lyxjKQxiwOesiT+alJ8OJ3fLNpGBiPOsEi7kS2gol9LQ4nS9CatAU33ufxI4RQza1EF9
 uUU3FSV69Trx+BuPLCuEXd5tHJNUOu1omFx0LaeBR+GyNv2YfTxLSFT4B60fVAWH2pRA
 oOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FcD7iQMxaEVitjqsnWLDUbih8s3iM++atuzz8mv4FPs=;
 fh=YBQJbnG/+LMwy9xUXWMQvUwyLmvKtq2mzGLjHYhbxjw=;
 b=MPllBIS2p+GLk8P2Sj2ulMbGkPyE/lvEikcYRWwobiNNIcNIAOXR3rUSYwYV8eC2yD
 uvp+qFFlUViOj46/fVXhIoSkVymM+0SsqK2ne7TI87HUs90mcsGd3slav9Ip3YygrwIj
 CqmK/Q62fcprP8nJ0qnN2cem7IlF6TqKs16uFP6aBXzMlLX9aLx3W/CszD+yzMh8dSRJ
 BU5iPW1RVVmErnI7ZPqQY1Xaa5fyaBp5oWOmBLRKRaEa4WXLaCOBNK5ZJwDFMrYBfoXG
 +VQ7/vLMxkjtnLreV23Mgq3B0Bq8ZAKFdsMuWbr7zrKC8baMX+jIJT3MJiPZRAJprpU6
 DqQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786948382; x=1787553182; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FcD7iQMxaEVitjqsnWLDUbih8s3iM++atuzz8mv4FPs=;
 b=XQu2/IB1DDhQGaENKJWHOO3mYqwxV6S0tSq1KEGWT01SUBCGajrqKvVDpWmmtuwTNO
 BonxfNxvZJbbdlpOFR9HwF7mIwNjk4kk7IPnMy984kAeHa6VhGBMnRJCyEqWOlgPO88t
 RrrS26VIx2aanLVpbo1vtKPizRth+16SuTg+0pw/tziCZt8KwfW4XVmeqCqgJzywamkl
 GUF0H3z1VR9R8q3UlgucpJQClyAhOUPQWt5F3vfjqtZcT2YSUe6bdajvnTX86UsIuNAy
 ojgNk19cjx1o7ri7uXp1Ea7j+0f14DN564D2f2lyO/K+yCXs9b7o4fACSIvfYNO9fV8J
 lBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786948382; x=1787553182;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FcD7iQMxaEVitjqsnWLDUbih8s3iM++atuzz8mv4FPs=;
 b=AAmyl0xBQ5MYNb+GvnMVO1hlsssc457cVgfiRyml7sJL0brLAmxPK+J17C9RTAhDh3
 MBRM+oLCpJuoIGofpyw9Vag5hw1SuXlMQH7wD1nakiJ+L3I3T8OMBOolZQe0GsvVkOK2
 V3nmCrLbHTE4Ds188LbErym9T8s8QKkULOO9be3hUarbKJY/0A/64HauL1Sy3s0Oexp6
 UQDHC8k65cDB3k7Vb2oxncBovNjQ24oJAonPKtn9BlY270/TNFDDrdXkMCYRjdhDnuRw
 SW2Q5WnsPk8GgMP9ofWhyZPKun4d8AEy5BzcvL3oB0C5zOpB9qeOp1ccpPZodAffpkbS
 l6wA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrVOYxoNhw4xm/u7i7Cj36ztx3fsFIBW9wIj2DfK1XTGBMo6xObiWnYpXrWM7rgFvmzAAkZuDwbsr7s@nongnu.org
X-Gm-Message-State: AOJu0YyUev9qv0+DeGAjIDD8ni0UReb1XXw6eT4wtelrxpvi8scwMQrX
 0J//LoYC66tdpEprFiCLEYhJYXVfUe2VdBf06GiQO+ky5BTgALik3yN74NVq+pUSO7uKBB8bLDR
 G+MEZL4r3AT6jbIDHLUr0qzQ4rM8zM2w=
X-Gm-Gg: AR+sD13RtQbKyJgJ5kKiyZZMF5I4jxoJgy4MearQxdArAmKW6hnh670P80SJN4nYobS
 tw87SYzNN0wVof5rKWnq4m5+3w0ccEl2gizEeQ6S6cgJLkTzMZpgSBujFE91ABJlKcfhHgLqGLm
 CsiMnh9WXdnyllR+C/FDqKukcFDpVTsHenPe/oMEagG30yLRcE+UgeHGvOrGfv/kB35SdGIGoHd
 LoPIbojQrrfIOtmkeq0fYy8n/agV2xomu+Vtq6Y/Qj4L+Ldu5L1LvCvSEzWlYMfqENEOWCFP5ii
 L3DR3nSAM9dVSsAZzJGtOWs1hhQL4iCpkoz8OF/5YWM=
X-Received: by 2002:a05:690e:1906:b0:668:172a:47a7 with SMTP id
 956f58d0204a3-66c72c7653dmr7681677d50.25.1786948382345; Sun, 16 Aug 2026
 23:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
 <20260808182956.290561-2-flamboyant.h.01@gmail.com>
 <CAEUhbmV5hOJuoGjCgLGhMo+BVXNo+RY30D7hP7L9FpdU1Kt5Sw@mail.gmail.com>
In-Reply-To: <CAEUhbmV5hOJuoGjCgLGhMo+BVXNo+RY30D7hP7L9FpdU1Kt5Sw@mail.gmail.com>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Mon, 17 Aug 2026 14:32:51 +0800
X-Gm-Features: AcwNN1Vk-mQnnGPY2YUST1tDf1C86ujxBLpx3KrBHaWcihQlEIvjC8WGOMG1f9g
Message-ID: <CAAW0U4afZ9Y6_dcypihVTSTWLpe0yVqfndWCOD15jU5xKZQk1g@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/ssi: Add Synopsys DWC SSI standard PIO
 controller
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yx1-xb132.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Bin Meng <bmeng.cn@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8816=E6=97=A5=
=E5=91=A8=E6=97=A5 23:28=E5=86=99=E9=81=93=EF=BC=9A
> > +    case A_TXFLR:
> > +        value =3D fifo32_num_used(&s->tx_fifo);
> > +        if (s->phase =3D=3D DWC_SSI_PHASE_STANDARD_TX_ONLY) {
> > +            dwc_ssi_run_transfer(s);
> > +        }
>
> The modeling of transferring data from TX FIFO needs to be reconsidered.
>
> IIUC, currently the TX-only transfer advances in 64-frame batches
> (DWC_SSI_PIO_TX_BATCH) and, once the phase is
> DWC_SSI_PHASE_STANDARD_TX_ONLY, dwc_ssi_push_tx() deliberately skips
> dwc_ssi_run_transfer(). The remaining FIFO entries only reach the wire
> when the guest reads TXFLR or SR (see below).
>
> What if an interrupt-driven guest that waits for TXE without reading
> those registers stalls once TXFTHR > 0: the FIFO stays above the
> threshold, TXE never asserts, and nothing drains it.
>
> I suggest draining on DR write, like sifive_spi model does. No other
> hw/ssi model advances its TX FIFO on status-register reads. sifive_spi
> flushes the whole TX FIFO synchronously on the TXDATA write
> (sifive_spi_flush_txfifo()), and with a FIFO depth of at most 256
> entries that is cheap. I'd drop DWC_SSI_PIO_TX_BATCH and have every DR
> write run the transfer until the FIFO drains. That also removes the
> asymmetry with the TR path, which already drains fully.
>
> > +        break;
> > +    case A_SR:
> > +        value =3D dwc_ssi_status(s);
> > +        if (s->phase =3D=3D DWC_SSI_PHASE_STANDARD_TX_ONLY) {
> > +            dwc_ssi_run_transfer(s);
> > +        }
> > +        break;

Hi Bin,

Thank you for reviewing the V3 patch. I agree that these issues need to be
fixed. For the TX-only FIFO progress issue, the current 64-frame batching
depends on reads from TXFLR/SR. In IRQ mode, the transfer may stop because =
TXE
is never raised.

While preparing, I found another issue in the K230 vendor Linux native-CS
SPI-mem path. The driver first fills the TX FIFO before enabling SER. It th=
en
reads TXFLR before writing the remaining data:
K230 SDK source:
https://github.com/kendryte/k230_sdk/blob/v2.0/src/little/linux/drivers/spi=
/spi-dw-core-k230.c#L709-L742
    len =3D min(dws->fifo_len, dws->tx_len);
    while (len--)
        dw_write_io_reg(dws, DW_SPI_DR, *buf++);

    len =3D dws->tx_len - ((void *)buf - dws->tx);
    k230_dw_spi_set_cs(spi, false);
    while (len) {
        entries =3D readl_relaxed(dws->regs + DW_SPI_TXFLR);
        if (!entries) {
            dev_err(&dws->master->dev,
                    "CS de-assertion on Tx\n");
            return -EIO;
        }
        room =3D min(dws->fifo_len - entries, len);
        ... write remaining frames to DR ...
    }

For the current K230 profile, fifo_len is 256. When i test a 260-byte
TX-only transfer has
4 bytes left after the first fill. If we remove the 64-frame limit and drai=
n the
FIFO immediately when SER starts the transfer, TXFLR may become zero before
the driver writes these 4 bytes. The driver then returns "CS de-assertion o=
n
Tx". If only DR writes can advance the model, TXFLR may stay full and the
driver will not issue a DR write to create room.

The SDK also says that native CS is controlled automatically: when the TX F=
IFO
has no data left, the controller de-asserts native CS. If the driver refill=
s
the FIFO too late, the transaction may end early.

The K230-specific DWC SSI driver also comments out the generic SPI IRQ setu=
p,
so its standard transfer path uses polling. The generic DWC SSI driver stil=
l
uses IRQ mode when an IRQ is available.

K230 DWC SSI driver:
https://github.com/kendryte/k230_sdk/blob/v2.0/src/little/linux/drivers/spi=
/spi-dw-core-k230.c#L589-L597
Generic DWC SSI driver:
https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5=
019f/drivers/spi/spi-dw-core.c#L416-L465

We need to fix the FIFO stall in IRQ mode, but the native-CS path must not =
see
TXFLR=3D0 too early. I am not sure how to handle both cases. Could you plea=
se
advise whether we need another way to advance the FIFO=EF=BC=8C
such as a QEMU timer or another mechanism?

Regards,
Kangjie

