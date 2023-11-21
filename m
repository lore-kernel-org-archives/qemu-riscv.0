Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB46C54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 03:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5HXr-0005nw-GG; Mon, 20 Nov 2023 22:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5HXo-0005l9-EX; Mon, 20 Nov 2023 22:35:24 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5HXm-00042y-9g; Mon, 20 Nov 2023 22:35:23 -0500
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-45d94e7759eso1431038137.1; 
 Mon, 20 Nov 2023 19:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700537721; x=1701142521; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tx5rgrV8645zuuiw8Wh72SstWgYYf+pJT/1OW8429l8=;
 b=h5vWBKAEJQX3FS5H0HfNLVrrxnXIaGlWYVrL2qbrZZ28Bbh+9LaNnImtHcTM4//ApM
 1St46UrUNTZFXgey3bejQAx9LblXOXK15zBPgFPtt1vF+AIy9Ad1Si044ofRsfkRY/2j
 scO1hVgQvY2g/kqbRmtp9NgAxftVPuXzaEIjQU7ZmdHVErx5jUyUZAD51aYcfQAn5vyv
 5oFZQhbGfAYUe1qh8OclS7MC3nBhozhba/WJYwQdKVoYcaq87tVPe+EuSjTj5MCIMAvs
 D/lonJHI6XJnKXFHzfxNd8o/F0690GosM3wK6E+5XX5z40qUd+v0wdC9aPREDOKj5RE+
 O5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700537721; x=1701142521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tx5rgrV8645zuuiw8Wh72SstWgYYf+pJT/1OW8429l8=;
 b=Nbz90cc07peGRMdb7eidDqOtPoqn+rzWU7QNNOb7ORnFCmkNxTh9SJk7Qp7z/YIHYi
 eax9ZQkBCeoZ9qsrppdEPhH9Arwa+plFVf534tWLl6cZH7uzE4VtDl3U5Z206M7QoZvu
 wMgT9sGSs791cM1mcUb2MeT8DgBwUZ01dYM5BZ9g2yMQYs9C1iVo+/Fo3whvmWniJ0mW
 Ncvudz7rQZx0Bwr5RIgDgCj62R9AWQQ+6hAWpgxxSK0WyW9stdA8V4+gncaeDL/O0foB
 0Py1V6Jn62KlI/iUzAWGtIdC5U6aRFBAS+n5J77CV0NXj5VW46DkuQ9fVJqH1evfmExz
 Xt/A==
X-Gm-Message-State: AOJu0Yythry4SUCkmHF9xY9RScsrUb/OxaltUxghAcL8PP9bGCrYP1tj
 eXwL1UjiOEi4KLc6tyhJtLQ2Zm6HB+IrUmBfwyw=
X-Google-Smtp-Source: AGHT+IGQViPxam/6rx92c9uwZI0zaytdmcedBPOSjpGm95ZuA8W6if+LEM8nsCoAyJ/hq8EDxOHE3x+F20CyF+iZGTc=
X-Received: by 2002:a67:f490:0:b0:45d:9d0c:2e07 with SMTP id
 o16-20020a67f490000000b0045d9d0c2e07mr8481658vsn.6.1700537720788; Mon, 20 Nov
 2023 19:35:20 -0800 (PST)
MIME-Version: 1.0
References: <20231110173716.24423-1-palmer@rivosinc.com>
In-Reply-To: <20231110173716.24423-1-palmer@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 13:34:54 +1000
Message-ID: <CAKmqyKPkUBWNkerhKTGz65fqgjrPtPUUvOrqvzkUHtBVkbwXAA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: Add Zicboz block size to hwprobe
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, armbru@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

Thanks!

Applied to riscv-to-apply.next

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

