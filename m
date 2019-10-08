Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHx2l-0003GA-1t
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 17:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iHx2i-0003Dd-MO
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 17:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iHx2g-0005E3-FG
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 17:29:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iHx2g-0005D0-8O
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 17:29:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so160718pfr.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2019 14:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IPyug0eKjmtK9KcEfNbD4dlgh7p9fSLfUM2RjELR0uA=;
 b=sonPt8udk/fhCPRrtbXg1pit5yHByr1xUcxeqUo5yAR0Wypg2nYGfexDnFsRqmpUSC
 SyETvPOvcbAbGdDSKEt3sK2/Br3A9pqtIWdxBAkiJ6bKDe9KtJpl1gQlXmeBDAXYY7wW
 2NX+q1xuDWQNXjkqeh74woNs2cibtVmA3+mzNXXfB/v0b+2bR0mb/k2VjeSr8gMdDwjY
 +zepDVkX9U+VhOvMyB0gtmIMbPlj5vGGXhjAD2n64h+01onnOB2e969MVkKic8x5AyTB
 SxIGYM1wpKJ1gI9iyGYlC49asPlzkk0fzbBgbOt1zGp36UrBI59Nn2hfIiDj/gODYc4O
 h1/Q==
X-Gm-Message-State: APjAAAUyfoF/nwLl6/7OQ+FoATN5VN9irL7WWCkGkvUA8/NiiN/K7xrj
 V/A3D+3PgFH/nf4bKyQ9d5PJfw==
X-Google-Smtp-Source: APXvYqwx7PHot8EtneQjKkbc669OX4FVPF4bSbOL2G2Znqy/wPYJtXhLqe6RHU0R5NoahGkwnH5ncQ==
X-Received: by 2002:a63:d03:: with SMTP id c3mr537495pgl.174.1570570152667;
 Tue, 08 Oct 2019 14:29:12 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y2sm72597pfe.126.2019.10.08.14.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 14:29:12 -0700 (PDT)
Date: Tue, 08 Oct 2019 14:29:12 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Oct 2019 14:29:04 PDT (-0700)
Subject: Re: [PATCH v2 0/2]  RISC-V: Convert to do_transaction_failed hook
In-Reply-To: <cover.1570567870.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-0b0d87ea-8019-4226-b65c-76bdfc0c4189@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
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
X-List-Received-Date: Tue, 08 Oct 2019 21:29:17 -0000

On Tue, 08 Oct 2019 13:51:46 PDT (-0700), Alistair Francis wrote:
>
> The do_unassigned_access hook has been deprecated and RISC-V is the last
> user of it. Let's instead update the RISC-V implementation to use
> do_transaction_failed instead.
>
> After this series I used the 'git grep' regexes in
> docs/devel/loads-stores.rst and these are the memory accesses inside
> target/riscv:
>
> monitor.c:102:        cpu_physical_memory_read(pte_addr, &pte, ptesize);
>
> cpu_helper.c:262:        target_ulong pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
> cpu_helper.c:264:        target_ulong pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
>
> translate.c:782:    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
>
> gdbstub.c:328:        env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
>
> All of these look safe to me.
>
> v2:
>  - Rebase on master
>
>
> Palmer Dabbelt (2):
>   RISC-V: Handle bus errors in the page table walker
>   RISC-V: Implement cpu_do_transaction_failed
>
>  target/riscv/cpu.c        |  2 +-
>  target/riscv/cpu.h        |  7 +++++--
>  target/riscv/cpu_helper.c | 23 ++++++++++++++++-------
>  3 files changed, 22 insertions(+), 10 deletions(-)

Thanks, these are in the queue.

