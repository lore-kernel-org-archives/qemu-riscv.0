Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poEie-00055z-4K
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poEib-00055c-U5; Sun, 16 Apr 2023 22:35:49 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poEiZ-0000OO-Cz; Sun, 16 Apr 2023 22:35:49 -0400
Received: by mail-vs1-xe31.google.com with SMTP id v10so21849270vsf.6;
 Sun, 16 Apr 2023 19:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681698946; x=1684290946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaTXsqeb+dpCjL6hhltsU5oJXdl1+GzGg9n2iYuf8Ss=;
 b=k4DLEmjHIOFHtwanEl5JiBdLMJyC/VoI1+cMyeM3TLFy8uiR+YjfW90PGxYonrheDt
 IMalAjXXIZL/QeLLvoRCE8obt6XjLXFejP9us6jeZr12GG5spU1fMtyZLgZTQUiz2UWI
 MYtLM/BZT+pqZnULwWnIKRoxKESTyZjRMu27q+OGWmRES+n4gK50IaBBN5WVMuaQdkpz
 BlZKWU0qdPeSmLvUPBWvOh6fq8npV8GK+IFXvgHYTOkMcXYN1WheRK4d91/JGDpRWIf4
 5rVpxIWoXEE4W3jU7qWnvRR6zvri4BaVOM93J3LG/q1hH7wTJvtOVmeMW1DWz3Bv4yd4
 QSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681698946; x=1684290946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaTXsqeb+dpCjL6hhltsU5oJXdl1+GzGg9n2iYuf8Ss=;
 b=ECsUSu4AcxkqV7rVm7i9FmMLlZT423Wq1HKFaIZtXkB8u33G0ZwHJ8j0IjUoxLP02M
 ClqxUjFcWuPFl5yPgqjBTDmjkU6jVEWc2N/ju4IExK/UnGqL7ccG0S4jrCvDs/Q5PEj9
 yXKJ774/UXrLN9MCT1sGf7we+SXI0A9mDa4z7BB1jAbaqv0p84qv+p4vK4EPAR9QfG06
 hzzI03zLnQWcVRnfH5FgzmV3r4xmrqJip+eiQZdU5NA8pJHxy6uugo0nm/y1bmixNP+L
 vksU7ukg3e45UAkkKe+sW2KcIRnYh8UyDitTmSCHVHz1D9UJy5rfMYth0166hhiOfnuJ
 pGvQ==
X-Gm-Message-State: AAQBX9fX9FpKaJcf3rFZdzek+LFsZknE2aqGpNWsH65ubv4D7Owncf1x
 czN9E4D4kT4Z6EPkBhxBUZi8nxZP9mEM8s8AqtIkvG43KOoiDbDE
X-Google-Smtp-Source: AKy350aHFn8VY40q7ys/MM3FDcdFsI53OViFuTs7MtpRkiPqmJdntgFYqBrckzLvm/E4qLAgDzqyZmVhWg9CFHlTYek=
X-Received: by 2002:a67:d991:0:b0:42e:5f23:3f68 with SMTP id
 u17-20020a67d991000000b0042e5f233f68mr2788279vsj.3.1681698945838; Sun, 16 Apr
 2023 19:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
 <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
 <CAKmqyKP6Omm8HypeRps0xCaZXxw+VXsT0KY2ONtfOZmjR9WnDA@mail.gmail.com>
 <0f2ebe23-750c-26eb-9d3e-920c80a3c222@iscas.ac.cn>
 <CAKmqyKNSkGwRC8Ysu0nFDyBq58ZtL=JWpSO=X3sYkat-UzZdzA@mail.gmail.com>
 <9e1f46dc-088d-eb46-1d5e-90cc8648dd16@iscas.ac.cn>
 <4214bba1-242c-1cb4-4996-804bc654d9b1@ventanamicro.com>
In-Reply-To: <4214bba1-242c-1cb4-4996-804bc654d9b1@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:35:19 +1000
Message-ID: <CAKmqyKOS8JXahHKW_Bymi85q0NFiQzYZjMmHoS=deuPZBONbKA@mail.gmail.com>
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, richard.henderson@linaro.org,
 palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 02:35:50 -0000

