Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGjs-00020J-3w
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 23:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGjk-0001z6-Hy; Sun, 15 Jan 2023 23:04:44 -0500
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGji-0002JK-Hz; Sun, 15 Jan 2023 23:04:43 -0500
Received: by mail-vk1-xa29.google.com with SMTP id 6so12804406vkz.0;
 Sun, 15 Jan 2023 20:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=udFX3U3RsmIClU1hUlKvTC5l9IBbeNR2IPfzHANRUss=;
 b=CxHq5Selrd3wWLuH8iyQNg3JvTVvNEOlis9f5+Kp5EzCRKmcXE8h+HiVe0KsE/PR+L
 AHggjIuedhLetyhawsc+dUMK4E2JNDTRVO6W+YPvVI7f3yVnzcjbm4gJ+0/qhl1V8wzg
 SbGOQ6Nr2SVrW6tdUYqM8QUqRbhDOJAetLlodoweFSaCyqI4wfSE7cQCTFdZUwkZTGfM
 TQ7j24bN3TnutcM2VLllMeryq+3Y+vp7JQE8qUoB5QC82/PUxeHZtoS0s0AKEZqXXp8Q
 a4Xo1hAdH/4u5weLaf2X8Zx32AxHLS336yfbfxqwR2dOzr7ErAiBByuattMGj1FcYnAy
 EHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=udFX3U3RsmIClU1hUlKvTC5l9IBbeNR2IPfzHANRUss=;
 b=uLT0H/1f/fu/xByMDZ4PycFxwjyl0uObAq6HalTevcry1yMr5wVeyxQIWey3g9NZqL
 gwC9GKc0B8nNSigJNj3NVVgtvAXN3jYpEXmBYkXmZ8ZFx8GEqH2Jh00vhA/qQ3ZEJXsl
 g2sSuzgllRURZBxptpEIw1G45Aa+pXbJeSg+p0AoIoPhjiv+zSiZHocbyx9Naumkvy2K
 km+Ph0UTTuwvAVnZ57Yu+eFsRO/iYk9j/XmMz89zILBDVoUo4w2qEDwJzPueuanPHMKX
 JSlYP35WY6QHoYQ4FPRW3QeK/n8ut45zWWT2cmAe3brzyKcitfCqzM2318mOO4AuB2IF
 5rfA==
X-Gm-Message-State: AFqh2krAlY0o1RhZDVNyqh54Bm6sOmtAAGtk5cfsOz+yAH6ui93oIzMv
 nIJYlu6MxuWK+SaMXkZoqFeuvHqbCfb5dHinwXXXL8Q/ESj+Dw==
X-Google-Smtp-Source: AMrXdXtvsKeCC3q49+Zuhh25eyI63L/IVWPizMNciqqCTi00k1YWOFSHV43yyj3luig8EDudGKpjKdY1Wwp+9CoZnNU=
X-Received: by 2002:a1f:3215:0:b0:3d5:86ff:6638 with SMTP id
 y21-20020a1f3215000000b003d586ff6638mr9136154vky.30.1673841880331; Sun, 15
 Jan 2023 20:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
 <20230111170948.316276-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230111170948.316276-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 14:04:14 +1000
Message-ID: <CAKmqyKOqrx+8XRL9DEn74h42TQs35zfpkyKTnMOQWXWuGuBdYA@mail.gmail.com>
Subject: Re: [PATCH 06/10] hw/riscv: use ms->fdt in
 riscv_socket_fdt_write_distance_matrix()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 04:04:46 -0000

On Thu, Jan 12, 2023 at 3:26 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> There's no need to use a MachineState pointer and a fdt pointer now that
> all RISC-V machines are using the FDT from the MachineState.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/numa.c         | 8 ++++----
>  hw/riscv/spike.c        | 2 +-
>  hw/riscv/virt.c         | 2 +-
>  include/hw/riscv/numa.h | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index f4343f5cde..4720102561 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -164,7 +164,7 @@ void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
>      }
>  }
>
> -void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void *fdt)
> +void riscv_socket_fdt_write_distance_matrix(const MachineState *ms)
>  {
>      int i, j, idx;
>      uint32_t *dist_matrix, dist_matrix_size;
> @@ -184,10 +184,10 @@ void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void *fdt)
>              }
>          }
>
> -        qemu_fdt_add_subnode(fdt, "/distance-map");
> -        qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
> +        qemu_fdt_add_subnode(ms->fdt, "/distance-map");
> +        qemu_fdt_setprop_string(ms->fdt, "/distance-map", "compatible",
>                                  "numa-distance-map-v1");
> -        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
> +        qemu_fdt_setprop(ms->fdt, "/distance-map", "distance-matrix",
>                           dist_matrix, dist_matrix_size);
>          g_free(dist_matrix);
>      }
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 05d34651cb..91bf194ec1 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -174,7 +174,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>          g_free(clust_name);
>      }
>
> -    riscv_socket_fdt_write_distance_matrix(mc, fdt);
> +    riscv_socket_fdt_write_distance_matrix(mc);
>
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 1d3bd25cb5..e374b58f89 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -805,7 +805,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>          }
>      }
>
> -    riscv_socket_fdt_write_distance_matrix(mc, mc->fdt);
> +    riscv_socket_fdt_write_distance_matrix(mc);
>  }
>
>  static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
> diff --git a/include/hw/riscv/numa.h b/include/hw/riscv/numa.h
> index 634df6673f..8f5280211d 100644
> --- a/include/hw/riscv/numa.h
> +++ b/include/hw/riscv/numa.h
> @@ -100,9 +100,9 @@ void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
>   * @ms: pointer to machine state
>   * @socket_id: socket index
>   *
> - * Write NUMA distance matrix in FDT for given machine
> + * Write NUMA distance matrix in MachineState->fdt
>   */
> -void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void *fdt);
> +void riscv_socket_fdt_write_distance_matrix(const MachineState *ms);
>
>  CpuInstanceProperties
>  riscv_numa_cpu_index_to_props(MachineState *ms, unsigned cpu_index);
> --
> 2.39.0
>
>

