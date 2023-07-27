Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5B3C001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 13:49:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP14I-0001HK-Mn; Thu, 27 Jul 2023 09:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qP14G-0001EE-HD
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 09:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qP14B-0003bT-LV
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 09:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690464601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bVFqC97Q3dgFHlPg9C89I86oMxMnpxjbbA/stSo4quA=;
 b=Eu5FIN18tKdcG7I2EVUmX+VCguCdQirUWvjv9511zoF/GSGDJGPLTjg48WDiw0ZUgtNlRo
 eZwNn4a3Ek1d4fQnsUm9O4+Am5iNj5XYwbHRwf0NzUiKP8MoO7Ih56eEjDdQHKpIj0sXyB
 IFKo6nKs3iFtpSZQWsnzS7hVP9xHGsQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-wMEBT9v_PxCVULcMqxGRUA-1; Thu, 27 Jul 2023 09:28:33 -0400
X-MC-Unique: wMEBT9v_PxCVULcMqxGRUA-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1bbdced15f3so7181195ad.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 06:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464512; x=1691069312;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bVFqC97Q3dgFHlPg9C89I86oMxMnpxjbbA/stSo4quA=;
 b=VyWNZJLSx/vrubrFcK4katb3nHwuWM1vsKEmR9EHcGtRwPSZrIQaEafhrPbKZ8fUqy
 8/utM65Mfsit0RyK++Iwtl/zif5pm01sHSottF3+UacIwv8J71tmxrnDppq+8t4RIfjm
 IPJWjGA5eXvT6aPtfMuU4PI7on/jFUmMd3xjj93WOgK2/1UL6fsSksvQ0PJJ1blGFCHT
 luQfySMGJFP1RuC4/qrR6N0UXo73/1T01ed9YrYsk/hx2ozZzJ3BoR3jTLw1t+M6y4B0
 pqtVSc6uw17OR2m5scxbkrwquqNqvHmrhpQSUoREOu8twXNVl34poutUGZ1I7AKxzygS
 jyNA==
X-Gm-Message-State: ABy/qLaQ+SYB5hBmNu17O6eaaOk/4rZS+vcmdyCV980LPRwYTn4VZFqB
 CXUPLbDu2A4mLzJwG1uS12rX6iIthK/+TFoGJ7ujV+b59RYvDHPope+a08G7P7+3VtA1PElT7AG
 BgcdGo5CepKZ933fR9m0jBRHVmlQ3v30M7lSDeo0=
X-Received: by 2002:a17:902:7d83:b0:1b3:d608:899a with SMTP id
 a3-20020a1709027d8300b001b3d608899amr4517748plm.68.1690464512077; 
 Thu, 27 Jul 2023 06:28:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHB9h79eAF9cP0v0MD2+zBFlyt9fsDL85NoCYQO9XJ5tMaHi3l2prmaiwwHHdSiZTKtD2WzYdMJVlCHHtJVglw=
X-Received: by 2002:a17:902:7d83:b0:1b3:d608:899a with SMTP id
 a3-20020a1709027d8300b001b3d608899amr4517738plm.68.1690464511767; Thu, 27 Jul
 2023 06:28:31 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Jul 2023 09:28:30 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
Date: Thu, 27 Jul 2023 09:28:30 -0400
Message-ID: <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv <qemu-riscv@nongnu.org>, Andrew Jones <ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Sorry for being late to the party, and I see that you're already a
few versions in with the actual patches. Hopefully nothing I write
here is going to be too disruptive of the work you've already done :)

On Mon, Jul 10, 2023 at 02:53:12PM -0300, Daniel Henrique Barboza wrote:
> 1 - introduce the 'max' CPU. I guess we'll need some prep work in how
> the extensions are being declared/stored in the code. I'll work on
> it;

Yes please. At least for TCG, this is pretty much a no-brainer and
what most people will probably want to use.

> 2 - introduce rva23U64/rva23S64. I would like to add a new 'profile' option
> for generic CPUs, with '-cpu rv64,profile=rva23U64' enabling a whole set
> of extensions. We would also support enabling optional profile extensions.
> Yes, we don't have all the profile extensions available yet (neither does
> the kernel AFAIK) but nothing is stopping us from adding the base
> framework;

IIUC profiles are basically shorthands for well-defined sets of
extensions. The idea definitely sounds valuable, but I wonder how
we'd expose it from the libvirt XML.

My question would be, why should this be -cpu rv64,profile=rva23U64
instead of just -cpu rva23U64? "Base ISA plus a number of extensions"
pretty much sounds like a named CPU model to me, but I'm sure there
is more to it :)

> 3 - reduce the generic CPUs up to the minimum required to boot Linux.
> Yes, a rather arbitrary criteria, but Linux is the most common OS used
> by RISC-V QEMU currently so we'll go with what most people are using.
> This would reduce rv64 to "rv64ima".

Can't we make the generic CPUs really bare-bones instead?

Not sure what exactly that would look like, but as long as you can
enable specific extensions explicitly I don't see the advantage in
targeting a specific use case (boot Linux), no matter how popular,
instead of providing useful building blocks for custom behavior.

The use case of booting Linux, and really most RISC-V operating
systems, should already be well served by -cpu max for TCG and -cpu
host for KVM.

-- 
Andrea Bolognani / Red Hat / Virtualization


