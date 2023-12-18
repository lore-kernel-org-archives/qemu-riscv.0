Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C76C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:19:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF56H-0004tE-GV; Sun, 17 Dec 2023 23:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF56G-0004t2-Dl; Sun, 17 Dec 2023 23:19:28 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF56E-0005xk-3Y; Sun, 17 Dec 2023 23:19:27 -0500
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3b86f3cdca0so2305410b6e.3; 
 Sun, 17 Dec 2023 20:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702873164; x=1703477964; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbWNSwjy6lukoapEFSSwf/K4OuglENDuU0z+cqrhnLk=;
 b=WUEzzhlp30Qkow18xDcJHmIFwFckvJTRK0XRlB+GAyX9mA96SiNcc/XQw0GuunWSmx
 5fBDNL3+ko7k8/gw2eoHpjQwgJRGMFHG/9vrEV9BmU1+zK7xmFkN6u6IQv980zHrUEQr
 oD0LOOkAb/BCMyRQPMnoDrGDmpftU2I9QZxQJdF3xGQwxr879ob78R4d79hgSlDVNUjk
 aHDBeBqEsI0rL5vzr0U+U3CSrqtiUH2M2CbumKCb5LaGNEn7geHo8wbN/HkcGYqjHByK
 MWzG/JP5XyzlpBMuLgcZNMLQH1c+O2r9jqiwRVoEYQS8pNjvKPTLxMTmeRA4wq7b+xUQ
 jtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702873164; x=1703477964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbWNSwjy6lukoapEFSSwf/K4OuglENDuU0z+cqrhnLk=;
 b=LDU7aknjB2nQpgGJh2KZ/ZoD+BVFmXTwxUpLClAyCT+wwpdUevFfeMcYcR/rqHjHn6
 PyDOVSLi2+ok5ltfSldolTPXJX0PzkuyMQpLWyGI5daFNoFupq3d+JE26V9GJXiFF+JP
 73QDFfCnD542OKKdCTmIIx434FhlboeFS9r09pZv/isD1GDs7nQKS6oJAruheiqSnscv
 2EHcEEpD1fRlOV6VLUedJJKDhy53DJNwHXNkYvZtLwvF10Ak7nucoGQKFFRUjlRFBwRw
 kKED2zuJPw955MaEQjoktziu13Z6fIfnxLbjFSQxvd8R9QlQg77ACJ2PbjVFmJRMV0ws
 l0Gg==
X-Gm-Message-State: AOJu0YwyJGOQ7Z2pzMWIx5d6kdg9G/4OtF7y7usI3mMW7kyWVgHHvZ8U
 hZPiwLn4Wi37b5kCd2HST4BaHJx+qCOMWxUcPnLQ5tdKAMntSA==
X-Google-Smtp-Source: AGHT+IFPztvWRV76lxKvBSQHnURc9+OahTIHE8ZLbR09zmxzEHBz68KeGH224Dx/+FwJ8SzZMzV/au+LWMsdWYXp+s0=
X-Received: by 2002:a05:6808:3847:b0:3ba:92a:910 with SMTP id
 ej7-20020a056808384700b003ba092a0910mr16650034oib.104.1702873164257; Sun, 17
 Dec 2023 20:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20231122053251.440723-1-ethan84@andestech.com>
In-Reply-To: <20231122053251.440723-1-ethan84@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 14:18:58 +1000
Message-ID: <CAKmqyKO9nGLo2b0TamakNh4qRr+Bi8NQ973bQ=ch8=CKoH-etg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Support RISC-V IOPMP
To: Ethan Chen <ethan84@andestech.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, in.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, hiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 peterx@redhat.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x232.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Nov 22, 2023 at 3:36=E2=80=AFPM Ethan Chen via <qemu-devel@nongnu.o=
rg> wrote:
>
> This series implements IOPMP specification v1.0.0-draft4 rapid-k model.
> The specification url:
> https://github.com/riscv-non-isa/iopmp-spec/blob/main/riscv_iopmp_specifi=
cation.pdf
>
> When IOPMP is enabled, a DMA device ATCDMAC300 is added to RISC-V virt
> platform. This DMA device is connected to the IOPMP and has the functiona=
lities

I don't think we want to add an Andes DMA device to the virt machine.

I can't even find the spec for the ATCDMAC300, which isn't great

Alistair

> required by IOPMP, including:
> - Support setup the connection to IOPMP
> - Support asynchronous I/O to handle stall transactions
> - Send transaction information
>
> IOPMP takes a transaction which partially match an entry as a partially h=
it
> error. The transaction size is depending on source device, destination de=
vice
> and bus.
>
> Source device can send a transaction_info to IOPMP. IOPMP will check part=
ially
> hit by transaction_info. If source device does not send a transaction_inf=
o,
> IOPMP checks information in IOMMU and dose not check partially hit.
>
> Changes for v4:
>
>   - Add descriptions of IOPMP and ATCDMAC300
>   - Refine coding style and comments
>   - config XILINX_AXI does not include file stream.c but selects config S=
TREAM
>     instead.
>   - ATCDMAC300: INT_STATUS is write 1 clear per bit
>                             Rename iopmp_address_sink to transcation_info=
_sink
>   - IOPMP: Refine error message and remove unused variable
>   - VIRT: Document new options
>                 atcdmac300 is only added when iopmp is enabled
>           serial setting should not be changed
>
> Ethan Chen (4):
>   hw/core: Add config stream
>   Add RISC-V IOPMP support
>   hw/dma: Add Andes ATCDMAC300 support
>   hw/riscv/virt: Add IOPMP support
>
>  docs/system/riscv/virt.rst                    |  11 +
>  hw/Kconfig                                    |   1 +
>  hw/core/Kconfig                               |   3 +
>  hw/core/meson.build                           |   2 +-
>  hw/dma/Kconfig                                |   4 +
>  hw/dma/atcdmac300.c                           | 566 ++++++++++
>  hw/dma/meson.build                            |   1 +
>  hw/misc/Kconfig                               |   4 +
>  hw/misc/meson.build                           |   1 +
>  hw/misc/riscv_iopmp.c                         | 966 ++++++++++++++++++
>  hw/riscv/Kconfig                              |   2 +
>  hw/riscv/virt.c                               |  65 ++
>  include/hw/dma/atcdmac300.h                   | 180 ++++
>  include/hw/misc/riscv_iopmp.h                 | 341 +++++++
>  .../hw/misc/riscv_iopmp_transaction_info.h    |  28 +
>  include/hw/riscv/virt.h                       |  10 +-
>  16 files changed, 2183 insertions(+), 2 deletions(-)
>  create mode 100644 hw/dma/atcdmac300.c
>  create mode 100644 hw/misc/riscv_iopmp.c
>  create mode 100644 include/hw/dma/atcdmac300.h
>  create mode 100644 include/hw/misc/riscv_iopmp.h
>  create mode 100644 include/hw/misc/riscv_iopmp_transaction_info.h
>
> --
> 2.34.1
>
>

