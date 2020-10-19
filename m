Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUePY-0005pU-KX
	for mharc-qemu-riscv@gnu.org; Mon, 19 Oct 2020 19:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kUePX-0005o0-8u
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 19:17:51 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kUePV-0008IC-3N
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 19:17:50 -0400
Received: by mail-pl1-x641.google.com with SMTP id b19so624948pld.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2020 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hA+27Q2vReqYv1jlnDD4pvZhqdJ9WeiZrgd/5Mu/hbw=;
 b=uxCjtOYghLkgFsJd4/xfLKHiWRkaUwRQ7B2QzOKnQ60IywamXLfsdlLfai/ZSZ9Ovo
 CKavYsIgJPUO1NHy32IKf87BuMkjgjOCfVNPTNGLuMl+/L7ovtiQe+kr0NHD+lZ4jMA5
 YB2PXOqozMnWFzGMB+r3siI1asg44FFrpVX6MuX3Tq3hHnPwM8BOKcHIUvQ5W88rFsi/
 VErzAklupbPhUAYITTJ9T+OW7G8p6aF6rdRz+XxAzQ7PUow4NvxRd+LC9BQgAmfJWvhy
 da4XJDxIwQOVEAyekrXjGrHho7OYc78xmjWjpDWALsobqrjVh67x/riFmG4tYXUzAFn0
 2HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hA+27Q2vReqYv1jlnDD4pvZhqdJ9WeiZrgd/5Mu/hbw=;
 b=tbOml66UaBB5t97KspjnKdgAI0LUmUR+9ljFK+FVKfzXD9Y7hQr7PTPQJkXp/ca4nF
 WxkdrQHFFQ0Kik7+B6slTT4R6RaUu4R+JCd7VXpOcuJ4Ql890eD0DHm9m/SYbUFSTThJ
 OGMA7j/e4cCj3lZWsUXPeWuw4ZdbgwkmMkErJChF771gGNEU+z0hapLxn8eHceLU0pc0
 ifqSjKLS5Nn8BYszIex1ryNlN18HZvi7V++xOCEfaPKVKJYvyZMdWxHwbbdZV+NG7bjj
 FIVOGIR6RtHS1UbHcDvVe4rTXBLvhmDomRZrGEFTa72DpwhiQ6Ebmw6j61wHTNgzI49G
 kLjg==
X-Gm-Message-State: AOAM533V9E9UGacXtak4EJx1nsMM/cxRcmMcAlJ36k5sbLKTFZSTDXRX
 vZ16oedK21wXlI0+y5v2LMk4qA==
X-Google-Smtp-Source: ABdhPJzO0dL23IUE9MxxqxcDhV6mxllYts9spK0g854w0mIw+vZHJ65zx5WIVFnlCVzC1q4xBSuPfg==
X-Received: by 2002:a17:902:8bc6:b029:d3:d1ff:91b6 with SMTP id
 r6-20020a1709028bc6b02900d3d1ff91b6mr6287plo.30.1603149466582; 
 Mon, 19 Oct 2020 16:17:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 63sm61056pfv.25.2020.10.19.16.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 16:17:45 -0700 (PDT)
Date: Mon, 19 Oct 2020 16:17:45 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Oct 2020 14:38:22 PDT (-0700)
Subject: Re: [PATCH v2 1/4] hw/riscv: sifive_u: Allow specifying the CPU
In-Reply-To: <b8412086c8aea0eff30fb7a17f0acf2943381b6a.1602634524.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-2988cebd-17b2-49a9-a23e-1309589c1455@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 19 Oct 2020 23:17:51 -0000

On Tue, 13 Oct 2020 17:17:25 PDT (-0700), Alistair Francis wrote:
> Allow the user to specify the main application CPU for the sifive_u
> machine.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> ---
>  include/hw/riscv/sifive_u.h |  1 +
>  hw/riscv/sifive_u.c         | 18 +++++++++++++-----
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 22e7e6efa1..a9f7b4a084 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -48,6 +48,7 @@ typedef struct SiFiveUSoCState {
>      CadenceGEMState gem;
>
>      uint32_t serial;
> +    char *cpu_type;
>  } SiFiveUSoCState;
>
>  #define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 6ad975d692..5f3ad9bc0f 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -424,6 +424,8 @@ static void sifive_u_machine_init(MachineState *machine)
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
>      object_property_set_uint(OBJECT(&s->soc), "serial", s->serial,
>                               &error_abort);
> +    object_property_set_str(OBJECT(&s->soc), "cpu-type", machine->cpu_type,
> +                             &error_abort);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>
>      /* register RAM */
> @@ -590,6 +592,11 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = sifive_u_machine_init;
>      mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
>      mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> +#if defined(TARGET_RISCV32)
> +    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U34;
> +#elif defined(TARGET_RISCV64)
> +    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U54;
> +#endif
>      mc->default_cpus = mc->min_cpus;
>
>      object_class_property_add_bool(oc, "start-in-flash",
> @@ -618,7 +625,6 @@ type_init(sifive_u_machine_init_register_types)
>
>  static void sifive_u_soc_instance_init(Object *obj)
>  {
> -    MachineState *ms = MACHINE(qdev_get_machine());
>      SiFiveUSoCState *s = RISCV_U_SOC(obj);
>
>      object_initialize_child(obj, "e-cluster", &s->e_cluster, TYPE_CPU_CLUSTER);
> @@ -636,10 +642,6 @@ static void sifive_u_soc_instance_init(Object *obj)
>
>      object_initialize_child(OBJECT(&s->u_cluster), "u-cpus", &s->u_cpus,
>                              TYPE_RISCV_HART_ARRAY);
> -    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
> -    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
> -    qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", SIFIVE_U_CPU);
> -    qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
>
>      object_initialize_child(obj, "prci", &s->prci, TYPE_SIFIVE_U_PRCI);
>      object_initialize_child(obj, "otp", &s->otp, TYPE_SIFIVE_U_OTP);
> @@ -661,6 +663,11 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      int i;
>      NICInfo *nd = &nd_table[0];
>
> +    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
> +    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
> +    qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
> +    qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
> +
>      sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_abort);
>      /*
> @@ -792,6 +799,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>
>  static Property sifive_u_soc_props[] = {
>      DEFINE_PROP_UINT32("serial", SiFiveUSoCState, serial, OTP_SERIAL),
> +    DEFINE_PROP_STRING("cpu-type", SiFiveUSoCState, cpu_type),
>      DEFINE_PROP_END_OF_LIST()
>  };

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

