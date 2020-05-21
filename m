Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrcI-0005C9-Jf
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 16:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1jbrcG-00058T-JK
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 16:16:32 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1jbrcD-0003gW-JZ
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 16:16:32 -0400
Received: by mail-pg1-x542.google.com with SMTP id d10so3794395pgn.4
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dpJ69Yz0J3Klb0VOJ+9rPdJICpt+UdM7X5u2idsAmB8=;
 b=XCICv3qfSXtEWQlVfS/5B3Xd9LmIw5DkxNmaHR2MRKCyWDhx9IayEL3zW8fMmoTHc3
 B5mQ0BxsRrgRpfbPfyS1Tzs5sY1o7CVZJ2A3e9QO60cb3h/fmDHoy+ZtbFbbEV5m8Y4N
 Rv2dhPLW59YVBrjGdL1iZOaY7DHlkgaH5FjYG6IuhEy+BVhezQexvHeMN3IlPnLip7zN
 xpvl0uv32lbztGeP+PW5OODDZsmNEWFzTJMwKWWH80iL4LFiYCnvcBiP253TtxUnPAg+
 ylYiGDEDsa2Gns7/+mBo3YgkzzxO7/GjxuVORHyZR20ItuzxfrovmvxinjGSCkHGI2x3
 W/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dpJ69Yz0J3Klb0VOJ+9rPdJICpt+UdM7X5u2idsAmB8=;
 b=pFVssnhXJ2xyg5ogQERjOpIPo9dd2xhqnT9eukl92L/EWyYSfWnOLj3WukgeHCTwwI
 SbdKZuOYGT/RPDnzSQmN2GmEVDLnRhfrOzK97HrzajB8IAqWotbP27GPHBL97Y439P88
 O6/U55goOAtbcnYtB+WGBfiBsPpzJEcYiVC7U7MLSMSS3s6V/Nv0dIhV5nbNfJuaZ4sq
 Py0xnTWuXv6HVuiED36w1zObKzYp5yZIoYwTynk17/YWi6OcZjrMWcOcxxfb6wTddkoH
 kvY5V3a9IQtL0Q/3nD+8WChcYQuMLQRUbahstDjLRZk7AO51xP05RQgBkaZGLLNb2FYg
 eyTw==
X-Gm-Message-State: AOAM531cjhSiGzHITS7FGKNY6A9t5vWblqPGNpTZbHNm/VzSY/p+GL3e
 CSm53C5NhpduXN9GfXypKj6aGQ==
X-Google-Smtp-Source: ABdhPJyhVUAu6VJ3eRFmMN8qBA6V6GJPhPnU2aCGzB3YcNJOtokL4PD6sQMDlv9XE7429AqodpszGw==
X-Received: by 2002:a63:3483:: with SMTP id b125mr1265077pga.136.1590092187949; 
 Thu, 21 May 2020 13:16:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c24sm5051089pjs.51.2020.05.21.13.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 13:16:26 -0700 (PDT)
Date: Thu, 21 May 2020 13:16:26 -0700 (PDT)
X-Google-Original-Date: Thu, 21 May 2020 13:09:02 PDT (-0700)
Subject: Re: [PATCH 3/4] hw/riscv: Allow creating multiple instances of PLIC
In-Reply-To: <20200516063746.18296-4-anup.patel@wdc.com>
CC: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, 
 anup@brainfault.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-467d273e-1735-4bd3-af86-09d8f0c9ab8f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 20:16:32 -0000

