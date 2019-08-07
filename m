Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvIYm-0001OA-De
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 05:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60969)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvIYk-0001N4-C3
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:48:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvIYj-0003Gu-BL
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:48:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34609)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvIYj-0003GG-67
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:48:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id e8so955315wme.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 02:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N/ngK0fLBWxxNXjw4ll1NU2FT8rLNDlpy/iCMu0xQ2U=;
 b=L2vcMnUIke4hpz4N2EQqlxeWoZkdV0o/yWjPQ6EsHkVQlGPBn6A6768ohj+dE7g782
 jmFeWvs1IzDg9UOclQRgt6fIgsuJEWprrNpy4oKxVAaPFoQlkKqGyIqxiys3aIu7j6Hg
 G+aENgSAw4C4dm+DkRWpPPy+Ijfn05Oe/7sk43ruj9euhmaUI/hPlrMoa+eXL/V3X5Xj
 xD3g7ghcFA4ZEFsAHAY3chx7ctahMkqWd7RexrzOTtleHlVbnJKfX389ZkWCRMMkLWEi
 5VR2Wn9jHjg7Pzqvkk7B0oIj4tCR2h/YNAFwYHSBQqSFTb5UILYgE5kMHvPvCu1GF2Eh
 izuA==
X-Gm-Message-State: APjAAAUsXbU3Iov9DEk61X7t10unRcQlRVRm99wly4BqOH+ZlKPntVou
 16dRvsO+dwYS3eHDkhS26o12zqfdESY=
X-Google-Smtp-Source: APXvYqxLi0rD+jYiSut+62GfpIoUKNa4mjg8TEPcK5DU9SFlAFlDv/1FQDAy8i6gjhsLYQ2EqbtZqA==
X-Received: by 2002:a1c:8094:: with SMTP id b142mr3837358wmd.110.1565171320021; 
 Wed, 07 Aug 2019 02:48:40 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id y18sm87501297wmi.23.2019.08.07.02.48.39
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 02:48:39 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-28-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <aedef9fc-204d-1e6e-b93d-72a14e8a16f9@redhat.com>
Date: Wed, 7 Aug 2019 11:48:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565163924-18621-28-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 27/28] riscv: virt: Change
 create_fdt() to return void
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
X-List-Received-Date: Wed, 07 Aug 2019 09:48:43 -0000

On 8/7/19 9:45 AM, Bin Meng wrote:
> There is no need to return fdt at the end of create_fdt() because
> it's already saved in s->fdt. Other machines (sifive_u, spike)
> don't do it neither.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
> 
> Changes in v2: None
> 
>  hw/riscv/virt.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 2f75195..6bfa721 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -112,7 +112,7 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
>                             0x1800, 0, 0, 0x7);
>  }
>  
> -static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> +static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      uint64_t mem_size, const char *cmdline)
>  {
>      void *fdt;
> @@ -316,8 +316,6 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
>      g_free(nodename);
> -
> -    return fdt;
>  }
>  
>  
> @@ -373,7 +371,6 @@ static void riscv_virt_board_init(MachineState *machine)
>      size_t plic_hart_config_len;
>      int i;
>      unsigned int smp_cpus = machine->smp.cpus;
> -    void *fdt;
>  
>      /* Initialize SOC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
> @@ -392,7 +389,7 @@ static void riscv_virt_board_init(MachineState *machine)
>          main_mem);
>  
>      /* create device tree */
> -    fdt = create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
> +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>  
>      /* boot rom */
>      memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> @@ -411,9 +408,9 @@ static void riscv_virt_board_init(MachineState *machine)
>              hwaddr end = riscv_load_initrd(machine->initrd_filename,
>                                             machine->ram_size, kernel_entry,
>                                             &start);
> -            qemu_fdt_setprop_cell(fdt, "/chosen",
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen",
>                                    "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
>                                    end);
>          }
>      }
> 

