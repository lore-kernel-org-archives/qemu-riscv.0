Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B632BC5AD4C
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 14:36:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r55O4-000103-W4; Mon, 20 Nov 2023 09:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1r55O4-0000zL-9N
 for qemu-riscv@nongnu.org; Mon, 20 Nov 2023 09:36:32 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1r55O2-0003Zf-Nu
 for qemu-riscv@nongnu.org; Mon, 20 Nov 2023 09:36:32 -0500
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3b2f507c03cso2583486b6e.2
 for <qemu-riscv@nongnu.org>; Mon, 20 Nov 2023 06:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700490989; x=1701095789; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EPFRyXR3cbfHUYFBjvmXjpk69SdGtoR05Bw7MVnbuMo=;
 b=HIv4JWeSVeipYDdBLjkpx3oai+unl7Bkp1hLzIiQWJC+FNYgGDHt4SDkBEdkPDqNbQ
 TR/L0Iumh0UpSQE1mzIobYLrX6vY9w548IiufkCIDQF+Hr5X+CKBSy1PoPPQTEGyuKG8
 9q49EhB2YQZ264ATXRtePZKtOyGKR568hzJBJT6YioPNCMy0o8GWijjmC9mnsAY6eH2y
 VgUN5JVy4tNqmiqY9yG6tsOevL/MA+Cf52U9RTFf8vqXZktZLQCLKzGUNp70w4tstyZP
 lbdyEpjGWM4c2EnAvHzU7hN0MmHCog/dQ9Qa/dwg3K7+PN9ojeuLlejHiqpkMoHSPzFS
 dt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700490989; x=1701095789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPFRyXR3cbfHUYFBjvmXjpk69SdGtoR05Bw7MVnbuMo=;
 b=iUFDOKJaLEB8hLxmGCiCtYeP83IAa/AQsg/64cwufQjaR09diYJSkvX9xyX5mM+p90
 X0OiKYx5EvSrYwGxrZxmSZsaR7pPxtp4rREDbbwHrneAMB/233FYv1JCfIiPg14mdvx0
 50VIg4mUM3RRB0OwC2emT0N9njltEfCxLLHv040U82yZtQZ3n6F7tpcocOnuG+izlvf2
 7QFC0oHA/YEeOOidzY/sCSnJKt42MC2Qad5zJcqi0uOF8+d4Z2pMjjRsautH9wetk0GT
 lNANcn22U+b7wgb6U8zWdZ43b6GoiTDpzkki9/FxetP75/OGSkUbvU86NQ0mI5557NUM
 99og==
X-Gm-Message-State: AOJu0YzsIPRUU2MLGN9zmm1JyZQYZ4azYc8qV14dk8pZe1Y/rW973uOF
 el5YLp45Uq+V8eZ1qdtLkegFSQ==
X-Google-Smtp-Source: AGHT+IFePPFdx2binXkRwuMVNFnSS0ewm6KM814ZFlGB6TjEYDK4l2tMa0m0nql+mcUe1LrH7GM5FA==
X-Received: by 2002:a05:6808:1a09:b0:3b2:ef9c:d1b1 with SMTP id
 bk9-20020a0568081a0900b003b2ef9cd1b1mr9665527oib.6.1700490988988; 
 Mon, 20 Nov 2023 06:36:28 -0800 (PST)
Received: from sunil-laptop ([106.51.191.97]) by smtp.gmail.com with ESMTPSA id
 dd1-20020a056808604100b003a747ea96a8sm1271035oib.43.2023.11.20.06.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 06:36:28 -0800 (PST)
Date: Mon, 20 Nov 2023 20:06:19 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v4 0/3] hw/riscv/virt: pflash improvements
Message-ID: <ZVtu44sFAQeWxGjO@sunil-laptop>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
 <CABJz62MFZzx3jBgW6TtGFD9emY+DAbbftSybD8ZouC65n3-auA@mail.gmail.com>
 <20230526-b0d8b56e9688dea7ae9d00d5@orel>
 <CABJz62Nk-U+qHQjn6G2-bN8i9RcMEZWdYTyi7wqC=7BVjDSBWQ@mail.gmail.com>
 <20230526-e398cfda73f326653323ea68@orel>
 <CABJz62PXvVNEwpqUz0dUUYTAGjmNU4h0NtFf664oubaJmKxwKw@mail.gmail.com>
 <20230526-cbbe3fe3734dc64264a2ad83@orel>
 <CABJz62N3tBpCtLmQmnYzLHnUNRZcxOxn2iLzPu=V3THVpp698g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62N3tBpCtLmQmnYzLHnUNRZcxOxn2iLzPu=V3THVpp698g@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Nov 20, 2023 at 02:29:28PM +0000, Andrea Bolognani wrote:
> On Fri, May 26, 2023 at 11:10:12AM +0200, Andrew Jones wrote:
> > On Fri, May 26, 2023 at 04:42:57AM -0400, Andrea Bolognani wrote:
> > > On Fri, May 26, 2023 at 10:34:36AM +0200, Andrew Jones wrote:
> > > > On Fri, May 26, 2023 at 03:49:11AM -0400, Andrea Bolognani wrote:
> > > > > So, are edk2 users the only ones who would (temporarily) need to
> > > > > manually turn ACPI off if virt-manager started enabling it by
> > > > > default?
> > > >
> > > > I assume so, but I'm not tracking firmware status. If the firmware
> > > > doesn't extract the ACPI tables from QEMU and present them to the
> > > > guest (afaik only edk2 does that), then the guest kernel falls back
> > > > to DT, which is why it's working for you.
> > > >
> > > > I suppose we should wait until Linux merges the ACPI patches, before
> > > > adding RISC-V to the libvirt capabilities ACPI list.
> > >
> > > That sounds reasonable to me, but note that 1) the libvirt change
> > > might take a while to propagate to distros and 2) someone will have
> > > to remind me to prepare such a patch when the time comes ;)
> >
> > Initial ACPI support will probably be merged for 6.4. So maybe it is
> > time to get the libvirt side of things going.
> 
> Randomly remembered about this. Did ACPI support make it into 6.4
> after all? Is now a good time to change libvirt?
> 
Hi Andrea,

Not yet. While basic ACPI changes are merged, the interrupt controller
support is still going on. Looks like it will take few merge windows to
get ACPI fully supported. So, we still need to wait for libvirt change.

Thanks!
Sunil

