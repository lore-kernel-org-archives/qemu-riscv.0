Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92054C61DF4
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 03:05:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r601c-0005Yn-Al; Wed, 22 Nov 2023 22:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r601a-0005YU-HP; Wed, 22 Nov 2023 22:05:06 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r601Z-0002F9-1m; Wed, 22 Nov 2023 22:05:06 -0500
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7c449d30fa3so134683241.0; 
 Wed, 22 Nov 2023 19:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700708702; x=1701313502; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9aZX8EQpoeqwHDXXySSmozRCFJH1BkixVH4mW9OpYA=;
 b=EgHHGPTCht7lodwVlUH2pNTcKiMxQfGtqUhMH/yKHxGmxaAQt+c+uVWy13xnEFaL9D
 yndkrtKbdCzKwrqrs7yMK4OpoPNWRTqTHBFoADzlYfz5s3Nr0kggjXU2/W8YppEjcH1o
 8TcCyhELiH/1oxtFrJYCAoZh3lHLIi3Za8vnFUBOo9NfUoMTiQR17tyo/hLCk377LSaf
 Al3xFeJv7hCNiaH7I7KXaGms9v49dcyXYU2EaBiUxz1kWl2Y0DFvKEWCmdAJvfKR1IbM
 dhbZW5fR9mUkRZM81ECRcnUJd08grPg+YHDFsYtEdM6Pkp3YiVhYUGRBgOxfSZkzaAJb
 kc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700708702; x=1701313502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t9aZX8EQpoeqwHDXXySSmozRCFJH1BkixVH4mW9OpYA=;
 b=V9gIVvYO/sWWJSwvPXETtSmlGIF/wkkNe0EZMz3J6JUBEHFcO/p25wVDZFPKNkF401
 DlHbdxypemSEx8vHfQXZvYlTHriBsdjRawHO60NmAd1pCLYdiTRf1EbSJwgWK1Sll/qa
 05swYH9v+rbq3ckwcs1IjjKx61h9WSxYycBA2HiKXD3h7Eb8gGR8MYiGrZIsaOi6NEfc
 ap41G89RStq1hZC6uM293FS+m/If6e95hleBxxCadMeSXKkrwqeUi2rRlEgQvrcEX5Q9
 f3RH7nqvNVnYd8P2cTZygFc56t3+Sgd8+Fh4ZFvIDWLi+grMMvs7bPAf9b5K7TWDREC1
 hruA==
X-Gm-Message-State: AOJu0YxCO/7fGM/nPabI343oyAMcaqWZdzMIjL0ScsUg+wipBP9CAQHE
 P6GWc91PCKtaOAzJKI3QkmemiCYhn9n9Tzy/chs=
X-Google-Smtp-Source: AGHT+IFOcXgyBX64gsLi6UavSl32VHbWHzx6Bkr9yhW68mVLd6gCSag2yUkfX/J0uydR4OdqBy4wv/E6WV0GsaBjNw4=
X-Received: by 2002:a05:6102:4702:b0:462:8f85:783a with SMTP id
 ei2-20020a056102470200b004628f85783amr4249277vsb.22.1700708702084; Wed, 22
 Nov 2023 19:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20231030054834.39145-1-akihiko.odaki@daynix.com>
 <20231030054834.39145-2-akihiko.odaki@daynix.com>
In-Reply-To: <20231030054834.39145-2-akihiko.odaki@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Nov 2023 13:04:35 +1000
Message-ID: <CAKmqyKMo41GMJ0vVN2_CsfOVrfsz8H9AtxTe6-JbtX+Pi6B3DA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] hw/riscv: Use misa_mxl instead of misa_mxl_max
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov <a.anenkov@yadro.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Mon, Oct 30, 2023 at 3:50=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> The effective MXL value matters when booting.

This doesn't sound right. Surely the max is what matters here

Also, this was specifically changed to misa_mxl_max in db23e5d981a
"target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl".

This needs a much better description of why this change should be made

Alistair

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/riscv/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 52bf8e67de..dad3f6e7b1 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -36,7 +36,7 @@
>
>  bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    return harts->harts[0].env.misa_mxl_max =3D=3D MXL_RV32;
> +    return harts->harts[0].env.misa_mxl =3D=3D MXL_RV32;
>  }
>
>  /*
> --
> 2.42.0
>
>

