Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvsOz-0004jl-4e
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 00:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pvsOy-0004jU-5C
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 00:23:08 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pvsOw-0003SX-Ej
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 00:23:07 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1929818d7faso29371261fac.0
 for <qemu-riscv@nongnu.org>; Sun, 07 May 2023 21:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683519785; x=1686111785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pC1cFA346ZaSWuITU+3u2TusZVcnD57zyHs/5M5ckz8=;
 b=HKWRIu5aobAz5UqpPyXo7RDNEx+0h4zlWTNLVbXj/Oq8YzaMnegnRcgNinolF+kfvF
 46vh31znfPLGanrGHRUQ+HFdesHrYcOwFf+SWiNKhvD04DBsM7TDaRdCtFU91HD/+985
 KDiaTHU0gJMW7+DVzDBAL5kntf5laeK+RSISLz0Zwe3DnlwAy/3/nI+R4ToOxvqkMuxl
 x8iErWXDU9/7z41TR8MD6Q6k6LmpgAsqqySNP/F50zX0AroB/LCH2yzfnXXEt0wxPz0Z
 zMORZkXq2AKoCd+/1XKFrEPJbCo/bhuOei//oxgumZjUxttoPv2P0xC69+BBMT4OV0DT
 dgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683519785; x=1686111785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pC1cFA346ZaSWuITU+3u2TusZVcnD57zyHs/5M5ckz8=;
 b=cyVBLpxtZlngN34yejjGzFL6vfNwXHLIkpfdznV06RHq3n7RcGESxS7xh5QlsV20hR
 /uVDX2Fu3VjIOS8DXPCWAwfjjaqQXMnK4O+ul5miJE6bWfxXcZHI4aQohRazOgXrg7Sx
 Y5GTKdf15R94jfwCqLItLrvVxTQ1HPJUZjSE7bFBne9m//7ZSM195GUT5ckz2/+VcSM7
 9uhv9kbCShjMkFxzEYhQmPAH5kbo5CjDtHp3adi9feCnKdGKk8J1xUBenywaVbj8qxF3
 tca/ckL1ksRfvkp2ufglNPZcj3t04WTcsPb+Du41NvoE0tFR7pQ+c4pchZK9Ng/CYJhN
 WF1A==
X-Gm-Message-State: AC+VfDwEktpOFQWkSBqlLx8O91KS8PUIo2HpvDdYruoBEREGqIEXqNWV
 IS1kZVCW1AdG2IwfAu4gwKidDkrTGnyZkzsCRXM=
X-Google-Smtp-Source: ACHHUZ7tZE/HVm2/OdTwbXPyhp2tcVLv6luz3f+8Y97wF/VsaJN2w15T9BPY823KyheCazgJf8SQWA==
X-Received: by 2002:a05:6808:6343:b0:38e:8df7:423f with SMTP id
 eb3-20020a056808634300b0038e8df7423fmr4388774oib.5.1683519784757; 
 Sun, 07 May 2023 21:23:04 -0700 (PDT)
Received: from sunil-laptop ([106.51.189.144])
 by smtp.gmail.com with ESMTPSA id
 ex3-20020a056808298300b0037b6f5d6309sm5250512oib.2.2023.05.07.21.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 21:23:04 -0700 (PDT)
Date: Mon, 8 May 2023 09:52:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Message-ID: <ZFh5IBILrNR5WB4r@sunil-laptop>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425102545.162888-1-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 May 2023 04:23:08 -0000

Hi Alistair,

On Tue, Apr 25, 2023 at 03:55:45PM +0530, Sunil V L wrote:
> Currently, virt machine supports two pflash instances each with
> 32MB size. However, the first pflash is always assumed to
> contain M-mode firmware and reset vector is set to this if
> enabled. Hence, for S-mode payloads like EDK2, only one pflash
> instance is available for use. This means both code and NV variables
> of EDK2 will need to use the same pflash.
> 
> The OS distros keep the EDK2 FW code as readonly. When non-volatile
> variables also need to share the same pflash, it is not possible
> to keep it as readonly since variables need write access.
> 
> To resolve this issue, the code and NV variables need to be separated.
> But in that case we need an extra flash. Hence, modify the convention
> such that pflash0 will contain the M-mode FW only when "-bios none"
> option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> This enables both pflash instances available for EDK2 use.
> 
> Example usage:
> 1) pflash0 containing M-mode FW
> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> or
> qemu-system-riscv64 -bios none \
> -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
> 
> 2) pflash0 containing S-mode payload like EDK2
> qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
> or
> qemu-system-riscv64 -bios <opensbi_fw> \
> -pflash <smode_fw_vars> \
> -pflash <smode_fw_code> \
> -machine  virt
> or
> qemu-system-riscv64 -bios <opensbi_fw> \
> -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=0 \
> -drive file=<smode_fw_code>,if=pflash,format=raw,unit=1,readonly=on  \
> -machine virt
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> The issue is reported at
> https://salsa.debian.org/qemu-team/edk2/-/commit/c345655a0149f64c5020bfc1e53c619ce60587f6
> 
> The patch is based on Alistair's riscv-to-apply.next branch.
> 
> Changes since v1:
> 	1) Simplified the fix such that it doesn't break current EDK2.
>
Could you please help reviewing this patch? This was sent when you were
out of office.

Thanks,
Sunil 
>  hw/riscv/virt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..ca445d3d02 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1296,10 +1296,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          kernel_entry = 0;
>      }
>  
> -    if (drive_get(IF_PFLASH, 0, 0)) {
> +    if (drive_get(IF_PFLASH, 0, 0) &&
> +                 machine->firmware && !strcmp(machine->firmware, "none")) {
>          /*
> -         * Pflash was supplied, let's overwrite the address we jump to after
> -         * reset to the base of the flash.
> +         * Pflash0 was supplied with "-bios none", let's overwrite the address
> +         * we jump to after reset to the base of the flash.
>           */
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
> -- 
> 2.34.1
> 

