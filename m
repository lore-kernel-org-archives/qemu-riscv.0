Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGXR-0000HB-Ts
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:48:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGXL-0000Er-Et; Mon, 21 Feb 2022 16:48:03 -0500
Received: from [2607:f8b0:4864:20::d31] (port=46743
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGXK-0001Rj-1Y; Mon, 21 Feb 2022 16:48:03 -0500
Received: by mail-io1-xd31.google.com with SMTP id e79so17639259iof.13;
 Mon, 21 Feb 2022 13:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+DNzORnvCezlmzZD3rsEARJ/OLpjwfCPP3aMzMwYIU=;
 b=ga29Z/8HSjCBlCnKJdqXHJiVXH3EQpQVsa5j52e2eTtqvv4z+I7h8VN/3u1Z46/gRd
 GVwsP0yylsntmUaGe1LKLXg2AKjxMiBNVf37+xq727sZ3H/F8LTMiG+vGaNna4bwUw6H
 /AnB5hjNqBVyLWd50PT05q0HvEEtb5GzCFhwxoan4AMlkJxAvM4UQq76Pe7htTaBpsGt
 buBFmi/XEtnIbscLhEWkSKszzDMVqVvwSIVWhGdVKUoSXjHE9Ic+jcmAlNwEVCjNEAc0
 rYibWTopu/VoczGvgHJ2KEQDkbLu6BrV/jeJ0wW4F0f4Rr6CxRJbUQbNn8nQ7l8SSjqx
 haZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+DNzORnvCezlmzZD3rsEARJ/OLpjwfCPP3aMzMwYIU=;
 b=l9cYOEcV1+oKZCZts/O4YoXXXMKAYQQhgiFWStxTxXdQqzRO9bOxTrr6VwBEhKAa+n
 ClZg1Tf4ySP96CX0xIg6JUSuxcE7DjSPImQB2XDQj3XutHRZTD4b2QGyY+5V1rAFW9eV
 w+mDQqxZ3tfwzgaNdqXLml3EyVEYdd3BjqU4Qk/CjjLTWVXx2Sbhrz0bSqqs4zqADIPA
 whkVCVVDR5xFRlVSlubN0rlL4ViOJCNUjUXHSjTNSAT2WjNPLQK64KCVJLwzGpmKhN/7
 R4Oztimysry3PyGCehyU4pcvCwH5Tw9YpXwskaYr74axvZDi9awQ4zGOOFmAqKTEz+Nv
 HJ2A==
X-Gm-Message-State: AOAM533avDygv8ocB3J/COQkB5PT+AVrInBnN6cO4yfEoLmsYt69Nd6O
 2tGJHFxU3HPHX+N4JQhNz3USJN93CRzU4zN92z0=
X-Google-Smtp-Source: ABdhPJyn5iwakeStVf5/YQpzrtEiW8JpImK1qjx1ykDb0yvkv9sR+yyQYGPBwD9GjVNACyMupUwT5lGAX8ZtFLzoUBk=
X-Received: by 2002:a6b:e707:0:b0:640:7c3f:e93d with SMTP id
 b7-20020a6be707000000b006407c3fe93dmr12721484ioh.114.1645480080653; Mon, 21
 Feb 2022 13:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20220210061737.1171-1-frank.chang@sifive.com>
 <20220210061737.1171-2-frank.chang@sifive.com>
In-Reply-To: <20220210061737.1171-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:47:34 +1000
Message-ID: <CAKmqyKOSyC6JYfCrpqS=nD3KdPGzVL5BudgEom_KbP12sPhvgQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] hw/intc: Add .impl.[min|max]_access_size
 declaration in RISC-V ACLINT
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Hoppenbrouwers <david@salt-inc.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup.patel@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 21 Feb 2022 21:48:04 -0000

On Thu, Feb 10, 2022 at 4:19 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> If device's MemoryRegion doesn't have .impl.[min|max]_access_size
> declaration, the default access_size_min would be 1 byte and
> access_size_max would be 4 bytes (see: softmmu/memory.c).
> This will cause a 64-bit memory access to ACLINT to be splitted into
> two 32-bit memory accesses.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aclint.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index f1a5d3d284..3b598d8a7e 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -208,6 +208,10 @@ static const MemoryRegionOps riscv_aclint_mtimer_ops = {
>      .valid = {
>          .min_access_size = 4,
>          .max_access_size = 8
> +    },
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
>      }
>  };
>
> --
> 2.31.1
>
>

