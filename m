Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F20C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:24:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2MBN-0006p9-1P; Thu, 25 May 2023 21:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MBJ-0006oN-Le; Thu, 25 May 2023 21:23:50 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MBI-0004Qw-8z; Thu, 25 May 2023 21:23:49 -0400
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-4393c1b8d1cso37288137.0; 
 Thu, 25 May 2023 18:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685064226; x=1687656226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NjdzPyGx0xqcyX3tCuwoT2wEedysuBMR6A1HiLexCE=;
 b=LahEMLlTu1Rnm1XHk4jAhH+pb22W2Z7w6DABj+To7rPkOTFAOB/A3/VaYq5WcyK+gk
 lIbs3iAJ3Uq41JvutIC31IFCMF9WtHHBIgt/JKoJCJSh4Qcw0qKedXRqblc/aS91Mklj
 1ilPtiOVePjJAhxcMzJCQl7ntwcdJKRuh1HUDrMWHPFP+2VQjgkQDI2F/xrDIyMpwQc8
 n3OVnQzwjIxNwvoGLjbW27ReZQD20KgJTpiUYiTL33F11ejlQBfQDHQq/4ykG9FIXpTg
 Yf8t1HW9rKrHFJsX951aRjve4PS9PXnkdb+GfYSKn/XUY8WX86dRU0UI0V2+4EYh7KoH
 2UCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685064226; x=1687656226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NjdzPyGx0xqcyX3tCuwoT2wEedysuBMR6A1HiLexCE=;
 b=aGEE938D0v4RJfLmhyEFQuugjXg06Ph/yHjC4mUbLE/y6Jjlh+AUMKuADsMx2xcgwP
 +om8Ldgih/+6WWWBj0uC883VwCXbm84L53R4LbNXE9zo8+RnDBjmqTi5R3to/gb8lO2r
 ffanl1TolfbKidritO/IgwBrqKDLtKIFhWWRc1k7hZDnmnJ5e6aqtMWAxTSv+j1W3vSl
 J4bVmrW1jA1sFPm9UtiJTh1eCErLiHAcSKomxGV8r1B5cKQ3oMrK8G/tybFvdyVjmLQW
 +BDJpRnqyK7J8/YyBBIUycRV/1r0klSaEolrjleGg++kjO55FF7/Xs6Ld20pZFT8AfeT
 y/yA==
X-Gm-Message-State: AC+VfDx6Fk44WFFY3nUtRhJxkQLp5OOel9rb2FHKUAyjopofIawUjXvA
 BcnZx/KtYgxkojk77TBKPKo1I8OdJlhNsvBc6Ao=
X-Google-Smtp-Source: ACHHUZ7Msg8In2pJgVjOgzdFEQHOx6w3AMe0/hAc50z7apAdu/gY9xljDGjKKFxU7bn6HrjSfkvvNaXZGmt0EURcyVM=
X-Received: by 2002:a05:6102:11e4:b0:436:2c6f:205f with SMTP id
 e4-20020a05610211e400b004362c6f205fmr63899vsg.5.1685064226218; Thu, 25 May
 2023 18:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
 <20230523093539.203909-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523093539.203909-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:23:20 +1000
Message-ID: <CAKmqyKPF_H2_ydoA608BTARH_aRJoZUenqyc5-ZfCYknU-geAw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] disas/riscv.c: Support disas for Zcm* extensions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, May 23, 2023 at 7:37=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Support disas for Zcmt* instructions only when related extensions
> are supported.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 729ab684da..49a3eb6ac4 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2501,7 +2501,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  op =3D rv_op_c_sqsp;
>              } else {
>                  op =3D rv_op_c_fsdsp;
> -                if (((inst >> 12) & 0b01)) {
> +                if (dec->cfg->ext_zcmp && ((inst >> 12) & 0b01)) {
>                      switch ((inst >> 8) & 0b01111) {
>                      case 8:
>                          if (((inst >> 4) & 0b01111) >=3D 4) {
> @@ -2527,6 +2527,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  } else {
>                      switch ((inst >> 10) & 0b011) {
>                      case 0:
> +                        if (!dec->cfg->ext_zcmt) {
> +                            break;
> +                        }
>                          if (((inst >> 2) & 0xFF) >=3D 32) {
>                              op =3D rv_op_cm_jalt;
>                          } else {
> @@ -2534,6 +2537,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                          }
>                          break;
>                      case 3:
> +                        if (!dec->cfg->ext_zcmp) {
> +                            break;
> +                        }
>                          switch ((inst >> 5) & 0b011) {
>                          case 1: op =3D rv_op_cm_mvsa01; break;
>                          case 3: op =3D rv_op_cm_mva01s; break;
> --
> 2.25.1
>
>

