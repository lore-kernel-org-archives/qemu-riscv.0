Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7464AE7716F
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 23:38:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIywD-0003ge-9Y; Wed, 04 Dec 2024 18:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIywB-0003f2-8H
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 18:37:43 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIyw8-00011R-Eg
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 18:37:42 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-29737adb604so274287fac.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 15:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733355459; x=1733960259; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wm+YprTKZReL/LK+leQhteNkdpgiYwW0BQBegMkxYto=;
 b=EHWHKM8z3MGn8nfIBkvXtwaGyUaq4YnbkbVBYr+y4YlM7EUDo/m7R/tZUcrON73tT0
 2F9GcyBR5XV1L5LogHZTpEktrqaG32FteyWx+6HIwfoMrWI2bpa4cD7OhD/ZinC2mjDW
 5W0ltVBs3yGO/pw7tR6kS8ub7s2L2VLqk2VZldwZjLYKq9+LoQi87emY7+LxklJ+DqLR
 2ziEzqcEs22bl9lZ243XQUtzBJHnDST9dGYB3AYwx4+Um1jFLf/Ru5LlO6LE1s8UlCEO
 dAuSEfWzcpRGiAe1AgC8p86VH9Odh4lSWsk/l7zxvplMYZX4oCsq/osoz8VPUat/kscM
 4VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733355459; x=1733960259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wm+YprTKZReL/LK+leQhteNkdpgiYwW0BQBegMkxYto=;
 b=jfG2BGu55oBKD/4sn0AvnIW/sLy5hLo5VaPOEP0u3NYwaOm+uoYc1q2Q2HT5GJIRMe
 wGuGIBnoojRic3DTMxYEcOator6xXiqVqm1Ry8/bp8p5mO1OOIeLeixcCD/EM7VWstmV
 PjWpOzgaiNsnSmjFe9JiHbfj7IhG6aHSU/2t8OygnwtnOvvTrL1WIvwuOISLSMvWrROB
 IjhRniBZy6PFhEO6+2iwLYRfxXTKl8nCEXjihl9Mo7YUDWVLBp+oCAxq43clclOhTCfR
 e6Z3mP6CuUUIBIySQhqvVtEU24bq3pMFAg5TEbm/5oV5HvgZZxyaSz3DuxCSlQcDEQFv
 4TzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmoxcrQQAAJoVSHmQeWwjBE6hi+eZoCybUNZZJ/8UXZ071X/q8Gx5jmZm+DTnYb1zcKDnglySqFlmY@nongnu.org
X-Gm-Message-State: AOJu0Yy2JWyPf+02qlsTMjx5tc2yxjcrjebQcqiHyyoANjGvKL3+UgNe
 wxe+9I80pyoImIYXM0ZWaO9lpybNowbtLA32Z9e7gVCQHJXTFC2l9xR8Ep3Wsd4=
X-Gm-Gg: ASbGncuOfRmx9bGgFm4bMnYtEHttk+5N7ny7DJG3W8JFgoJS7pI/guWPmzBz/83uefP
 IfezO6VfW/19lfV/iiPTdzNu9JcVMguvs3a6+WE+MrL2pCHtzk/XN/OBn8zqA09RJyaqVY3/AfL
 sCPH7H+sUuispvUvcrwzFbAVc1+PibnM5v8Xb7uEHchvo/peX5aFDcSwFaxTQOFmELGZBiEfdxA
 egdMc+RsVzRkZ4D2HPrUR6AF7LqUCrt801cAsYnaAndtwlOb/bEyehoRU46eNwNTA9Y42Ntl7cd
 JXfkiZj14KA3rMIo1Z/Ha05OIRZW
X-Google-Smtp-Source: AGHT+IGQsmUAz55PbS5EOvlhoU2E/aJNx/BDCXWj4pV0epb2rOhhk8aiNJjl0hBDH+VvoB2qFITnFw==
X-Received: by 2002:a05:6871:80f:b0:29e:526a:eeef with SMTP id
 586e51a60fabf-29e88853236mr7884885fac.34.1733355458928; 
 Wed, 04 Dec 2024 15:37:38 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f569a698dsm64079fac.49.2024.12.04.15.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 15:37:38 -0800 (PST)
Message-ID: <0d698119-9ea0-4499-96ce-6a194d305c52@linaro.org>
Date: Wed, 4 Dec 2024 17:37:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] target/arm: Implement
 CPUClass::datapath_is_big_endian
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org
References: <20241204202602.58083-1-philmd@linaro.org>
 <20241204202602.58083-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241204202602.58083-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 12/4/24 14:25, Philippe Mathieu-Daudé wrote:
> arm_cpu_virtio_is_big_endian() already returns whether
> the data path is in big endian. Re-use that.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

No, this is wrong.

(1) arm_cpu_virtio_is_big_endian really *is* specific to virtio,
     and legacy virtio at that.  It changes based on the state of the cpu.

(2) The board-level stuff for which you appear to be intending to
     replace qemu_binary_is_bigendian(), for arm, is *always* little-endian,
     and has no relation to the state of the cpu.

(3) I thought you were on a better track plumbing endianness through
     properties on machine state.


r~

> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 6938161b954..3061b2ac18c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1132,7 +1132,7 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>   #endif
>   }
>   
> -static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
> +static bool arm_cpu_datapath_is_big_endian(CPUState *cs)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> @@ -2664,7 +2664,7 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
>       .asidx_from_attrs = arm_asidx_from_attrs,
>       .write_elf32_note = arm_cpu_write_elf32_note,
>       .write_elf64_note = arm_cpu_write_elf64_note,
> -    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
> +    .virtio_is_big_endian = arm_cpu_datapath_is_big_endian,
>       .legacy_vmsd = &vmstate_arm_cpu,
>   };
>   #endif
> @@ -2709,6 +2709,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>                                          &acc->parent_phases);
>   
>       cc->class_by_name = arm_cpu_class_by_name;
> +    cc->datapath_is_big_endian = arm_cpu_datapath_is_big_endian;
>       cc->has_work = arm_cpu_has_work;
>       cc->mmu_index = arm_cpu_mmu_index;
>       cc->dump_state = arm_cpu_dump_state;


