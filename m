Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB93CD3437
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 04:20:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiSD9-0001Ey-GB; Tue, 19 Sep 2023 00:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiSD8-0001Ef-JG; Tue, 19 Sep 2023 00:19:42 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiSD7-0008AF-3L; Tue, 19 Sep 2023 00:19:42 -0400
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-45271a44cc4so676747137.2; 
 Mon, 18 Sep 2023 21:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695097179; x=1695701979; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0HLQfUwNLgOdIY8dJ0tSs+pkC6U8FMWL4ExhcNv25DQ=;
 b=jm0OaHZbiVMEV6n8gcPWxzlDcKM6nKnHDoOsUOR29QI5h75osNU387cj81hKAH4lJI
 Uljz4+BaWlOq+TBJfPxIVBGH080ExMdYE5Jca7sZCgFuYYbf2HhiqzGsNhd78mztbBUA
 6ijQpmcbyOZ0yoNqxu0/038s+aQv8ZBn48SyFsTvTGP8JU4DVU8TZbYY22lDEtOjgNKZ
 /5Sd6EBZf1BZfMx54WTBoT+GakcJ5xMyWqprQ4G4nuhj5Uu+SBKKWQXHkAHyrpw4fvyK
 MKZ76sPHnVmAXqwr1CZ8cUp+2Xs7RAoiNbxdRu4+jkiRxBowa7SEvJFxDy8IBYi2mkoO
 iDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695097179; x=1695701979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0HLQfUwNLgOdIY8dJ0tSs+pkC6U8FMWL4ExhcNv25DQ=;
 b=mkm4TvxA93sYxJD0Oj4yHESGX8g7C9oKJWRJZNX44//etUPqEbGMjuN4GFssYcCR7b
 dFxR3is4+2Wt6YzdAxwktGQDuZxb4C+wZJkTJ5CNwJtjRi8DvYGUyJB/lAvTPVpf8sPy
 4Npjl+0JAzNSGLJLWViDCASE18h67cbHZSR3V27x0sIkk+74U3ABdwRlg06oJmxBuSX8
 xqO/eiH/l5hClLtlBKZkp/iReb37HcAXhTdls5jLEI7/gurT7mEZnxNZaJ967PnMCT7C
 FQTxj4AhqaJb7bR/B+wg7zhhJGXpq5fA/sg7C2mmljCKR6QvbIo6X/fRcCshe+zS0qQf
 MvqA==
X-Gm-Message-State: AOJu0YyJHTYrgcLCC8oLaP90nOHN3rEpU8LMHM1sLg/DQjdDQvsvqKcH
 BSNziX4kuBcP4dmnnzv2vNlxcw9bK2Ah8+wMq08=
X-Google-Smtp-Source: AGHT+IGzGtbjeYd5i5ZBdEK4/vg+YPAQDwK+loTwqRi6xpWtqj1nsBYwekKn2QzRh2k5BCh2rZB3h0f+y/9UeIfpbfE=
X-Received: by 2002:a67:e983:0:b0:44d:5f69:3a9b with SMTP id
 b3-20020a67e983000000b0044d5f693a9bmr8492541vso.8.1695097179612; Mon, 18 Sep
 2023 21:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230907084500.328-1-alvinga@andestech.com>
In-Reply-To: <20230907084500.328-1-alvinga@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Sep 2023 14:19:12 +1000
Message-ID: <CAKmqyKNpeA97zgJWy1fMtetj-HjX=B0MzOcr0eAUQ0mBxfZHzA@mail.gmail.com>
Subject: Re: [PATCH] disas/riscv: Fix the typo of inverted order of pmpaddr13
 and pmpaddr14
To: Alvin Chang <vivahavey@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 Alvin Chang <alvinga@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Thu, Sep 7, 2023 at 6:47=E2=80=AFPM Alvin Chang <vivahavey@gmail.com> wr=
ote:
>
> Fix the inverted order of pmpaddr13 and pmpaddr14 in csr_name().
>
> Signed-off-by: Alvin Chang <alvinga@andestech.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 3873a69157..8e89e1d115 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2116,8 +2116,8 @@ static const char *csr_name(int csrno)
>      case 0x03ba: return "pmpaddr10";
>      case 0x03bb: return "pmpaddr11";
>      case 0x03bc: return "pmpaddr12";
> -    case 0x03bd: return "pmpaddr14";
> -    case 0x03be: return "pmpaddr13";
> +    case 0x03bd: return "pmpaddr13";
> +    case 0x03be: return "pmpaddr14";
>      case 0x03bf: return "pmpaddr15";
>      case 0x0780: return "mtohost";
>      case 0x0781: return "mfromhost";
> --
> 2.34.1
>
>

