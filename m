Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfLLm-0006dq-2W
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jun 2019 05:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57697)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hfLLj-0006aM-LG
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 05:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hfLLi-00037O-4I
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 05:33:19 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hfLLh-00034u-U7
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 05:33:18 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so6561818plt.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Jun 2019 02:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=q+IxMvOlXZB+UXym25rv/BUxLzFnH+hT1oYYNFoZSKg=;
 b=mbUbsd9tSqxDfu+aa50sCM0iWXh9iFOY1Xs1R2L9XC7Zm/kupIASoF1V/YS+VSZ01C
 qpbPHpMDw+boOd72m6stmv0rC++jnSl+SOa6ULjDce8YK8zaunUbNzHrazCXw7vtC3Ws
 K2k8Dlebk42LxdGotuBtkSiegt1JBdwMDBUUOwHXfIcGtaRBRJ1wYK9OXEJUEtEx/XVf
 4PSfsxB1cS30ma2C0qF+3IyM6mw8ONQyzgCptGvMrX5i+MBfGbgGam8HRq5tEwCVni/w
 FAGXy8en9RYWOfl0Xra6fYMFGnZpjuVsUNjlQSIaL9KYO3RAUJUe2Ji0WxOZSbw+6jRN
 zh3w==
X-Gm-Message-State: APjAAAWRyYMVYux7+2u/M5utU/WWcwRNdE3XJ3mEPBpV6n+2DYekO3yp
 5ZLHUlT8NFKiwxmluLXPG+97Rw==
X-Google-Smtp-Source: APXvYqzQQExPdF/p4gEcLU+rFcG3lZoKQkTlHw7Xmh3mkDuEiYaSiYCx+ynqws6RN2vjQi+Trytu8A==
X-Received: by 2002:a17:902:7894:: with SMTP id
 q20mr135487815pll.339.1561368796764; 
 Mon, 24 Jun 2019 02:33:16 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id c33sm2621335pgl.70.2019.06.24.02.33.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 02:33:15 -0700 (PDT)
Date: Mon, 24 Jun 2019 02:33:15 -0700 (PDT)
X-Google-Original-Date: Mon, 24 Jun 2019 02:33:05 PDT (-0700)
In-Reply-To: <cover.1560821342.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-1bb3bc4e-1846-4e2a-ab19-ab4436041f63@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.193
Subject: Re: [Qemu-riscv] [PATCH v1 0/9] Update the RISC-V specification
 versions
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
X-List-Received-Date: Mon, 24 Jun 2019 09:33:21 -0000

On Mon, 17 Jun 2019 18:31:00 PDT (-0700), Alistair Francis wrote:
> Based-on: <cover.1555726824.git.alistair.francis@wdc.com>
>
> Now that the RISC-V spec has started to be ratified let's update our
> QEMU implementation. There are a few things going on here:
>  - Add priv version 1.11.0 to QEMU
>     - This is the ratified version of the Privledge spec
>     - There are almost no changes to 1.10
>  - Mark the 1.09.1 privledge spec as depreated
>      - Let's aim to remove it in two releases
>  - Set priv version 1.11.0 as the default
>  - Remove the user_spec version
>      - This doesn't really mean anything so let's remove it
>  - Add support for the "Counters" extension
>  - Add command line options for Zifencei and Zicsr
>
> We can remove the spec version as it's unused and has never been exposed
> to users. The idea is to match the specs in specifying the version. To
> handle versions in the future we can extend the extension props to
> handle version information.
>
> For example something like this: -cpu rv64,i=2.2,c=2.0,h=0.4,priv_spec=1.11
>
> NOTE: This isn't supported today as we only have one of each version.
>
> This will be a future change if we decide to support multiple versions
> of extensions.
>
> The "priv_spec" string doesn't really match, but I don't have a better
> way to say "Machine ISA" and "Supervisor ISA" which is what is included
> in "priv_spec".
>
> For completeness I have also added the Counters, Zifencei and Zicsr
> extensions.
>
> Everything else seems to match the spec names/style.
>
> Please let me know if I'm missing something. QEMU 4.1 is the first
> release to support the extensions from the command line, so we can
> easily change it until then. After that it'll take more work to change
> the command line interface.
>
> Alistair Francis (9):
>   target/riscv: Restructure deprecatd CPUs
>   target/riscv: Add the privledge spec version 1.11.0
>   target/riscv: Comment in the mcountinhibit CSR
>   target/riscv: Set privledge spec 1.11.0 as default
>   qemu-deprecated.texi: Deprecate the RISC-V privledge spec 1.09.1
>   target/riscv: Require either I or E base extension
>   target/riscv: Remove user version information
>   target/riscv: Add support for disabling/enabling Counters
>   target/riscv: Add Zifencei and Zicsr as command line options
>
>  qemu-deprecated.texi                          |  8 +++
>  target/riscv/cpu.c                            | 72 ++++++++++---------
>  target/riscv/cpu.h                            | 19 ++---
>  target/riscv/cpu_bits.h                       |  1 +
>  target/riscv/csr.c                            | 13 +++-
>  .../riscv/insn_trans/trans_privileged.inc.c   |  2 +-
>  6 files changed, 71 insertions(+), 44 deletions(-)

Aside from the comments on 3 and 9

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

I've got these, along with my proposed modifications, queued up.  LMK if that's
a problem, particularly the two-patch replacement for 9 needs a review as it's
entirely new code.

