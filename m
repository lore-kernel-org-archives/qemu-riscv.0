Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrU0V-0001Vd-1w
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 19:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lrU0T-0001Ux-04; Thu, 10 Jun 2021 19:22:37 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:43762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lrU0Q-0003HO-BS; Thu, 10 Jun 2021 19:22:36 -0400
Received: by mail-yb1-xb32.google.com with SMTP id b9so1670751ybg.10;
 Thu, 10 Jun 2021 16:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J5M73s/PDH+0AeamuOPaF28gVKDEqhCMz3AOY2J7RtI=;
 b=JomCL2EOJTRsWvT/rDWvH8eYMW3olVYUzkd0JrkktoeglNR7HDXztbgap2FK4HAFVk
 Yvn666oubIoOvH8eUYiIuDPq2xSHQKLg2i/C8Z3xdQVM15UF07C4LPYBOjKKzakQvf96
 km1OYsVgADLYuTfFR+mNfP04fGDsKjYT/X4tSOWQ/ysa7ybVSklZp4DFCnTNq+R5yrzs
 e2T5X7NDvzR2fEcX4UIW+qg9dlmxENkT/7yM3D0Y3/RdCriGOTF2T4CO649r+qjW0WVx
 jGEF2FE4AMthoSVb1MM5NLimWsK/9dJHbTx6INAd/syKsXsjjDJlCOMK3StDuioje6d/
 GjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5M73s/PDH+0AeamuOPaF28gVKDEqhCMz3AOY2J7RtI=;
 b=T8XIp1drnyZxNuTvAkmLINKVzDIZMU+2UqrGyeb+utr+xcifgckt94f8e74E/+JDWi
 Z5TjErXUiu89VUzRrzKBNWA+T1eRDtQFAIV1I5vHbGAsv1Bq2VJX5hwMggUIT+75MqIv
 E2H35pQiVL7GPS7He2z/3zKiEC+xGr/QPIJnRrowjhM40EvUXvP7xUyB8xXZvWzaHw7J
 WoIRtPOqMxDuFCkqoNS5Igwue+g/LejeN48CeekA1tUnv1ekaTw/hrAUdc7Gg69O/lWc
 b/W/G1qjKJ7HX0Yh4O/M8T7W1DyI+x8FaZVPoG9ZOgMBvrlw26eO8zJFcvGShfe/8X41
 lB/A==
X-Gm-Message-State: AOAM530LbVlCosQ7tqCRy+2cyO3wo9ma1EQQ6QQNoWbpZbgAbzfOEICh
 d6uidp4oY6kjxq/VVuFm41agYqGl5VKE9v5+47E=
X-Google-Smtp-Source: ABdhPJzRWul8SmEklfm7Cb4UJA6iuhuCuqqUuivVRB+Ms9OvkQIWRRsPfVHam6BcFmNf1StMQcZ1v4KZScxCDaVaCZE=
X-Received: by 2002:a25:be09:: with SMTP id h9mr1794973ybk.239.1623367352668; 
 Thu, 10 Jun 2021 16:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210610144424.8658-1-ruinland@andestech.com>
 <20210610144424.8658-2-ruinland@andestech.com>
In-Reply-To: <20210610144424.8658-2-ruinland@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 11 Jun 2021 07:22:21 +0800
Message-ID: <CAEUhbmVJCLU1EmO4taMpGbVbsdrZyH9CRd-esMj6k9nh2aFH+g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] Adding Andes AX25 CPU model
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Dylan Jhong <dylan@andestech.com>, Alan Kao <alankao@andestech.com>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 23:22:37 -0000

Hi Ruinland,

On Thu, Jun 10, 2021 at 10:45 PM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> From: Ruinaldn ChuanTzu Tsai <ruinland@andestech.com>
>
> Adding the skeleton of Andes Technology AX25 CPU model for the future commits,
> which will utilize custom/vendor CSR handling mechaism.

typo: mechanism

> ---
>  target/riscv/cpu.c | 8 ++++++++
>  target/riscv/cpu.h | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddea8fbeeb..4ae21cbf9b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -159,6 +159,13 @@ static void rv64_base_cpu_init(Object *obj)
>      set_misa(env, RV64);
>  }
>
> +static void ax25_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +}
> +
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -705,6 +712,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_AX25,             ax25_cpu_init),

What about the 32-bit variant of A25, and the SMP variant of A25MP/AX25MP?

Also how about the latest A45 (RV32) and AX45 (RV64)?

How should we name these? I think we may need to name this using the
SMP variant name, no?

>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>  #endif

Regards,
Bin