On Thu, Apr 13, 2023 at 3:24=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 4/12/23 08:35, Weiwei Li wrote:
> >
> > On 2023/4/12 18:55, Alistair Francis wrote:
> >> On Wed, Apr 12, 2023 at 12:55=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.=
cn> wrote:
> >>>
> >>> On 2023/4/12 10:12, Alistair Francis wrote:
> >>>> On Fri, Apr 7, 2023 at 6:23=E2=80=AFAM Daniel Henrique Barboza
> >>>> <dbarboza@ventanamicro.com> wrote:
> >>>>> Hi,
> >>>>>
> >>>>> This patch is going to break the sifive_u boot if I rebase
> >>>>>
> >>>>> "[PATCH v6 0/9] target/riscv: rework CPU extensions validation"
> >>>>>
> >>>>> on top of it, as it is the case today with the current riscv-to-app=
ly.next.
> >>>>>
> >>>>> The reason is that the priv spec version for Zca is marked as 1_12_=
0, and
> >>>>> the priv spec version for both sifive CPUs is 1_10_0, and both are =
enabling
> >>>>> RVC.
> >>>>>
> >>>>> This patch from that series above:
> >>>>>
> >>>>> "[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec validate/disable_=
exts helpers"
> >>>>>
> >>>>> Makes the disabling of the extension based on priv version to happe=
n *after* we
> >>>>> do all the validations, instead of before as we're doing today. Zca=
 (and Zcd) will
> >>>>> be manually enabled just to be disabled shortly after by the priv s=
pec code. And
> >>>>> this will happen:
> >>>>>
> >>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x00=
00000000000000 because privilege spec version does not match
> >>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x00=
00000000000001 because privilege spec version does not match
> >>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00=
00000000000001 because privilege spec version does not match
> >>>>> (--- hangs ---)
> >>>>>
> >>>>> This means that the assumption made in this patch - that Zca implie=
s RVC - is no
> >>>>> longer valid, and all these translations won't work.
> >>>> Thanks for catching and reporting this
> >>>>
> >>>>> Some possible solutions:
> >>>>>
> >>>>> - Do not use Zca as a synonym for RVC, i.e. drop this patch. We wou=
ld need to convert
> >>>>> all Zca checks to RVC checks in all translation code.
> >>>> This to me seems like the best solution
> >>> I had also implemented a patch for this solution. I'll sent it later.
> >> Thanks!
> >>
> >>> However, this will introduce additional check. i.e. check both Zca an=
d C
> >>> or , both Zcf/d and CF/CD.
> >> Is there a large performance penalty for that?
> >
> > May not very large.  Just one or two additional check in instruction tr=
anslation. You can see the patch at:
> >
> > https://lore.kernel.org/qemu-devel/20230412030648.80470-1-liweiwei@isca=
s.ac.cn/

This is my prefered way. I think it's pretty simple and explicitly
follows the spec.

> >
> >>
> >>> I think this is not very necessary. Implcitly-enabled extensions is
> >>> often the subsets of existed extension.
> >> Yeah, I see what you are saying. It just becomes difficult to manage
> >> though. It all worked fine until there are conflicts between the priv
> >> specs.
> >>
> >>> So enabling them will introduce no additional function to the cpus.
> >>>
> >>> We can just make them invisible to user(mask them in the isa string)
> >>> instead of disabling them  to be compatible with lower priv version.
> >> I'm open to other options, but masking them like this seems like more
> >> work and also seems confusing. The extension will end up enabled in
> >> QEMU and potentially visible to external tools, but then just not
> >> exposed to the guest. It seems prone to future bugs.
> >
> > Yeah. they may be visible to external tools if they read cfg directly.
> >
> > Another way is to introduce another parameter instead of cfg.ext_zca to=
 indicate whether Zca/Zcf/Zcd
> >
> > instructions are enabled. This is be done by patchset:
> >
> > https://lore.kernel.org/qemu-devel/20230410033526.31708-1-liweiwei@isca=
s.ac.cn/

I don't prefer this option, but if others feel strongly I'm not
completely opposed to it.

> >
> > All of the three ways are acceptable to me.
>
> Earlier today I grabbed two Weiwei Li patches (isa_string changes and Zca=
/Zcf/Zcd
> changes) in the "rework CPU extensions validation" series, but after read=
ing these
> last messages I guess I jumped the gun.

My preference would be the "target/riscv: Update check for
Zca/zcf/zcd" patch, which I think is what you picked. So that seems
like the way to go

>
> Alistair, I'm considering drop the patch that disables extensions via pri=
v_spec later
> during realize() (the one I mentioned in my first message) from that seri=
es until we
> figure the best way of dealing with priv spec and Z-extensions being used=
 as MISA bits
