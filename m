Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqjPY-0003av-GL
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 18:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqjPW-0003a0-EP; Mon, 16 May 2022 18:41:54 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqjPU-00006x-He; Mon, 16 May 2022 18:41:54 -0400
Received: by mail-il1-x130.google.com with SMTP id j7so2168469ila.1;
 Mon, 16 May 2022 15:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0r/soxxt+gk24b1gj3UkEvuRS8WhtcBUuZSS78TN4RU=;
 b=Lco4arutk+QW6VunhldQW8jSNA6xldxXIMmPx16IA7MsogaQhQ6lqWnOUbFh6Q9R1Q
 vYk/LUQsB+GfLpEio5RI2FFWTBKprHd9XT5rv5JP2Yhq+9r7Iy+K1pNp5Xu/T/uBzzlC
 AiMI8ZoSX/vHJ4Ly6FmlmBuH3/ZsWYamJQ7vpdM3AXLrmkJnNJ74Qb5zUxcFElLP2VJf
 QpTGCYVtdS1SYCvyqbx9cJzkeYs/UjA0BzITT8JULkRx1mzS+OVe/uIDBwIS+aRe/ZdJ
 bTLaPHbzOVmMmxH9CY5ns4Ws+IAAYmtOw2vxyYyq0guXuYdsNqFUD44hZT5DOxSoeWgX
 LSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0r/soxxt+gk24b1gj3UkEvuRS8WhtcBUuZSS78TN4RU=;
 b=ktMbxruxibu0tMB0hTkAvucCh780Ds0YHAcj49F7/E6Oz30oglBBlgEDb0+zq9meTo
 Mhk+7nf6KPqNiJz8hbVpjwyBp4AlXMg2djkkG8DQsjaZL+L8YqaFXkxsFodOiFlJYlBx
 PD69/VyZZ5xJqHixidiV1lZAw1tNf33MOvFy3PqTz4h7lA3gHLpdrlhMk6bpX5FtfRge
 5LzENrKvHyMrmQixLKzIHXfW2hamla3UR5Pu4+OSHrcLtsd9MfMYyyMc0LpG35warcHv
 9yprGdNMB8LdFpt16qf+ql8Np0WNiEfCfqDPYR5tzFpbJoPfjBPzK2jMJ7YECC6fptfX
 tjqQ==
X-Gm-Message-State: AOAM532xzVD3wqsRALMSi1B/aIYwhbiFIukEpjUmDwShcxsJUbD5dYvr
 j5VUm5W0IyVwXiD0TgEd83EcphA4Iovan2DDFCg=
X-Google-Smtp-Source: ABdhPJyGdFT4XO8oCJmcxWMNJltcpjkFTZHjIMu6cQRILuCphnr8VJvWyjaKqbYJYw6P9jUVNsOG89hAI06EQY4/jQ8=
X-Received: by 2002:a05:6e02:170b:b0:2cf:9f8f:afdf with SMTP id
 u11-20020a056e02170b00b002cf9f8fafdfmr10626065ill.260.1652740910892; Mon, 16
 May 2022 15:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220513221458.1192933-1-atishp@rivosinc.com>
In-Reply-To: <20220513221458.1192933-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 08:41:25 +1000
Message-ID: <CAKmqyKNMXowLuK=kyyOgRffnpyphFhv6bbHd2fw+j3XXZcF4Qw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Pass correct hartid while updating mtimecmp
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Dylan Reid <dylan@rivosinc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Frank Chang <frank.chang@sifive.com>, Jim Shu <jim.shu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Mon, 16 May 2022 22:41:54 -0000

On Sat, May 14, 2022 at 8:15 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> timecmp update function should be invoked with hartid for which
> timecmp is being updated. The following patch passes the incorrect
> hartid to the update function.
>
> Fixes: e2f01f3c2e13 ("hw/intc: Make RISC-V ACLINT mtime MMIO register writable")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aclint.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index 0412edc98257..e6bceceefdbc 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -233,7 +233,8 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>                  continue;
>              }
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> -                                              i, env->timecmp);
> +                                              mtimer->hartid_base + i,
> +                                              env->timecmp);
>          }
>          return;
>      }
> --
> 2.25.1
>
>

