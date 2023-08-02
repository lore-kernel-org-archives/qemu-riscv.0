Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EE8C001E0
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 13:46:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRCBS-0004CF-2a; Wed, 02 Aug 2023 09:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qRCBJ-0004BJ-Ne
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 09:46:36 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qRCBH-0002Pp-N7
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 09:46:29 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686b643df5dso4882740b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Aug 2023 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690983986; x=1691588786;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mC8du2DgPxz1Nu+nriIIQGArLCo5/fFdCVdDOOMiBAg=;
 b=LBYjmXJ3aCwkXBHzAUiIPe1vdOKxVefkWxNG6s9gixTb+5GE3Piq9567VuSMuRHLld
 DSQmMBVvhbk3Befdyh9GQFYPDmuxBMw6F02e9tWi5zaRGXjX1B72lPgRe9mL41NSoHwq
 +4OS3wpHaTg+umfkyBjxKpmAqBocB6+uG2n43csysY6Y2ZOL9mQEqwuB0BvU9X/vwRFV
 /NlZPoBCFTwQ9BtMnJMiNQ15DQpZw7EZoGNWSK1tFVeevfLI6sUZ1aLQ3HOeOCQD6WS8
 VF16MoNLNZxwfhZjZyJ+vTRAjOZOORE1ZW1fKutjShZAvEjtv/jpoIRWiMuhVRyOHSG9
 B54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690983986; x=1691588786;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mC8du2DgPxz1Nu+nriIIQGArLCo5/fFdCVdDOOMiBAg=;
 b=f5ufcNqsgO2cbSsWXSXSNDSt5382MC57bP0gPgIIYKBm99DiBd8AkG8pEtdki+hy1/
 HYNzlRIBneRoEfKaK/YgEKIfQM1USyl6KrMTd4e1wLS124eRJqa2YH7aaSYOTmFEmSD/
 13P4lHcMzCnhlsxW9jL52J2LQdhEOsrBpc7+IZUlhsh6T6RSKdvLypFcfJLVjev3vJH5
 UbHwkU2ZFzhSnD1/OKkOm5HJnGRc082WoJogmE3VygJVUAP3wjWH7PEwCefOvSZsG+Pi
 RMyApARfBnUTrT88NRiOgHseC9kekxu5kuvfhQy38bFUuhzDHmQsHvR7J8HjPurbJL9k
 R/+A==
X-Gm-Message-State: ABy/qLZPRtiWjpctW8LljiooTiXdYGWqUxDSxFsEQRtGIy0kLFTUzUxY
 tuk8vMVpQNJ2pY6l1dWThHrX7w==
X-Google-Smtp-Source: APBJJlFr5Ph8TGG2/wGcJ01ypkYcVSq+7tTwZb4OXgaUXW+k9o7duTzc4HI9/oFIcyzIb8SS2roGag==
X-Received: by 2002:a05:6a20:8f06:b0:13e:7a0a:36d8 with SMTP id
 b6-20020a056a208f0600b0013e7a0a36d8mr6073037pzk.9.1690983985489; 
 Wed, 02 Aug 2023 06:46:25 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.143])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a170902d71800b001b8052d58a0sm12423052ply.305.2023.08.02.06.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 06:46:25 -0700 (PDT)
Date: Wed, 2 Aug 2023 19:16:18 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Lilly Anderson <fermium@anarchist.gay>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 1/1] Added support for the MMU node in the RHCT
Message-ID: <ZMpeKg/xdjs96v26@sunil-laptop>
References: <20230731220959.4142636-1-fermium@anarchist.gay>
 <20230731220959.4142636-2-fermium@anarchist.gay>
 <CAKmqyKM2y0ogGUjFEe5OxhwxbjguFuvYHxSX=EdKcWtOc37o+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKM2y0ogGUjFEe5OxhwxbjguFuvYHxSX=EdKcWtOc37o+A@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42d.google.com
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

Hi Lilly,

I have already sent patch series [1] which includes MMU node patch [2].
I am preparing v2 of that series based on the feedback I received. 

[1] - https://lists.gnu.org/archive/html/qemu-devel/2023-07/msg02657.html
[2] - https://lists.gnu.org/archive/html/qemu-devel/2023-07/msg02667.html

Thanks,
Sunil
On Wed, Aug 02, 2023 at 09:37:40AM -0400, Alistair Francis wrote:
> On Mon, Jul 31, 2023 at 6:22 PM Lilly Anderson <fermium@anarchist.gay> wrote:
> >
> 
> Hello,
> 
> Thanks for the patch.
> 
> Do you mind writing a commit message here. You will also need to
> include a signed-off-by line, see
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line
> 
> > ---
> >  hw/riscv/virt-acpi-build.c | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > index 7331248f59..cb36e52169 100644
> > --- a/hw/riscv/virt-acpi-build.c
> > +++ b/hw/riscv/virt-acpi-build.c
> > @@ -119,7 +119,8 @@ static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> >  /*
> >   * ACPI spec, Revision 6.5+
> >   * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
> > - * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
> > + * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/18
> > + *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view
> >   *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
> >   */
> >  static void build_rhct(GArray *table_data,
> > @@ -133,6 +134,7 @@ static void build_rhct(GArray *table_data,
> >      uint32_t isa_offset, num_rhct_nodes;
> >      RISCVCPU *cpu;
> >      char *isa;
> > +    uint8_t mmu_type;
> >
> >      AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> >                          .oem_table_id = s->oem_table_id };
> > @@ -145,8 +147,8 @@ static void build_rhct(GArray *table_data,
> >      build_append_int_noprefix(table_data,
> >                                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, 8);
> >
> > -    /* ISA + N hart info */
> > -    num_rhct_nodes = 1 + ms->smp.cpus;
> > +    /* ISA + MMU + N hart info */
> > +    num_rhct_nodes = 2 + ms->smp.cpus;
> 
> I think it's worth adding a comment that we aren't including CMO, as
> the spec says:
> 
> "and at least one CMO node for systems with harts implementing CMO extensions."
> 
> Alistair
> 
> >
> >      /* Number of RHCT nodes*/
> >      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> > @@ -174,6 +176,15 @@ static void build_rhct(GArray *table_data,
> >          build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
> >      }
> >
> > +    /* MMU Node */
> > +    build_append_int_noprefix(table_data, 2, 2); /* Type 2 */
> > +    build_append_int_noprefix(table_data, 8, 2); /* Length */
> > +    build_append_int_noprefix(table_data, 1, 2); /* Revision */
> > +    build_append_int_noprefix(table_data, 0, 1); /* Reserved */
> > +
> > +    mmu_type = satp_mode_max_from_map(riscv_cpu_cfg(&cpu->env)->satp_mode.map) - 8;
> > +    build_append_int_noprefix(table_data, mmu_type, 1); /* MMU Type */
> > +
> >      /* Hart Info Node */
> >      for (int i = 0; i < arch_ids->len; i++) {
> >          build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
> > --
> > 2.41.0
> >
> > Signed-off-by: Lilly Anderson <fermium@anarchist.gay>
> >

