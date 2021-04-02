Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJVI-0005Uj-5j
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 09:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lSJVG-0005TP-Sy; Fri, 02 Apr 2021 09:06:22 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lSJVF-00067H-Cg; Fri, 02 Apr 2021 09:06:22 -0400
Received: by mail-io1-xd36.google.com with SMTP id b10so5305014iot.4;
 Fri, 02 Apr 2021 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xjXKTKeRPFrdqINNIuHyRRm2q7+Fm15N4fmIcxUIjz0=;
 b=WdQla1RjC9IfdBoWv9QQ93oPTbifNkqviasGH/fYM66X8zAQqliMGFSfdw78IEBLi0
 azFNzW5IYe3QStCZ3yFtHfo+zrZkPJiRxFyOOuE+0Ffzq3Sm+/bk92gLSrACuAdeomAl
 D4UcD0LzIOmvbcGEhldfQwDAdedmK86x6MGzirOVg/G0m7CfSRQZm2Xuc4KMMXJQAoRE
 T1JXIugxyjeal7JfRq8brBZEc+PKcjktUsuAliKTdrzOAu6lOl0dJ0qnt/E+pHbedeqw
 TnGUD8alB1Cx7vwRNBawv03gBv/lUf9cxY7vCTUFDMF086/Xs9iKSYxCgUPExvNuZK+m
 V82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjXKTKeRPFrdqINNIuHyRRm2q7+Fm15N4fmIcxUIjz0=;
 b=b46iRN/k9OuijAluQDoYVsRCE1WcNhMo0oXyQBNnQxV/+mANObZxQHIZkN9QNFzoSS
 XyycnBrWL+Ntsf80PlbjJOcXxcldo9oXCmRpO/9BRosD2exJVLx2+CFINpSpk6Xm2jmK
 pVztVWyB6h0oQ3Ni1K49SyaW6dFI8uJ+QYHhW5Dcp9Nwb7OqOoyjoQBHsWOwgL3iWssF
 6qrBdWtsj0hnySJQtBkUzkj2r9IV0BFAiO3vi42n5eEFYBXnvOwRQGalEhS8pDSton/z
 OnRNQ+LROKTxKZw1MHef7bQf8lTD+/PUrP7Mwve5XFl01d4hO/LnjAQDTVMyZIjvVlwN
 8Ozw==
X-Gm-Message-State: AOAM532N55JbjRm5YHDeoKIYPmutsntvgVDw3mlmgO3DpSQjDiLsiIPD
 9sRyLCdjKZDhYGk3XwT8PVFskb4zj+1hN7W0IHA=
X-Google-Smtp-Source: ABdhPJxaMFYQ7UcidUSpj+d/f8zn9kggSsdF0n8gfc2O3KqIr0IHYOTFwKMz+gFKl0+SQ2ldEtzZdxXQEO28Hmwdtco=
X-Received: by 2002:a02:11c9:: with SMTP id 192mr12758325jaf.135.1617368780047; 
 Fri, 02 Apr 2021 06:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210401181457.73039-1-vijai@behindbytes.com>
 <20210401181457.73039-2-vijai@behindbytes.com>
In-Reply-To: <20210401181457.73039-2-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Apr 2021 09:04:04 -0400
Message-ID: <CAKmqyKNosjnkyn7hQ7fQ3tHpApRuc+7jcVZsj4x2R+Y-sRys8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] target/riscv: Add Shakti C class CPU
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Apr 2021 13:06:23 -0000

On Thu, Apr 1, 2021 at 2:15 PM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> C-Class is a member of the SHAKTI family of processors from IIT-M.
>
> It is an extremely configurable and commercial-grade 5-stage in-order
> core supporting the standard RV64GCSUN ISA extensions.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  target/riscv/cpu.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2a990f6253..140094fd52 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -707,6 +707,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
>  #endif
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb2826a2..ebbf15fb1c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -38,6 +38,7 @@
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
> +#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>  #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
>  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
> --
> 2.25.1
>
>

