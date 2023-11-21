Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6ACC54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 03:32:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5HUa-0002xf-3n; Mon, 20 Nov 2023 22:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5HUY-0002xS-E4; Mon, 20 Nov 2023 22:32:02 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5HUW-0002t0-1r; Mon, 20 Nov 2023 22:32:02 -0500
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-45dae475aedso1492091137.2; 
 Mon, 20 Nov 2023 19:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700537519; x=1701142319; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=geppwkQoHnTI4izkMzTNUUwrl45IzsirD0sT57zXdB8=;
 b=fCPEeaGuwoNLRRUHmGFkuL8BeQYyxZyxeyj6c3cCCqibQNnwCX6czCAZvqZY5J+2nz
 1hUKBFFHGSkrA8YWgPFkmxz5gm9N1qFGPKeBU1t3i+8w+knR5wWwg+yE2ilNYvYIlPqn
 HHb0T059XEHNLFZoxpYOgpgedqWMnqysWiAA1/tYwHFveSJZW/5R4L+rhKbQCAGENEck
 +W/KE+ltJfdvr+7m755OvvGny381H/YDaoNwrU81VU+VhqaJRuMhZlLILV/qMPTo5TKJ
 fOIGZpA+JIIx8UXoLVmlr5JTCQ3O9wHV/jFi64s4D9U5cvuPUuio04PgDNggz4xFNONk
 M+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700537519; x=1701142319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=geppwkQoHnTI4izkMzTNUUwrl45IzsirD0sT57zXdB8=;
 b=a4OYMcR17IcOydhPyy0BdgO6UdllXvxwGB74XTDgpgtPaWJ4qiTv9aYujDGKdLSG7U
 H9z7X4znP5kjmh85Mf2208t+RgouDhfjKZN70ynsi/cKqDBJJ4+aztZIKSTc6wGDofDS
 MT2Q7d5pIEYHhZEI1mJqlhezT6e8pICTo6On+l0VHfJqfQXcXJBB8fkszRbYikVyQQJe
 kuVlQO/tUCT9pEfLqtZk8BUYK3+cOhSrYMVV8fTj2xKXGkv79a7DtumgC+bmk4jRnN8L
 DZ6IBThQcah7nwtX/9R2sHEoe6r5nq0rWj1ZdycIlIGSF6Whh9sZKq2mVPQa81LyUObm
 RjhQ==
X-Gm-Message-State: AOJu0YyKlkMVzZ4ybu/NYiY8TUNhiAC2mf242sWqgcp81jeMI4fCuSjj
 lu6CLc5Embkai5vU2tXOkmPk+p+RxtJZKwk8zW0=
X-Google-Smtp-Source: AGHT+IGiSlvEI223F7zHBRvbqJmI6/QPncdDPcZUX5HeGC83aR/CdpTbqlwhaY3PHntYXaFz0yRewV0SwmErkUskGKc=
X-Received: by 2002:a67:c095:0:b0:45d:9c41:ba93 with SMTP id
 x21-20020a67c095000000b0045d9c41ba93mr4596667vsi.28.1700537518759; Mon, 20
 Nov 2023 19:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20231110173716.24423-1-palmer@rivosinc.com>
In-Reply-To: <20231110173716.24423-1-palmer@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 13:31:32 +1000
Message-ID: <CAKmqyKNrVh=bJDGYACGbt6vc-vtpOCDtuF=YQLiOmLFDOPjGHw@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: Add Zicboz block size to hwprobe
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, armbru@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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

On Sat, Nov 11, 2023 at 3:52=E2=80=AFAM Palmer Dabbelt <palmer@rivosinc.com=
> wrote:
>
> Support for probing the Zicboz block size landed in Linux 6.6, which was
> released a few weeks ago.  This provides the user-configured block size
> when Zicboz is enabled.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/syscall.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 65ac3ac796..7caacf43d6 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8808,6 +8808,8 @@ static int do_getdents64(abi_long dirfd, abi_long a=
rg2, abi_long count)
>  #define     RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
>  #define     RISCV_HWPROBE_MISALIGNED_MASK        (7 << 0)
>
> +#define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE 6
> +
>  struct riscv_hwprobe {
>      abi_llong  key;
>      abi_ullong value;
> @@ -8860,6 +8862,10 @@ static void risc_hwprobe_fill_pairs(CPURISCVState =
*env,
>          case RISCV_HWPROBE_KEY_CPUPERF_0:
>              __put_user(RISCV_HWPROBE_MISALIGNED_FAST, &pair->value);
>              break;
> +        case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
> +            value =3D cfg->ext_zicboz ? cfg->cboz_blocksize : 0;
> +            __put_user(value, &pair->value);
> +            break;
>          default:
>              __put_user(-1, &pair->key);
>              break;
> --
> 2.42.1
>
>

