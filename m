Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOMMQ-0005Ef-Rj
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 11:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMMK-0005Cg-TV; Mon, 22 Mar 2021 11:20:48 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMMG-00017n-Rw; Mon, 22 Mar 2021 11:20:48 -0400
Received: by mail-io1-xd29.google.com with SMTP id k8so14316479iop.12;
 Mon, 22 Mar 2021 08:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sH0qnymjhFhxYT8ynBH81ELAUK3f4OUCdGjABIDiIb4=;
 b=JckoNdw1xyNdCiwn7vqqL/KgyfZ7d3nARCGtjkwHdwQ45WVsuI6Gk0k6SgF55+JCVm
 j6LR2Cp2EH/YK27EW3AsdPGU/esFUQNtua/NA7LI0C8YDzkEJ1ytW4SeBHuaDrquCkJe
 MJ3jFq/6ffKKR4uN7W+MhnZ6OqSLBXP8Ov0NOGg9kAt0vRf1XM46Jg3uuxmgyLaqJeaE
 lydsFyJ4dAVvUXXxVdtend03QvJ1f537FzH/u+QeES6GTNiJdcCsnMjEGb8x0FASW/mi
 u25qJb1oR3S/6cU1fHYEtZpN4AFGw5NmBcGHsx2RHbqBAGrFQ6ZmxvyFlt/Mc/PR/ZiZ
 zssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sH0qnymjhFhxYT8ynBH81ELAUK3f4OUCdGjABIDiIb4=;
 b=loVqhW9FipqNs6dS2vmY05lUxH4t7dz529ZTQZOG3m/9F3qdaXneEY6LI8UFFKDdG4
 xZvom774yw+M9Zux3UywERKWLv9sWtgkmVMUJ6PKUo9P683Bvf1d4xJBoUpQYElXiYfX
 CXc507f+XDfDnZ2UeoMfAbcjqj9qYFJEoRg8tmUO+xghBtTsUKnrL+zF6bdwY3kdT6yJ
 Gcn/hKrGfzQd65OE00ixTWJ5lDYSwBmmq+tC1LDV1Du2ZQOytWPN2Vi14i1kELRbvSN6
 kqN96E5tMfJenWHdBcqR5BC3OxJwhZJI35z9tKet4EcGIBZrcLmo2x3dddbNDiznv952
 6h+g==
X-Gm-Message-State: AOAM533HTdLoT6shzDtbyVUDGAAOQnJn4v9toKGvXrXBupq4zz2Cwuc6
 3WRGeX4FSjVSxLiSulCCQJvGoHBRRDyFo9UDaBko9P/ATOM=
X-Google-Smtp-Source: ABdhPJxDfRbdtaW04Ag2Gt/sdtiuvJRUdEURQLaA0e2QWegcy3HYYscyVcoHQAkEWbcgpmUlzxmvkAqcdi0OhPKARNA=
X-Received: by 2002:a05:6602:2287:: with SMTP id
 d7mr247026iod.42.1616426443442; 
 Mon, 22 Mar 2021 08:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210321050917.24621-1-vijai@behindbytes.com>
 <20210321050917.24621-2-vijai@behindbytes.com>
In-Reply-To: <20210321050917.24621-2-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 11:18:47 -0400
Message-ID: <CAKmqyKOtnnLA31E8XCN_+bp-24Mr-kUycLx+=3uPfBdkZkbj7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] target/riscv: Add Shakti C class CPU
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 15:20:49 -0000

On Sun, Mar 21, 2021 at 1:09 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> C-Class is a member of the SHAKTI family of processors from IIT-M.
>
> It is an extremely configurable and commercial-grade 5-stage in-order
> core supporting the standard RV64GCSUN ISA extensions.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  target/riscv/cpu.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2a990f6253..140094fd52 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -707,6 +707,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
>  #endif
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb2826a2..ebbf15fb1c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -38,6 +38,7 @@
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
> +#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>  #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
>  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
> --
> 2.25.1
>
>

