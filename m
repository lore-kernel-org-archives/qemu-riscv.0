Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrTVO-0001zn-Ji
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 18:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTVM-0001ym-Tj; Thu, 10 Jun 2021 18:50:28 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTVL-0008Es-9Y; Thu, 10 Jun 2021 18:50:28 -0400
Received: by mail-io1-xd36.google.com with SMTP id f10so14328619iok.6;
 Thu, 10 Jun 2021 15:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=caH6O3cGBUHyDY5z6g/Gs+2tbRUGxNQevjD7cToIg5w=;
 b=KaWc7qFwO2avJzkEMbCQWniaz/nGIaYegh6XDzpDEMOs7L7Qna00CHp6AEM2j8lBPm
 McHgySU3IqQ0gXKQHF+YXznOmyAB4vbI0MM2U3RM93Z916cj6um+6P+J8aE1xiXaERfL
 WLVyJO6XZ612P+YY3zbL9v5mnv00V9rV+p6kCS1LrFDbQtBiJutFXExdmzCjvBI3jSsG
 gqZ8JGrLMipsyvODJTYO7rXfVMJuHgoEHSofAPVUzO35M32Mc7fg264WN/56g/0PK1WO
 8mhvgJTZXKBYyam2bXJA2ANHMaitFhpX+eZVdmKEM2W+lYYYwQbqkr56RHYq1cLOFe86
 cP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=caH6O3cGBUHyDY5z6g/Gs+2tbRUGxNQevjD7cToIg5w=;
 b=SwB6N0pRhyFREbOT88Db5wgTMPEwTU7iZUptfGFpVaRLBRO5uHQH2aKTJTAbio1opd
 qX4l6aFMJsZdIMO3sCY/LD7j7tOjIxzOfsFIPG1dfoU7SCcfEW7JeZGIA8WQKx7ZDTg9
 MwJBnxPe2H4W28gFYiA7n4kjZe3Pz7QW6VJh2r8e7TKY6vEoaCiMatElr7gvY/8sHsj8
 fSPeSq4rUTtL1kf/DfZ4xJI9UlaUojBxSWevrkisU+TVKnGFE8gtUC07UXV3ulzfq84k
 Igl27AKK0yg70wXj8X7mU/7qZVIgDmr7r54iYs4icfkW6BRxTFPJmfEjURGv8AL7bxH3
 qt2A==
X-Gm-Message-State: AOAM5321fKGd44KwXnZ80/88ugiZ/GS0CpWSs/qAcHu8urfcIZIfF/HG
 bB6yiDJ42XvrRuZ+DT85VupXCiQWIj6g9OZdUWjVBlRn5DyDe5Lg
X-Google-Smtp-Source: ABdhPJy2wKXKf5vICVmr7nBajxKjP8gMPYBVj6qLLE6Vp5NgLBNV7hU64xbeoH8wtktUo7kVaxIrlHholzQsLf0o+hw=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr831024jak.91.1623365425221; 
 Thu, 10 Jun 2021 15:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210610144424.8658-1-ruinland@andestech.com>
 <20210610144424.8658-2-ruinland@andestech.com>
In-Reply-To: <20210610144424.8658-2-ruinland@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 08:49:59 +1000
Message-ID: <CAKmqyKP4c3tXmH2WR+712ek_WT-6uNVcf+saWthkUNmH+At0_w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] Adding Andes AX25 CPU model
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 22:50:29 -0000

On Fri, Jun 11, 2021 at 12:44 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> From: Ruinaldn ChuanTzu Tsai <ruinland@andestech.com>
>
> Adding the skeleton of Andes Technology AX25 CPU model for the future commits,
> which will utilize custom/vendor CSR handling mechaism.

You are missing a SoB line.

See https://wiki.qemu.org/Contribute/SubmitAPatch for more details.

Alistair

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
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb2826a2..bff9af7f3f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -37,6 +37,7 @@
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> +#define TYPE_RISCV_CPU_AX25             RISCV_CPU_TYPE_NAME("andes-ax25")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>  #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
> --
> 2.31.1
>

