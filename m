Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F028C7EE24
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 03:41:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4vf3-0004sr-6g; Thu, 01 Jun 2023 23:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vf1-0004sC-Nm; Thu, 01 Jun 2023 23:41:07 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vf0-0007g9-6v; Thu, 01 Jun 2023 23:41:07 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7841f18f9f7so374379241.0; 
 Thu, 01 Jun 2023 20:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685677264; x=1688269264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSMgfEdjApGGUQRWCxyKiafg0+pTJCIgESMaKnofCN8=;
 b=FudU/HHun32Y1EHts39Yy3xid6qgIHh6GEltpyT0BUE7BvXtvaKk0S6RGElriIAJ1D
 zJTs52UDz4QSFBKt6imxsDRbeFrShG+jhCRanCHDYfAJjGfg+Nr4tXzgJo4DX28OqJsn
 RcizbQ4/L5iflYlLA4brMiXWSGfX6VXO+cS3F1RgjcHqwgVVabtNfiksyZQpToFund54
 0qajhfLxSfml+W6bq8OGTgdpY0Ew244RfghqPmqFqRwv1uJDQVOwt/2bYxQj7KDMORvp
 dGpnB79tMsn58AajoT5MX/tkOOWYLBb21b73k8gJ7NluWp6+aALi8BubId/H82L1iz+x
 JORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685677264; x=1688269264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSMgfEdjApGGUQRWCxyKiafg0+pTJCIgESMaKnofCN8=;
 b=jOgORj6oePjVupK6fAy1Vw3g/VDoWCKiyTyyYizd9EHHb5xGEzfiqpytjQurmXdwv7
 wRHba5WWjTsqBXRkCaZv9Hw+Zz8YzZ7YozrE8Y1M+1fZYQaoLVDT4BBnjMkzQ24d67nM
 5irwLc3H2GliWJRuYAlwJnTpcLFXd/Zgh+mJCrNqPh6MQUfwUB7Kb5naRVlsVxbO4NdP
 HwqzP4Wgr6PHuE6E2RG3I3Dzxs43pa2LrrjVannL5VOFVQ/2yaQDshDcQzUNN4EBVPMZ
 14bCT0cN0GXk5u/skGyosoSSl3Bh6AytrLyGpYK2l79rqiXWxZiCnzbHbpWyEEU1mrjv
 0wyg==
X-Gm-Message-State: AC+VfDzoFiFOXmnX/goYdjH/Y6T++5tkIsbVjx1tgqdGTtseyz10Uker
 JOB9Pdu0F/sQqEGq8cleP97deuqYk4dLznkW8UUXvPAbI6ImPg==
X-Google-Smtp-Source: ACHHUZ7fi+/61BxXMF1cxY7acWcUdvBEKYHi4TdB8s1qe7b6gdGzKIirsyWUBRXx4Ok5gaOE/uEPn8xidto/mkqj3OQ=
X-Received: by 2002:a1f:3f44:0:b0:457:fb6:589b with SMTP id
 m65-20020a1f3f44000000b004570fb6589bmr1473083vka.2.1685677263921; Thu, 01 Jun
 2023 20:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230410124451.15929-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230410124451.15929-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 13:40:37 +1000
Message-ID: <CAKmqyKNcmf=EaZ_kG1THoRV0turN09cUfKHXWUNCf6bKxNGsSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support for print to log vector extension registers
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
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

On Mon, Apr 10, 2023 at 10:46=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore=
.com> wrote:
>
> The patch added an ability to include VPU registers in the 'cpu' logging.
> ---
> v3:
>    - split of the patch into two parts: general and RISC-V specific
> ---
>
> Ivan Klokov (2):
>   util/log: Add vector registers to log
>   target/riscv: Add RVV registers to log

I'm going to go ahead and merge this

Applied to riscv-to-apply.next

Alistair

>
>  accel/tcg/cpu-exec.c  |  3 +++
>  include/hw/core/cpu.h |  2 ++
>  include/qemu/log.h    |  1 +
>  target/riscv/cpu.c    | 56 ++++++++++++++++++++++++++++++++++++++++++-
>  util/log.c            |  2 ++
>  5 files changed, 63 insertions(+), 1 deletion(-)
>
> --
> 2.34.1
>
>

