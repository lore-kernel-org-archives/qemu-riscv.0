Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqoe2-0008Es-FL
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 00:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqoe0-0008Ed-K5; Tue, 17 May 2022 00:17:12 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqodx-0002UM-LJ; Tue, 17 May 2022 00:17:11 -0400
Received: by mail-io1-xd29.google.com with SMTP id e3so18084271ios.6;
 Mon, 16 May 2022 21:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=opo+3PkpkIGvb7zSFtXJ2p1GRpQWiC7EAr5006228Jc=;
 b=MCSClYLSLga3VVHD+ieoRzKBp25tjF8dv4rbjT5pyZNwdLVWJ/qzm41THtMZxTJwLz
 csoT6vTsrq6RmA9SI0VhW7sGZ5BcrnaK9M0zvPmwLrhEyz5EBBrnuICjx0pZ3Emnlt63
 X295grfE4IUwXOebhDAnDB/g9hVr9PL0tl0dsYlAHKXdmk8+/mSME0yYJBRl8FPM2j5G
 szfNf0sIdam3ohlwQhy3uZyRf5/1tcQwxcCEHANHrYnOif/wi8XEdWVpr+rhgZAWT8x5
 AqHyYVxQE3eJAqE/s4zk8U2xmNEZdnIV6Z/1C0FTh+o5tmw/4e/BA9jwplXhgYrBRNla
 jjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=opo+3PkpkIGvb7zSFtXJ2p1GRpQWiC7EAr5006228Jc=;
 b=pKTX+ZHSrSAb2zDiWQb3z36x57D0nQJJAKuh8yZEW67ZAubuKAQKhYkqJngFG26KD1
 upO75Y/jKJw9Isfu2gWSoEYdLra3MMt1XpDuK6ZJCS0IFkjDRBBBU+5TBwYBowCBEn6u
 W8ftycKDDOj7Ey6JBT8TrOIywyZFsOrqzZ8IEt+a0yDf+15OAcGTvS6sLnebeefyt6Ew
 LRhdnnRe6jc1QctEJWUqrYN2Rws2t3yPk2Zyob+hOqEaNQnADuBAFgBut6VfxCsgiXXA
 eO7vI/zSE0qcjtUfLCWKXrzhJYl87jGd+Ey+scF3stWmbsHAxlfJt4PxhlxXQg1dtcHB
 bP3w==
X-Gm-Message-State: AOAM533jF+QEnEOXk2/BaD/MfSk+4iC/ZJ/rHBj8vOz17Z8mMuPmpevD
 XKLiPSWhgaoP+7LosIPvi/vnDGPtaU2xySN0Rgk=
X-Google-Smtp-Source: ABdhPJyGpzsP4mZlqlA5XgkFcThWkxlqEbzbnU6q4/V2J4kS3DivepWbKmXrDD9o+8qPPsISP+uLV4c20vEWkAI20pQ=
X-Received: by 2002:a6b:e406:0:b0:657:baed:ec0b with SMTP id
 u6-20020a6be406000000b00657baedec0bmr9640330iog.27.1652761027998; Mon, 16 May
 2022 21:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220517021907.10060-1-liweiwei@iscas.ac.cn>
 <20220517021907.10060-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220517021907.10060-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 14:16:41 +1000
Message-ID: <CAKmqyKNzfDxNbk6G-fURk-wXygU6z_GgjVFnKc0JdsptZHLkSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: disable zb* extensions for
 sifive/ibex cpu types by default
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Tue, 17 May 2022 04:17:12 -0000

On Tue, May 17, 2022 at 12:21 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - properties for zb* extensions are enabled by default which will make sifive/ibex cpu types implicitly support zb* extensions
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b12f69c584..e205be34e9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -176,6 +176,10 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);

This is very error prone. I think we should either disable the
extensions by default, then enable them for the rv32/rv64 CPUs, or
instead do something like this:
https://patchew.org/QEMU/20220517041100.93045-1-alistair.francis@opensource.wdc.com/

Alistair

>  }
>
>  static void rv64_sifive_e_cpu_init(Object *obj)
> @@ -184,6 +188,10 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>  }
>
>  static void rv128_base_cpu_init(Object *obj)
> @@ -211,6 +219,10 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>  }
>
>  static void rv32_sifive_e_cpu_init(Object *obj)
> @@ -219,6 +231,10 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>  }
>
>  static void rv32_ibex_cpu_init(Object *obj)
> @@ -228,6 +244,10 @@ static void rv32_ibex_cpu_init(Object *obj)
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>      qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>  }
>
>  static void rv32_imafcu_nommu_cpu_init(Object *obj)
> @@ -237,6 +257,10 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      set_resetvec(env, DEFAULT_RSTVEC);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>  }
>  #endif
>
> --
> 2.17.1
>
>

