Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hizAT-0004b6-OR
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jul 2019 06:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49944)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hizAN-0004aG-85
 for qemu-riscv@nongnu.org; Thu, 04 Jul 2019 06:40:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hizAM-00020x-3F
 for qemu-riscv@nongnu.org; Thu, 04 Jul 2019 06:40:39 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hizAL-0001zB-N9
 for qemu-riscv@nongnu.org; Thu, 04 Jul 2019 06:40:37 -0400
Received: by mail-oi1-x241.google.com with SMTP id s184so4577686oie.9
 for <qemu-riscv@nongnu.org>; Thu, 04 Jul 2019 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9CAyTJXaq+MpCvQ1USfwRHoo0rx3PObrCX2gXwIu1g=;
 b=HJRqSLBW2Xv+H0iWQ6gj26MGLsI+QoKf6xdx8uCcyVDBD/BrnkAIjOr34Cr1eOkvMl
 jNIcN27ZwdcdCaqCG7TFrtOXhIDoVaMc+UlBNlnFE+NpInhpq4uTQ1nPAWzigg39Cy0D
 g8q+GMEkXjIsp7zIVcQlxTe5OQAHtmE5VM5gGWjsWTy9rWbl8esNtybjZz3QTnIrjKCS
 m1sOTTOwbluWYogD7kyQVPFL7u0ubRWpYIP4i66g40pReKhjYjPoGqms/nCJ6Dg+9K06
 jMRUpVoCIsvWf3AGXxpgkbbd1nIVydqwd8CnRcCmIjZXlGtRNJFLG1SBmHO09hBVi7n7
 Le6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9CAyTJXaq+MpCvQ1USfwRHoo0rx3PObrCX2gXwIu1g=;
 b=TXDMvrNMfAp0SFrzbkFuMHMP3O7gzgTyDv5HFe/c+WcWMgXtJbRKHnONGSEFkE2QOZ
 1/x+V/177mJA7Lf5xgNLk1xxcIbTWI/5sGWwezg5NGh38gFzuktOSI6FJ6w0MVneZhnm
 YYHVOGTVJJn3ZpI5Y4+Sui4C9KD8e3ERuMTdHb0Ty0dMyYaknkxWFdEMW3OBGqTLe7R3
 nwXvBmjs7cyTk2i45iFpZciMgmGDN2twgMU11oN1Z6Vl61iRfBYezmyphdn3kRUY/48r
 HSrUjgy6QTdqIZxGou6kpmnPhy6j4oXYwehtK26gqJwMkcWUUeGVET8j8PMqnU2zkS+R
 s3kw==
X-Gm-Message-State: APjAAAXrbW3HuPlDTDne84TfdvibsyrzdSXH8ehqiLQwMhlwz/tjtMyV
 ayQfyv6g8JJ8Pi/BIR2PGjAJ2ma569WY8qDVfVZgIA==
X-Google-Smtp-Source: APXvYqx4E34zK/8BmbG/RxSDpm17G53Rsk3c96Dw5LSVKrkAnyn3P/zqqqwKWDkQHJb8sgNVzAK50goTuo6TUU+cs6k=
X-Received: by 2002:aca:6185:: with SMTP id v127mr1538981oib.163.1562236835991; 
 Thu, 04 Jul 2019 03:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190703084048.6980-1-palmer@sifive.com>
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2019 11:40:25 +0100
Message-ID: <CAFEAcA8tN1pUPWUyZbbo2UsaUmOHMLiipW2qEODYPJ9ZB5n+XA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for the 4.1 Soft Freeze,
 Part 2 v3
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jul 2019 10:40:41 -0000

On Wed, 3 Jul 2019 at 09:41, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> merged tag 'mips-queue-jun-21-2019'
> The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:
>
>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-sf1-v3
>
> for you to fetch changes up to 395fd69582a00b76a89c12d9c074055a9d207997:
>
>   hw/riscv: Extend the kernel loading support (2019-06-27 02:47:06 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 4.1 Soft Freeze, Part 2 v3
>
> This pull request contains a handful of patches that I'd like to target
> for the 4.1 soft freeze.  There are a handful of new features:
>
> * Support for the 1.11.0, the latest privileged specification.
> * Support for reading and writing the PRCI registers.
> * Better control over the ISA of the target machine.
> * Support for the cpu-topology device tree node.
>
> Additionally, there are a handful of bug fixes including:
>
> * Load reservations are now broken by both store conditional and by
>   scheduling, which fixes issues with parallel applications.
> * Various fixes to the PMP implementation.
> * Fixes to the 32-bit linux-user syscall ABI.
> * Various fixes for instruction decodeing.
> * A fix to the PCI device tree "bus-range" property.
>
> This boots 32-bit and 64-bit OpenEmbedded.
>
> Changes since v2 [riscv-for-master-4.1-sf1-v2]:
>
> * Dropped OpenSBI.
>
> Changes since v1 [riscv-for-master-4.1-sf1]:
>
> * Contains a fix to the sifive_u OpenSBI integration.

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

