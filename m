Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mt4qF-0000z8-K3
	for mharc-qemu-riscv@gnu.org; Fri, 03 Dec 2021 04:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt4qC-0000yf-JX
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 04:26:53 -0500
Received: from [2a00:1450:4864:20::433] (port=42818
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt4q6-0008Um-BX
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 04:26:49 -0500
Received: by mail-wr1-x433.google.com with SMTP id c4so4331939wrd.9
 for <qemu-riscv@nongnu.org>; Fri, 03 Dec 2021 01:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k6aucabibQqs2VrbmkeB/1vOT7V/HEk3VUT4PvkHOkw=;
 b=FPuSCHw/zT6DJ0lhv7IoQXSVjI5n+H98+64+3h0S0ETjcsLeTbBlxrKrVTXZcHtIKU
 +4cCG0RZhG1yDMw4enjgsXixDYVQPcome7basTqRLhzwXUOzKC5ZcRuqQIduHvcQYxP8
 lMfeT4/zGRxb886vviKIa5Io6oXe/zbPUAs2/zqDowc5btiuJcKO4vpe6dfDlv46N71E
 FfoIcCo04Gqoyeb7wENRNbgujGZlOS4zF8m9Ry8qkKFu+h5e1nvy/h2rJfYMhQA+ZY3a
 bNefbqHXybE8y4qdmi1ygAYDcAtfJfZeDjQyjSHP3Y5jwm7gzss/5lmzdV49TOSkfLwE
 Bz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6aucabibQqs2VrbmkeB/1vOT7V/HEk3VUT4PvkHOkw=;
 b=WxpF0mn9Yxg4w5i3yhULk8iuJW6fRc8nD9Apt8jkiyJCAqXnrjGrBrfAue56QXbCRW
 BEHmg08nqsvMA9SygMWlcQUeWd3pcmuV1HF9FJIbI4+Pri4Ch//0d8D5QKOr1aK6eybm
 c20ONa52N0d6UhTJ+pwnGDYfwPPVkdvCvCkAsEorTf0BsKjANpV1BgI8/yDYrtUR3LPA
 xqVqRiT8TjhNPtTx70S7mg+56U87d88FsPP4LNhVm0cJM4ieCEHPVZlXcuDgZk0rBqGM
 fvUVxwca2xYgNgKrL27Omv/XAQ/xUDfLw6QbI51xO+ELO0wjMjpth2/KprscjBYDTvip
 bxbA==
X-Gm-Message-State: AOAM530Bz/ZLRwX/D/0MBbUubrQ+/uOJlMBl/1BHgQMipUaiS0FUgIR9
 rA2KOsAK4t4oGvhDWBElZidpRrv0yzpFZ4EVZ6E8mw==
X-Google-Smtp-Source: ABdhPJwUeNYaQU0w36sYC1UvpvhS+E+TnHxnjMCeQd2b4IcpfLtfyx8p2foRJeQJ/SPFuKvw8bGXIC1MssFG+bhn0E0=
X-Received: by 2002:a5d:650f:: with SMTP id x15mr20299919wru.201.1638523600380; 
 Fri, 03 Dec 2021 01:26:40 -0800 (PST)
MIME-Version: 1.0
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-10-jiangyifei@huawei.com>
In-Reply-To: <20211120074644.729-10-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 14:56:28 +0530
Message-ID: <CAAhSdy2iy6caF3DLqvo=xpYst=QV4bSjTQjU0ZktV88Ez-QqPA@mail.gmail.com>
Subject: Re: [PATCH v1 09/12] target/riscv: Add host cpu type
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, Mingwang Li <limingwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::433;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 03 Dec 2021 09:26:53 -0000

On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> 'host' type cpu is set isa to RV32 or RV64 simply, more isa info
> will obtain from KVM in kvm_arch_init_vcpu()
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/cpu.c | 15 +++++++++++++++
>  target/riscv/cpu.h |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a464845c99..6512182c62 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -247,6 +247,18 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>  }
>  #endif
>
> +#if defined(CONFIG_KVM)
> +static void riscv_host_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +#if defined(TARGET_RISCV32)
> +    set_misa(env, MXL_RV32, 0);
> +#elif defined(TARGET_RISCV64)
> +    set_misa(env, MXL_RV64, 0);
> +#endif
> +}
> +#endif
> +
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
> @@ -844,6 +856,9 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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
> index 2807eb1bcb..e7dba35acb 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -45,6 +45,7 @@
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
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

