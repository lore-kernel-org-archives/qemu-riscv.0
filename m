Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ooC0S-0007RM-V0
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 19:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ooC0R-0007RA-Qq; Thu, 27 Oct 2022 19:09:47 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ooC0P-0003kU-77; Thu, 27 Oct 2022 19:09:46 -0400
Received: by mail-pf1-x436.google.com with SMTP id d10so3254299pfh.6;
 Thu, 27 Oct 2022 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CpcmgDljznbEuECx79wDHdpCI1KBI6CJPnorIT788PI=;
 b=Qxc4oZ4r1UjLwATWpAJN5moOmbSS4LmLn1GG/mzrTcOtbEXCiCIJ0BAIwNyquo4owu
 haWTJMy/T+S2cDsy77q0RaBD/KUEPdhUAhs2jUjoBqU50HzvExYgVq/AW+uISE3Dz0nF
 Ncmtigl4Qn2y/vN0QhR0zr9GvbhxbUCLIm666+nsrqg7IL4umK/Yuq6mdL5n6pCkPr3K
 g+86rlLAuEVPUNYSIf8XXG/yu5WuNRFP/QCxpQwGdrH3SV8/rabSCBhy6JBOuCp65XQ7
 +oqzNXAWubZu/10GjEVeOrdVp8NCjvRccw2MyszK14RDy/lnVyP2R7WNuEnz59YUSezq
 pCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CpcmgDljznbEuECx79wDHdpCI1KBI6CJPnorIT788PI=;
 b=MG5iRw1yDkOL6M1etgCrmApWFIn3Vwr8W4VQLJpJI2PfXmIDx7vQjXgYEEywuFLiky
 z/vlKmpWZJrFz/v7QKNh7sTQ8AzO3xxb/grTdyVY7q9hx0Ifk1TKBb6w+0MmgdbSAWOu
 Dfm+xRcax1eZCnCfY9/fdH6nJ98FXd5Sug//Znz+iwnYPQyVeJSbktV9BZtwU7zEm9e6
 Qm85RiDdNlu1+L2Jjff6D/EOhikwjSgf/JqY9duA6kZGuOHLfSlaDMO79xVZh3+7P1Xm
 AEBM58T2oi715Qu92RsILPE+GezWY61ZD5+1bJWZl9OGEkjiTAW8r7CHu2PCA62ken1j
 Treg==
X-Gm-Message-State: ACrzQf088lttpaH4FMYz1WWON2Nsn6vL+Dn2b83vuCsCM415W8rvE2Y/
 AGeC7FPgaROCJEU0T0e5gXpgLMgSfQ8+Ev0gxpc=
X-Google-Smtp-Source: AMsMyM6l4NVvM4cb6F0yxcvltauJzMNce23flJZDaM7Z6SBU9sbfK/duLYJJ3ZjDulUNic178ROaCM1rjAQ0cr80D5Q=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr43870616pgi.406.1666912183127; Thu, 27
 Oct 2022 16:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221027054649.69228-1-mchitale@ventanamicro.com>
 <20221027054649.69228-3-mchitale@ventanamicro.com>
In-Reply-To: <20221027054649.69228-3-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Oct 2022 09:09:16 +1000
Message-ID: <CAKmqyKPVbujUa96C_8Lrk_EmZxTuheeQ0QUkRo4yzC1bnuRMgA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] target/riscv: Extend isa_ext_data for single
 letter extensions
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Thu, 27 Oct 2022 23:09:48 -0000

On Thu, Oct 27, 2022 at 3:50 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Currently the ISA string for a CPU is generated from two different
> arrays, one for single letter extensions and another for multi letter
> extensions. Add all the single letter extensions to the isa_ext_data
> array and use it for generating the ISA string. Also drop 'P' and 'Q'
> extensions from the list of single letter extensions as those are not
> supported yet.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 41 +++++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e6d9c706bb..35320a8547 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -41,8 +41,6 @@
>                               (QEMU_VERSION_MICRO))
>  #define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
>
> -static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
> -
>  struct isa_ext_data {
>      const char *name;
>      bool multi_letter;
> @@ -71,6 +69,13 @@ struct isa_ext_data {
>   *    extensions by an underscore.
>   */
>  static const struct isa_ext_data isa_edata_arr[] = {
> +    ISA_EXT_DATA_ENTRY(i, false, PRIV_VERSION_1_10_0, ext_i),
> +    ISA_EXT_DATA_ENTRY(e, false, PRIV_VERSION_1_10_0, ext_e),
> +    ISA_EXT_DATA_ENTRY(m, false, PRIV_VERSION_1_10_0, ext_m),
> +    ISA_EXT_DATA_ENTRY(a, false, PRIV_VERSION_1_10_0, ext_a),
> +    ISA_EXT_DATA_ENTRY(f, false, PRIV_VERSION_1_10_0, ext_f),
> +    ISA_EXT_DATA_ENTRY(d, false, PRIV_VERSION_1_10_0, ext_d),
> +    ISA_EXT_DATA_ENTRY(c, false, PRIV_VERSION_1_10_0, ext_c),
>      ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
>      ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
>      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
> @@ -1182,16 +1187,23 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> -static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str)
>  {
>      char *old = *isa_str;
>      char *new = *isa_str;
>      int i;
>
>      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_edata_arr[i].multi_letter &&
> -            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
> -            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> +        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
> +            if (isa_edata_arr[i].multi_letter) {
> +                if (cpu->cfg.short_isa_string) {
> +                    continue;
> +                }
> +                new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> +            } else {
> +                new = g_strconcat(old, isa_edata_arr[i].name, NULL);
> +            }
> +
>              g_free(old);
>              old = new;
>          }
> @@ -1202,19 +1214,12 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
> -    int i;
> -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
> +    const size_t maxlen = sizeof("rv128");
>      char *isa_str = g_new(char, maxlen);
> -    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
> -    for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
> -        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> -            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
> -        }
> -    }
> -    *p = '\0';
> -    if (!cpu->cfg.short_isa_string) {
> -        riscv_isa_string_ext(cpu, &isa_str, maxlen);
> -    }
> +
> +    snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
> +    riscv_isa_string_ext(cpu, &isa_str);
> +
>      return isa_str;
>  }
>
> --
> 2.34.1
>
>

