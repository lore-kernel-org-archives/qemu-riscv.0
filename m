Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK7I4-0007OY-L6
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 19:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK7I2-0007Nj-Or; Mon, 23 Jan 2023 19:35:54 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK7I1-0007Jd-6S; Mon, 23 Jan 2023 19:35:54 -0500
Received: by mail-ua1-x935.google.com with SMTP id u29so2396766uaa.8;
 Mon, 23 Jan 2023 16:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iKGy/WFeY2rJTk2S9uoVm6D99IT95wU7r4H/zpY7XQU=;
 b=LkQ4R+xpBjtZU0pJjPvhK00OOKxwsRUlRdPDMGlUIEZB++yWqxcZTOqixgfzDXUX63
 T+G7ieecBhi1cpEG4+z9woQumfWg258+Dvq1j3MCV9n+lZpa0P+SBM7SeAnDjoK8Flr4
 R+KgM5O77PWP8gN3K8bsmMKE45yR/ydAlv4Caw0b3hz2RfrpRGhKuS49nR7uNWZOurCR
 gYQXgEVy9C9fwJ6ijyzQrUMuswEZD0YO1vzUH92Ash82q4JLt2SQtRZZ+WZcf6ERgCMC
 Hy1JZL/QB4fnAjjhO3ErD5HlwpnsROnWUdVC3AQU+zLk+fF5+eicOQB9SRARvLpQ6jOJ
 sSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iKGy/WFeY2rJTk2S9uoVm6D99IT95wU7r4H/zpY7XQU=;
 b=HXrEc8tuaxjRegEASYbGFr1ETIr/W7aQ+eDdTK6chx2hWYXV7/x5E4BWSD1kALUAkx
 lavqtl/NRBD8FrpOLC9H8MKbfKeJrwp2Ycz2XbGemEEUIrr4IKbp/4MIAehMiFMPHv34
 r2yFBzkhxZlFDdpTBJHALwOMODmnLBI3ErNXhAwe/knsyzthHKXsODVdVx+jYkWY+qYh
 1LeFNySxEHMExjSH6rRpV2WP1vtgRSvdZyj9SQwZeoUpNskVruVOu/Mr8gvVFkqi76Xf
 L8w9DFJRWVgj6xexqOJ2YwGAuyolc74J8fN6tfCVRxdx3ubOiIxkD7dTJcbF0+9CPWLW
 178w==
X-Gm-Message-State: AO0yUKVvY9IGhgikY27/c0Tg5eYKX8phvTQt5b7H9x1R+jpahp66SYVg
 sG7KAatBeeUAAcyEy5VAahaVVNgt2FULyqiN3O4=
X-Google-Smtp-Source: AK7set+a+UGvbUe9KEDJLQfs3Id0uc8HQz3FPM5iTWl7w6umGLG7djDsreGALSXsMF2Vo8FmKrzPXRf8OqkeUcdeZlA=
X-Received: by 2002:a9f:3e0c:0:b0:653:32f1:db47 with SMTP id
 o12-20020a9f3e0c000000b0065332f1db47mr62770uai.70.1674520551650; Mon, 23 Jan
 2023 16:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-5-alexghiti@rivosinc.com>
In-Reply-To: <20230123090324.732681-5-alexghiti@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 10:35:25 +1000
Message-ID: <CAKmqyKMDsgG8vWtadkq706qbJzGbmrbOm-GpmfqGX_q3DpcY4g@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] riscv: Correctly set the device-tree entry
 'mmu-type'
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 00:35:55 -0000

On Mon, Jan 23, 2023 at 7:08 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> The 'mmu-type' should reflect what the hardware is capable of so use the
> new satp_mode field in RISCVCPUConfig to do that.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 94ff2a1584..48d034a5f7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *mc = MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name;
> +    uint8_t satp_mode_max;
> +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
>
>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>          cpu_phandle = (*phandle)++;
> @@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    "riscv,none");
> -        }
> +
> +        satp_mode_max = satp_mode_max_from_map(
> +                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
> +        sv_name = g_strdup_printf("riscv,%s",
> +                                  satp_mode_str(satp_mode_max, is_32_bit));
> +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> +        g_free(sv_name);
> +
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> --
> 2.37.2
>
>

