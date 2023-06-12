Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD6C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:25:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YAn-0005zB-Br; Sun, 11 Jun 2023 23:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YAj-0005yk-85; Sun, 11 Jun 2023 23:24:50 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YAg-0005F8-UH; Sun, 11 Jun 2023 23:24:48 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-78a065548e3so1662334241.0; 
 Sun, 11 Jun 2023 20:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686540285; x=1689132285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pI4pDIn+7VnJQeYjEfpd6yo6MpumJ4D+h31jp37/di8=;
 b=OoYKvkV3GlDyeWhJbwxmouYr/d5I6X4Pp4Z7PnY4HbVSqVtqZ7Fw5uAin+PEs3sEsO
 0xzClYXZ+AVvmu+QVe9s9vqunaOtM9xKvotDw55re37asC3GgJnFjmPEZtwp1qoqzwUQ
 KMQmlSJRn1ipi4oIEiFn9bHiySgS20gBCtzuLe6ly5xsy0pCwDGyH8ZNeVvFWThPLjs9
 ML9TwJjglcYFuQh0hDTPNu10xGuHCkiaYj6F1AZ7dogn7uup7et6xaT7BKH4I2SZWIw5
 IFbRlOb1j6F+eRZ2PkohKtbvhNlUYJ45Yh+cQL7fg/qQVo7h9K4jI9MJrpjA5CilfXUm
 sc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686540285; x=1689132285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pI4pDIn+7VnJQeYjEfpd6yo6MpumJ4D+h31jp37/di8=;
 b=hhFNDpSyFYMvpPIdm9nUgqCj4l9xxWeS32p5d57C8BZxuKBabD1KJQYzAUIE749GlA
 vmCEocJFsSUShcOgU38aivL1wuKG6g+LZEovCXGsCouTd4z9cvX1il/HX0qvUGzI3INR
 KvbVK0Kc6S+zZGl6CdZ6E1KUro16VJqVvh1NXMnaw+QyxuiV9gKtHRSpr1KgIcapUedI
 aghKvLZYGJdV6XuKbvl2ZrJkGQ31bbYopAtUBo/VXVNJY0CbcUEGmtzQ4MXPcWSpVOu2
 rCgIGoEGbEMaC1DGqcAg7a0vNyJsSpb5fmpqZXVCqREatCS7trd/ehI5h5xQiXPYl4Lv
 MUsQ==
X-Gm-Message-State: AC+VfDzDUWAzJtfMN4K+VkbVp+ulYE/sifBsoRZBfHrmMc7skP942jWL
 zkXyZrfDu6LMkAyqPpYe+5q+x3YLqdGHkHwTulw=
X-Google-Smtp-Source: ACHHUZ6OpWBQyaXX3xH/RFMQ/hgx2m9pxnAzsFu5SRg7HdZKJ25tUsKD2HD+YNYC15DMTxPMWVI3Ic4fkRNLnT+J+LI=
X-Received: by 2002:a05:6102:e4b:b0:43b:431d:8d51 with SMTP id
 p11-20020a0561020e4b00b0043b431d8d51mr3836668vst.8.1686540285576; Sun, 11 Jun
 2023 20:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-5-christoph.muellner@vrull.eu>
In-Reply-To: <20230530131843.1186637-5-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:24:19 +1000
Message-ID: <CAKmqyKMtg2q7FB5qmbn5xGOrbXzqHBLeNs8BbTo=MZqML-oZUQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] disas/riscv: Make rv_op_illegal a shared enum value
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Tue, May 30, 2023 at 11:22=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> The enum value 'rv_op_illegal' does not represent an
> instruction, but is a catch-all value in case we have
> no match in the decoder. Let's make the value a shared
> one, so that other compile units can reuse it.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 2 +-
>  disas/riscv.h | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index a062fb48cc..4cf477bc02 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -22,7 +22,7 @@
>  #include "disas/riscv.h"
>
>  typedef enum {
> -    rv_op_illegal =3D 0,
> +    /* 0 is reserved for rv_op_illegal. */
>      rv_op_lui =3D 1,
>      rv_op_auipc =3D 2,
>      rv_op_jal =3D 3,
> diff --git a/disas/riscv.h b/disas/riscv.h
> index 0f34b71518..de2623e3cc 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -189,6 +189,10 @@ typedef struct {
>      const rvc_constraint *constraints;
>  } rv_comp_data;
>
> +enum {
> +    rv_op_illegal =3D 0
> +};
> +
>  enum {
>      rvcd_imm_nz =3D 0x1
>  };
> --
> 2.40.1
>
>

