Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7789BCF8844
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 12:02:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vM3MO-0007aM-8w; Thu, 20 Nov 2025 07:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vM3M3-0007UL-8t
 for qemu-riscv@nongnu.org; Thu, 20 Nov 2025 07:01:39 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vM3M1-00043K-AS
 for qemu-riscv@nongnu.org; Thu, 20 Nov 2025 07:01:38 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-3eae4e590a4so239689fac.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 04:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1763640096; x=1764244896; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R3tFfvdkAZuykFuhavubWzW+tt7BCO4yozz0yoia5Ao=;
 b=HggfpDCJcXEYUArSTse0OEKXb5AbUdCJPd+phNMW97nmUeebpr3uQAcJS0bwFyENv8
 Xe+RQhuBgn4/L0I2jJEj4lt07jQmAS0cSLfSDzsLoi6FhswvhVuYenc6YJE+3Ru5ypj9
 J9X0fVtWoNh6LN178ivsdD8G4fLdvAVZ/cxwI+0sbLV9p0hMnI5V9Hd5q8DE3oI/n3cv
 JQDe8mixwO8FZqj5QFPIqToWe/HZ+z6TrQN7FtXs9MCH4Wsb+mBTCTFo8wWP6Ui8Gfrp
 bVCNF0CKGE0Ulat1tawc5VioXeF4w/vAkUuRArPG4H8YlUBXogb6WxPwehWgPdzh++Or
 1Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763640096; x=1764244896;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R3tFfvdkAZuykFuhavubWzW+tt7BCO4yozz0yoia5Ao=;
 b=eLc3hkCAy8SuXOks6ax9OdvGTyzihoHDbWghygVxT+vW8TmEMm59V9dCSXOHu6a59W
 xTUUrxT2wSW+P/EkP8NTVl9UpFotAadjBij5E9AvsS/udO0cZmoJh1HAfaF5TWK857LH
 G/Gi53gL6sOqKo68AYmiclOQcJcy9Sw7gijRyO82e2JwCLgUzMSmJO0ywpxAFnMfoyF7
 a5KQWYrkR1p3egVwxrcPaFjkd/DQ6akjhxiqOqFAci7ZFzJUL37/LckKSSTxcg+/Q3Yo
 6nHK2tX1317MDFTj2zwYt7h2PpYZ4Ti1GnaOWSZ3pOK+QIUeI0rDdSrg6zM+5MlC8lsD
 vBww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGbRAtrqPqisvsOkGnhg9Lv2dBcUIOlMDH+18sc4ASuNjG2pqtanBH7CzanDdGREQObfgXE1xQeF+2@nongnu.org
X-Gm-Message-State: AOJu0YxqBXWDKOI3FPvRNlO2yW1qhxenEoJrnB60fxqArBeX5vVkCEP/
 j18rv66R9yJ7C5QJYLQeylLxYl6HPKI84g/gk4eRwRUHps0Y+tFUdW+MIvC8s04+6Wk=
X-Gm-Gg: ASbGnctw+cIz6pO0eCegGqQi/CUYGXdUFogYS47qfeE/3RlPLMAZMSpZekjmpgAottw
 Vrt6rY7fNjEik+69QE2mbNEHEnKnRYUKgNzCx416dWYUeAXHd3UyKbVEMcE1B/LQ55RTEsQiVVd
 DBAhc4U/mnsWs7+dln/nOlcRZii19cBvJxnKjQDB4bQWScuNFCCRaogSw+H5vYBeIsSaj9Ls/Zs
 zgexp5C/FMGPVt7/VG2xD6FWqf1mCU7r2enYd7+Ir0rpZXmdH6RwDIdRwUEX9Rhxtq6RoPj9Fbo
 ms+xRfGFdujUwHAa6oNudGdDFdIVovxNt31PuOYRJlUSzfQvxPoDbTlrCbPcQAbsfZYjgGv/oP6
 QfUwmjMEPTN+zWR2dzutB5Cp4O59RkjlsTfVwzSX2C6QN2s0PMn7D9wwjE2DWa6C5ro918Gxwte
 DuWEVdC3/X7JVnO+BQNIcJnh3TBSk=
X-Google-Smtp-Source: AGHT+IGV9UOPEolf+O/M/6ZC2/Z/P8nRN0SdULeS0yEW1pLRV3BLqckkS94HTSAX38CbYougemuDJA==
X-Received: by 2002:a05:6871:228b:b0:306:c53a:f904 with SMTP id
 586e51a60fabf-3ec9a400f1bmr1641698fac.9.1763640095898; 
 Thu, 20 Nov 2025 04:01:35 -0800 (PST)
