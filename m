Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU3Iy-0008Ea-EH
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 05:17:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU3If-0008AT-VW; Tue, 15 Mar 2022 05:17:13 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=46819
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU3Id-0001sD-Tn; Tue, 15 Mar 2022 05:17:05 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id v130so35987337ybe.13;
 Tue, 15 Mar 2022 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WwTQC6D2AuSvCpcEgQ7AAKx0A3TtU+GGVuL7qKhGurU=;
 b=JeU1DAMvVWt5LqGoYJ3pKaF1T/cCYnTK+k7b/MTh52yZufCmECJ1yl65m9tWgXMR8I
 Wpa31S9k/1ALapI5QhIyi7J3K46SxGQnwzowvrIca7Bw6FriBRR/loI3BhKB1HPp/WD5
 0cQtSfPmdWlaA8o14VbU/oCRtd0GFFu5AVWOcYmqqPY6WgILvB7VdCZ0KfKm673u0BG/
 0uc9B/2VJ3j6vInzRVa2ELzbgdx2pL/TQTt2q8UKXHzCqz4sxqh5TQKymp/FBChhjfNK
 MaMJz2brP1EMIII9OlQuA/FetvTBZzqGfPyxnBlEVlC3n8KD5Ya+iW95NsOOWARpbQkS
 utAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WwTQC6D2AuSvCpcEgQ7AAKx0A3TtU+GGVuL7qKhGurU=;
 b=IBLCmP9PoK7gxnIrC2ZCEQvciAU9ONrNx8pzYmG0RjhKBcG6TJed0PfNK5FGQieAfL
 xSreUWvxHbaGuZKQTkhF1dgqjdbhIlxOoyHjtKZRBj4wD28wfc4cGSoFqgNnBwY7e3g0
 BO47vExhrn28RQFcTsweK5RqUWki8mY1inScM3oIJ4zcEWaIdfas0QDH2/9Iq1Adiexf
 EkNHESlkJ331Waa2PXeykv+bAERZv/2xCqgKl00TAWfhw0JuKfIOtSYogmkMXMt/9Rcw
 e0LnP5wT4isrE+tcpVvt7O/MCzpgfz34lllhGI19BDCpneQvB9Kzy2kFFXVfDHyqqYX1
 Oe+A==
X-Gm-Message-State: AOAM530gpovp9FORDCstvdD6gFp+n9dneooFgJMafyl9TRD8E1pbIkvm
 CvWxCFBKuiAx6SUvcR18p5FAk45JmW8pRLaTHP0=
X-Google-Smtp-Source: ABdhPJxThw3NtYsBkjDy7qkWvAVUWAvXXSAzQy2YrdItbZWx9ujxaHPqVtKPk6sGfGFMEOGDJIXfp3UB2U0foCPwfqc=
X-Received: by 2002:a25:fd4:0:b0:628:f1b9:cf1e with SMTP id
 203-20020a250fd4000000b00628f1b9cf1emr22359124ybp.104.1647335822045; Tue, 15
 Mar 2022 02:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220314234250.846613-1-atishp@rivosinc.com>
In-Reply-To: <20220314234250.846613-1-atishp@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Mar 2022 17:16:50 +0800
Message-ID: <CAEUhbmUt2=RCQTLPA-G65Gs_D42ExncXcO2JJ1WCnov69kdQ+A@mail.gmail.com>
Subject: Re: [PATCH v5] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Tue, 15 Mar 2022 09:17:16 -0000

On Tue, Mar 15, 2022 at 7:43 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> property. It used to parse only the single letter base extensions
> until now. A generic ISA extension parsing framework was proposed[1]
> recently that can parse multi-letter ISA extensions as well.
>
> Generate the extended ISA string by appending  the available ISA extensions

nits: remove one space after "appending"

> to the "riscv,isa" string if it is enabled so that kernel can process it.
>
> [1] https://lkml.org/lkml/2022/2/15/263

Could you please post a link to the "riscv,isa" DT bindings spec or
discussion thread? It seems not mentioned in the above LKML thread.

>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
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
>  target/riscv/cpu.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ffb7..097c42f5c50f 100644
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
> @@ -898,6 +904,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
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
> +     *    from other multi-letter extensions by an underscore.

redundant "from other multi-letter extensions"

> +     * 2. The first letter following the 'Z' conventionally indicates the most

Should this be lower case "z"?

> +     *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> +     *    If multiple 'Z' extensions are named, they should be ordered first
> +     *    by category, then alphabetically within a category.
> +     * 3. Standard supervisor-level extensions (starts with 'S') should be

lower case "s"?

> +     *    listed after standard unprivileged extensions.  If multiple
> +     *    supervisor-level extensions are listed, they should be ordered
> +     *    alphabetically.
> +     * 4. Non-standard extensions (starts with 'X') must be listed after all
> +     *    standard extensions. They must be separated from other multi-letter
> +     *    extensions by an underscore.
> +     */
> +    struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zfh, ext_zfhmin),

This should be (zfh, ext_zfh)

> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx),

Should "zdinx" come before "zfinx" *alphabetically* ?

> +        ISA_EDATA_ENTRY(zba, ext_zba),
> +        ISA_EDATA_ENTRY(zbb, ext_zbb),
> +        ISA_EDATA_ENTRY(zbc, ext_zbc),
> +        ISA_EDATA_ENTRY(zbs, ext_zbs),

I don't understand why "zb*" come after "zf*". Alphabetically they
should come before.

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
> @@ -910,6 +970,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>      return isa_str;
>  }
>

Regards,
Bin

