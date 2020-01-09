Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipNZW-0007dZ-NZ
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 21:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipNZQ-0007bJ-70
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipNZM-0007Ht-VC
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:12 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipNZM-0007GA-NN
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:08 -0500
Received: by mail-pf1-x443.google.com with SMTP id n9so2560463pff.13
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 18:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=c1g4KjNM+qkVDVTlknC7rp97fBZUpR2N0uQTHXmdxPw=;
 b=v3sg1jl2PhAGEgNA5gc+TG7kPpfhw2ek/p8HujvU/8ckuTj0XiYryrEBRlX2mVd+ll
 v63dEf/RXGIdTBVetE17ASAIUGbabimCerPbkl45fzZ1Rp13hPdWLtG2zIQOYKn+GA1k
 0J7NkRyxBUE0O0tVBx4bzDICmNVo2Q4VW9hsU2f6KFYOA4HaQF5hfar/8dvNdGk+RUAg
 emJrb42Rpks2rR6OgD1AHPO1k7FfchkEANSKpGU/u5RmKLhOGt97Usx/d0GbOSNqhrOm
 K1WmBX9fY8XwEG9CfA9c1bUNUqba9E5nNVLm3EdKa+7K3OZeH1YqZmQSCUohAusnbsgf
 Ne5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=c1g4KjNM+qkVDVTlknC7rp97fBZUpR2N0uQTHXmdxPw=;
 b=W51GpV/oovNaYLY7g0DgebfI2lEeW/15BtHsVyIFDRP23CDm01M8IFRWWHRj/ASmaR
 WGyKQeCWZMczIKNqfh/Oreo3PMsIiSkGIwFsDIQP0ns0zcFJh5Ve96n3zIR7Xle905Fy
 5E59n1MskVHVuKxkZKro9dGLaNMYICQKwdzGzqoQMqc6HQ8FKcnbaffqLVQTKH5iPRgr
 SkKa/WcazS7PSiI7+gr8mTC8btXikPKUUuazy0d/tUbS8MAX2zuHHp2mJMuihhrchvtx
 Ol6w37/bUOfmY77Ic+DyE0xCHLcekEC3sm0Iy8olqMIZdLqXQf/mQHtJqD9oIaFM31wI
 c+eA==
X-Gm-Message-State: APjAAAUQxe2RKHyLJadZUykav1RicfL0NCnrXD1W+PxBRJZTlovkaRmH
 XsA4e3Vui7/ZMQwvvPsBygwccw==
X-Google-Smtp-Source: APXvYqyEeCBzdLzq4pOo9ZRxOQqfdwJ4r5z87zXhpUzSbk3JIUSpgWEaQPs8hIWNejyt3Q0BleALxQ==
X-Received: by 2002:aa7:9562:: with SMTP id x2mr8587219pfq.147.1578536947505; 
 Wed, 08 Jan 2020 18:29:07 -0800 (PST)
Received: from localhost (189.8.197.35.bc.googleusercontent.com.
 [35.197.8.189])
 by smtp.gmail.com with ESMTPSA id q11sm5193077pff.111.2020.01.08.18.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 18:29:07 -0800 (PST)
Date: Wed, 08 Jan 2020 18:29:07 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 18:27:19 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 33/36] target/riscv: Set htval and mtval2 on execptions
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <3d0d12048c2cf4c5c5ec888b9ff602620285fa5b.1575914822.git.alistair.francis@wdc.com>
References: <3d0d12048c2cf4c5c5ec888b9ff602620285fa5b.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-2a93260d-6691-4cf1-920c-01af14feedea@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Thu, 09 Jan 2020 02:29:18 -0000

On Mon, 09 Dec 2019 10:12:06 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 43c6629014..aa033b8590 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -841,6 +841,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
>      target_ulong deleg = async ? env->mideleg : env->medeleg;
>      target_ulong tval = 0;
> +    target_ulong htval = 0;
> +    target_ulong mtval2 = 0;
>
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
> @@ -900,6 +902,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
>                                           riscv_cpu_virt_enabled(env));
>
> +                htval = env->guest_phys_fault_addr;
> +
>                  riscv_cpu_set_virt_enabled(env, 0);
>                  riscv_cpu_set_force_hs_excep(env, 0);
>              } else {
> @@ -910,6 +914,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                                           get_field(*env->mstatus, SSTATUS_SPP));
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
>                                           riscv_cpu_virt_enabled(env));
> +
> +                htval = env->guest_phys_fault_addr;
>              }
>          }
>
> @@ -922,6 +928,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->scause = cause | ((target_ulong)async << (TARGET_LONG_BITS - 1));
>          env->sepc = env->pc;
>          env->sbadaddr = tval;
> +        env->htval = htval;
>          env->pc = (env->stvec >> 2 << 2) +
>              ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
>          riscv_cpu_set_mode(env, PRV_S);
> @@ -936,6 +943,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              *env->mstatus = set_field(*env->mstatus, MSTATUS_MTL,
>                                        riscv_cpu_force_hs_excep_enabled(env));
>
> +            mtval2 = env->guest_phys_fault_addr;
> +
>              /* Trapping to M mode, virt is disabled */
>              riscv_cpu_set_virt_enabled(env, 0);
>          }
> @@ -949,6 +958,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->mcause = cause | ~(((target_ulong)-1) >> async);
>          env->mepc = env->pc;
>          env->mbadaddr = tval;
> +        env->mtval2 = mtval2;
>          env->pc = (env->mtvec >> 2 << 2) +
>              ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
>          riscv_cpu_set_mode(env, PRV_M);

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

