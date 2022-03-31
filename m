Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZiLe-0004Lv-FV
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 20:07:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZiLc-0004Gp-6q; Wed, 30 Mar 2022 20:07:32 -0400
Received: from [2607:f8b0:4864:20::d2f] (port=33488
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZiLa-0006QN-6A; Wed, 30 Mar 2022 20:07:31 -0400
Received: by mail-io1-xd2f.google.com with SMTP id z6so26820172iot.0;
 Wed, 30 Mar 2022 17:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3lHSZaSH+nNQElAsR6cuLvTayZRbDbpHOuBabB1AyBk=;
 b=AEXqgEJ52zVB8mQKVv5QdNW6wsLXMkHhxS20iOIrAD6NtOj1mc9uBPrY+Zyag025c4
 bmyjMoO7bmc+SjkG6MQvk7w8O/30ZWWM/iZjR4CaW7rtKRXUTq1llWtxvjgGXTB+bOGj
 UGFdJ1/7uU/Qr26I7OkVTV5VcD4suKzbeXlOfZPTQxh8TB4xaMP5DkTUCLOeBGiJ5jzd
 L8hcwtG+Vs8SwxQLTfuuBsnde8684DR8yin7hg581w8t79Eis6M8Z0pb99OrJN5t71q2
 X0vQOSBKN8KCAAPG8TIPQHh2abM3bYY2eM8v8oiFFKXYey4QR7X3mnixwSiLmuJxAtVy
 HNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3lHSZaSH+nNQElAsR6cuLvTayZRbDbpHOuBabB1AyBk=;
 b=aEknOxSk2ZxOGwBd67Xhi4b9/U6fMDOIUVxwzLvFSbqaLFZXBqmqD31bpiln8b4Bjq
 sVNkYEdVl7XRa7ExmB41Q+OGXwzejfPLuD9TRYpicjYX+7fkB0J+5Lw0KCpBncFpCz8T
 vD8XfhuIRq8ymFXRt+KlKGflwoAD8QRN7WQnykQkC8QW8wH0gF/xaS92SUn/CQx2cupH
 aXaiCU2+5cwgKr9UQA9ywGsDf4mCufzWP4ZusIJmvTCLuoxZkfGR+ILlzg6YMip1YYKy
 S+GnuoazRe0ptIO99ffbwthcAeIrj9INDzWbROPhGvGgDxYIk14Ts3coRt3qJF749AyG
 YF+A==
X-Gm-Message-State: AOAM532Bd4y4VHv77ltIcd+vc06DLWIm2IFhF+jQ78i5/6N5ZWGLHEbh
 elXMliAxwe7BSPAt2AVeGOQ67qIbCaD2T/GH5cI=
X-Google-Smtp-Source: ABdhPJyv6Zv6tfYTccdP8ztViJhnq3wSIJ1LLNI1fg+g11z45jxysq47LcbPpywaS3D03Tx+QMmd1Bfe05IrSVJsXIk=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr13293461iov.93.1648685248631; Wed, 30
 Mar 2022 17:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220329195657.1725425-1-atishp@rivosinc.com>
In-Reply-To: <20220329195657.1725425-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 10:07:02 +1000
Message-ID: <CAKmqyKNb0wrFNDR7s=5D4YdQN2K0zaQapb3usWwVBgQnZ5=ymQ@mail.gmail.com>
Subject: Re: [PATCH v7] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Frank Chang <frank.chang@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Thu, 31 Mar 2022 00:07:32 -0000

On Wed, Mar 30, 2022 at 5:59 AM Atish Patra <atishp@rivosinc.com> wrote:
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
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
> Changes from v6->v7:
> 1. Fixed indentation and typo.
> 2. Added Reviewed-by tags.
>
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
> index 198274fb34e5..86e48ff54dd1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,11 @@
>
>  /* RISC-V CPU definitions */
>
> +struct isa_ext_data {
> +    const char *name;
> +    bool enabled;
> +};
> +
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
>  const char * const riscv_int_regnames[] = {
> @@ -920,6 +925,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
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
> +     * 1. All extensions should be separated from other multi-letter extensions
> +     *    by an underscore.
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
> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> +        ISA_EDATA_ENTRY(zba, ext_zba),
> +        ISA_EDATA_ENTRY(zbb, ext_zbb),
> +        ISA_EDATA_ENTRY(zbc, ext_zbc),
> +        ISA_EDATA_ENTRY(zbs, ext_zbs),
> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
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
> @@ -932,6 +991,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>      return isa_str;
>  }
>
> --
> 2.25.1
>
>

