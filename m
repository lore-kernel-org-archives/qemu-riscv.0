Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYBeX-0004dZ-VH
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 15:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pYBeW-0004cq-F0
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 15:05:16 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pYBeU-00019C-Ps
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 15:05:16 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1720433ba75so4262491fac.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 12:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677873913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N1B6/pXnldAgnrh+84ND4QzxbqUfbkSAsr/VmeenwT0=;
 b=cSWU86OKLokiPsEl3/nClHWH8qgXwVNcuRe0Qenl6bPNPlgV4PBbBDj6mVGSzP0H51
 prcmLrvg304rqbaA34jxDahM2BF6lLAF+m+Kmo1OyAfGSy17dkxjn6DYINQFX3b9wCLg
 0Z4FBWiMXALVOhWMxssVssthqlCy42DCefgPtoZaeULHKHlcFvFtB5sSNeau7S2jl8F2
 kigAdsJa9thWz2taqrUKaYrAwPtvZVslUcDuDZNEayM2LZHHOH8kVqT/vF49UOgye94Z
 XYdeBXRPRdprFq7QDD4Um0KN4wMs1o30Xc3eSVOg6wLqakOFiGv2QhSRg8HvBGkw7eTm
 xAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677873913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1B6/pXnldAgnrh+84ND4QzxbqUfbkSAsr/VmeenwT0=;
 b=vDaVke2eLp9juH7RFCNmUog4wJD0g/X0rx4+ZBxP9axfRh8Myqnxn+htGggt4VLR0d
 QXa0GfOk1dqU2xbNr47spVUTKICtRbRHyqXuJjvyfpukznYThZiUG7FECtOdWer9jdyH
 NbtdZntZadIPvLG+F6G5kkHS7LUilC08h1giFJoSKP7qfIeht3zzx6ZsVPx10rHyUMmo
 QNa+Vvy2FwUfvPK71LKAj4+ByS9aXOtxsIUgD2XkFOvVUNDcQUSRojaQOP2gGGs7y0W0
 eVSkHEim+iLPeHwMCGEqfo7uX1xARmG22moqGYJDFhiY6eHYOWgnHMKnESvSkGvX8wYj
 qPCQ==
X-Gm-Message-State: AO0yUKU43yGK0Bkp50Z5BavOCyRnb456TTJ4P9WFBmtDevlqEeoUHWuo
 uwhCLvmbOZk51SjQuHV+fEGs03vXT7AkQkoh
X-Google-Smtp-Source: AK7set9ycpopG6uesZXZnDGXloGrCHMnyCBfeIgm5u7y4eBSs9CeYhD9meHaZb8HomDql+z6BEgvAg==
X-Received: by 2002:a05:6871:806:b0:176:1fd8:d144 with SMTP id
 q6-20020a056871080600b001761fd8d144mr3935789oap.26.1677873913404; 
 Fri, 03 Mar 2023 12:05:13 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a9d60ce000000b00690e42f0da8sm1471518otk.24.2023.03.03.12.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 12:05:12 -0800 (PST)
Message-ID: <09db99bd-894a-bf17-3d3d-f8bd100fb5be@ventanamicro.com>
Date: Fri, 3 Mar 2023 17:05:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/riscv: cpu: Implement get_arch_id callback
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, Anup Patel <apatel@ventanamicro.com>
References: <20230303065055.915652-1-mchitale@ventanamicro.com>
 <20230303065055.915652-2-mchitale@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230303065055.915652-2-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 20:05:16 -0000



On 3/3/23 03:50, Mayuresh Chitale wrote:
> 
> Implement the callback for getting the architecture-dependent CPU ID ie
> mhartid.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dd2f0c753..467d8467a3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1243,6 +1243,13 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> +static int64_t riscv_get_arch_id(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    return cpu->env.mhartid;
> +}
> +
>   #include "hw/core/sysemu-cpu-ops.h"
>   
>   static const struct SysemuCPUOps riscv_sysemu_ops = {
> @@ -1297,6 +1304,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>       cc->disas_set_info = riscv_cpu_disas_set_info;
>   #ifndef CONFIG_USER_ONLY
>       cc->sysemu_ops = &riscv_sysemu_ops;
> +    cc->get_arch_id = riscv_get_arch_id;
>   #endif
>       cc->gdb_arch_name = riscv_gdb_arch_name;
>       cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;

