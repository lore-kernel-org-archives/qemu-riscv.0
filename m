Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIIv4-000469-G4
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 19:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIIv2-00045Z-2z; Wed, 18 Jan 2023 19:36:40 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIIv0-0002VJ-FS; Wed, 18 Jan 2023 19:36:39 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id w72so193994vkw.7;
 Wed, 18 Jan 2023 16:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ef46n9SVz1wjhx9HrYZOJAYTKj+3Rcz0anhWanHanmg=;
 b=iaxukPWH8f3beKBiWAduRYQPfe3pFiQNEgRAVHau03JlX8z2duL6iH/HJfQzcwnDI9
 m2Yp5t5syvkQUD+vAOc6Zbhc1fI11aPLhe+79STSss55GgJniyOHdsNZXJOaOE7B2kTD
 WpMqF4IbonHR6EmC00E4RdR7x8PnO5QKDjsAqEDaQPNSF/qXeekLDyPtKboVRZGXZmoq
 ny+ITgnR5/WOB6r7Grfb5ypFjCmpPfjkBxQhTjxMDAV83k9Rm4IqNUYSh4YDOTukSwqP
 mMVvaMDVoA+eo1VZzIlcdZfc4Ut6X7TOhlS06zSYqgtKNBZTJXrgWE1tqMqXgoNToMJW
 2xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ef46n9SVz1wjhx9HrYZOJAYTKj+3Rcz0anhWanHanmg=;
 b=CnTO1v/XQwivtNPSujMQCM7F99kvNNOJaIg+FAmhjv6xE5mW/gZaCLJGUS+Xvao8f/
 2qbkaoiWy7t4TtRYu7AqSpUgPo90YblSZ4IVX5VYEG89/ozlRf/b2fe8W2/cfd4/CueY
 ssgbUmTfrfylnLBw036dAaPO4xIQ65oOP6W2milmr+HD4WfNhKVXrPFDA+9S/nz4voJO
 LsNl176CAUdqICwDM9QppjYXHvupQGV8nPuIGEpf1LClG/InPqrwsVUqj7/Sw8cKKukA
 PeL7Bl4YQfXtTQXU25TOmbrN8x/FbMmsPu/LaqQIv8Fs+cdWzjATMaaEqOTM+mfYoS54
 zD+A==
X-Gm-Message-State: AFqh2krBtyq5JFafGv2FJ+NY8lDzNHHrtW1a813V4FbZGaxtqsVQgK4w
 79dNK192UalzPQTF/IQjoxNVxXsP08tbIzLg87M=
X-Google-Smtp-Source: AMrXdXvKzhMWQBWfkZ1PeEfIpgplb2IV/DQFPZyEvUAbu3gAtV//kFXqpbhgj74YYX09zhFwrltneaFJ3ppaK6CmA6c=
X-Received: by 2002:a1f:9441:0:b0:3d5:6ccb:8748 with SMTP id
 w62-20020a1f9441000000b003d56ccb8748mr1166847vkd.26.1674088596338; Wed, 18
 Jan 2023 16:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
 <20230116173420.1146808-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230116173420.1146808-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 10:36:09 +1000
Message-ID: <CAKmqyKPCz3uw3mCfBkheL6a3DYm9XsvVYh2CA-iiXqQPniz25Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/riscv/boot.c: calculate fdt size after
 fdt_pack()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 00:36:40 -0000

On Tue, Jan 17, 2023 at 3:35 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> fdt_pack() can change the fdt size, meaning that fdt_totalsize() can
> contain a now deprecated (bigger) value.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..dc14d8cd14 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -253,8 +253,13 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>  {
>      uint64_t temp, fdt_addr;
>      hwaddr dram_end = dram_base + mem_size;
> -    int ret, fdtsize = fdt_totalsize(fdt);
> +    int ret = fdt_pack(fdt);
> +    int fdtsize;
>
> +    /* Should only fail if we've built a corrupted tree */
> +    g_assert(ret == 0);
> +
> +    fdtsize = fdt_totalsize(fdt);
>      if (fdtsize <= 0) {
>          error_report("invalid device-tree");
>          exit(1);
> --
> 2.39.0
>
>

