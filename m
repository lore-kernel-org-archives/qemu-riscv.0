Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOajr-0002r7-9a
	for mharc-qemu-riscv@gnu.org; Fri, 10 Sep 2021 03:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mOajp-0002nX-Dy; Fri, 10 Sep 2021 03:14:17 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mOajo-0002eD-09; Fri, 10 Sep 2021 03:14:17 -0400
Received: by mail-yb1-xb33.google.com with SMTP id m70so748851ybm.5;
 Fri, 10 Sep 2021 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ewDObw0xECGvPql45OOKD/CRzfS5SJ3fo/mR8I/BC1A=;
 b=EdkT4gizzr3BPWrZPwmuTTzpCbujpQUHSr4ea0m2X8jiOK04BhTmXxyAX6vGXVWUvR
 /hqNygnApRuID7odnjk6eFDs2a6hdmX5bAq+vBnrlJLE2srcsKoro7wE2LOufCje78to
 3OY+5ZF32w7sKvmd6fnh0bN8ntmhRiNhk7GpYbF7JEROKvQ6L3MqiSJTzNkqnckRpduZ
 z/52BUfeUE0QyC3iwwZlO/6PUMy1FtWFS7WvbMigQ12rE5qQHj7LDy1LlZpc6jKlLCYh
 57E0wrkaS9dMw9y+ddCIrKuUNZxSFi55CXCpEVhGy0HfrjvkSuSO/db01vUZGQl1quw8
 WISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewDObw0xECGvPql45OOKD/CRzfS5SJ3fo/mR8I/BC1A=;
 b=gB2WBm1hfmYzwUtkuoHlYP5GlAwRc0b4J0rX8amG3F9J83mGef0KkMw0OuzRs2N+FN
 mGQPKmbM7woYM3Zu2KyexWqTQ5aGtLpVIuT9LZe4lFvFABI5+BFc1HCJIf5CNFqGDlHR
 37YWSmuJRJJnH5/4ye31aMVQh52ENrCBwoSZ6aKhJrOVN77l/fzpXr3iyLn5xS6hcIJb
 Pb+/M6e0g8wjnHRTrziwM2oqP9gyg6TamuB+HRfL5RYqbC6WIGMi9EJoZYYsZ5tf07W6
 Ia/OUElQY59/I4Z9JV+nve71ELAFO0wzr9IBnMepRlhKMJ69i7SMrXm+AszbBlkt8NYt
 hRSA==
X-Gm-Message-State: AOAM533XaRZHS1HiL8Z8y+yezCJRuc2hiqWN8lerbAidoJaqXdybeuC9
 9XMUHWt+Z0kfYQpemG/uPd8E7iHiFKkwAeUia/Q=
X-Google-Smtp-Source: ABdhPJwn0WkFqYaWlMLuwx7shWgmWepfxVHVPHMTwje1lae74qMqEsBZljxbNtW5NO2Mx2ADTkm3zuS4B+VPRI12mj4=
X-Received: by 2002:a05:6902:120a:: with SMTP id
 s10mr9042568ybu.293.1631258054084; 
 Fri, 10 Sep 2021 00:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
 <20210909190033.1339448-8-space.monkey.delivers@gmail.com>
In-Reply-To: <20210909190033.1339448-8-space.monkey.delivers@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 10 Sep 2021 15:14:02 +0800
Message-ID: <CAEUhbmU1mM54yUzXHY4yo0D4MnnHgNgKRhyd8XhrO17Jvt-oRw@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] [RISCV_PM] Allow experimental J-ext to be turned
 on
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 10 Sep 2021 07:14:17 -0000

On Fri, Sep 10, 2021 at 3:13 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f5fdc31fb9..4a1dd41818 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -582,6 +582,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              }
>              set_vext_version(env, vext_version);
>          }
> +        if (cpu->cfg.ext_j) {
> +            target_misa |= RVJ;
> +        }
>
>          set_misa(env, target_misa);
>      }
> @@ -616,6 +619,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> +    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),

nits: please put "x-j" before "x-v", by following the alphabetical order

>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

