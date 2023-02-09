Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPueF-0001Th-33
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 19:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPueD-0001OD-CM; Wed, 08 Feb 2023 19:18:45 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPue4-0002HX-QN; Wed, 08 Feb 2023 19:18:38 -0500
Received: by mail-vs1-xe34.google.com with SMTP id k4so447899vsc.4;
 Wed, 08 Feb 2023 16:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ARulwhx28DPdykpyEzklpQ+57t2yMTOJiRkjl96ugJ8=;
 b=bsKJfte3R+FrhPtrVzvvhdgy96pCfff6jcK3KNTsiagYFtS64pFKGGSPKsB8o9peRG
 xmLTZqaIOl/mK3ZXI2xg4dLYxO3VqG+7w3BRs55cJpvtiSXy1pW8lL5pEwnHiXJVmJVp
 oUyv2VOOuezGoGYKYT/8AI5EdRbS3Wd6Nbv9gOGqugLGS148l9hvOE/8KyOn93kFzySi
 oFssm48I68GabnumHVhzd+kbgpaIpf3KKEDxIgWT4AABVwNs5o7Whs+waD4JMgNxbngc
 hYyc+JAEWgS0SFOiHBQrXZMpZSXLM6O3kqRoqNTI4PLHwjLMwPunZJX9q+s5DBIpp6kr
 6mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ARulwhx28DPdykpyEzklpQ+57t2yMTOJiRkjl96ugJ8=;
 b=DA2veTYs7AWMCPKioHd4ohG439lfVvZ4DSx/sHljrF5ZSLJ9ogyl8XHJKmMkFy1U1f
 9dYsDW5z433Nxuad1PwVRl5o4c/ReYhAOC17FRW5yF7A5oIdknU2BjxoVIXzFpq8r4an
 wRMIgyZWTJH6jd/EhUxwQH+GCTP6+tRzdCJ3Ii/lqrIM1J0A2EkTm7imKfxetKJzLOel
 BxijiQAiofPvMbavagN6tZq6/P4hK3Z6BRABRx+ReJoq3T5/OGTima0aPWaZIKvjuDwc
 swhLmmVgqNAMAQ+DHcipW8gTUP92slVuT35HdOjRakf6oTRdyMarkS/IkRi8QcxyFnR+
 /ZgQ==
X-Gm-Message-State: AO0yUKUjDHG5pmThW7kBdqkmH5TJUS4sL/5uxFTnBnPhGVkumQz4o445
 XNqyljeGQp92giToH2hkz5ZtkYFAzAyOMczG4yo=
X-Google-Smtp-Source: AK7set92ssx1iRxwmyUWhFGskB/xYRnEfN0TpvaZITXcV44demSuc6GVtgHwUsBstwXzrBkL5mnBURkjyqWqnWP54pQ=
X-Received: by 2002:a67:a407:0:b0:3f0:89e1:7c80 with SMTP id
 n7-20020a67a407000000b003f089e17c80mr1939890vse.72.1675901915725; Wed, 08 Feb
 2023 16:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-4-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-4-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:18:09 +1000
Message-ID: <CAKmqyKM1gmKw_tytq0d7Bvf9sMYU+YEBkrdG-iitnv4HZkvp7A@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/riscv/virt: Add memmap pointer to RiscVVirtState
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 00:18:45 -0000

On Thu, Feb 2, 2023 at 2:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> memmap needs to be exported outside of virt.c so that
> modules like acpi can use it. Hence, add a pointer field
> in RiscVVirtState structure and initialize it with the
> memorymap.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 2 ++
>  include/hw/riscv/virt.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 84962962ff..26caea59ff 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1459,6 +1459,8 @@ static void virt_machine_init(MachineState *machine)
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
> 2.38.0
>
>

