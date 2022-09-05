Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oV78s-0005JM-PA
	for mharc-qemu-riscv@gnu.org; Mon, 05 Sep 2022 04:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oV78i-0005HF-WF
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 04:07:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oV78g-0001c7-As
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 04:07:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id k9so10253165wri.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Sep 2022 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=mRqKkNje44YjNWjFFz7pRsbcWPxHg7oWMzFcs8sXuAg=;
 b=ZcjFUwi7VqjAz5rmZyF/Ls7lZY/EXzikQ/TYlc1qBEkVv4aZtmdCjr/hMtTFk94hPe
 klywVCGQbA0Q4uR+212b0WSxDDwjLvZjomq9O9arn90XL/WUVt5bpW2pJI5YaOz1az6C
 ONjfVBVny1lKB0aQ69NBahizGym/TvRUgr61ewvkLN310LHNgplf2WgNqnrdrxlMZf+Y
 xdJ+ev/lWNIyH+q0O2Pjkh6KMeDn48TU5dNbhaanKducReWxK3lX2WZI11shP4cUxeer
 41c3DFimnEQfZdf6HLL5uLgDtDNN6swlG+FP9LHUJXln62SaNSOty3tpdjPywFZ316yl
 x+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=mRqKkNje44YjNWjFFz7pRsbcWPxHg7oWMzFcs8sXuAg=;
 b=jyZx+Ljn0n39Gg199vMPzMTmGRlhkvu/JvERgfcxA02TCbh/oCLODI5d3k0mY+87VY
 gEedqi6cR0CbTcpNdB9WVTD8xq0zdLW10ULL4YGNgM2FOwq4UH3EZtjsrV9H67SIvyUp
 hc7SXHCdEqVqNgBikUtr+IqNSqh5GmcUkOCvwyhP+qjUm7KnvY+OnbwDeWOSZYO7st56
 MvJMiYaSJgK4CS6gJXKCR9QIXlaYz1Szsh6aygcbOsz3g/hM0LNlBcCokBU7yKiYJZjo
 fwj3dIiPwdT5yoCv8aMwWIX/+PGKRCe38kWzoW88XvPc8PMjKigoZ9vho+teFaeUyMnz
 juSQ==
X-Gm-Message-State: ACgBeo1jKnh5hjFjwmzaf/XY0lHNXMcsnkrbWR4pd/ZrSCZ7FMXxfWiN
 cv7LutOefLGRBGKRt/fGtnCVfA==
X-Google-Smtp-Source: AA6agR4JxCIZBmZnJxck0n5vAUYqPw4ngquFw4ulFfq6RFugMcWT90zlUC6uyj/vQ6+jucl/eYA/Xw==
X-Received: by 2002:a5d:4fcb:0:b0:225:6361:bafe with SMTP id
 h11-20020a5d4fcb000000b002256361bafemr22531823wrw.585.1662365244270; 
 Mon, 05 Sep 2022 01:07:24 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 n189-20020a1ca4c6000000b003a5c244fc13sm16984924wme.2.2022.09.05.01.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 01:07:23 -0700 (PDT)
Date: Mon, 5 Sep 2022 10:07:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH] hw/riscv: virt: Enable booting S-mode firmware from pflash
Message-ID: <20220905080648.7wyzlk6fhwlxytze@kamzik>
References: <20220905042940.146913-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905042940.146913-1-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Mon, 05 Sep 2022 08:07:37 -0000

On Mon, Sep 05, 2022 at 09:59:40AM +0530, Sunil V L wrote:
> To boot S-mode firmware payload like EDK2 from persistent
> flash storage, qemu needs to pass the flash address as the
> next_addr in fw_dynamic_info to the opensbi.
> 
> Update the kernel_entry with the flash address when no kernel
> is specified via QEMU command line  so that opensbi
> can jump to the flash address. This assumes flash drive unit 1 is
> used to keep dynamic payload similar to other architectures.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ff8c0df5cd..1ee855fded 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1284,6 +1284,18 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
>  
> +    if (drive_get(IF_PFLASH, 0, 1)) {
> +        /*
> +         * Assume second pflash unit (unit=1) to hold the S-mode firmware
> +         * like EDK2. Set kernel_entry to flash address if kernel argument
> +         * is not set and pflash unit 1 is configured.
> +         */
> +        if (!kernel_entry) {
> +            kernel_entry = virt_memmap[VIRT_FLASH].base +
> +                             virt_memmap[VIRT_FLASH].size / 2;
> +        }
> +    }
> +
>      /*
>       * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
>       * tree cannot be altered and we get FDT_ERR_NOSPACE.
> -- 
> 2.25.1
> 
>

Hi Sunil,

We should ensure we can use both edk2 and the '-kernel' option. For
example, guest installation will typically do direct kernel boot,
and when it's desired / necessary to boot that kernel with ACPI, then
we'll also need edk2.

Thanks,
drew

