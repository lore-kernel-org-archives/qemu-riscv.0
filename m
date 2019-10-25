Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iO05H-0000I6-TZ
	for mharc-qemu-riscv@gnu.org; Fri, 25 Oct 2019 09:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39597)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iO05E-00007V-QD
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 09:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iO05D-0004oV-EF
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 09:56:52 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:32919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iO05D-0004oB-99
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 09:56:51 -0400
Received: by mail-oi1-x242.google.com with SMTP id a15so1706764oic.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Oct 2019 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/bRTAch7TN8AElK6YT0WBBYEsDIeLtG7aQXPhu3kJI4=;
 b=GZvnZsM6Pnd8X7VO0LEZDIWWduU95y52I8n/w/6aeSFytaTQg2F9WhPJvs//5jmQmS
 dWOEvJBxGy9YY4IkNDbmBOwJbIadog/IV9IzwwXp6h2B+gM2E8ISVmSe7/jSOyXxWuAY
 gV43z6MpSmukpfazkuKfHWa4jaTkdDpPIon5aCJ15lbXZP1jyvhkx/7zUmSC/WnU/U2w
 3yP/MQgWg8aZGWBy9+0KVIBfzxW+gksm4RDF1IchroOIwOm6aY3g+mDewCPXBGvPRqif
 S0gWxDXoxXQLAbtJmM+qZ6ssPFcTtdttwUZLwJM838BPMCGRad54HdOAQgEqMT9YC5Zr
 O/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/bRTAch7TN8AElK6YT0WBBYEsDIeLtG7aQXPhu3kJI4=;
 b=njeiNTg8+GsmQS+TcZeid833bD51PXWetbcpkNExwWQ747RunvYs0nGdsGAjMWatav
 yCOBmj4iiQYBZ6NlIB3zkxv/rfIzkbonSXS5b0mS+tLx/UWZ326lSGTTrLDyj8K3QHD/
 A+dCOuKT8w+eEyLIyBVM4fNCmc13hHdcNeZpPsFe9m5MvezKvGmxjtSwUASnG8lut+RR
 PkkFniadLo4eBOsk94MctpUIvUJtOTmJwzvg2DQKfqCrX9lf3yKQT7ub8q2vvkRGxIZo
 IWsH7s1F4lbpN2MPo3igLTdtqCAiVolAw0Cf0IMum6YqRpRalEUsjrheLGp8KBKq0M7/
 ckBQ==
X-Gm-Message-State: APjAAAWyEBosgiAXmJqt7QP5HvuNNajTDW96BqnG5SBfZ1rF9oS2efEj
 l064zTTCS9pFfEPO28NlmE1F1WoTFMdz/wMezb/lvA==
X-Google-Smtp-Source: APXvYqx/2nIGI7laJjOizTEHsn9rqO7zwfRYbL0MYOlTcID/njBFEBvp7jh79RhvREn54ssV/9iSoM+0co+8LJHn/6M=
X-Received: by 2002:aca:2312:: with SMTP id e18mr2135924oie.98.1572011810153; 
 Fri, 25 Oct 2019 06:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570567870.git.alistair.francis@wdc.com>
 <mhng-0b0d87ea-8019-4226-b65c-76bdfc0c4189@palmer-si-x1e>
In-Reply-To: <mhng-0b0d87ea-8019-4226-b65c-76bdfc0c4189@palmer-si-x1e>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 14:56:39 +0100
Message-ID: <CAFEAcA-J-xGSx=0zjibvs5C1YD7_=YZy+NmghzUSFu6wh3e8Dg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] RISC-V: Convert to do_transaction_failed hook
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-List-Received-Date: Fri, 25 Oct 2019 13:56:54 -0000

On Tue, 8 Oct 2019 at 22:31, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 08 Oct 2019 13:51:46 PDT (-0700), Alistair Francis wrote:
> >
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
> > v2:
> >  - Rebase on master
> >
> >
> > Palmer Dabbelt (2):
> >   RISC-V: Handle bus errors in the page table walker
> >   RISC-V: Implement cpu_do_transaction_failed
> >
> >  target/riscv/cpu.c        |  2 +-
> >  target/riscv/cpu.h        |  7 +++++--
> >  target/riscv/cpu_helper.c | 23 ++++++++++++++++-------
> >  3 files changed, 22 insertions(+), 10 deletions(-)
>
> Thanks, these are in the queue.

Ping! These still don't seem to be in master, and softfreeze
is rapidly approaching (it's on the 29th).

(As a general observation, flow of riscv patches into
master seems to be quite slow. My recommendation would tend
to be doing smaller pullrequests more frequently; I try to
push through accumulated target-arm patches at least once
a fortnight, though it depends on how many patches are
arriving.)

thanks
-- PMM

