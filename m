Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E15C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 01:01:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyM4Y-0002Jb-5J; Wed, 01 Nov 2023 21:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM4W-0002IX-36; Wed, 01 Nov 2023 21:00:32 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM4U-0006GV-4V; Wed, 01 Nov 2023 21:00:31 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7b747c9b067so143681241.3; 
 Wed, 01 Nov 2023 18:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886829; x=1699491629; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8WkswuqFq7XwrqsHbCmyzhp4ihsAz8C3Cuegui2H4c=;
 b=ac2gixgQT8Lj+1hE9Ja3cZAPsVwXIBV8ipQg77M7y0W4iYexeaQhxdEAw03an3E2xu
 X1xve6SHp2uS6rc2S0Lx4AMQqsoSLjILDwiYi6qDbWXoMMF0GwS6ziiZHZrOs9wl5WaL
 ZR5kh9f7RJX6+UafHB6915352URXTDnxUUVvMmOFXHc0YSIYJE6vLrOGpnZy55DLSAN6
 EUTaa1wNeGW+rBSi+WVN8j4x7kO/JfqBNwcPpEB50VqruFlUjasHA4zwQLQgt0i5i4Pu
 CKXdhKXE108jDzZRNHdMBLglwLnoCQTYvqYSXZyVb4wASdKGV5znhv5EC4ngvJsrHRat
 RtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886829; x=1699491629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8WkswuqFq7XwrqsHbCmyzhp4ihsAz8C3Cuegui2H4c=;
 b=jnU7IbAV8EPadD0scUjcvGvD4e5L5kTx7wkGNXzT/U4m3Sv9PmGZ2HJCZgPMoJE1kr
 7bjRvuo+885/KQLdoeosg3svkBa2Agq7g9HcaOv1e4bZ2xYqfTKV+kN3q7mnJmnXe4C8
 w70UBoltWQ2Ef1dFYGG0RCMWMpLSHzIJSySeb5JdpF8PSsteM95GAl86aOeYQ3BPyYPd
 AATGg/meEV7EnhR2/R4gTpwSmK7xTkUAU8fDvyaa4msXIKcsFRHjXNQUSHGfSYzVKP3y
 qIVYLk5X9m/l2D4Eg16Si0nOOoweC864g5hoSbUVJbOoc25/c9S+6pf+x1IedZnvhf09
 XXmg==
X-Gm-Message-State: AOJu0YxXIwwV8Oz5Er8Ll6U7kpBnXvkRj6aAaFxpSvwSyQONPdlTWsoa
 uZKd+JzDNjE0g/3aQsqsu0EPFRedGO87BB0Og30=
X-Google-Smtp-Source: AGHT+IG6x+9amuc/6kOS/K5LBxqoM4gIwQI5IBate65UuW+OzKjLU6h6NfTOecL8MOkKVebKMUnozrLQwqFgWNkTThE=
X-Received: by 2002:a67:c38b:0:b0:457:eee6:c105 with SMTP id
 s11-20020a67c38b000000b00457eee6c105mr12707576vsj.8.1698886828748; Wed, 01
 Nov 2023 18:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-15-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-15-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 11:00:02 +1000
Message-ID: <CAKmqyKMhJPamhpfa_gq26_PgDeNhw4iP__BZVVb3x4+aC5KTuQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] disas/riscv: Replace TABs with space
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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

On Fri, Oct 27, 2023 at 1:21=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> Replaces TABs with spaces, making sure to have a consistent coding style
> of 4 space indentations.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7ea6ea050e9..e9458e574b9 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -3136,12 +3136,12 @@ static void decode_inst_opcode(rv_decode *dec, rv=
_isa isa)
>                  }
>                  break;
>              case 89:
> -               switch (((inst >> 12) & 0b111)) {
> +                switch (((inst >> 12) & 0b111)) {
>                  case 0: op =3D rv_op_fmvp_d_x; break;
>                  }
>                  break;
>              case 91:
> -               switch (((inst >> 12) & 0b111)) {
> +                switch (((inst >> 12) & 0b111)) {
>                  case 0: op =3D rv_op_fmvp_q_x; break;
>                  }
>                  break;
> @@ -4579,7 +4579,7 @@ static void decode_inst_operands(rv_decode *dec, rv=
_isa isa)
>          break;
>      case rv_codec_zcmt_jt:
>          dec->imm =3D operand_tbl_index(inst);
> -       break;
> +        break;
>      case rv_codec_fli:
>          dec->rd =3D operand_rd(inst);
>          dec->imm =3D operand_rs1(inst);
> --
> 2.34.1
>
>

