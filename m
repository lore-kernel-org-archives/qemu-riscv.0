Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDA0C77B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 12:47:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzGZK-0004Pf-J5; Wed, 17 May 2023 08:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pzGZI-0004Oe-20
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 08:47:48 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pzGZG-0003I1-4B
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 08:47:47 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b51eso7362615e9.2
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684327664; x=1686919664;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=syRimRkFdbFwDCuNEU0gcPIXKrdLJIAEHljByigQVnQ=;
 b=OvtsigARVvZS7A2jLmTvYS5OAD6O7SHT9FjYb6DS0lhexn8BuqH1ITrO8jIJ6Wmugr
 AgsTG0dq0hMU6w6/eevuuEHA/bgswk+8+BY9dCkJISKp4zxDZwWjIn7lBs4jAD2Y1cMr
 +Zlz7+oDVJ6wDVix2fFwIJq09dS3FpjC+/MLIfX4l0+diaTJvx1GEJ0xD2Zv+zTN7Czv
 gFlU14I5tIdXXl0oVvNVlmaqBkzZwX/DeNVM9CreNjt6l8o6tMURcDgYNTMZr7iPN2RE
 xTj5gpU3g/0pqYz04Sm6lkarSoP4Wc69TVQ9ArvR/czkOtl+4RlANne8wH2Qq5fE+bx+
 pTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684327664; x=1686919664;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=syRimRkFdbFwDCuNEU0gcPIXKrdLJIAEHljByigQVnQ=;
 b=I951vZ+QS3iiHW7/8F4sBZobjiR5nJ0xH37G5HH8jaFkldaGqXZcg5/4DLFrKbnHLj
 LgowR51xHH7k2bU61004LgvqOS8HgqWdbN2JYeVJ5k0Q5TwQpqSwKFjzqMTr8x0WHvL4
 bibQ8oRiM/0OzXf/Hy6wNUzlmqAm+kHf+tiaIPk29Ihu/vCLJzUsgpKa044DXG2K+LZt
 rXcXelVfub2U+TuTD84cZyVupwzatJNeh4HDLPJjl/l4iyZ8Z5P380YiQF+S+KRrWR19
 ODet8X0pAJZlm91otJuXdFU5PmwBOh4y7dArop5JpiDfgug6RZtkv7k3oxg06t+64M32
 aRrw==
X-Gm-Message-State: AC+VfDxy0/h5sqaknfrKyCI+PMxgPajPSXKDBP+n8PID+FtDTCSeGY03
 XIc4K4FRHStFQ35Y+jV9BCRxJA==
X-Google-Smtp-Source: ACHHUZ7df+waqDy87AgKn3itXG5GNwm6urlPpOGcyAqXMV6k8BFxapxvoGYByfdtRBkOgUUPsIGl8w==
X-Received: by 2002:a7b:c303:0:b0:3f1:72e2:5d13 with SMTP id
 k3-20020a7bc303000000b003f172e25d13mr28128182wmj.16.1684327664179; 
 Wed, 17 May 2023 05:47:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.202.229])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a7bcc87000000b003f3e50eb606sm2173089wma.13.2023.05.17.05.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 05:47:43 -0700 (PDT)
Message-ID: <a8dd5f20-30ab-903a-6bd0-15c6a91fdf52@linaro.org>
Date: Wed, 17 May 2023 14:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Content-Language: en-US
To: Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.412,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/5/23 12:00, Andrea Bolognani wrote:
> On Mon, May 08, 2023 at 11:37:43AM +0530, Sunil V L wrote:
>> On Mon, May 08, 2023 at 07:37:23AM +0200, Heinrich Schuchardt wrote:
>>> On 4/25/23 12:25, Sunil V L wrote:
>>>> Currently, virt machine supports two pflash instances each with
>>>> 32MB size. However, the first pflash is always assumed to
>>>> contain M-mode firmware and reset vector is set to this if
>>>> enabled. Hence, for S-mode payloads like EDK2, only one pflash
>>>> instance is available for use. This means both code and NV variables
>>>> of EDK2 will need to use the same pflash.
>>>>
>>>> The OS distros keep the EDK2 FW code as readonly. When non-volatile
>>>> variables also need to share the same pflash, it is not possible
>>>> to keep it as readonly since variables need write access.
>>>>
>>>> To resolve this issue, the code and NV variables need to be separated.
>>>> But in that case we need an extra flash. Hence, modify the convention
>>>> such that pflash0 will contain the M-mode FW only when "-bios none"
>>>> option is used. Otherwise, pflash0 will contain the S-mode payload FW.
>>>> This enables both pflash instances available for EDK2 use.
>>>>
>>>> Example usage:
>>>> 1) pflash0 containing M-mode FW
>>>> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
>>>> or
>>>> qemu-system-riscv64 -bios none \
>>>> -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
>>>>
>>>> 2) pflash0 containing S-mode payload like EDK2
>>>> qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
>>>> or
>>>> qemu-system-riscv64 -bios <opensbi_fw> \
>>>> -pflash <smode_fw_vars> \
>>>> -pflash <smode_fw_code> \
>>>
>>> On amd64 and arm64 unit=0 is used for code and unit=1 is used for variables.
>>> Shouldn't riscv64 do the same?
> 
> Good catch, I had missed that!

This is a design mistake spreading.

What EDK2 maintainers want is one Read-Only + Exec region for CODE and
one Read-Write + NoExec region for VARS.

QEMU never implemented correctly pflash bank (multiple sectors) write
protected.

When EDK2 (x86, OVMF) was tried on QEMU, QEMU was using a single pflash.
To separate CODE/VARS, a second pflash was added, the first one being
"locked" into Read-Only mode. Using a pflash allowed the firmware to
identify device size using pflash CFI commands.

Then this design was copied to the ARM virt board for EDK2 needs.

In retrospective, this design was declared a mistake, since a simple
ROM region for the CODE is sufficient, and much simpler [*].

Thankfully the Loongarch64 virt machine started cleanly avoiding the
previous design flaw. It provides a ROM for CODE and pflash for VARS.

Unfortunately the riscv virt machine copied the x86/arm virt machines.


[*] Having 2 distinct pflash is useful for non-virt machines where the
     firmware might want to (re)program the CODE region, in the "capsule
     update" scenario. This scenario is irrelevant for virt machines,
     since a guest will never update its CODE. CODE is updated by the
     host.

>> Is that a requirement from distros perspective? That was my original v1
>> design.
>>
>> But the reason why I kept unit0 for variables, it helps in keeping current
>> EDK2 usage model work. Otherwise, current EDK2 will break if we change
>> the code to unit 0.
> 
> I think that it's more important to align with other architectures.
> 
> The number of people currently running edk2 on RISC-V is probably
> vanishingly small, and in my opinion requiring them to tweak their
> command lines a bit is a fair price to pay to avoid having to carry a
> subtle difference between architectures for years to come.
> 
> With that in mind, my preference would be to go back to v1.
> 
>> Second, since unit 0 for RISC-V is currently assumed to start in M-mode fw
>> which is secure, I think it makes sense to keep variables also in unit
>> 0.
> 
> If you're storing variables rather than code in pflash0, does it even
> make sense to talk about M-mode and S-mode?
> 
> 
> Taking a step back, what is even the use case for having M-mode code
> in pflash0? If you want to use an M-mode firmware, can't you just use
> -bios instead? In other words, can we change the behavior so that
> pflash being present always mean loading S-mode firmware off it?
> 


