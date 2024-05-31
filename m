Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24CFC25B7E
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 May 2024 13:19:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sD29F-0004jE-Og; Fri, 31 May 2024 09:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sD29E-0004ir-KL
 for qemu-riscv@nongnu.org; Fri, 31 May 2024 09:18:20 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sD29C-0000e9-TZ
 for qemu-riscv@nongnu.org; Fri, 31 May 2024 09:18:20 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f60a502bb2so15452935ad.3
 for <qemu-riscv@nongnu.org>; Fri, 31 May 2024 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1717161497; x=1717766297; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RRbOq4KpbT+DnehSKJ61qjKdLRLWoT1dRUVpHSlMKQI=;
 b=GIpG6i4iL9pWIsXvwyaiJ82mYvOso4/r5Lx2+mahHrEBInAOrwgZ6toJBbM2IjnNzZ
 fxt79u1KKT7KY4/78/RgZ2StGGcKCsNh79jf8oFhsImTJKM9sVRUmX6OdvMkJ72KiR9y
 K5tlDSDLTab6R+GO8irtRtezj/3PIfyW4imOTWjBoC5Zi8FSe5Ujkz1MLaRYSOeAVaMJ
 at5h/u8Fi5dBpjbJrBxU6kT3gbbY3WHUJLrja8deNY1Yle7IyxsLtPRdu6MyflFTy+2d
 y4ld/+iq5Z06u1jvtK5wlO1ePQivg+3XSdWadlATiyUwukIasSnoq74UwWbioOCeVA7t
 SBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717161497; x=1717766297;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRbOq4KpbT+DnehSKJ61qjKdLRLWoT1dRUVpHSlMKQI=;
 b=sf0wQv6N1clEzkQlseqOhnUmRVRH/2nVHzrzLFHvHsvSmVIGUhdjFV7itec7qLftsu
 DHDiDk9V7vYNMNabG/9XA9chDOovOrGUDB3/DLmJcXkUAhV9IBdB1esOUodB8wZwzSgR
 GgkQFrFbTVjdPooIECDAg4ugkhV3pNNHbMgTsNPkMP1MpwvLaXpdz+LkH6Y/fgrTmP8P
 nUiEvyCGehhMO0QikS/pMiDbjKuhoTfpSp83G9ut3oRB1+8kVGjerhiQe2cEti8RVEGD
 AUKXSN+nrRSd4RbXefyRDD1LxQgmNwvm83qzVLcPqBwOgGI1ES3XbVQBKC3itlgkvwlC
 a8wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Mq2qGh66YYCTh8rP7gmZGgWeAqmBwYpkhrV6iA+hU899lNGRoyYbJjQdsmFQ4WDknV5eNWHB1L8+YDa+CYB24SZpUl4=
X-Gm-Message-State: AOJu0YxplPFWalEZegP2bwPW8cEpEAItvoAJY8YApvK90dPzIAmubNr1
 V/AHIFcIiLORgD3b2q64H4f9FTHAt1skGkkv2jg0nFSWECAJY+FYV5d13zbY7A0=
X-Google-Smtp-Source: AGHT+IGCD3DFFjsCMKVdr2qtZctoWnLAltve+X4lmQVPcbxeflcEJiKtpTcNhsAnH7oipaqSH2oCXw==
X-Received: by 2002:a17:902:e84a:b0:1f4:960c:a05a with SMTP id
 d9443c01a7336-1f6370cea67mr15796015ad.48.1717161496628; 
 Fri, 31 May 2024 06:18:16 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63237d9c3sm16255135ad.116.2024.05.31.06.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 06:18:16 -0700 (PDT)
Date: Fri, 31 May 2024 18:48:06 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v4 0/3] hw/riscv/virt: pflash improvements
Message-ID: <ZlnODgN5wbKgqY9F@sunil-laptop>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
 <CABJz62MFZzx3jBgW6TtGFD9emY+DAbbftSybD8ZouC65n3-auA@mail.gmail.com>
 <20230526-b0d8b56e9688dea7ae9d00d5@orel>
 <CABJz62Nk-U+qHQjn6G2-bN8i9RcMEZWdYTyi7wqC=7BVjDSBWQ@mail.gmail.com>
 <20230526-e398cfda73f326653323ea68@orel>
 <CABJz62PXvVNEwpqUz0dUUYTAGjmNU4h0NtFf664oubaJmKxwKw@mail.gmail.com>
 <20230526-cbbe3fe3734dc64264a2ad83@orel>
 <CABJz62N3tBpCtLmQmnYzLHnUNRZcxOxn2iLzPu=V3THVpp698g@mail.gmail.com>
 <ZVtu44sFAQeWxGjO@sunil-laptop>
 <CABJz62PXn7g+Qa5kUsrYYAO3_pqVHwpk0z2DLpgq2pspBA4biQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62PXn7g+Qa5kUsrYYAO3_pqVHwpk0z2DLpgq2pspBA4biQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 30, 2024 at 04:37:56AM -0700, Andrea Bolognani wrote:
> On Mon, Nov 20, 2023 at 08:06:19PM GMT, Sunil V L wrote:
> > On Mon, Nov 20, 2023 at 02:29:28PM +0000, Andrea Bolognani wrote:
> > > On Fri, May 26, 2023 at 11:10:12AM +0200, Andrew Jones wrote:
> > > > > > > So, are edk2 users the only ones who would (temporarily) need to
> > > > > > > manually turn ACPI off if virt-manager started enabling it by
> > > > > > > default?
> > > > > >
> > > > > > I assume so, but I'm not tracking firmware status. If the firmware
> > > > > > doesn't extract the ACPI tables from QEMU and present them to the
> > > > > > guest (afaik only edk2 does that), then the guest kernel falls back
> > > > > > to DT, which is why it's working for you.
> > > > > >
> > > > > > I suppose we should wait until Linux merges the ACPI patches, before
> > > > > > adding RISC-V to the libvirt capabilities ACPI list.
> > > > >
> > > > > That sounds reasonable to me, but note that 1) the libvirt change
> > > > > might take a while to propagate to distros and 2) someone will have
> > > > > to remind me to prepare such a patch when the time comes ;)
> > > >
> > > > Initial ACPI support will probably be merged for 6.4. So maybe it is
> > > > time to get the libvirt side of things going.
> > >
> > > Randomly remembered about this. Did ACPI support make it into 6.4
> > > after all? Is now a good time to change libvirt?
> >
> > Hi Andrea,
> >
> > Not yet. While basic ACPI changes are merged, the interrupt controller
> > support is still going on. Looks like it will take few merge windows to
> > get ACPI fully supported. So, we still need to wait for libvirt change.
> 
> Hey,
> 
> I've been working on making RISC-V support a bit smoother across the
> virtualization stack recently, and I just so happened to remember
> that this topic was still pending.
> 
> I've tried manually switching ACPI on for an existing Fedora RISC-V
> guest running under TCG and booting via UEFI, which promptly made it
> stop working, so I assume the necessary bits haven't made it into the
> kernel yet.
> 
> Is anyone actually tracking that work? We've been waiting for it to
> land for a fairly long time at this point...
> 
Hi Andrea,

It is still WIP. DT patches (which was a dependency for ACPI)  for AIA
interrupt controllers got merged recently and available in 6.10-rc1. So,
I hope ACPI patches will be merged within next couple of merge windows
provided maintainers of different subsystems will have sufficient time
to review.

Thanks,
Sunil

