Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C107C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 31 May 2023 17:20:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4PUZ-0000BI-HO; Wed, 31 May 2023 13:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4PUX-0000AK-Pe
 for qemu-riscv@nongnu.org; Wed, 31 May 2023 13:20:09 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4PUV-00076y-Uo
 for qemu-riscv@nongnu.org; Wed, 31 May 2023 13:20:09 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-53f70f7c2d2so2713207a12.3
 for <qemu-riscv@nongnu.org>; Wed, 31 May 2023 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685553606; x=1688145606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9nGxzvslDYlf3UwjVBdG6FxLyJ/GlfSeA3aKKGtaJXI=;
 b=nEzrNiu63k1zfOgZ3tGd2SFXb5d+QLM0ImCKoCb2jaXC2B/0LM3dCyWqbnDsXjK39E
 SjyYefZ8mwtK4xPx/OA4+Ypu+IlMI6VqykYtOahHvYGbkdN6ZO2TSFasQv/dOGYtYzKq
 dmxBoG+NkXXqsBhn5ihilbN1uaWckX0WISUD+Fv3/OeENFYwup8WCXoQ0/AkcvlT+o3l
 rJEWOXG6FV6hSBlWuAOoGsgC1f6xgVU2deVYmbd7i/8eUQq05rQYmyjkMZt3u6Q4qq2K
 Oj3pCiO2gR3bMme7T5Rolsy/cXnpM1UYTqtLzFC0Ee2TInfyCPjxe/M6jb9dUGX5eo+7
 58xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685553606; x=1688145606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nGxzvslDYlf3UwjVBdG6FxLyJ/GlfSeA3aKKGtaJXI=;
 b=ND0EL8hKualNksUCIzHpx+bfIwb4qGjZi/rqSaOQu9VD4wF589q9SltXhFtW2927He
 9Lp5WfeiJRC8lC4lKc0v5OE1cgRgQVDCYM1aS1gttQhco8pGGo07fl00lpH+8KlIjxCp
 FQWPsKw3kcSCgntzCiGnyIXFBIzON6+qtQr9cgukvbFCIuvsrLqObYA3k59A/GwW8T9L
 Gys2VmZHKMsz2qDv2GPD1XmEcsnEe1wOfs4nA3fVao6Shsu5e7ZnBfISqk9v7/MDjR3N
 vWrRwRfXG/z1ARTAAclemfjrLv0qTElBRrZSPh1xdr/456Tzgl+hQd2Dxhc53wZNj3sY
 uk/Q==
X-Gm-Message-State: AC+VfDyFYTBeYqmBgqCRfRV9G8RM0GAA1RA8Dm5RtkhQI/azrkw4KF3Y
 QP29RKFADAUMiIWD6GLEA5TMcA==
X-Google-Smtp-Source: ACHHUZ7GkOwJWtWF4pZoH4FUPvA7Wsb9piQa8loEQKJjvHXyb7/J7Tw5tBgOvX9YMNSrqGiYQvThoQ==
X-Received: by 2002:a17:902:e74e:b0:1b0:3f89:9843 with SMTP id
 p14-20020a170902e74e00b001b03f899843mr5731178plf.18.1685553606185; 
 Wed, 31 May 2023 10:20:06 -0700 (PDT)
Received: from sunil-laptop ([106.51.186.3]) by smtp.gmail.com with ESMTPSA id
 s1-20020a170902988100b001b04949e0acsm1637231plp.232.2023.05.31.10.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 10:20:05 -0700 (PDT)
Date: Wed, 31 May 2023 22:49:58 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v6 3/3] docs/system: riscv: Add pflash usage details
Message-ID: <ZHeBvhsLQ93bw+t3@sunil-laptop>
References: <20230531142300.9114-1-sunilvl@ventanamicro.com>
 <20230531142300.9114-4-sunilvl@ventanamicro.com>
 <CABJz62PgmMQp6qcOnME-=G2h84GtW2w0M4OaLpW=Xn6+g1BxjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62PgmMQp6qcOnME-=G2h84GtW2w0M4OaLpW=Xn6+g1BxjA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, May 31, 2023 at 09:43:39AM -0700, Andrea Bolognani wrote:
> On Wed, May 31, 2023 at 07:53:00PM +0530, Sunil V L wrote:
> > +Using flash devices
> > +-------------------
> > +
> > +When KVM is not enabled, the first flash device (pflash0) can contain either
> > +the ROM code or S-mode payload firmware code. If the pflash0 contains the
> > +ROM code, -bios should be set to none. If -bios is not set to
> > +none, pflash0 is assumed to contain S-mode payload code.
> > +
> > +When KVM is enabled, pflash0 is always assumed to contain the S-mode payload
> > +firmware.
> > +
> > +Firmware images used for pflash should be of size 32 MiB.
> > +
> > +To boot as ROM code:
> > +
> > +.. code-block:: bash
> > +
> > +  $ qemu-system-riscv64 -bios none \
> > +     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<rom_code> \
> > +     -M virt,pflash0=pflash0 \
> > +     ... other args ....
> > +
> > +To boot as read-only S-mode payload:
> > +
> > +.. code-block:: bash
> > +
> > +  $ qemu-system-riscv64 \
> > +     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<s-mode_fw_code> \
> > +     -blockdev node-name=pflash1,driver=file,filename=<s-mode_fw_vars> \
> > +     -M virt,pflash0=pflash0,pflash1=pflash1 \
> > +     ... other args ....
> > +
> > +To boot as read-only S-mode payload in KVM guest:
> > +
> > +.. code-block:: bash
> > +
> > +  $ qemu-system-riscv64 \
> > +     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<s-mode_fw_code> \
> > +     -blockdev node-name=pflash1,driver=file,filename=<s-mode_fw_vars> \
> > +     -M virt,pflash0=pflash0,pflash1=pflash1 \
> > +     --enable-kvm \
> > +     ... other args ....
> 
> I feel that this, while accurate, has gotten more complicated than it
> needs to be. We're also putting the least common scenario front and
> center instead of opening with the one that most people are going to
> be using.
> 
> Below is how I suggest reworking it. What do you think?
> 
> 
> 
> Using flash devices
> -------------------
> 
> By default, the first flash device (pflash0) is expected to contain
> S-mode firmware code. It can be configured as read-only, with the
> second flash device (pflash1) available to store configuration data.
> 
> For example, booting edk2 looks like
> 
> ..code-block:: bash
> 
>   $ qemu-system-riscv64 \
>      -blockdev node-name=pflash0,driver=file,read-only=on,filename=<edk2_code> \
>      -blockdev node-name=pflash1,driver=file,filename=<edk2_vars> \
>      -M virt,pflash0=pflash0,pflash1=pflash1 \
>      ... other args ....
> 
> For TCG guests only, it is also possible to boot M-mode firmware from
> the first flash device (pflash0) by additionally passing ``-bios
> none``, as in
> 
> ..code-block:: bash
> 
>   $ qemu-system-riscv64 \
>      -bios none \
>      -blockdev node-name=pflash0,driver=file,read-only=on,filename=<m_mode_code>
> \
>      -M virt,pflash0=pflash0 \
>      ... other args ....
> 
> Firmware images used for pflash must be exactly 32 MiB in size.
> 
Hi Andrea,

This looks great! Thank you very much. Unless I see an objection, I will
use this text in the next revision of the series tomorrow.

Thanks!
Sunil

