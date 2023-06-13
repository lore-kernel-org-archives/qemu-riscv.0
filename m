Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A869CC4321A
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:29:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9452-0004nK-2Q; Tue, 13 Jun 2023 09:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>) id 1q9450-0004mf-5R
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:29:02 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>) id 1q944w-0000f5-68
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:28:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7066A63630
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 13:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A8DC433F2
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686662928;
 bh=Tq282l+C2Dr1lf2RPS2aM+A8Oyr7+h44UW4Jg8xfhbs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V8LRmJ5Buk78hJTZnEqtHRQ+CwF/Bw+UL1K9p9ba0ig80aSc7qSXX4qKfIjOag6Eh
 KSMSZaE/y97KoCE9KKnFhVKMgak3mEmkONrx1Or1GcUbZaGkgczaknJsc1BHFxskux
 DQOdmZNKqZd3ENET9O9NsjYgLuo0YbsGDBfXdQZbchhU5omvebj43mlaRUOuNavrzg
 BPWXM9OsfyTPAqFi9ABEp0rIJmT7+voedQF9+p27g4wNHuPVutbAZhnzrSK6zTI6Pf
 dYzrJzUJ+lFdIMcM+aNeoZh9fIGypecs9nzgO98nz77hm8AUyfK781bnbkU1BgDaM+
 n4azFJf11z/6w==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b1ba50e50bso67499081fa.1
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 06:28:48 -0700 (PDT)
X-Gm-Message-State: AC+VfDyFkjGvEnpISp8e87Yp1o8ALqcVEXG+JxwzLDKCDTezta3bPUJF
 ZxRu5CUCzAmgVivt95bEL+4RdE7mBVGzoyPBwg==
X-Google-Smtp-Source: ACHHUZ7xEzfSwXxw+hZJuk+2aAUcZRqN2kDCLuPdkshb6lV2DAnOexM7QB+9J/ErB3X9G0jVZAtdNv9Xt6ie8WSLIls=
X-Received: by 2002:a2e:9595:0:b0:2b3:3de8:7330 with SMTP id
 w21-20020a2e9595000000b002b33de87330mr747015ljh.29.1686662926823; Tue, 13 Jun
 2023 06:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
 <20230530-duller-reset-a34ae111f207@wendy>
 <20230608191537.GA3233857-robh@kernel.org>
 <20230608-cobbler-giving-e0fac2185e11@spud>
 <20230612-relic-fetal-1beeae3455aa@spud>
In-Reply-To: <20230612-relic-fetal-1beeae3455aa@spud>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Jun 2023 07:28:34 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+CJ-mEcEujd5Sk4SLvgTfUX1A7NRXYcMDqkoViDYxTXw@mail.gmail.com>
Message-ID: <CAL_Jsq+CJ-mEcEujd5Sk4SLvgTfUX1A7NRXYcMDqkoViDYxTXw@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Sean Anderson <sean.anderson@seco.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>,
 palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Atish Patra <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Rick Chen <rick@andestech.com>, Leo <ycliang@andestech.com>, 
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, u-boot@lists.denx.de, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217; envelope-from=robh@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jun 12, 2023 at 3:23=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Rob,
> Before I press on with more versions...
>
> On Thu, Jun 08, 2023 at 08:30:28PM +0100, Conor Dooley wrote:
> > On Thu, Jun 08, 2023 at 01:15:37PM -0600, Rob Herring wrote:
> > > On Tue, May 30, 2023 at 03:12:12PM +0100, Conor Dooley wrote:
> > > > On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> > > > > On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> > > >
> > > > > >
> > > > > > Why not just have something like
> > > > > >
> > > > > > mycpu {
> > > > > >       ...
> > > > > >       riscv,isa {
> > > > > >               i;
> > > > > >               m;
> > > > > >               a;
> > > > > >               zicsr;
> > > > > >               ...
> > >
> > > I prefer property names be globally unique. The tools are geared towa=
rds
> > > that too. That's largely a symptom of having 0 type information in th=
e
> > > DT.
> > >
> > > For example if you had an extension called 'reg', it would be a probl=
em.
> >
> > Per the current ISA rules, that'd not be valid. But then again, I do
> > have trust issues & it's not like "reg" is the only property name in DT
> > land.
>
> ...you say "prefer" here. Is that a NAK, or a "you keep the pieces"?

Don't do the above node.

Rob

