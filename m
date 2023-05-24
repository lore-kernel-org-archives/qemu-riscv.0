Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3091DC77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 May 2023 15:51:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1ql8-0004HC-SY; Wed, 24 May 2023 11:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q1ql7-0004GX-EA
 for qemu-riscv@nongnu.org; Wed, 24 May 2023 11:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q1ql5-0005O4-Km
 for qemu-riscv@nongnu.org; Wed, 24 May 2023 11:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684943438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x8Fa86UZpT3mG1jt/vWqaNZLVlYx9XSRhdCS3rPomt8=;
 b=U/70/goiCWwcFhoxK/NwBh1jtu443E7ILDWe91CJ3l6+a58oTqf4R0QybaTvrppI0YeCJ+
 BglW+p40UzHKmhWu+bm+9m/ZcS5/OXS2OYJdpKteUoI8nbJJoLKkOauPoeR981CGy4y58T
 AMgFopOm9vHT/I1+MJG+VOrVob+bDMw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-lITBHRIUNTyg3KkdxQLuAg-1; Wed, 24 May 2023 11:50:37 -0400
X-MC-Unique: lITBHRIUNTyg3KkdxQLuAg-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1afba64045aso2558805ad.0
 for <qemu-riscv@nongnu.org>; Wed, 24 May 2023 08:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684943436; x=1687535436;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x8Fa86UZpT3mG1jt/vWqaNZLVlYx9XSRhdCS3rPomt8=;
 b=BFQrRFuS1BAHJcIUBU322FOnP1gIGnbNLOE7U0hpp9dbGcqYcEPmjlDlqNe0YKu/DP
 N8Fjzs5ezDedv+ZofJR58t+TNfH9KwczMdFnLT4MuQTH70vHyVtHjbLPjc/nvyWkmitT
 3kLINvLQ4dOuMu6O0KxnOUteXiO1NuawwII9RdH4R9tlL9myPNec5qaJ2oP2Qgc5eIdP
 GP0wMVCq+jsBvdKV8w4lcSOZKe45C0ZA9zEjkjemLsxGM/JMCcndfdfTRnwMqpZaGpNK
 FSR/7AKDbEpmOYRSujkvtSCoATnJziCAjTgaNNI2yEvUTSRN/9Ym/68T4eSgeN8/g6Qo
 dPkg==
X-Gm-Message-State: AC+VfDzCroz9wS88wrP4PJJGSaF7x4TPA7UnvzmRafjXoAqgBV3kAIzb
 zmwVKzfxRAkJeCr6+rNGO9hcmLInd4QORrFqxdxnRLnAH3T6Nhd/AigMfDFD4dj/483XxiU/4UT
 ZyMdR44xHEcTg18d0f/1pJpIsXNgecfo=
X-Received: by 2002:a17:902:ec8c:b0:1a9:80a0:47ef with SMTP id
 x12-20020a170902ec8c00b001a980a047efmr20843685plg.20.1684943435856; 
 Wed, 24 May 2023 08:50:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5rG+5BC/BkIm7JtvOrJK6eLECV2f6D7JhuD3MBq9dTz4I9KPeGwgtfB3xlQgfDYI8cd3PK3rh1y2q9XV7KE9k=
X-Received: by 2002:a17:902:ec8c:b0:1a9:80a0:47ef with SMTP id
 x12-20020a170902ec8c00b001a980a047efmr20843655plg.20.1684943435494; Wed, 24
 May 2023 08:50:35 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 May 2023 15:50:34 +0000
From: Andrea Bolognani <abologna@redhat.com>
References: <20230523102805.100160-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230523102805.100160-1-sunilvl@ventanamicro.com>
Date: Wed, 24 May 2023 15:50:34 +0000
Message-ID: <CABJz62MQ5uRHUP4LLKt=AxTf-Sz0aTEOLWDz=9ftK=H3tZ9JUg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 23, 2023 at 03:58:05PM +0530, Sunil V L wrote:
> Currently, virt machine supports two pflash instances each with
> 32MB size. However, the first pflash is always assumed to
> contain M-mode firmware and reset vector is set to this if
> enabled. Hence, for S-mode payloads like EDK2, only one pflash
> instance is available for use. This means both code and NV variables
> of EDK2 will need to use the same pflash.
>
> The OS distros keep the EDK2 FW code as readonly. When non-volatile
> variables also need to share the same pflash, it is not possible
> to keep it as readonly since variables need write access.
>
> To resolve this issue, the code and NV variables need to be separated.
> But in that case we need an extra flash. Hence, modify the convention
> such that pflash0 will contain the M-mode FW only when "-bios none"
> option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> This enables both pflash instances available for EDK2 use.
>
> Example usage:
> 1) pflash0 containing M-mode FW
> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> or
> qemu-system-riscv64 -bios none \
> -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
>
> 2) pflash0 containing S-mode payload like EDK2
> qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machine  virt
> or
> qemu-system-riscv64 -bios <opensbi_fw> \
> -pflash <smode_fw_code> \
> -pflash <smode_vars> \
> -machine  virt
> or
> qemu-system-riscv64 -bios <opensbi_fw> \
> -drive file=<smode_fw_code>,if=pflash,format=raw,unit=0,readonly=on \
> -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=1 \
> -machine virt

I wanted to test this, both directly with QEMU and through libvirt,
but I'm hitting two roadblocks.

First off, the only RISC-V edk2 build readily accessible to me (from
the edk2-riscv64 Fedora package) is configured to work off a R/W
pflash1. You said that you have edk2 patches making R/O CODE pflash0
and R/W VARS pflash1 ready. Any chance you could make either the
build output, or the patches and some hints on how to build edk2
after applying them, somewhere?

Going further and testing libvirt integration. After hacking around
other issues, I finally stumbled upon this error:

  qemu-system-riscv64: Property 'virt-machine.pflash0' not found

This is because a few years back libvirt has stopped using -drive
if=pflash for configuring pflash devices, and these days it generates
something along the lines of

  -blockdev '{"driver":"file","filename":"...","node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unmap"}'
  -blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"driver":"raw","file":"libvirt-pflash0-storage"}'
  -machine virt,pflash0=libvirt-pflash0-format

instead, which both aarch64/virt and x86_64/q35 machine types are
perfectly happy with.

I've tried to patch hw/riscv/virt.c to get the above working, and
almost managed to succeed :) but eventually my unfamiliarity with the
internals of QEMU caught up with me. Can you please look into making
this work?

Thanks!

-- 
Andrea Bolognani / Red Hat / Virtualization


