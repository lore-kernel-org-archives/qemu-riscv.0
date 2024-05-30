Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2FAC25B74
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:07:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sCdcZ-0002qB-Cy; Thu, 30 May 2024 07:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sCdcX-0002pB-BI
 for qemu-riscv@nongnu.org; Thu, 30 May 2024 07:06:57 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sCdcV-0007pM-4c
 for qemu-riscv@nongnu.org; Thu, 30 May 2024 07:06:56 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a63036f2daaso72508966b.1
 for <qemu-riscv@nongnu.org>; Thu, 30 May 2024 04:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1717067213; x=1717672013; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C9CGS/c928zRamEAYRhTymrG75j2iqyHGXJh51KnNbw=;
 b=le3xn7MeafAurQ7KGsRqoO0yMhtplvdIyU6LeqX2tWjUZYrFNfbops2nFXNhByaSM3
 Tdg8S6RXIdx9hHfJbCORMoGcmwlIe2Q7j8cassNJm4Tc+QDe9mc4cjLRqCilJoSbsgXJ
 Xbm1/a8XyLO6VSbGss20QlHhmPbVN0Hwn1uYPw5U1By7E4GabbxaZauOqUwQYTMGiLmt
 VVltU5fiZe8ePKH+qL1/D8LKKgvGfgdsI1XwfpMvX3Pa92Qhwd9sQm/+VYjj9sMH+DDK
 kwg7gYP7zYJNCToHV6pYWBlEY6fVj9ewM+VCsZ5tP3SPIVVKpf4mIoiwAtTUzihrrLby
 IDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717067213; x=1717672013;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C9CGS/c928zRamEAYRhTymrG75j2iqyHGXJh51KnNbw=;
 b=qoHqSjcKiBrCQkvZPnw4sUA7owCSYB3rdLd7Bckj/nyyRwklCb9ZEgCFfL0Suwtb8v
 EDT+yqBXgg9wXIWWI0FIo3csrGdGp3cSvVgKb8al72SyL3r1BsLuLkJB1ZP346vYnRTG
 tjaSOet10eAl9VuNUFhyAbAPXn/YzKm10YJw+pg+VFidFE435yN6Wwr2d/VkHIrN5vdD
 DuBDxApYV6nPUa5NS++hfVVJ5/3XyJ+Tt614dzSjAFzdZAq7jdcMIy44QkJ0aFU/39gd
 3QzEMjtNdr+n/st+qK0R+33KuW7YzpNfCeBTWBLL5Gv+gmUTRbZj7OY+L85sD9HHEsHd
 VLAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF6KZ3Q/xSUHB1IDvAUKnaoTBukQ6eLRBlOcWoRlHyBZRM9sZl8JJt4lenXkxvve4F7akrIbFtTXGtADW4DOqDJmd/7NM=
X-Gm-Message-State: AOJu0YzUpuKcCxWZmNU0UhBDr9rKeUQSJJqUeVHQlQh76WD7nbbpaL2r
 JYC3L9div/rXhAPoqb8amorThrhJKU5ZaRJs8OnrEv17smE5egEG6v3K99efkEQ=
X-Google-Smtp-Source: AGHT+IEpLAHNq1uX6YUfeu/0H+tUYuAhrCpfScPXyaoUel0sstQnGR/me68a1CPPmrzRAxWNWP2dsQ==
X-Received: by 2002:a17:906:614c:b0:a59:c367:560c with SMTP id
 a640c23a62f3a-a65e924e859mr108429066b.60.1717067213463; 
 Thu, 30 May 2024 04:06:53 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a637f135292sm189180966b.79.2024.05.30.04.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 04:06:53 -0700 (PDT)
Date: Thu, 30 May 2024 13:06:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, conor@kernel.org
Subject: Re: [PATCH] hw/riscv/virt.c: add address-cells in
 create_fdt_one_aplic()
Message-ID: <20240530-2a3bc2792856d6c4bcf18269@orel>
References: <20240530084949.761034-1-dbarboza@ventanamicro.com>
 <20240530-45111cf8b1ee719f055d234f@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-45111cf8b1ee719f055d234f@orel>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62c.google.com
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

On Thu, May 30, 2024 at 01:05:41PM GMT, Andrew Jones wrote:
> On Thu, May 30, 2024 at 05:49:49AM GMT, Daniel Henrique Barboza wrote:
> > We need #address-cells properties in all interrupt controllers that are
> > referred by an interrupt-map [1]. For the RISC-V machine, both PLIC and
> > APLIC controllers must have this property.
> > 
> > PLIC already sets it in create_fdt_socket_plic(). Set the property for
> > APLIC in create_fdt_one_aplic().
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/CAL_JsqJE15D-xXxmELsmuD+JQHZzxGzdXvikChn6KFWqk6NzPw@mail.gmail.com/
> 
> There are other issues[2] with the DT nodes that we should address at the
> same time.
> 
> [2] https://lore.kernel.org/all/20240529-rust-tile-a05517a6260f@spud/

I meant to CC Conor. Doing that now.

> 
> Thanks,
> drew
> 
> > 
> > Suggested-by: Anup Patel <apatel@ventanamicro.com>
> > Fixes: e6faee65855b ("hw/riscv: virt: Add optional AIA APLIC support to virt machine")
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >  hw/riscv/virt.c         | 2 ++
> >  include/hw/riscv/virt.h | 1 +
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 4fdb660525..1a7e1e73c5 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -609,6 +609,8 @@ static void create_fdt_one_aplic(RISCVVirtState *s, int socket,
> >      aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
> >      qemu_fdt_add_subnode(ms->fdt, aplic_name);
> >      qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,aplic");
> > +    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "#address-cells",
> > +                          FDT_APLIC_ADDR_CELLS);
> >      qemu_fdt_setprop_cell(ms->fdt, aplic_name,
> >                            "#interrupt-cells", FDT_APLIC_INT_CELLS);
> >      qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index 3db839160f..c0dc41ff9a 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -118,6 +118,7 @@ enum {
> >  #define FDT_PLIC_ADDR_CELLS   0
> >  #define FDT_PLIC_INT_CELLS    1
> >  #define FDT_APLIC_INT_CELLS   2
> > +#define FDT_APLIC_ADDR_CELLS  0
> >  #define FDT_IMSIC_INT_CELLS   0
> >  #define FDT_MAX_INT_CELLS     2
> >  #define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
> > -- 
> > 2.45.1
> > 
> > 

