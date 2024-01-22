Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65268C47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:12:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkjd-0008Qu-D0; Sun, 21 Jan 2024 22:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkjX-0008QH-OI; Sun, 21 Jan 2024 22:12:24 -0500
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkjU-00067R-W4; Sun, 21 Jan 2024 22:12:22 -0500
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4b978e5e240so465058e0c.0; 
 Sun, 21 Jan 2024 19:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705893139; x=1706497939; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfeMf/l+TBJ9CrRrCF0Cbzav1tm5C0rMZCAZozlfOn0=;
 b=ISFMTp5ABSrW7fzdmdBt1gINxodNUNTfIlZKcZm/5PQFUReYkR+gapwiF1IXBZB6Lo
 2yw9sbJnFknEpalQkw2DOqfzM6WpCit1P+7gN4U5HCtLvOvqovIwy/oREHAyPNRLbQnm
 at6iIwMsXID0HuVZeNQSf5eHJBiS7YnO+8T4qmup78t4GJs9W2HlLOqg+hEy4LP7g3Bu
 1df7Vv95V1wjhDNcrLPbFq7rY6LbRyLnf8VeUaeyLcSiS4KFyfAHKaUlu/74nbx4iAv1
 J+5UEs9rSoBVptVZiLbWxvsxU8Et1ps9O59XVgnXEhiionJlQ/p82W9ylQ1UKLoaIWV1
 3WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705893139; x=1706497939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfeMf/l+TBJ9CrRrCF0Cbzav1tm5C0rMZCAZozlfOn0=;
 b=JiMB4FfC+lvUpCIMeS05kvgPWhg3+I48IVAsK4eHWiiHQ7aQhjj16oS9TvKOdqXslU
 nk1aLCDQ2tRXKSAc+YFGQvwwcmwnqAKKO/aosSvFvwcFvaaDNTUkZpuZ5hpnF8c0k6G0
 i6XLOYp1zEPNVbqfK4teJdbLshCD6Wic9CJNm8rw/lkkGFdaeFUHPM6kzRUPXE3BcIdl
 Y5Pokf7VornbE7prHxhOYuijz2g2jWHIg3Enj26iLbZ4egM/SwrHtw5lzpLgd1E5d4+f
 rBXF599Uky7fFZ9/cyhX54kQ00JALGtjRZwYgCKveWqeK9qET7wK7sXNzl/IUUuPCtqI
 sPBg==
X-Gm-Message-State: AOJu0Yzux8ZemK9pRxGt7oSD5cI7R2uxPysilQ6dbEt36WHZ+5FftvyJ
 5mizPD4zuDYTRssY2bG9X4XEfaS4clfP6PYRW6APPrwwzKnH+QELcxEcRtybTUTwLEDf4vABRI4
 7RSwS7Rrf/DCKIqUH1FAVZ2YpM68=
X-Google-Smtp-Source: AGHT+IGXVDoWhiJdAeIjIAu+1PpH/dviIYtMpl10DRxmgYy+i1x8hujpE4i0OJlLWAiL669fTDplcoB71ZnCFnpDTZw=
X-Received: by 2002:a05:6102:245a:b0:467:efe9:d69b with SMTP id
 g26-20020a056102245a00b00467efe9d69bmr917785vss.18.1705893139686; Sun, 21 Jan
 2024 19:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-13-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:11:53 +1000
Message-ID: <CAKmqyKMc6NSZQt61pwAsSM1Qt-wHBMKP3JmYZteX20u1Mi_f9A@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] trans_rvv.c.inc: use vext_get_vlmax() in
 trans_vrgather_v*()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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
> Use the helper instead of calculating vlmax by hand.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index b4663b6e1f..9e101ab434 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3535,8 +3535,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_=
rmrr *a)
>      }
>
>      if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
> -        int scale =3D s->lmul - (s->sew + 3);
> -        int vlmax =3D s->cfg_ptr->vlen >> -scale;
> +        int vlmax =3D vext_get_vlmax(s->cfg_ptr->vlenb, s->sew, s->lmul)=
;
>          TCGv_i64 dest =3D tcg_temp_new_i64();
>
>          if (a->rs1 =3D=3D 0) {
> @@ -3566,8 +3565,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_=
rmrr *a)
>      }
>
>      if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
> -        int scale =3D s->lmul - (s->sew + 3);
> -        int vlmax =3D s->cfg_ptr->vlen >> -scale;
> +        int vlmax =3D vext_get_vlmax(s->cfg_ptr->vlenb, s->sew, s->lmul)=
;
>          if (a->rs1 >=3D vlmax) {
>              tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), 0);
> --
> 2.43.0
>
>

