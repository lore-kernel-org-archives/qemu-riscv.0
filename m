Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1269CC61D85
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5d11-0000Uq-E4; Tue, 21 Nov 2023 21:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5d0p-0000Tc-Ns; Tue, 21 Nov 2023 21:30:49 -0500
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5d0o-0006Rk-3L; Tue, 21 Nov 2023 21:30:47 -0500
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7bb4b7eb808so2039066241.3; 
 Tue, 21 Nov 2023 18:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700620245; x=1701225045; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYHA8OjTL6CYlnrUBCcHLo1+eJ6uRDBuAKRoZRN0/IM=;
 b=hKlcZY1yGqf7Pk87Z5vRdZGnEYM8Cz94bKxhlHliMhjoOLB2Pz5pesgdWk4cSHgv6P
 w647h+YtKN4fGO67XNtagO8JmvQZQrvS1b8ux0PvbvNvo3RDPcPrg7tjTa7i4odP4S1d
 hM2dIvtBOGWeVYd/3VD+2rUbU2MlS9Ao6jVe6Kz8B2AMV5JSJNSgOO0pKI0JR7qgXqu+
 D5MMyrM0V+tXyVaZ4pvGuEcYr2uD1tzPdI6b2+kpOSM/VGlP1a1e/yZnlk57Y22yH2Kx
 NNUHhv4IEYC1E8cTgpo4eearBzPxHs9u+abnuv6wY82pgqJOZTBQ/g745tLoOMkzjerD
 2wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700620245; x=1701225045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYHA8OjTL6CYlnrUBCcHLo1+eJ6uRDBuAKRoZRN0/IM=;
 b=SzhXp0PNeiNtohXt86TmqsWNb3m/ddIzICTbIj7jGcDWyxUZ2krpEj7qVaWeqVi5Zd
 kogc5alIs46ghwJTUFX3mGzS60xBY6ZvD5TcUGbQiDjYqwm05dMivKDJvW7owx5zDwTd
 oXdpuUn0ckvML4Fp/JGPSHPTguu1fAHnPxWn3ndDwVfu1YMyHxBuS/PeDyVaRLTyCfsR
 ItKPvWdD9MG5SLEqGVjeusvNPQHA5uhcemdXiNNAGJwbi8FCiW0kawvvUChjegvHvzKs
 sJ6JWGcIaovJwYGIvKwO42f+ZXfiWo0PGTDbkLZB2JqE4ECmUlmn2fbeCXsYncukUQwB
 GcyA==
X-Gm-Message-State: AOJu0YzOQ1z/AMKPZH3xg//NYrNkGvAZ121ZgnReW7/c9QCLrIbTqjaA
 EG77wZHazOB1MosWXJzO8Wam5lSC610+qojGqLw=
X-Google-Smtp-Source: AGHT+IEzSV+KWIvjZeIdlmwAGHLogTHx8laLMnmypXkzZuuGrKevPJvGcY/wACJ6xdGN9BrWxOBg2lkgHn2PvFQh09k=
X-Received: by 2002:a67:f3cc:0:b0:45f:b92c:663b with SMTP id
 j12-20020a67f3cc000000b0045fb92c663bmr1349685vsn.29.1700620244724; Tue, 21
 Nov 2023 18:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20231121071757.7178-1-ivan.klokov@syntacore.com>
In-Reply-To: <20231121071757.7178-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Nov 2023 12:30:17 +1000
Message-ID: <CAKmqyKPyFEfZUDZefzeYGidNGPtejH5PniQmgCCwT6MPzrA+_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix mmu translation with H extension
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Tue, Nov 21, 2023 at 5:19=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> A series of patches that correct the conversion of virtual addresses
> to physical ones. Correct exception for mbare mode and fix MXR bit
> behavior with MPV\MPRV bits.
> ---
> v2:
>    - Fix typo, specify the fixed commits
> ---
>
> Ivan Klokov (2):
>   target/riscv/cpu_helper.c: Invalid exception on MMU translation stage
>   target/riscv/cpu_helper.c: Fix mxr bit behavior

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu_helper.c | 54 +++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 27 deletions(-)
>
> --
> 2.34.1
>
>

