Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nr4pP-0001va-V4
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 17:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nr4pO-0001v3-TB; Tue, 17 May 2022 17:34:02 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nr4pM-0008Ab-R8; Tue, 17 May 2022 17:34:02 -0400
Received: by mail-il1-x12e.google.com with SMTP id i15so245395ilk.5;
 Tue, 17 May 2022 14:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=njmOWjFd1zNstZ2QQg05Jfyh1xdfTAEn6DOLdDeY9mc=;
 b=GIblwptLqtwJSNRP8YMZAAQ2XsK4Gw6L7b3xWqhsbNi1eZIaS9dFH3pMdsnMO5o+X1
 cpmJGXFKLEvclOG4QKJcLWFoQfydv9O22Y95zn5InoDZeXfnkhAt1+zhj5iKltN+muBU
 MgT002ZAYMToR1NyurAHJWqgByizppqfh94Jl9aN7rG3ph6l3wqJbHjMIGorEPE5T2Mi
 Hig5QImb5vSaQBjtDgKxkISz/j7OtM/eckx82JsdudC1ZYDzB54Va+ommH5BHVLaIQ68
 1cM1S493RBiBxvvHxswY/MO2Rs0Z/1dLm5+x5NQPBmszKdr8SA19p5zyQZgv2HPCyzfd
 YiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=njmOWjFd1zNstZ2QQg05Jfyh1xdfTAEn6DOLdDeY9mc=;
 b=HxVmwJ4u3ve5T6o+8dnWYsF9K8nan4JFBjw6Sy4j4c3lgIqxMSCr9DdMOQQgeqrB4z
 4sFgxBUe0vEILDR6fXVeGhxcePjFsa5jVO/14ctQ+INyAj9+mWEKIC/DuVYrxVUDIbwM
 FijVjbk0KAnCml5hyV+Eu42vMBC9RV/4emnzJvTmCDcauTSLJUKbqnchNXBxm3CsP2/e
 8MJMach+tBSoQreJVKULCaq4yamtbNtHBl/HIWy7NVXcfsoqjsJmPGhJySPdLk//xKhd
 UIJgFXC157dbOMPLn/JzvnoYTFW0F+exdw3WtHcuHLJ5+H4dbefkPY+W8/XwM01SrBd9
 3I3Q==
X-Gm-Message-State: AOAM532jMvFN3X+O4A0VsdBpDHA7cTqQwtc9hZZ6SCseFSU9jFR4qccG
 NBu3+D48rLBhVN+FgE2dvYDBUp0GbFEQ5k417+E=
X-Google-Smtp-Source: ABdhPJyi+XmrJZuaJS6/YhMQW/dKYHU2QhTVg12kxNcj3enaJYJ+bRB5yCutViXySBMrwVBACVF+mCdRtFSjE6EjlcI=
X-Received: by 2002:a05:6e02:170b:b0:2cf:9f8f:afdf with SMTP id
 u11-20020a056e02170b00b002cf9f8fafdfmr13231888ill.260.1652823239139; Tue, 17
 May 2022 14:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220517072645.24938-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220517072645.24938-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 May 2022 07:33:32 +1000
Message-ID: <CAKmqyKO6y+t3AO3vZXc9LzF1MmrCzB6KTi1Yr0bs0JXJ+EFxcw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: check 'I' and 'E' after checking 'G' in
 riscv_cpu_realize
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 17 May 2022 21:34:03 -0000

On Tue, May 17, 2022 at 5:28 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - setting ext_g will implicitly set ext_i
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6d01569cad..1c76debb2b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -583,19 +583,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      if (env->misa_ext == 0) {
>          uint32_t ext = 0;
>
> -        /* Do some ISA extension error checking */

Can we leave this comment here? Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> -        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> -            error_setg(errp,
> -                       "I and E extensions are incompatible");
> -            return;
> -        }
> -
> -        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> -            error_setg(errp,
> -                       "Either I or E extension must be set");
> -            return;
> -        }
> -
>          if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
>                                  cpu->cfg.ext_a && cpu->cfg.ext_f &&
>                                  cpu->cfg.ext_d &&
> @@ -610,6 +597,19 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_ifencei = true;
>          }
>
> +        /* Do some ISA extension error checking */
> +        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> +            error_setg(errp,
> +                       "I and E extensions are incompatible");
> +            return;
> +        }
> +
> +        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> +            error_setg(errp,
> +                       "Either I or E extension must be set");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>              error_setg(errp, "F extension requires Zicsr");
>              return;
> --
> 2.17.1
>
>

