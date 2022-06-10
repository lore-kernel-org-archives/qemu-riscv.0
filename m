Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzciE-0000ea-Ly
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 07:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nzciB-0000aS-54
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 07:21:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nzci8-0000fh-Ky
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 07:21:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x17so36097416wrg.6
 for <qemu-riscv@nongnu.org>; Fri, 10 Jun 2022 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YcDTCA5Oxbt4VzFMZQI/kw7Rh8m/mmg+sZ4G1+h9J0I=;
 b=xbf0Br4iHDUxQVT15fBvvm4KozYzZu2NXQq7sb5/xczWoIbkniVja/MAeeJyq7Kl7A
 y4/cnNxnC3+d3mKvJPz5LH7A+MlrpMbFMHneekuaF+B8CJb8ZeZlzQd1OZ/FMZCQMwDN
 ub7q2FDprHqGwGa6PHgVwhHmtUN+vSUtmedmSnAQFgrByhpVUtEOwVfuV1ot8JG7Qfv2
 IAdqvWbIruGpb0xofoiej7toEnjWn+9Xi4dMUftDrKn3mlSNFcQybl3xuspacl1db48k
 KGFkqlwanWRqa4Pj2ULbcHgNIhziHVaJjVQ26vz7l0BKog+atv1eNiY7taiP0HmBe7SQ
 cNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YcDTCA5Oxbt4VzFMZQI/kw7Rh8m/mmg+sZ4G1+h9J0I=;
 b=63fGz7r1Ppcw8a+O5C3du8txbwr9Gd8r3n55NhdUwtPKgFaCc5h5Crw+Z/9SRSC/kS
 oKkhwk/GuDb08pAqRl4nR4MLC8az3/Y6hzkuFBjliS74KtXhS6BmJIkeW+FivYJuxuqu
 RR7RqTEBUcp6l8YXb8mXabSxlcruYZNnQuzENSDLJW+ec7+9c+68s5aHlQ+aWt4o0MJX
 IMsGF4uypf353M++2RXNNohk8cTzUTiXRiIm1d88EYlPVSGKfj3yvfQ+5SIBeZJaXb+A
 Dpk0JrrPhmicWYDlrsScBITxuFn0wJP3iaWMlPXzc8FYqY1K96GFu6Fn/MxIUFOet0LE
 vIEg==
X-Gm-Message-State: AOAM5334xlCwQRpkP9ql9sR7I1mqikLWr6Umh4ptu+sHlJl0Q4waYOOT
 076c22VaJnbbtwbalZjPWEGb+cHkrjvT+dU/kLSniw==
X-Google-Smtp-Source: ABdhPJxF2jpdBgrgHWzo+uwGVHYPcNg3RNzYVYJzQgQIeFuW66cgUiOsYTl9GxiIEcasq8NglR1fFNnV6SzUV20L29M=
X-Received: by 2002:a05:6000:1f18:b0:20f:e61b:520e with SMTP id
 bv24-20020a0560001f1800b0020fe61b520emr43579383wrb.214.1654860110139; Fri, 10
 Jun 2022 04:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220609033011.752714-4-apatel@ventanamicro.com>
 <OSZP286MB1435EBB271F8E9EEF5E2EF95C6A69@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <OSZP286MB1435EBB271F8E9EEF5E2EF95C6A69@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Jun 2022 16:51:37 +0530
Message-ID: <CAAhSdy1zyiV9PgDCY+4ijrzfeAdJ44wfT0b5dY+NqXzieZo_KQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
To: dramforever <dramforever@live.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::42a;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jun 2022 11:21:55 -0000

On Fri, Jun 10, 2022 at 3:00 PM dramforever <dramforever@live.com> wrote:
>
> Hi Anup Patel,
>
> I think there are some misunderstandings of the privileged spec with rega=
rds to
> [m|h]tinst handling. Here are some possible issues I've found:
>
> > +            case OPC_RISC_C_FUNC_FLD_LQ:
> > +                if (riscv_cpu_xlen(env) !=3D 128) { /* C.FLD (RV32/64)=
 */
> > +                    xinsn =3D OPC_RISC_FLD;
> > +                    xinsn =3D SET_RD(xinsn, GET_C_RS2S(insn));
> > +                    xinsn =3D SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                    xinsn =3D SET_I_IMM(xinsn, GET_C_LD_IMM(insn));
> > +                    xinsn_has_addr_offset =3D true;
> > +                }
> > +                break;
>
> The privileged spec requires that 'for basic loads and stores, the
> transformations replace the instruction=E2=80=99s immediate offset fields=
 with zero',
