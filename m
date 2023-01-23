Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJuQ6-0006hw-3Q
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 05:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJuQ2-0006ha-2p
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 05:51:19 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJuPz-0005G8-KW
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 05:51:17 -0500
Received: by mail-ed1-x52e.google.com with SMTP id y19so14072162edc.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=miSzRVihC966WmBKDzYaDj+suthG1DiOvuoQ8KvQmwY=;
 b=X4/LDyEUNDhvkVho+MySA0RPrClLon30CLeVTmIe6be7WOiFeG8Nw7hJVRwx9WZQTY
 z0I7ANe6S1QWy73IlHdaFfTJ1dVywhcjNrUXEvuB7Gj7CAWjJueQfsstAfI7cB+ehf8e
 yLX6xFU0Sr/SeGX294OJ3UDWsySPV10thU2BqciWKXaIGmmZTGszPAaWyXLMxY5lbC5k
 BKy5d0hbnhWzLS5abfaqCYZQMkAadCymnFH3M1iPysgmQY/T967vF9uIQ6pEdauu+wYF
 MVI8D3rvGs+0niapZTYc9F7wQU7GXoEofSV3Ya5PDyw7OM8vvuMfx2IwEemyC+Pw4Zx4
 3qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miSzRVihC966WmBKDzYaDj+suthG1DiOvuoQ8KvQmwY=;
 b=1S3sNpYUkrqAkVOTG7O+pq8yljJ35/Aeyluss2NV56i6hRnzUCP/ZyTSq4D2XDozBn
 k3su6ac7o2GSKSb/FtTeulgExliSUAKhQU6UzciGN0iemYx+K0/5qBbLENw4CYs4p0wJ
 nz6FU/KuO4Gt1et/ScA/LMSiJL//8s3iHn21iY4kK772xWtU87u6edoSbHUo+G8XDs/o
 SxGPWL0onb6h/uzd+XRIKWPsCnEHGkPIrLp6OVROMTVGcmkSNjURQaePn/5rSa/8Dh2q
 nKNxCRpKA4gtAJjRjIUmF6pso3hDn6kV1qy0jkJAjKXN41gCeilVw+2mhCOINU2YOQqN
 DHnA==
X-Gm-Message-State: AFqh2ko3TO807fx5B4wSCHITwvHMDUCj4/s32XgQE2Ku3eExB2FEySwu
 5rAGt7U2OAa/AEJHUWOZ+nTsQg==
X-Google-Smtp-Source: AMrXdXvXULPuOZ9+/WhCEd/NURJSFRmBDg5ypj6ZY5rAasW7wvoDoVAoN2lrgPdvQ1dkNGJn7HV04Q==
X-Received: by 2002:a05:6402:27d3:b0:499:b3db:6aa3 with SMTP id
 c19-20020a05640227d300b00499b3db6aa3mr31394664ede.1.1674471073772; 
 Mon, 23 Jan 2023 02:51:13 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 h29-20020a50cddd000000b0049ea1214087sm4076981edj.73.2023.01.23.02.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:51:13 -0800 (PST)
Date: Mon, 23 Jan 2023 11:51:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 5/5] riscv: Introduce satp mode hw capabilities
Message-ID: <20230123105112.zidabgiswkpnzo5r@orel>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-6-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123090324.732681-6-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 23 Jan 2023 10:51:20 -0000

On Mon, Jan 23, 2023 at 10:03:24AM +0100, Alexandre Ghiti wrote:
> Currently, the max satp mode is set with the only constraint that it must be
> implemented in qemu, i.e. set in valid_vm_1_10_[32|64].
> 
> But we actually need to add another level of constraint: what the hw is
> actually capable of, because currently, a linux booting on a sifive-u54
> boots in sv57 mode which is incompatible with the cpu's sv39 max
> capability.
> 
> So add a new bitmap to RISCVSATPMap which contains this capability and
> initialize it in every XXX_cpu_init.
> 
> Finally, we have the following chain of constraints:
> 
> Qemu capability > HW capability > User choice > Software capability

                                                  ^ What software is this?
                         I'd think the user's choice would always be last.

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  target/riscv/cpu.c | 78 +++++++++++++++++++++++++++++++---------------
>  target/riscv/cpu.h |  8 +++--
>  2 files changed, 59 insertions(+), 27 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e409e6ab64..19a37fee2b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -292,24 +292,39 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
>      g_assert_not_reached();
>  }
>  
> -/* Sets the satp mode to the max supported */
> -static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> +                                        const char *satp_mode_str,
> +                                        bool is_32_bit)
>  {
> -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> -        cpu->cfg.satp_mode.map |=
> -                        (1 << satp_mode_from_str(is_32_bit ? "sv32" : "sv57"));
> -    } else {
> -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> +    uint8_t satp_mode = satp_mode_from_str(satp_mode_str);
> +    const bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
> +
> +    for (int i = 0; i <= satp_mode; ++i) {
> +        if (valid_vm[i]) {
> +            cpu->cfg.satp_mode.supported |= (1 << i);

I don't think we need a new 'supported' bitmap, I think each board that
needs to further constrain va-bits from what QEMU supports should just set
valid_vm_1_10_32/64. I.e. drop const from the arrays and add an init
function something like

 #define QEMU_SATP_MODE_MAX VM_1_10_SV64

 void riscv_cpu_set_satp_mode_max(RISCVCPU *cpu, uint8_t satp_mode_max)
 {
     bool is_32_bit = cpu->env.misa_mxl == MXL_RV32;
     bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;

     g_assert(satp_mode_max <= QEMU_SATP_MODE_MAX);
     g_assert(!is_32_bit || satp_mode_max < 2);

     memset(valid_vm, 0, sizeof(*valid_vm));

     for (int i = 0; i <= satp_mode_max; i++) {
         valid_vm[i] = true;
     }
 }

The valid_vm[] checks already in finalize should then manage the
validation needed to constrain boards. Only boards that care about
this need to call this function, otherwise they'll get the default.

Also, this patch should come before the patch that changes the default
for all boards to sv57 in order to avoid breaking bisection.

Thanks,
drew

