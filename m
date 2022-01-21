Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAhuk-0007ae-QB
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 19:36:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhui-0007WH-Vx; Thu, 20 Jan 2022 19:36:25 -0500
Received: from [2607:f8b0:4864:20::d35] (port=40953
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhuS-0000dd-73; Thu, 20 Jan 2022 19:36:13 -0500
Received: by mail-io1-xd35.google.com with SMTP id y22so9033172iof.7;
 Thu, 20 Jan 2022 16:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dJzYJBKxaH3jse+NNY/Wn7tGNaLcOG8hc1vU2e4pX24=;
 b=WPikDWuXLhK4czUSo5rIuuc2SijATWPsrvZ9d53LSa0BrjVvf+xond6SLmeCY6Zp09
 W052JHVunzHRQFLWh+hbu0LhADNuk5mq/GiJ4PmWlVmGdIo4rpvMgeIMMyMJe384QhyU
 ZVBM4czhKS/An5UfLHx51FNP8JD5sfq+KuM9YvjGJ4AtOcXR9MUQyO9kGl8CnQAZw0xs
 gvfhU5vt8D1TniV7JFceXDYuBJEhxvlRbJj8sgpE7Q479XOkX3g+DnVA4bFUzixjE8yz
 1h6kLerZG5aF7Hh5MZLVP4jYWBrnMXyD64OqFwpDmH2AzghALsj4Rc0dgbPjvLvAjHpA
 ZYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dJzYJBKxaH3jse+NNY/Wn7tGNaLcOG8hc1vU2e4pX24=;
 b=7UaZZVLZ6v20kAZqfAY6yJ9k32HsJ8cb4ikQ6WovjzmpsnnfHw0mNBT2r0FEypZKmo
 TCqOjxaieXxrbqUIcNRjKux+wh4BDUeGZHhxEEa2x5b9Tp3owCoeVTXwgGmdOr5MZ9+d
 j9liAL79VduOKJqd7I71hSkGmzW2uO9B6wZJD7gQsbJ8q3zZgfpiP4y0AWU97bV5p1I7
 LuYdYs1C+nF9MZGJpGgjI2JHQFC038m+Un3aESTCbUYDv5Gs1tHZmOrt4JiZId7fDdIf
 qQpPV680ozotKGBBow+46MNWpE8c50ZoJ/pI8RgUrrJr/oc0ROW0dIsH28XFVcj4ZKXF
 RMkA==
X-Gm-Message-State: AOAM530tVWLtpNyUd18RBIUD4+VEv/50536nBEEq1bXh8Kpzus066JFF
 j/R8Ssq+MN1+kkfUp9Qv58fY89Z0WDhOa1aLMf4=
X-Google-Smtp-Source: ABdhPJzjkWIgjzCzLhewpisZp+i0kZJ/jTmfDvnknlRunZvd9aAH8xXqTaeMeekD/7guzToSmLGgqYRd/h8W9+47srw=
X-Received: by 2002:a05:6602:1548:: with SMTP id
 h8mr729311iow.91.1642725351686; 
 Thu, 20 Jan 2022 16:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
 <20220119113754.20323-15-liweiwei@iscas.ac.cn>
In-Reply-To: <20220119113754.20323-15-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 10:35:25 +1000
Message-ID: <CAKmqyKM_rj9N4O2057KxApMymApRC7wtiFCaunJkj3n3bqZmhg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 14/14] target/riscv: rvk: expose zbk* and zk*
 properties
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 21 Jan 2022 00:36:25 -0000

On Wed, Jan 19, 2022 at 11:09 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b487a8282c..04e8e8d3c6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -694,7 +694,20 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> +    DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
> +    DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
> +    DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> +    DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
> +    DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
> +    DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
> +    DEFINE_PROP_BOOL("zkne", RISCVCPU, cfg.ext_zkne, false),
> +    DEFINE_PROP_BOOL("zknh", RISCVCPU, cfg.ext_zknh, false),
> +    DEFINE_PROP_BOOL("zkr", RISCVCPU, cfg.ext_zkr, false),
> +    DEFINE_PROP_BOOL("zks", RISCVCPU, cfg.ext_zks, false),
> +    DEFINE_PROP_BOOL("zksed", RISCVCPU, cfg.ext_zksed, false),
> +    DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
> +    DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
>
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> --
> 2.17.1
>
>

