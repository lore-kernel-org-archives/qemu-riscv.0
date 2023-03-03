Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYBek-0004sz-3w
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 15:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pYBei-0004sa-Jh
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 15:05:28 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pYBeg-0001Aa-Mz
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 15:05:28 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso2060941oti.8
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 12:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677873925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4UQjcAsQNm6AWzhd8pehDbFmuWTd/HB7kxIQN/RGz/E=;
 b=Nh1Mff/VjGP5gYq250c398Y+H5QKS5Jn4kzCSTMiKXRm+3pe34s3/lwQE2DNbL1Cix
 bEJZenN4F4VSHCuYTi/jVhWyM9/GEE/stXym7ppZSiVimNfLhDyrg/Dfnf/SmeFBk5pp
 R5PHr4EKYypWSMgWI7nzCDxBuMkegadjzTjEs+jG310LqnJ3Pr2Rz8Lp3ntPxjTITTW+
 qCJEzao3z9X/+unVMi1EIbWNuxDJjzCfGBY82NI0zNqZ2OVUjPsBZzm7N++huVAcj3Kk
 dNY8FAEx2ZF7FHp2ZOcC6ZK3xAhMb0Cdm2DqagfI8bykIHUULmcq7G2oXtW6Pq977QIg
 qBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677873925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4UQjcAsQNm6AWzhd8pehDbFmuWTd/HB7kxIQN/RGz/E=;
 b=Ls4pOIhWtNgzNuA8r5S45TGa7NEelro+84vyQ2zDZAG9uKFKd3hDXL6k98f+bXrNca
 EVASkhZuXFy6FdVkVoapGbC5IPgf4sztgwRlrHPUZUq36SIs/hItD/2yoNa5NZDxcdxJ
 bA9XONba5rC/E8wUy5DH2MF8d6YttfMLFMVF8Y6tR6TAztD+vHU+dhVNbff0i9REuIwo
 dOOEn5zean+AVlk2/I0IMkJ32P+QO92tnc0prSPqyZQqQiP6QzvQDtSawwkbKhugnfAC
 CzDFCWVMkeWhrjBBWlH6JsW+0XDHm/JAAouX4SzwtpuowBT5PVS4T6qPUPUI1UUrupKR
 bTUQ==
X-Gm-Message-State: AO0yUKU086DrbObXcSWLrwkzUbBUdXw3Y2DBLftK6ft4WDPh9IHe9QpZ
 tfeqJn8B/pym0rRdOF/ohnBVjw==
X-Google-Smtp-Source: AK7set+B4PohF9soADvhqfe9a1FnwXctZPJ311IHCo7MHn8Ww9aTiPo2zw/XKzvznyeke3ruznq4vg==
X-Received: by 2002:a9d:6d16:0:b0:68b:c93b:3f90 with SMTP id
 o22-20020a9d6d16000000b0068bc93b3f90mr1241970otp.30.1677873925446; 
 Fri, 03 Mar 2023 12:05:25 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a9d704e000000b0068bce6239a3sm1440711otj.38.2023.03.03.12.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 12:05:25 -0800 (PST)
Message-ID: <c2fc799c-108b-968c-a3f4-1846e0bf806a@ventanamicro.com>
Date: Fri, 3 Mar 2023 17:05:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] hw: intc: Use cpu_by_arch_id to fetch CPU state
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, Anup Patel <apatel@ventanamicro.com>
References: <20230303065055.915652-1-mchitale@ventanamicro.com>
 <20230303065055.915652-3-mchitale@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230303065055.915652-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Fri, 03 Mar 2023 20:05:28 -0000



