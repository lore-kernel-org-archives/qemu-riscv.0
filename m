Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028A9C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 22:55:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF02I-0000TT-MS; Sun, 17 Dec 2023 17:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF02H-0000Sj-17; Sun, 17 Dec 2023 17:55:01 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF02F-0007uY-Jk; Sun, 17 Dec 2023 17:55:00 -0500
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7cad62b0a68so335939241.1; 
 Sun, 17 Dec 2023 14:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702853698; x=1703458498; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8nkBHdl08VZ0achz1wa1UTOO5ut7QycYK9mSo2h8u0=;
 b=MNJVdXAfIN7No1oJOYquuYNR0FHjKjJ7n5/kv1r4qTTEqAraujuKiOhw0FDex6QUd1
 UsE3i+0/jmEpCuybiQe3QwfCLneh2xoGwsEfH6CwSucGHU3qb9THOq1eDE83j1LoKasq
 pu3jDanjHa2atO+i62wcUjUbBaEMoM/XAo9LcuSAmbbt5NBHEtcI8K1XAjPAQ9Zal4tD
 sYXf8XvrsDoKwV1DymVhudLytq7YpX/7iNB5rxksvZgMOnPhFYQEuzKKE/Z4a7j6Ss2S
 Ln+wBULfDrFGkZ2fnyuLfLRapTaxR1J0PsLFATRLL7xInF6Sbwy78IIEh10PyjwGzvV3
 DKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702853698; x=1703458498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q8nkBHdl08VZ0achz1wa1UTOO5ut7QycYK9mSo2h8u0=;
 b=jl+1kdxo8TpttUzctkMURP4TlBLmtVDuzyBPO+pnONnzapp+TJ5+bBHdwhEFJUEhDf
 EdOcQxeGazSSROLxIb9HitM8ZXQ3J/XMXP03AfSFC8o2O4gMiJgIWG7CfBRKXBjWeomc
 HX2z+LWttCWQF7NcWA/DXPALvmT0yWyrjThHRXxsqlRM7AlNO6SWY/UCGw3SShLO/Yw0
 B6w0+dfXEBlu1PVYFJgh6/hMNHr44yO6V7pP6pqypEr9GCHQlIQ1whcwvfUs7LR0d8rT
 perMjRsH99V9FBO0hnF4Djd3Qatp9CDd1ptUoJWWSo+rWc7jmdp8BqZmoOwQQ0FFbuU9
 dENg==
X-Gm-Message-State: AOJu0YylzUq/coKZSBtA3+EWI9iYrz0wUZN+4N1ieE6EUDW2bMyhY6c/
 gov26p/IUN1/I6u0JO405SgQLLQ4Chd+l4AoIAk=
X-Google-Smtp-Source: AGHT+IEPvF6Y036n7uf25dN9CsXiutTPM83YZ9/9MblioBQeJO6+l4qp8Si50MYwXhQA7n84qZ46Q/eGjNuhquSWLWo=
X-Received: by 2002:a05:6102:b13:b0:464:5162:d22b with SMTP id
 b19-20020a0561020b1300b004645162d22bmr12732914vst.5.1702853698283; Sun, 17
 Dec 2023 14:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20231215023313.1708-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231215023313.1708-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 08:54:32 +1000
Message-ID: <CAKmqyKMoQ=PjKKV-NHQGR84HUkDGDAgCEmiboNLAkcFSNUX1JQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Not allow write mstatus_vs without RVV
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Fri, Dec 15, 2023 at 12:34=E2=80=AFPM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
> If CPU does not implement the Vector extension, it usually means
> mstatus vs hardwire to zero. So we should not allow write a
> non-zero value to this field.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a53..d1de6b2390 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1328,11 +1328,14 @@ static RISCVException write_mstatus(CPURISCVState=
 *env, int csrno,
>      mask =3D MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
>          MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
>          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> -        MSTATUS_TW | MSTATUS_VS;
> +        MSTATUS_TW;
>
>      if (riscv_has_ext(env, RVF)) {
>          mask |=3D MSTATUS_FS;
>      }
> +    if (riscv_has_ext(env, RVV)) {
> +        mask |=3D MSTATUS_VS;
> +    }
>
>      if (xl !=3D MXL_RV32 || env->debugger) {
>          if (riscv_has_ext(env, RVH)) {
> --
> 2.25.1
>
>

