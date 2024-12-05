Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFD4E7716C
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 12:15:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJAl3-0007ss-Iz; Thu, 05 Dec 2024 07:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJAl2-0007sL-0p
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 07:15:00 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJAkz-0007vU-P6
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 07:14:59 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7258bce5289so640735b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 04:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733400895; x=1734005695; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZaJHf/wAqT4ibRxWQjkunSV6VRp1JirbH0cRSL3fOZs=;
 b=m32ehE5cqMON5nMUw42yRE12EV3h0wYZ11paeEtmx6vcoVlAK0zDlwulxN/W0K1Dz9
 RT0GjhvGKZPrSe6lP5vTEvVnEmBfgd8yiSm59wBql3bPbVqp+OqxAzigE0TbSqkQQsD4
 aLDA4yHM4zaysv3pZuwOKV6oPIhrJAJjOpLCw8GysFhw0Efuc5iab6Z5A/pQgOqS0Pit
 s7J1XOEZCx4QqldDT+I8ZtQoywgmrvOmDFlMkP1+9xOcsRGCxoWrtZUz0ve/iLEU7bJs
 oHIPZ6Ut30xVYd+S9z52WAMAsH3Gg+x1EUFPGOasLLXYd5CJsaB/K75BtTIk/8d5wDtb
 F6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733400895; x=1734005695;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZaJHf/wAqT4ibRxWQjkunSV6VRp1JirbH0cRSL3fOZs=;
 b=e8yFGF5lyEvwBZ+WQLxzKdabB95wFQ+jDWBaxmuMVuXb4V79EywA0Ty3cZffcMzi/r
 ZMXdgcNOumTXjzDX7pdnnZ62PUQM/YuK5k9ueQdsFDtwRUDm7HWGqfj+fBvZH58J0TZT
 +QGPosyqekvGNtWbtaar5o0lpsnso+4nDCM+8xzQ9RvkBQtwz5jTXdsuMJUnQ0eZYJp0
 d53L2CXyUzZWamq1+dpFNnGE3EKdxI07kAkDICXc2eZeXRV8wI79oPhW3NFQ1T4su91F
 QDO652Cqm0F17LOa2CkRB/4truJ0i1F377u6c1P7voXBgZNO2w9ytCaIugm+KKs07rke
 0jpw==
X-Gm-Message-State: AOJu0YybLwdZp4xhSfm9XkjAcvxXyX49HvtNlqmeNUPWP/Jsk+it/QYg
 8RUTOTJeDLA2bipN+kbO5/+/pvCUAV6JFC9HZPZ1/S8pd0ARwgUIO/FzxC9IE9s=
X-Gm-Gg: ASbGnctdICJPsI0A8Ht1KZbu92KOfYPXc77kXyFZ4nJ9ZgE1rbGn4AzOTApsDRSIMGB
 ZKnfGUrdIYyLW6y7mgyxpCUOLL1XauzMBZ5E1SP31927ZGtSAslQhmDv0sVDfhrUAJ8p3WSsC8I
 PM1ZxnFH02HOZZN/+FEYahDnjZlHQ4MYJdCeQQOBm2pGiEov8ldT2gErFdq/LCrELbf7ZeaNlEO
 8ZR8zr5WCk0C29dVMqKMMYqxwjXOY55+YVa5NBtD77t4m/xuR95LQbooW+O/Rc=
X-Google-Smtp-Source: AGHT+IEZtKAlH+WYUOoLAVl5MU3Rg5V2VTRD910VcvYNx3/J7rr7zMn+sbcepWSCLTta1KsRUkqzDg==
X-Received: by 2002:a05:6a00:3c8d:b0:71e:6bf1:158f with SMTP id
 d2e1a72fcca58-72587f8c0d3mr12312940b3a.21.1733400895541; 
 Thu, 05 Dec 2024 04:14:55 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a29caa61sm1107009b3a.38.2024.12.05.04.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 04:14:55 -0800 (PST)
Message-ID: <32d71d95-acd9-4008-a4e6-f81680ac6820@ventanamicro.com>
Date: Thu, 5 Dec 2024 09:14:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] target/riscv: add support for RV64 Xiangshan Nanhu CPU
To: MollyChen <xiaoou@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20241205073622.46052-1-xiaoou@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241205073622.46052-1-xiaoou@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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



On 12/5/24 4:36 AM, MollyChen wrote:
> Add a CPU entry for the RV64 XiangShan NANHU CPU which
> supports single-core and dual-core configurations. More
> details can be found at
> https://docs.xiangshan.cc/zh-cn/latest/integration/overview
> 
> Signed-off-by: MollyChen <xiaoou@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu-qom.h |  1 +
>   target/riscv/cpu.c     | 29 +++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 6547642287..d56b067bf2 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -50,6 +50,7 @@
>   #define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
>   #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
>   #define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
> +#define TYPE_RISCV_CPU_XIANGSHAN_NANHU  RISCV_CPU_TYPE_NAME("xiangshan-nanhu")
>   #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>   
>   OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8447ad0dfb..38baaa39f8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -645,6 +645,34 @@ static void rv64_tt_ascalon_cpu_init(Object *obj)
>   #endif
>   }
>   
> +static void rv64_xiangshan_nanhu_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
> +    riscv_cpu_set_misa_ext(env, RVG | RVC | RVB | RVS | RVU);
> +    env->priv_ver = PRIV_VERSION_1_12_0;
> +
> +    /* Enable ISA extensions */
> +    cpu->cfg.ext_zbc = true;
> +    cpu->cfg.ext_zbkb = true;
> +    cpu->cfg.ext_zbkc = true;
> +    cpu->cfg.ext_zbkx = true;
> +    cpu->cfg.ext_zknd = true;
> +    cpu->cfg.ext_zkne = true;
> +    cpu->cfg.ext_zknh = true;
> +    cpu->cfg.ext_zksed = true;
> +    cpu->cfg.ext_zksh = true;
> +    cpu->cfg.ext_svinval = true;
> +
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.pmp = true;
> +
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
> +#endif
> +}
> +
>   #ifdef CONFIG_TCG
>   static void rv128_base_cpu_init(Object *obj)
>   {
> @@ -3050,6 +3078,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906, MXL_RV64,  rv64_thead_c906_cpu_init),
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_TT_ASCALON, MXL_RV64,  rv64_tt_ascalon_cpu_init),
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,  MXL_RV64,  rv64_veyron_v1_cpu_init),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_XIANGSHAN_NANHU, MXL_RV64, rv64_xiangshan_nanhu_cpu_init),
>   #ifdef CONFIG_TCG
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,   MXL_RV128, rv128_base_cpu_init),
>   #endif /* CONFIG_TCG */


