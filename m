Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DDBC83F2D
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 01:01:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcxy5-00018W-6t; Sun, 03 Sep 2023 21:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcxy2-00017z-FB; Sun, 03 Sep 2023 21:01:26 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcxy0-0005GE-84; Sun, 03 Sep 2023 21:01:26 -0400
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-44d426d0e05so387876137.0; 
 Sun, 03 Sep 2023 18:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693789281; x=1694394081; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0H4g9Bnb7ooDgzzrFLAkoQxBMdY2iSjsXPQXuC+A/bQ=;
 b=fWKTgMKV4Ji3vJS9BTBcdd9hxI4AE5bve88313JH5tn2CXgtWIBlI6GNVQQRHm6Ggu
 W1cm5UKZ4Dc/peS24Ati3+PN6r5TZh/RdRG01Fw+iFFY41Bzs6l5V5PXnLaRSgXUUeuy
 PV8PQFRdu2LTRIedTnZFEYeeF3Eifsb254WMUql6F1HesO6lFqFQsR6gvmuQJYJgCX/f
 ZUdTDimxzsNpZaNZvO0muqInmpxWJZnUMUj42LygVKA+sL5bzqBhS9oclMKIsmX4H2+/
 XM3QpvUAXhBharYLtRoAN09J35cGjNQEt44FKupxWcwRhBfo1j39fcU0t8IPQE6FUU/T
 1Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693789281; x=1694394081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0H4g9Bnb7ooDgzzrFLAkoQxBMdY2iSjsXPQXuC+A/bQ=;
 b=kQ+vJYzl7KIabbnzyf+H3ZUeuG88imnHZlLT7PhIidDxEQkEWEVqylwk691KURZIrc
 +p8MDK69FTi/prN4EnT8JY8CREwofvhd01RCXByel4/Q//7PQWzXI3/pXPbGGQjhHJKG
 tO6QkKR1UGABJHJzg0glZEgpq4v2DkbUhaZOmopwUY2lG5IpSqG4T9oix5aBPerDJXlu
 tVi4oRJ8B8MqmDZWDk3PV4yOM1I39/ifWrYRLGQH2Gx96uwllIZyYVE0LdbAVPsXEwnG
 bw9n0gFNzZZZlBag9lM/BMdRJXxez3kl0Ynf5UZISS3Jcl9EUXY/aZELKwOXZV60z/9m
 NlyA==
X-Gm-Message-State: AOJu0YwIrbkr7H6yqCXPlc10EykH+5e2w3KHbOAz/HMlD00wI0R/yXgA
 yQAW25HQd2COm5vUtmKrZV5lwy8W0S6gJooU+c/0nYRU5lVFrw==
X-Google-Smtp-Source: AGHT+IHSmc2iwWv/kBxgNDSlzR+L/MqwmoDePQY6meCTObS3YcLgGt0LxRlJzunSc58HVA+7XaokWon53AaoTeiYO0c=
X-Received: by 2002:a67:e8d4:0:b0:44d:547d:4607 with SMTP id
 y20-20020a67e8d4000000b0044d547d4607mr6834121vsn.35.1693789281602; Sun, 03
 Sep 2023 18:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230829215046.1430463-1-leon@is.currently.online>
In-Reply-To: <20230829215046.1430463-1-leon@is.currently.online>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Sep 2023 11:00:54 +1000
Message-ID: <CAKmqyKPBb8SKT6V_=zXfsfP1P1yHCFiyzPKpL+AGeMMsxXLMsA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp.c: respect mseccfg.RLB for pmpaddrX
 changes
To: leon@is.currently.online
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Leon Schuermann <leons@opentitan.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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

On Wed, Aug 30, 2023 at 7:50=E2=80=AFAM <leon@is.currently.online> wrote:
>
> From: Leon Schuermann <leons@opentitan.org>
>
> When the rule-lock bypass (RLB) bit is set in the mseccfg CSR, the PMP
> configuration lock bits must not apply. While this behavior is
> implemented for the pmpcfgX CSRs, this bit is not respected for
> changes to the pmpaddrX CSRs. This patch ensures that pmpaddrX CSR
> writes work even on locked regions when the global rule-lock bypass is
> enabled.
>
> Signed-off-by: Leon Schuermann <leons@opentitan.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 9d8db493e6..5e60c26031 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -44,6 +44,10 @@ static inline uint8_t pmp_get_a_field(uint8_t cfg)
>   */
>  static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>  {
> +    /* mseccfg.RLB is set */
> +    if (MSECCFG_RLB_ISSET(env)) {
> +        return 0;
> +    }
>
>      if (env->pmp_state.pmp[pmp_index].cfg_reg & PMP_LOCK) {
>          return 1;
>
> base-commit: a8fc5165aab02f328ccd148aafec1e59fd1426eb
> --
> 2.34.1
>

