Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32C0CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 03:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsEVg-0001P5-55; Sun, 15 Oct 2023 23:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEVc-0001OK-T0; Sun, 15 Oct 2023 23:43:12 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEVb-0004fA-DK; Sun, 15 Oct 2023 23:43:12 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-457c441555cso1000203137.3; 
 Sun, 15 Oct 2023 20:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697427790; x=1698032590; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzK3SZbnBml5AjuKPWXFtgxFww/uViw4QSNQdS8gie4=;
 b=M+Q0ZtS/hVr3WFi/YjUtzG5WmZv4gDykdjXIywTY2OuN7YOfGksHxpbQ7PZMx26Pqa
 rW7jggFFRVgjHKETVTGXZMC5aS8X9Q4wvGcnyLwJSYgnwGeGfT6xHxfVQxu6fW11C8c8
 lJLHy9MFBsomB+fNS1Uu0wIBcKx/YflkXWQNj0AhC03C2mAa0gHHQ0m6bKelvCvo+niG
 FANSY8Bs9udubATYMFdjiKPTwVKlUppOZ38gFKYS5UKNJ2kht9dzXby8t25uCTsZdUfW
 i3hGOsnCV4ktiIZrIMmwli451a9rRhGvgm2MEXXV1CSNxrKrCsfJDhfArdBvP8Ct/UqK
 NmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697427790; x=1698032590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzK3SZbnBml5AjuKPWXFtgxFww/uViw4QSNQdS8gie4=;
 b=uybKaBhUdGenR9BN5sNuq7t2liucGTZe/PgBgivW+Pr1RLoOgKvITqrSd2StZ7nKoP
 U0qmRWb7Q4/QAiG0db6n13LCh7Vt+bBW7mt98TF5L87LBLg/rQqoPZlC/C9N+Hds3lvq
 jMG9HuXK+JXsQOzrhlyfO669dEhylCgx8AVRzi6Z9YvTCNidzEky/UaGdYJGYFEkq3Wz
 hcoix9itXrXEF2KG6R6u7FkG5+IbvcFf7Ct56zpTZdc6JLKKaBZhMsR6nYH4fc3B/6pY
 PKlJAvx0KYul6r3Fpp4sCz5Si36s9EJ5uz1IiinEMujCoa83de0qobIEoaoP9xAs3iz7
 fBMw==
X-Gm-Message-State: AOJu0Yy/dMdaUuQf3ePFG9S8CdMf12OKOc/ZcENY5aHqrcUACBwr4f+O
 0jdY4ZLCeDbI2JiB3wJKAsLTquAi7uDKGH8xUUM=
X-Google-Smtp-Source: AGHT+IEBHEpW0oJ7hteBuAOXIaSjY440lrYxoqcni8v+FGZNIrm19ehgwpSuppPKYyMQ9V9yd551tOt1qjCaj81PssY=
X-Received: by 2002:a67:e110:0:b0:457:bc6c:937b with SMTP id
 d16-20020a67e110000000b00457bc6c937bmr5182506vsl.18.1697427789791; Sun, 15
 Oct 2023 20:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-3-rbradford@rivosinc.com>
In-Reply-To: <20231011145032.81509-3-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 13:42:43 +1000
Message-ID: <CAKmqyKMFBXw9Gr-oWFm7hsvTqR-LVzsyxcdp7S=-6K7Qh8Fofw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] target/riscv: Don't assume PMU counters are
 continuous
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
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

On Thu, Oct 12, 2023 at 12:52=E2=80=AFAM Rob Bradford <rbradford@rivosinc.c=
om> wrote:
>
> Check the PMU available bitmask when checking if a counter is valid
> rather than comparing the index against the number of PMUs.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 85a31dc420..3e126219ba 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -182,7 +182,8 @@ static RISCVException zcmt(CPURISCVState *env, int cs=
rno)
>  #if !defined(CONFIG_USER_ONLY)
>  static RISCVException mctr(CPURISCVState *env, int csrno)
>  {
> -    int pmu_num =3D riscv_cpu_cfg(env)->pmu_num;
> +    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> +    uint32_t pmu_avail_ctrs =3D cpu->pmu_avail_ctrs;
>      int ctr_index;
>      int base_csrno =3D CSR_MHPMCOUNTER3;
>
> @@ -191,7 +192,7 @@ static RISCVException mctr(CPURISCVState *env, int cs=
rno)
>          base_csrno +=3D 0x80;
>      }
>      ctr_index =3D csrno - base_csrno;
> -    if (!pmu_num || ctr_index >=3D pmu_num) {
> +    if ((BIT(ctr_index) & pmu_avail_ctrs >> 3) =3D=3D 0) {
>          /* The PMU is not enabled or counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> --
> 2.41.0
>
>

