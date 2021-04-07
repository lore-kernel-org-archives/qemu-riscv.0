Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU8hE-0005A0-49
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 09:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU8hA-00055k-UL; Wed, 07 Apr 2021 09:58:12 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU8gy-0001ka-Hd; Wed, 07 Apr 2021 09:58:12 -0400
Received: by mail-il1-x130.google.com with SMTP id n4so9468397ili.8;
 Wed, 07 Apr 2021 06:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Du6uP5XeSa960AupAu2v3JIOFbV9ah0z+BgNYDZjZBM=;
 b=gpWvK7oBkSkQK2mOz/TFFC6/D6irtFmhHl1zwnxgOlz8yAtVsAHYHydPIxCk7z51kw
 3YISucyPxdNdFguFqU8I6M4H2BxcFvbPsyMN7ZQi8moZZItZLbhFtpr+1wfIOl16iZsC
 y2xUkyut2M2OJpTuA+45fspHqiVJSVw86MFa9uH9f1PDh83J/ooLr4OI+JUTCAo9Duai
 GPGb8Cz1+HC5DG9Z/77lJAutPqpJm0awBJfZmw+ErJ+AVgCfnqW3gET/G8Aj6Jk8I4Pn
 IOdhUJhBakRVAJdFGP0OzH/CCqoEiHACIgxw+/7lbQ4x7/2inWZwJAgc8DbqH6xzvyxM
 VFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Du6uP5XeSa960AupAu2v3JIOFbV9ah0z+BgNYDZjZBM=;
 b=UO9NSaEBymFap14AVkRYzKw5gXNx13cEoNttiG989efq0Jqof8Mn8WNQJrfgJLr2YP
 Njw/hvMIs1qT8ztqz/gF+kpPPk4odNfZQO5ZPP4hqXF8qnHjBx43UVzwEdWTWs7IXWFC
 Hbbd9sC1I9QNm0pbTx/iSb31+PEWtMtQ5ebBL/yyrhZRaGZyFTuWgMT+NXlxo8CT2gtn
 zVi9jNkawa7oej/V01Uh6tIaEdsfpRH+JUibtlPEXjEQi0Y+HOcsZWJxHSuR4aoeUEwN
 1psL5UCpd1LHbL1hIze+AGwQmcm/h6onmmpdHASB35+IIcyVnSLrxnQSuDCUwASOJsbB
 TXsw==
X-Gm-Message-State: AOAM533ChRR7m+3q2AMSF17BVixj/XnuBbtSqGnrWvvBJc6N+Y15EF+X
 iEaaq8JVpQKUTHS3VwNiiI+l2wsKAC57DFhamOw=
X-Google-Smtp-Source: ABdhPJxqOWut/uNQ8CZAxEIgLlvhunAPEX1lz7TSFZJytFFvFD+0zJLyf8SM4o2iPja/vki/nRr2wF2A9U7dSwuqJRM=
X-Received: by 2002:a92:d6cb:: with SMTP id z11mr2796500ilp.227.1617803878393; 
 Wed, 07 Apr 2021 06:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617290165.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1617290165.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 09:55:37 -0400
Message-ID: <CAKmqyKNDVPzteeWyeb+mnNaxfH9R9Ej12xY-wo7uO26oqiDcEg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] RISC-V: Convert the CSR access functions to use
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 07 Apr 2021 13:58:15 -0000

On Thu, Apr 1, 2021 at 11:19 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> V2:
>      - Renmae the enum
>      - Rebase on master
>      - Fix a few incorrect returns
>
> Alistair Francis (5):
>   target/riscv: Convert the RISC-V exceptions to an enum
>   target/riscv: Use the RISCVException enum for CSR predicates
>   target/riscv: Fix 32-bit HS mode access permissions
>   target/riscv: Use the RISCVException enum for CSR operations
>   target/riscv: Use RISCVException enum for CSR access

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h        |  28 +-
>  target/riscv/cpu_bits.h   |  44 +--
>  target/riscv/cpu.c        |   2 +-
>  target/riscv/cpu_helper.c |   4 +-
>  target/riscv/csr.c        | 740 ++++++++++++++++++++++----------------
>  target/riscv/gdbstub.c    |   8 +-
>  target/riscv/op_helper.c  |  18 +-
>  7 files changed, 492 insertions(+), 352 deletions(-)
>
> --
> 2.31.0
>

