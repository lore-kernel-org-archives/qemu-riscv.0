Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAdiW-0001Su-PO
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 15:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nAdhz-0001Pu-Fi
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 15:07:05 -0500
Received: from [2a00:1450:4864:20::32b] (port=46762
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nAdhD-0004hG-SK
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 15:06:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so16375270wmb.5
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 12:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YCZqAe2PY9PJhJjuWjBJZ+aFAb0Y/qeT3gFttJtEWzI=;
 b=Y6tamb0UYgT423goR3o2nK6Ougp+ReWy/xNoXCcFFtvOqdCQbRyK0xnEDTczQXI52h
 P+cOddYQuKo2KhDxyRHwTmdFE0ubamVqgwSycjQTQcvNEH/P93SrkTbBSc47GyiGw9WN
 bA95NN6YPa6P+ELBVyiL7dqDzD7Hcjr3zaZwnLE/5C5tOTBa/gg2J/PPcRlX4Dv43rKO
 Zs1kRGMOejQAR1fNENMeKMObjlzMWeeOJES2mnYiN0LrYWBAeVu5LruBSRiHz/fUz+YB
 pr1g6oTpK9eMIMq5Vl1yMcnj3c/Sl4rdOgBxGUE5f8Iczvdf0WYvh7ARq7flfSB0Hqf3
 wILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YCZqAe2PY9PJhJjuWjBJZ+aFAb0Y/qeT3gFttJtEWzI=;
 b=3WBosLBvra8lwTr2fGE7yGv6PV65Wqdj2dpD5wMgwmMuQbUZT2FfTlbA+t2fY2I/7B
 YpG2CeialiNaq3b0Q8RMrKpZf8aJjmkIlKz0n0WL+JkvHR2iFH25rYjxjSgrmeotKea+
 qCZl/YxFy4e3/8XVwAzVJMnG+DGE+XVivtTskTaJldSDUdF8x42cyxIuTkfcXDiEPdG7
 w33GnzbbJ+C7TPuxjOjMHaVhHI8r15l+x6OiEkWSMBlvWnNxPHmJMGX3Fxbl3Wgn/5xd
 23TxUBpTctNwoCPtykD2Vmih1WGbzbpM7M7mfvD1Zz3n/FeNzQX8u+1Qnb4z+0EyI0/V
 r2Bw==
X-Gm-Message-State: AOAM530a/SyEC85O0GvHOpKnPfZONcvb8EjV6kKHz6n+pGvKNw1PuKH/
 NGQWh9YualdJlg4Ju3EOIsjo/lM7PJXanpCDpUhTag==
X-Google-Smtp-Source: ABdhPJyl0RkBGrayYcUPW6IxDjATY66PxSWhwYfPapb0wkMt/5mIAjfdfk83wBo+/q3Q8OMLonDKZkxp9oncBBAWgvQ=
X-Received: by 2002:adf:f683:: with SMTP id v3mr655633wrp.306.1642709168562;
 Thu, 20 Jan 2022 12:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <aaf525e8-7dc5-f93d-0cc5-5ba560b5650f@amsat.org>
In-Reply-To: <aaf525e8-7dc5-f93d-0cc5-5ba560b5650f@amsat.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 20 Jan 2022 21:05:57 +0100
Message-ID: <CAAeLtUACeU3QZHbU7SnUNc5mgu2hQe9B0-9+zNsiLHhT0A8zRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: iterate over a table of decoders
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 20:07:13 -0000

On Wed, 19 Jan 2022 at 12:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 13/1/22 21:20, Philipp Tomsich wrote:
> > To split up the decoder into multiple functions (both to support
> > vendor-specific opcodes in separate files and to simplify maintenance
> > of orthogonal extensions), this changes decode_op to iterate over a
> > table of decoders predicated on guard functions.
> >
> > This commit only adds the new structure and the table, allowing for
> > the easy addition of additional decoders in the future.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > ---
> >
> > Changes in v2:
> > - (new patch) iterate over a table of guarded decoder functions
> >
> >   target/riscv/translate.c | 38 ++++++++++++++++++++++++++++++++------
> >   1 file changed, 32 insertions(+), 6 deletions(-)
> >
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 615048ec87..2cbf9cbb6f 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -116,6 +116,12 @@ static inline bool has_ext(DisasContext *ctx, uint=
32_t ext)
> >       return ctx->misa_ext & ext;
> >   }
> >
> > +static inline bool always_true_p(CPURISCVState *env  __attribute__((__=
unused__)),
> > +                                 DisasContext *ctx  __attribute__((__u=
nused__)))
> > +{
> > +    return true;
> > +}
> > +
> >   #ifdef TARGET_RISCV32
> >   #define get_xl(ctx)    MXL_RV32
> >   #elif defined(CONFIG_USER_ONLY)
> > @@ -844,16 +850,28 @@ static uint32_t opcode_at(DisasContextBase *dcbas=
e, target_ulong pc)
> >
> >   static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_=
t opcode)
> >   {
> > -    /* check for compressed insn */
> > +    /* If not handled, we'll raise an illegal instruction exception */
> > +    bool handled =3D false;
> > +
> > +    /*
> > +     * A table with predicate (i.e., guard) functions and decoder func=
tions
> > +     * that are tested in-order until a decoder matches onto the opcod=
e.
> > +     */
> > +    const struct {
> > +        bool (*guard_func)(CPURISCVState *, DisasContext *);
> > +        bool (*decode_func)(DisasContext *, uint32_t);
> > +    } decoders[] =3D {
> > +        { always_true_p,  decode_insn32 },
> > +    };
> > +
> > +    /* Check for compressed insn */
> >       if (extract16(opcode, 0, 2) !=3D 3) {
> >           if (!has_ext(ctx, RVC)) {
> >               gen_exception_illegal(ctx);
> >           } else {
> >               ctx->opcode =3D opcode;
> >               ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
> > -            if (!decode_insn16(ctx, opcode)) {
> > -                gen_exception_illegal(ctx);
> > -            }
> > +            handled =3D decode_insn16(ctx, opcode);
> >           }
> >       } else {
> >           uint32_t opcode32 =3D opcode;
> > @@ -862,10 +880,18 @@ static void decode_opc(CPURISCVState *env, DisasC=
ontext *ctx, uint16_t opcode)
> >                                                ctx->base.pc_next + 2));
> >           ctx->opcode =3D opcode32;
> >           ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
> > -        if (!decode_insn32(ctx, opcode32)) {
> > -            gen_exception_illegal(ctx);
> > +
> > +        for (size_t i =3D 0; i < ARRAY_SIZE(decoders); ++i) {
> > +            if (!decoders[i].guard_func(env, ctx))
> > +                continue;
> > +
> > +            if ((handled =3D decoders[i].decode_func(ctx, opcode32)))
> > +                break;
>
> Again, while we might check whether "Vendor Extensions" are enabled or
> not at runtime, they are specific to a (vendor) core model, so we know
> their availability  at instantiation time.
>
> I don't understand the need to iterate. You can check for vendor
> extensions in riscv_tr_init_disas_context() and set a vendor_decoder()
> handler in DisasContext, which ends calling the generic decode_opc()
> one.

While the design you propose is a valid variation that will achieve
most of the functionality, I don't believe that this is the best way
forward.
A key issue is that it will interfere with using the command-line to
enable/disable such vendor-defined extensions easily (i.e., "-cpu
any,XVentanaCondOps=3Dtrue" will not work).

It also looks like there is a misunderstanding of how vendor-defined
extensions work: these will not be the same for every vendor core and
may be implemented by multiple vendors (after all: these are
vendor-defined, not vendor-specific). Trying to force the RISC-V
vendors down the route of handling this via a specialized decoder
function set up in riscv_tr_init_disas_context(), will eventually
force them to have multiple decode functions for
chip-families/generations =E2=80=94 this is not conducive to easy
maintainability of the codebase.

Regards,
Philipp.

>
> >           }
> >       }
> > +
> > +    if (!handled)
> > +        gen_exception_illegal(ctx);
> >   }
> >
> >   static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPU=
State *cs)
>

