Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928FAC10F1A
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:36:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s4Mrf-0006Ck-4i; Tue, 07 May 2024 11:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s4MrX-0006A4-6p
 for qemu-riscv@nongnu.org; Tue, 07 May 2024 11:36:18 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s4MrK-0006VS-Gt
 for qemu-riscv@nongnu.org; Tue, 07 May 2024 11:36:14 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e428242a38so9028691fa.2
 for <qemu-riscv@nongnu.org>; Tue, 07 May 2024 08:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715096161; x=1715700961; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fiwf75vH6Oa3RGU9SZ3VLAUaaRtkz5HBSFHXeI/DWeY=;
 b=LbipH5ZiYupPeer8PRgi9euuAQPwWHMpqv2foDjPa5oaGrBo0J5fxCra4Mxvmfjv+B
 VFdDV0aKeGr8mMNID7Cl/Hit2I2tQJGcXheS5n19taF/4DV/dsIcbY1n23Ic6T+Wg4MG
 X7u7/rJefNWH1tDX2lMahIwkr2NSMsJQjBXWCaRsn9K3UpdwaPXxu/CuqGupSzpLut8O
 MQyWGf74YrKLfUXfjKAV3XNxR01zAlmkKWf/h6ezkeuWgS4yD43bb+JC9Z+1q6ltCNR7
 WrpGjcDCHSsY0prs9NaUhQE4NadANTJzacQTzL8b2hX38IzcdTUfpuPwA4c8KgT9OwX3
 /DqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715096161; x=1715700961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fiwf75vH6Oa3RGU9SZ3VLAUaaRtkz5HBSFHXeI/DWeY=;
 b=aki7t9zvOHlrG5ckJOBigwMkPEBOHeiZaqkm2hMJPapxQfb0IHSnX8lZbhmXw93P3w
 WIyXG7AsP79okMgj8Wx8QkUGDlYG2Kt48SGPOkZY3xa9JoYiYIV7vs50RibAahYTjg4I
 UScedw66WdVYO7c9MT4YJfV3ZOEA7M7KHzZ/axeSsNuZC4BSqfCGtIyNDh3K7YK/rAEe
 kpIxPLGNCirsYP/2zdj55KLxLc4eDDGSW42EgUMRt+3jxkJxNjh3zIEhExXZ+VlADcA2
 AN4sesF2MoJiAIJnAszGC+hgxnE6/VX+YZWpEFvlI7JnFwEFniFPha5yBebUJH4DSORw
 nepQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaHbeAUDEgbspOv/qiH1IFpjYcNHQJYwcHVVp09GPUn63RkYoG1UmS8B5OqaUeHiSAG9BxDsdKgjkF1UeflXqvdh3BlsE=
X-Gm-Message-State: AOJu0YwpkLw0y+WHk6pfYwBmGRbTN7vcmLYOiNl24B0rTj3tMHc1Vgr3
 BsRKQSc18NYT7ICadfvmSy3YvxrF3HaWIHToJl01SymxmkXDOzelFZD0mCe6BsA=
X-Google-Smtp-Source: AGHT+IHG5WgCk7xpRjNOBas8gHWJB5zjS36XLoiex2WK6+yHsSK2RR1TsolPi0nfOMIp5/WYV8D0YQ==
X-Received: by 2002:a05:6512:238b:b0:51f:4d57:6812 with SMTP id
 c11-20020a056512238b00b0051f4d576812mr14148168lfv.19.1715096160645; 
 Tue, 07 May 2024 08:36:00 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056512060200b0051f0225e0a4sm2141102lfe.227.2024.05.07.08.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 08:36:00 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2db13ca0363so50193741fa.3; 
 Tue, 07 May 2024 08:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUoT9csvsgKwh9ZbzJQiFsaNZzSYpRTk5Twi62BAKxvGspAu/UsIKoYGEu0j195aVHAsM2AfgBMsRxbCw6aj891xWBrGY=
X-Received: by 2002:a2e:9882:0:b0:2dd:2bd8:a4c1 with SMTP id
 b2-20020a2e9882000000b002dd2bd8a4c1mr11433782ljj.10.1715096160127; Tue, 07
 May 2024 08:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240503124244.8804-1-dbarboza@ventanamicro.com>
 <20240503124244.8804-2-dbarboza@ventanamicro.com>
In-Reply-To: <20240503124244.8804-2-dbarboza@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 7 May 2024 23:35:49 +0800
X-Gmail-Original-Message-ID: <CANzO1D2afiHOY_7Wdp0b0r1K78-GVVM1Doy5d74QryqCj2WvBw@mail.gmail.com>
Message-ID: <CANzO1D2afiHOY_7Wdp0b0r1K78-GVVM1Doy5d74QryqCj2WvBw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] pci-ids.rst: add Red Hat pci-id for generic IOMMU
 device
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=frank.chang@sifive.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Daniel,

It's glad to see that we have the dedicate PCIe device ID for RISC-V IOMMU.

Reviewed-by: Frank Chang <frank.chang@sifive.com>

Daniel Henrique Barboza <dbarboza@ventanamicro.com> =E6=96=BC 2024=E5=B9=B4=
5=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:44=E5=AF=AB=E9=
=81=93=EF=BC=9A

>
> Reserve an id to be used by the RISC-V IOMMU PCI device.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  docs/specs/pci-ids.rst | 2 ++
>  include/hw/pci/pci.h   | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/docs/specs/pci-ids.rst b/docs/specs/pci-ids.rst
> index c0a3dec2e7..a89a9d0939 100644
> --- a/docs/specs/pci-ids.rst
> +++ b/docs/specs/pci-ids.rst
> @@ -94,6 +94,8 @@ PCI devices (other than virtio):
>    PCI ACPI ERST device (``-device acpi-erst``)
>  1b36:0013
>    PCI UFS device (``-device ufs``)
> +1b36:0014
> +  PCI RISC-V IOMMU device
>
>  All these devices are documented in :doc:`index`.
>
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index eaa3fc99d8..462aed1503 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -115,6 +115,7 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
>  #define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
>  #define PCI_DEVICE_ID_REDHAT_UFS         0x0013
> +#define PCI_DEVICE_ID_REDHAT_RISCV_IOMMU 0x0014
>  #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
>
>  #define FMT_PCIBUS                      PRIx64
> --
> 2.44.0
>
>

