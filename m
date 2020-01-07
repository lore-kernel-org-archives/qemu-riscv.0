Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iotam-0007nk-6r
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jan 2020 13:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iotaj-0007je-IS
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 13:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iotai-0003WX-9D
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 13:28:33 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38462)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iotai-0003Vg-3a
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 13:28:32 -0500
Received: by mail-pf1-x444.google.com with SMTP id x185so275827pfc.5
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2020 10:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=83W6ZA3gNbLCplWGe/dUqMvuWMBcJAboATXE1vGpk4A=;
 b=tc2315Qa7M/Fllb8RfmPNbGngBGybQSPK7WgmmdchKvr+bGH7NfULv7XzMmRtp6VQH
 wMDKDdrX+6NOYNrgCzL33WnMRk0a1LrBqanCTwj/EZKDmaZLY73/xIs/BVTovGDxZPk0
 /dMU5WR19FljT3wdsZlNU2KdQK8cdhwcvPouxBKctJBiqw+Ji/Ggy/W6jzC1Si1Zl0bY
 VCGUC5Hwlkh7oVjqHJJirjIqsCZzGpqhHWaKei7NtqaSkwdFt/AV/2aPkczj+AMWELQf
 xGlwUzoyElXcSA4v/jyBhm/lWqus6OyGUdpKozECPdgMUG/66Ry6vTE6BNxc0TqJ240K
 uFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=83W6ZA3gNbLCplWGe/dUqMvuWMBcJAboATXE1vGpk4A=;
 b=OJ1lXm+SilYzhGyZFVFaEb4jbkI4KsrqxJT9LWox+9BiFEnEzxjFu9VSxsSCP68mrE
 BEoXLZo/6v5/BID9PleOtLAz6FXqKKUakJguwE/w+OwEVVJGUpuYjHc3pej4/EPXlhNc
 29M39QvXMFKLrBNmSuESlf8l3d2B/qm7TOmb4ay/R7C+oMu85kYDLCNIr3QqHze+SdKn
 SjyURgYncvX4eK7we9S5DGhADDpE3dIL0+lcLykG+wvbgfUB17YGVUVKHkWC4Ga+sIB8
 rSIDQD532M6zkZBSQMk572bgl/CAcKZZuvU0XQ0cuUBG3CFx4RF6Q9A1rE1JJvSpHo1y
 FNCA==
X-Gm-Message-State: APjAAAU9uIyBM77cT/QXQF4xRC6cLjh9FVTK1iuShO9xw5lzbZzeBeG1
 xLZ7Y8O8JYWGhjSgYOce4AMG7Q==
X-Google-Smtp-Source: APXvYqzLvuBGpUUvGgiEw4wdbP9GYH1byYrvGktLwnChsz2pHR1E515egoyjaIC9B7TzEht1bs3JCQ==
X-Received: by 2002:a63:9d4e:: with SMTP id i75mr783281pgd.231.1578421711043; 
 Tue, 07 Jan 2020 10:28:31 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id y21sm226935pfm.136.2020.01.07.10.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 10:28:30 -0800 (PST)
Date: Tue, 07 Jan 2020 10:28:30 -0800 (PST)
X-Google-Original-Date: Tue, 07 Jan 2020 10:28:07 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 07/36] target/riscv: Add the virtulisation mode
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <ee07ff556701bfdf0173e73d9ac393273a07d2ce.1575914822.git.alistair.francis@wdc.com>
References: <ee07ff556701bfdf0173e73d9ac393273a07d2ce.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-0d25d117-c97d-4643-9904-fc11f821eeee@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Tue, 07 Jan 2020 18:28:35 -0000

On Mon, 09 Dec 2019 10:10:58 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  4 ++++
>  target/riscv/cpu_bits.h   |  3 +++
>  target/riscv/cpu_helper.c | 18 ++++++++++++++++++
>  3 files changed, 25 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bab938103d..a73292cd20 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -117,6 +117,8 @@ struct CPURISCVState {
>
>  #ifndef CONFIG_USER_ONLY
>      target_ulong priv;
> +    /* This contains QEMU specific information about the virt state. */
> +    target_ulong virt;
>      target_ulong resetvec;
>
>      target_ulong mhartid;
> @@ -269,6 +271,8 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> +bool riscv_cpu_virt_enabled(CPURISCVState *env);
> +void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index eeaa03c0f8..2cdb0de4fe 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -430,6 +430,9 @@
>  #define PRV_H 2 /* Reserved */
>  #define PRV_M 3
>
> +/* Virtulisation Register Fields */
> +#define VIRT_ONOFF          1
> +
>  /* RV32 satp CSR field masks */
>  #define SATP32_MODE         0x80000000
>  #define SATP32_ASID         0x7fc00000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index c201919c54..046f3549cc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -82,6 +82,24 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
>      return false;
>  }
>
> +bool riscv_cpu_virt_enabled(CPURISCVState *env)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return false;
> +    }
> +
> +    return get_field(env->virt, VIRT_ONOFF);
> +}
> +
> +void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return;
> +    }
> +
> +    env->virt = set_field(env->virt, VIRT_ONOFF, enable);
> +}
> +
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>  {
>      CPURISCVState *env = &cpu->env;

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

