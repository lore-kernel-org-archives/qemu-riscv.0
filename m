Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9g2i-0001TZ-OT
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:24:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9g2h-0001So-4j; Mon, 17 Jan 2022 23:24:23 -0500
Received: from [2607:f8b0:4864:20::129] (port=36491
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9g2f-0003w1-PI; Mon, 17 Jan 2022 23:24:22 -0500
Received: by mail-il1-x129.google.com with SMTP id z17so14535175ilm.3;
 Mon, 17 Jan 2022 20:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c+7g/vYDa4f8jnVeHDJjMCYYIKcHKdcBrMxetG5o6q8=;
 b=HxmHdcIqASPIWjOIe46sLaWDv5vNDpTP6kJkjEuPH2gsYhunCQoPKtuBBu1r9pQlKb
 8Z5wAb/aeAYyhvtk6xZrKMfqKxbja7CkandCBDj8xtEXZuWQ69Bl2qic9bONh9od4hjz
 u4FSSNhyeuVFB+kl9k13DEunx7tVmFY0bB5lu2mlBpDdtL4WfaWX35ZKfmV1+pvWafGq
 /N6K2SeQeKSZHF3u1FhCnz5zQsrAxSOpoCWH/hyBOW/CoFGe8IbFs5xtEJJZm/n6FAwh
 bJcn47w1GHiq7jT+zz4m4OuiyE06/mDgPodljCTLFcyaODaMjRfMg7wqVIu9tbIMaM7b
 GsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+7g/vYDa4f8jnVeHDJjMCYYIKcHKdcBrMxetG5o6q8=;
 b=SLRcK5bRWD1auE8yJEve1P5YiLX7mtwb15NjS2mq4asIQdLjTqGG7k5EAKQZ7u94i5
 LwN97TFUg9jbD5sG7tN+eaEnkp73nO2U22pW57S2WdfdG/+jpR/qcH0+yuMUNIdwzSBX
 mXxBDIgEIRHn+s6s22r0BA+lVUqR5w0p3Jc/bA9FHGKkbR0/ZyWYgyctabvDr/veUZ/O
 MQcK0vFPGUHGoIeYfbme+dumVN5UZxsTqBKGtRJ+PAeIsatPYJt8n5ZD4n8RgRSWZ5Wv
 8+xObLhujxc8JwFmMAyhq7cMFMWY/zO7rE8887V2vXFeWFsiHQ2n0r2hRBZD89zZyB8A
 WRNQ==
X-Gm-Message-State: AOAM530s8Twxb3EouVt9LxZYdtD5zNSeXTX8ZB/tdtlDY3D9J3GpMmt/
 ptHQjMzdS4M2qsosX5meNlfTaodAaot24RlObQQ=
X-Google-Smtp-Source: ABdhPJwKOHLUSb3AtG7IRpiAFJA3eWF01snZuLaNaKaDtOhQrSiIj7OrZI00bdmlNLg5ufU1TL576YF58Jnsz05tD18=
X-Received: by 2002:a05:6e02:6d1:: with SMTP id
 p17mr9625173ils.74.1642479860541; 
 Mon, 17 Jan 2022 20:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
 <20220111035124.9468-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20220111035124.9468-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 14:23:54 +1000
Message-ID: <CAKmqyKNNWDxQ_TUDgRgri3p67u6v4i3v1oV=HMicQVyqnuJ=SA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] target/riscv: rvk: expose zbk* and zk* properties
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 luruibo2000@163.com, lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 04:24:23 -0000

On Tue, Jan 11, 2022 at 1:53 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b487a8282c..628a782ba9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -694,9 +694,23 @@ static Property riscv_cpu_properties[] = {
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
> +    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),

Looks like a rebase error

Alistair

>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> --
> 2.17.1
>
>

