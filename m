Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D382CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 01:11:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qujTX-0007dc-KJ; Sun, 22 Oct 2023 21:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujTV-0007d8-PZ; Sun, 22 Oct 2023 21:11:21 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujTU-0007R3-Cu; Sun, 22 Oct 2023 21:11:21 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7b5fd0b7522so554170241.0; 
 Sun, 22 Oct 2023 18:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698023478; x=1698628278; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JE+nyMgkE7MsgTQwcTo9RjpvZHiunBt21/B2JI/Xoko=;
 b=aPC0mJ8kLI0nsaTicV1QDfK7RK7JiD/7yToVGK0ELbTjZAXDinxHaiSaIu654NGJrw
 3liLj+uYWGe/wc7hW6TiKgP3Wp4CADN+YXBWi1mEVQTDTva2O9mGTpVWWzegDK353KUe
 CpTmnjLGhsOxDGH5BrJCaoWHleixThpjNYObt+kQrJ+01D+4pZEDiEKIh20x/7YrvgE0
 jSPMB7RipVGrST09iRPMcjryK9P8yWuBXjNC8XR//AAXCOni8jAkUG8F4KK7WayXvX6U
 7kpovnB4nZ3oReb9PVXGVWWBqZR/NZjReaUPJCAYsnkVb/v9ZFcHg/5cCBK35iN5WRYn
 GKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698023478; x=1698628278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JE+nyMgkE7MsgTQwcTo9RjpvZHiunBt21/B2JI/Xoko=;
 b=eLRWBuJhoHyLUvz3fvvrbhzj3qbiFWw69ozkYC+vGUjcuQw+zk2DdlEgJr0o90oomI
 1k6VVCw5pa/4dIgIdAq3sFgiYAB0o+iPQpDm59WYnNq1JcDqllrDHLbp4F4C9bsVU3dX
 ee2K63ujFjzVZVkVsD0/Cx7PK7Kqx1OwFViGmJaB1ibdVIfsIw+yda0HbGl3D7OA1to9
 1Dw/2SLa01Njc/ozoOFQ/7ZoV9nobghLuEtwnIZEopeyePwYN8EjnDk43e5ae1UwPcd5
 gKFseQ2juO/+Se1HIonIxOpk3YCIALklF+hObIxrolRA4AU5BuxnTkttSQiOMmKshtqL
 MTdw==
X-Gm-Message-State: AOJu0YzQtcGh3cm0qyUIvkWt57y4mkpZSuiAPY77+6gslPhyvJajOVcZ
 IwzKCCugzUk6AAXRXnBwNc7J7oxXsPLFRfUFxLk=
X-Google-Smtp-Source: AGHT+IF6zaMNg2O7ZL3nBXdN/ZQ9G6ZT4bYeo1L1KI9t5N3+hzN3h2kqDi5bhzmrYnL8Tk/kB5VxzO3uQ5vuvpxmwNs=
X-Received: by 2002:a67:c012:0:b0:457:bc6c:937b with SMTP id
 v18-20020a67c012000000b00457bc6c937bmr4270388vsi.18.1698023478601; Sun, 22
 Oct 2023 18:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231020074501.283063-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231020074501.283063-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 11:10:51 +1000
Message-ID: <CAKmqyKNh-KzTwdm_yXnHy+G06y+APiWeeWsnGQn+QRgedbefdA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: change default cpu to 'max'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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

On Fri, Oct 20, 2023 at 5:46=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit f57d5f8004 deprecated the 'any' CPU type but failed to change the
> default CPU for linux-user. The result is that all linux-users
> invocations that doesn't specify a different CPU started to show a
> deprecation warning:
>
> $ ./build/qemu-riscv64  ./foo-novect.out
> qemu-riscv64: warning: The 'any' CPU is deprecated and will be removed in=
 the future.
>
> Change the default CPU for RISC-V linux-user from 'any' to 'max'.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Fixes: f57d5f8004 ("target/riscv: deprecate the 'any' CPU type")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/riscv/target_elf.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/linux-user/riscv/target_elf.h b/linux-user/riscv/target_elf.=
h
> index 9dd65652ee..dedd5956f3 100644
> --- a/linux-user/riscv/target_elf.h
> +++ b/linux-user/riscv/target_elf.h
> @@ -9,7 +9,6 @@
>  #define RISCV_TARGET_ELF_H
>  static inline const char *cpu_get_model(uint32_t eflags)
>  {
> -    /* TYPE_RISCV_CPU_ANY */
> -    return "any";
> +    return "max";
>  }
>  #endif
> --
> 2.41.0
>
>

