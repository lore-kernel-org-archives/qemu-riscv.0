Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CC2EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 00:56:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIfBl-0005xl-7q; Sun, 09 Jul 2023 20:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfBi-0005xK-Qj; Sun, 09 Jul 2023 20:55:38 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfBh-0005kP-4Y; Sun, 09 Jul 2023 20:55:38 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-440b54708f2so1351301137.0; 
 Sun, 09 Jul 2023 17:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688950535; x=1691542535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4Qr+CMcRvK7od0Tu4aV60dgvSnHiMgCwfgZMkOn8Ik=;
 b=HEz/W/WxWMhRUbHbBn4jXo7TWQFBUyQeU3XT8Z8bawnzRrx93gQ5GqlrmU2mky0yuh
 4aGNzbYDaPytyRZyxiYTXXybVUDmWYLWwUXs4xq4SuoHfFUlytNlSxFNqlo4yPZg///q
 eHokUPCrvm1KugKMUk/Rg0AuZg18iAM8nu+9/590co2jKFQdO05mXrpdeCYbfnrlm92H
 e2uO+NdH5+1bLZpk+ft9gNl/I5S7aI+i2c99DMbqzOIDpsvKlRet8U03jSVr/4+8I0Ze
 5noHbDzcjOccDjDxyjgj9rF6ctnJkmf6GBhHAY3F1LGU6BXJ23t6t8+CP1XSB4FgXj2b
 AlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688950535; x=1691542535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4Qr+CMcRvK7od0Tu4aV60dgvSnHiMgCwfgZMkOn8Ik=;
 b=dxzkYIqn9eA4uMxqNwyBRORmS32EtXZ0I92xKe6Cc5BTCRRgyOK/YN3Xl6/aBAj8PI
 7XsbqGMN1mPIq7QKM9nxoDRa3KtzihqrHTpbwzo8SG+6mq2zRSwQSX+yR1614PI8kIK3
 +yrajjdRBQkXM528bRyzugn8qK28C4Q6V/7zIZPawOCwugYom4+IGpPN4nqFVBSwo2dN
 FRu9lTcB1iGWEM3jNYDklWtn0RcLitb+7RzkWkEsTDKXlx7YSQ/Xce7OJzeEkZwq5+/O
 mHZEBzGnR4VfeAU608ONC5IGUkohuUl9rxDBQJ56ZO+U0dcVc7I5cew/ba0PCPQ5EfqA
 Zxbw==
X-Gm-Message-State: ABy/qLawJ4aCFBp2/5ljynrVEcSKu0cKgjnpNEwuVDt6SL3gzLa/J6nZ
 WSM04DIdGB4tU7gHqDger2PckSzdXmnhk9+0bbE=
X-Google-Smtp-Source: APBJJlEgxK2QI3lIURM2zYzSkWNt2S7ck3rXLLhVEpJAf6xAIW7dFzk+ewpxpk5GinLPuspaPpISDnHhtOvtYQdEKv8=
X-Received: by 2002:a67:be06:0:b0:443:5af5:8128 with SMTP id
 x6-20020a67be06000000b004435af58128mr5664519vsq.0.1688950534720; Sun, 09 Jul
 2023 17:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230707032306.4606-1-gaoshanliukou@163.com>
In-Reply-To: <20230707032306.4606-1-gaoshanliukou@163.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 10:55:08 +1000
Message-ID: <CAKmqyKNFx=t4x25fLQWdtWhzhOrN-+xU0FmifquT8pcfNALbng@mail.gmail.com>
Subject: Re: [PATCH] target/riscv KVM_RISCV_SET_TIMER macro is not configured
 correctly
To: "yang.zhang" <gaoshanliukou@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com, 
 kvm@vger.kernel.org, zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com, 
 "yang.zhang" <yang.zhang@hexintek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Fri, Jul 7, 2023 at 10:26=E2=80=AFPM yang.zhang <gaoshanliukou@163.com> =
wrote:
>
> From: "yang.zhang" <yang.zhang@hexintek.com>
>
> Should set/get riscv all reg timer,i.e, time/compare/frequency/state.
>
> Signed-off-by:Yang Zhang <yang.zhang@hexintek.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1688

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 30f21453d6..0c567f668c 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -99,7 +99,7 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, ui=
nt64_t type,
>
>  #define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
>      do { \
> -        int ret =3D kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg=
); \
> +        int ret =3D kvm_set_one_reg(cs, RISCV_TIMER_REG(env, name), &reg=
); \
>          if (ret) { \
>              abort(); \
>          } \
> --
> 2.25.1
>
>

