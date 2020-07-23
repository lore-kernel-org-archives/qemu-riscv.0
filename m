Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyRm3-0007Vo-Iv
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 23:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jyRm1-0007VN-Vm
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 23:19:58 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jyRm0-0008G8-6m
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 23:19:57 -0400
Received: by mail-oi1-x241.google.com with SMTP id k22so3804736oib.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 20:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZb8bgOsL5mFApO2M10m0/shIHhd5XWTPXvK0ity2oI=;
 b=cLXbhmD+73DAcQ9fITOiSFCZSfuheJ0AXkyoLbljHuW2laQp3n4qWoUIrHgbH1Ng7/
 R9pQsg+svre8xXAJqQWtV0yNs5RhYL1Ny1luvLq994dLDH/UAno8JxuXhJMdxT1wok/d
 oIaCrqUmSoGUig5EiJ8+GrIvO8o5SpPl/R1V0h0urzI1U2mXwJ4XR8dJydpmAIfFj+CI
 ofZCcW9Ttw2+6G4aD68xethgS47o7kVUndRfpp0fNL/vpQRgTTtjwjtSGvzZS4MSRAxh
 38dKyWsl0Gdd3VrypzfOLTgwR0nviUEiZMDD781H273BjbHrFyPB2V+JwQRZUuk6QC4T
 CGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZb8bgOsL5mFApO2M10m0/shIHhd5XWTPXvK0ity2oI=;
 b=U4XCh0joOQk0ISeceI4vHqZ+6UICMIlYgF7uiW+IA/EUZlrmMskidKX9jWGVlvGwdu
 u2/BtJj2XDoL0jSeMjDgZ1j0oPq4AxcFI95RzLeBWrupVj0UheqzY7qo7iRFryMJjQny
 IfYdJjJ/1tGssjqxRhUx47xEh+zVWJKkncc/95yRVLGQvP+QcyE2eU+lHKrkQ1Lpstix
 RtH5U0/TY6NZ8NjHonKCywHsCVVuw3siAciydrwBhGJuFiVBH/b+S0gXkETcBl8n+65S
 amebrDg9vKUGbnCR0HQCrNUD8rztty8VbybvFVEO3vLFV8hu4CpmGla+rvVKdU/zuoTr
 AvPQ==
X-Gm-Message-State: AOAM533nF3Q9Qhgb7q1A4wytWjvp8rfAynRGtgwzNH/4Rgj9WiqbT5PF
 Gxz7R8DgTZmC7w+A7I/LRHZp9HXhl/Ayqxag1KqH3Q==
X-Google-Smtp-Source: ABdhPJzkl9wbsgTj543OUj9XzxXgfbMxKZzsAkWFiOpV4OnYmHFDWBwymCHt+NK7+shTxyjZWTkBlgCeGJKYQYai0DY=
X-Received: by 2002:aca:d509:: with SMTP id m9mr2117759oig.116.1595474394113; 
 Wed, 22 Jul 2020 20:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595335112.git.zong.li@sifive.com>
 <80450819119ba8493f18c825517f1b4f37eeb600.1595335112.git.zong.li@sifive.com>
 <CAEUhbmUFq+j4fD5pKDwp8RPPZNaRvFcG5uUAsp6KZSKhSC8dWQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUFq+j4fD5pKDwp8RPPZNaRvFcG5uUAsp6KZSKhSC8dWQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 23 Jul 2020 11:19:44 +0800
Message-ID: <CANXhq0o86=DLmVSwgd0-BPDyiZoTqtUMjL-WVApbwH67i+UrMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv/pmp.c: Fix the index offset on RV64
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=zong.li@sifive.com; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jul 2020 03:19:58 -0000

On Wed, Jul 22, 2020 at 12:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Zong,
>
> On Tue, Jul 21, 2020 at 8:41 PM Zong Li <zong.li@sifive.com> wrote:
> >
> > On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
> > entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
> > implementation, the second parameter of pmp_write_cfg is
> > "reg_index * sizeof(target_ulong)", and we get the the result
> > which is started from 16 if reg_index is 2, but we expect that
> > it should be started from 8. Separate the implementation for
> > RV32 and RV64 respectively.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> >
> > Changed in v3:
> >  - Refine the implementation. Suggested by Bin Meng.
> >
> > Changed in v2:
> >  - Move out the shifting operation from loop. Suggested by Bin Meng.
>
> As I mentioned previously, these changelog should go after --- below.
> It should not appear in the commit message.
>

OK, remove it in the next version.

> > ---
> >  target/riscv/pmp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index 2a2b9f5363..f2d50bace5 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -318,6 +318,10 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
> >          return;
> >      }
> >
> > +#if defined(TARGET_RISCV64)
> > +    reg_index >>= 1;
> > +#endif
> > +
> >      for (i = 0; i < sizeof(target_ulong); i++) {
> >          cfg_val = (val >> 8 * i)  & 0xff;
> >          pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
> > @@ -335,6 +339,10 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
> >      target_ulong cfg_val = 0;
> >      target_ulong val = 0;
> >
> > +#if defined(TARGET_RISCV64)
> > +    reg_index >>= 1;
> > +#endif
>
> We should also move the following:
>
>     trace_pmpcfg_csr_read(env->mhartid, reg_index, cfg_val);
>
> before shifting reg_index. Otherwise it traces the wrong pmpcfg CSR read.

Yes, thanks for the reminding, Fix it in the next version.

>
> > +
> >      for (i = 0; i < sizeof(target_ulong); i++) {
> >          val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
> >          cfg_val |= (val << (i * 8));
> > --
>
> Regards,
> Bin

