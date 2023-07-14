Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC06C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 02:33:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK8cF-0003nP-Fe; Thu, 13 Jul 2023 22:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK8cD-0003ky-OF; Thu, 13 Jul 2023 22:33:05 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK8cC-0002BG-09; Thu, 13 Jul 2023 22:33:05 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-78f36f37e36so477268241.3; 
 Thu, 13 Jul 2023 19:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689301982; x=1691893982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFslRxqE5q+d32X1ErDUK6z2j03eeKUv2sRniazhIVE=;
 b=D4m9Widjc0ZZ4qJehmxrJdP8qNLr/kdjvtqmEE1ByiF2Qqd9qvz2aqjcO2uSOOa0H2
 wOf2V6PyNfAubj0vDA4xrpAEuuE5Agl8SwqOfRx/9/rxHFLw1VAqD/FVhhqxY/Cezw/L
 9255qf3qCeVIDDfJTOpra3qRyqQ73CxF/PGpvwX1Ehsghwf7SYbdAoB8DMSKMSR0ghv1
 TJfJvMpxeDcplGgtgurwfoUP4pNzT1FIhAIEcdk/DTw09uWUsyzYwyjKnNivuhFbx8be
 TsJMI0rH1oXPi1JoedpezNOgsXTX7SS4ddOB6RQMgzEKzCVY9iK5/4KMzbuPWpU1w3fs
 8aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689301982; x=1691893982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFslRxqE5q+d32X1ErDUK6z2j03eeKUv2sRniazhIVE=;
 b=injvitaj1IZFIpo1L61J/79OLhm3pYuN2axWxRybd0mPTgKNyDn2PNVld4U6nqEu6Z
 Njk+HDROW9wFR8lrLMIPvOHMZhxls2y3LR2QE+T4rSdD1Td9yXoriR8He36CEytjeBa+
 0lscqtkilkkR/CX4QwHsZMs71x0gQsE4sEWm89jXuf2mVrGjCcc5hQgYwI4p03ORHPW6
 XK3RLjdMl3pQGPFrGInRxMxsWBSOde5r2Q55ZxFcIsCZjRNi1mNZk9kA47+vAA3dLWIy
 OGkdj70nx7iCU39OmKo84er4+3e3YY5s+L2d3i+g1TUIadshNyr9OAIZhyskRiEOV384
 fjtg==
X-Gm-Message-State: ABy/qLbePmb9s1rJ0S3NX2nAEoh9tKvzPPnAJQo800kkFzK4Kgifjuo1
 aMZxc9/uh2R0Ss/FEeoah47ytBtK8M7Wsl+wEXo=
X-Google-Smtp-Source: APBJJlHSe6wZAlSvuFDmRmcKNs5R72Nc1DL7Wgwq2y8SqFGyivYHc+K8YkzAzuxBPz/RlGcKpLZ8AeztmRXqG1O3b1A=
X-Received: by 2002:a1f:bf82:0:b0:46e:9f33:add1 with SMTP id
 p124-20020a1fbf82000000b0046e9f33add1mr1986479vkf.6.1689301982011; Thu, 13
 Jul 2023 19:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230712143728.383528-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230712143728.383528-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 12:32:35 +1000
Message-ID: <CAKmqyKPSa6J6RUfE5Di-+hHv5yd8wDe=wT4T1SaS9Q_6h-EQJw@mail.gmail.com>
Subject: Re: [PATCH] docs/system/target-riscv.rst: tidy CPU firmware section
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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

On Thu, Jul 13, 2023 at 12:38=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This is how the content of the "RISC-V CPU firmware" section is
> displayed after the html is generated:
>
> "When using the sifive_u or virt machine there are three different
> firmware boot options: 1. -bios default - This is the default behaviour
> if no -bios option is included. (...) 3. -bios <file> - Tells QEMU to
> load the specified file as the firmware."
>
> It's all in the same paragraph, in a numbered list, and no special
> formatting for the options.
>
> Tidy it a bit by adding line breaks between items and its description.
> Remove the numbered list. And apply formatting for the options cited in
> the middle of the text.
>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/target-riscv.rst | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index 89a866e4f4..ba195f1518 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -76,11 +76,19 @@ RISC-V CPU firmware
>
>  When using the ``sifive_u`` or ``virt`` machine there are three differen=
t
>  firmware boot options:
> -1. ``-bios default`` - This is the default behaviour if no -bios option
> -is included. This option will load the default OpenSBI firmware automati=
cally.
> -The firmware is included with the QEMU release and no user interaction i=
s
> -required. All a user needs to do is specify the kernel they want to boot
> -with the -kernel option
> -2. ``-bios none`` - QEMU will not automatically load any firmware. It is=
 up
> -to the user to load all the images they need.
> -3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmw=
are.
> +
> +* ``-bios default``
> +
> +This is the default behaviour if no ``-bios`` option is included. This o=
ption
> +will load the default OpenSBI firmware automatically. The firmware is in=
cluded
> +with the QEMU release and no user interaction is required. All a user ne=
eds to
> +do is specify the kernel they want to boot with the ``-kernel`` option
> +
> +* ``-bios none``
> +
> +QEMU will not automatically load any firmware. It is up to the user to l=
oad all
> +the images they need.
> +
> +* ``-bios <file>``
> +
> +Tells QEMU to load the specified file as the firmware.
> --
> 2.41.0
>
>

