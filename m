Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nN6Ue-0002Wr-5N
	for mharc-qemu-riscv@gnu.org; Thu, 24 Feb 2022 00:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nN6Uc-0002WT-I3; Thu, 24 Feb 2022 00:16:42 -0500
Received: from [2607:f8b0:4864:20::12f] (port=47018
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nN6Ua-0002Fu-UT; Thu, 24 Feb 2022 00:16:42 -0500
Received: by mail-il1-x12f.google.com with SMTP id y5so865985ill.13;
 Wed, 23 Feb 2022 21:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IJ/uvy+ww0R6it1WI/gBZ5V1QrY4fHT8Ge4yp2ivhqs=;
 b=X9iZ1ZZQFULyWPK7fOmL9T8BSXoLt4j9Oy5Ef0DAoZgmmFK2cSJwlgIBC4n6TKWht2
 Z1WADD9u2V62MWAEOclmgjtlWvtAOj0/fl6WFBrgkVErMox4gbKANF1cT3PLjBHfX82e
 UO9mdX9APA5uwqnDz3X7hrNLcDeL4w8nPdORkPtDVHFU6yoIRDE+PMaTb4MMtUBZGhKk
 Z0A/UMa5e6U4tEQF2/HCXzXdLn/8LGh/XOTk55bM2wlz2IKex4qJsklBIXrh1FDmJOqm
 gdx9p2mj7APTlZ/H+vqPgJvl2krwL3X2K4Dz/p2/0oXbDREniwGV6FRJyBmv1jJELvic
 FzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IJ/uvy+ww0R6it1WI/gBZ5V1QrY4fHT8Ge4yp2ivhqs=;
 b=5C+jB8x5mu0f5f5v8AKMb0jn/X8GjvjAvDfc1MN2+upO31XH1gHqWIfGPie6mkyc9j
 w4jxqstDRfCcO2Z+JQ2ftcBRzoqDQytOCnkKJoxH+dLHKCSkEL0d0tDMVW/oVCQ5j8GH
 +3FM/haf3MAnyZAyCANIj4SKFkE+tBIhM4h5ZLeK1EUUDABg0mmw3gXT+6VxAXazfT0q
 ha6xxd1rVA/7305VSK56phlhN2jin/eQwaAmoHN6EX72vVf0pYmsxdazr2aQDPG9H+YL
 RxHds9W8or8PSRpUCxsrgcp4zxJxFtgRBZZB+EVdChUkAP88ql9chIT19mY9N72BXOoG
 ywzA==
X-Gm-Message-State: AOAM533ECTCG2XIAxVdnLYwInkwtJAnJOsPhVrI0dnW8SFDBIeNFujpZ
 3ET54VnrmXUg0SFdthollHnL5hcaGsnqiCB5gXw=
X-Google-Smtp-Source: ABdhPJzgVj1uVZWUOIjZA5LtPrAkpYC0IqksXgDZHV9mMfWvY1htXx/CoNh4U845CMqk7cEwPqHsa8jyVRjvH9CTS34=
X-Received: by 2002:a92:ca4b:0:b0:2bf:20a9:d19c with SMTP id
 q11-20020a92ca4b000000b002bf20a9d19cmr907628ilo.260.1645679799125; Wed, 23
 Feb 2022 21:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
In-Reply-To: <20220222223830.2319856-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Feb 2022 15:16:12 +1000
Message-ID: <CAKmqyKPOGM_V68J06igOZOT6p+9kPU+SY-L_1q_ZyXtYasYZHw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 24 Feb 2022 05:16:42 -0000

On Wed, Feb 23, 2022 at 8:39 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> property. It used to parse only the single letter base extensions
> until now. A generic ISA extension parsing framework was proposed[1]
> recently that can parse multi-letter ISA extensions as well.
>
> Generate the extended ISA string by appending  the available ISA extensions
> to the "riscv,isa" string if it is enabled so that kernel can process it.
>
> [1] https://lkml.org/lkml/2022/2/15/263
>
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes from v2->v3:
> 1. Used g_strconcat to replace snprintf & a max isa string length as
> suggested by Anup.
> 2. I have not included the Tested-by Tag from Heiko because the
> implementation changed from v2 to v3.
>
> Changes from v1->v2:
> 1. Improved the code redability by using arrays instead of individual check
> ---
>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b0a40b83e7a8..2c7ff6ef555a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,12 @@
>
>  /* RISC-V CPU definitions */
>
> +/* This includes the null terminated character '\0' */
> +struct isa_ext_data {
> +        const char *name;
> +        bool enabled;
> +};
> +
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
>  const char * const riscv_int_regnames[] = {
> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> +{
> +    char *old = *isa_str;
> +    char *new = *isa_str;
> +    int i;
> +    struct isa_ext_data isa_edata_arr[] = {
> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
> +        { "svinval", cpu->cfg.ext_svinval },
> +        { "svnapot", cpu->cfg.ext_svnapot },
> +    };
> +
> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_edata_arr[i].enabled) {
> +            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> +            g_free(old);
> +            old = new;
> +        }
> +    }
> +
> +    *isa_str = new;
> +}
> +
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
>      int i;
> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>      return isa_str;
>  }
>
> --
> 2.30.2
>
>

