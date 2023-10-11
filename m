Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5926CD98E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:11:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNlQ-0000iz-6b; Tue, 10 Oct 2023 21:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNlK-0000hL-Va; Tue, 10 Oct 2023 21:11:46 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNlI-00008w-U7; Tue, 10 Oct 2023 21:11:46 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-4527d436ddfso2411068137.1; 
 Tue, 10 Oct 2023 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696986703; x=1697591503; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=za5W1AVDIi1qH8vDzk8jmjViulDtzVAzgEH5qS6oYnI=;
 b=h3FySJfeWkEulVBI0R//O1nw9bhqkI0cuDT0YViiLz4zsCdlmFjHs71pVnqH0rNrzi
 qUzY8N9/kY4u97jWn45wKoROJROBRZ0iOgB2GnlhnLhWR7NyYhsOdlWrvlLVzgrDRYm2
 t1KtZcbhJOgwUvEniiTglUm/HIOnQRCkfQzyvb6nq0yXfK/ZerZuVvhzsyWUNBI7zGoQ
 TtOmDNCY7lJ45pl5mLaQXtRXyKXRtbQe1pJaTUrVgoeZTH+1Gq680Bd6AGTsctyHp7IB
 AD3Jvh+L+iPDMk/otITovb5TLk5vpycH0BpfndfYJA7CpvylEomn0gs0Wbc4k5zcp7jE
 iPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696986703; x=1697591503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=za5W1AVDIi1qH8vDzk8jmjViulDtzVAzgEH5qS6oYnI=;
 b=SOoKL6n+x0gPQWblW00hz8sR4eg+Ut0INyiSZgneWBJR0wes5QW8M9IsJf0laG3nYv
 59PblgXeU3yxG/RbeyDXELU69c3GiaWNGwRfJRXfCdoMk1Qfmi3OyfnsoRdegf5X0Gx1
 kuPusdEpfEuHudDYWZ3OGxSQW0l8YrOWxOTzBhs6BGyqzhMNymcP95Kc9IA7S/tYDPK/
 u/sff6eoZsUOQ+SddPlIX49LunRRPsaEUBHesQrPSCsehwk7ckSKa+je+6ID9FXXZ8iA
 jZ0Ol1NNIxyHgFMGY3xpDPR74Xo/bYPBdFGRefBXj5y6xM6+nd2kQ+4JC/b9rKcN6GdG
 K4cQ==
X-Gm-Message-State: AOJu0YzoInTuyOLDeGh3t+H7bpZ9x08prK4LY0g0EIqpdebAVbLxEofK
 mb8UiXF6H0tg49QhaKrIrQO/dms2/IAQbfi4vWY=
X-Google-Smtp-Source: AGHT+IHd3lb9/LZK3j8gZmc5FubFRm63oXBEvdqw2WKPdouKgedUbufnOGEGFogC4u57YcGLicZLvdI8zWewSEQvXAE=
X-Received: by 2002:a05:6102:2b91:b0:457:6022:206a with SMTP id
 ib17-20020a0561022b9100b004576022206amr11577355vsb.1.1696986702900; Tue, 10
 Oct 2023 18:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-3-philmd@linaro.org>
In-Reply-To: <20231009110239.66778-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:11:16 +1000
Message-ID: <CAKmqyKPTYgzAxGExAYUTGFruN1KK5zMJv5tVzMGczaC9DQy6Ug@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/riscv: Use env_archcpu() in [check_]nanbox()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-s390x@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org, 
 Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Nicholas Piggin <npiggin@gmail.com>, 
 "Richard W . M . Jones" <rjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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

On Mon, Oct 9, 2023 at 9:03=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> When CPUArchState* is available (here CPURISCVState*), we
> can use the fast env_archcpu() macro to get ArchCPU* (here
> RISCVCPU*). The QOM cast RISCV_CPU() macro will be slower
> when building with --enable-qom-cast-debug.
>
> Inspired-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/internals.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b5f823c7ec..8239ae83cc 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -87,7 +87,7 @@ enum {
>  static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
>  {
>      /* the value is sign-extended instead of NaN-boxing for zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>          return (int32_t)f;
>      } else {
>          return f | MAKE_64BIT_MASK(32, 32);
> @@ -97,7 +97,7 @@ static inline uint64_t nanbox_s(CPURISCVState *env, flo=
at32 f)
>  static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
>  {
>      /* Disable NaN-boxing check when enable zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>          return (uint32_t)f;
>      }
>
> @@ -113,7 +113,7 @@ static inline float32 check_nanbox_s(CPURISCVState *e=
nv, uint64_t f)
>  static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
>  {
>      /* the value is sign-extended instead of NaN-boxing for zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>          return (int16_t)f;
>      } else {
>          return f | MAKE_64BIT_MASK(16, 48);
> @@ -123,7 +123,7 @@ static inline uint64_t nanbox_h(CPURISCVState *env, f=
loat16 f)
>  static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
>  {
>      /* Disable nanbox check when enable zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>          return (uint16_t)f;
>      }
>
> --
> 2.41.0
>
>

