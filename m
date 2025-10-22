Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE22DCCD1BE
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:58:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBijE-0004g1-97; Wed, 22 Oct 2025 19:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBijA-0004fd-8a
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 19:58:48 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBij7-0003ZB-6r
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 19:58:47 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-63d0692136bso234919d50.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 16:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761177523; x=1761782323; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9uzGB6Y2KUsQdK7LRQHU0rGmgGqs1b/9+E+uxY6U7c=;
 b=OoOJhLzA3S87VFgDa+q9NSys4rQMRLp8LcSILIWzEwS483jQzMUXBkg7PbTLVBpOOg
 v9O2PWZx6q4B1iJ36c3pZ/NryER4OHoSh2nZJwH/ntAmPrVES8orsfYZyHP8/UIsAjeR
 aUbEet0gnTVndQniEfKcZcZYEDdUZa/4oV7rb8VRdfQg45kpIn5bmHlU1Mi/po0dg02m
 7OJd06fNd6nXFnOJDjlNhhWJ2iHwtaad0TQJrr6Z/JiR0AaNkWHs0A3GVqKTIZW8+GP3
 GandM2urmJ2pN7U6JhoKMM/AABr2FWps2Q5BSfLl+KVXI26DFRSQ05qcug71FeP27O3p
 Pjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761177523; x=1761782323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9uzGB6Y2KUsQdK7LRQHU0rGmgGqs1b/9+E+uxY6U7c=;
 b=EDTt2Py0iz1qaN8UE2PaCNG9G1Utdc66fASMwTmzmxm/cNqXzlFJ219SvuA+hm7V8w
 dmvGCEj1fwddlEXwqJDKmEL7FbHu4Hgoqa5cGo8v7boF60XhtW9x9xoylQTNQPD9FDTv
 OmJHI2YglO7dC9Hli/sLODe9WOmBfPHaWQfAe7WTdpVCDqV4M+Mpbzt3Qhig6Jy0GxMI
 eu+luhmZjlldOgnSF5nt+LW9i0+5xan9BzKE+hA7yQNcMpBnCuz0Peboii/9fTYKoWgT
 rde2B3unuGCkORpWjWzBzbbU+7c8xxHWmxxuo+qXeWtfrqbVQjIwCxHXzLs8ItKW9O8e
 HIIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNNmL7ttFnyQsn0E4aAifFl4BL3qyEB43I1S2WIguo4A1ZfQVth8aEiqOpyw7hheNa1hHPIywfRw/X@nongnu.org
X-Gm-Message-State: AOJu0YzhGSLLrdFtHREAEgyJkQbkigridGgMvyZ5HjgskLPl2sBCxVNY
 jyPdO49EZw0T3C5yAB4NQ0MyGjiI5rJGBpTAN45/YrU5IkwSg5P0JIL9RUke+tWt9Fb43ue/itJ
 tQ+ZLTo6wetBq5FHjeS4Z8V9Ak/lRUNk=
X-Gm-Gg: ASbGncvF/VxQyV7a1dG9JyFEO2yUWIo38Xzf7o9CrOeLuInj8ywhTGRqgH7LQeZC/2V
 Bb2KiauOQ0dspi43sqDjT/Q9QNWJS4iPZy9nKrVp5BYzghwcyIZdwoVlHW5Q6Q78opT2lXeRUnC
 9BSRe9GKU4bg+YoS4v4ZB831B8trmpBfHiqPNQjkpG8pKhTo4JQ7zWuicXDSpTsvSKHqSgGMM5L
 aDkMSz94Qp/L7kQ9UyJKFV009F3rN/1wfNFgBHD8otIhWXbzPFkxgGQcg0D4UhiK85KFnJcPd8l
 uboc+phdyX4Chzc=
X-Google-Smtp-Source: AGHT+IEbtD+bNCOZiRB0RLxw3rwl9TuaA4hZUnFWW7qt2B85CAQhPR4iteZru6PeNMzZIRT3C1feTfP8wOLLKu2htxU=
X-Received: by 2002:a05:690e:11cb:b0:63b:6b56:e6af with SMTP id
 956f58d0204a3-63e161993damr15859662d50.36.1761177523490; Wed, 22 Oct 2025
 16:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251022125643.588947-1-dbarboza@ventanamicro.com>
