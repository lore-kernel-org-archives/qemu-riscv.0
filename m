Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSGr2-0001gO-SU
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 07:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSGqy-0001d5-Gl
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 07:25:40 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSGqv-0004Ya-6x
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 07:25:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m10so10044766wrn.4
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 04:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I/pntROMfxlatmMkOkwZn6za9Wf9RfEmp+w9R44WPj0=;
 b=mT9aBinaxqNvXM5TjCLVyozOBdyzySvy597U0ogz4NXxCIxxhSXNROoDINp0paKlpO
 vIofVoux4LDLA+DrTZQt102vUqv6xpSG8xP0lac/s67yjGzqbtei7J4TLfXCnXj9buPg
 isbo/wUVu+aRd6JER33pX1reTtYmpFxr91fvdJsT4YHOvBe/WJ7ZYvUdou2FfH7Phd5b
 LkZKXaqH0cXEGUrWduGMo0koZnD24nHoUMReYNf9xrn3fJ0jQsCWw8aohof9TmnRWMXD
 ua5SMN7ckTIXn9BdM/2S+svfnB35MVsaGshGo0ebXyR/hPvonV9DLzX0RHGEtypX7N/i
 ySzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/pntROMfxlatmMkOkwZn6za9Wf9RfEmp+w9R44WPj0=;
 b=dvDKrxPflpjUoOMP/XEcJldU1m2HGTZ/WuUOl7e1SYlejzc6NGLjFVWTSLiCnt1XNm
 5HmxwlvIC0KEXhmeyATPhTeNEDwgP1eeGrLk2P3QCqCve4GX3Y1fOZnzfhTxLjhWT5bJ
 /XH+4xS6aVlo+YWjSwdgt6RsxfU9crDd0WudrJ+qJcM76e8p9Ot894QkTIRGLoW+t7ci
 2gVFVDGhXOgispg7scQKCdhbBmGwUojF9ajxX09hOjjVNd7iodvE88nZcog/x4WL+NDY
 1f9Sunvliboj1K8gsfx6SatfxJOJv3gMfjvhpGOwv0hp+g18KV/p4vnF9/Tb9vlZixWD
 hHgQ==
X-Gm-Message-State: AO0yUKV2oH0ax5r1DAKv/85VjIzdRLOePy3z9LzO2Fkwk84fcggD4s8o
 NqkefnHr3mj1Z2ZLDuBY9PI+DA==
X-Google-Smtp-Source: AK7set/yUu7o5Sw0zIRNw3g4n2IsH7EeGNAPCq/RXVFq2aN9ejLo7oJL/Cv93SUU4tCQlOcKbBOv0g==
X-Received: by 2002:adf:f386:0:b0:2c5:51ed:adf7 with SMTP id
 m6-20020adff386000000b002c551edadf7mr1261853wro.34.1676463935078; 
 Wed, 15 Feb 2023 04:25:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a5d5048000000b002c54d97b1ecsm11141550wrt.72.2023.02.15.04.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 04:25:34 -0800 (PST)
Date: Wed, 15 Feb 2023 13:25:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V2 03/10] hw/riscv/virt: Add memmap pointer to
 RiscVVirtState
Message-ID: <20230215122533.ln3wsoruopdrtshy@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-4-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 12:25:40 -0000

On Mon, Feb 13, 2023 at 08:10:31PM +0530, Sunil V L wrote:
> memmap needs to be exported outside of virt.c so that
> modules like acpi can use it. Hence, add a pointer field
> in RiscVVirtState structure and initialize it with the
> memorymap.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c         | 2 ++
>  include/hw/riscv/virt.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 58d3765b6d..5017ba62ec 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1451,6 +1451,8 @@ static void virt_machine_init(MachineState *machine)
>              ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
>      }
>  
> +    s->memmap = virt_memmap;
> +
>      /* register system main memory (actual RAM) */
>      memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
>          machine->ram);
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 62efebaa32..379501edcc 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -59,6 +59,7 @@ struct RISCVVirtState {
>      char *oem_id;
>      char *oem_table_id;
>      OnOffAuto acpi;
> +    const MemMapEntry *memmap;
>  };
>  
>  enum {
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

