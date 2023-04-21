Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppyMD-00032q-0w
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 17:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyMB-00032T-E1
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 17:31:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyM9-0008JD-M7
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 17:31:51 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e2f7so1388519f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 14:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682112707; x=1684704707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O4ZYJ10wHVTvqgJujWaa1FzjnW+bAG67GIa/Or5mirM=;
 b=ulp+4RQHWyQjsBY7YvYPb8Bye5srb2pWhXaTIyaOj0tEgIkfVCWPgxXy5wi6a8qYyW
 PhOxlphgMsCYmQ/7oK14r7yUEc8hAUEK6qQ5tOQfI+fzTiuttBeoQRHTSmbJDepr1gG9
 zx9dqA62mR+CpbojnqUg5jCfdLG9Xeqy33ySVcwk8VvwcYz+QQ99uplVStnn6qCp30+G
 yFZBqLzjtm/I+K0U/HBEGDaiqRDkvLEaXWpFnLZ46nVMLcK/0u8eGtWiLRM+1slibfAd
 CxM94L0J9UWMcd+bGv7oG3gr+6MdhkQaNtddjsCGuyX38+xfdal12ajcdq4RA58sDvNJ
 WVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682112707; x=1684704707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O4ZYJ10wHVTvqgJujWaa1FzjnW+bAG67GIa/Or5mirM=;
 b=Wola6RlXS35DicYeObzjzicnSoLodS+jVUzB/yj/rQtKsapjHZ3foiRj+Q64kjvyPE
 k2NzzjPffmFL1DPss9HaIuMd00u0xkto3X2ZbW0j1nieYqhfvEqJ6xbMJIqg17dhP6gj
 vnHUfCO4ScmmOCLeFgKALwf0iu2n9vVrMyy9D80zJ2tLCuNWecpbn6OuEz0NZv4W5SrM
 TEDPHyCOgb4O8XsCHefr4K88S9o7G8Uelf/qs0xFd3qLyTEX4jNmWfjHVCGXR6CuEi6R
 c6peLobJvGCb3e1pa1t3MisvfcVb3pCUaaY36PRhCjAZkSf/YbODlqDVuQCq8+0U/Yx2
 FmyQ==
X-Gm-Message-State: AAQBX9dfmDPjTvUPolgHpB7lr+SrXaH0a1rGz+9lFan7a2tEPfAA8A8Y
 YnoaPpjDDWer04Uif2t8obgKpQ==
X-Google-Smtp-Source: AKy350ZQ7vs9G23XXD1fuOoZAFzHGTJplGif/YRig8CAGnH3Siz4cEGzxqwudWARsNXDSH0Te2n2PA==
X-Received: by 2002:a5d:5511:0:b0:2f9:fc06:9fcc with SMTP id
 b17-20020a5d5511000000b002f9fc069fccmr4611779wrv.44.1682112707598; 
 Fri, 21 Apr 2023 14:31:47 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 g13-20020adfe40d000000b002f8d402b191sm5196364wrm.112.2023.04.21.14.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 14:31:47 -0700 (PDT)
Message-ID: <bcb3e2c4-e35f-58b7-5a58-8e5ba76754b4@linaro.org>
Date: Fri, 21 Apr 2023 23:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
Content-Language: en-US
To: Andrea Bolognani <abologna@redhat.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20230421043353.125701-1-sunilvl@ventanamicro.com>
 <b882e2cf-8e7f-eacc-27cf-05364a065290@gmx.de>
 <CABJz62ME20bT8v9TK4h+RcujHK_eY+wRF1UK9aN+Ww8Fg_=QQg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABJz62ME20bT8v9TK4h+RcujHK_eY+wRF1UK9aN+Ww8Fg_=QQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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
X-List-Received-Date: Fri, 21 Apr 2023 21:31:51 -0000

On 21/4/23 18:48, Andrea Bolognani wrote:
> On Fri, Apr 21, 2023 at 04:36:15PM +0200, Heinrich Schuchardt wrote:
>> On 4/21/23 06:33, Sunil V L wrote:
>>> Currently, virt machine supports two pflash instances each with
>>> 32MB size. However, the first pflash is always assumed to
>>> contain M-mode firmware and reset vector is set to this if
>>> enabled. Hence, for S-mode payloads like EDK2, only one pflash
>>> instance is available for use. This means both code and NV variables
>>> of EDK2 will need to use the same pflash.
>>>
>>> The OS distros keep the EDK2 FW code as readonly. When non-volatile
>>> variables also need to share the same pflash, it is not possible
>>> to keep it as readonly since variables need write access.
>>>
>>> To resolve this issue, the code and NV variables need to be separated.
>>> But in that case we need an extra flash. Hence, modify the convention
>>> such that pflash0 will contain the M-mode FW only when "-bios none"
>>> option is used. Otherwise, pflash0 will contain the S-mode payload FW.
>>> This enables both pflash instances available for EDK2 use.
>>>
>>> Example usage:
>>> 1) pflash0 containing M-mode FW
>>> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
>>> or
>>> qemu-system-riscv64 -bios none \
>>> -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
>>>
>>> 2) pflash0 containing S-mode payload like EDK2
>>> qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machine  virt
>>> or
>>> qemu-system-riscv64 -bios <opensbi_fw> \
>>> -pflash <smode_fw_code> \
>>> -pflash <smode_vars> \
>>> -machine  virt
>>> or
>>> qemu-system-riscv64 -bios <opensbi_fw> \
>>> -drive file=<smode_fw_code>,if=pflash,format=raw,unit=0,readonly=on \
>>> -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=1 \
>>> -machine virt
>>>
>>> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>>> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>
>> QEMU 7.2 (and possibly 8.0 to be released) contains the old behavior.
>>
>> Changed use of command line parameters should depend on the version of
>> the virt machine, i.e. virt-7.2 should use the old behavior and virt as
>> alias for virt-8.0 should use the new behavior. Please, have a look at
>> the option handling in hw/arm/virt.c and macro DEFINE_VIRT_MACHINE().
> 
> I would normally agree with you, but note that RISC-V doesn't have
> versioned machine types yet, so this kind of breakage is not
> necessarily unexpected.
> 
>  From libvirt's point of view, being able to detect whether the new
> behavior is implemented by looking for some machine type property
> would be enough to handle the transition smoothly. That would of
> course not help people running QEMU directly.
> 
> For what it's worth, this change seems to go in the right direction
> by making things similar to other architectures (x86, Arm) so I'd
> love to see it happen.

Unfortunately another arch that followed the bad example of using
a R/W device for the CODE region and not a simple ROM.

