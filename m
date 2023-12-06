Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE902C46CA0
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:50:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAg78-0003zP-Le; Tue, 05 Dec 2023 19:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAg6w-0003wg-4f; Tue, 05 Dec 2023 19:49:59 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAg6u-00077b-GK; Tue, 05 Dec 2023 19:49:57 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54bfd4546fbso7766886a12.1; 
 Tue, 05 Dec 2023 16:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701823793; x=1702428593; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ORjK0WCjIWm9UV83YdgSuLzVgOBiC30M1s03dBQNFPc=;
 b=EVpvcK0uonImfQQZ7IlmShpEoozedIl9sy974GL2Q9mKr/JqecGV7qC3ZzXMEq2Vdo
 lYqhgJeNx7UTZqg5YEarsksO7s7Mk8z4U3er6AI3zKP43OZU7pYfAxs/7+Pf1GyI507i
 jDUFHs3HH9GcbO6ORP9BDirskT8QoapS4U9sBdIoroVODeCgseKbGrcEGARfC6kju915
 iOJBEllrIuuy010Dt+tob8ZNFflMeoxPnANzkixcs2BPJmGHxZAzteHzt34QWMtMmKvy
 lGP1UJUT65d9xf3yYbgl/GiIK0AxBiELJ3fNmeBcAfSJM1RSReif8f4lJ7x4SL4NhdQM
 khoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701823793; x=1702428593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ORjK0WCjIWm9UV83YdgSuLzVgOBiC30M1s03dBQNFPc=;
 b=xCP33T4UEsAqkDnTHvgMrPkb8bTN+p4LfLd39pRuOELgpFMjLblvN1A9Bc/1fkKI2Y
 wg5yA6nRQyaHus+kQHHeSKAJGhOmkKwMkj0GYE/V41LuAm5LHq2cxzI526lXDgDUgP7S
 HAEts+/0cFFGTzJpw21DoWOdoXTO/DQa+VgHDr8h7r2dQcVGVxJmY/sJCMEY3lZFqr4f
 hWPcNwxPA/t7g46sQdiIGLfW3tGAaWSZB/aF0aeHleeMLMswsDaQYDYN/gJHrFVmpoaW
 DOUHEGCBeCnGL+N7q2pB5t5ZKwR6VubVQFBQJzQ/AbpTXwJO2xbIZ93CkQUf/z5g3vI1
 bMxA==
X-Gm-Message-State: AOJu0YxcMaoVLH0UaAITQwTy2gPFnsPN42RJyu6vTxJGL6jah923LPEo
 dZJkYmDD7fgRdLDTUPcpQOPi6KQ1dJqUA/dj/WxOy4n+IfeBtw==
X-Google-Smtp-Source: AGHT+IELdyCxFKwBq0S3z5FKv7pvwFCgk6Zw9qJX5UhsUGHKeOVl0Inbo4DPZ/TyQZnydBtBJPM9uIzTz6NUEQlgXUc=
X-Received: by 2002:a50:d501:0:b0:54c:ac4d:f4b7 with SMTP id
 u1-20020a50d501000000b0054cac4df4b7mr106524edi.1.1701823792902; Tue, 05 Dec
 2023 16:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20231129170400.21251-1-max.chou@sifive.com>
In-Reply-To: <20231129170400.21251-1-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 10:49:25 +1000
Message-ID: <CAKmqyKNBRdxA8unMZ4Gb-+990h9rJyGbQpmrgMKfV1h=_hkWOg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Make vector whole-register move (vmv) depend on vtype
 register
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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

On Thu, Nov 30, 2023 at 3:05=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> The ratified v1.0 version of RISC-V V spec section 16.6 says that
> `The instructions operate as if EEW=3DSEW.`.
>
> So the whole vector register move instructions depend on the vtype
> register that means the implementation needs to be fixed to raise an
> illegal-instruction exception when vtype.vill=3D1, as is the case with
> most other vector instructions.
>
> Reference:
> - https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#whole-vecto=
r-register-move
> - https://github.com/riscv/riscv-v-spec/commit/856fe5bd1cb135c39258e6ca94=
1bf234ae63e1b1
>
> Max Chou (2):
>   target/riscv: Add vill check for whole vector register move
>     instructions
>   target/riscv: The whole vector register move instructions depend on
>     vsew

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/insn_trans/trans_rvv.c.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>
>

