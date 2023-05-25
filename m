Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72533C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:22:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q20c0-00045Q-QI; Wed, 24 May 2023 22:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20bz-00044w-NB; Wed, 24 May 2023 22:21:55 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20bw-0001JX-Fi; Wed, 24 May 2023 22:21:55 -0400
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-439554d9a69so303147137.1; 
 Wed, 24 May 2023 19:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684981311; x=1687573311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pos1YCI+aHnHCSixIYTh/TXSSOpx4F9LwRj8Hg8bjvk=;
 b=FjfCvFMtdzgn8o7Dd+LvJA07dQKK/69O79Bn880kDe5PIt2W+yK2McBDnZlfkGjiOD
 nxeBm6VPVttVFnV3NhQfR1hsuYQIwCikH+7pQe2w6sutROFcC9LHP2gbeNkeHuLv+f+4
 aryyNyBrImSk8DHy9PFppUwZCsWRhDAmBQq9oZTaBSsSAE7W+MQaCSBOI+e74SaZhTbN
 JYQpQ6lI7U/u7Ze8B/vHBzB2FoNH0hh9TcPrg3hIK7vYGBdLRglfXaZI3XOCi/copORv
 JjwKNNvoP8Rfbfcz3r4Jxb7ApSzBYGZTKzommYbMjsVLznpmcCj8itv2ZUKcs8dj0G1T
 m0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684981311; x=1687573311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pos1YCI+aHnHCSixIYTh/TXSSOpx4F9LwRj8Hg8bjvk=;
 b=e4lhYsK6GD5vJiripk9ozyC+N6GRRjYYD5w0fAZcWTLAx3et+h/4EbmdkUQ22zeQL8
 WGAiqfLGMYCW9vf8w8K2koQ2GR0Hx7dZmgEbbAvStZJZHp5D4+wBgYzLLkzlyKK5SAAg
 Zg4zx+E9jj3ehuKB8jFuXFocdIJ1qWN11thcY6vd+bB7BHtWOaCs5kTpB53Hw467eS+0
 fP9ji0Z5JTuTvIEfXSME9xj2KfSjtxnLEQY/T+cn1CMl7aLDB1VXadXAJnSswEWTcMfl
 5ol1gVbWV0TuhHPQ6kgk3YiBakhNaX/lRxtEBtehuzJ/1ubDH0aDuH/UOG9Skw+v3pad
 se0g==
X-Gm-Message-State: AC+VfDwV1ZcQEUmBQvwTxjmUjnJfUOrTOz5a26zvbelH+khvVHFD1qG8
 WfAxdQdWSFwEUU1LaAFXGLSnMQzVF6+tZ2muUog=
X-Google-Smtp-Source: ACHHUZ4sbDASX+6+gmdwLsGqpNAanUhomgfGSPd8JReDnnvEcS8Wcp4NxuHvVwaXg1gTtiLkShPRhoi7JernLPlEB7M=
X-Received: by 2002:a67:8cc2:0:b0:434:8430:299c with SMTP id
 o185-20020a678cc2000000b004348430299cmr491361vsd.7.1684981311000; Wed, 24 May
 2023 19:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230520054510.68822-1-philmd@linaro.org>
In-Reply-To: <20230520054510.68822-1-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 May 2023 12:21:25 +1000
Message-ID: <CAKmqyKPyZJgZTd+mdRHAE_fvh+PE3sboT9aj=dBLwktfAQeKUQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/riscv/opentitan: Correct QOM type/size of
 OpenTitanState
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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

On Sat, May 20, 2023 at 3:47=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi,
>
> This series fix a QOM issue with the OpenTitanState
> structure, noticed while auditing QOM relations globally.
>
> All patches are trivial to review.
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   hw/riscv/opentitan: Rename machine_[class]_init() functions
>   hw/riscv/opentitan: Declare QOM types using DEFINE_TYPES() macro
>   hw/riscv/opentitan: Add TYPE_OPENTITAN_MACHINE definition
>   hw/riscv/opentitan: Explicit machine type definition
>   hw/riscv/opentitan: Correct OpenTitanState parent type/size

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/hw/riscv/opentitan.h |  6 +++++-
>  hw/riscv/opentitan.c         | 38 +++++++++++++++++++-----------------
>  2 files changed, 25 insertions(+), 19 deletions(-)
>
> --
> 2.38.1
>
>

