Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F071C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 02:03:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2Mn5-0007h4-OV; Thu, 25 May 2023 22:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2Mn4-0007gb-Hv; Thu, 25 May 2023 22:02:50 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2Mmz-0003EI-Jg; Thu, 25 May 2023 22:02:50 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-439367c12ceso124483137.0; 
 Thu, 25 May 2023 19:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685066564; x=1687658564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iceU8pxK4DSgqjjnBwWhDfBVmI5OggTeUaEn5iu6mfw=;
 b=l+IUdT/s9JRYz6L9rX1qYV8gZKt/D8+S3VikEhmrsqRSps/6fnQ2Azxu57yxjcNRHP
 Nd6YKw3Nf0y11w9YAeqxIJh+jSvx5c4fLZjzpoIrIq4C1zMWq6hzguYRWzto/DIzMUDy
 0P07hQFkVr7Hp6lT0Y1QMmYSjgfN+DBaIKBSIPfCPthLt5OCuBON4uFR0rYXZuodubvA
 Jx/UBfMNDipUGWbpJ6K5PsLi15pFNP7sBoPp2cPzs8GN9icegzQjeaLHb00rB495yzZj
 /l2KU7JPYct33u7omSoysM8rwypVLCiOa0MENDWihnr3almziV6HkUOdZUsfU3kBD1Q/
 B41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685066564; x=1687658564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iceU8pxK4DSgqjjnBwWhDfBVmI5OggTeUaEn5iu6mfw=;
 b=ZHhQUBzWcHA6PmzkGXpROdtNvowbviA4HQ3yedPXLqNEGF0OzR+nk4HjBIZ3jeQHZH
 3FzotuMG6LaixEQN/JH3jy/46tJZZIuArKzON+qPewx61EIAb28G1kG4pUaenpLghcD7
 onFbl7/wzm9QQrSOoGN0fgAbfsNy8rJqxpX+8XguX2qq+NA48hzqfwwDplB/4bC0AWqh
 hfDQBFmGvgieeStOqfmBmWC8FzVEEOGrRa/83da07O6LuN0SwaHeg0+Pdivpf8XCsHce
 TTjKOjS735HEBFT7L0DJim13WcwhwxtdYFo5G5KH9W1ZgZT7ujfoMuPUIVYAiECgvPs2
 BL3g==
X-Gm-Message-State: AC+VfDyMn3JZDPWC7AQKQ5wzsOOuHeXtqDLPvXhl6Mpg7Ju7kWgG7waY
 MbAAJwbxuKbk1NvsNunixTyxZ+BkUreei9Gd1kM=
X-Google-Smtp-Source: ACHHUZ6MgtXR2jZ+4RQt3SS66ltFZ4UrJZF/3ZNSu6fxmg92L4hntha+U6fbbK/f9nC3FcdLxGz1LqJF8YYZiVK6aBg=
X-Received: by 2002:a67:bb18:0:b0:434:71c2:a4d9 with SMTP id
 m24-20020a67bb18000000b0043471c2a4d9mr99982vsn.7.1685066564188; Thu, 25 May
 2023 19:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523135939.299246-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 12:02:18 +1000
Message-ID: <CAKmqyKPfoYE_nJWJAFuyx=O5Fm7V-gOemPPPNgg8EEqO9kBbVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] target/riscv: Introduce cur_insn_len into
 DisasContext
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, May 24, 2023 at 12:16=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> Use cur_insn_len to store the length of the current instruction to
> prepare for PC-relative translation.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 1c9a667653..d756866925 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -59,6 +59,7 @@ typedef struct DisasContext {
>      DisasContextBase base;
>      /* pc_succ_insn points to the instruction following base.pc_next */
>      target_ulong pc_succ_insn;
> +    target_ulong cur_insn_len;
>      target_ulong priv_ver;
>      RISCVMXL misa_mxl_max;
>      RISCVMXL xl;
> @@ -1114,8 +1115,9 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
>      };
>
>      ctx->virt_inst_excp =3D false;
> +    ctx->cur_insn_len =3D insn_len(opcode);
>      /* Check for compressed insn */
> -    if (insn_len(opcode) =3D=3D 2) {
> +    if (ctx->cur_insn_len =3D=3D 2) {
>          ctx->opcode =3D opcode;
>          ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
>          /*
> --
> 2.25.1
>
>

