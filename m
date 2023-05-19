Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2012C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 May 2023 16:34:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q033u-0001Wd-GS; Fri, 19 May 2023 12:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q033q-0001N4-AT
 for qemu-riscv@nongnu.org; Fri, 19 May 2023 12:34:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q033n-0000qc-H6
 for qemu-riscv@nongnu.org; Fri, 19 May 2023 12:34:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f4ec041fc3so21833425e9.1
 for <qemu-riscv@nongnu.org>; Fri, 19 May 2023 09:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684514069; x=1687106069;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z+gR4zo/Ry2zUtilrrxkZFu/dII6PEbIJqkc/ue7t8A=;
 b=XxTPtYLd1rkhycq8Pw9x0QIj5fn9/k1SHWDs9wB95SISkolWlSi8RY7tKeZRTkMN6/
 osUQOAoKOYgfdWqucsX8uhXkjgQwrGrHRQU+h8DwbEqWcUvIy86xJkte60LF9Cxc+xcW
 TJ+zsunMbaNq5asGzRKXY7YR2JITw20E4nYM3boc7mxguMhrxtqm8RWVhmNB/ingJ11e
 6ydT3a+cg59yTPpWKtlvtiwObiHxqIAd13xuhBejfEZpld4ZMLfQsWuGP+bIetFIE0Dx
 UoX5V3tQDArS18Pp5tCB9wR6Lr6H0CDcdJt44AdCVot5aa/9LPSb9AgG5xoVAKb9Zq0a
 Tn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684514069; x=1687106069;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+gR4zo/Ry2zUtilrrxkZFu/dII6PEbIJqkc/ue7t8A=;
 b=SD5GhYHPSe6qWgY54uNp6TYjURrlf7hu0GEa4K9iWVzObjENpxHp6V6kTs2mxt/X0L
 Jaz4O6ZGQIW9EruuWYNOgj4RZ5Ub+deyIrQlH78YzujWxTA9rA1E+R9u5vdN0dIMWYfz
 ZCb8Xj/PsKeONdcbl/VVjZQDw1mL/25KndIZBbxTz9Vl/PRIq2qHcjY5KKT5mEi+qmXn
 MFVvaoYV0ZFUzy9Sxo7MTLethOGSqqDpsoyZK8X8bzRmJjJ2hLQq3o+6h329flEPGN0F
 pO8dhBtpOZ4OCLyeLL2drbR0Zokea8WXScwZPwPgTxI/sWjCBd4L3o3QVEQVUTEryHwp
 rrcg==
X-Gm-Message-State: AC+VfDxXvQY883dqyefWqAb0FFp/Smr9Ccw5LWymMUHrc06gC4cRvFo0
 5Zv4BvsjMLUe9WRSuUI88LRKXg==
X-Google-Smtp-Source: ACHHUZ7f1QDHVNczGuyQW5tf16E3+DsUuhbfEJ3t0CP3fxURHwTWAUhIgH8dZ/ix61JmPLRUwkTj+g==
X-Received: by 2002:a1c:ed12:0:b0:3f4:2b13:f0fb with SMTP id
 l18-20020a1ced12000000b003f42b13f0fbmr2115227wmh.13.1684514069677; 
 Fri, 19 May 2023 09:34:29 -0700 (PDT)
Received: from [192.168.69.115] (mau49-h01-176-184-41-228.dsl.sta.abo.bbox.fr.
 [176.184.41.228]) by smtp.gmail.com with ESMTPSA id
 c8-20020adfef48000000b003062b57ffd1sm5786002wrp.50.2023.05.19.09.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 09:34:29 -0700 (PDT)
Message-ID: <3168ed46-f6f5-3b4d-8639-05dc499862f8@linaro.org>
Date: Fri, 19 May 2023 18:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <a8dd5f20-30ab-903a-6bd0-15c6a91fdf52@linaro.org>
 <CAKmqyKPHsjtT03MdSoy4i0TgdLBF=88aS6S32hj8hzpz60d6Dg@mail.gmail.com>
 <ZGW/vqOD6E263wDD@sunil-laptop>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZGW/vqOD6E263wDD@sunil-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.527,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 18/5/23 08:03, Sunil V L wrote:
