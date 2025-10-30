Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0924CCF9E3
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 15:15:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEUMt-0001B8-O2; Thu, 30 Oct 2025 11:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vEUMl-00018J-NZ
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 11:15:09 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vEUMZ-0005GZ-Sk
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 11:15:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7a27ab05a2dso1180079b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Oct 2025 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761837289; x=1762442089; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U6mJ0g/+kW+Y8nTHGzBtrH2PgIx+cPR3kGz9k168hFA=;
 b=TMapYF1wkVf4CJic1NlNie8ozlr0PubaZw/wEGKFeqvhK5SpS9qU5sFFLeIsE6Rs35
 FcKW7nIAwacC15/9uSCA0TZI9O+bGHQ0ZVIWK0Ay9/W6es9EDbzCi/aLvcLp8MfcqluL
 9QhTu+6CRcOYsw9S14t9HCbAKLSnhsqfuIt3oq168ygpuPWwpabZkNDK6JDz5aCJbZeJ
 VYqUm8lKx7EF0mIaiENQzMcpWJ/61iqblwIL/MP8AwE7wgIxFOYxqRwQvdBJLiOGRGJe
 /51koXHH6cSHtlmkHX/oXVPT0smPz0/Nd5tE6pI+0n/b5PZyHgaBNlVH8GrXkaV4V1bx
 r/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761837289; x=1762442089;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U6mJ0g/+kW+Y8nTHGzBtrH2PgIx+cPR3kGz9k168hFA=;
 b=WubR5z0XRD7ToFIzQ9vSjvLhDsiAIRWoKIAHOi1twveoXVF9cTWSe8bazR2l4Zslg7
 VIN5nYNBMLMPm2/f1T1R8X3e07eGFBwyqj7zVbfC8SH7OWuzqwAVQ3xXUQxjFsxcGdJ/
 FESuD1VYcgTxB7cjeGFFp+eulNRSCNz7rrhqP5mtLZU2jVDv+Dt2xrZHOMyXnu60ABC0
 x1kmPhn0JQEbWw+fgf78z5YDb5RL8JU+i4wwsggCgniTv6UIRRpdnX5tk+uq4wQXH5bq
 gmRtt43e9jjbQ3Z6nEi9PxuX0axib/LwHZyI8MHJo5egbI5fdATnKph8wFQAOr0ysVqu
 gi4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgvXBU4m3MORt4PExcaKy11Bm0Fu7qJwxsWqJbmaeegfhPWlnE4DnLJFzVFnC6FlV1wiDwdW3y8VIt@nongnu.org
X-Gm-Message-State: AOJu0YxZMNQAKWpsOWPDtLDFbtTjwKk30pWXO5cKG6OneJNxnVajrPbv
 PHcGfM+D3Lru2NHgvszcBBiorN93JBoFxvkszsDo9090iICxq+xuZ1BwsUZS8Bt/f8s=
X-Gm-Gg: ASbGncvE9yNbbbpHWaK1U8VLoKE+0VMjecg3IcN7udzZJ168ph/KCBaQCLEIZ1Qd49I
 N1qqPWy9lrMMihxkjwnotmN7CEbgnbFY7joGtLCLvIGy2R+5RBXwWPqhLLH+5QQu3b+4AtbjjRm
 +GHBkcW3lhC2SSpVbN4kSaomu3FiN2Oeqn03vUHMkeiTacvCDq12fGbHjVoH9lVuAD1/8A356Od
 aBQhn55GMo6idXchzS7wRjECddEIuzIi7E6E+D9leawYgiw0iVEvnfoBtsiO3Frdt3X/SLGwyc2
 +VYdbb7ruUUz4jnWZxkyjAtyd3cguYJ46c/HksE+ZGhouRp+rS/ednAgJoS/wIyfcO4iIpQKgDo
 EIGJsFpUecivjjpfdBIzTbUiNRwPr51TMVmjO5vuwCSFOhD4yAicPRRPEw2LnfmQByOXa701Skq
 EoqDqsr8aDjqGS3dLaKCuaHkk=
X-Google-Smtp-Source: AGHT+IGnE98uTtgnQDrafPBSe7qMC3620rcPUbBNeOeUZYJLKpJrqKEVAVIS7KjZz7J7b/QKglZx9w==
X-Received: by 2002:a17:902:daca:b0:27e:eabd:4b41 with SMTP id
 d9443c01a7336-2951a422c63mr1050225ad.7.1761837288721; 
 Thu, 30 Oct 2025 08:14:48 -0700 (PDT)
