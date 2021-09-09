Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mODny-00039x-77
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 02:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mODns-00039K-0e; Thu, 09 Sep 2021 02:44:56 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:38569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mODnp-0004Th-Hk; Thu, 09 Sep 2021 02:44:55 -0400
Received: by mail-il1-x133.google.com with SMTP id q14so865103ils.5;
 Wed, 08 Sep 2021 23:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DDQ0EThc9ASWUZNDSePEbXxCzJUcY5rZO40hBVDPFYM=;
 b=BldaILAjAnXGCWG4JV3jVdTh4bi5gv2QUbzN0n+ycL5fT1NgslKTIxrKx2bHBDMH11
 GcosmXE7bdPMJwGDUZLbN/9tw27HuahCHeWqOX/+AHsUEhMHNLYcxvokVX3YWl30pnjz
 poCQBZzmlmjMgoLc2Z5Qvyqigta8/wDGEuOUflND6nrSgbvaKAwAZJzVZfOSBxsx8Weq
 9TFMQOryypYKaZRYfTdFmELgfBlDV593+HcePKFV3YunmE6By4jp8pym6l8D1C5YCn/A
 i8A3vASEQfau1YWkSwOMWqM6RDkRixyJQQ3l/tmZ8My2nMrwxJqKrAGU0OscIdZ+tu9I
 EJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDQ0EThc9ASWUZNDSePEbXxCzJUcY5rZO40hBVDPFYM=;
 b=o6+PhNvAdtj+Rm+rF2uB7P2Gk1ZDNhJPuA2USBMAl6/7RBZTuNIblP8lnYlCDXi3sb
 RPIGRfZaOkdVSQ6OGYSBEX9xA7czMtoM92mMJF2Dv1IZu5zjBEeGvLAiRykVkxQigcVW
 ueXQZLYWtrsBjRa5f7gSycGhSwWgXQQOzfDATDwLrcUuNIfrL7ZcY081xP2WGanlPRhe
 InN960iVyZOtUJwMLOV/9x1E7nFQozIuuxc6xA+JC0ZupmYVB78SUyw7OSEZcTr2jGvr
 SKYofNgCFgvFD9y1qdrmlSGiY9rQUBBWrKpYTi4ChyrogEoLUBQCKDMvzWcC+b5XMBFA
 ZPUw==
X-Gm-Message-State: AOAM531Me1Qyy0hfquV5ymD4kP6qhvj8XVxBpgL/qjbmO8etaOPGdvUY
 VGURW6RaGD+FUYjqiJys0jFj1Lm15UdQktmoZNc=
X-Google-Smtp-Source: ABdhPJxzYvb0+C21WrWNYqsoc+YJyqrFTBMI5imC9FigkGjH6UK9Axds/nAipcOmaRMd14EgGEZafn8NCrzjUBRs+BU=
X-Received: by 2002:a92:730c:: with SMTP id o12mr1228907ilc.208.1631169891970; 
 Wed, 08 Sep 2021 23:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-5-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-5-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Sep 2021 16:44:25 +1000
Message-ID: <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] target/riscv: Improve fidelity of guest external
 interrupts
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Sep 2021 06:44:56 -0000

On Thu, Sep 2, 2021 at 9:26 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The guest external interrupts for external interrupt controller are
> not delivered to the guest running under hypervisor on time. This
> results in a guest having sluggish response to serial console input
> and other I/O events. To improve timely delivery of guest external
> interrupts, we check and inject interrupt upon every sret instruction.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/op_helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index ee7c24efe7..4c995c239e 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -129,6 +129,15 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>
>      riscv_cpu_set_mode(env, prev_priv);
>
> +    /*
> +     * QEMU does not promptly deliver guest external interrupts
> +     * to a guest running on a hypervisor which in-turn is running
> +     * on QEMU. We make dummy call to riscv_cpu_update_mip() upon
> +     * every sret instruction so that QEMU pickup guest external
> +     * interrupts sooner.
> +     */
> +     riscv_cpu_update_mip(env_archcpu(env), 0, 0);

This doesn't seem right. I don't understand why we need this?

riscv_cpu_update_mip() is called when an interrupt is delivered to the
CPU, if we are missing interrupts then that is a bug somewhere else.

Alistair

