Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIepe-0006Cn-KT
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 19:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIepc-00064H-74; Thu, 19 Jan 2023 19:00:32 -0500
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIepa-0005mE-DP; Thu, 19 Jan 2023 19:00:31 -0500
Received: by mail-vk1-xa36.google.com with SMTP id i82so1792301vki.8;
 Thu, 19 Jan 2023 16:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2L6/cN1y8IcvPVXB8DgZtdsayOsjfkLvj/cekQsNgo4=;
 b=ba1qp6waQ+PGIXrQwGdUbMcC12jpWRqHk94DuztjfjT8/KyuvBLNFZAyhwaGWU2xo7
 cW3+U68uIGXBpfzaJ1+afb0LyYCPBE+Rb1tg7TGqQzXrd+zSJix2wArb6RpoXTU0U5fZ
 cRFJhdWoRDsyuJ+H0o9mhG/0vv2WTla2uT1ThUo4wZKlsNjH8fug+5FfxWSFgLSI6mtx
 XPytPn4miM9FtfMVaWp3KZP/Q0jsv6iXZStJeHNGca/TK2Z3KpaWG9148RZA+30g0dbB
 SKYXXkRlBKgeMnGsRKO+teIcse5t4UceJOhrdnqMWTPXejOg+hqD+YEcxvIHEk/oXBBw
 FM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2L6/cN1y8IcvPVXB8DgZtdsayOsjfkLvj/cekQsNgo4=;
 b=oFE8pB1S4WUHsTnIdvqjbpfrIpNKvornNLCRR5U2a3459OTZ9RZ7i5hwjLjqGBY0rk
 FNUgZfZWgda05XwtRaRLAF/x64U34SGD4IPGlwov4ycyr3QjF/h5rg+h/5X/vTyOYtqh
 Srg4QlnzCo/2giisXYeG3/yYuNHaGvuTj0I3T8x9+kufeW1LFRD/10dIdczK0Jl+G2NK
 pcvqJL1n8FAjEjj5Ia5ZbJdPoqWfzPFTvLI0Ag9U6hdVsYkhQcHzgtqt1KJN5ftQDQmz
 16qVQIzfjvehJqRC4U3dRShxXgcCuylXOgMQKFmev1gKTg/bwcGYwuipdRKpjUELhSYI
 quVQ==
X-Gm-Message-State: AFqh2koImILASqpXDTZ2oGgsZR2tTQQLrTd94gBrlQhU8bmcM7hWp/bt
 sK69Go1TGgepC/J9xJ4VDNdc3lIs/tTkJTgU7pcECXcOcU8=
X-Google-Smtp-Source: AMrXdXua5mO9KZHaUF6Ju1g+rDP0gKREBk/J/pzWeZwQAmfine587Go6Lb4DlKmRjJgIHfjVjBcvOgw4xZgtvCkVM8Q=
X-Received: by 2002:a05:6122:924:b0:3d5:5f93:53f with SMTP id
 j36-20020a056122092400b003d55f93053fmr1728465vka.7.1674172828585; Thu, 19 Jan
 2023 16:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20221211052745.24738-1-vysakhpillai@embeddedinn.xyz>
In-Reply-To: <20221211052745.24738-1-vysakhpillai@embeddedinn.xyz>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Jan 2023 10:00:02 +1000
Message-ID: <CAKmqyKPP5j38DesO7oU7FKJdqOuXmx8mJDqyOO-8CCC+Jf=Opg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Add support to change default RISCV hart memory
 region
To: Vysakh P Pillai <vysakhpillai@embeddedinn.xyz>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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
X-List-Received-Date: Fri, 20 Jan 2023 00:00:32 -0000

On Sun, Dec 11, 2022 at 3:29 PM Vysakh P Pillai
<vysakhpillai@embeddedinn.xyz> wrote:
>
> Add support to optionally specify a memory region container
> to be used to override the default system memory used
> by the the RISCV harts when they are realized. Additional
> memory regions can be added as sub-regions of this container
> to dynamically control the memory regions and mappings visible
> from the hart.

Thanks for the patch.

I think it might make more sense to send this with the series adding
your board. It's a little difficult to picture how this is going to be
used otherwise.

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

I'm not sure I follow, this is a uint64_t but the default value is NULL?

I assume you are using this as a pointer then?

Alistair

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
> --
> 2.34.1
>
>
>

