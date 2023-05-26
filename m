Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9746DC7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 08:43:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2T2O-0002Bg-CR; Fri, 26 May 2023 04:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q2T2N-0002BV-K5
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 04:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q2T2M-0003ak-4K
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 04:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685090581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YmMhBzprK4RE21VMHkMedyd2ZgvJU7kdyhV5ySnVC/E=;
 b=Q5T3KbzgxbDTXTuTCP7dfuuNNztlfia6UF6aQA8OzPo13x57PPsZps0GqREIw/QpxTN6WM
 DNJKBpvE1oftu5zfXzdQuNxVGPdiphk3j5qup98Icfjd1fbgz+kEKhUfcMSzH+jw//HM8s
 KDHds+H+f/VQzpXdEl+sL9Qlr/gkUXg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-CSJCELIKOuCh5bLrwcZYDQ-1; Fri, 26 May 2023 04:43:00 -0400
X-MC-Unique: CSJCELIKOuCh5bLrwcZYDQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2534d7abebeso509972a91.0
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 01:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685090579; x=1687682579;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YmMhBzprK4RE21VMHkMedyd2ZgvJU7kdyhV5ySnVC/E=;
 b=NWGRXWeyXximXAhOE8cnZ2p2mNrKVigxmM+80KeVIwqUZoc6T52vl6amaT7KObAh6N
 SCmrjmtWhjpq07VnVPtdiuWIjgM/mBK2dqVVB0ogOChyv2c9KZMEGBrKyUwQy7XWDfum
 zCV5/hc3AuKhsFWLfWDkDSzaHpg5vklaOvOpMz8u7jiUmscZd+MJlvdNZeZUPNVL6nLm
 hXWKBbDbt5nSo8YcEb0draBIvoI5QLE9yICgbc+nuIYfATP26foPSt+OqhJhBDUlKTHm
 XzQc431lYIfC6uAx509S2SGYJVpCFOz4h/IoCHArCRLc39RZfVOmUQHEZH+AHVcqlShd
 bAEg==
X-Gm-Message-State: AC+VfDzmWLtQpfx8DhRwU0u+0Dw+4c8L+HZD7/zbtZ3k6YfwaGZs+xeW
 NWV/bxwW1qXDCGMqI2OiCm8wHxYQ50Emvw8BBpMA5plzUtoOn2HapbnoBvd7mZFNuUuR2oLWg/q
 RxgZuemHEnxRBN7pKxUad8J8JQsIA7tA=
X-Received: by 2002:a17:90a:4ec8:b0:244:a412:47d7 with SMTP id
 v8-20020a17090a4ec800b00244a41247d7mr1898404pjl.20.1685090579075; 
 Fri, 26 May 2023 01:42:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hD79dUBHIEmgtQTLLl95Oj4gi/srxwy+XXXsEga460/7r2Kgukw/on7P9AYeRFFl49FE3mrHeazyPBf+4hSY=
X-Received: by 2002:a17:90a:4ec8:b0:244:a412:47d7 with SMTP id
 v8-20020a17090a4ec800b00244a41247d7mr1898382pjl.20.1685090578730; Fri, 26 May
 2023 01:42:58 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 May 2023 04:42:57 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
 <CABJz62MFZzx3jBgW6TtGFD9emY+DAbbftSybD8ZouC65n3-auA@mail.gmail.com>
 <20230526-b0d8b56e9688dea7ae9d00d5@orel>
 <CABJz62Nk-U+qHQjn6G2-bN8i9RcMEZWdYTyi7wqC=7BVjDSBWQ@mail.gmail.com>
 <20230526-e398cfda73f326653323ea68@orel>
MIME-Version: 1.0
In-Reply-To: <20230526-e398cfda73f326653323ea68@orel>
Date: Fri, 26 May 2023 04:42:57 -0400
Message-ID: <CABJz62PXvVNEwpqUz0dUUYTAGjmNU4h0NtFf664oubaJmKxwKw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hw/riscv/virt: pflash improvements
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
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

On Fri, May 26, 2023 at 10:34:36AM +0200, Andrew Jones wrote:
> On Fri, May 26, 2023 at 03:49:11AM -0400, Andrea Bolognani wrote:
> > So, are edk2 users the only ones who would (temporarily) need to
> > manually turn ACPI off if virt-manager started enabling it by
> > default?
>
> I assume so, but I'm not tracking firmware status. If the firmware
> doesn't extract the ACPI tables from QEMU and present them to the
> guest (afaik only edk2 does that), then the guest kernel falls back
> to DT, which is why it's working for you.
>
> I suppose we should wait until Linux merges the ACPI patches, before
> adding RISC-V to the libvirt capabilities ACPI list.

That sounds reasonable to me, but note that 1) the libvirt change
might take a while to propagate to distros and 2) someone will have
to remind me to prepare such a patch when the time comes ;)

> Then, is it
> possible to use something like libosinfo to inform virt-manager
> when it should enable ACPI and when not? Later distro images, with
> later kernels, will want to use ACPI by default, but older images
> will still need to use DT.

Something like that would definitely be possible, but I don't think
the scaffolding for it exists at the moment, so someone would have to
wire it up across the stack. Given how relatively immature the RISC-V
distro ecosystem is at the moment, I think it's fine to do nothing
and wait for the problem to go away on its own :)

-- 
Andrea Bolognani / Red Hat / Virtualization


