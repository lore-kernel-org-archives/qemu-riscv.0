Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdTfm-0005Wp-JN
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 04:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdTfk-0005TV-TP
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 04:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdTfh-0007ht-Hx
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 04:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634805812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZ/cLSxXUy5ASLlwDP4Oa7v+l4TaS01RBtMb8ltbBtY=;
 b=ckBZ+tjKAB1f5gAS89wVplgv7icmZS7Og/zPKDBo9PxzSbGtdKTwbsa8XZD88tCf/2u6kD
 5UdTYTgDvrIpurTGsSNlg8yF6MhEtX79ssxbmT/RC3Jc/sJeNt4spOhKSwGSs33G+AZkQw
 61CSfzB1S75Gp7wZ6l2OScicmsfcpEM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-l4dVG7ifOw6R0Yob78y52w-1; Thu, 21 Oct 2021 04:43:27 -0400
X-MC-Unique: l4dVG7ifOw6R0Yob78y52w-1
Received: by mail-ed1-f69.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so20152086edx.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 01:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZ/cLSxXUy5ASLlwDP4Oa7v+l4TaS01RBtMb8ltbBtY=;
 b=LltuGX4sTQM3LB5tsiZgSsMR0XbNj376uma5b4x5Su2AKreRUMxLVDiasWaCsCwLyd
 w5eSqWHRXYu/JJWF+JRoa08RSyzP+kr0znmn/vIe27EBDa2icmB7w5OrUC+rxVVPDRHO
 GCG7uG0DkICcSt5B45Tct6byjLTdwQbcsy8eGL7ZfuYVp9smayyAjsegVsJcr/uDidhj
 Rz3/ClzYeereWvxiKEi1Af/c5WjZ0NL4mq+e9eRU0HwU1al/8/32+PVzgPe4zIv/W7D3
 GneLjywMDHCtK5ZoJWKfP010Ovb34AjJDOTaHVb1aCsooLiAnOMtaqGj20w8DQufhFsF
 Geog==
X-Gm-Message-State: AOAM5320LsqrLu+Hm1D4TqlzfvaUjmCxjADeE4eSmv8BoW6V5lWSXgJS
 EI196SY2gxbsJ64OnSoX45rEkdA1iXJaUxU2c1tI9bMDhw333wJS81Jl5lNnusFrx9Tev/wiUV0
 5R/E3MdPzeA9ZLjM=
X-Received: by 2002:a17:906:e287:: with SMTP id
 gg7mr5612938ejb.387.1634805806242; 
 Thu, 21 Oct 2021 01:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztmagWMxraXkzxV2TBhLtdvTpD/2hS4jW83ZYIhvvKGtbOTiiDOtGGRBWpY3XeOeSDAWirbQ==
X-Received: by 2002:a17:906:e287:: with SMTP id
 gg7mr5612897ejb.387.1634805805900; 
 Thu, 21 Oct 2021 01:43:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q9sm2186461ejf.70.2021.10.21.01.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 01:43:25 -0700 (PDT)
Date: Thu, 21 Oct 2021 10:43:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>
Subject: Re: [PATCH v2 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211021104324.384470d6@redhat.com>
In-Reply-To: <20211020014112.7336-5-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-5-bmeng.cn@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 21 Oct 2021 08:43:37 -0000

On Wed, 20 Oct 2021 09:41:10 +0800
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
>  hw/riscv/sifive_e.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 6e95ea5896..9b206407a6 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> @@ -71,22 +72,27 @@ static const MemMapEntry sifive_e_memmap[] = {
>  
>  static void sifive_e_machine_init(MachineState *machine)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const MemMapEntry *memmap = sifive_e_memmap;
>  
>      SiFiveEState *s = RISCV_E_MACHINE(machine);
>      MemoryRegion *sys_mem = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      int i;
>  
> +    if (machine->ram_size != mc->default_ram_size) {
> +        char *sz = size_to_str(mc->default_ram_size);
> +        error_report("Invalid RAM size, should be %s", sz);
> +        g_free(sz);
> +        exit(EXIT_FAILURE);
> +    }
> +
>      /* Initialize SoC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_E_SOC);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
>      /* Data Tightly Integrated Memory */
> -    memory_region_init_ram(main_mem, NULL, "riscv.sifive.e.ram",
> -        memmap[SIFIVE_E_DEV_DTIM].size, &error_fatal);
>      memory_region_add_subregion(sys_mem,
> -        memmap[SIFIVE_E_DEV_DTIM].base, main_mem);
> +        memmap[SIFIVE_E_DEV_DTIM].base, machine->ram);
>  
>      /* Mask ROM reset vector */
>      uint32_t reset_vec[4];
> @@ -142,6 +148,8 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = sifive_e_machine_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = SIFIVE_E_CPU;
> +    mc->default_ram_id = "riscv.sifive.e.ram";
> +    mc->default_ram_size = sifive_e_memmap[SIFIVE_E_DEV_DTIM].size;
>  
>      object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
>                                     sifive_e_machine_set_revb);


