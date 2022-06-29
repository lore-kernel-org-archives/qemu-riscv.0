Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6N20-0000Eh-7I
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 22:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6N1y-0000EI-Bx; Tue, 28 Jun 2022 22:02:14 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6N1t-0000fB-Sg; Tue, 28 Jun 2022 22:02:14 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p14so13672798pfh.6;
 Tue, 28 Jun 2022 19:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUISdQMUXwMqSFqixNpC1+kOEVSxvJ3njQUGSsrrCeE=;
 b=lYZ3eJq7mZKONcSlRGu8xeIoB6FpbNOSMHh9Nsj+h+E+Ln8JbRXG9ZQoYIym/5RaRx
 wMaPRQ8fZa2IJiyvS1mo34l1++TR08xdR0Q3jfCv5SZ1zzCo8vNf8pJqwmuJAASNmXfL
 DrKsnjBPvqW9cFGI5ERVbi4cp4dM+nzKq50cBawazUnxpvOyQbjQI0FbC2tYpiFpOEK7
 yq8Tya7DrbOhz1JTwNMf12YBKzk3XT2q7jPZhmh6A1kmQ+2kjjeIQspcIntlG5cfOuVl
 WYt9xE+tLu3NPXpTNA+/vjCbz0t8E8eLNn9ycxemsQipcJM6mMW5M8qOgGVT7M06oqSN
 mXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUISdQMUXwMqSFqixNpC1+kOEVSxvJ3njQUGSsrrCeE=;
 b=SVekHqhtVBBW3gR2UHCCAJAmycTAddWQezQT0DKfHLrEnD7kpm0bDsjxOKPAqpgUcz
 4H8Xl2hG0LIVgrMOhwah6uPOaw0k5pOUlfO2jPs9lV2V2j1KENrBDpfL/NO2yfAHY9N3
 cqRnCHzTkzIiTlkbMGa9yXqu0Zyn0Zk7Ocrw0QAyV43Zi8B6DUQNBX5QZXwhZsstvfqK
 CuuAtrg/a3Gfm1MEXBcX7o+x1rtTUoq2BClP2m2PhO6yYjPD+kwKvmgEMAUsBAia6urY
 J67meChpBARpD11tv6I0fT6H1u9BX84q21ug4VTp6+H9QY+AFqPIG0zrr4pcJyEtlZB9
 hHPw==
X-Gm-Message-State: AJIora+th55oy5QXz9ZEfW2aHKbERNgFau0sFWKZ8hj3rxpAYq8dTvRJ
 Hl0GXKsgijA72fVFzz8Xae204X3pEuTZkNmYpew=
X-Google-Smtp-Source: AGRyM1sHYNUCLMbqn5I9HqoYiVDG40di81iDAagDsZ3yxbCVeCGSG0LcCbDqMIl5Ylqpcg2i6vfBQmko54syYgunKv4=
X-Received: by 2002:a63:4d5:0:b0:40d:77fd:cff8 with SMTP id
 204-20020a6304d5000000b0040d77fdcff8mr834946pge.361.1656468127697; Tue, 28
 Jun 2022 19:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220627164044.1512862-1-rpathak@ventanamicro.com>
In-Reply-To: <20220627164044.1512862-1-rpathak@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Jun 2022 12:01:41 +1000
Message-ID: <CAKmqyKPekJ0v6gXJZh=cptRE8TXVqpB_2XtG1X_-oSgcmcf58w@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix user-mode build issue because mhartid
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Anup Patel <apatel@ventanamicro.com>, Rahul Pathak <rpathakmailbox@gmail.com>, 
 =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Wed, 29 Jun 2022 02:02:14 -0000

On Tue, Jun 28, 2022 at 3:03 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> mhartid csr is not available in user-mode code path and
> user-mode build fails because of its reference in
> riscv_cpu_realize function
>
> Commit causing the issue is currently in Alistair's
> riscv-to-apply.next branch and need to be squashed there.
>
> Fixes: 7ecee770d40 ("target/riscv: Force disable extensions if priv spec version does not match")

Can you please re-send the original patch with the fix? I have removed
this patch from my tree

Alistair

>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>
> Changes in V2:
> - remove the stray format specifier
> - add the Fixes tag and reference to external tree
> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e4ec05abf4..509923f15e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -636,9 +636,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
>              (env->priv_ver < isa_edata_arr[i].min_version)) {
>              isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +#ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x%lx because "
>                          "privilege spec version does not match",
>                          isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +#else
> +            warn_report("disabling %s extension for hart because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name);
> +#endif
>          }
>      }
>
> --
> 2.34.1
>
>