On 3/3/23 03:50, Mayuresh Chitale wrote:
> 
> Qemu_get_cpu uses the logical CPU id assigned during init to fetch the
> CPU state. However APLIC, IMSIC and ACLINT contain registers and states
> which are specific to physical hart Ids. The hart Ids in any given system
> might be sparse and hence calls to qemu_get_cpu need to be replaced by
> cpu_by_arch_id which performs lookup based on the sparse physical hart IDs.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_aclint.c | 16 ++++++++--------
>   hw/intc/riscv_aplic.c  |  4 ++--
>   hw/intc/riscv_imsic.c  |  6 +++---
>   3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index eee04643cb..b466a6abaf 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -130,7 +130,7 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>           addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
>           size_t hartid = mtimer->hartid_base +
>                           ((addr - mtimer->timecmp_base) >> 3);
> -        CPUState *cpu = qemu_get_cpu(hartid);
> +        CPUState *cpu = cpu_by_arch_id(hartid);
>           CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
>           if (!env) {
>               qemu_log_mask(LOG_GUEST_ERROR,
> @@ -173,7 +173,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>           addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
>           size_t hartid = mtimer->hartid_base +
>                           ((addr - mtimer->timecmp_base) >> 3);
> -        CPUState *cpu = qemu_get_cpu(hartid);
> +        CPUState *cpu = cpu_by_arch_id(hartid);
>           CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
>           if (!env) {
>               qemu_log_mask(LOG_GUEST_ERROR,
> @@ -231,7 +231,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>   
>           /* Check if timer interrupt is triggered for each hart. */
>           for (i = 0; i < mtimer->num_harts; i++) {
> -            CPUState *cpu = qemu_get_cpu(mtimer->hartid_base + i);
> +            CPUState *cpu = cpu_by_arch_id(mtimer->hartid_base + i);
>               CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
>               if (!env) {
>                   continue;
> @@ -292,7 +292,7 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
>       s->timecmp = g_new0(uint64_t, s->num_harts);
>       /* Claim timer interrupt bits */
>       for (i = 0; i < s->num_harts; i++) {
> -        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
> +        RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(s->hartid_base + i));
>           if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
>               error_report("MTIP already claimed");
>               exit(1);
> @@ -372,7 +372,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>   
>       for (i = 0; i < num_harts; i++) {
> -        CPUState *cpu = qemu_get_cpu(hartid_base + i);
> +        CPUState *cpu = cpu_by_arch_id(hartid_base + i);
>           RISCVCPU *rvcpu = RISCV_CPU(cpu);
>           CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
>           riscv_aclint_mtimer_callback *cb =
> @@ -407,7 +407,7 @@ static uint64_t riscv_aclint_swi_read(void *opaque, hwaddr addr,
>   
>       if (addr < (swi->num_harts << 2)) {
>           size_t hartid = swi->hartid_base + (addr >> 2);
> -        CPUState *cpu = qemu_get_cpu(hartid);
> +        CPUState *cpu = cpu_by_arch_id(hartid);
>           CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
>           if (!env) {
>               qemu_log_mask(LOG_GUEST_ERROR,
> @@ -430,7 +430,7 @@ static void riscv_aclint_swi_write(void *opaque, hwaddr addr, uint64_t value,
>   
>       if (addr < (swi->num_harts << 2)) {
>           size_t hartid = swi->hartid_base + (addr >> 2);
> -        CPUState *cpu = qemu_get_cpu(hartid);
> +        CPUState *cpu = cpu_by_arch_id(hartid);
>           CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
>           if (!env) {
>               qemu_log_mask(LOG_GUEST_ERROR,
> @@ -545,7 +545,7 @@ DeviceState *riscv_aclint_swi_create(hwaddr addr, uint32_t hartid_base,
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>   
>       for (i = 0; i < num_harts; i++) {
> -        CPUState *cpu = qemu_get_cpu(hartid_base + i);
> +        CPUState *cpu = cpu_by_arch_id(hartid_base + i);
>           RISCVCPU *rvcpu = RISCV_CPU(cpu);
>   
>           qdev_connect_gpio_out(dev, i,
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index cfd007e629..cd7efc4ad4 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -833,7 +833,7 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
>   
>           /* Claim the CPU interrupt to be triggered by this APLIC */
>           for (i = 0; i < aplic->num_harts; i++) {
> -            RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(aplic->hartid_base + i));
> +            RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(aplic->hartid_base + i));
>               if (riscv_cpu_claim_interrupts(cpu,
>                   (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
>                   error_report("%s already claimed",
> @@ -966,7 +966,7 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
>   
>       if (!msimode) {
>           for (i = 0; i < num_harts; i++) {
> -            CPUState *cpu = qemu_get_cpu(hartid_base + i);
> +            CPUState *cpu = cpu_by_arch_id(hartid_base + i);
>   
>               qdev_connect_gpio_out_named(dev, NULL, i,
>                                           qdev_get_gpio_in(DEVICE(cpu),
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index 4d4d5b50ca..fea3385b51 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -316,8 +316,8 @@ static const MemoryRegionOps riscv_imsic_ops = {
>   static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>   {
>       RISCVIMSICState *imsic = RISCV_IMSIC(dev);
> -    RISCVCPU *rcpu = RISCV_CPU(qemu_get_cpu(imsic->hartid));
> -    CPUState *cpu = qemu_get_cpu(imsic->hartid);
> +    RISCVCPU *rcpu = RISCV_CPU(cpu_by_arch_id(imsic->hartid));
> +    CPUState *cpu = cpu_by_arch_id(imsic->hartid);
>       CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
>   
>       imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
> @@ -413,7 +413,7 @@ DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
>                                   uint32_t num_pages, uint32_t num_ids)
>   {
>       DeviceState *dev = qdev_new(TYPE_RISCV_IMSIC);
> -    CPUState *cpu = qemu_get_cpu(hartid);
> +    CPUState *cpu = cpu_by_arch_id(hartid);
>       uint32_t i;
>   
>       assert(!(addr & (IMSIC_MMIO_PAGE_SZ - 1)));

