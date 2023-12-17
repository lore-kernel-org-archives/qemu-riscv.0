Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A361C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 22:47:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rEzua-00071a-Ih; Sun, 17 Dec 2023 17:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rEzuZ-00071M-4d; Sun, 17 Dec 2023 17:47:03 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rEzuX-0006AK-NJ; Sun, 17 Dec 2023 17:47:02 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6d9dc789f23so2023430a34.3; 
 Sun, 17 Dec 2023 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702853219; x=1703458019; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0civUcNhg1i3NeXBmXNu1GbvVR6uCcA+M2Q5iqg0vU=;
 b=C6BgPGXhDAoVmVbGY3HyWQ96+EmiNVp9G5SfAGGLnQVtdjKUv+tC/ZtSKb9Kuy1fri
 tKRGEv/VvYawu3p7tcYwsDT5lvSv1n0b8ZNzvNHCxDIMRw9FV2/TxlBx0kM+SDDEzm2I
 kKpTup+rd/gc7mWoksEqa8z3CRHUgXLzn1MZ5Pig6ZEQiCYRGzsS43/IaWtrMatJs23m
 Pjykfepeo5LJdTuIvXOzR4f8klXOLBe08+QuXCivGyRDKDr8CUn+ZITb17SysV7o8vws
 S3MMQBulxzz21q3n614Z5Bp+9xkMmkLYmUrpA3ofvo/h8xPpwSyo9jVHPVw2Vr9Ztrlf
 dwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702853219; x=1703458019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0civUcNhg1i3NeXBmXNu1GbvVR6uCcA+M2Q5iqg0vU=;
 b=EmZdEEfsGX3YAYpcfjCuPHaRfuuuxdRhhMEXJbwgOxIxlp+zkoMA1O0KpcmQB9LIA3
 ZECqDHgyxRzlAxCkLYoig8/qsCRNm2DWf2dFnSrS+q6Qk9ycIuaJkyO+YRW4PETJjRr9
 EdQWNiaJdGFQndXD3tR1phGi1++opH8PEfNH5k+QHzipixrQGDzbO991ctfoOGnHXv7K
 OBpR5Kjz2tYNWnE+Fz1BY/NmA9kPt+qZ6QKVFiVz2IquLRhhDT+zm1EII7ZS1vcVREOs
 m1Md6Glx/qq9ejXf+7R8soVBplzjKnMAl+w5Ji9l0pW/QZoVJjFdJDC7FKiRKCe8ESXl
 I0NQ==
X-Gm-Message-State: AOJu0Yw2EHfV3UMGWtUfmE+qnm7JGYY9ZSxFKscPEYvYAQTwuiQdhrOO
 5aNklTv+/7hwzWrzcwIu6lEPywtYie6HJgmZFPc=
X-Google-Smtp-Source: AGHT+IE5dkDd5lFqkuoAYDzveiYtAmWUkg/3UT0l9TzWzqiDLdKcCjg3YgHBMciuWux0+xQhzD6IhKMUIdnQ5fFefHs=
X-Received: by 2002:a05:6870:70a4:b0:1fb:75a:c42a with SMTP id
 v36-20020a05687070a400b001fb075ac42amr14351335oae.83.1702853219236; Sun, 17
 Dec 2023 14:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20231215023313.1708-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231215023313.1708-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 08:46:33 +1000
Message-ID: <CAKmqyKNzqXSSWN19MCuDKjWpaHxvbP29gkPK4E1QLW4ebkPeog@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Not allow write mstatus_vs without RVV
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x332.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

