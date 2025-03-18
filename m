Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E83C282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 16:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tua1i-00026g-FW; Tue, 18 Mar 2025 12:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tua1d-00025s-UQ
 for qemu-riscv@nongnu.org; Tue, 18 Mar 2025 12:42:45 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tua1P-0007tg-5y
 for qemu-riscv@nongnu.org; Tue, 18 Mar 2025 12:42:45 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e64405b3b9aso1211200276.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Mar 2025 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742316150; x=1742920950; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S+u1fpDV2HCsOzvClPbiSBrO0B9TKgb3d0wC6KYgsHI=;
 b=grG88Y9l3JfgFFUcpztqnQl5Ccb7UYqKreNvj4ZorBGEB9rg6Pp4vLf4OhZdW+tMMU
 9u7XM05cH0DRDU7YsJCLIkYXwT2iEnAbmF7blvgAsxz+MkyDYugoVsnOXhuBjjW25Q+k
 +GBv1WzbS/rNTmQym7bSw3HtV9n1gaFWyamHvTuZdXDQzRdpDNf2qX2XO6yplsHrwTWQ
 glNdNzdnHw+Bbxm+zMtfA3ra7eb5U8u8//AED36H+QzI9iJXDbKHNv7sKZM+arYSMk38
 cFBXli2kSNuG3wXpZre4urEYDW2S+8Fnh1jv6vfRLN9Cl/8KZ4wiSNC1T9DtGWsTlKsE
 ZIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742316150; x=1742920950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S+u1fpDV2HCsOzvClPbiSBrO0B9TKgb3d0wC6KYgsHI=;
 b=d+zYKwt4EiszPjl8FxQMjNBOJSFqRBJ9LkhZEJ1oIl2dhgnNfMT/Gu+y0K3qZqGa2r
 ByqWjXCMDxaLWRJ5+HblsoP44svk+6meFUNZdF627aVmFq+1r21GQePOTced1JZ8XuKz
 8BTvuL+XqQZ3HxqZfZaGJecE9B9R6yIv42MmbCpWB1iWnsA+Vw/0CVPkjQ0/QqL1LxLc
 fC1DikuK1Vxg6UsseEg6zhsMz3I0qFFgpKIRaXs9OWSYirPPD4bQ1u5a8co7+Q5C8dHM
 Z4gSMbrYIgoouyvNxc6W/Y9sJQ6jl37NnImW00bGYRHJ/0EPP+pjkrGYGaRZVpR/LANu
 wJBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3sauwaRszKo1Zujf2dcvAjYU2FsnIcvp9zwMRIn5dCHhnir2f0j8NjyAMfojca63Pc0R2KWnDBXxS@nongnu.org
X-Gm-Message-State: AOJu0YwhT1WgdNo8jimdbARfvJnGAnmJEWgvYv9CFRrnkdTqONFKbhyv
 JEgyal9/WzaxWN9VmD5q1hBd7QSzwuNwdc8jG6OsVrN8atUwvbxnXBqs5w9VcPBpn85/Sf1HyUT
 kXDtfAQTcVQGcddYTZncSt7cu6/tnSE3HSQGfZQ==
X-Gm-Gg: ASbGncvtlmfwVPbEl+3k8iZEVqS66/9UJVmANvboXO1h2gOJMITd6E6M2AzgWi3cG1e
 0XgLgIRzNHgEFrrV4XhTkmzarj9Uq4TbxRJTDKp8lLJLXkatScq44QohE/3JtvvmWw2edqWM1Mf
 CLmRWbTdiVZYsVYVdSI1AuDuRTuxU=
X-Google-Smtp-Source: AGHT+IHQZuUB7IrHcPiqkDUGxyEcQ9ZbmTmaaf+dHK62z/Y77V27zvq9OmEqfihu//b6N+m44CWVWn+H5eICHl5njDM=
X-Received: by 2002:a05:6902:1890:b0:e5b:3ad3:4010 with SMTP id
 3f1490d57ef6-e64c0e1accfmr6588944276.31.1742316149742; Tue, 18 Mar 2025
 09:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250307124602.1905754-1-dbarboza@ventanamicro.com>
In-Reply-To: <20250307124602.1905754-1-dbarboza@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 16:42:18 +0000
X-Gm-Features: AQ5f1Jrza_7dRzLh17j1N3Ui7uyjHS06_ZSu-pcc89B7uvkRBwiNIAeA5y4WGBA
Message-ID: <CAFEAcA_P3XbJ-H9O=K-U7HtBAU9c=0TngEfV8fpQxcH0JRuGVA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/csr.c: fix OVERFLOW_BEFORE_WIDEN in
 rmw_sctrdepth()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 7 Mar 2025 at 12:46, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Coverity found the following issue:
>
>   >>>     CID 1593156:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
>   >>>     Potentially overflowing expression "0x10 << depth" with type
>   "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then
>   used in a context that expects an expression of type "uint64_t" (64
>   bits, unsigned).
>   4299             depth = 16 << depth;
>
> Fix it by forcing the expression to be 64 bits wide by using '16ULL'.
>
> Resolves: Coverity CID 1593156
> Fixes: c48bd18eae ("target/riscv: Add support for Control Transfer Records extension CSRs.")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0ebcca4597..e832ff3ca9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -4296,7 +4296,7 @@ static RISCVException rmw_sctrdepth(CPURISCVState *env, int csrno,
>          }
>
>          /* Update sctrstatus.WRPTR with a legal value */
> -        depth = 16 << depth;
> +        depth = 16ULL << depth;
>          env->sctrstatus =
>              env->sctrstatus & (~SCTRSTATUS_WRPTR_MASK | (depth - 1));
>      }

This is a clear false-positive from Coverity, by the way: we just
checked and enforced that depth is at most SCTRDEPTH_MAX, i.e. 4,
and 16 << 4 cannot possibly overflow anything.

-- PMM