Received: from [192.168.68.110] ([177.188.133.235])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3ec9dc8ab10sm1023731fac.16.2025.11.20.04.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:01:34 -0800 (PST)
Message-ID: <71ca906b-5365-43c8-be54-6f0a85bbe0c6@ventanamicro.com>
Date: Thu, 20 Nov 2025 09:01:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] hw/riscv: add CBQRI controllers to virt machine
To: Drew Fustini <fustini@kernel.org>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Nicolas Pitre <npitre@baylibre.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?=
 <mindal@semihalf.com>, Atish Kumar Patra <atishp@rivosinc.com>,
 Atish Patra <atish.patra@linux.dev>, Vasudevan Srinivasan
 <vasu@rivosinc.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?=
 <rkrcmar@ventanamicro.com>, yunhui cui <cuiyunhui@bytedance.com>,
 Chen Pei <cp0613@linux.alibaba.com>, guo.wenjia23@zte.com.cn,
 liu.qingtao2@zte.com.cn
References: <20251119-riscv-ssqosid-cbqri-v1-0-3392fc760e48@kernel.org>
 <20251119-riscv-ssqosid-cbqri-v1-7-3392fc760e48@kernel.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251119-riscv-ssqosid-cbqri-v1-7-3392fc760e48@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 11/19/25 9:42 PM, Drew Fustini wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Add CBQRI controllers to the RISC-V virt machine. The device properties
> can be fully configured from the command line:
> 
>    $ qemu-system-riscv64 -M virt ... \
>        -device riscv.cbqri.capacity,mmio_base=0x04828000[,...]
>        -device riscv.cbqri.bandwidth,mmio_base=0x04829000[,...]
> 
> The mmio_base option is mandatory, the others are optional.
> 
> Many -device arguments as wanted can be provided as long as their
> mmio regions don't conflict.
> 
> To see all possible options:
> 
>    $ qemu-system-riscv64 -device riscv.cbqri.capacity,help
>    riscv.cbqri.capacity options:
>      alloc_op_config_limit=<bool> -  (default: true)
>      alloc_op_flush_rcid=<bool> -  (default: true)
>      alloc_op_read_limit=<bool> -  (default: true)
>      at_code=<bool>         -  (default: true)
>      at_data=<bool>         -  (default: true)
>      max_mcids=<uint16>     -  (default: 256)
>      max_rcids=<uint16>     -  (default: 64)
>      mmio_base=<uint64>     -  (default: 0)
>      mon_evt_id_none=<bool> -  (default: true)
>      mon_evt_id_occupancy=<bool> -  (default: true)
>      mon_op_config_event=<bool> -  (default: true)
>      mon_op_read_counter=<bool> -  (default: true)
>      ncblks=<uint16>        -  (default: 16)
>      target=<str>
> 
>    $ qemu-system-riscv64 -device riscv.cbqri.bandwidth,help
>    riscv.cbqri.bandwidth options:
>      alloc_op_config_limit=<bool> -  (default: true)
>      alloc_op_read_limit=<bool> -  (default: true)
>      at_code=<bool>         -  (default: true)
>      at_data=<bool>         -  (default: true)
>      max_mcids=<uint16>     -  (default: 256)
>      max_rcids=<uint16>     -  (default: 64)
>      mmio_base=<uint64>     -  (default: 0)
>      mon_evt_id_none=<bool> -  (default: true)
>      mon_evt_id_rdonly_count=<bool> -  (default: true)
>      mon_evt_id_rdwr_count=<bool> -  (default: true)
>      mon_evt_id_wronly_count=<bool> -  (default: true)
>      mon_op_config_event=<bool> -  (default: true)
>      mon_op_read_counter=<bool> -  (default: true)
>      nbwblks=<uint16>       -  (default: 1024)
>      target=<str>
> 
> Boolean options correspond to hardware capabilities that can be disabled
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/riscv/virt.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 17909206c7ef..498f606d33b1 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -55,6 +55,7 @@
>   #include "hw/pci-host/gpex.h"
>   #include "hw/display/ramfb.h"
>   #include "hw/acpi/aml-build.h"
> +#include "hw/riscv/cbqri.h"
>   #include "qapi/qapi-visit-common.h"
>   #include "hw/virtio/virtio-iommu.h"
>   #include "hw/uefi/var-service-api.h"
> @@ -1941,6 +1942,8 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>   #ifdef CONFIG_TPM
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
>   #endif
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RISCV_CBQRI_BC);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RISCV_CBQRI_CC);
>   
>       object_class_property_add_bool(oc, "aclint", virt_get_aclint,
>                                      virt_set_aclint);
> 