On Fri, 15 May 2020 23:37:45 PDT (-0700), Anup Patel wrote:
> We extend PLIC emulation to allow multiple instances of PLIC in
> a QEMU RISC-V machine. To achieve this, we remove first HART id
> zero assumption from PLIC emulation.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/riscv/sifive_e.c            |  2 +-
>  hw/riscv/sifive_plic.c         | 24 +++++++++++++-----------
>  hw/riscv/sifive_u.c            |  2 +-
>  hw/riscv/virt.c                |  2 +-
>  include/hw/riscv/sifive_plic.h | 12 +++++++-----
>  5 files changed, 23 insertions(+), 19 deletions(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 1c3b37d0ba..bd122e71ae 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -152,7 +152,7 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>
>      /* MMIO */
>      s->plic = sifive_plic_create(memmap[SIFIVE_E_PLIC].base,
> -        (char *)SIFIVE_E_PLIC_HART_CONFIG,
> +        (char *)SIFIVE_E_PLIC_HART_CONFIG, 0,
>          SIFIVE_E_PLIC_NUM_SOURCES,
>          SIFIVE_E_PLIC_NUM_PRIORITIES,
>          SIFIVE_E_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index c1e04cbb98..f88bb48053 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -352,6 +352,7 @@ static const MemoryRegionOps sifive_plic_ops = {
>
>  static Property sifive_plic_properties[] = {
>      DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
> +    DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
>      DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
>      DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities, 0),
>      DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, 0),
> @@ -400,10 +401,12 @@ static void parse_hart_config(SiFivePLICState *plic)
>      }
>      hartid++;
>
> -    /* store hart/mode combinations */
>      plic->num_addrs = addrid;
> +    plic->num_harts = hartid;
> +
> +    /* store hart/mode combinations */
>      plic->addr_config = g_new(PLICAddr, plic->num_addrs);
> -    addrid = 0, hartid = 0;
> +    addrid = 0, hartid = plic->hartid_base;
>      p = plic->hart_config;
>      while ((c = *p++)) {
>          if (c == ',') {
> @@ -429,8 +432,6 @@ static void sifive_plic_irq_request(void *opaque, int irq, int level)
>
>  static void sifive_plic_realize(DeviceState *dev, Error **errp)
>  {
> -    MachineState *ms = MACHINE(qdev_get_machine());
> -    unsigned int smp_cpus = ms->smp.cpus;
>      SiFivePLICState *plic = SIFIVE_PLIC(dev);
>      int i;
>
> @@ -451,8 +452,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
>       * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
>       * hardware controlled when a PLIC is attached.
>       */
> -    for (i = 0; i < smp_cpus; i++) {
> -        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(i));
> +    for (i = 0; i < plic->num_harts; i++) {
> +        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(plic->hartid_base + i));
>          if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
>              error_report("SEIP already claimed");
>              exit(1);
> @@ -488,16 +489,17 @@ type_init(sifive_plic_register_types)
>   * Create PLIC device.
>   */
>  DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
> -    uint32_t num_sources, uint32_t num_priorities,
> -    uint32_t priority_base, uint32_t pending_base,
> -    uint32_t enable_base, uint32_t enable_stride,
> -    uint32_t context_base, uint32_t context_stride,
> -    uint32_t aperture_size)
> +    uint32_t hartid_base, uint32_t num_sources,
> +    uint32_t num_priorities, uint32_t priority_base,
> +    uint32_t pending_base, uint32_t enable_base,
> +    uint32_t enable_stride, uint32_t context_base,
> +    uint32_t context_stride, uint32_t aperture_size)
>  {
>      DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_PLIC);
>      assert(enable_stride == (enable_stride & -enable_stride));
>      assert(context_stride == (context_stride & -context_stride));
>      qdev_prop_set_string(dev, "hart-config", hart_config);
> +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
>      qdev_prop_set_uint32(dev, "num-sources", num_sources);
>      qdev_prop_set_uint32(dev, "num-priorities", num_priorities);
>      qdev_prop_set_uint32(dev, "priority-base", priority_base);
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 22997fbf13..69dbd7980b 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -585,7 +585,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>
>      /* MMIO */
>      s->plic = sifive_plic_create(memmap[SIFIVE_U_PLIC].base,
> -        plic_hart_config,
> +        plic_hart_config, 0,
>          SIFIVE_U_PLIC_NUM_SOURCES,
>          SIFIVE_U_PLIC_NUM_PRIORITIES,
>          SIFIVE_U_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index dcb8a83b35..f40efcb193 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -585,7 +585,7 @@ static void riscv_virt_board_init(MachineState *machine)
>
>      /* MMIO */
>      s->plic = sifive_plic_create(memmap[VIRT_PLIC].base,
> -        plic_hart_config,
> +        plic_hart_config, 0,
>          VIRT_PLIC_NUM_SOURCES,
>          VIRT_PLIC_NUM_PRIORITIES,
>          VIRT_PLIC_PRIORITY_BASE,
> diff --git a/include/hw/riscv/sifive_plic.h b/include/hw/riscv/sifive_plic.h
> index 4421e81249..ace76d0f1b 100644
> --- a/include/hw/riscv/sifive_plic.h
> +++ b/include/hw/riscv/sifive_plic.h
> @@ -48,6 +48,7 @@ typedef struct SiFivePLICState {
>      /*< public >*/
>      MemoryRegion mmio;
>      uint32_t num_addrs;
> +    uint32_t num_harts;
>      uint32_t bitfield_words;
>      PLICAddr *addr_config;
>      uint32_t *source_priority;
> @@ -58,6 +59,7 @@ typedef struct SiFivePLICState {
>
>      /* config */
>      char *hart_config;
> +    uint32_t hartid_base;
>      uint32_t num_sources;
>      uint32_t num_priorities;
>      uint32_t priority_base;
> @@ -70,10 +72,10 @@ typedef struct SiFivePLICState {
>  } SiFivePLICState;
>
>  DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
> -    uint32_t num_sources, uint32_t num_priorities,
> -    uint32_t priority_base, uint32_t pending_base,
> -    uint32_t enable_base, uint32_t enable_stride,
> -    uint32_t context_base, uint32_t context_stride,
> -    uint32_t aperture_size);
> +    uint32_t hartid_base, uint32_t num_sources,
> +    uint32_t num_priorities, uint32_t priority_base,
> +    uint32_t pending_base, uint32_t enable_base,
> +    uint32_t enable_stride, uint32_t context_base,
> +    uint32_t context_stride, uint32_t aperture_size);
>
>  #endif

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

