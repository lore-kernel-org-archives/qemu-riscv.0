Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pBEr3-0007cZ-3h
	for mharc-qemu-riscv@gnu.org; Fri, 30 Dec 2022 07:51:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEqn-0007ZY-TX
 for qemu-riscv@nongnu.org; Fri, 30 Dec 2022 07:51:07 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEqk-00058k-Vm
 for qemu-riscv@nongnu.org; Fri, 30 Dec 2022 07:51:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id ja17so15126467wmb.3
 for <qemu-riscv@nongnu.org>; Fri, 30 Dec 2022 04:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YKbqGHWXzj6FzgglAnQDtQD7J60AoFmaDERCFQs9o4k=;
 b=qdgi2moNSYKMwub5AdlFgxw9K/el7VxWJV5bMdAcFMh4n57pc7cgz83Stpu/OtYZKZ
 Zwmv8PvRBS4ICNft/c/FglkqbNjk0zSci+hugbczBEJuWonIMQAS/74CVgOP4zvImw0X
 1dmfot6Mx/gGt3uyJuc7QH0kSrxhvMU38ovWfgSmKEcJ8Nhe7CkT9apNaIIADj5rSMF3
 tAKc+CLRBwkH8ZaEL25BC6dLJ3p7Z1TqkQVN87uhD6wt0/FTou1zyZgULRLa6xKtHnr6
 RA0KP29+FWr6ZXCmgWZ+WZymmZOREId/MrSK+LEa+gFgtqcI3qqTX75Pb3Xi/07HcRUU
 x1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKbqGHWXzj6FzgglAnQDtQD7J60AoFmaDERCFQs9o4k=;
 b=V9g86UOjU/JeQ1AFDv98MK7h9zN+ZWhk8DuWeZu1/hLB82wg+8fBz+Bleo2HCjTRKo
 A0d2jCEYXpwNwxK2rsHyVhUmoTAh0c/5wrl7Q4G0T5FvKXm6c7HmKf1ISY5uGtTRoX6a
 Vq60Vk2F8VHeUiwgAb0Y2VMqSQDDxeowDKKk9xDB6AUhBZtBoh+CcN82Gkq9+u84C9aP
 GSeXM3NktAY5rs5hEwFSqhVk+TOcXTGvSu+TTSNEjvV3aJeetT5qWr9iLV8PXmv/bgV0
 Z6DYa3Maq57mVpxl8KDBODPA+xuVyytSrRy5iwn1U0+3ccFKPY7UGZerhBBc2lmxuFfZ
 b01A==
X-Gm-Message-State: AFqh2kqM3p4LmkXnjGjTwXILNiKoMc4u/8uPCMvpEr4fDnZLYooNheRO
 7/Go2wkmVslvddV5dDIwUJdgGA==
X-Google-Smtp-Source: AMrXdXu+lxjpy/439Ud0ndzUXdnw6SZ58hZn4l7vVU9U8dOwELV5x+i9VdipebTI5K5Uukld1C5uYQ==
X-Received: by 2002:a05:600c:3c90:b0:3d9:6717:92e1 with SMTP id
 bg16-20020a05600c3c9000b003d9671792e1mr20188363wmb.40.1672404661344; 
 Fri, 30 Dec 2022 04:51:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003cfa3a12660sm46513380wmq.1.2022.12.30.04.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:51:00 -0800 (PST)
Message-ID: <cfa6be0b-54e8-71b4-4700-161ce2468fc3@linaro.org>
Date: Fri, 30 Dec 2022 13:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/11] tests/avocado: add RISC-V OpenSBI boot test
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng@tinylab.org>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221229181135.270661-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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
X-List-Received-Date: Fri, 30 Dec 2022 12:51:07 -0000

On 29/12/22 19:11, Daniel Henrique Barboza wrote:
> This test is used to do a quick sanity check to ensure that we're able
> to run the existing QEMU FW image.
> 
> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
> RISCV32_BIOS_BIN firmware with minimal options.
> 
> The riscv32 'spike' machine isn't bootable at this moment, requiring an
> OpenSBI fix [1] and QEMU side changes [2]. We could just leave at that
> or add a 'skip' test to remind us about it. To work as a reminder that
> we have a riscv32 'spike' test that should be enabled as soon as OpenSBI
> QEMU rom receives the fix, we're adding a 'skip' test:
> 
> (06/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_spike:
>          SKIP: requires OpenSBI fix to work
> 
> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159
> 
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Tested-by: Bin Meng <bmeng@tinylab.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>   create mode 100644 tests/avocado/riscv_opensbi.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


