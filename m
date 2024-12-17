Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1AAE7717F
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 04:02:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNOm8-0002HN-4Y; Mon, 16 Dec 2024 23:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tNOm5-0002Ga-Il
 for qemu-riscv@nongnu.org; Mon, 16 Dec 2024 23:01:33 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tNOly-0004wM-EX
 for qemu-riscv@nongnu.org; Mon, 16 Dec 2024 23:01:33 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa670ffe302so900976866b.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Dec 2024 20:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734408083; x=1735012883; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWeN2GzDDOZl+npV0CFqa5drd9E46PYMXIXJG+0M5Gk=;
 b=nuZ0ilk7EtM+SWKB/6nSbiKuRPPiMtjrPcwhOI/EpxyHCeGQqsOJEtHFJQYUOX37T0
 bI8QuNyKcMdcDHVOVzn5fWXZyf74sY++0ZH4m/u7FvP87b2gmTFyp1Ulye+SeyDXUs6D
 yJNwhk/dDupNHw7FPRkbvcUdbhMbu+Q+FAyjpsKyxxBvEFFw7uIwgVOuv3eR9QSEHNwi
 gFwcY5EW8sEEY+dnav6AKLqWoCiSc/01djhqiMqHyXNjLttfMhgESZo22vMNS0CMtrVZ
 skWWoeaqq+5sV1iC/z2aFfADvu9cDidN77mZNWeAs1KztrZC3RBwzCkhmJjXtXNXHcZv
 LTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734408083; x=1735012883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWeN2GzDDOZl+npV0CFqa5drd9E46PYMXIXJG+0M5Gk=;
 b=dE5o7qTTKhHKwhUkapAtctp+BaYpfVMlF1LsFPZczplWTEoUCTyUGeXQXo02nKzv/2
 ABBsztj5Hp/tuqrX0Johd0/eBA/0eP+fJZWK8Py2nDMiq/n7Hz+YxgZVOIKwgBdi3Pnk
 iX4yCEI4PN/0RgDs8GH/1j4e1n5gIIezfA7on4F5VINfQX8J4KMMTcNo7h0No3X5LQSb
 a5CvtRV2UAjbr6Y91i4uXUinBAYMbvaOrN8baipmypfJchgS0OxQD/0azgdSGohfp2x4
 aTtiEF1W6dxPHp5BJVIR/l28pqrS0Pc9vCIsDoqF0XnTG3KLIkQjXX7mfD+6fz1nubmi
 2/ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmUGLaI5twWBUCkDDx5Kw41WfNPMw74uslm5cL+0ab45c/+amKWV9H9JfJ5kIuT+eHCM8dYc+8/U9l@nongnu.org
X-Gm-Message-State: AOJu0YzSog7N7WxR/BkUSZtkPeFIxItTRTK1WCSvqnP6LVaaN4GVV1Xy
 FNDFCqHK3h9/wJyw6OsV/0nNnMvWWxiGmgiyh/5fiio4eDlmsQm1POGrnmSIFTx+10PHQ3am2/l
 YDllSC9Epf4NwALHJ1MY0HiI2+keW3dEjLiA3ug==
X-Gm-Gg: ASbGncvxDdYcyQPP+1WjAkNV27Mt0LYQQwXnncN5BXG0xZZY23FxG2xvZFtk7ipbpAx
 T5bL9kL/ztxCRyDGXOkPjJ/NqC+q0kF4LdECbrlB+
X-Google-Smtp-Source: AGHT+IENrKKOXCqQe/fMbDZQaZQCIIr/qAaPuoG4s6QDnJvYCEpi47NdQdGUHomYLWJ7CYDtHu2cnOHSsoanYMYyr1w=
X-Received: by 2002:a17:907:7707:b0:aa6:87e8:1d12 with SMTP id
 a640c23a62f3a-aab77e7fb68mr1133423866b.45.1734408083479; Mon, 16 Dec 2024
 20:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20241120153935.24706-1-jim.shu@sifive.com>
In-Reply-To: <20241120153935.24706-1-jim.shu@sifive.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Tue, 17 Dec 2024 12:01:13 +0800
Message-ID: <CALw707rhW_XpQ4GQbPnpadGN2kw1KQf5gBzGTzoLgXx7ZXCEOQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Support 64-bit address of initrd
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi,

Gentle ping on this patch

Thanks,
Jim Shu





On Wed, Nov 20, 2024 at 11:39=E2=80=AFPM Jim Shu <jim.shu@sifive.com> wrote=
:
>
> Support to load DTB after 3GB on RV64 system, so that larger initrd
> doesn't be overlapped to DTB. DTB loading now will check if overlapping
> to kernel/initrd and report this error.
>
> Verify the patch via running 4GB initramfs on the virt machine.
>
>
> Changes for v4:
>
>   - Update the comments of loading DTB in 64-bit CPU
>   - Align image_[low|high]_addr's type with initrd_start (hwaddr)
>   - Fix commit 2 to avoid unnecessary change .h file of board
>
> Changes for v3:
>
>   - Change struct RISCVBootInfo from machine state to local variables.
>
> Changes for v2:
>
>   - Add DTB overlapping checking and struct RISCVBootInfo
>   - Remove the commit to change #address-cell of 'initrd-[start|end]'
>
> Jim Shu (3):
>   hw/riscv: Support to load DTB after 3GB memory on 64-bit system.
>   hw/riscv: Add a new struct RISCVBootInfo
>   hw/riscv: Add the checking if DTB overlaps to kernel or initrd
>
>  hw/riscv/boot.c            | 100 +++++++++++++++++++++++++------------
>  hw/riscv/microchip_pfsoc.c |  13 +++--
>  hw/riscv/opentitan.c       |   4 +-
>  hw/riscv/sifive_e.c        |   4 +-
>  hw/riscv/sifive_u.c        |  14 +++---
>  hw/riscv/spike.c           |  14 +++---
>  hw/riscv/virt.c            |  13 +++--
>  include/hw/riscv/boot.h    |  28 ++++++++---
>  8 files changed, 127 insertions(+), 63 deletions(-)
>
> --
> 2.17.1
>

