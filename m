Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5zj2-00072f-MR
	for mharc-qemu-riscv@gnu.org; Thu, 15 Dec 2022 20:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p5zix-00071t-Hy; Thu, 15 Dec 2022 20:41:21 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p5ziv-00084P-GN; Thu, 15 Dec 2022 20:41:19 -0500
Received: by mail-vk1-xa33.google.com with SMTP id q7so504317vka.7;
 Thu, 15 Dec 2022 17:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8z/juQoJxDOI3WKwuo6PCIYScZH/OkEYTR44zcb0XNs=;
 b=ilcjDf5168tJZGai6Ihtwxy45BSkZ3vNWf9mBgaQTDizJQUD2dcQdlnFUjXBBJeqI9
 xwKo9LzQuSfarWnhUwh+IH5exj52U/WI3EAfGXFU8xJ53++w+v+A8ZO/I/5j5JUKf/Ll
 hQhiHGpqSneU0Z1UguF0oSyjldPVBR58IE3GhQRz8IqiEncf50MzOshN4uxWhMjoMiZj
 w7H6t4GJqOaFi4JEO3AGQIu5vAPVmZVpTNiO6FsdiCIgpemLRWjqiUvKRFfBUrwm0/9l
 eBA0tR+IVPyD366niftMR5VLJGnoOC6/GohYgvrt3Vd1t5LBKIrOWjWRXDFr4f4gmjML
 6pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8z/juQoJxDOI3WKwuo6PCIYScZH/OkEYTR44zcb0XNs=;
 b=TEtv3VYh+ho80dxNag8IRA3lXdO6bBVIFhLRVGgrE/mHlOpQ2EWkNrhh+ryEbSwhN2
 ye51enTr+IAzOKk33gZKIGtyzqwH8hZQrOdmqcG3XTOvAlvVdgVSURvh6MQlOLElj3KS
 j00D3htXM+res9HAVPUjaL9VVY09c81Y6Vs01Dwde/MQZG1WITnFx9a9CKt0qrICTozj
 AKw/pwmzaX8VDe2UMukwg56A0KGzdnVncYDJaxZmMdjSn65rq9bdqj3PfOv0cIOOw46y
 X0e+tVRkg+5Xt33LVnkQu/5KQGUSqs2xGU0bTiv9FbJACddqLvNOs7tWlokVtjOGT2hn
 7zUQ==
X-Gm-Message-State: ANoB5plU8B5VYnNJkxWgK3YsAv7Sy6EGhNGTckf27UpoJfRfWzHWUcCa
 MYIgHna6ziQdndL1JdsiygZ7fglZuRVw+r0kWBA=
X-Google-Smtp-Source: AA0mqf4e7/p/ClDgPrwLrS0wkGwp2wVIXXFapVj6U54UETkTWqUoLeczFzZ712BytkBqJbOWsJmX9vo41rxF0sGYwqI=
X-Received: by 2002:a05:6122:c97:b0:3b7:cbb8:bbf1 with SMTP id
 ba23-20020a0561220c9700b003b7cbb8bbf1mr57233416vkb.25.1671154874847; Thu, 15
 Dec 2022 17:41:14 -0800 (PST)
MIME-Version: 1.0
References: <20221208145411.122799-1-mchitale@ventanamicro.com>
 <20221208145411.122799-3-mchitale@ventanamicro.com>
In-Reply-To: <20221208145411.122799-3-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 16 Dec 2022 11:40:48 +1000
Message-ID: <CAKmqyKMtKP+ED652UxME6aoAFjfuFdY+9L7RHup-C-i-=W4i2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: Extend isa_ext_data for single
 letter extensions
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 01:41:22 -0000

On Fri, Dec 9, 2022 at 12:58 AM Mayuresh Chitale
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
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

This breaks the SiFive CPUs (as well as others). A large number of
CPUs set these single letter extensions just with set_misa(), so the
cfg values are never actually set.

We probably want to add something like this (does not compile):

@@ -222,6 +225,10 @@ static void set_misa(CPURISCVState *env, RISCVMXL
mxl, uint32_t ext)
{
    env->misa_mxl_max = env->misa_mxl = mxl;
    env->misa_ext_mask = env->misa_ext = ext;
+
+    if (ext & RVI == RVI) {
+        cpu->cfg.ext_i = true;
+    }
}

Alistair

> ---
>  target/riscv/cpu.c | 41 +++++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 042fd541b4..8c8f085a80 100644
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
> @@ -1196,16 +1201,23 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
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
> @@ -1216,19 +1228,12 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
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