In-Reply-To: <20251022125643.588947-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Oct 2025 09:58:15 +1000
X-Gm-Features: AS18NWAIQNHQCh5Mp94JgHsjlcQ18pwwA-U8wkyMHM2VL46LfaHW-8rU6YMk-dk
Message-ID: <CAKmqyKMHUeL+ScaBJKdgPmM=onS5qnNNR4Z0qWYf3c9zfOkbbg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv/riscv-qmp-cmds.c: coverity-related fixes
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=alistair23@gmail.com; helo=mail-yx1-xb135.google.com
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

On Wed, Oct 22, 2025 at 10:57=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Coverity CID 1641401 reports that, in reg_is_ulong_integer(), we're
> dereferencing a NULL pointer in "reg1" when using it in strcasecmp()
> call. A similar case is reported with CID 1641393.
>
> In theory that will never happen - it's guaranteed that both "reg1" and
> "reg2" is non-NULL because we're retrieving them in compile-time from
> static arrays. Coverity doesn't know that though.
>
> To make Coverity happier and add a bit more clarity in the code,
> g_assert() each token to make it clear that those 2 values aren't
> supposed to be NULL ever. Do that in both reg_is_ulong_integer() and
> reg_is_u64_fpu().
>
> We're also taking the opportunity to implement suggestions made by Peter
> in [1] in both functions:
>
> - use g_strsplit() instead of strtok();
> - use g_ascii_strcasecmp() instead of strcasecmp().
>
> [1] https://lore.kernel.org/qemu-devel/CAFEAcA_y4bwd9GANbXnpTy2mv80Vg_jp+=
A-VkQS5V6f0+BFRAA@mail.gmail.com/
>
> Coverity: CID 1641393, 1641401
> Fixes: e06d209aa6 ("target/riscv: implement MonitorDef HMP API")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
> Changes from v1:
> - use g_auto(GStrv) instead of g_autofree
> - v1 link: https://lore.kernel.org/qemu-riscv/20251022110524.483588-1-dba=
rboza@ventanamicro.com/
>
>
>  target/riscv/riscv-qmp-cmds.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> index c499f9b9a7..d5e9bec0f8 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -273,12 +273,13 @@ static bool reg_is_ulong_integer(CPURISCVState *env=
, const char *name,
>      }
>
>      for (int i =3D 0; i < 32; i++) {
> -        g_autofree char *reg_name =3D g_strdup(reg_names[i]);
> -        char *reg1 =3D strtok(reg_name, "/");
> -        char *reg2 =3D strtok(NULL, "/");
> +        g_auto(GStrv) reg_name =3D g_strsplit(reg_names[i], "/", 2);
>
> -        if (strcasecmp(reg1, name) =3D=3D 0 ||
> -            (reg2 && strcasecmp(reg2, name) =3D=3D 0)) {
> +        g_assert(reg_name[0]);
> +        g_assert(reg_name[1]);
> +
> +        if (g_ascii_strcasecmp(reg_name[0], name) =3D=3D 0 ||
> +            g_ascii_strcasecmp(reg_name[1], name) =3D=3D 0) {
>              *val =3D vals[i];
>              return true;
>          }
> @@ -294,12 +295,13 @@ static bool reg_is_u64_fpu(CPURISCVState *env, cons=
t char *name, uint64_t *val)
>      }
>
>      for (int i =3D 0; i < 32; i++) {
> -        g_autofree char *reg_name =3D g_strdup(riscv_fpr_regnames[i]);
> -        char *reg1 =3D strtok(reg_name, "/");
> -        char *reg2 =3D strtok(NULL, "/");
> +        g_auto(GStrv) reg_name =3D g_strsplit(riscv_fpr_regnames[i], "/"=
, 2);
> +
> +        g_assert(reg_name[0]);
> +        g_assert(reg_name[1]);
>
> -        if (strcasecmp(reg1, name) =3D=3D 0 ||
> -            (reg2 && strcasecmp(reg2, name) =3D=3D 0)) {
> +        if (g_ascii_strcasecmp(reg_name[0], name) =3D=3D 0 ||
> +            g_ascii_strcasecmp(reg_name[1], name) =3D=3D 0) {
>              *val =3D env->fpr[i];
>              return true;
>          }
> --
> 2.51.0
>
>

