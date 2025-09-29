Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CCDCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 00:43:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v31zC-00072U-EU; Sun, 28 Sep 2025 20:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v31z9-00072M-J4
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:43:24 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v31yu-0001V1-12
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:43:22 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-62fc14af3fbso5379851a12.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759106574; x=1759711374; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzfR55nZwlpCaRCqW0aGgTV1mP1hp9/sOLvVjH7qZEo=;
 b=iCXzFwbW3ezKa8KNpDZdk2p8PVP4iHslABSpQ1HLxcz7xmhjFwAh/JKIf2TmfBY+6t
 cl+2/0h+xTp8npjBs026JozWBINq53xABYRLt6/fg0q1d09PhnIj3AnGETaCYczRoJfr
 ArYah3x5PcZ/KIN6IIQ6k05gxIJr3GOsc62NWSRzufmlQHLE0jpfcE9kMkjiPCwsHmVV
 AIddu9URj6zbdDN/ISQVGPqmGZHxycYw7Esqrw97PRFzS0gSm23yJvYJmwvh9EzxJyU8
 ivS9ND6Jab4telt3JsIdUAfAsqa5KKNKjuzAuH5vYhVabm5YvpQ0m4XcNU3YcLNdiddB
 5nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759106574; x=1759711374;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzfR55nZwlpCaRCqW0aGgTV1mP1hp9/sOLvVjH7qZEo=;
 b=KseQ/fppkiGLv49JLoZv0otLkLqszle53ph0WyftBoGtypo5aDVIGFbukUPumskTt0
 kkwm/YD53Btul94jRvf9r3rp3yRh30Hz/oXgmP1xLJPGclLmPkcn3qgH3QtwaMqAMzmz
 mTxU4FIz/Acf+5RNu56nR/Kt82Rs/INxGmhJVj4hOSI3K5OEQLFisx7jI23m9dqm/C3h
 92t3t+/WAG5nHnGLmNLMgsC0//c/w0bLFNi87hwZjsZh4/i1kgDx0HH9IPfYoWFJLb8q
 AkyVVjF0Ad3j9e2sZzDD0bpkyOd4dkKOxkoAIT4T4veN62X78LP+1T0OG/695GcmiHAt
 KDng==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/4SyKoilTj8L9+8rwiNHVZ2rT3gDov98lAu5p5EBcHAVCKCItK577fh1mO9bZ/j+s56acdd5wSGW9@nongnu.org
X-Gm-Message-State: AOJu0YzfvWea2IFS/QumzHWa8XiVQPGuBX4G+yfZtqPlIWOa88igCQJO
 TNOIVK7H+faWTLPBf4uoKm4iPYz4jk/MyfwRrbWIsLfBWBvU17ArLvMkD2QteeTIcgRRq4pHsqm
 R6G/1hZA+BiOWUROuMbW0hQAdO3v39nE=
X-Gm-Gg: ASbGncvgj/hcdNO1HzOApF1BVhgQKNj7uENeNpS1UUo7517qBhNOwJO4MBHDAL01l1/
 QJuEhtCwf2/Xd/j/gh/Iqk3I/Cnprcn2cyaFlpfM2uBpH4oiq80ajJJc2h934zEjNFVI/9+RvU9
 Xs887rHYTJXQWJRZqw7R01IoXYtWlpuFHioKf9rGgkR2LKWMKEdFXp65RhcJee4zt4uSb6rw15J
 rBPqkn/CZhwz8L5BMs1gfpWWz47r4NwDBgyxw==
X-Google-Smtp-Source: AGHT+IEmdCZNcFzNx7haxD9xm7Gk0cBQJ85p1vU/VvBAxnDNs0Osz0mXZBg3GU9CM+s24Ct5B5b5jOwLyP7vq8G45UM=
X-Received: by 2002:a17:906:c144:b0:b0e:8cd4:e2e8 with SMTP id
 a640c23a62f3a-b34b7106555mr1579477966b.17.1759106574088; Sun, 28 Sep 2025
 17:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250815140633.86920-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20250815140633.86920-1-vladimir.isaev@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:42:27 +1000
X-Gm-Features: AS18NWDoAlJkIDc-PUbt6C7yVHX3tKsJDmlnMkRQsC0PEAmpkxTBea26rfkTQQA
Message-ID: <CAKmqyKN0Ro9nLvq7MqYHf3byFBCyMHTvy=sJf0Epqh0E4pwhdg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: do not use translator_ldl in opcode_at
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Sat, Aug 16, 2025 at 12:08=E2=80=AFAM Vladimir Isaev
<vladimir.isaev@syntacore.com> wrote:
>
> opcode_at is used only in semihosting checks to match opcodes with expect=
ed pattern.
>
> This is not a translator and if we got following assert if page is not in=
 TLB:
> qemu-system-riscv64: ../accel/tcg/translator.c:363: record_save: Assertio=
n `offset =3D=3D db->record_start + db->record_len' failed.
>
> Fixes: 1f9c4462334f ("target/riscv: Use translator_ld* for everything")
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b1e41cdbf1f6..980a67ea855e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -25,6 +25,7 @@
>  #include "exec/helper-gen.h"
>
>  #include "exec/translator.h"
> +#include "exec/cpu_ldst.h"
>  #include "exec/log.h"
>  #include "semihosting/semihost.h"
>
> @@ -1143,7 +1144,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>      CPUState *cpu =3D ctx->cs;
>      CPURISCVState *env =3D cpu_env(cpu);
>
> -    return translator_ldl(env, &ctx->base, pc);
> +    return cpu_ldl_code(env, pc);
>  }
>
>  #define SS_MMU_INDEX(ctx) (ctx->mem_idx | MMU_IDX_SS_WRITE)
> --
> 2.50.1
>
>

