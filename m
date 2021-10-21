Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdTgg-0006Kz-SC
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 04:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdTgd-0006JQ-AQ
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 04:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdTgb-0008S3-DI
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 04:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634805867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VYcyTiqdNF0X5alpwNIr56ZKYLtlXKC78TR/mAjCIU=;
 b=NWFDieEayhZwFzZEKgcclwS5PQjn+pVtd7YNTZRyX6LdzOAE+o1pLkXcqcT15+ct4YVwtZ
 HdNJUadjK1IXSI+/gCVZEEXYoZFC+7Gux3v/0YNvJ3tYkAFwJF3o8jbFBJ+Rqx8FqkT+Zy
 AUCq2sAZ4nDQR4/yQIxj9VGAfNXf5Ro=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-KXMQNTyJMQykOZ7IzwjGyQ-1; Thu, 21 Oct 2021 04:44:24 -0400
X-MC-Unique: KXMQNTyJMQykOZ7IzwjGyQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 e14-20020a056402088e00b003db6ebb9526so23537737edy.22
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 01:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/VYcyTiqdNF0X5alpwNIr56ZKYLtlXKC78TR/mAjCIU=;
 b=tUCoxinpCDnymMyd6/8ivdIetJztLQ4L0PWdcxZGiVxPolWUEzfVycHQ3ZfYi22WcD
 8IAssd7v39rT+aguliH/gbUdxhpAsm3KSDVIw/83ZA1v0U4mQKlMhlsjsQ67rUcYcbK1
 u2v+aUphMXa3otXF4poiPSDuhVsLRKdgTu+h5G1wV4IMWL+ganEviZ7K/ax16ZuRqpDH
 93RoWSkpyqwRzGOv5gJjxlTHQddplz045+Le8aC0qh3iE9zRh3YdYSHCNqPTvADBPDZb
 Cjbiehyyf+FEpgz/lMIx0oaFjMUdrwcxsF62kQQUP8hjg1qgH4KOFHuf2Xk1PGmE5Su6
 6HKw==
X-Gm-Message-State: AOAM533FTCEmrrpZmMOTaAAnhxy/cZONL7mQ6ozRIUg3u/S69NvZfaEG
 ve+eC7AEYzVffHIQuCmoG0xj+Wo89H+yGD59U5AE9KC9uzhmOega7w+eGbLDbSB92YN6cxmXXun
 ZBv8tEdf5FxVgKJg=
X-Received: by 2002:a17:906:e85:: with SMTP id
 p5mr5657235ejf.159.1634805863457; 
 Thu, 21 Oct 2021 01:44:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc0d8pWxp44ZQSazS0mijFzCbuLRL/Ynyv2D+FHrkuPeFVadPbmSyR7VGr53SzTGhM9X8NBA==
X-Received: by 2002:a17:906:e85:: with SMTP id
 p5mr5657220ejf.159.1634805863253; 
 Thu, 21 Oct 2021 01:44:23 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id kw10sm2181305ejc.71.2021.10.21.01.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 01:44:22 -0700 (PDT)
Date: Thu, 21 Oct 2021 10:44:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>
Subject: Re: [PATCH v2 2/6] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211021104421.203a387b@redhat.com>
In-Reply-To: <20211020014112.7336-3-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-3-bmeng.cn@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 21 Oct 2021 08:44:32 -0000

On Wed, 20 Oct 2021 09:41:08 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> While at it add check for user supplied RAM size and error out if it
> mismatches board expected value.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> Changes in v2:
> - add RAM size check
> - assign mc->default_ram_size
> 
>  hw/riscv/opentitan.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 9803ae6d70..5d568ea58a 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -19,6 +19,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "hw/riscv/opentitan.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> @@ -64,20 +65,25 @@ static const MemMapEntry ibex_memmap[] = {
>  
>  static void opentitan_board_init(MachineState *machine)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const MemMapEntry *memmap = ibex_memmap;
>      OpenTitanState *s = g_new0(OpenTitanState, 1);
>      MemoryRegion *sys_mem = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> +
> +    if (machine->ram_size != mc->default_ram_size) {
> +        char *sz = size_to_str(mc->default_ram_size);
> +        error_report("Invalid RAM size, should be %s", sz);
> +        g_free(sz);
> +        exit(EXIT_FAILURE);
> +    }
>  
>      /* Initialize SoC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc,
>                              TYPE_RISCV_IBEX_SOC);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
> -    memory_region_init_ram(main_mem, NULL, "riscv.lowrisc.ibex.ram",
> -        memmap[IBEX_DEV_RAM].size, &error_fatal);
>      memory_region_add_subregion(sys_mem,
> -        memmap[IBEX_DEV_RAM].base, main_mem);
> +        memmap[IBEX_DEV_RAM].base, machine->ram);
>  
>      if (machine->firmware) {
>          riscv_load_firmware(machine->firmware, memmap[IBEX_DEV_RAM].base, NULL);
> @@ -95,6 +101,8 @@ static void opentitan_machine_init(MachineClass *mc)
>      mc->init = opentitan_board_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
> +    mc->default_ram_id = "riscv.lowrisc.ibex.ram";
> +    mc->default_ram_size = ibex_memmap[IBEX_DEV_RAM].size;
>  }
>  
>  DEFINE_MACHINE("opentitan", opentitan_machine_init)


