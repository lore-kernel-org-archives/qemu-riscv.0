Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4594BC77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 31 May 2023 16:44:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4OvP-0000qR-DQ; Wed, 31 May 2023 12:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q4OvN-0000pi-Vz
 for qemu-riscv@nongnu.org; Wed, 31 May 2023 12:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q4OvI-0000JJ-3A
 for qemu-riscv@nongnu.org; Wed, 31 May 2023 12:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685551423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JYyLvEzVByz1RyfIk9DaT0kLC4Vk06AkQA/4oUlvF5c=;
 b=TIpqYxdLszVrsHRQS3+I1EtkSaMKckRj5upex4/LY6S+LFXkCAvawmM5uNxCSiKdhpkgjF
 DUuSiKxcX5pcpZAgvXjSbOlhGEeUtV2hZ4swgw0DURzY2nCRjew2hmUUp7RYlrNT37Xp5p
 1Vd4FVGu1dJ495b+lZ7oF+EpDE1oOQg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-AZ7d0ZbnNEWTT9qS-lUxFw-1; Wed, 31 May 2023 12:43:41 -0400
X-MC-Unique: AZ7d0ZbnNEWTT9qS-lUxFw-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1b0128be44cso31257805ad.2
 for <qemu-riscv@nongnu.org>; Wed, 31 May 2023 09:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685551420; x=1688143420;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYyLvEzVByz1RyfIk9DaT0kLC4Vk06AkQA/4oUlvF5c=;
 b=I+72yM0aZZH/9poQCdtDbn7i+lk+sDMDPRZ5ARaagJUcIGrVbNrDrzrAxZPyFmPCTN
 cOi1cDk0Fgmlel3J83Y4ATCT/d0N8FhEbqrQ+Y555w+zsKCh2P1BLYORc3UfO1SP5FPz
 UpcqmoM31bARFr5iT7jwq3xzH/suIm5LKrQdeWiMXh4eZRKwuCXUcOMJlj2XDk2+v+gS
 besHyA4tsnvSib66SxSlL4fOb/JMPs6FD2ogh//u3s1J+OFG3JFi74iqKpXSE/vAWqG0
 VrWy+rppgBTRUpgDLq4hWpftxhUYk/gveMx9igm8xe20s92bTvM9hi0sJSn5HgkbTNwH
 uy1w==
X-Gm-Message-State: AC+VfDy3HLkwj6X+WXmmR0osJzUkld/HFJRDAYOmVEw3Tp4kjwvR3pjj
 RdxkUnRkRH+okvzpmipCWpqjx2OTgqWYTDHNAz4prD6sXozlo9CEN4uiQnszVyqQujCoDc9JJ09
 TPTFy/ELA7pATu3mfvq8tuG7YI6dG3co=
X-Received: by 2002:a17:902:d4d1:b0:1b1:8471:341 with SMTP id
 o17-20020a170902d4d100b001b184710341mr776984plg.21.1685551420627; 
 Wed, 31 May 2023 09:43:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63FyylmtN2ATX4m3DSO0HzlDKeHFTv3r4/drawpFiq5v1j5qyKE4wkIlqov0zIyl9ucwhJnWaKTtPwsT+qpRw=
X-Received: by 2002:a17:902:d4d1:b0:1b1:8471:341 with SMTP id
 o17-20020a170902d4d100b001b184710341mr776970plg.21.1685551420296; Wed, 31 May
 2023 09:43:40 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 31 May 2023 09:43:39 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230531142300.9114-1-sunilvl@ventanamicro.com>
 <20230531142300.9114-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230531142300.9114-4-sunilvl@ventanamicro.com>
Date: Wed, 31 May 2023 09:43:39 -0700
Message-ID: <CABJz62PgmMQp6qcOnME-=G2h84GtW2w0M4OaLpW=Xn6+g1BxjA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] docs/system: riscv: Add pflash usage details
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.163,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, May 31, 2023 at 07:53:00PM +0530, Sunil V L wrote:
> +Using flash devices
> +-------------------
> +
> +When KVM is not enabled, the first flash device (pflash0) can contain either
> +the ROM code or S-mode payload firmware code. If the pflash0 contains the
> +ROM code, -bios should be set to none. If -bios is not set to
> +none, pflash0 is assumed to contain S-mode payload code.
> +
> +When KVM is enabled, pflash0 is always assumed to contain the S-mode payload
> +firmware.
> +
> +Firmware images used for pflash should be of size 32 MiB.
> +
> +To boot as ROM code:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -bios none \
> +     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<rom_code> \
> +     -M virt,pflash0=pflash0 \
> +     ... other args ....
> +
> +To boot as read-only S-mode payload:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 \
> +     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<s-mode_fw_code> \
> +     -blockdev node-name=pflash1,driver=file,filename=<s-mode_fw_vars> \
> +     -M virt,pflash0=pflash0,pflash1=pflash1 \
> +     ... other args ....
> +
> +To boot as read-only S-mode payload in KVM guest:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 \
> +     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<s-mode_fw_code> \
> +     -blockdev node-name=pflash1,driver=file,filename=<s-mode_fw_vars> \
> +     -M virt,pflash0=pflash0,pflash1=pflash1 \
> +     --enable-kvm \
> +     ... other args ....

I feel that this, while accurate, has gotten more complicated than it
needs to be. We're also putting the least common scenario front and
center instead of opening with the one that most people are going to
be using.

Below is how I suggest reworking it. What do you think?



Using flash devices
-------------------

By default, the first flash device (pflash0) is expected to contain
S-mode firmware code. It can be configured as read-only, with the
second flash device (pflash1) available to store configuration data.

For example, booting edk2 looks like

..code-block:: bash

  $ qemu-system-riscv64 \
     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<edk2_code> \
     -blockdev node-name=pflash1,driver=file,filename=<edk2_vars> \
     -M virt,pflash0=pflash0,pflash1=pflash1 \
     ... other args ....

For TCG guests only, it is also possible to boot M-mode firmware from
the first flash device (pflash0) by additionally passing ``-bios
none``, as in

..code-block:: bash

  $ qemu-system-riscv64 \
     -bios none \
     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<m_mode_code>
\
     -M virt,pflash0=pflash0 \
     ... other args ....

Firmware images used for pflash must be exactly 32 MiB in size.

-- 
Andrea Bolognani / Red Hat / Virtualization


