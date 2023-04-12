Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmY9F-0006Gi-MV
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 06:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmY9D-0006Er-WF; Wed, 12 Apr 2023 06:56:20 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmY9B-0000cq-FR; Wed, 12 Apr 2023 06:56:19 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id b17so10082819vsj.7;
 Wed, 12 Apr 2023 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681296976; x=1683888976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hKYo4FW9wYocnpqIfdgZrtnnuL1dLBZrXPKy53rmJ5Q=;
 b=IwtCc6nxS5c35WOUXyeXeWOk6VH+IovY3UabJXLnEzurYv32sL8WFvC/lZhiCed2Kj
 V6IjMqzOt1tLEgCtnGlRE1Ww/5H15HDnJfirp+2EEO9+ybQntWsL+jgDAOA6bgVCieUF
 3yaN7QMZzAzaNPIRJ0RH4GmfoylgSXOTuy8m1fx/yB5covpmJvgi943V+6Ep/Mca1vur
 PviuiarNY2+hjsmhM8XtUBFjUeJDUtCxiexIC+U0fT14LTx6hAhvcxsis7MwtkpZntm7
 3CEGcrtPqcHoEkgRyonkNHsGZCxLALruqP9wh/jRwjsfj2vp7V/75FohIInSDzcj1ldR
 fBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681296976; x=1683888976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hKYo4FW9wYocnpqIfdgZrtnnuL1dLBZrXPKy53rmJ5Q=;
 b=GcX2ksrYyxSEv0I04BXCNdpf2VN4Q07QUW6R4PoGg6Vy3HyD0A1YCny3j7+vIgtRHM
 hU/WyE21RyWTw4pvJ6WfrRLgruVt3KHhENgh5jQ4aBF/+veVpM8gPlihHlmecPLRwpuk
 MoV+yiEnhkHL3Xq/LLF5KL2hwRrfy6+Iz1zYkcpfJtEJZmBgfQxaLrvKJD7uALSD1MDR
 JcJGEbhLiobZ1hY1elDTr9he89Ow7x4EwaSN0xLpXn9a+8dLDI81tCqOHiCi6OamTh53
 N8imUFZpvHELxgRpZN6IYKEdWl3DodFzdgISxsdKXqJb74Rs0pqRFteqXNb/DOcdfogX
 h5ig==
X-Gm-Message-State: AAQBX9fBUvF9OVKRYUcJAp9zdsAlgWnr24fOD8A+WmQryZDREDlW8jqh
 DVTys0k7F/OQirEt5uKJCw7y6wx4TiTqaBbDov4=
X-Google-Smtp-Source: AKy350YLKnbpE4DMsez4n+o5Qy2XXWPHIhySzENSpz4OtZ1np5jUvz0uaEAR6UIsp0SPH6EOmKj+NDVfnHlh15cLs2g=
X-Received: by 2002:a67:e15e:0:b0:42c:33ab:97fd with SMTP id
 o30-20020a67e15e000000b0042c33ab97fdmr1017343vsl.3.1681296975834; Wed, 12 Apr
 2023 03:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
 <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
 <CAKmqyKP6Omm8HypeRps0xCaZXxw+VXsT0KY2ONtfOZmjR9WnDA@mail.gmail.com>
 <0f2ebe23-750c-26eb-9d3e-920c80a3c222@iscas.ac.cn>
In-Reply-To: <0f2ebe23-750c-26eb-9d3e-920c80a3c222@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 20:55:49 +1000
Message-ID: <CAKmqyKNSkGwRC8Ysu0nFDyBq58ZtL=JWpSO=X3sYkat-UzZdzA@mail.gmail.com>
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 richard.henderson@linaro.org, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, 
 lazyparser@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 10:56:20 -0000

On Wed, Apr 12, 2023 at 12:55=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
>
> On 2023/4/12 10:12, Alistair Francis wrote:
> > On Fri, Apr 7, 2023 at 6:23=E2=80=AFAM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >> Hi,
> >>
> >> This patch is going to break the sifive_u boot if I rebase
> >>
> >> "[PATCH v6 0/9] target/riscv: rework CPU extensions validation"
> >>
> >> on top of it, as it is the case today with the current riscv-to-apply.=
next.
> >>
> >> The reason is that the priv spec version for Zca is marked as 1_12_0, =
and
> >> the priv spec version for both sifive CPUs is 1_10_0, and both are ena=
bling
> >> RVC.
> >>
> >> This patch from that series above:
> >>
> >> "[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec validate/disable_ext=
s helpers"
> >>
> >> Makes the disabling of the extension based on priv version to happen *=
after* we
> >> do all the validations, instead of before as we're doing today. Zca (a=
nd Zcd) will
> >> be manually enabled just to be disabled shortly after by the priv spec=
 code. And
