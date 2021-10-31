Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhKMj-0003Bp-6Z
	for mharc-qemu-riscv@gnu.org; Sun, 31 Oct 2021 19:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mhKMh-0003Bd-JL; Sun, 31 Oct 2021 19:35:51 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mhKMf-0004Oh-Vm; Sun, 31 Oct 2021 19:35:51 -0400
Received: by mail-io1-xd32.google.com with SMTP id i14so19485059ioa.13;
 Sun, 31 Oct 2021 16:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TUeeh/2B96sxOuEpU+hPnPFZ7zI/j5Btpy5swcS0LAg=;
 b=XU+jWVX3Ifyw5yUYlktevurHl9cNo8gaQcz16XbCU0NhKxUl8GjZw/y6Ud2/GsyjdR
 NSQFgl4GTLBeX1LugwQNbQ1n+8VzxY0Tb1muGyp7MHi/xyzJNqRo7+/8yWL7oqotP9h2
 Tvx9TTiLrKykX5E/ZUIh7LtgnArBIM+B/ykNiKcNF+2AQ5VLiiNL1LTLg7HK4tBwcW9H
 KCwnVc97VafRqeUVq/Ycsbqhvuzkzvb0inEQD27kWx0+WEBWxmIrPCmvfxwNdiZroXUR
 jqD3t3XH7HYmZEnLlRx9TItkgEGXjwBFY58trKm48UxpxqLaQimi8Wl+iWpq7hlF0IaA
 uhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TUeeh/2B96sxOuEpU+hPnPFZ7zI/j5Btpy5swcS0LAg=;
 b=gHNCe6YIC/gfPD0awlK76m3QYk3iKOo4PahvZiNDetYJ+uSXXSR0zbvWr5XQ41bfJ7
 irkUNR6d2vQH01ZfCRsNC/a4kmw4Rd+FolKS/jRFiV6wsmMfL//KzFi+RbH0ZFlf33Hz
 u/S39CYxZ6Rngj4/mgYI5JvK74IafnO4IXWU0aQWrvBZkLXTsESgAxX26I0jVK06xB1x
 NFAi7qX2T0BmY5FN4DvnR7tvFFl0J0AQC2MUugpxP4PrSRS/+ezbHhPDKccL9tkfhaJI
 GkfAWJGYnOKclRXBcspmunqf2VvKZvwVdOQFat1Ej7+r2Rx4zqXYVSYwgxPsLocIEG3x
 klYQ==
X-Gm-Message-State: AOAM5338MaHGmw0QOA9/4NoGAtw7zdRlDzKSANuq9GNNRiu05CeV4QGR
 KqljXLsh10dHzj+0S61dbRkFNuJgplKFx62UJH0=
X-Google-Smtp-Source: ABdhPJyTquI9XMHhNDbDaXJYjv8uEqgZUgd6nA5NV9jN7KzcJ9aHPzhRW9d7EDeecK5d+evnNT1zj3bssFTiaPnMtHE=
X-Received: by 2002:a6b:a19:: with SMTP id z25mr16217162ioi.57.1635723347235; 
 Sun, 31 Oct 2021 16:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-5-anup.patel@wdc.com>
In-Reply-To: <20211026064227.2014502-5-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Nov 2021 09:35:21 +1000
Message-ID: <CAKmqyKP45N2+FEG5eMqocv7XbO2ZmAWJAiKy3-mf2AnCYdW_UA@mail.gmail.com>
Subject: Re: [PATCH v4 04/22] target/riscv: Improve delivery of guest external
 interrupts
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Sun, 31 Oct 2021 23:35:51 -0000

On Tue, Oct 26, 2021 at 5:41 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The guest external interrupts from an interrupt controller are
> delivered only when the Guest/VM is running (i.e. V=1). This means
> any guest external interrupt which is triggered while the Guest/VM
> is not running (i.e. V=0) will be missed on QEMU resulting in Guest
> with sluggish response to serial console input and other I/O events.
>
> To solve this, we check and inject interrupt after setting V=1.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index bb7ac9890b..04df3792a8 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -287,6 +287,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>      }
>
>      env->virt = set_field(env->virt, VIRT_ONOFF, enable);
> +
> +    if (enable) {
> +       /*
> +        * The guest external interrupts from an interrupt controller are
> +        * delivered only when the Guest/VM is running (i.e. V=1). This means
> +        * any guest external interrupt which is triggered while the Guest/VM
> +        * is not running (i.e. V=0) will be missed on QEMU resulting in guest
> +        * with sluggish response to serial console input and other I/O events.
> +        *
> +        * To solve this, we check and inject interrupt after setting V=1.
> +        */
> +        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
> +    }
>  }
>
>  bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
> --
> 2.25.1
>
>

