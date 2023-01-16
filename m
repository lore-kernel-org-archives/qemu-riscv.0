Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGZG-0005vf-MG
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 22:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGZF-0005vA-2j; Sun, 15 Jan 2023 22:53:53 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGZD-0000vu-Je; Sun, 15 Jan 2023 22:53:52 -0500
Received: by mail-vs1-xe29.google.com with SMTP id i188so27840186vsi.8;
 Sun, 15 Jan 2023 19:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V8YE8TK8E3peRZJOp78aGJA1MtciRn9S8MKyevbFhek=;
 b=DmWkVZpIKQQ3PSbmy55ADOiVMUNmVOgvsjdgebA3b0+aIYPh+bPcxuHbw6DTkcUu8P
 39HB2GDG779Boo7kUotlxT8dhlPSXjN3BvBH3DEPRea5LzKTtD05xva2z7RPM1U28vgE
 MtxExi7NZ5hLEHzHVf4bR8BpSPp5ZPmGZlGFrbOvE0cIiFecg0r+3+LfpTVIq1TUC9z2
 nY3whLSRcxL/RbFGXeIIk15gvrpr5pHx8kh7S0/+tz2VLR/Elxj1qWUpZBrf5+P6W1tO
 getsELBTQGz7Z2067r7E52KHdniEfGQlVNRmaoIQpF6BCjd1zJ0+Nfw0ZS9v7HIvDlpg
 FY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V8YE8TK8E3peRZJOp78aGJA1MtciRn9S8MKyevbFhek=;
 b=2RuB8q+Ar/u2qK8ZF7Bhf3xFdVGk5qIQZ4pSmtR/ttzri72udE0bE8OoOw97u4BjD5
 DS8Q7wgU+giB+vQOZapiAw6sXrvT2Q2GZYeDY2VEF2KKiRMblrqfbAR8PVJcw/vTiJAi
 jmHmXqsu6ty59ylXLQd8RK7oPUOxL9maL6n3VjogKcZZWOGLZa3cW+TBAhR9eOy9n6Fk
 QFx1++m1W3yi0pKAQfw3IdcmHYzkSn4Qu+yMFRmfz3lYrxHe52FQXcw7z3+jV4UJRRqo
 LrZ3IAVXy3lfzTimFaibTcpUIDkNIrwAwvsSm2Z02sbTUMRxN/Ij90pekYcl9oHg8psQ
 5K6g==
X-Gm-Message-State: AFqh2kqNkZ4gDK0jJrAw3qaapXf5GYgRDBhje34JHIu3zYBnpqgo7BK6
 6zL/CEshLBhukT1cc+MD6iO/QwV1THSOAv/J334=
X-Google-Smtp-Source: AMrXdXsNV4pWmOBbyoS8RptIYl1nFz+W8u/nwD/8/xjkN8Yc3hWN7T3Qa3MJQVcBes8bsiV1A2fMlksGn0pDXNYwvrA=
X-Received: by 2002:a67:c508:0:b0:3d3:c7d9:7b62 with SMTP id
 e8-20020a67c508000000b003d3c7d97b62mr442491vsk.72.1673841230095; Sun, 15 Jan
 2023 19:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
 <20230111170948.316276-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230111170948.316276-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 13:53:24 +1000
Message-ID: <CAKmqyKOmRACuN8hDi_ivWpC6z+Vv+NFskt9vfsQYGpzkzT=o5w@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw/riscv/spike.c: simplify create_fdt()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 03:53:54 -0000

On Thu, Jan 12, 2023 at 3:21 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'mem_size' and 'cmdline' are unused.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index c517885e6e..4a66016d69 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -49,7 +49,6 @@ static const MemMapEntry spike_memmap[] = {
>  };
>
>  static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
> -                       uint64_t mem_size, const char *cmdline,
>                         bool is_32_bit, bool htif_custom_base)
>  {
>      void *fdt;
> @@ -299,8 +298,7 @@ static void spike_board_init(MachineState *machine)
>      }
>
>      /* Create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]), htif_custom_base);
> +    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]), htif_custom_base);
>
>      /* Load kernel */
>      if (machine->kernel_filename) {
> --
> 2.39.0
>
>