> >> this will happen:
> >>
> >> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000=
00000000000 because privilege spec version does not match
> >> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000=
00000000001 because privilege spec version does not match
> >> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000=
00000000001 because privilege spec version does not match
> >> (--- hangs ---)
> >>
> >> This means that the assumption made in this patch - that Zca implies R=
VC - is no
> >> longer valid, and all these translations won't work.
> > Thanks for catching and reporting this
> >
> >>
> >> Some possible solutions:
> >>
> >> - Do not use Zca as a synonym for RVC, i.e. drop this patch. We would =
need to convert
> >> all Zca checks to RVC checks in all translation code.
> > This to me seems like the best solution
>
> I had also implemented a patch for this solution. I'll sent it later.

Thanks!

>
> However, this will introduce additional check. i.e. check both Zca and C
> or , both Zcf/d and CF/CD.

Is there a large performance penalty for that?

>
> I think this is not very necessary. Implcitly-enabled extensions is
> often the subsets of existed extension.

Yeah, I see what you are saying. It just becomes difficult to manage
though. It all worked fine until there are conflicts between the priv
specs.

>
> So enabling them will introduce no additional function to the cpus.
>
> We can just make them invisible to user(mask them in the isa string)
> instead of disabling them  to be compatible with lower priv version.

I'm open to other options, but masking them like this seems like more
work and also seems confusing. The extension will end up enabled in
QEMU and potentially visible to external tools, but then just not
exposed to the guest. It seems prone to future bugs.

Alistair

>
> Regards,
>
> Weiwei Li
>
>
> >
> >> - Do not apply patch 5/9 from that series that moves the disable_ext c=
ode to the end
> >> of validation. Also a possibility, but we would be sweeping the proble=
m under the rug.
> >> Zca still can't be used as a RVC replacement due to priv spec version =
constraints, but
> >> we just won't disable Zca because we'll keep validating exts too early=
 (which is the
> >> problem that the patch addresses).
> >>
> >> - change the priv spec of the sifive CPUs - and everyone that uses RVC=
 -  to 1_12_0. Not
> >> sure if this makes sense.
> >>
> >> - do not disable any extensions due to privilege spec version mismatch=
. This would make
> >> all the priv_version related artifacts to be more "educational" than t=
o be an actual
> >> configuration we want to enforce. Not sure if that would do any good i=
n the end, but
> >> it's also a possibility.
> > This also seems like something we can do. Printing a warning but
> > continuing on seems reasonable to me. That allows users to
> > enable/disable features even if the versions don't match.
> >
> > I don't think this is the solution for this problem though
> >
> > Alistair
> >
> >>
> >> I'll hold the rebase of that series until we sort this out. Thanks,
> >>
> >>
> >> Daniel
> >>
> >>
> >>
> >> On 3/7/23 05:13, Weiwei Li wrote:
> >>> Modify the check for C extension to Zca (C implies Zca).
> >>>
> >>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >>> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> >>> ---
> >>>    target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
> >>>    target/riscv/translate.c                | 8 ++++++--
> >>>    2 files changed, 8 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/i=
nsn_trans/trans_rvi.c.inc
> >>> index 4ad54e8a49..c70c495fc5 100644
> >>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> >>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> >>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr =
*a)
> >>>        tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
> >>>
> >>>        gen_set_pc(ctx, cpu_pc);
> >>> -    if (!has_ext(ctx, RVC)) {
> >>> +    if (!ctx->cfg_ptr->ext_zca) {
> >>>            TCGv t0 =3D tcg_temp_new();
> >>>
> >>>            misaligned =3D gen_new_label();
> >>> @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *=
a, TCGCond cond)
> >>>
> >>>        gen_set_label(l); /* branch taken */
> >>>
> >>> -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) =
{
> >>> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x=
3)) {
> >>>            /* misaligned */
> >>>            gen_exception_inst_addr_mis(ctx);
> >>>        } else {
> >>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> >>> index 0ee8ee147d..d1fdd0c2d7 100644
> >>> --- a/target/riscv/translate.c
> >>> +++ b/target/riscv/translate.c
> >>> @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, ta=
rget_ulong imm)
> >>>
> >>>        /* check misaligned: */
> >>>        next_pc =3D ctx->base.pc_next + imm;
> >>> -    if (!has_ext(ctx, RVC)) {
> >>> +    if (!ctx->cfg_ptr->ext_zca) {
> >>>            if ((next_pc & 0x3) !=3D 0) {
> >>>                gen_exception_inst_addr_mis(ctx);
> >>>                return;
> >>> @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, Dis=
asContext *ctx, uint16_t opcode)
> >>>        if (insn_len(opcode) =3D=3D 2) {
> >>>            ctx->opcode =3D opcode;
> >>>            ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
> >>> -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
> >>> +        /*
> >>> +         * The Zca extension is added as way to refer to instruction=
s in the C
> >>> +         * extension that do not include the floating-point loads an=
d stores
> >>> +         */
> >>> +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
> >>>                return;
> >>>            }
> >>>        } else {
>

