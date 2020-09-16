Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIZ3k-0003tl-V1
	for mharc-qemu-riscv@gnu.org; Wed, 16 Sep 2020 11:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kIZ3j-0003tU-NC; Wed, 16 Sep 2020 11:09:23 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:43612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kIZ3h-0003jT-T9; Wed, 16 Sep 2020 11:09:23 -0400
Received: by mail-il1-x144.google.com with SMTP id a19so6766782ilq.10;
 Wed, 16 Sep 2020 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cp1nQNSJZYFqExPKtlSIw+KN5UoZdZcDnVE2Pzd2ll4=;
 b=dxEfLIV6/SwuqCke2EGqhzwpHZMB/awZ80ISZx8Z9gQGEHBbmDTeUBoDqyKwE9cP7D
 +i0x345H3fjGnY/Qhwl7RF73V9n9axdmR4bkKlBVzx+p6trG8k5BofdKv0c060AuNalP
 0WYbzQjt1DDgI7Wot29J9ia+sxTWdbLnXCUn5TLPrQ5wWwC3qiDaGUL8y+fNGKPpbr59
 rz167JxPfoqCp39mSbnQ9ivQY5U+hhWTB57A7YckUjbfesUIvuY5aY+/XCSMZZXlKIcw
 roPBY48rLDTEjG8flMoaY3LuW3LKam9cO2TnQeGdweJnaVvF99mv6TYnLmf+V+q7tBIb
 tPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cp1nQNSJZYFqExPKtlSIw+KN5UoZdZcDnVE2Pzd2ll4=;
 b=NBLq/gld+7ulAQrTTJP0Tk/miQf/aj9EHD4L9DNLjwGes5FzrDdIDjtxTxMtQXwm+L
 3YVRO2SewwU5AHLWSPqFM/OhfDG/yQAV+2QbXW/3iyVdRmt14RI3xY6gwuIqaVXR69Y9
 IA22eFTIkV7p1GxXDG5PMSlNyzVGmyyf3ShOx9Iu5zoewX9bXOZNNWfN5a/RbXCtfuaL
 96XGjwBBvhYNlvKAfV4XY54y4JTJ+0UeROIUtqrtcAHx69Nz5ROuGYw6E8bd1LOXyZeq
 Mk4VdcpG3gg/lZR7bE8A9r0ftqPu8nZBgtUHtItG/WAwbhaEsoai4f8q4JonAitezHZ4
 BfrA==
X-Gm-Message-State: AOAM531uNRWbYfHGYYW/zYFhNsJjItlQ60LdXK39rXx5/eRKdVHmFIj+
 cHixqzTSpO8xhU+2RPaqJlHsmIcnthvjzfwE3+Y=
X-Google-Smtp-Source: ABdhPJz5khR/CMUQEgC5KuMpjOGbEVVQlQu/XffkxaBTatFbn7r8bOH0cN0keakLKufxykyGOVzUY9HQ6WAjNHUta3c=
X-Received: by 2002:a92:8b52:: with SMTP id i79mr21914665ild.177.1600268959652; 
 Wed, 16 Sep 2020 08:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200916004638.2444147-1-richard.henderson@linaro.org>
 <20200916004638.2444147-6-richard.henderson@linaro.org>
In-Reply-To: <20200916004638.2444147-6-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Sep 2020 07:58:08 -0700
Message-ID: <CAKmqyKOxB8xYNUFhq1NMhdiEW0zJV9pS94PdeBSFSV+JgT03ow@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] target/riscv: Set instance_align on RISCVCPU
 TypeInfo
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 16 Sep 2020 15:09:24 -0000

On Tue, Sep 15, 2020 at 5:47 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fix alignment of CPURISCVState.vreg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: qemu-riscv@nongnu.org
> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 57c006df5d..0bbfd7f457 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -628,6 +628,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>          .name = TYPE_RISCV_CPU,
>          .parent = TYPE_CPU,
>          .instance_size = sizeof(RISCVCPU),
> +        .instance_align = __alignof__(RISCVCPU),
>          .instance_init = riscv_cpu_init,
>          .abstract = true,
>          .class_size = sizeof(RISCVCPUClass),
> --
> 2.25.1
>
>

