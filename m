Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbmVE-0005T1-9A
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 10:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jbmVC-0005Pa-DP; Thu, 21 May 2020 10:48:54 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jbmVB-000381-O1; Thu, 21 May 2020 10:48:54 -0400
Received: by mail-wm1-x342.google.com with SMTP id f134so5820812wmf.1;
 Thu, 21 May 2020 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YeVQrdvPAdy8HmuHtex+PTnNy2sHKDuNksIYryrxHVo=;
 b=fqJIIO2i/deeQAofnAgeZsJPxjK9efTKcHio5L0mo4/LLc5Pjrp4jXHs1ZSNxL61OW
 iNRbFuAGmdjVAlOBJPvfq5ldiz1EDAmRIjsUORJ95uXtxbDqXpXKT2kP01Zrk0xpeOxR
 aAz9+kg6VIYW0/6vbbO+4rvCh6SjoeuukXXoxItDpOxZtdyznTfPCkVLQgM1Z2VMCawI
 Wz/nPhXahT+IaoU/0GpqMIrP3uWk6Y5lyd3VYIlHRDQs+i8YTCibiCLIto2IbhAE+Fdr
 idXohpi8ycdocDeJ5PTQO/td+vlY9MTln9d3wQMgxSK10Ab0wyDeyzR0Ix1AwQgoUi3F
 tw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YeVQrdvPAdy8HmuHtex+PTnNy2sHKDuNksIYryrxHVo=;
 b=JGxo1IsRMLaPHGz8kYN0lBXyrfyThZlSeelLvtKskhH0ThIyPDZK/URva9EpNUQgsN
 m3XvDXPUytqMXeNIxMi4Xd+IBrvfSiqPKzvG3HilVkUs03+bY3G1efWsn1/ZxWw2YvjY
 stIfQ+ODIGpPwq2H1UWTPH7GsE6DbHsm1icopvfMrBE0TzH8xDRe8omvpnO8G1gJZviQ
 xoo/keWCoZ/wQpcGBFrH+3dKtaZaMe1vSdQa+mZzkcXMh7RKLyFjNe5P5tqaHq06M6F8
 xtWxykvG7HhOTQEjylFfLZ+tQo0Mmfl0vFt/BUAIk+wClWxanU3b+e9+J9i1HA9jMdIm
 wdLA==
X-Gm-Message-State: AOAM530LQ2ZYEd9QJ3Yz6VQoRoaS3KU2rXvCIbJYOmvq+P7IKEojKdS7
 ZBcLmM8UBmJJWHcNA0Q0mW8=
X-Google-Smtp-Source: ABdhPJzVlIE7rK5EcuDTjHdtiuMkT2uk7CdMsF/74E64Aa2p0zvWm8qha7Vv0DTla0ghqxqtU5qifw==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr9082260wmz.43.1590072532164; 
 Thu, 21 May 2020 07:48:52 -0700 (PDT)
Received: from [192.168.1.40] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 5sm6718310wmd.19.2020.05.21.07.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:48:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: virt: Remove the riscv_ prefix of the
 machine* functions
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <1590072147-13035-1-git-send-email-bmeng.cn@gmail.com>
 <1590072147-13035-2-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b669d87b-38ed-e3c9-c88a-dbe1ff746357@amsat.org>
Date: Thu, 21 May 2020 16:48:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1590072147-13035-2-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 14:48:54 -0000

On 5/21/20 4:42 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Remove the riscv_ prefix of the machine* functions.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   hw/riscv/virt.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c695a44..f1d6b61 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -471,7 +471,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>       return dev;
>   }
>   
> -static void riscv_virt_board_init(MachineState *machine)
> +static void virt_machine_init(MachineState *machine)
>   {
>       const struct MemmapEntry *memmap = virt_memmap;
>       RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
> @@ -632,32 +632,32 @@ static void riscv_virt_board_init(MachineState *machine)
>       g_free(plic_hart_config);
>   }
>   
> -static void riscv_virt_machine_instance_init(Object *obj)
> +static void virt_machine_instance_init(Object *obj)
>   {
>   }
>   
> -static void riscv_virt_machine_class_init(ObjectClass *oc, void *data)
> +static void virt_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
>   
>       mc->desc = "RISC-V VirtIO board";
> -    mc->init = riscv_virt_board_init;
> +    mc->init = virt_machine_init;
>       mc->max_cpus = 8;
>       mc->default_cpu_type = VIRT_CPU;
>       mc->pci_allow_0_address = true;
>   }
>   
> -static const TypeInfo riscv_virt_machine_typeinfo = {
> +static const TypeInfo virt_machine_typeinfo = {
>       .name       = MACHINE_TYPE_NAME("virt"),
>       .parent     = TYPE_MACHINE,
> -    .class_init = riscv_virt_machine_class_init,
> -    .instance_init = riscv_virt_machine_instance_init,
> +    .class_init = virt_machine_class_init,
> +    .instance_init = virt_machine_instance_init,
>       .instance_size = sizeof(RISCVVirtState),
>   };
>   
> -static void riscv_virt_machine_init_register_types(void)
> +static void virt_machine_init_register_types(void)
>   {
> -    type_register_static(&riscv_virt_machine_typeinfo);
> +    type_register_static(&virt_machine_typeinfo);
>   }
>   
> -type_init(riscv_virt_machine_init_register_types)
> +type_init(virt_machine_init_register_types)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


