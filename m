Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E2DCCD1AB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:59:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBijp-0005FN-0T; Wed, 22 Oct 2025 19:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBijm-00058C-Dk
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 19:59:26 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBijj-0003du-L5
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 19:59:26 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-63e2cc1ac4aso199223d50.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 16:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761177561; x=1761782361; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLWZ+0qHFrVJn8iYqQ+SA8YPdrOvX0d5ClWfqeLAdUo=;
 b=K2uaMm04QdErIHQkcLqV64L2YnQz/DELM3wzJ0USLBJ8jh0EX4rng/48OWj97xVix7
 fQ1lshgeCdirNvPjihQiUqSFYgtmQTonnYBhFJa181CaoJN/HtXh2rA3v4zi+7kdQqh9
 /oocpRvGYytV6rlVjgYIrqzEPolDY3jnOMAMMXYoUv/unbB3MvLvoKu/hnzd0iPOM8DC
 g2CyN32kcYQaTQuWg4IEd0XyQkKVQd5waWy7OfDyQZ9zsbIaNOmOX7l7YMX0yQ9ry41o
 nBFqcYySwvPQinBmyV5+JXZZO29DV6W7FgD6w5DSBdWZc/KwNC7etgk26kIlB/08sK1I
 9tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761177561; x=1761782361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLWZ+0qHFrVJn8iYqQ+SA8YPdrOvX0d5ClWfqeLAdUo=;
 b=OCjXcWtUCydiaMgevHxGGEQ5fNt44kjO8cSWAYGan9svGoaw7qJua/2RfI2OJ9k5KT
 /61sYJMO2uSLeS/cUomhISn+QvQ0hMlid/sWOmb1bihrplZsyNpH3k2qA9DNf18LNUot
 8DXkD6UdSDTQirL66kvHS7WXXvVCxAURunoAQcqH8zYYnPlL29iyFiGfCp6YT0P7vi81
 kB8xH4oiiqoaWaxRFldoj0tKjA7XEXsPrhOabw+xOvGXSUPjeVz71psMpKCKDXx2a4qH
 SlqGPc69uwuSX4ZhmAyHFSAyRZ3ihRckrOdvI5uQSiTw/1ZcXXvypRtuhwSfraysTNcE
 Uv3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuWYino43Au4kokH2uEWyyWV3lS22RVrKMHYgl71N+T/tONzv7X8pDzNX+u/cA2azbkqt77rLHHa4h@nongnu.org
X-Gm-Message-State: AOJu0Yy5b++zGBIAHydC6m9QCptT3gwCxrrTCfjfJB6+S83hUeW3y05B
 30ctBclYerV2kCenK+4J3mUzJy4SjwKOWypog5bL8QDjW0wgVsCvqu5F7MWPb+uAu9zj8jfZJ6I
 H9RT2nRydqLGhTA07paIOKqnJzPZeB68=
X-Gm-Gg: ASbGncuxyT73Xx4bls7QTON7rGhG+57XtJAzY2VCTdjZyqrFh8D/SvnPMPrgQDinawX
 s6rPmhLr171hBAzRUhgVKVpGTeIk+aH3rDJD7thYZ+45g2KlzlD2tdL88+MhvMEQy+S7TGa706C
 gTjVdsk4l3G4cU+I403D2/RPbvWQOcNBBSY0Ol5AKGgKUMdjj7TJq6Pq0DOniXe+6GsOJPOlivr
 cto/rO1Xp5Tp/dDXG7ZweezLdQmuvWqCGWOr3HXeMrlFVJjfn49+Pyhskr+mmaDqlvEm2TgXwNs
 ZheWdwvkq829wu9j1RO1DowLqDlTL0FbsISr
X-Google-Smtp-Source: AGHT+IGdLMq+Ap7ju7sJ6s9eL17YCINNsFADhFbWqkDLYjjFfE8TxZx8Kdq4CvGKT2zFb9Ms5+T/12IeML+dZ6YhlWg=
X-Received: by 2002:a05:690e:2514:20b0:63e:8e4:4774 with SMTP id
 956f58d0204a3-63e16187fccmr15576486d50.15.1761177561160; Wed, 22 Oct 2025
 16:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251022124340.493358-1-dbarboza@ventanamicro.com>
In-Reply-To: <20251022124340.493358-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Oct 2025 09:58:53 +1000
X-Gm-Features: AS18NWCRCHvvguLVR0biTYx2m7Tfk0lUfAX2A7d1Et40qxzmfVIos9IjfTlCd2I
Message-ID: <CAKmqyKOqKh2_8C+nfrKOMSmVegAhXArfYp1AveJYTi=emXYidQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix riscv_cpu_sirq_pending() mask
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=alistair23@gmail.com; helo=mail-yx1-xb12a.google.com
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

On Wed, Oct 22, 2025 at 10:45=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're filtering out (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP) from S-mode
> pending interrupts without apparent reason. There's no special treatment
> for these ints as far as the spec goes, and this filtering is causing
> read_stopi() to miss those VS interrupts [1].
>
> We shouldn't return delegated VS interrupts in S-mode though, so change
> the current mask with "~env->hideleg". Note that this is the same
> handling we're doing in riscv_cpu_mirq_pending() and env->mideleg.
>
> [1] https://gitlab.com/qemu-project/qemu/-/issues/2820
>
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/2820
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3479a62cc7..360db133e2 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -443,8 +443,7 @@ int riscv_cpu_mirq_pending(CPURISCVState *env)
>
>  int riscv_cpu_sirq_pending(CPURISCVState *env)
>  {
> -    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> -                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg & ~env->=
hideleg;
>      uint64_t irqs_f =3D env->mvip & env->mvien & ~env->mideleg & env->si=
e;
>
>      return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> --
> 2.51.0
>
>

