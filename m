Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3497C47DAF
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 17:21:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQW4t-0002VB-5t; Thu, 18 Jan 2024 12:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1rQW4r-0002Ud-7j
 for qemu-riscv@nongnu.org; Thu, 18 Jan 2024 12:21:17 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1rQW4p-0003oT-7i
 for qemu-riscv@nongnu.org; Thu, 18 Jan 2024 12:21:16 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-dc25099b084so1093860276.0
 for <qemu-riscv@nongnu.org>; Thu, 18 Jan 2024 09:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705598473; x=1706203273;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pa5sGR9Z3Vq29YykmMl5lAz7CVoGlVrI8qxa+rfd10c=;
 b=BnOi9ov0xK+sOm7QVL3XN4MYhqIfTMe/D8LbsvSpSoLSS+g+Edwss0WjwSixvdJH20
 kYdj7Vf4f/0kHtWhFajeX3bRuPI7QooHb3lRYRqBai8OAjGg7Bd2mOtAxuxnB87olwns
 ArN8fRBTa0OmDGi0oFHM7mTvTOXi/x0NbM8FZwyWOupiyIlky6nX3lBsuBq+CicpdW/Q
 FuhXI45ftjyQr6W4VjH5KIoOBxue5IO7aNpbgS9wrVnRpu+RqYJnTp6ixl0cjmEkF+u2
 HqehXZzJSl/6/hDif1csQXuiAbYy9NEAMioQ6v5TV+70IFc8EOx+EUx6/z6Z+GMcZD5c
 YZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705598473; x=1706203273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pa5sGR9Z3Vq29YykmMl5lAz7CVoGlVrI8qxa+rfd10c=;
 b=w7sd5DKiKzlm8XcHyla4wr9Jkbb/F3v26b12HPOM/X39Wg6+q7CLt9Y71TbEo9sFLE
 kbDPlNp1Fs8bYqy6QFMT9IXLnxO3nBcOqthdaHPjx9NpbrtItlRlDMGwZ1xkyK0RVtEE
 jdjtLoGqxhNwwd9vcTaU2/IZobbXsEf6nSm0uL7M4BiQEu83dcnG9DqEHO6Jai6DttF+
 WrPXj+mgKbhTE979zWU0r/fpv7YOM/L/Ao8/FupNLetGYk+rv7IYignkp1aRs2PN0RzX
 26HUowK9xYVbqoE8qxDNmqiY0ExG27fO0F6HgTDREy63CY4ksifKRyjcgp8PCHlG+F6c
 xq5Q==
X-Gm-Message-State: AOJu0Yw1DMhegvHHWKUf+93KUg/73IqmSWFFwpGKQggQKg5Zp7QqAL9F
 GilRWQ/MtUua8EMbTmLv7QmhHWQUJiBowUYUE5KaKEuygA9qTbvsAOx0W2AuD2euE6jIvY4Zme5
 /1tpAFu0mSQLG6OfQNo8QHg09QyCAxkL6H/WH2g==
X-Google-Smtp-Source: AGHT+IFUK+nQ/P5YWe2QiOgElsSIUQgzapBnG6guCHS7/1bZqZIgQvyM2vVeRFeKMFcalWauj1QE8AZLrP4C/mikj9I=
X-Received: by 2002:a25:ac46:0:b0:dc2:48af:bf01 with SMTP id
 r6-20020a25ac46000000b00dc248afbf01mr1033194ybd.29.1705598473433; Thu, 18 Jan
 2024 09:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20240109102930.405323-1-me@deliversmonkey.space>
 <20240109102930.405323-4-me@deliversmonkey.space>
In-Reply-To: <20240109102930.405323-4-me@deliversmonkey.space>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 18 Jan 2024 09:21:00 -0800
Message-ID: <CAKC1njSLR614zQk0_DAgYN1jjdg=0eUa7N1AEwwXZVNN6BwjmA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=debug@rivosinc.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jan 9, 2024 at 2:31=E2=80=AFAM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---

> +
> +bool riscv_cpu_virt_mem_enabled(CPURISCVState *env)
> +{
> +    bool virt_mem_en =3D false;
> +#ifndef CONFIG_USER_ONLY
> +    int satp_mode =3D 0;
> +    int priv_mode =3D cpu_address_mode(env);
> +    /* Get current PMM field */
> +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> +        satp_mode =3D get_field(env->satp, SATP32_MODE);
> +    } else {
> +        satp_mode =3D get_field(env->satp, SATP64_MODE);
> +    }
> +    virt_mem_en =3D ((satp_mode !=3D VM_1_10_MBARE) && (priv_mode !=3D P=
RV_M));
> +#endif
> +    return virt_mem_en;

Obsessing a little bit on how to test PM enabled binaries with qemu-user.
If we return false above then we're not allowed to test binaries with
pointer masking enabled with qemu-user.
That use case is not required?

> +}
> +
> +int riscv_pm_get_pmlen(RISCVPmPmm pmm)
> +{
> +    switch (pmm) {
> +    case PMM_FIELD_DISABLED:
> +        return 0;
> +    case PMM_FIELD_PMLEN7:
> +        return 7;
> +    case PMM_FIELD_PMLEN16:
> +        return 16;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return -1;
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>
>  /*
> --
> 2.34.1
>
>

