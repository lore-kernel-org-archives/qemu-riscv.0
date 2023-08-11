Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D21C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 18:13:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUWcl-00079i-FZ; Fri, 11 Aug 2023 14:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUWcj-00079J-KJ; Fri, 11 Aug 2023 14:12:33 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUWci-0001eM-2N; Fri, 11 Aug 2023 14:12:33 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-447d6748aacso941204137.1; 
 Fri, 11 Aug 2023 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691777550; x=1692382350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sn5DveFPgg8aYXKdB4BSOUyJOlGO1m1Sp8InAri/0zg=;
 b=rcjW2X7Z7x0oot/PP+two0i7AVnohrpdXevEwbIH6rXEdHAFQSbv+AIJXUJUUVRN+K
 o1lRDwsMqmaUpEbERgGy+b3RYryvDDYUdvJf4nKcngc/oR7AJNbZ6S0iNOtUsYJC555l
 w4Pdicf/Mup31t96vXVCm6aTHm4IN08urR7ztvd9Temp4tSn4cw7JwM/tPRV6kUAcy9q
 imtfDkT30uPb1qmDa/G6UDw6EpYyVmCv4GXOYZhVjSEvvlujCbexhfBUpQi90tsj912z
 qWRfKAUHDqZbAvm1jAmW1lF/E84Rh2LsEMa1CZt5CicMie2jKVFhqT5V6c/h6G9W0tO2
 WgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691777550; x=1692382350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sn5DveFPgg8aYXKdB4BSOUyJOlGO1m1Sp8InAri/0zg=;
 b=fQw+iGhi7bAJ7FrY8Dc/BQzMEPEYzX/hCXCgPLjx1QCCItM9tUUe5KCzefNmZ5Cw/0
 l3VDahbPR8ZOx8lFNYqDXG3XpWmM6B40ZfapqGxlbka3AD7+o9ubN70qlcHp3h77BTKr
 ofj9cNQPRtxwtQfhtoSuGUR6eVFRR40PopbYA/AIM28pYnhAlkLT6mnyGJxlcv/KPqGz
 kJPb7NU9H7ZTrz3WT/fDEDxqtisAaAaq404hzz7AQSIt4co2UT93cz5GmrMEIA2F7Sk2
 pW+ET2+fRCzad7RWJHVLL/NnMx1jq71w4w7A7Mv9EthJsPk7IMKDgVgKc9RYo0uiZVfh
 ToYg==
X-Gm-Message-State: AOJu0Yx+y3Te/pJVNUhgvFWudy5iMxOUqniq4fX/yf/W1wi0cwcEeorS
 56LZciBfxVgG20qx9v9Z4gMJJFUWlW6gbPz4XuAQmJD/CUWR9w==
X-Google-Smtp-Source: AGHT+IFWz2l8aJ2eCWvG6Q67Fp3MfDQ/mRCV4SXrpRL9ExIuFOG0I/jdEYla1xxCZHB2Ob2Ve5vIAc0MrZDyx0VmPwU=
X-Received: by 2002:a67:f5cb:0:b0:447:7dc0:e14 with SMTP id
 t11-20020a67f5cb000000b004477dc00e14mr2161893vso.21.1691777550567; Fri, 11
 Aug 2023 11:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230811160224.440697-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230811160224.440697-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 14:12:04 -0400
Message-ID: <CAKmqyKOuQxNRXpzC3unrud_ty2mx6WeqPc82CyM-Pv-nRG-etg@mail.gmail.com>
Subject: Re: [PATCH for-8.1 0/1] hw/riscv/virt.c: fix 'aclint' prop regression
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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

On Fri, Aug 11, 2023 at 12:03=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Richard, Alistair,
>
> I came across this gitlab bug earlier today. The bug itself was opened
> yesterday:
>
> https://gitlab.com/qemu-project/qemu/-/issues/1823
>
> And turns out that this is a regression in the 'aclint' option that was
> introduced in 8.1.
>
> I'm aware that we're already in rc3 and kind of late, but even so I
> marked this patch as 8.1 to let you decide whether it's worth spinning
> rc4 or not.

Urgh! What a pain!

I'll fire off a PR now as this is worth fixing

Alistair

>
> Daniel Henrique Barboza (1):
>   hw/riscv/virt.c: change 'aclint' TCG check
>
>  hw/riscv/virt.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> --
> 2.41.0
>
>

