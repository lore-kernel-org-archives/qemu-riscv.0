Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmPyX-0004sD-Fo
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmPyV-0004rs-LB; Tue, 11 Apr 2023 22:12:43 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmPyT-00047d-FD; Tue, 11 Apr 2023 22:12:43 -0400
Received: by mail-ua1-x92f.google.com with SMTP id ba16so6975806uab.4;
 Tue, 11 Apr 2023 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681265560; x=1683857560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vMSj0pakRW4WGTWNcnRVCfK9r7Rc8hPje5qN2G36lI=;
 b=nI8hQZMtRDg6E76+RanzDhqF7mPNfYvGwsweQWe6LbG4nJ5fCmwMl6ZZvgCeF6wlJv
 mUYVoY+XeI+QK03iT5J97Drab8G1Vx5wqQcYj8XRJepAmpksmFkcP2SPfxPEij276fkw
 vYkpNUB0PPM7APIweSNmaKmptKFDVbZzCvLSyHtC7Y+cLFYQcUvupa1Ey4ysEvXBeMXl
 JOvEnKV6bEiGvMPI0SHalTVKUx3cpvXOd4ELXvPMzGzjQ1Tqm6O3y377nEs9lpMfzDHz
 TLNcVCJKOTrPb8bcDkEMaNUwE/LEUYpfGq9BDaID04X8qI1GJuVE5HZHWTH6VHtC3e43
 aTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681265560; x=1683857560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vMSj0pakRW4WGTWNcnRVCfK9r7Rc8hPje5qN2G36lI=;
 b=kWzGb5AIHp/W6IAVu8sSU7HtVh/tizZy8wlbMSpa1hOjo3MQ+85jbAY3VOZEAti0Qi
 xVeiRSKxQKwYtGiZ0/BCqi9J+x/ffvHrQ89DxE5Wat9GDI7KF2YLgPxd1TH9q7CORUSr
 XY4klJiHO9TXp/Vf7nu64wzMa3s1EIaZ6J5+oi7vDBbu2+KxpbOhgsw+cj6UEtXAZxnz
 lkoQbblgF3SSuXkqnAre9KPfLXpWbXLjYBegiPjNaRnQD5gaxQ6AB0CgqYHIaYmNt9nc
 LThmsNi8a5x5q1SlfLvd5R8CKYgXkzpy2JCLB9r5SQm9FhNpHRjD6llpHeCEiv8GnKPD
 Q66w==
X-Gm-Message-State: AAQBX9eMdgDMUOP/vqtAVfnEjqbtD7OWVE8BcnKYSbx95oLwq4sk3txB
 3+TD2n/6CU66DINUBBM+6ktV9PhLo4f/B9Y8Giw=
X-Google-Smtp-Source: AKy350ZJcyXDfWQd4l4YiPUpIUYGyBVh/3uzqhHcL9f+O4gynIrFld0gdnht7mvVjrk2Xi4llWqr7D1UD4aJ7ASaEus=
X-Received: by 2002:ab0:600d:0:b0:771:d550:cfa0 with SMTP id
 j13-20020ab0600d000000b00771d550cfa0mr898945ual.0.1681265559881; Tue, 11 Apr
 2023 19:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
 <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
In-Reply-To: <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 12:12:13 +1000
Message-ID: <CAKmqyKP6Omm8HypeRps0xCaZXxw+VXsT0KY2ONtfOZmjR9WnDA@mail.gmail.com>
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, richard.henderson@linaro.org,
 palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 02:12:43 -0000

On Fri, Apr 7, 2023 at 6:23=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This patch is going to break the sifive_u boot if I rebase
>
> "[PATCH v6 0/9] target/riscv: rework CPU extensions validation"
>
> on top of it, as it is the case today with the current riscv-to-apply.nex=
t.
>
> The reason is that the priv spec version for Zca is marked as 1_12_0, and
> the priv spec version for both sifive CPUs is 1_10_0, and both are enabli=
ng
> RVC.
>
> This patch from that series above:
>
> "[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec validate/disable_exts h=
elpers"
>
> Makes the disabling of the extension based on priv version to happen *aft=
er* we
> do all the validations, instead of before as we're doing today. Zca (and =
Zcd) will
> be manually enabled just to be disabled shortly after by the priv spec co=
de. And
> this will happen:
>
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000001 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000000=
00000001 because privilege spec version does not match
> (--- hangs ---)
>
> This means that the assumption made in this patch - that Zca implies RVC =
- is no
> longer valid, and all these translations won't work.

Thanks for catching and reporting this

>
>
> Some possible solutions:
>
> - Do not use Zca as a synonym for RVC, i.e. drop this patch. We would nee=
d to convert
> all Zca checks to RVC checks in all translation code.

This to me seems like the best solution

>
> - Do not apply patch 5/9 from that series that moves the disable_ext code=
 to the end
> of validation. Also a possibility, but we would be sweeping the problem u=
nder the rug.
> Zca still can't be used as a RVC replacement due to priv spec version con=
straints, but
> we just won't disable Zca because we'll keep validating exts too early (w=
hich is the
> problem that the patch addresses).
>
> - change the priv spec of the sifive CPUs - and everyone that uses RVC - =
 to 1_12_0. Not
> sure if this makes sense.
>
> - do not disable any extensions due to privilege spec version mismatch. T=
his would make
> all the priv_version related artifacts to be more "educational" than to b=
e an actual
> configuration we want to enforce. Not sure if that would do any good in t=
he end, but
> it's also a possibility.

This also seems like something we can do. Printing a warning but
continuing on seems reasonable to me. That allows users to
enable/disable features even if the versions don't match.

I don't think this is the solution for this problem though

Alistair

>
>
> I'll hold the rebase of that series until we sort this out. Thanks,
>
>
> Daniel
>
>
>
> On 3/7/23 05:13, Weiwei Li wrote:
> > Modify the check for C extension to Zca (C implies Zca).
> >
> > Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> > ---
> >   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
> >   target/riscv/translate.c                | 8 ++++++--
> >   2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/ins=
n_trans/trans_rvi.c.inc
> > index 4ad54e8a49..c70c495fc5 100644
> > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a=
)
> >       tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
> >
> >       gen_set_pc(ctx, cpu_pc);
> > -    if (!has_ext(ctx, RVC)) {
> > +    if (!ctx->cfg_ptr->ext_zca) {
> >           TCGv t0 =3D tcg_temp_new();
> >
> >           misaligned =3D gen_new_label();
> > @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a,=
 TCGCond cond)
> >
> >       gen_set_label(l); /* branch taken */
> >
> > -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
> > +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)=
) {
> >           /* misaligned */
> >           gen_exception_inst_addr_mis(ctx);
> >       } else {
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 0ee8ee147d..d1fdd0c2d7 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, targ=
et_ulong imm)
> >
> >       /* check misaligned: */
> >       next_pc =3D ctx->base.pc_next + imm;
> > -    if (!has_ext(ctx, RVC)) {
> > +    if (!ctx->cfg_ptr->ext_zca) {
> >           if ((next_pc & 0x3) !=3D 0) {
> >               gen_exception_inst_addr_mis(ctx);
> >               return;
> > @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, Disas=
Context *ctx, uint16_t opcode)
> >       if (insn_len(opcode) =3D=3D 2) {
> >           ctx->opcode =3D opcode;
> >           ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
> > -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
> > +        /*
> > +         * The Zca extension is added as way to refer to instructions =
in the C
> > +         * extension that do not include the floating-point loads and =
stores
> > +         */
> > +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
> >               return;
> >           }
> >       } else {
>

