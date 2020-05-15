Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZSPp-0002ox-7x
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 00:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jZSPk-0002oc-Ul; Fri, 15 May 2020 00:57:40 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:43096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jZSPj-000527-M0; Fri, 15 May 2020 00:57:40 -0400
Received: by mail-yb1-xb41.google.com with SMTP id x15so473287ybr.10;
 Thu, 14 May 2020 21:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bKn+wsq4po6gMpjcAIXmJcXZFiNqYGm/uNedUncYflw=;
 b=dPkxk81c30hkMGKe1eswxMbx16wCzglb6kDuDiqSPHDgZx4V/VAuKf5JuA9gVcQ9qx
 WN0WqPlrhLkYJRCs8qPdxBPdyvuQUjSbzl4o0TSQcDLSEtyhwJuQUARGVWkAq9oXmuHq
 dmCH6IUkQ/AIJjga6/AnPvkV6jEe+QfYr6i25Ny98Ep70pQ3jb1AVWeJTk2ob88RoktH
 S8PVAGzJPHKUZkG7PfKg1YoCAU5nhVgpvbAL8OFdB065xKbyTHIZh8IWtWT63kOmz8wj
 iJ3Tj4gnUDXhadcAMTzOsLxCygvwoWb7bEMv8sqtui0oPQzQW9oOCXH/1DDeCdNrKOvY
 4u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bKn+wsq4po6gMpjcAIXmJcXZFiNqYGm/uNedUncYflw=;
 b=TGc94OPesNKIDZoDxkjfYKuE46ruX0ClKzBCsTqrRHEouptVJWr1+1m0dv8O8kZ5p5
 QWOu0qFiaypk/TgaZkOSPOMS/XGcRtpLey3PeLN/v9evO15Gs7OTpFH6CbPMEzZUyqlQ
 K4gVU0+pCZLNU0y3G1zHNcgXthDAtMQm+S09X7uGfD1Zofca55xDOAnUP650e8egtoYV
 lrocKJMmy5CJIJ/mvYCczA3bpSPIOAu9QVOvdXtv7l2sf2fewKaYqyV2TRufI2OpolYc
 6DVgl4AYpzdW2RW973WXMplX99rTNGXAQCz1OLgviiu1BktCGOZxQgDpFZd+Fkkxgjm/
 HXNQ==
X-Gm-Message-State: AOAM532loWgkr/37BVFFukiHaiohJqt7XzHinSj6D7sCGu1wS8PQ5i9U
 t9lMegYqYdGOqjCjpRCbaFiVs+Wh45EHefUAYqE=
X-Google-Smtp-Source: ABdhPJxIJFABeitB6m65hsBkSmq09HnNvl4GF7bHt5rkA+x9+j16p+JwnUVrqrIapHoxjIB1zbw30q0MmTlEquvz7iQ=
X-Received: by 2002:a25:7a06:: with SMTP id v6mr2775157ybc.152.1589518658590; 
 Thu, 14 May 2020 21:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588878756.git.alistair.francis@wdc.com>
 <698e2a1723bbf04ffa941450f7a351397bcec789.1588878756.git.alistair.francis@wdc.com>
In-Reply-To: <698e2a1723bbf04ffa941450f7a351397bcec789.1588878756.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 May 2020 12:57:27 +0800
Message-ID: <CAEUhbmWJ0TsPnCUtawfpXm=N=qX+X=Fby0r9WeufN8TD31=3_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] target/riscv: Add the lowRISC Ibex CPU
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 15 May 2020 04:57:42 -0000

On Fri, May 8, 2020 at 3:23 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>

Please include some commit message to have a brief introduction of this new CPU.

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 10 ++++++++++
>  target/riscv/cpu.h |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8f837edf8d..235101f685 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -160,6 +160,15 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
>      set_feature(env, RISCV_FEATURE_PMP);
>  }
>
> +static void rv32imcu_nommu_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV32 | RVI | RVM | RVC | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_resetvec(env, 0x8088);
> +    set_feature(env, RISCV_FEATURE_PMP);
> +}
> +
>  static void rv32imacu_nommu_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -620,6 +629,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
>  #if defined(TARGET_RISCV32)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base32_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32imcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_init),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d0e7f5b9c5..8733d7467f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -35,6 +35,7 @@
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> +#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>  #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
>  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
> --

Otherwise, looks good to me.
Reviewed-by: Bin Meng <bin.meng@windriver.com>

Regards,
Bin

