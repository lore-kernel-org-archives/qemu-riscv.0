Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699ADC47422
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:04:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkc4-000637-TK; Sun, 21 Jan 2024 22:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkc3-00062a-DZ; Sun, 21 Jan 2024 22:04:39 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkc1-0004op-TM; Sun, 21 Jan 2024 22:04:39 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4bb27800a02so339047e0c.3; 
 Sun, 21 Jan 2024 19:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892676; x=1706497476; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HfVXFqGYAWfYocBczNyS8PcN0754WznMUOr+UJPyQw=;
 b=c1AUgQ2PJ8R3le3P+3XIbP1LlxG+sycYP4oCyvs0BWDbNz6ttRNXg/3ptF+OfAol/K
 XaBF46ZAdz1+9Wob67BrsAzL9G8ffQk2Y8Yl9eXBY9A6yBQXSAKCz48NZr3ZAU9p0yhk
 JafJyXuNASoOOdNUdHs48s1GvoLMo5YkZuvh73eku6hrTPuLFlEZmS5QbrHxS5I5U5ah
 xqiobiVf6Wp7URyZdXA7vicRCXjOlUUUdZg+QVS3nXeEUrqaEPY32W1jvbeIi8YOT+pM
 8sVE9XJbGY91NJ0CbAW7Qykh/cmKUaV02K2P1+278iZ8nclCj+ce0HgJ0J1NRCl0jGkV
 RBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892676; x=1706497476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HfVXFqGYAWfYocBczNyS8PcN0754WznMUOr+UJPyQw=;
 b=H3IG/cOzmsMtyHXzIMNxt+07RphvxuMibjvNK5YQ7XvbypibIaGl8aGbDfkz673TDS
 eFA+a/FGS/oXtYOWyP34TfuOD7lmP++V9wXudaE5Zj8M+0vj3wBAZVUmDosVqrOkq20v
 u3BbuBsd77oGwLPJmrYUWoHVS2V5GjZ0e5qg5W7sX6adcznh9VkTLpjk/vWeLVm+cCdK
 WrxpWmQynUUYof7mLZ/2QRdqmmcpUxyFnA757eNuGUdsrUS6APW589SiptRF5kX1/m5M
 oGama4pjMq25Mk9+8DSki/dV5eneRcazO4YgAjvHuRz6+ilyoqUBXnAC/o0x9wecwBcu
 Rw5g==
X-Gm-Message-State: AOJu0Yzosojs3YyBXBDAieOUhVbvgeiUSQMS59oxGUwmY3UqNT0V5YDh
 EJ9LEps+XdFRMbiUo0Jg+rsHhqtnJqMUK+4adfx/dj3TRy14DZS31+Zi8pRBXMo5bk+G2mv8wQs
 QMqWJoXjs3SH7xEiZ1o70zptwIrZqdhyV
X-Google-Smtp-Source: AGHT+IFQNvWsrKBwH/5xZ3NiWuHZJzShf3LeodK/PojHRB3Mhwa9creqsnV4yZupmcfLXseCGZTSQidciFveQ+R/cRk=
X-Received: by 2002:a05:6122:208c:b0:4b7:4059:b29f with SMTP id
 i12-20020a056122208c00b004b74059b29fmr984299vkd.28.1705892676523; Sun, 21 Jan
 2024 19:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-10-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-10-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:04:10 +1000
Message-ID: <CAKmqyKNSZjbm4KHTdY4cz=VZ0eOMgKeuVeFm7Z8-MRz8R1q4Lg@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] target/riscv/insn_trans/trans_rvv.c.inc: use
 'vlenb' in MAXSZ()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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

On Wed, Jan 17, 2024 at 7:02=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Calculate the maximum vector size possible, 'max_sz', which is the size
> in bytes 'vlenb' multiplied by the max value of LMUL (LMUL =3D 8, when
> s->lmul =3D 3).
>
> 'max_sz' is then shifted right by 'scale', expressed as '3 - s->lmul',
> which is clearer than doing 'scale =3D lmul - 3' and then using '-scale'
> in the shift right.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index d743675262..b4663b6e1f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1160,12 +1160,12 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, 1, true)
>  /*
>   * MAXSZ returns the maximum vector size can be operated in bytes,
>   * which is used in GVEC IR when vl_eq_vlmax flag is set to true
> - * to accerlate vector operation.
> + * to accelerate vector operation.
>   */
>  static inline uint32_t MAXSZ(DisasContext *s)
>  {
> -    int scale =3D s->lmul - 3;
> -    return s->cfg_ptr->vlen >> -scale;
> +    int max_sz =3D s->cfg_ptr->vlenb * 8;
> +    return max_sz >> (3 - s->lmul);
>  }
>
>  static bool opivv_check(DisasContext *s, arg_rmrr *a)
> --
> 2.43.0
>
>

