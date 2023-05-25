Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D110C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 16:19:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2DgO-0007dD-Qg; Thu, 25 May 2023 12:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q2DgN-0007cm-JE
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 12:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q2DgL-0006kQ-OJ
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 12:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685031556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JNYP9SOltQneIi9s/jsPF2x3y5hZPkfpFVxAZ9GC424=;
 b=KHQwBBRZxTmcQ9MM8EtRDWzx5Hvg0VJRjVxbNUe0uB3a0XrVDYd/p5kDcKE+2tQbsSWRQ7
 V3kENykrD0SbHdGnh1SgLyfZXJ/D/0hbaJv/gm1XnyHJouK55FDXx2cCQGeP7uhYZcNGVj
 bKk0dnp7Thyb9/X2ZmpWDsCuNTwhEBI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-Bjr2CWFUNju4Ac6Ofli80w-1; Thu, 25 May 2023 12:19:15 -0400
X-MC-Unique: Bjr2CWFUNju4Ac6Ofli80w-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-255dfed764dso1794233a91.1
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 09:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685031554; x=1687623554;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JNYP9SOltQneIi9s/jsPF2x3y5hZPkfpFVxAZ9GC424=;
 b=lk/wifWGn4t3+CLQL9Ha9U9iFXtqt990yvaSBu1jMk9KbR/AYK3BlAtjrSxHY7ypov
 qpg0OdxAF7SI07CFnISw8NR6X7rG2bIGNIp+Nt2/O4hv+efL5pCLIe9xGoUgH8bAfwAD
 ePyWzs+4V5OsmEDNLPkIMQ8+iPmg8iOnbMh2xFlKO/iZ/usJRB1ujEupEc8YqyRF/9yp
 E8p1wVGf3aUoq6pWcHFdBlTgGWliwrT53iV3zPFw4+7A7YgDYliU9rjYKRV931T1FbCv
 l+XmlRv4ygPeYJYklouHxMbGFc+xdt1Y9lkhXd9inITg+NM0ipV7wy8/IDTOiyel0U9b
 WKGg==
X-Gm-Message-State: AC+VfDyycvoQVlLpXzNzBApRpp9P2ki9Lha31DoVljZh7usxUzEJzB9U
 MWym4basn8ryfja4AuMLe1fBVdhx7ZH7VWXJyMCEIHqhCMePv7zUePQBnBT6yBfsAL1ZpbtR7ZB
 wok8lkWiU9E7CQShwn1Dm5z6aCCf6z/U=
X-Received: by 2002:a17:902:db07:b0:1ab:797:afbe with SMTP id
 m7-20020a170902db0700b001ab0797afbemr2941943plx.8.1685031554167; 
 Thu, 25 May 2023 09:19:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ53fIciQR1uP3iCNNZLBoAVcJZ6PcmNKONco4QqSkkcVJv2QLO5fcW7bYzAid2xkHcwTjiDI2cUbhhHQ5d5G/o=
X-Received: by 2002:a17:902:db07:b0:1ab:797:afbe with SMTP id
 m7-20020a170902db0700b001ab0797afbemr2941918plx.8.1685031553850; Thu, 25 May
 2023 09:19:13 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 May 2023 16:19:12 +0000
From: Andrea Bolognani <abologna@redhat.com>
References: <20230523102805.100160-1-sunilvl@ventanamicro.com>
 <CABJz62MQ5uRHUP4LLKt=AxTf-Sz0aTEOLWDz=9ftK=H3tZ9JUg@mail.gmail.com>
 <ZG5KgLQ4H/leWKJi@sunil-laptop>
 <CABJz62NHXrBKkc3Gux0TXOjUCO4up-OunwJ6UO94ts+rTgVsAg@mail.gmail.com>
 <ZG94lvAYggnRBfLQ@sunil-laptop>
MIME-Version: 1.0
In-Reply-To: <ZG94lvAYggnRBfLQ@sunil-laptop>
Date: Thu, 25 May 2023 16:19:12 +0000
Message-ID: <CABJz62NUpY35u2ykPXVHp8a_RUyjCnC1_DpWsYNuSBftHe4qBQ@mail.gmail.com>
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

On Thu, May 25, 2023 at 08:32:46PM +0530, Sunil V L wrote:
> On Thu, May 25, 2023 at 01:43:28PM +0000, Andrea Bolognani wrote:
> > I have also tried booting an openSUSE Tumbleweed "JeOS" image, since
> > that's the only distro I'm aware of that uses UEFI boot on RISC-V at
> > this point - though they use U-Boot's UEFI support rather than edk2.
> >
> > During that attempt, I ended up in the edk2 shell. Running
> >
> >   fs0:\efi\boot\bootriscv64.efi
> >
> > brings up GRUB just fine, but selecting the default boot entry
> > results in
> >
> >   Loading Linux 6.3.2-1-default ...
> >   Loading initial ramdisk ...
> >   EFI stub: Booting Linux Kernel...
> >   EFI stub: Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path
> >   EFI stub: Generating empty DTB
> >   EFI stub: Exiting boot services...
> >
> > being printed, after which it's back to OpenSBI and from there to
> > edk2 again.
>
> Thanks!. Please add -machine acpi=off in qemu command to boot the
> kernel.

Yup, that worked! It booted all the way to the login prompt :)

Note that libvirt automatically adds acpi=off, so that won't be a
concern for libvirt users.

> > > > Going further and testing libvirt integration. After hacking around
> > > > other issues, I finally stumbled upon this error:
> > > >
> > > >   qemu-system-riscv64: Property 'virt-machine.pflash0' not found
> > >
> > > Thanks!. This needs some investigation. Let me look into supporting
> > > this.
> >
> > Yes please! It's critical to libvirt integration. Feel free to CC me
> > when you post patches and I'll gladly test them.
>
> Sure, I have the fix ready. I need to convert this into a patch series
> now. Will send it soon and thanks in advance for helping with testing.

Excellent! Looking forward to it :)

-- 
Andrea Bolognani / Red Hat / Virtualization


