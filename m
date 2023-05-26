Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA101C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 02:29:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2NCe-0000ZE-9C; Thu, 25 May 2023 22:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2NCd-0000V9-Ed; Thu, 25 May 2023 22:29:15 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2NCb-0007fd-Oq; Thu, 25 May 2023 22:29:15 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-783e5c64d29so298333241.1; 
 Thu, 25 May 2023 19:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685068152; x=1687660152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shzpP+M/z4nBYvLPHsw8j/FfgBCbX8QORsE6v+pejto=;
 b=X/ziBY9y2GTsGovH+6zUcbHWyvi2w3GbE8TNk+My8tfNpCM0uKPfZVQ/bB178AbNEg
 98aWsuH4E0bqdAOdNJdua0wr4J062U4I3iddlEYHv3LcPWbrGxHgBzVK5h77VytDYCA7
 ys0UZiLWvwJiJbbrCK6/IAbHt90Cte5BMhAIob1wzCgHqctvmL+UO+YYw5XhdfxYvIeI
 AvPPx0MonrQfKOuIhosJoBpnRxaAzgogF+4MNA4fqzb6iilmEad9wLiTJmuJzAuc8HfP
 yyEmN5FoX2rz5wZ1+oI/SbOqUo5zSBtg7HcQWBA/4Ol9U0MH3Jd1Qdu/Y4USpoQvAkjL
 OTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685068152; x=1687660152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=shzpP+M/z4nBYvLPHsw8j/FfgBCbX8QORsE6v+pejto=;
 b=b3lKPlkWAwdzKk64Bt8fYuboNsWDhFNfLdCEdfJ3KMjdQbL/pAvVEAwWPlV5owjNjQ
 g8gZeqdY5oooEXR2pcFqLjWrDv/y6IdTKUN6oLv3uw1BHDpG1Uy/0+3d2lBpFpftakYi
 byhg4RFv6SCoM7ytWpbw6PTLXwVpYmM0qgGC0YO3brQgaeeQuvO7kIOVMxf+eiR631kF
 1AFeCGjvxf6c76Q+LMgwyQCPBYW0fcvBqCRrDPbGsdK4E0RTMyPxUSwJGgbEJYl0OEeK
 0/3Crwp1viyvUVk/fj5vpx/MUVseLuQQrU1mh4gz42cmMnjTD1aHvDjwNn1+iMwALwyq
 y/Kw==
X-Gm-Message-State: AC+VfDzMfC/LSjgovue04vMezQBscUhTe74pEhGFUZrY/BoeErFfh3K3
 tH4NFu/z4EJ6Pr0/U5U9fiozIJVsr3Ay5IelZ6Q=
X-Google-Smtp-Source: ACHHUZ4+//fPzBed/5QHE5VQn8Z0gSjaDDwqaNzCiszBnXgZbJbHvwqbe39PfOd/w4zwf0gTnQk8IwmklD6np8hKT0g=
X-Received: by 2002:a05:6102:746:b0:437:d9e9:ebe5 with SMTP id
 v6-20020a056102074600b00437d9e9ebe5mr1558931vsg.10.1685068152320; Thu, 25 May
 2023 19:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523135939.299246-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 12:28:46 +1000
Message-ID: <CAKmqyKMaLZgZV250B7xap8f7bOYFCw7HZX-FFt1+AY964TO_zA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] target/riscv: Remove pc_succ_insn from DisasContext
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, May 24, 2023 at 12:07=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> pc_succ_insn is no longer useful after the introduce of cur_insn_len
> and all pc related value use diff value instead of absolute value.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 538187f93b..37d731f9c5 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -57,8 +57,6 @@ typedef enum {
>
>  typedef struct DisasContext {
>      DisasContextBase base;
> -    /* pc_succ_insn points to the instruction following base.pc_next */
> -    target_ulong pc_succ_insn;
>      target_ulong cur_insn_len;
>      target_ulong pc_save;
>      target_ulong priv_ver;
> @@ -1147,7 +1145,6 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
>      /* Check for compressed insn */
>      if (ctx->cur_insn_len =3D=3D 2) {
>          ctx->opcode =3D opcode;
> -        ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
>          /*
>           * The Zca extension is added as way to refer to instructions in=
 the C
>           * extension that do not include the floating-point loads and st=
ores
> @@ -1161,7 +1158,6 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
>                               translator_lduw(env, &ctx->base,
>                                               ctx->base.pc_next + 2));
>          ctx->opcode =3D opcode32;
> -        ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
>
>          for (size_t i =3D 0; i < ARRAY_SIZE(decoders); ++i) {
>              if (decoders[i].guard_func(ctx) &&
> @@ -1182,7 +1178,6 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      uint32_t tb_flags =3D ctx->base.tb->flags;
>
>      ctx->pc_save =3D ctx->base.pc_first;
> -    ctx->pc_succ_insn =3D ctx->base.pc_first;
>      ctx->priv =3D FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
>      ctx->mem_idx =3D FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
>      ctx->mstatus_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, FS);
> @@ -1235,7 +1230,7 @@ static void riscv_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cpu)
>
>      ctx->ol =3D ctx->xl;
>      decode_opc(env, ctx, opcode16);
> -    ctx->base.pc_next =3D ctx->pc_succ_insn;
> +    ctx->base.pc_next +=3D ctx->cur_insn_len;
>
>      /* Only the first insn within a TB is allowed to cross a page bounda=
ry. */
>      if (ctx->base.is_jmp =3D=3D DISAS_NEXT) {
> --
> 2.25.1
>
>

