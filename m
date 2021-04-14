Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWo5Z-000662-6G
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 18:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWo5X-00065U-90; Wed, 14 Apr 2021 18:34:23 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:44737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWo5S-0002Ky-7k; Wed, 14 Apr 2021 18:34:22 -0400
Received: by mail-il1-x131.google.com with SMTP id i22so13809446ila.11;
 Wed, 14 Apr 2021 15:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CI8Z/F5S582NuvrtPVvFNRH8BngEDJ7CgRUXykPNP6Y=;
 b=OAjusVNtJp44MuoIj11Gd4CxZDVcf4G6GZFOeCVgdmRydnublD7l3xV1rbIctwhxtq
 4+49mPnwcpSsCdoOBZ4fm2hUPFRXa4VwXhIxwEJTvf9p3+0R4pqoLxclwsghM/AwdlU/
 bYsoz0oe9Vg9YPqkytJMPavURoVTSlT1oECcfu4r5DtjpyHs/7U2zuK48fsQBHjUUD+n
 8tqnTFmxIiWJc/BB7tMgZNwM9ZNJkO1doNryxyIYvzyu89IUm03d7rBr6+d0pbFaeAWo
 UmcxusTzPet+8kDY/x6t+/uynw2as2V3+2LUicukVjENXxJECC/OdiSnNXiFJlgEN6pR
 h5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CI8Z/F5S582NuvrtPVvFNRH8BngEDJ7CgRUXykPNP6Y=;
 b=cntoGwayHTo4I+tYvxUH19o97UYa07cmkWeGKS6mYtlnHG2ykgSPJ+h4G6HkHjebsN
 8Xdz81efG+Ex4ON34vVe7M+Gx8xsmPmOhKodGh7bxLiV5jU5kx2uB+fKqCjr+LYDCNOW
 ZYdEhCxMirU1Tgdu8EVOQ4yk9Ttb+x1XGtJzJTbG4Sy7Co53LvGEB4/HpXfCgdk9RF6/
 SEBAENq5bO3M6qPKPLJpuJkTcieu2hnAWAKd+zp5q6+kU/086xdqzue7Zt1gxS9On1y6
 Bh0rJZcZgEv/dCHQiyQOgbCa0rQDIAZczNkRIGd7+7RU5cVEGdKNlqPisuxAn+skOw+C
 v+7w==
X-Gm-Message-State: AOAM530R1BR6w7q2fkEGmo0W2Vnm6x1tlJrNmFloR2w8Gnx4cf+l6J55
 ztQQieglBpfxOeo4fBlceaxg/n1KXr03Yta98WY=
X-Google-Smtp-Source: ABdhPJw7nVEWEpyQ3LlY/WJBHngQI5dgV+H5R7KpDVhY5wrYQ7aDnJU/AFTQru82dlQNnN0oQJZdZKvDxJQ8F6AtlvU=
X-Received: by 2002:a05:6e02:5a2:: with SMTP id
 k2mr409747ils.177.1618439656765; 
 Wed, 14 Apr 2021 15:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210412065246.1853-1-jiangyifei@huawei.com>
 <20210412065246.1853-10-jiangyifei@huawei.com>
In-Reply-To: <20210412065246.1853-10-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 08:33:50 +1000
Message-ID: <CAKmqyKPgfpEJYN0xTKRiD4Wk62-nu5pB=Ad1Z_NZasTrbXXrZg@mail.gmail.com>
Subject: Re: [PATCH RFC v5 09/12] target/riscv: Add host cpu type
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:Overall" <kvm@vger.kernel.org>, libvir-list@redhat.com, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 yinyipeng <yinyipeng1@huawei.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 fanliang@huawei.com, "Wubin (H)" <wu.wubin@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Wed, 14 Apr 2021 22:34:23 -0000

On Mon, Apr 12, 2021 at 4:54 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> 'host' type cpu is set isa to RVXLEN simply, more isa info
> will obtain from KVM in kvm_arch_init_vcpu()
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 9 +++++++++
>  target/riscv/cpu.h | 1 +
>  2 files changed, 10 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index dd34ab4978..8132d35a92 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -216,6 +216,12 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>  }
>  #endif
>
> +static void riscv_host_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RVXLEN);
> +}
> +
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
> @@ -706,6 +712,9 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>          .class_init = riscv_cpu_class_init,
>      },
>      DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
> +#if defined(CONFIG_KVM)
> +    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
> +#endif
>  #if defined(TARGET_RISCV32)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a489d94187..3ca3dad341 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -43,6 +43,7 @@
>  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
>  #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
>  #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
> +#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>
>  #if defined(TARGET_RISCV32)
>  # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
> --
> 2.19.1
>
>

