Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F32DC47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 02:56:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkU8-0000J9-E1; Sun, 21 Jan 2024 21:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkU5-0000IB-MR; Sun, 21 Jan 2024 21:56:25 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkU4-0003CS-51; Sun, 21 Jan 2024 21:56:25 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4b71b86ef81so415451e0c.2; 
 Sun, 21 Jan 2024 18:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892178; x=1706496978; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJ6tjGOFs6HzzX2W7HylzF03qUE0BXcKGU/k3ESswzk=;
 b=D95y3kq3vQQ21P2A62ffRxF3KsYdcws+eaM0ah5T8PXbbWmRS/7nKVdI/n+E9ZHVlk
 onRqrn38co38dDNXFLhTN4mZQlxRuaHsjdYeXqUSfPFa4YuQO27wWnH9jRMV1RZbID9r
 cQvAxafY+6Nv9ijGdD+FDIqJhKxAd2Kicg2ZSkQ3gxUy1sxZ/pBiQyhY3hLM6HX+gHRy
 Oh7JKRr703lRlXeRcVWIT63CPlPrfZx/YtJ6QaulsWF+bZLllArizoYq1B1JsYL3L3MF
 pjWOBbufwBD3EkA9VMdMmr8NrS51r3EFyvLBIvH6U5X7v3+OYplwh0mB+EGSQ3399eZr
 YRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892178; x=1706496978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yJ6tjGOFs6HzzX2W7HylzF03qUE0BXcKGU/k3ESswzk=;
 b=OAh1M6Zbs55as30Sz5epXqFq4hJZ21D5UkBtQ6TRWw0hWqxN6vCInI/vYm5/UgYf6F
 FC60cLX1L5E4o/OVpP9QypV+L46w50vomD+MWfUChLzSIi1fGEm3C67UAUEnqMoMRqE0
 bvRm7l3C9g0RaVYEQMOoOVzvj9yWIVD8spwvKOoP2BWm/7BAI57Ge5E+ELyT4sn21PUT
 o3k3B5B9bNwlf73Wr/E9uPrPXrG4e9tTfQDeglQh0GKggX92Q3IU71M0qzKQFAbnoVRu
 gTIpkCTovLBUR2qpM/9H7s4NUDUT9epAomL4Xi7pfw/boI9QhaWi2KtYgxSZmZkSkx4O
 pzYQ==
X-Gm-Message-State: AOJu0Yx370iDusmP2a4zAvW7paTgWknlQkWEBSArNog1m8f+4GUeeZh1
 QJrEnho6EAf6VxCCnvxHe4ZF/Y41AqUI4NHNjuP08Iy98SgCcv/G+Q0Be/JN7xBprDvxexI2/34
 Kmm0ykhUShgVvp5R6+Jt7WmP7odhJrqHx
X-Google-Smtp-Source: AGHT+IEX/3iMko+qicMX6wIcvL7jxmJfz+IyjpeE4gJG96PTpfHQ7kg12VeklfUy0/jyhiXAN7URc3dZ3g00n6ofBKo=
X-Received: by 2002:a05:6122:4219:b0:4b7:689d:9d9 with SMTP id
 cm25-20020a056122421900b004b7689d09d9mr822291vkb.32.1705892178373; Sun, 21
 Jan 2024 18:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-4-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 12:55:52 +1000
Message-ID: <CAKmqyKOadowD0sJ83m7ovj9d0tODezM5S1Hh1HC+o-ea4eM4wg@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] target/riscv/gdbstub.c: use 'vlenb' instead of
 shifting 'vlen'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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

On Wed, Jan 17, 2024 at 7:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/gdbstub.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 58b3ace0fe..5ab0abda19 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -130,7 +130,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint=
8_t *mem_buf, int n)
>
>  static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int=
 n)
>  {
> -    uint16_t vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
> +    uint16_t vlenb =3D riscv_cpu_cfg(env)->vlenb;
>      if (n < 32) {
>          int i;
>          int cnt =3D 0;
> @@ -146,7 +146,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, G=
ByteArray *buf, int n)
>
>  static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, in=
t n)
>  {
> -    uint16_t vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
> +    uint16_t vlenb =3D riscv_cpu_cfg(env)->vlenb;
>      if (n < 32) {
>          int i;
>          for (i =3D 0; i < vlenb; i +=3D 8) {
> @@ -266,7 +266,7 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs,=
 int base_reg)
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      GString *s =3D g_string_new(NULL);
>      g_autoptr(GString) ts =3D g_string_new("");
> -    int reg_width =3D cpu->cfg.vlen;
> +    int reg_width =3D cpu->cfg.vlenb << 3;
>      int num_regs =3D 0;
>      int i;
>
> --
> 2.43.0
>
>

