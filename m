Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEB7CA0FE2
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 02:28:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbtrx-0002bz-Ql; Thu, 31 Aug 2023 22:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbtrw-0002PR-51; Thu, 31 Aug 2023 22:26:44 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbtrt-00025A-0Y; Thu, 31 Aug 2023 22:26:43 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-48d0db157efso538332e0c.1; 
 Thu, 31 Aug 2023 19:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693535199; x=1694139999; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wA9BSQCL/MKywW8HyJ85tXlot+E3RAwdISDjgBwLBAE=;
 b=Sa+FSNn29LX/Det4UNIXPd7QxxFtMcLpJLeDIwMSp+KGlrBYUrs1SH4+3ADS653pzo
 r5qhH7IUGHtnUV92fGvDR3xMgVkOUyu/9Sd8M5ziMSo3WZdMe2Bf0Sg+/RVBp8nAoTqu
 IEl14Wst72rmMnMHp2FNeI3LrbLrXIYhGFIhePB7pfoiWE1qISAew8MfLdJdb4kj6jLr
 yqt9C8ttujws+qjyaVog70dlGuonx9Bvpj6LwLyhXyA3QCaM7+V+UXnlP09v8tthUsCS
 XGLkGsk9UEJ4sDFW6cCMJMRuFTVChT4mJJ0ZcwdPiHBbVTMPKR8CcYZRMyFfcKyeMXh9
 KHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693535199; x=1694139999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wA9BSQCL/MKywW8HyJ85tXlot+E3RAwdISDjgBwLBAE=;
 b=LDUmiKAZ0Mh6he9YCLMC9z6sESWkGhgEuGJfn0cIQtFvGKL8KgAH/nAV6HuO0GRksq
 8pVW+IeQwe0S6QNQLgjGTMueRxZXscrcpJSiB48fLBJd76uEu7lTc00J8fHAHEUqc7J/
 Ou3McF542rqqdyRMELV3mjLeoDdydZHck2oN3/peHnkTHxPvZrGbQczgxJzRpjnwxIbW
 DTYbBF88IkZWbULI5odRFQEmvwQjkJSaWg+/KZp9xLdWL3P0om7cE2LtB19l7RKnI5qy
 nF4Zwm8qg+8VqG4suY1Rm2jCtGLpdYwrlFMLG2aOKKR0M8ZAwF2VMvoUNOiOaRbxwZkG
 yBKg==
X-Gm-Message-State: AOJu0YytMzD1jTobGfBEot5Rhtv/4zJQk4IG7XK2fKVJgYqChlhuxoox
 OwG1GJeumqHxUj9dpxGgPDjnSGqbwTlWLLhp1D0=
X-Google-Smtp-Source: AGHT+IG0jvDkmwxI1DCo9yJ01UJ02F789x+PNtHODgbbjYABxm+OPTEMiStydtpIK7Fu3Dp+EwalZh/MBTcm+ArGokA=
X-Received: by 2002:a1f:cb82:0:b0:48f:e2eb:6dd9 with SMTP id
 b124-20020a1fcb82000000b0048fe2eb6dd9mr1458336vkg.8.1693535199613; Thu, 31
 Aug 2023 19:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230830133503.711138-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230830133503.711138-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Sep 2023 12:26:12 +1000
Message-ID: <CAKmqyKNQk-_s8LF2tvgvibM8KTersTQiYSr80fwg3+OmaWz7nw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] riscv: fix --enable-debug in riscv-to-apply.next
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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

On Wed, Aug 30, 2023 at 11:36=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This is the second version of the --enable-debug build fix for the
> riscv-to-apply.next branch:
>
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>
> This implements suggestions from Richard Henderson made in v1. Most
> notable difference is that riscv_kvm_aplic_request() was moved to
> kvm.c and it's now being declared in kvm_riscv.h.

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Changes from v1:
> - changed patch order
> - patch 1 (former 2):
>   - use kvm_enabled() to crop the whole block
> - patch 2 (former 1):
>   - move riscv_kvm_aplic_request() to kvm_riscv.h
>   - use kvm_enabled() to crop the whole block
> - v1 link: https://lore.kernel.org/qemu-riscv/20230829122144.464489-1-dba=
rboza@ventanamicro.com/
>
>
> Daniel Henrique Barboza (2):
>   hw/riscv/virt.c: fix non-KVM --enable-debug build
>   hw/intc/riscv_aplic.c fix non-KVM --enable-debug build
>
>  hw/intc/riscv_aplic.c    | 8 ++------
>  hw/riscv/virt.c          | 6 +++---
>  target/riscv/kvm.c       | 5 +++++
>  target/riscv/kvm_riscv.h | 1 +
>  4 files changed, 11 insertions(+), 9 deletions(-)
>
> --
> 2.41.0
>
>

