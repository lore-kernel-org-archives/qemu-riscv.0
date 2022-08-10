Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLkwl-0001n0-MT
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 08:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkwU-0001jf-LX
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:36:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkwT-0004VY-0r
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:36:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id h13so17607145wrf.6
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 05:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=lCNEjUUOL+K7ivB3Bsp5vnl640q/xKKPyEI979dGd7E=;
 b=Q5muJBqAiD0aaRMbnHFR3339WU1V+ABAzWuc9rnhShfqfe2qNBFBmJaLZQe9PIHXN+
 xsvESEEbf9woe7sXaa9E278h0rfmGRZW08inLt0WanABBE7hzi0w0huivhFesv4LZhab
 C/AI0QDiXj/rffzqO4Qfsbjm2adPrAycIoshbTGjkw+/7HJGxaB5/SUPkAnPgsXPfL/t
 GVRb35ERN7YRXNlDAZr1jZVFBNRCbUQP3Df6sfcb2QwipZz5c8o2ugwRmBUqmqwDZ3O3
 uo0bk1NU2qRrxKTx66H23+88YclFDRd6wrCz0x9i7gqkYyKnLbUHsoMMyNldlTy4wxVY
 FBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lCNEjUUOL+K7ivB3Bsp5vnl640q/xKKPyEI979dGd7E=;
 b=e5RguRM5ebWVmJakWCMSP9hc/Fd+qTTLPJl1/UBaiymvLWw7lNYnl1YW9s3RdHSY9a
 aDA0L4cpts1TywjrNSBsY+juZP4BDihaFJ7uDn4ZMkMH5binnToMDsKbrT9/rAgFWMYV
 QPyiL0wNr0fz/oB12GXhd7jYmXyCvahTb5V+5bMS+m7jCewK2BQ1V8sAcqGdzKIwKOxL
 sJzcKhYDjAlgmx3eLuxYXStppFgB7LuOZuLjvRuzSw5gIRcxAhTN+CvXs4blXza5UnuA
 YoAJNzIrVUsU1fm6x2HC1wjJP2pwgLT6rmIwYqvJF4NuLwuykrEJWbBXkXVqVoT+ivWz
 oUCA==
X-Gm-Message-State: ACgBeo23pxtJxSbCf8oNFJKFdXaQPLqquMWEt/O8rB9mPGj00B+Wwzbp
 VxFku45kZK6P7x3va5ogaWaIPA==
X-Google-Smtp-Source: AA6agR50pYc9bHOOV1lJUVQSI4uq6FtXjf3S+pj7YFSEwZvi0yzCIQGuC2Z/NWak3Ms80YeMvmgm3g==
X-Received: by 2002:a05:6000:985:b0:223:8131:e1f4 with SMTP id
 by5-20020a056000098500b002238131e1f4mr1500759wrb.65.1660134967617; 
 Wed, 10 Aug 2022 05:36:07 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 j42-20020a05600c1c2a00b003a30c3d0c9csm2628871wms.8.2022.08.10.05.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:36:06 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:36:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 5/6] hw/mips: use qemu_fdt_setprop_strings()
Message-ID: <20220810123605.rsn4vjduxxyd7zln@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-6-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-6-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Aug 2022 12:36:12 -0000

On Tue, Aug 09, 2022 at 07:56:39PM +0100, Ben Dooks wrote:
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/mips/boston.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index d2ab9da1a0..759f6daafe 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -515,9 +515,6 @@ static const void *create_fdt(BostonState *s,
>      MachineState *mc = s->mach;
>      uint32_t platreg_ph, gic_ph, clk_ph;
>      char *name, *gic_name, *platreg_name, *stdout_name;
> -    static const char * const syscon_compat[2] = {
> -        "img,boston-platform-regs", "syscon"
> -    };
>  
>      fdt = create_device_tree(dt_size);
>      if (!fdt) {
> @@ -608,9 +605,8 @@ static const void *create_fdt(BostonState *s,
>      platreg_name = g_strdup_printf("/soc/system-controller@%" HWADDR_PRIx,
>                                     memmap[BOSTON_PLATREG].base);
>      qemu_fdt_add_subnode(fdt, platreg_name);
> -    qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible",
> -                                 (char **)&syscon_compat,
> -                                 ARRAY_SIZE(syscon_compat));
> +    qemu_fdt_setprop_strings(fdt, platreg_name, "compatible",
> +                             "img,boston-platform-regs", "syscon");
>      qemu_fdt_setprop_cells(fdt, platreg_name, "reg",
>                             memmap[BOSTON_PLATREG].base,
>                             memmap[BOSTON_PLATREG].size);
> -- 
> 2.35.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

