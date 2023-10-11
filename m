Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A0FCD98E3
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:18:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNqw-0002Fq-Qv; Tue, 10 Oct 2023 21:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNqu-0002ET-Ah; Tue, 10 Oct 2023 21:17:32 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNqs-0001V1-Oi; Tue, 10 Oct 2023 21:17:32 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7b07548b084so2004761241.1; 
 Tue, 10 Oct 2023 18:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696987048; x=1697591848; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJkMvuL60AEc1YYSAni761Rf+t55EzLdW3PLtP/eXfc=;
 b=JSQ81F3a8IaCK3NtAktw/fz8zpsks/b1tRUpeDbaAa/yIcYE/59UIuo17sTfOCFtdW
 wgDMBbmr0Lzt0dRqBeZkOuhiL+Xuvt0oYiJHlnpFfCtvNwGd5Cx63no5EVMZ+twqIIme
 VcbPI7Qy2pNv3Ad3ew70dBPPXbQuTQ3oVoss0nur6sMaryq4VnOIoIRWB4OPbZhTFrY6
 MXWlMnhvDfCIVGkpVKGmoKNpKE5L3A5LfdkzWkJUgDO9p3dszDAXRyp7xwgV/D7jhsmA
 HJA9MavDa6iRqvPL/EyNA1lhmaaMaY6M4q/GyONIndFkpG60SlsKfSoTe+3fLjQlxXbz
 zE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696987048; x=1697591848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJkMvuL60AEc1YYSAni761Rf+t55EzLdW3PLtP/eXfc=;
 b=wNE13Ic7VS3sB75UArEiS+Es4tVH3Sf5zoFIMxSrfByKhT9LJZ3Sw1aHcvukqJ6DX1
 L30G3zX5QN6P4sr5PItjx09QYfZ/mNVUinXg5x8RWNT2kI5ynWmrCUs8crpoo/WfSWKc
 nNLTHnPTtRdAa4enF2sqNsaoNYMl0FcaK11ANy/LhIAmZJUOeS0X+6NYvqUjWpRjHzuN
 EVED70DHeagg+oUHAJlvvUYio3DB5cJ8N0F0mFEkikbpJ84QXOb7zzQUTGkqWw/ebSSJ
 IOkQR+4iPLlFc7o3Mr003+Wf0oJj5g9JmjqSOBLOhfxPCm6CGbTL362klHweaV/UI/2Z
 wnog==
X-Gm-Message-State: AOJu0YxDTg+tVMnHm2/dUKu1uiXpNdOfXqcELI9scEFO6oYUclRlv+I2
 /P5K0aIaY/vOX8laA5+wVz7l/w/8wJ0ylxY2b3Q=
X-Google-Smtp-Source: AGHT+IFIt8ujIg5uahP0i8cQkdH4rRJRrx4BOgvnquf9pjrEoLDX4a1HQzQZEF+zF3WgMVyeX1xd6LxQjuwaxkeDQN8=
X-Received: by 2002:a67:f701:0:b0:440:a8c8:f34 with SMTP id
 m1-20020a67f701000000b00440a8c80f34mr18846480vso.3.1696987048616; Tue, 10 Oct
 2023 18:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-5-philmd@linaro.org>
In-Reply-To: <20231009110239.66778-5-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:17:02 +1000
Message-ID: <CAKmqyKPUiOqwV5BXG7X=pCGZ16OAAf2S=+oq62Go+rHTC2dOZw@mail.gmail.com>
Subject: Re: [PATCH 4/6] target/xtensa: Use env_archcpu() in
 update_c[compare|count]()
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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

On Mon, Oct 9, 2023 at 9:03=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> When CPUArchState* is available (here CPUXtensaState*), we
> can use the fast env_archcpu() macro to get ArchCPU* (here
> XtensaCPU*). The QOM cast XTENSA_CPU() macro will be slower
> when building with --enable-qom-cast-debug.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/xtensa/op_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
> index 7bb8cd6726..496754ba57 100644
> --- a/target/xtensa/op_helper.c
> +++ b/target/xtensa/op_helper.c
> @@ -37,7 +37,7 @@
>
>  void HELPER(update_ccount)(CPUXtensaState *env)
>  {
> -    XtensaCPU *cpu =3D XTENSA_CPU(env_cpu(env));
> +    XtensaCPU *cpu =3D env_archcpu(env);
>      uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>
>      env->ccount_time =3D now;
> @@ -58,7 +58,7 @@ void HELPER(wsr_ccount)(CPUXtensaState *env, uint32_t v=
)
>
>  void HELPER(update_ccompare)(CPUXtensaState *env, uint32_t i)
>  {
> -    XtensaCPU *cpu =3D XTENSA_CPU(env_cpu(env));
> +    XtensaCPU *cpu =3D env_archcpu(env);
>      uint64_t dcc;
>
>      qatomic_and(&env->sregs[INTSET],
> --
> 2.41.0
>
>

