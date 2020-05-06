Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jWRPP-0004Hq-Mf
	for mharc-qemu-riscv@gnu.org; Wed, 06 May 2020 17:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jWRPC-0004GS-Mp; Wed, 06 May 2020 17:16:39 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:35207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jWRPB-00033Q-Ka; Wed, 06 May 2020 17:16:38 -0400
Received: by mail-il1-x142.google.com with SMTP id b18so9629ilf.2;
 Wed, 06 May 2020 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tn5+shFmeKu3NARcqqHb9rFqOkEIjUrR0Kf4TR2vk1w=;
 b=Gc2K+NcLe5NKZIUBkAJyMa8+4+z71BJUtSdSnpCWvf3SWcHAuvo2IB5DcxL0A6XEOS
 y4I0oojPBGNWd/gx6bGCMVUyS0y18ao/0eflpakUNMexeUE1jsFet0Jb6dFN+QzRe5Y6
 sCdGoHCBuPZdMDo6KcyMo+wu0pIDoHbmmN9NJCa2ILFIgkU6eG3wvezSsZol7R4Ludb3
 cD2Wxpu0WzODYOd7Bmu2TIeLKzLxHItkbzgBiNv/CtGkOSCEfK+sOGK5b+jOCAzg5Wfg
 1mSzewu11Ahx1ETa65uH6xyo4I33F27Ju2jtbhXrUWrrn5CgbJFw28r1Y/lvJbUA2Se6
 Zlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tn5+shFmeKu3NARcqqHb9rFqOkEIjUrR0Kf4TR2vk1w=;
 b=BMVPeiGLdS5tSbS7r7f2Cl+2f8F09WJRcNMYn5Ua2Ucf8B69aOwFx2taWczal4o7CJ
 4Q7+zlawNgkzjjwEERiFKoqeDijXigZONzkYalU2785p1fuPM+65i6RQQWz5dUindsEK
 xawTgNZgEZ/rwYMrZ0dfwtJozcoTX1DajjgXCjy02mULJGwQEaCyUO5Y4k8brEW0n3Va
 dEdgAvzBg+LItJRA/Klc7ZnxZpX4LBp9YyPG9fj7Mq06OS4FbbSXOUxFvarK8F2I26zL
 JXk+1nlJqnjKX/yedkeh3oWMW07ZqXkuA6C+oZ3MV6fcUjWVjtvUQnobvXAw5ZzJoJgQ
 F07g==
X-Gm-Message-State: AGi0PuanmwYHO/FRsnm0WFSTU1g1NlqqPJYzDcoXwnp3UZhdAo1szuzo
 nJOasfruL3ZpWvw6LIXn3wrbvna9J8bjl3G24Ag=
X-Google-Smtp-Source: APiQypLRHeYUh+yGfSqbliQTdjCIEM/DjQOp85/EX/rUEEd4WBcUaCyYHOhkoSGUaZ+/QB+OGbxwI9+P2PyWNECXD2o=
X-Received: by 2002:a92:ad09:: with SMTP id w9mr11556795ilh.177.1588799795862; 
 Wed, 06 May 2020 14:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200501185106.88767-1-josemartins90@gmail.com>
 <CAKmqyKPwcUWor2jn_fED8o8+aNOqVm11-q0ijAVWFakwp1CfkQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPwcUWor2jn_fED8o8+aNOqVm11-q0ijAVWFakwp1CfkQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 May 2020 14:07:52 -0700
Message-ID: <CAKmqyKNrrb6rkxpNFFyNhZtjxe5aYzDN9v2yX6NsXgyy2CcODA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix check of guest pa top bits
To: Jose Martins <josemartins90@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 06 May 2020 21:16:39 -0000

On Tue, May 5, 2020 at 1:40 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, May 1, 2020 at 11:51 AM Jose Martins <josemartins90@gmail.com> wrote:
> >
> > The spec states that on sv39x4 guest physical  "address bits 63:41 must
> > all be zeros, or else a guest-page-fault exception occurs.".  However,
> > the check performed for these top bits of the virtual address on the
> > second stage is the same as the one performed for virtual addresses on
> > the first stage except with the 2-bit extension, effectively creating
> > the same kind of "hole" in the guest's physical address space. I believe
> > the following patch fixes this issue:
> >
> > Signed-off-by: Jose Martins <josemartins90@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Applied to RISC-V tree.

This breaks 32-bit Hypervisors, can you look into it?

Alistair

>
> Alistair
>
> > ---
> >  target/riscv/cpu_helper.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 247304d850..ae22c30bdd 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -426,15 +426,21 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
> >      int va_bits = PGSHIFT + levels * ptidxbits + widened;
> >      target_ulong mask, masked_msbs;
> >
> > -    if (TARGET_LONG_BITS > (va_bits - 1)) {
> > -        mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> > +    if (!first_stage) {
> > +        if ((addr >> va_bits) != 0) {
> > +            return TRANSLATE_FAIL;
> > +        }
> >      } else {
> > -        mask = 0;
> > -    }
> > -    masked_msbs = (addr >> (va_bits - 1)) & mask;
> > +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> > +            mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> > +        } else {
> > +            mask = 0;
> > +        }
> > +        masked_msbs = (addr >> (va_bits - 1)) & mask;
> >
> > -    if (masked_msbs != 0 && masked_msbs != mask) {
> > -        return TRANSLATE_FAIL;
> > +        if (masked_msbs != 0 && masked_msbs != mask) {
> > +            return TRANSLATE_FAIL;
> > +        }
> >      }
> >
> >      int ptshift = (levels - 1) * ptidxbits;
> > --
> > 2.25.1
> >
> >