> so this SET_I_IMM() line isn't necessary. Similarly for all the compresse=
d
> instruction cases, the SET_I_IMM() and SET_S_IMM() calls are all unnecess=
ary.

Sure, I will update.

>
> > +    } else {
> > +        /* No need to transform 32bit (or wider) instructions */
> > +        xinsn =3D insn;
>
> For AMO, lr, sc, and hypervisor load/store instructions, this is fine. Bu=
t as
> above, 32-bit integer load/store instructions and floating point load/sto=
re
> instructions need have their immediate fields cleared to zero.

Okay, I will update.

>
> In addition, the various V-extension vector load/store instructions do no=
t have
> defined transformations, so they should show up in [m|h]tinst as all zero=
s.

Okay, I will update.

>
> > +    if (xinsn_has_addr_offset) {
> > +        /*
> > +         * The "Addr. Offset" field in transformed instruction is non-=
zero
> > +         * only for misaligned load/store traps which are very unlikel=
y on
> > +         * QEMU so for now always set "Addr. Offset" to zero.
> > +         */
> > +        xinsn =3D SET_RS1(xinsn, 0);
> > +    }
>
> There seems to be two misconceptions here:
>
> Firstly, QEMU *does* raise address misaligned exceptions for misaligned a=
tomic
> accesses.
>
> However, if I understood correctly, the address misaligned exceptions are
> irrelevant here because 'Addr. Offset' is only non-zero for a misaligned
> accesses that faults but *not* due to an address misaligned exception.
>
> For example, if an ld instruction reads 8 bytes starting from 0xa00ffe, a=
nd the
> page 0xa00000 to 0xa00fff is mapped, but 0xa01000 to 0xa01fff is not, a l=
oad
> page fault is raised with [m|s]tval =3D 0xa01000, while the original virt=
ual
> address of the access is 0xa00ffe. The 'Addr. Offset' in this case is 2, =
i.e.
> the difference calculated with (0xa01000 - 0xa00ffe). This means that we =
*do*
> have to set 'Addr. Offset' *because* we handle some misaligned load/store
> instructions.

Well, I am aware of how "Addr. Offset" field is set but I was not aware tha=
t
QEMU generates misaligned exception in a specific case (i.e. misaligned
atomic).

I will update this patch to

>
> > @@ -1355,18 +1558,31 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >      if (!async) {
> >          /* set tval to badaddr for traps with address information */
> >          switch (cause) {
> > -        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> >          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
> >          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> > -        case RISCV_EXCP_INST_ADDR_MIS:
> > -        case RISCV_EXCP_INST_ACCESS_FAULT:
> >          case RISCV_EXCP_LOAD_ADDR_MIS:
> >          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
> >          case RISCV_EXCP_LOAD_ACCESS_FAULT:
> >          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
> > -        case RISCV_EXCP_INST_PAGE_FAULT:
> >          case RISCV_EXCP_LOAD_PAGE_FAULT:
> >          case RISCV_EXCP_STORE_PAGE_FAULT:
> > +            write_gva =3D env->two_stage_lookup;
> > +            tval =3D env->badaddr;
> > +            if (env->two_stage_indirect_lookup) {
> > +                /*
> > +                 * special pseudoinstruction for G-stage fault taken w=
hile
> > +                 * doing VS-stage page table walk.
> > +                 */
> > +                tinst =3D (riscv_cpu_xlen(env) =3D=3D 32) ? 0x00002000=
 : 0x00003000;
> > +            } else {
> > +                /* transformed instruction for all other load/store fa=
ults */
> > +                tinst =3D riscv_transformed_insn(env, env->bins);
> > +            }
> > +            break;
> > +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> > +        case RISCV_EXCP_INST_ADDR_MIS:
> > +        case RISCV_EXCP_INST_ACCESS_FAULT:
> > +        case RISCV_EXCP_INST_PAGE_FAULT:
> >              write_gva =3D env->two_stage_lookup;
> >              tval =3D env->badaddr;
> >              break;
>
> Instruction guest-page faults should set [m|h]tinst to one of the
> pseudoinstructions if env->two_stage_lookup is true. Otherwise it should =
set
> [m|h]tinst to zero.
>
> In any case, as this seems to be one of the first implementations of
> [m|h]tinst, it might be worthwhile to confirm with the spec authors and c=
larify
> any unclear bits before this gets released.

This is already handled because tinst is initialized to zero.

Regards,
Anup

>
> dramforever

