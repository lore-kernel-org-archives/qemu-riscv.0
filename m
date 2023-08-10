Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557CFC001DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:54:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9rq-0004oi-BQ; Thu, 10 Aug 2023 13:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9rn-0004oE-Is; Thu, 10 Aug 2023 13:54:35 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9rm-0006wh-3J; Thu, 10 Aug 2023 13:54:35 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-79d8edd6d99so406902241.3; 
 Thu, 10 Aug 2023 10:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691690071; x=1692294871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rBr0RfG72V1tpcZQFRsbWfrthlbTXE2H2NQFT6Ma70=;
 b=CjSBEMdel1uvucfawPQn8JhyUXGQahPEj2XYq6DQxwzKKGGSj5TZa0TajCCDTGY3Xv
 /3T/xk+G6kjjOCr+ivxO/78hYwf8oL4IAiaM9ak+1rqQLNhB1KwRuV0ewxo/WbUnkb9I
 Izxkb5B0uJO3lIaK2cvzat/Rkws30WdXhBa10RxHprqF2o6Rip0jr15rvPqeHZzfpkQ2
 J0C2pmhFUZLyHfE+Z4IgLzIr0FK8BAJCbkd8lbt4KOwxbUKmspYTCiY5+PmUDsnSBnw/
 tIvpd3J59j6XbOJIgoD2pkpOd0jHph+QCHBQ1sDoIBtvDGBHejiCfFHjQPG8InTKMAPb
 xl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691690071; x=1692294871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rBr0RfG72V1tpcZQFRsbWfrthlbTXE2H2NQFT6Ma70=;
 b=VP2hC5hcfAXCh4KA7jIeUMeG9wLu+tTknFAAuNZFQvhmRAHLy2FLdjJuj/0XJ8s65X
 tD0d/j1H+xOTukW+bfdWl5EXgJ0Ybfhe0qtPqWbpkcGqVmBU4pZz9McwW6eOovzVQUyn
 oP0TI2LJhz3BPbM1NUg6fcXKA7GQsXt7qeYROvYWm7cwKWprxeFze+GZt4nq384vCCpx
 53l7InBZ0MyU7g8vjwRYeWMAvEiW+r1o4bmvqakuZnGkxo9xR/wAA7DctArDSNn04TRc
 vjK/cbQNXQaKkn5m9u7fv1h//wlM6HjViGJR/ohIbyhG/g/zsYVa05Fa+W7R/voz1UPE
 G1og==
X-Gm-Message-State: AOJu0Yw7kOkNh8LOsNvC5mcE61sh8hq2dCp4IgTK/x9hC7P6UoatY0tT
 1UKClC9YI+gC4xNppZ5crzKDbjPnnIoh+ty0CGo=
X-Google-Smtp-Source: AGHT+IHjZaQobB9xipoASlv1QmgtnvuJFAD9dc5KctS61BZkHDGd9YGIE83QV5FuNlV2d0KCg4rjceTP9+28lNTk0F0=
X-Received: by 2002:a67:ee5a:0:b0:443:5809:ec21 with SMTP id
 g26-20020a67ee5a000000b004435809ec21mr2435242vsp.17.1691690071649; Thu, 10
 Aug 2023 10:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
 <20230727220927.62950-10-dbarboza@ventanamicro.com>
In-Reply-To: <20230727220927.62950-10-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:54:05 -0400
Message-ID: <CAKmqyKOuRGAVTBohvVOkRu14byfgFO2BPBtyQW2EKCLTd0sWSg@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] target/riscv/cpu.c: limit cfg->vext_spec log
 message
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jul 27, 2023 at 6:22=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Inside riscv_cpu_validate_v() we're always throwing a log message if the
> user didn't set a vector version via 'vext_spec'.
>
> We're going to include one case with the 'max' CPU where env->vext_ver
> will be set in the cpu_init(). But that alone will not stop the "vector
> version is not specified" message from appearing. The usefulness of this
> log message is debatable for the generic CPUs, but for a 'max' CPU type,
> where we are supposed to deliver a CPU model with all features possible,
> it's strange to force users to set 'vext_spec' to get rid of this
> message.
>
> Change riscv_cpu_validate_v() to not throw this log message if
> env->vext_ver is already set.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 08f61ed051..01b0d228f5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -939,8 +939,6 @@ static void riscv_cpu_disas_set_info(CPUState *s, dis=
assemble_info *info)
>  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg=
,
>                                   Error **errp)
>  {
> -    int vext_version =3D VEXT_VERSION_1_00_0;
> -
>      if (!is_power_of_2(cfg->vlen)) {
>          error_setg(errp, "Vector extension VLEN must be power of 2");
>          return;
> @@ -963,17 +961,18 @@ static void riscv_cpu_validate_v(CPURISCVState *env=
, RISCVCPUConfig *cfg,
>      }
>      if (cfg->vext_spec) {
>          if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
> -            vext_version =3D VEXT_VERSION_1_00_0;
> +            env->vext_ver =3D VEXT_VERSION_1_00_0;
>          } else {
>              error_setg(errp, "Unsupported vector spec version '%s'",
>                         cfg->vext_spec);
>              return;
>          }
> -    } else {
> +    } else if (env->vext_ver =3D=3D 0) {
>          qemu_log("vector version is not specified, "
>                   "use the default value v1.0\n");
> +
> +        env->vext_ver =3D VEXT_VERSION_1_00_0;
>      }
> -    env->vext_ver =3D vext_version;
>  }
>
>  static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> --
> 2.41.0
>
>

