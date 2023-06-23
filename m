Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BB1EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 02:23:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCWS2-0002wI-8o; Thu, 22 Jun 2023 22:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qCWS0-0002vz-P9; Thu, 22 Jun 2023 22:23:04 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qCWRz-0000uL-7K; Thu, 22 Jun 2023 22:23:04 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-471b1ba1a7dso70416e0c.2; 
 Thu, 22 Jun 2023 19:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687486981; x=1690078981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5a7LP+fu/x2uylWneeW+EV7CVps5diESBLSeZ4RYZKk=;
 b=AXMmOCDlK9qiL/tXTz7RkcyI9Lgvgcr1p/KwCRyrenj6X5uaNqKIlje81HDG9qqDya
 QhZXJUyRYzzTFjC/If9BciHX91HpIiNFYg8pUaTAYwJb0R3ZTRTEb4G7K+UcdMOF8CLm
 GOC3m2zJnjO1iFu6fff+u4otwJgU5m3pK3mLZckLJrrhCreCOjDTfBGGRPYazfMenqVl
 Ml4aOcgsqDg5eo67GqyxEE+tampKsObZVGWhHmknyPNOF24hr5z/Axq5Od+pUo9qjP1e
 +/fQPzfWB83NsQqYtoXRTg8e1s07BP2wew2mtvPjGb75yg92EE8627yQKEvEoWgjM156
 mQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687486981; x=1690078981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5a7LP+fu/x2uylWneeW+EV7CVps5diESBLSeZ4RYZKk=;
 b=UBEipygq33aNZhoDBN9QpA1MY/7KrcGuvr+yx73BqBGbECV9UH7003BpxY0Ia82xP0
 sxYnSv5qH+Y0M9Fw+SnzsXVaRUjYJNafbBAeTmDog5MArI3z4lvx+B8T4yf/+ONEW34k
 6HKZRlN+2sb6aWEK5Is85vixOfNpvz4Mi5XaKxO9bGfI0aAIxWo9uKS2OWEpRirHtv+o
 im4oS9qSopbbvnS1GlAixQ6H+jwu8WPrDokz6msLvkL9VgcFsCoQQtxPl1yrEJ4c5zNn
 0q4WwPWYWXFE6pdAVTCOxQCUEUA/6ePSLcw9jDL2ZS0Rq9LvSaTyyf1IoQH1AQhhmz9K
 ovNA==
X-Gm-Message-State: AC+VfDz9PVImv/lx7hIelahP/HcRkoUvbtj5RwmfjFWk6y6EbLy4+LwR
 X9HYbzHQ0pQsvs+ednvYMhGC/qOTJKX9xbtNjEw=
X-Google-Smtp-Source: ACHHUZ6EfQ0VvREPwW6vQN+1p6SgOM9nbqunuSz698HYrvu2l/7jQpG4SAY+KQRosZqhe23w8p+n25whTlPEQ+B1p+4=
X-Received: by 2002:a67:cd05:0:b0:440:9eb0:6f17 with SMTP id
 u5-20020a67cd05000000b004409eb06f17mr9139057vsl.0.1687486981564; Thu, 22 Jun
 2023 19:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230614032547.35895-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230614032547.35895-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Jun 2023 12:22:35 +1000
Message-ID: <CAKmqyKMUFVGTAw4BDvjhsdfuh0-t+0hJ_xmgFZ6KD3n9YKG+xg@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/riscv: Fix the xlen for data address when
 MPRV=1
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Wed, Jun 14, 2023 at 1:27=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Currently, we use the current env->xl as the xlen for address. However, t=
he xlen for data address should be changed to the xlen related to MPP when =
MPRV=3D1.
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-addr-xl-upstream
>
> Weiwei Li (2):
>   target/riscv: Add additional xlen for address when MPRV=3D1
>   target/riscv: update cur_pmbase/pmmask based on mode affected by MPRV

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h        | 49 +++++++++++++++++++++++++++++++++------
>  target/riscv/cpu_helper.c |  8 +++++--
>  target/riscv/csr.c        | 27 +++++++++++++++------
>  target/riscv/translate.c  | 13 ++++++++++-
>  4 files changed, 80 insertions(+), 17 deletions(-)
>
> --
> 2.25.1
>
>

