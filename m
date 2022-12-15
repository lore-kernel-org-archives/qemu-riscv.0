Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5o0Q-00062d-DM
	for mharc-qemu-riscv@gnu.org; Thu, 15 Dec 2022 08:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p5o03-0005vQ-2n; Thu, 15 Dec 2022 08:10:12 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p5nzz-0003RQ-Vw; Thu, 15 Dec 2022 08:10:09 -0500
Received: by mail-ej1-x634.google.com with SMTP id t17so52144294eju.1;
 Thu, 15 Dec 2022 05:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uj8U+lKKRAVdvZa76RW7RM8wfGeiV/n/bTqR5WFyjrU=;
 b=P65aaY0kRg4zZWbToe2tHQYQhBus/GObq1frleWr/LWlFwW6J2XYrAutLZoMD/2iGw
 afzNYTUz3S0ZV4ezRP5QjPczbqNas8DDQbLimR8puDEqNVh9eeD6lE2oXpqMova9hFrN
 5/oBGEW1Prj6ZD2eqTPIPH8e4HWcSpW7vz23E52Dzi7f1fqLRmFoVLe7Nu5f1U+tXPR9
 BJcK0V+e2TpisGBvcwEVDvh/3opDz5s9OPHFrQrNE0pgY47jIQZCkAN45eYYvBQ3o/7C
 2PzwJWtuT5yqvS62tlB0enCQWY0VYRk3uoPzYegiL/cKXFfbeX6fV1tk2KpneKSMhsOX
 zNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uj8U+lKKRAVdvZa76RW7RM8wfGeiV/n/bTqR5WFyjrU=;
 b=1/Wwoq3T5VL9eLtKva/it4iioiADfgyQjQUgzNAB5EMwQnqHVTLaHP9MllCuCuz2OS
 5n6Dyoe5fhcccWjcMkNViR148kD64f+17S5E0Lu8EwulZYQXyMY3S7KIxPWEm2PD2g/+
 5jGGl5koefcXtmZSBo/fYVan6wNwILpyaU4wA8CIqCcOiyMBfIykmKn/FV0kuaVO96tT
 NO8k/AxSNnOCN9siDQ+nJdB8mYjI5sSMBVCHpfg3NHArvWtanxYJoZNiBqhIS5CYcaqZ
 8WW0WIvRmxFWgbjmraeJNEdAzR8VgsD/10+nywSpta8/O4QtfRPstEasJN3ijnliYnZ7
 976A==
X-Gm-Message-State: ANoB5plEdX+OyNm1i0RbB81HHNDcBDlHz/1Xb56EIaGOl8+yltZRkvNF
 hUuAYTu6AthG+R8WvIQyOC9X9tGmFTM/Ibud3oc=
X-Google-Smtp-Source: AA0mqf59xz+DfBevl3beFw2bQaoH0bh4glfLWYirsVidTN191wcENoxlZwJ41qQjB1WHnc6YbZVPC8/HnpKQ4NVXQ2w=
X-Received: by 2002:a17:907:a50f:b0:7c1:6f0a:a2d6 with SMTP id
 vr15-20020a170907a50f00b007c16f0aa2d6mr1989374ejc.337.1671109805353; Thu, 15
 Dec 2022 05:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20221211052745.24738-1-vysakhpillai@embeddedinn.xyz>
In-Reply-To: <20221211052745.24738-1-vysakhpillai@embeddedinn.xyz>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Dec 2022 21:09:53 +0800
Message-ID: <CAEUhbmU4dbAY0hiARrKLarQf6_A+DZ1McW=fQftMBfBpVy7VKw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Add support to change default RISCV hart memory
 region
To: Vysakh P Pillai <vysakhpillai@embeddedinn.xyz>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 15 Dec 2022 13:10:33 -0000

On Sun, Dec 11, 2022 at 1:29 PM Vysakh P Pillai
<vysakhpillai@embeddedinn.xyz> wrote:
>
> Add support to optionally specify a memory region container
> to be used to override the default system memory used
> by the the RISCV harts when they are realized. Additional
> memory regions can be added as sub-regions of this container
> to dynamically control the memory regions and mappings visible
> from the hart.

Could you please specify what user case are you trying to address with
this patch?

>
> Signed-off-by: Vysakh P Pillai <vysakhpillai@embeddedinn.xyz>
> ---
>  hw/riscv/riscv_hart.c         | 5 +++++
>  include/hw/riscv/riscv_hart.h | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 613ea2aaa0..7a8dcab7e7 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -33,6 +33,8 @@ static Property riscv_harts_props[] = {
>      DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
>      DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
>                         DEFAULT_RSTVEC),
> +    DEFINE_PROP_UINT64("cpu-memory", RISCVHartArrayState,
> +                       cpu_memory,NULL),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -49,6 +51,9 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
>      qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
>      s->harts[idx].env.mhartid = s->hartid_base + idx;
>      qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
> +    if (s->cpu_memory) {
> +        object_property_set_link(OBJECT(&s->harts[idx].parent_obj), "memory",OBJECT(s->cpu_memory), &error_abort);
> +    }
>      return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
>  }
>
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
> index bbc21cdc9a..3e5dfeeaae 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -38,6 +38,7 @@ struct RISCVHartArrayState {
>      uint32_t hartid_base;
>      char *cpu_type;
>      uint64_t resetvec;
> +    uint64_t cpu_memory;
>      RISCVCPU *harts;
>  };
>

Regards,
Bin

