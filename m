Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOX1D-0006d8-HX
	for mharc-qemu-riscv@gnu.org; Thu, 18 Aug 2022 00:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oOX15-0006bA-JT; Thu, 18 Aug 2022 00:20:25 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oOX13-00083Q-25; Thu, 18 Aug 2022 00:20:22 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 73so363322pgb.9;
 Wed, 17 Aug 2022 21:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=q9zHFdXtwZj59sNvfehjBtTTfnpeXLm1QDMCzQKW5WE=;
 b=QV7FAPhWoKak9044wR72V/gRftd8B/N5IvqHggyrdZVFU2NwsUyoXE9FbVViIZ/9Hp
 soLPDqYamAXvJEBBuXB/OwHuRUnMEWKzKqoCIn1KChyaLXY/kw+DHGwps1uV7/Fxnc3f
 37FjdtPyk5NIMYd/meCm6JXq2E8UgwGnh5MjpP6a3SzNSh16dUwCqyvawJ6fh3GwDJkg
 +XS8lTe77mzSWWfd4XLChr63ZsxGgOLpf78Cks1I0Uk7i0EKrqu21i8K8ULciNlJNlCM
 8ruwEWk20T23p3zXwclT2dBW3d2hXWvSTo6hkOIbG6eYHp2Wse5BIy+1HwjQyWA2CUdj
 sZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=q9zHFdXtwZj59sNvfehjBtTTfnpeXLm1QDMCzQKW5WE=;
 b=GcVhCJiZLvwRIh4g+H9Xq2xstbqnUTfueQy3IzBg5JS5fU5WOQXJyUw0YFxwnS9lOJ
 M2oqVfLVxqs0608mIDoDbdMnu0vzqH0PKJEobCzz5sbwIxlSnzp7N6tEFQDUvW2hYljY
 VfB03bGQ89pEg1ZULEWzqOhXWB3NSFp+wwvINGG1SKUou8yT0ydh4eKKgUMa5a2xD10K
 hJOEN2BSSCU9E4nPvefv8otVqfGBTaNZ4JIFGI31pMZSyXgA7fuo4HL33XE3IhgZSJh7
 xizCDpyQmISvu3OeGgPdmS2qmp+JKkZqmxgWQoA6gJR62slEzfdRVFu5gLv/F92baexE
 uAeg==
X-Gm-Message-State: ACgBeo0PB12jEKM6gMdSG2OAjy5g0HWTLQrmyOs2iojsCbUcC9o6m5Q6
 leuJw4wFh9jfi7n+SbCZpU5/jxyIH4ozt1sN9jM=
X-Google-Smtp-Source: AA6agR4Z2DXM3tvy5n3bSxbQkRdqMMevtses0VQNq0tW0fO6tTAM0cUx6Bzcx1JJoNKue+EIohSFpamSi4bCmwozeNg=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr1225279pfj.83.1660796418824; Wed, 17
 Aug 2022 21:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org>
In-Reply-To: <20220815190303.2061559-8-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Aug 2022 14:19:52 +1000
Message-ID: <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Thu, 18 Aug 2022 04:20:29 -0000

On Tue, Aug 16, 2022 at 5:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The riscv target incorrectly enabled semihosting always, whether the
> user asked for it or not.  Call semihosting_enabled() passing the
> correct value to the is_userspace argument, which fixes this and also
> handles the userspace=on argument.
>
> Note that this is a behaviour change: we used to default to
> semihosting being enabled, and now the user must pass
> "-semihosting-config enable=on" if they want it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I agree with Richard that a check in translate would be better, but
this is also an improvement on the broken implementation we have now

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59b3680b1b2..49c4ea98ac9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/exec-all.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
> +#include "semihosting/semihost.h"
>  #include "semihosting/common-semi.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> @@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong mtval2 = 0;
>
>      if  (cause == RISCV_EXCP_SEMIHOST) {
> -        if (env->priv >= PRV_S) {
> +        if (semihosting_enabled(env->priv < PRV_S)) {
>              do_common_semihosting(cs);
>              env->pc += 4;
>              return;
> --
> 2.25.1
>
>

