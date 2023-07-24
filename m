Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC85C001B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 02:52:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNlgH-00037u-Ph; Sun, 23 Jul 2023 22:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNlgG-000379-Cg; Sun, 23 Jul 2023 22:52:16 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNlgF-0007Vk-07; Sun, 23 Jul 2023 22:52:16 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-47ec8c9d7a0so1403061e0c.3; 
 Sun, 23 Jul 2023 19:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690167133; x=1690771933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mi5nWi8c9m8gM9j0Qtuy+hO5W8uJOMfd8YNTz/pLHgI=;
 b=MBAYd/8krk7bz1fN2oju+QhuhGhemivHZ7oyWTdKd/MAID/A1Ug1roCAucmQ6CY3yH
 h0meLLBCsVY1FsT0z7DXxjflE9MRtnt3R3Z9Hr2jQ9WeqFs6OsSGFPEhSYxoxHbXsdzQ
 HrIVmAE9ioh0y8sKsZyhjwG9Mei1nURCI0HSVhqOfX/LVW8rLMR30crESUoafbspB5Sy
 GMJ9DvumE/TOyBBsWvpkqCeKFWF/zgwwmxGTR9RTdKR8mE7DpN3z4KunwOJormei+HRm
 CjsIHHbsUSXTstbjo+dV0BH05wIKfmlYOPL5EhYPeAw0GBUxLa+zxoeFKuN2CxFWoqJs
 cvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690167133; x=1690771933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mi5nWi8c9m8gM9j0Qtuy+hO5W8uJOMfd8YNTz/pLHgI=;
 b=CIQJCOax5mPyrSohVyu7VU4RrpcOEYKydpM7gSSbDVICkHSyuZPmcv1XndYavpHlOJ
 ffzcW+N+JkL84sYR0bPLBnHpK6/AywXmviTJ1qiArx0h+/kOlHQDiEGMJOkukRAQ8Dvz
 yyQJaJ5mM4XiiM92FInVgGI56pcEO7ZtpLwL9WMyrATbvSpqEx28iKxHadoAFkK6/87J
 QF4OvSI6tWNiX1ZOc8xcdvcuvazzdeQ//UDOX4MumOtoqkTsv2+vYrTOE8dR/2tg8PyN
 qihVqr5/Mpu9dp26OaeWdKlr5tvZYquTQBDqIHLaMmghS8uDgHuFTyQppOVbEVWeRgBW
 PgeQ==
X-Gm-Message-State: ABy/qLayX4wX7NZ7TbMNQblWejRSaFoaueQocVpjdu2mWWyLlrZq3BtF
 1fcwQVtxnrcilSpa1PuCfPMV+VEeChq2mQTNeVc=
X-Google-Smtp-Source: APBJJlFdKJv6yDMxkIfcVkEbWOKne+yXSJRZUEj3C7RL0aQVdAXdQy9EVVWmzBwTwRdtOOAwIgL9+k5gyBmzRcXbE1c=
X-Received: by 2002:a1f:458a:0:b0:481:338c:cb27 with SMTP id
 s132-20020a1f458a000000b00481338ccb27mr2970165vka.15.1690167133464; Sun, 23
 Jul 2023 19:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230720132424.371132-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230720132424.371132-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 12:51:47 +1000
Message-ID: <CAKmqyKPzwDrtSH5_V4n=QR+CCPz6L1YqcSL+Y83fP7Fy70h-kQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/riscv: add missing riscv,isa strings
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Thu, Jul 20, 2023 at 11:25=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> Found these 2 instances while working in more 8.2 material.
>
> I believe both are safe for freeze but I won't lose my sleep if we
> decide to postpone it.

I wasn't going to squeeze them into the freeze

>
> Daniel Henrique Barboza (2):
>   target/riscv/cpu.c: add zmmul isa string
>   target/riscv/cpu.c: add smepmp isa string

Do you mind rebasing :)
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> --
> 2.41.0
>
>

