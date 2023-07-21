Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAB9EB64DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 10:10:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMn5m-000731-AB; Fri, 21 Jul 2023 06:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qMn5j-00071v-QP; Fri, 21 Jul 2023 06:10:31 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qMn5i-0003bN-9G; Fri, 21 Jul 2023 06:10:31 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51de9c2bc77so2376392a12.3; 
 Fri, 21 Jul 2023 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689934227; x=1690539027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+0gcFWf+1ZMM4dZce972j9mCs0TAwiZsLhapbzb9L0=;
 b=nPofp0jXkXen7Hn8nWkAeTlt6MPJkFicuKTMyjYDHzufIPgS1x40TIvdIbkPlBQDVZ
 5oelp+3cE+l96LP7hh6QuEM8qIAEHHjWieNgipsxKUn+5ogyqaQHF7Inls/XPOAGFgC5
 eff9X8Om+ERcu5S5mKyu1T1pbxx5s+A0rqBh35eoFSft8by6N3QWpGyrRTynyN1vi57V
 +UmO9fOPByv6SsbNdjKQiHvJsmhf0VKgzVYz3Y1ADjWogNeMU7F4lAQUxbWE9xfGbA6S
 VNEcZi0CCG1MQrFE+Y8ae1EksvrhHYv+GJs1CpfvlFo/bBPVwGk6IAkizEWh19NZSNMM
 PlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689934227; x=1690539027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+0gcFWf+1ZMM4dZce972j9mCs0TAwiZsLhapbzb9L0=;
 b=PkgzDOF6jaOZE77VoYI5kv51mpmCzYk2de94zhlP8yzP/tHTzq/iFHVk4u8HLz7z/O
 6qYpYEeIeE3s7juS/va8xsFjWWu1lvhRD8k7VD1jxEnm128rL98rRBdbgML655qYXxAG
 IshKqw3kG9udfWuD2zwrO6fWuLFqYkeDSk65d8upYsuSBe5oh78DAI4XYjvDUwy+C5kI
 73gUUypHA4xuUoZNvKtP723bMst3Psw4sPq/wXtLR6LwoCl21ZXTO5Oy7xs3+ganTsm6
 AL0bb2FFRnSZD3O01+sbTyx1p3kbNekv8W4DI3F6lugR5Pg9XukaNxjgG+2YtHZVIggC
 499w==
X-Gm-Message-State: ABy/qLaYTPkYxYmIIVNNdzPw+5suNK7r27E6OmuBwA67OEBZKtyCJfOz
 3o8d3kNRcHtG8srQZab4eESA59FLj9DSZzpNFoE=
X-Google-Smtp-Source: APBJJlGyKSVi6uh/C6gEA7+hlw3P0JVYwgAMYplNjaW+DNhqykoe2hSQl+0ifiJg7azzXd9uFWe+s/hfGbEPWRMhCzM=
X-Received: by 2002:aa7:d50f:0:b0:51d:b246:72e4 with SMTP id
 y15-20020aa7d50f000000b0051db24672e4mr1288883edq.5.1689934226769; Fri, 21 Jul
 2023 03:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230721094720.902454-1-thuth@redhat.com>
 <20230721094720.902454-2-thuth@redhat.com>
In-Reply-To: <20230721094720.902454-2-thuth@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 Jul 2023 18:10:15 +0800
Message-ID: <CAEUhbmXL0CNpQtvkEX9AHOsHwx0cnQLT0+EbB2YCPNdgtPYhSQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/riscv_htif: Fix printing of console
 characters on big endian hosts
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Jul 21, 2023 at 5:48=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> The character that should be printed is stored in the 64 bit "payload"
> variable. The code currently tries to print it by taking the address
> of the variable and passing this pointer to qemu_chr_fe_write(). However,
> this only works on little endian hosts where the least significant bits
> are stored on the lowest address. To do this in a portable way, we have
> to store the value in an uint8_t variable instead.
>
> Fixes: 5033606780 ("RISC-V HTIF Console")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/char/riscv_htif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

