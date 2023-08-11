Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5374AC001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:42:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTL8-0003JK-BH; Fri, 11 Aug 2023 10:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTL5-0003IV-Ep; Fri, 11 Aug 2023 10:42:07 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTL3-0007jO-Oy; Fri, 11 Aug 2023 10:42:07 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-796d78b3f68so668204241.0; 
 Fri, 11 Aug 2023 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691764924; x=1692369724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SONaOQZW7L+yqFL/v+zcKUCopJxCp+8+YOxTa4H97wo=;
 b=aXfSf7WUJivcSWC7APEPZ0bz9md0JgJnA8IeYSKER1/HcuSHATkaR32H77gmR/CxXU
 p3Vf7sTIyrcjGvPMHD7cxWbrLcSWvMQCzKuoo5iA+WGm5+R5owGrNrg6JYo7tFXJnH6n
 IfggSwtqc9nI9hdeVG9GDe3Y9q/f9buvkfUaRygTF5EVS0AaD6GYDoF2B1REiFjQCZ0W
 W7igmhXv0V/dWwT7jeykl80wScvy4ix0OYrhM5LQMxSt/ELeqfqQwtgMDshsdIKaahwD
 nAz8bh1NjvnvZiOlGq7CNzvzWbTnpK8vc7lEaJrZGZoVaCR4Lt8BdZcqBt7bOX1EbMpK
 pMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691764924; x=1692369724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SONaOQZW7L+yqFL/v+zcKUCopJxCp+8+YOxTa4H97wo=;
 b=V0Jt1VLKB/2a6vq97zi+jvbJgxa0dxURDGhC9+hit1gErvs16SQ/2W7uFebqh1ko07
 cXTfVcGnWAGbBqAzgXgUymZkkbl2AdTPcXg+ijI+O2GENTCC5Bj/E9rkyFoCOTGSU0PH
 bc1jADqPFNyvIF1Lu1HFMc9VQcd8zGTEirMhbE/k+pPojJuy0g228tOT0f5BBpKf/g/w
 5aBAYg5p/fnpKWMgpUulLXxyOsEvnxS729qsObvW9K5zUqaey8WM52Cb86qrITM5gSYz
 aiF+XLwG3U8ORGULD8+VHWLdCvvvUxxCEb7z/7yVDg7EGyZvlrJyL3zcEfQFb4ZNrgGo
 osTQ==
X-Gm-Message-State: AOJu0YzDoTqfR8uQvoQ9ymg7bnZgi6qKSgaXCjBjrZT1XC0Nkvhx3dEp
 4R2o995d47zrflcY+RFVBzVuPkDsUPdcDF6sKXk=
X-Google-Smtp-Source: AGHT+IFuMOg5CT+HABusmy4hkatgnIMRnBzhEMov0akgQPDpSNB2AQzwBEnK/1J0nVbLJAQ81HBXhtPC+Wl6ekQlUUE=
X-Received: by 2002:a67:b102:0:b0:447:a1f7:aeb0 with SMTP id
 w2-20020a67b102000000b00447a1f7aeb0mr1622633vsl.32.1691764924429; Fri, 11 Aug
 2023 07:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230727102439.22554-1-yongxuan.wang@sifive.com>
In-Reply-To: <20230727102439.22554-1-yongxuan.wang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 10:41:38 -0400
Message-ID: <CAKmqyKNGpT=_gfbwxkmkyQj+m7uHHSBEBWdRAm20SQQ+HeGwGg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add RISC-V KVM AIA Support
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, ajones@ventanamicro.com, 
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com, 
 frank.chang@sifive.com, jim.shu@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Thu, Jul 27, 2023 at 7:49=E2=80=AFAM Yong-Xuan Wang <yongxuan.wang@sifiv=
e.com> wrote:
>
> This series adds support for KVM AIA in RISC-V architecture.
>
> In order to test these patches, we require Linux with KVM AIA support whi=
ch can
> be found in the riscv_kvm_aia_hwaccel_v1 branch at
> https://github.com/avpatel/linux.git

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
> v7:
> - fix compiler warning in PATCH3
> - rename the "kvm-aia" property to "riscv-aia" and add it as a RISC-V KVM
> accelerator property. also move this setting from PATCH5 to PATCH3 in the=
 code.
>
> v6:
> - fix alignment
> - add hart index to the error message of ISMIC address setting in PATCH3
>
> v5:
> - remove the linux-header update patch since the riscv-to-apply.next QEMU=
 has
> synced up to Linux 6.5-rc1 headers.
> - create the APLIC and IMSIC FDT helper functions in PATCH1
> - add the irqfd support in PATCH3
> - fix the comments and refine the code
>
> v4:
> - update the linux header by the scripts/update-linux-headers.sh in PATCH=
1
> - remove the checking for "aplic_m" before creating S-mode APLIC device i=
n PATCH2
> - add more setting when we initialize the KVM AIA chip in PATCH4
> - fix msi message delivery and the APLIC devices emulation in PATCH5
> - fix the AIA devices mapping with NUMA enabled in PATCH6
> - add "kvm-aia" parameter to sepecify the KVM AIA mode in PATCH6
>
> v3:
> - fix typo
> - tag the linux-header patch as placeholder
>
> v2:
> - rebase to riscv-to-apply.next
> - update the linux header by the scripts/update-linux-headers.sh
>
> Yong-Xuan Wang (5):
>   target/riscv: support the AIA device emulation with KVM enabled
>   target/riscv: check the in-kernel irqchip support
>   target/riscv: Create an KVM AIA irqchip
>   target/riscv: update APLIC and IMSIC to support KVM AIA
>   target/riscv: select KVM AIA in riscv virt machine
>
>  hw/intc/riscv_aplic.c    |  56 ++++--
>  hw/intc/riscv_imsic.c    |  25 ++-
>  hw/riscv/virt.c          | 372 ++++++++++++++++++++-------------------
>  target/riscv/kvm.c       | 196 ++++++++++++++++++++-
>  target/riscv/kvm_riscv.h |   4 +
>  5 files changed, 454 insertions(+), 199 deletions(-)
>
> --
> 2.17.1
>
>

