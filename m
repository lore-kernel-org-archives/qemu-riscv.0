Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUhGk-0002tb-O8
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 23:57:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nUhGi-0002t1-PG; Wed, 16 Mar 2022 23:57:44 -0400
Received: from [2607:f8b0:4864:20::1134] (port=36261
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nUhGg-0001p6-Vg; Wed, 16 Mar 2022 23:57:44 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e5a8a8c1cdso36625637b3.3; 
 Wed, 16 Mar 2022 20:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVOHmxiVQqBe5dGpnBVqUhETt8NzSW+qKwcjjvV/dgY=;
 b=KQYY6qWIheo1KWXDFj+13ul12oZmrLOgD2Ne/BAKi1q3HMvO/HdDDeuaz0OaiWUzLU
 /fwDtei5Zzg4FjZYBJ3wwsf36u1Dq5tA6cGNANJIJ5qytmGzLK7RFLTo5sbcG/iXt2Zx
 KqWZnFxI7FtpIWmzdaqFoP9589bVypfR/Dbm/4jrRFMku4o8Wzgbovq9aWfl50UAfqYb
 ZwtSOJMbDpXDKfnuPmUCL15kfifvCUIRnLO2ChOupQIr7QfNjYrmvFXKL0erMAuBXK4n
 XweoNhYs9NlE8LgW3zoEaqy2rMV7jTUhBiusoQWpJ6pOzO5AX5qJsuY5mu512ZW/LtqG
 iC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVOHmxiVQqBe5dGpnBVqUhETt8NzSW+qKwcjjvV/dgY=;
 b=eBHQo6yvcDrQicaW897G5IDoHHG5U6ch3kQ0ICOtzfvnV2Yp/PVUyuoL9L9YxDMeAx
 zhPdARmL99XlLoVXjIvvWWqbN/s7JWCspmj2lQnx4FG5+mBS96XqUhbWJOWZxvjZG36H
 VaqiVJWp/NJhEd3aMS30CBTqe2zhbbHSrZvX5N0NNm7/iEb9nmxgzP90qr/YfsWWzQab
 UCGUxa8w7IH4KXxeQAwLYHerqaRAvhnVueyf/8P2cW9C4zzJJUNm0gcCeG3ApogPHCsT
 50UlhzgQBomvez+zwYbYXGAWFODz2nuXuZl+c+/IsyGXSKkgAYxUZs7Zw3n+wrP87ofF
 a1ng==
X-Gm-Message-State: AOAM533oZCAum8jgTI5EfCwv6ah4so7cU0w80NlMvla0MIJTrLq5TGXF
 iR4h9yg8wBL3/IoGXDYIbbqpeC9OcGAqkzN/0QA=
X-Google-Smtp-Source: ABdhPJyXJ56o8odvu1sIFa0yHES0zd/30012w/TKnYyshm9r5iAJmyENnw4mw/mM8JNGXFdYa+PdoBiKkRtZEnZU5mM=
X-Received: by 2002:a0d:edc7:0:b0:2d8:2ec:2e87 with SMTP id
 w190-20020a0dedc7000000b002d802ec2e87mr3694771ywe.209.1647489461468; Wed, 16
 Mar 2022 20:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220316175759.821785-1-atishp@rivosinc.com>
In-Reply-To: <20220316175759.821785-1-atishp@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Mar 2022 11:57:30 +0800
Message-ID: <CAEUhbmVXC-EdyjxQLsi3EGZ04D27azyKBkF4QtsDaiBHJgyXyA@mail.gmail.com>
Subject: Re: [PATCH v6] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 17 Mar 2022 03:57:45 -0000

On Thu, Mar 17, 2022 at 1:58 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> property. It used to parse only the single letter base extensions
> until now. A generic ISA extension parsing framework was proposed[1]
> recently that can parse multi-letter ISA extensions as well.
>
> Generate the extended ISA string by appending the available ISA extensions
> to the "riscv,isa" string if it is enabled so that kernel can process it.
>
> [1] https://lkml.org/lkml/2022/2/15/263
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Changes from v5->v6:
> 1. Improved commit message.
> 2. Fixed a typo for Zfh.
>
> Changes from v4->v5:
> 1. Fixed the order of Zxx extensions.
> 2. Added a comment clearly describing the rules of extension order.
>
> Changes from v3->v4:
> 1. Fixed the order of the extension names.
> 2. Added all the available ISA extensions in Qemu.
>
> Changes from v2->v3:
> 1. Used g_strconcat to replace snprintf & a max isa string length as
> suggested by Anup.
> 2. I have not included the Tested-by Tag from Heiko because the
> implementation changed from v2 to v3.
>
> Changes from v1->v2:
> 1. Improved the code redability by using arrays instead of individual check
> ---
>  target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ffb7..937ccdda997b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,11 @@
>
>  /* RISC-V CPU definitions */
>
> +struct isa_ext_data {
> +        const char *name;
> +        bool enabled;
> +};
> +
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
>  const char * const riscv_int_regnames[] = {
> @@ -898,6 +903,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> +#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> +
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> +{
> +    char *old = *isa_str;
> +    char *new = *isa_str;
> +    int i;
> +
> +    /**
> +     * Here are the ordering rules of extension naming defined by RISC-V
> +     * specification :
> +     * 1. All extensions should be separated from from other multi-letter

redundant "from"

> +     *    extensions by an underscore.
> +     * 2. The first letter following the 'Z' conventionally indicates the most
> +     *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> +     *    If multiple 'Z' extensions are named, they should be ordered first
> +     *    by category, then alphabetically within a category.
> +     * 3. Standard supervisor-level extensions (starts with 'S') should be
> +     *    listed after standard unprivileged extensions.  If multiple
> +     *    supervisor-level extensions are listed, they should be ordered
> +     *    alphabetically.
> +     * 4. Non-standard extensions (starts with 'X') must be listed after all
> +     *    standard extensions. They must be separated from other multi-letter
> +     *    extensions by an underscore.
> +     */
> +    struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zfh, ext_zfh),
> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> +        ISA_EDATA_ENTRY(zba, ext_zba),
> +        ISA_EDATA_ENTRY(zbb, ext_zbb),
> +        ISA_EDATA_ENTRY(zbc, ext_zbc),
> +        ISA_EDATA_ENTRY(zbs, ext_zbs),
> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> +        ISA_EDATA_ENTRY(svinval, ext_svinval),
> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
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
> @@ -910,6 +969,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>      return isa_str;
>  }
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

