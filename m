Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA716CD98E3
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:18:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNrI-0002L6-T7; Tue, 10 Oct 2023 21:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNrG-0002JY-Kg; Tue, 10 Oct 2023 21:17:54 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNrF-0001ZW-4t; Tue, 10 Oct 2023 21:17:54 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-49d14708479so2074769e0c.2; 
 Tue, 10 Oct 2023 18:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696987071; x=1697591871; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YznSJD2mHsEZl4F3mTwCcESZfobqnju2BZnuOObRolw=;
 b=gAKV8XgLnfmxvmlPEDzQ3mPzN9bqscaAiHE1biWtgdFG793wnlCqCC5iTY0aDJwDzP
 MMmAjbpIc6+sfRodj35CBbROsUPiQE8nlTgaPA08NUBPnuVcICKAo8IXbbN47ZMIUIxK
 1S7MFGxWSwx+BkN1mj9ArBrOz7A7yX5LBEyIrgdPgMopxoAjjVPksjX5/lka+sBtTL7v
 W3aS6soclQxfxeoMz4pi09A81p+YLU2wEmWTF/7NQr/ffAa+UOrl8hgQ/QaPjDs+VXQg
 c8+i9waBQFu7ad73FfDkrC7MHAKDthx9Ps+C6lwebHLuiImnQHKdK6stkW9h0E7lq0Zk
 TjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696987071; x=1697591871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YznSJD2mHsEZl4F3mTwCcESZfobqnju2BZnuOObRolw=;
 b=tEu+zMs3CsEvk+HVjBxpDLRHBJ7X5Lcn5GnxyWvcgWg3z4UrFaOHCvlrArVsUEKMyg
 8FOLOQ4dczZcfo98gtmB9uxt9Jskfq3CmlTGPTXUiQ/9e9GbXq8bdSrZ/J3qmMY7bWQf
 aBgmkJfFJkCy76zXQ4Zc0EDXMubOnLCNglRJoY5U/t6VN5YGX3oghiK46l3a/BMLebzf
 E2k+p3yHSkKwoIb53MImzdu/1s12fOwRRuBCx97DlIrAGH1QJZ5dmL18fsm9TJdRzmu0
 QQ4Astyxxk+Zbl9scKMoA6CWolE3XHWIn+xFrSj5q/1xVdaWDPjXp0xYeaEYTFh0VV1m
 Yq3g==
X-Gm-Message-State: AOJu0YxhDQVn58JilV6m/bK1f9LCFFSu2qYeezqUi0t/iwq66H+yIjsY
 kG15pSc7bJkZJGYU7Zucu2sMDJ+yeVPx4FMBtyw=
X-Google-Smtp-Source: AGHT+IH7z8ug2SI1j1Tz1jtmoEJKTz3KATNM7HbOajCHPB56h3ky210TCciUif5fhpuNBjLPl7gbqeZRIev7ggHNebw=
X-Received: by 2002:a1f:d3c4:0:b0:49a:b9ed:8c22 with SMTP id
 k187-20020a1fd3c4000000b0049ab9ed8c22mr16747703vkg.9.1696987071108; Tue, 10
 Oct 2023 18:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-4-philmd@linaro.org>
In-Reply-To: <20231009110239.66778-4-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:17:24 +1000
Message-ID: <CAKmqyKMsJXbagOy9=vBWF-KEdHsnjvFEcLhPyuv=Dk0qfktrhQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/s390x: Use env_archcpu() in handle_diag_308()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-s390x@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org, 
 Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
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

On Mon, Oct 9, 2023 at 9:04=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> When CPUArchState* is available (here CPUS390XState*), we
> can use the fast env_archcpu() macro to get ArchCPU* (here
> S390CPU*). The QOM cast S390_CPU() macro will be slower when
> building with --enable-qom-cast-debug.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/s390x/diag.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index 8ce18e08f3..27ffd48576 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -77,7 +77,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, u=
int64_t r3, uintptr_t ra)
>  {
>      bool valid;
>      CPUState *cs =3D env_cpu(env);
> -    S390CPU *cpu =3D S390_CPU(cs);
> +    S390CPU *cpu =3D env_archcpu(env);
>      uint64_t addr =3D  env->regs[r1];
>      uint64_t subcode =3D env->regs[r3];
>      IplParameterBlock *iplb;
> --
> 2.41.0
>
>

