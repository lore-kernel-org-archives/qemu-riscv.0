Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0AFC7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7L6n-0005Fw-Fi; Thu, 08 Jun 2023 15:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1q7L6l-0005FC-PD
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 15:15:43 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1q7L6k-0007h0-03
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 15:15:43 -0400
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-33b22221da6so4459985ab.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 12:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686251740; x=1688843740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnuCWlLeGXkXzjrAZSc98CK+vugpSfbrMYt9DNWRMOE=;
 b=R8hav3WeeuruRK6RL82RDvbXPIjDsS+BNE1jdewYhNX+Cmxk5H5qZirjQXawITG2yF
 BrQ+KQsTQj6D5OyudsXM/NXCpoSRMO8dgbIVDyyVh/1+4O6HgtAVjLzwbH7PqX/0bg8O
 Exlz/XoEDop2IdW8uISp8DAbMtstt9hTIV8AFUJPbOCibzLdcke3mDd1EoNgiF7kBmhK
 b23gyRFvFaQ6079T4ZLbpgShu8sc31VosbHXoxyAViVCQ0u6x9mhdgP+gEIVuLd4sDLP
 LuZlTxm47a+C+guzQgRvJUYoaXTtaXHjJP1UJnA+fow1zfxt74b6mxZO/KbosCe5XUxR
 TqiA==
X-Gm-Message-State: AC+VfDxa7dKZ5DYN5BM8TwR8s51/pZfbEjueqWWzlBwgvx+tp/xFEO+K
 BBEaO0xzXY4e6unH/0QFoQ==
X-Google-Smtp-Source: ACHHUZ6vUrRrwwLFM+Hb3/loXcNPujVf20GEn/2hSQYhDLxez4ApnNr9gWsyMTIlALZzM/ichJLIqA==
X-Received: by 2002:a92:90c:0:b0:33b:ea2:fe6c with SMTP id
 y12-20020a92090c000000b0033b0ea2fe6cmr10362873ilg.24.1686251740495; 
 Thu, 08 Jun 2023 12:15:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a02caa5000000b0040908cbbc5asm464387jap.68.2023.06.08.12.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 12:15:39 -0700 (PDT)
Received: (nullmailer pid 3254644 invoked by uid 1000);
 Thu, 08 Jun 2023 19:15:37 -0000
Date: Thu, 8 Jun 2023 13:15:37 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Sean Anderson <sean.anderson@seco.com>,
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>,
 palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
 Leo <ycliang@andestech.com>, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230608191537.GA3233857-robh@kernel.org>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
 <20230530-duller-reset-a34ae111f207@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530-duller-reset-a34ae111f207@wendy>
Received-SPF: pass client-ip=209.85.166.173;
 envelope-from=robherring2@gmail.com; helo=mail-il1-f173.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, May 30, 2023 at 03:12:12PM +0100, Conor Dooley wrote:
> On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> > On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> 
> > > 
> > > Why not just have something like
> > > 
> > > mycpu {
> > > 	...
> > > 	riscv,isa {
> > > 		i;
> > > 		m;
> > > 		a;
> > > 		zicsr;
> > > 		...

I prefer property names be globally unique. The tools are geared towards 
that too. That's largely a symptom of having 0 type information in the 
DT.

For example if you had an extension called 'reg', it would be a problem.

> > > 	};
> > > };
> >
> > Naming of the node aside (perhaps that could be riscv,isa-extensions)
> > there's not something hitting me immediately as to why that is a no-no.
> > If the size is a concern, this would certainly be more efficient & not
> > like the probing would be anything other than trivial more difficult
> > what I have in my proposal.
> 
> Having started messing around with this, one of the main advantages, to
> me, of this approach is proper validation.
> cpus.yaml has additionalProperties: true in it, which would have had to
> be sorted out, or worked around, but creating a child-node with the
> properties in it allows setting additionalProperties: false.

That's an issue on my radar to fix. I started that for the Arm cpus.yaml 
a while back. Sadly it involves adding all the misc properties vendors 
added. It's not a lot, but still better to get in front of that for 
Risc-V.

> > Rob's AFK at the moment, and I was hoping that he would take a look at
> > the idea, so I won't respin til he is back, but I'll give this a go in
> > the interim.
> 
> Mechanically, the conversion of the patch isn't difficult, but I'll still
> wait for Rob to come back before sending a v2. But that v2 will more
> than likely implement your suggestion.

I haven't read the whole thread, but the initial proposal looks okay to 
me.

Another way you could do this is a list of strings:

riscv,isa-ext = "i", "m", "zicsr";

I think we have a helper to test is a string in the list.

Rob

