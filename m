Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC103C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:34:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1sND-0006Xn-Bj; Wed, 24 May 2023 13:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q1sNC-0006XW-87
 for qemu-riscv@nongnu.org; Wed, 24 May 2023 13:34:06 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q1sNA-0000vq-B6
 for qemu-riscv@nongnu.org; Wed, 24 May 2023 13:34:05 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-19eb96bffd4so441691fac.3
 for <qemu-riscv@nongnu.org>; Wed, 24 May 2023 10:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684949643; x=1687541643;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J6uurwhdS1tAGL88aqbDQIwPwYgD8XlWB9Zap1H1tkA=;
 b=IX/MljTbweQfkzZRfJYPnyjNQI31oubu3v72PbkAFSuPGZfjx9bT9UD6qzPuuWthVv
 L+5ONXTU09diBizEZ8zWs7ZJpLFlFL9XsFgNedbEAW1i9S06vA7SR9OpXnMixiNFyvUG
 cVqqwdqJ3qOqp+5TCYFjLNZCo9HFOuyaLm6QS7+BM9SkbmhX+ki0168TXICFOeWr7YEz
 mLz9dkWBUakHXmUKLnPomQFzZU2EB50OiIyH099EXhf00AJXR3PxUs5Cgj7Z8+8Swjlg
 iBTzRgGEcLGvDcZbQejoiITMKlywl2aILy8PS9n5Nd+Me5RGC+PlLeZrPLbSiyyHDlrB
 D+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684949643; x=1687541643;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6uurwhdS1tAGL88aqbDQIwPwYgD8XlWB9Zap1H1tkA=;
 b=LIqOQ5rJrrGUVX5NJFs+lDbxUUg38Mgyx3FRwKrg+4ENCAWtdUkzz27uP+gc+Qv7ic
 O9nCDe69ZwYL4UVHp+JkhWVvy4ixvuGfwr2rs4+kvLqtofz+PqOeP9MsK7PYGr5Rv+Sw
 ggI9LGfnrMhoeMKfNXMyRtgzmbKGLzwKBgKyQkh5KaHvMXSVswHuAcqX3mHcLftk33N8
 SdRB03qmhUqAEwkNw89+tnSU6Tw30X1ZDf9PjZ4VSBq3tDWQdfqcNO3ar6b8A9gx05rq
 ZjAsvZRc/Rp6F9XIAqAeteWeBp3JBh+dpB2Demn42O2vm946oLriH4YFiDzLmzB5baVk
 aYqA==
X-Gm-Message-State: AC+VfDxsrdr3Tiw1XyBw772mCMTdx1H7avaoWLEj4lvXcCd1A03EEPXB
 UjWZ0jcP5L0NY+OwcMCT8qcU7A==
X-Google-Smtp-Source: ACHHUZ6v8Lw8gRSW3Zty2h87yJdCKEt+bAx1RT7lcgIavY6ZwgFfV+2uCEmAUbsh7q3hwL/q3DIqJQ==
X-Received: by 2002:a05:6870:7727:b0:196:60e0:13cb with SMTP id
 dw39-20020a056870772700b0019660e013cbmr296195oab.27.1684949642936; 
 Wed, 24 May 2023 10:34:02 -0700 (PDT)
Received: from sunil-laptop ([106.51.186.3]) by smtp.gmail.com with ESMTPSA id
 hm14-20020a0568701b8e00b0018e96ef6e93sm142469oab.54.2023.05.24.10.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 10:34:02 -0700 (PDT)
Date: Wed, 24 May 2023 23:03:52 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH v3] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Message-ID: <ZG5KgLQ4H/leWKJi@sunil-laptop>
References: <20230523102805.100160-1-sunilvl@ventanamicro.com>
 <CABJz62MQ5uRHUP4LLKt=AxTf-Sz0aTEOLWDz=9ftK=H3tZ9JUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62MQ5uRHUP4LLKt=AxTf-Sz0aTEOLWDz=9ftK=H3tZ9JUg@mail.gmail.com>
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Andrea,

On Wed, May 24, 2023 at 03:50:34PM +0000, Andrea Bolognani wrote:
> On Tue, May 23, 2023 at 03:58:05PM +0530, Sunil V L wrote:
> > Currently, virt machine supports two pflash instances each with
> > 32MB size. However, the first pflash is always assumed to
> > contain M-mode firmware and reset vector is set to this if
> > enabled. Hence, for S-mode payloads like EDK2, only one pflash
> > instance is available for use. This means both code and NV variables
> > of EDK2 will need to use the same pflash.
> >
> > The OS distros keep the EDK2 FW code as readonly. When non-volatile
> > variables also need to share the same pflash, it is not possible
> > to keep it as readonly since variables need write access.
> >
> > To resolve this issue, the code and NV variables need to be separated.
> > But in that case we need an extra flash. Hence, modify the convention
> > such that pflash0 will contain the M-mode FW only when "-bios none"
> > option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> > This enables both pflash instances available for EDK2 use.
> >
> > Example usage:
> > 1) pflash0 containing M-mode FW
> > qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> > or
> > qemu-system-riscv64 -bios none \
> > -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
> >
> > 2) pflash0 containing S-mode payload like EDK2
> > qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machine  virt
> > or
> > qemu-system-riscv64 -bios <opensbi_fw> \
> > -pflash <smode_fw_code> \
> > -pflash <smode_vars> \
> > -machine  virt
> > or
> > qemu-system-riscv64 -bios <opensbi_fw> \
> > -drive file=<smode_fw_code>,if=pflash,format=raw,unit=0,readonly=on \
> > -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=1 \
> > -machine virt
> 
> I wanted to test this, both directly with QEMU and through libvirt,

Thank you very much for helping with this!

> but I'm hitting two roadblocks.
> 
> First off, the only RISC-V edk2 build readily accessible to me (from
> the edk2-riscv64 Fedora package) is configured to work off a R/W
> pflash1. You said that you have edk2 patches making R/O CODE pflash0
> and R/W VARS pflash1 ready. Any chance you could make either the
> build output, or the patches and some hints on how to build edk2
> after applying them, somewhere?
> 
Please build EDK2 using the branch
https://github.com/vlsunil/edk2/tree/separate_code_vars.

The instructions to build is in
https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support#build-edk2

However, now it will create two images for code and vars.

> Going further and testing libvirt integration. After hacking around
> other issues, I finally stumbled upon this error:
> 
>   qemu-system-riscv64: Property 'virt-machine.pflash0' not found
> 
> This is because a few years back libvirt has stopped using -drive
> if=pflash for configuring pflash devices, and these days it generates
> something along the lines of
> 
>   -blockdev '{"driver":"file","filename":"...","node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unmap"}'
>   -blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"driver":"raw","file":"libvirt-pflash0-storage"}'
>   -machine virt,pflash0=libvirt-pflash0-format
> 
> instead, which both aarch64/virt and x86_64/q35 machine types are
> perfectly happy with.
> 
> I've tried to patch hw/riscv/virt.c to get the above working, and
> almost managed to succeed :) but eventually my unfamiliarity with the
> internals of QEMU caught up with me. Can you please look into making
> this work?
> 
Thanks!. This needs some investigation. Let me look into supporting
this.

Thanks!
Sunil