Received: from [192.168.68.110] ([187.101.65.79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d099b6sm188010175ad.33.2025.10.30.08.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 08:14:48 -0700 (PDT)
Message-ID: <14f0ce37-909b-4d04-8a7a-ba9db63e5cda@ventanamicro.com>
Date: Thu, 30 Oct 2025 12:14:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] target/riscv: Add server platform reference cpu
To: Chao Liu <chao.liu.riscv@isrc.iscas.ac.cn>
Cc: ajones@ventanamicro.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 palmer@dabbelt.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 wu.fei9@sanechips.com.cn, zhiwei_liu@linux.alibaba.com
References: <20250528200129.1548259-3-dbarboza@ventanamicro.com>
 <ab8161b3-d4e9-4573-b13f-e13b9c6b322e@isrc.iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <ab8161b3-d4e9-4573-b13f-e13b9c6b322e@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 10/30/25 12:01 PM, Chao Liu wrote:
> On Wed, May 28, 2025 at 05:01:29PM -0300, Daniel Henrique Barboza wrote:
>> rom: Fei Wu <wu.fei9@sanechips.com.cn>
>>
>> he harts requirements of RISC-V server platform [1] require RVA23 ISA
>> rofile support, plus Sv48, Svadu, H, Sscofmpf etc. This patch provides
>> virt CPU type (rvsp-ref) as compliant as possible.
>>
>> 1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
>>
>> igned-off-by: Fei Wu <fei2.wu@intel.com>
>> igned-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> -- 
>> target/riscv/cpu-qom.h |  1 +
>> target/riscv/cpu.c     | 11 +++++++++++
>> 2 files changed, 12 insertions(+)
>>
>> iff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>> ndex 1ee05eb393..70978fd53c 100644
>> -- a/target/riscv/cpu-qom.h
>> ++ b/target/riscv/cpu-qom.h
>> @ -55,6 +55,7 @@
>> #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
>> #define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
>> #define TYPE_RISCV_CPU_XIANGSHAN_NANHU  RISCV_CPU_TYPE_NAME("xiangshan-nanhu")
>> #define TYPE_RISCV_CPU_RVSP_REF         RISCV_CPU_TYPE_NAME("rvsp-ref")
>> #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>>
>> OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>> iff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> ndex 4a30cf8444..ec2fbc0e78 100644
>> -- a/target/riscv/cpu.c
>> ++ b/target/riscv/cpu.c
>> @ -3166,6 +3166,17 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>        .cfg.max_satp_mode = VM_1_10_SV39,
>>    ),
>>
>>    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSP_REF, TYPE_RISCV_VENDOR_CPU,
> 
> I'm not sure the parent type TYPE_RISCV_VENDOR_CPU is right here.
> 
> To be on the safe side, I tested this CPU type using an openEuler image that
> can boot on a virtual machine. This image supports rva23s64, and my command is
> as follows:
> 
> cmd="$QEMU_SYSTEM_RISCV64 \
>    -nographic -machine virt,pflash0=pflash0,pflash1=pflash1,acpi=off \
>    -cpu rvsp-ref \
>    -smp "$vcpu" -m "$memory"G \
>    -blockdev node-name=pflash0,driver=file,read-only=on,filename="$fw1" \
>    -blockdev node-name=pflash1,driver=file,filename="$fw2" \
>    -drive file="$drive",format=qcow2,id=hd0,if=none \
>    -object rng-random,filename=/dev/urandom,id=rng0 \
>    -device virtio-vga \
>    -device virtio-rng-device,rng=rng0 \
>    -device virtio-blk-device,drive=hd0 \
>    -device virtio-net-device,netdev=usernet \
>    -netdev user,id=usernet,hostfwd=tcp::"$ssh_port"-:22 \
>    -device qemu-xhci -usb -device usb-kbd -device usb-tablet"
> 
> This process gets stuck at the initialization stage:
> 
> ```
>      Loading Linux 6.6.0-102.0.0.5.oe2509.riscv64 ...
>      Loading initial ramdisk ...
> ```
> 
> If I use the parameter `-cpu rva23s64`, the system can boot normally.
> 
> I tried changing TYPE_RISCV_VENDOR_CPU to TYPE_RISCV_BARE_CPU and found that
> the system then boots normally.

There is a chance that we're mishandling the .profile property with VENDOR
type CPUs. Maybe worth taking a look.

There's nothing stopping us from declaring the CPU as BARE though. It's
probably a good idea - it gives us a clean CPU without any enabled default
extensions to work on. I believe we can change that for v4.


Thanks,

Daniel

> 
> However, I haven’t conducted an in-depth analysis yet, so the issue might be
> with my system image.
> 
> Thanks,
> Chao
> 
>>        .misa_mxl_max = MXL_RV64,
>>        .profile = &RVA23S64,
>>
>>        /* ISA extensions */
>>        .cfg.ext_zkr = true,
>>        .cfg.ext_svadu = true,
>>
>>        .cfg.max_satp_mode = VM_1_10_SV57,
>>    ),
>>
> 


