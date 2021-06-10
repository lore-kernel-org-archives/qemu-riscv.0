Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrTyt-0007Ja-Hw
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 19:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTyr-0007GQ-Mk; Thu, 10 Jun 2021 19:20:57 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTyq-0002Gi-1I; Thu, 10 Jun 2021 19:20:57 -0400
Received: by mail-io1-xd32.google.com with SMTP id l64so7255808ioa.7;
 Thu, 10 Jun 2021 16:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fqWf4Mru0Y63BTk3wp7hPv/I324+cILLCDFIFi6SfXM=;
 b=Ah+DM+E4xYmV31vnq0+ZkLRVmRXjVbMCG1H5k5ocf4S7wN2GEAzqSBXIYzTA9B/1s1
 3gPIrho3Wey4yzzHdQyTEmv2tl+Nw5LqlKGjj6bLy2Mtm6PXOn0Z8iXBAd6ZlEn0wzZs
 WL/31JHlv+h58rP0QA9mPTtW9w/lCqVd1tiTWJCDeXEpEmH/UU+AUNwQxgFOCuvC6jq4
 9wKppyKv5/hp8uYp48uOG9hwAZzwKG/loUZJxF+qAj4vk/TTE2jFcI4O7UbBZcM7MuyY
 uyBhagKds/iWaUfVxCY60BL7z9IFI0r4p3wquHY0Q46QfDBLuCnFZfCMfhIpnKuPfwp0
 eRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqWf4Mru0Y63BTk3wp7hPv/I324+cILLCDFIFi6SfXM=;
 b=Tsm03bPW4l8jRnSuEY536/aiJ/lb/CEyQJZw9H0Sk+xr2t3qX9eRP3yWyRaj/1np6t
 kEK7QT8+bxi1JQsAi1yAzpnNL3JcLuuccxfYYGiJAe9G7kwzRONMCQeq1qEH/6itiZru
 7ugs+nXYjFKlsdjrpEjY0r72KaR9cL4tuaAfX9lRySpcEBZ8Dl2W8xm0Us9ZD71dGLnC
 ErEoB/39gcUWmyAOOwVLUsw10nTXeESnLo+nv/9oId2CA2VW+H0mCASns+kv6PrtCb7p
 P6BQppfCY2KC74LVdq8Le5tYpnk/BiU62BFiu2KKIlpqqlGpMz2TE5Mx/WdxVvUBI2fD
 4TvA==
X-Gm-Message-State: AOAM530jpmno2e5nfXX0j2lO72ksvWRziAVfZhmRVzchqVqC6EFgSuso
 lQh/5uf2OpjWsg+8bHcAw96lV8RT7FyKVwKgSWA=
X-Google-Smtp-Source: ABdhPJxhsb4v/DceC6HOizD1kDM2ajjaKwY8iJAPULqwP/IFzPCNylPr5ZU10IamfK1KwfLjrBYyLCmRIYbbpiDReCo=
X-Received: by 2002:a6b:d609:: with SMTP id w9mr755914ioa.118.1623367254499;
 Thu, 10 Jun 2021 16:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <20210514143242.377645-5-anup.patel@wdc.com>
In-Reply-To: <20210514143242.377645-5-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 09:20:28 +1000
Message-ID: <CAKmqyKOWwsv69EpRqJ_sjLmfq2fzjCHnLe+VU4ASVNK7Oj133g@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/riscv: virt: Use AIA INTC compatible string when
 available
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 23:20:57 -0000

On Sat, May 15, 2021 at 12:36 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We should use the AIA INTC compatible string in the CPU INTC
> DT nodes when the CPUs support AIA feature. This will allow
> Linux INTC driver to use AIA local interrupt CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c0dc69ff33..981a3a06d5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -262,8 +262,15 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>              qemu_fdt_add_subnode(fdt, intc_name);
>              intc_phandle = phandle++;
>              qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandle);
> -            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
> -                "riscv,cpu-intc");
> +            if (riscv_feature(&s->soc[socket].harts[cpu].env,
> +                              RISCV_FEATURE_AIA)) {
> +                const char intcomp[] = "riscv,cpu-intc-aia\0riscv,cpu-intc";
> +                qemu_fdt_setprop(fdt, name, "compatible",
> +                    intcomp, sizeof(intcomp));
> +            } else {
> +                qemu_fdt_setprop_string(fdt, intc_name, "compatible",
> +                    "riscv,cpu-intc");
> +            }
>              qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
>              qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
>
> --
> 2.25.1
>
>