> On Thu, May 18, 2023 at 02:55:16PM +1000, Alistair Francis wrote:
>> On Wed, May 17, 2023 at 10:48 PM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> On 8/5/23 12:00, Andrea Bolognani wrote:
>>>> On Mon, May 08, 2023 at 11:37:43AM +0530, Sunil V L wrote:
>>>>> On Mon, May 08, 2023 at 07:37:23AM +0200, Heinrich Schuchardt wrote:
>>>>>> On 4/25/23 12:25, Sunil V L wrote:
>>>>>>> Currently, virt machine supports two pflash instances each with
>>>>>>> 32MB size. However, the first pflash is always assumed to
>>>>>>> contain M-mode firmware and reset vector is set to this if
>>>>>>> enabled. Hence, for S-mode payloads like EDK2, only one pflash
>>>>>>> instance is available for use. This means both code and NV variables
>>>>>>> of EDK2 will need to use the same pflash.
>>>>>>>
>>>>>>> The OS distros keep the EDK2 FW code as readonly. When non-volatile
>>>>>>> variables also need to share the same pflash, it is not possible
>>>>>>> to keep it as readonly since variables need write access.
>>>>>>>
>>>>>>> To resolve this issue, the code and NV variables need to be separated.
>>>>>>> But in that case we need an extra flash. Hence, modify the convention
>>>>>>> such that pflash0 will contain the M-mode FW only when "-bios none"
>>>>>>> option is used. Otherwise, pflash0 will contain the S-mode payload FW.
>>>>>>> This enables both pflash instances available for EDK2 use.
>>>>>>>
>>>>>>> Example usage:
>>>>>>> 1) pflash0 containing M-mode FW
>>>>>>> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
>>>>>>> or
>>>>>>> qemu-system-riscv64 -bios none \
>>>>>>> -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
>>>>>>>
>>>>>>> 2) pflash0 containing S-mode payload like EDK2
>>>>>>> qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
>>>>>>> or
>>>>>>> qemu-system-riscv64 -bios <opensbi_fw> \
>>>>>>> -pflash <smode_fw_vars> \
>>>>>>> -pflash <smode_fw_code> \
>>>>>>
>>>>>> On amd64 and arm64 unit=0 is used for code and unit=1 is used for variables.
>>>>>> Shouldn't riscv64 do the same?
>>>>
>>>> Good catch, I had missed that!
>>>
>>> This is a design mistake spreading.
>>>
>>> What EDK2 maintainers want is one Read-Only + Exec region for CODE and
>>> one Read-Write + NoExec region for VARS.
>>>
>>> QEMU never implemented correctly pflash bank (multiple sectors) write
>>> protected.
>>>
>>> When EDK2 (x86, OVMF) was tried on QEMU, QEMU was using a single pflash.
>>> To separate CODE/VARS, a second pflash was added, the first one being
>>> "locked" into Read-Only mode. Using a pflash allowed the firmware to
>>> identify device size using pflash CFI commands.
>>>
>>> Then this design was copied to the ARM virt board for EDK2 needs.
>>>
>>> In retrospective, this design was declared a mistake, since a simple
>>> ROM region for the CODE is sufficient, and much simpler [*].
>>
>> It seems like we are making changes to the whole flash setup. Is it
>> worth adding the ROM region now as well, so we can migrate to the
>> simpler approach.
>>
> 
> ROM is used for FW image used for -bios option in RISC-V. It appears
> that loongarch uses -bios to boot EDK2 also as per
> docs/system/loongarch/virt.rst. But in RISC-V, EDK2 is S-mode payload
> and hence -bios can not be used.

Personally I'd try to not use -bios at all, as I see it as a magic /
confusing machine-specific command line option, doing some open-coded
"load this blob somewhere in memory". I prefer using explicit hardware
device model.

-bios usually call the "hw/loader.h" API which eventually model a ROM,
but do a lot of file format parsing magic. If you pass a plain ROM file,
no need for all this magic.

> If we have to create ROM for S-mode
> payload, do we need to add a new qemu option? Also, I don't see
> enough space in the memmap of RISC-V virt machine for PAYLOAD_ROM
> region. So, I am not sure how to keep 2 flashes and add ROM region for
> S-mode payload. Let me know if I am missing some thing.
> 
>> We would keep two pflash regions, hopefully in a way that doesn't
>> break any existing users.
>>
> Agree. While I agree with Philippe, I think we better solve the current
> problem by going back to v1 of the patch.
> 
> Thanks,
> Sunil


