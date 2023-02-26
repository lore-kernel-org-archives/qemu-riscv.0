Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWL0q-00014h-HW
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 12:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWL0p-00014K-Dc
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 12:40:39 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWL0n-0000fE-H2
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 12:40:39 -0500
Received: by mail-oi1-x232.google.com with SMTP id q15so3536387oiw.11
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 09:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c6LHvOc90J63so5eZbunqRgg+90Ljlg6DRiMf+4yVwg=;
 b=j+GeVa1+mbuOwh4Tat9VKE6Fab+sc+mIiSK2+QGtI01P0U0JH9uK2JPQs2dfY+iHl6
 AQjrJUx6tWUitMXcxQgKDimgz0qjIuXpQqNpYXugcolCsXsnKSO5KzjU2272Y+IiqZ0N
 HFD1v68E1CgE09gnLrY2dlvc/WHLCfG8umiruMgZlFTbX0K98qlBqlmJ1RjIG0t2I9UQ
 jtpxrV93IRf0oYIE7e7cyKfq63opfaNvExz0uJbgLsoXEGSqUYhVQCNckCQZTa+zWUyM
 joqk5pHg8OZWch69FGBPhDCnKLv1ebMGVAk/tsKwylHxK5b365zgCpwhw53JTEWOVHJ0
 GTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6LHvOc90J63so5eZbunqRgg+90Ljlg6DRiMf+4yVwg=;
 b=kQnsTNFiOiOm3MirZ1QwUORNkXzD2QU7y6pS5KFs2sChG0+SQ7/EinFVr1VYNlCYOT
 kXlDPtFIhPSDoLejXqJ65In9CCcJP0lZtGqiSKEB6k8Q5j15V1alxjtlOQjlZu1uoUTq
 v+3Tu+QWH5ie32ckVigUoO3+dFvg1OJdP75kNpOhdOL3NrJX5L1IA2ZDGYlr8A+5lhjt
 8k95kHeAD+SELFRkSY5I2yJF75CFmA04y+u6bVcttKEb/B5rv7ikWescR1z3fluXQGUQ
 3PnJlupjG3LqPUfaB1Zv7jJVBiWEf4QadeiV+aAaOeRlJewxNtspjRxQLrs4EFyiwE8i
 0aGQ==
X-Gm-Message-State: AO0yUKUf1bq6fSP8uo0oDnHDwlO6/pqY/gI81DY20KdCSR5SU8OpoL89
 0uFFEjTP0fWk7Hlq1mHs0JR1usb5/xTUGBhI
X-Google-Smtp-Source: AK7set+cUCNGnY70jyDhgzXyCY79L19CgW9nyIoMhMQShBrszIyabdP1yoA3IyKnrqDbNfKsWR8izg==
X-Received: by 2002:a05:6808:144c:b0:37f:b48d:cd80 with SMTP id
 x12-20020a056808144c00b0037fb48dcd80mr3406561oiv.4.1677433236067; 
 Sun, 26 Feb 2023 09:40:36 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05683012d400b00690df568258sm1739639otq.63.2023.02.26.09.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 09:40:35 -0800 (PST)
Message-ID: <71c44bac-fe89-a8a7-8996-c8635f1f9da9@ventanamicro.com>
Date: Sun, 26 Feb 2023 14:40:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv/vector_helper.c: create
 vext_set_tail_elems_1s()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230221184525.140704-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230221184525.140704-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 26 Feb 2023 17:40:39 -0000

Thanks for the reviews!


I decided to take this patch (acks included) and send it in together with
a cleanup of the env_archcpu() usages in vector_helper.c:


https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg07566.html



Thanks,


Daniel

On 2/21/23 15:45, Daniel Henrique Barboza wrote:
> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
> load / store instructions") added code to set the tail elements to 1 in
> the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and
> vext_ldff(). Aside from a env->vl versus an evl value being used in the
> first loop, the code is being repeated 4 times.
> 
> Create a helper to avoid code repetition in all those functions.
> Arguments that are used in the callers (nf, esz and max_elems) are
> passed as arguments. All other values are being derived inside the
> helper.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/vector_helper.c | 86 +++++++++++++-----------------------
>   1 file changed, 30 insertions(+), 56 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 00de879787..7d2e3978f1 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -267,6 +267,28 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
>   GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
>   GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
>   
> +static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
> +                                   void *vd, uint32_t desc, uint32_t nf,
> +                                   uint32_t esz, uint32_t max_elems)
> +{
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +    uint32_t vta = vext_vta(desc);
> +    uint32_t registers_used;
> +    int k;
> +
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +
> +    if (nf * max_elems % total_elems != 0) {
> +        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
> +}
> +
>   /*
>    *** stride: access vector element from strided memory
>    */
> @@ -281,8 +303,6 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>       uint32_t vma = vext_vma(desc);
>   
>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> @@ -301,18 +321,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>           }
>       }
>       env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -359,8 +369,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>   
>       /* load bytes from guest memory */
>       for (i = env->vstart; i < evl; i++, env->vstart++) {
> @@ -372,18 +380,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>           }
>       }
>       env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
>   }
>   
>   /*
> @@ -484,8 +482,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>       uint32_t vm = vext_vm(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>       uint32_t vma = vext_vma(desc);
>   
>       /* load bytes from guest memory */
> @@ -505,18 +501,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>           }
>       }
>       env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
> @@ -585,8 +571,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>       uint32_t vm = vext_vm(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>       uint32_t vma = vext_vma(desc);
>       target_ulong addr, offset, remain;
>   
> @@ -647,18 +631,8 @@ ProbeSuccess:
>           }
>       }
>       env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \

