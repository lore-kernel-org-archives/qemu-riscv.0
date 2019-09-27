Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDyAY-0000g7-2m
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 17:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iDyAT-0000d1-W4
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 17:52:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iDyAS-0001ds-UB
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 17:52:49 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:44107)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iDyAS-0001dF-NG; Fri, 27 Sep 2019 17:52:48 -0400
Received: by mail-lf1-x142.google.com with SMTP id q11so2960649lfc.11;
 Fri, 27 Sep 2019 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lJcKZk8/IoSvhj7jWvlyxigM7z8UqdXfxfgYKDykwLY=;
 b=S7fJFqfJ/NjODtXLl85taQuTnuSx+f4bJxlaLKaRWJM1dD7KxFiyMaWKxCq6Q65SU9
 Bh7alMry3k1bBejOZgBUC0ZPR/jzWrjPa3bqh+Fjkcrtzz4nOvkPMY0TutAnZo8y36+v
 2Znu7TydSOllLIaYeWeI2PD0wio8AxJT1QMxgFTuVgdKoprkVnq3T7q6VUBNCPu//owV
 xnltIoZ/zJ/xgwfBlorrniHoO7ywLo4+3qFKhVxGLbTE6nsdvtQgkg0rOpxy+vgDcL+J
 BOenb7cgxKrwc6W6hBNQJHlnl0unyGlXkV/yQW/PVDYL2ejHLguDOEL3s/Y7LJ0oTAmr
 mqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lJcKZk8/IoSvhj7jWvlyxigM7z8UqdXfxfgYKDykwLY=;
 b=Iyd3+V6NZ2+0qyhMpTZr7qwoflIhY5XObyXG6mkcb7a3QVQij7wazJmivpk40YKMNO
 hyj9oKyVSFCcXTWeRleApsjVmnuSHEqMkf0/sVToZG1WT6Ry8XOECKVuKjP1aOuloSq8
 ZdEUmAhgKMkcg4lhf87HjNCp4rEAUF6iL0/yCLUTbbrwgBeM9xs/mCUhFzLRJsSSD6ez
 7LYSc1FK0r9UcYuL+axvNFMAyHZp/VSi9YFAL10SBCVWt+jMgP9f02PaPu3v6iDSxO8E
 5EgCheeknzo7IpWbuvvnJnQLrCDJbKw2qwj//U1FioKvbuniFR19i77/bsRi0eOzZBLA
 0B4A==
X-Gm-Message-State: APjAAAVV9bRJhZ4VoBciGS5NX5dcthnwKSkvBOxlQuEgYe/T0QYtYtsq
 wdb7+Jbst8Z5t7mzMY46HmlKTYxKlFhFrrZTtMQ=
X-Google-Smtp-Source: APXvYqyonzFrGrNnWzXCasu1TtEIUoV7KvsVKuw+9Q7BomhBeH+NioUYddlfqusODWnnx5LOQ/Dc1DeWIHNVqJPpmMU=
X-Received: by 2002:ac2:484a:: with SMTP id 10mr4209412lfy.135.1569621166581; 
 Fri, 27 Sep 2019 14:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <98e88256-7a88-b505-9bde-0836cf21c654@linaro.org>
 <mhng-a709557f-be85-4a1e-9f95-d708e95c540e@palmer-si-x1e>
In-Reply-To: <mhng-a709557f-be85-4a1e-9f95-d708e95c540e@palmer-si-x1e>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 Sep 2019 14:47:59 -0700
Message-ID: <CAKmqyKNp=-CezYO0OMKwmM0a0p7VKUhv7K3dDr1OUbyY+JVyAw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 33/50] target/riscv: fetch code with
 translator_ld
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Emilio G. Cota" <cota@braap.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
X-List-Received-Date: Fri, 27 Sep 2019 21:52:52 -0000

On Wed, Jun 19, 2019 at 3:50 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 17 Jun 2019 15:38:45 PDT (-0700), richard.henderson@linaro.org wr=
ote:
> > On 6/14/19 10:11 AM, Alex Benn=C3=A9e wrote:
> >> +++ b/target/riscv/translate.c
> >> @@ -793,7 +793,7 @@ static void riscv_tr_translate_insn(DisasContextBa=
se *dcbase, CPUState *cpu)
> >>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> >>      CPURISCVState *env =3D cpu->env_ptr;
> >>
> >> -    ctx->opcode =3D cpu_ldl_code(env, ctx->base.pc_next);
> >> +    ctx->opcode =3D translator_ldl(env, ctx->base.pc_next);
> >
> > I'll note for the riscv folks that this is an existing bug, reading too=
 much in
> > the case of an RVC instruction.  This could well matter for the last 2-=
byte
> > instruction at the end of a page.
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Thanks for pointing this out.  I'm checking the ISA semantics with Andrew=
 to
> make sure I've got it right, as there's some implicit wording in the docu=
ment
> that doesn't quite do what I'd expect it to.

Did we figure out what to do here?

Alistair

>

