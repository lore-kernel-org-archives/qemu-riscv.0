Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkF5T-0000y4-0O
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF5R-0000xl-5V; Wed, 05 Apr 2023 22:10:53 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF5P-0003Uq-L3; Wed, 05 Apr 2023 22:10:52 -0400
Received: by mail-ua1-x92e.google.com with SMTP id 89so27009145uao.0;
 Wed, 05 Apr 2023 19:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680747050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msCtyyos7pNrTcjyjxBLVdxvH1pkDdweQbvlo82BQOQ=;
 b=krEeIipdhLIZ542XTgJua11x7CBfD+S+xSqWlW1bA31Z3ErhcyPuJ7aoxO0bcqY9xj
 4w2ThUgzdZUYBVa415hyCc6grusg1uJNXU/8nGzueFl2iPsw70IYB7zD1CzmMyXFYOhm
 qD1HIrEeu+qtolhPvdf8aVxhFdSZRlVo5U7y3KNRMoHYlMvkCM9jF8QvpmHlvja2ZjUs
 qVU5lrzSxfteBIprl2+fbO5Xt3HS4YHJgkLHROMUHA0GICUNLmY6ftA2PJZKXi9qoouc
 Jw6fKtfJPbqTaIoTx5pkJAzw0tNGiTdXPmXc3oS5X4QVFIbIbHwoRALr4RWIBjdtqnAK
 amgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680747050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=msCtyyos7pNrTcjyjxBLVdxvH1pkDdweQbvlo82BQOQ=;
 b=EuZGnBtfHZKrXaR2E8rAfiLhdIzn3cdB7vlXLbadFYUXa19GsCzsQQLy2q4ESqn7wP
 eJmDHEZMLBCOvMqkpiigiO0TpRTcfDayhxQdcy8M4xJqNo5cR9iiV5N/UoW6wSAZ/p+6
 nFUb54zoD3uFUU/jvgLy8ewC2jF88VPwi8/LRgqaiMEcUdTGr0kGox+9O6si4OQI94uM
 1HBPsIMtcjPjYwU4TVWBkuT54vKnkAVihBspfUnsV0oilHnG0q3dsl28YkT5RZMQ50Rg
 mCiTTpzzal+UTMtqMDA1xfJoHjnbiZJ9rqiww3w2AMoRvqRdKzkQit8SNzuy7TLtNxAq
 q52Q==
X-Gm-Message-State: AAQBX9cbpS6IwX89QT/JXH3bYeR1NLY/spyGxXJByU1A49B6W8DyJGHv
 2YCncjYDAZZtXdpwFOO71C3USTXvY9Thz9XkB7s=
X-Google-Smtp-Source: AKy350Y/JatxsXZ8jByCBUO8gjBytXYLzY79za618C3plfgXqK7H7dAPBFzsEeUDqvZj2p7wkCHkdGMY0miXmlcXrUE=
X-Received: by 2002:a1f:2147:0:b0:40c:4d1:b550 with SMTP id
 h68-20020a1f2147000000b0040c04d1b550mr6315387vkh.0.1680747050385; Wed, 05 Apr
 2023 19:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
 <20230329200856.658733-8-dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:10:24 +1000
Message-ID: <CAKmqyKOUkXh6cvSNwK_ur5FfND9E8fF3TTu7UEe0EauU+iJQeQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] target/riscv/cpu.c: validate extensions before
 riscv_timer_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 02:10:53 -0000

On Thu, Mar 30, 2023 at 6:11=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> There is no need to init timers if we're not even sure that our
> extensions are valid. Execute riscv_cpu_validate_set_extensions() before
> riscv_timer_init().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e8045840bd..331272c8a0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1196,13 +1196,6 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
>
> -
> -#ifndef CONFIG_USER_ONLY
> -    if (cpu->cfg.ext_sstc) {
> -        riscv_timer_init(cpu);
> -    }
> -#endif /* CONFIG_USER_ONLY */
> -
>      riscv_cpu_validate_set_extensions(cpu, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> @@ -1210,6 +1203,10 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>  #ifndef CONFIG_USER_ONLY
> +    if (cpu->cfg.ext_sstc) {
> +        riscv_timer_init(cpu);
> +    }
> +
>      if (cpu->cfg.pmu_num) {
>          if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscof=
pmf) {
>              cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> --
> 2.39.2
>
>

