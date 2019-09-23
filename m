Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCSWw-0002ik-CT
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 13:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iCSWt-0002gL-W3
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 13:53:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iCSWt-0001GX-2F
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 13:53:43 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:39795)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iCSWq-0001F1-Sv; Mon, 23 Sep 2019 13:53:41 -0400
Received: by mail-lf1-x143.google.com with SMTP id 72so10825605lfh.6;
 Mon, 23 Sep 2019 10:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VldKBAk85sop/e+voE6z8Ho52l0yXVnctg44/nSITvs=;
 b=usm79w3Jerp08xKmkOFeH8iIOd6sYbzbCMio+K/ZvTEENucWeKYX90pBReBggPwMZY
 tjxHdgA/lrC05mXcxa5IeeIl8QDwbnWDb3TEtJ3cli4ztXa1ggbfwE12d7kqmWWt+JdT
 lV0Kwuwt9/lwkxtEYjR7YgeST9/8rB2lSs5bnFf1hdxR1pG4Y4J4DrhYoFLsKpTbhWzL
 tT9CnSWmv2bDFys4AVKu9/rmvKfMOPuhLAYWrGZB5ib7xeQKmI9MLqKPZCTJN2t/VS3B
 rWZ1FzqsOq3Db19/U1PbkOB2uwGYdTmRunoTwlXLLJNiFH/8Dzr+kqxowvxOtTLXWB7y
 NR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VldKBAk85sop/e+voE6z8Ho52l0yXVnctg44/nSITvs=;
 b=AxZyBgziCprigUHTmK6MiZEeQQRqjra0SyNzk7ySPCs370NFidxCFwWs0qYpIZRoLt
 /N56cT9+sW9IuQhy3/zVNZB6MKb+2SPrvEjk/arFJXjaO6HHlmCVYJqYaE1jMKSkJFJ+
 DS46zbPSJwwdSK9fLp3lXJY5cXxoqS0uevXqtK1rJNAuwfr6aH2no7zeHlQYykNPwtRu
 8EzJA5w67GVTzLEp4XfNcaC8c3g1Hl9Yh8KxGeARrXUqrGmx21mB97GfTM/BUupie1+1
 8TB32/v5eImvyhBpcmXv97Ue/NeWnqkUZkP7Kx5LRxVNYG7/X+dqVzEEKznEYqwxqCuT
 9qrw==
X-Gm-Message-State: APjAAAUU3+3XCqyFv/wzJzY0+Ce+4mhP2HswZHISABMREIMlDb3gIazR
 a2I1s6DYjIEdUXMzxI3J78oRxYXVztf2otq07l0=
X-Google-Smtp-Source: APXvYqzdV1JtJ4XapgQPbv5dEwNHT6IHXVv6P/lF+nbyTnaVkj+0nRAiWiPV1jwoTGHMHkM4v7nEfeT3DtgFZYXmu4Q=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr484334lfq.5.1569261219826;
 Mon, 23 Sep 2019 10:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568762497.git.alistair.francis@wdc.com>
 <mhng-a10f93b3-147d-42a0-8f24-6d4b1f3a214b@palmer-si-x1c4>
In-Reply-To: <mhng-a10f93b3-147d-42a0-8f24-6d4b1f3a214b@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Sep 2019 10:53:11 -0700
Message-ID: <CAKmqyKNXZjU715rOuwb980tA5uELdV3TJW4FYu5gK7ZMqAjqbA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: Convert to do_transaction_failed hook
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-List-Received-Date: Mon, 23 Sep 2019 17:53:45 -0000

On Fri, Sep 20, 2019 at 3:48 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 17 Sep 2019 16:22:56 PDT (-0700), Alistair Francis wrote:
> > The do_unassigned_access hook has been deprecated and RISC-V is the last
> > user of it. Let's instead update the RISC-V implementation to use
> > do_transaction_failed instead.
> >
> > After this series I used the 'git grep' regexes in
> > docs/devel/loads-stores.rst and these are the memory accesses inside
> > target/riscv:
> >
> > monitor.c:102:        cpu_physical_memory_read(pte_addr, &pte, ptesize);
> >
> > cpu_helper.c:262:        target_ulong pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
> > cpu_helper.c:264:        target_ulong pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
> >
> > translate.c:782:    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> >
> > gdbstub.c:328:        env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
> >
> > All of these look safe to me.
> >
> > Palmer Dabbelt (2):
> >   RISC-V: Handle bus errors in the page table walker
> >   RISC-V: Implement cpu_do_transaction_failed
>
> Can you Reviewed-By these, as they've still got my Author on them?  That way I
> can pull them in :)

Richard and Philippe have both reviewed it, that should be enough. I'm
not sure if I can review it with my SOB as well.

Alistair

>
> >
> >  target/riscv/cpu.c        |  2 +-
> >  target/riscv/cpu.h        |  7 +++++--
> >  target/riscv/cpu_helper.c | 23 ++++++++++++++++-------
> >  3 files changed, 22 insertions(+), 10 deletions(-)

