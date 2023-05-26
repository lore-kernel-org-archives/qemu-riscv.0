Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD304C7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:39:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2R6Y-0005oQ-UJ; Fri, 26 May 2023 02:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q2R6X-0005o7-AO
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:39:14 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q2R6V-0003EM-Dv
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:39:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30a1fdde3d6so307750f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 23:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685083149; x=1687675149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rg5h60MxsWXjeHq2ug1lHuq21ZSxcL2rqfT4XQg3dsA=;
 b=XGx99UQNnv4fVF4zUa8e/ZIeNt5/e81R/MdiTqsfxlC6mg9VhLc5diHhOZDyQr3bXZ
 uxnnYSGnJ9q2xbMc9wjmrqkiFEfazUBCcaBzaSbVAa9UpZFdw0JDm8ScQcSCZm7UE0R1
 qaSEF+lcqob7pQFhprR8A1myCuQmSRZsgn/5333oP65hCpWb6qXPRj/W/A48peMpd20N
 m6FoTvYA5M89cdPEQ2VjFKKD7XXjj9YhkEyaycQ0EkUnMIlLX2xZMX8kC70PTfsAUKqw
 qyAVvIsMqmbFwIu/PHL6Nzev6FETz50btMAzaW9UiJjdNbPewOVI3c5oxIwue7yH2Ei7
 J2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685083149; x=1687675149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rg5h60MxsWXjeHq2ug1lHuq21ZSxcL2rqfT4XQg3dsA=;
 b=f+nh9pah1R8AYSqmE93ymUkqdjcsd5ylaj7IN4OmQpOS32bClO09oVWCKU3MZeyyGL
 zQAh0ULWaTj08Pj/4eSxPpx+lFcKa73UY3mGzAs+fgFcYaZXO21nSq2vw0QVtrwy3ILP
 jbSirRbSkbC1aGwkQM8etaglDOpU6PUkIvc88sSUyVhI2ZJclHqVbCofFtDNmHrAcPI1
 fzmRY8PWD7U0Kw1afMPyPm+RCIqMXvkj9j8s7u2i2glzwS/dDkclsiuWwfJ+jETFdLtH
 fU532fBaANAmyajDKINHFWkJM0vzNE0lNk9rH7QtgiV7g0tgXvo3Pf205MZeJfvfa/f3
 we0A==
X-Gm-Message-State: AC+VfDz7Fjri0tm4ZNLJAfbbF2M4viFeSxYJ6dv9jUfdmwLDySDMM4y3
 3sHwNoGAot7ZvJiI6b8H4d4TSg==
X-Google-Smtp-Source: ACHHUZ5MxmZPqMPziAKQQWWAt9VDst5C/IOrPF5/cMayJzrgjqxeHWuOIXlze5i1nlQUSQYC1kLotg==
X-Received: by 2002:adf:eb8d:0:b0:306:43a7:c2f0 with SMTP id
 t13-20020adfeb8d000000b0030643a7c2f0mr507817wrn.31.1685083148873; 
 Thu, 25 May 2023 23:39:08 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a5d58d0000000b002ffbf2213d4sm4036588wrf.75.2023.05.25.23.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 23:39:08 -0700 (PDT)
Date: Fri, 26 May 2023 08:39:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v4 0/3] hw/riscv/virt: pflash improvements
Message-ID: <20230526-b0d8b56e9688dea7ae9d00d5@orel>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
 <CABJz62MFZzx3jBgW6TtGFD9emY+DAbbftSybD8ZouC65n3-auA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62MFZzx3jBgW6TtGFD9emY+DAbbftSybD8ZouC65n3-auA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x432.google.com
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

On Thu, May 25, 2023 at 11:03:52AM -0700, Andrea Bolognani wrote:
> On Thu, May 25, 2023 at 10:18:00PM +0530, Sunil V L wrote:
> > This series improves the pflash usage in RISC-V virt machine with solutions to
> > below issues.
> >
> > 1) Currently the first pflash is reserved for ROM/M-mode firmware code. But S-mode
> > payload firmware like EDK2 need both pflash devices to have separate code and variable
> > store so that OS distros can keep the FW code as read-only.
> >
> > The issue is reported at
> > https://salsa.debian.org/qemu-team/edk2/-/commit/c345655a0149f64c5020bfc1e53c619ce60587f6
> >
> > 2) The latest way of using pflash devices in other architectures and libvirt
> > is by using -blockdev and machine options. However, currently this method is
> > not working in RISC-V.
> >
> > With above issues fixed, added documentation on how to use pflash devices
> > in RISC-V virt machine.
> >
> > This patch series is based on Alistair's riscv-to-apply.next branch.
> >
> > Changes since v3:
> > 	1) Converted single patch to a series with a cover letter since there are
> > 	   multiple patches now.
> > 	2) Added a new patch to enable pflash usage via -blockdev option.
> > 	3) Separated the documentation change into new patch and updated the
> > 	   documentation to mention only -blockdev option which seems to be the
> > 	   recommended way of using pflash.
> 
> Success! \o/
> 
> With these patches applied, libvirt built from the master branch,
> edk2 built from your branch and a JSON firmware descriptor for it
> installed (attached), it's finally possible to boot an unmodified
> openSUSE Tumbleweed RISC-V disk image by simply including
> 
>   <os firmware='efi'>

Hi Andrea,

I'm a bit concerned that we don't also need to add some XML in order to
disable ACPI right now. RISC-V guest kernels will support ACPI in the
near future. Ideally a default libvirt VM using edk2 will also use ACPI.
Will there be a problem with changing that default later? If so, then
I'd change it now and continue burdening developers a bit longer by
requiring them to explicitly disable it.

Thanks,
drew