> and so on. We can merge those cleanups and write_misa() changes that are =
already reviewed
> in the meantime. Are you ok with that?

That's also fine

Alistair

>
>
> Thanks,
>
>
> Daniel
>
>
> >
> > Regards,
> >
> > Weiwei Li
> >
> >
> >> Alistair
> >>
> >>> Regards,
> >>>
> >>> Weiwei Li
> >>>
> >>>
> >>>>> - Do not apply patch 5/9 from that series that moves the disable_ex=
t code to the end
> >>>>> of validation. Also a possibility, but we would be sweeping the pro=
blem under the rug.
> >>>>> Zca still can't be used as a RVC replacement due to priv spec versi=
on constraints, but
> >>>>> we just won't disable Zca because we'll keep validating exts too ea=
rly (which is the
> >>>>> problem that the patch addresses).
> >>>>>
> >>>>> - change the priv spec of the sifive CPUs - and everyone that uses =
RVC -  to 1_12_0. Not
> >>>>> sure if this makes sense.
> >>>>>
> >>>>> - do not disable any extensions due to privilege spec version misma=
tch. This would make
> >>>>> all the priv_version related artifacts to be more "educational" tha=
n to be an actual
> >>>>> configuration we want to enforce. Not sure if that would do any goo=
d in the end, but
> >>>>> it's also a possibility.
> >>>> This also seems like something we can do. Printing a warning but
> >>>> continuing on seems reasonable to me. That allows users to
> >>>> enable/disable features even if the versions don't match.
> >>>>
> >>>> I don't think this is the solution for this problem though
> >>>>
> >>>> Alistair
> >>>>
> >>>>> I'll hold the rebase of that series until we sort this out. Thanks,
> >>>>>
> >>>>>
> >>>>> Daniel
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 3/7/23 05:13, Weiwei Li wrote:
> >>>>>> Modify the check for C extension to Zca (C implies Zca).
> >>>>>>
> >>>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >>>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >>>>>> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> >>>>>> ---
> >>>>>>     target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
> >>>>>>     target/riscv/translate.c                | 8 ++++++--
> >>>>>>     2 files changed, 8 insertions(+), 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/risc=
v/insn_trans/trans_rvi.c.inc
> >>>>>> index 4ad54e8a49..c70c495fc5 100644
> >>>>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> >>>>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> >>>>>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_ja=
lr *a)
> >>>>>>         tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
> >>>>>>
> >>>>>>         gen_set_pc(ctx, cpu_pc);
> >>>>>> -    if (!has_ext(ctx, RVC)) {
> >>>>>> +    if (!ctx->cfg_ptr->ext_zca) {
> >>>>>>             TCGv t0 =3D tcg_temp_new();
> >>>>>>
> >>>>>>             misaligned =3D gen_new_label();
> >>>>>> @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_=
b *a, TCGCond cond)
> >>>>>>
> >>>>>>         gen_set_label(l); /* branch taken */
> >>>>>>
> >>>>>> -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3=
)) {
> >>>>>> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) &=
 0x3)) {
> >>>>>>             /* misaligned */
> >>>>>>             gen_exception_inst_addr_mis(ctx);
> >>>>>>         } else {
> >>>>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> >>>>>> index 0ee8ee147d..d1fdd0c2d7 100644
> >>>>>> --- a/target/riscv/translate.c
> >>>>>> +++ b/target/riscv/translate.c
> >>>>>> @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd,=
 target_ulong imm)
> >>>>>>
> >>>>>>         /* check misaligned: */
> >>>>>>         next_pc =3D ctx->base.pc_next + imm;
> >>>>>> -    if (!has_ext(ctx, RVC)) {
> >>>>>> +    if (!ctx->cfg_ptr->ext_zca) {
> >>>>>>             if ((next_pc & 0x3) !=3D 0) {
> >>>>>>                 gen_exception_inst_addr_mis(ctx);
> >>>>>>                 return;
> >>>>>> @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, =
DisasContext *ctx, uint16_t opcode)
> >>>>>>         if (insn_len(opcode) =3D=3D 2) {
> >>>>>>             ctx->opcode =3D opcode;
> >>>>>>             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
> >>>>>> -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
> >>>>>> +        /*
> >>>>>> +         * The Zca extension is added as way to refer to instruct=
ions in the C
> >>>>>> +         * extension that do not include the floating-point loads=
 and stores
> >>>>>> +         */
> >>>>>> +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) =
{
> >>>>>>                 return;
> >>>>>>             }
> >>>>>>         } else {
> >

