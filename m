Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pP38j-0000b7-QG
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 10:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP38c-0000QQ-1h
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 10:10:35 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP38a-0000xh-Bk
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 10:10:33 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so426686wmb.5
 for <qemu-riscv@nongnu.org>; Mon, 06 Feb 2023 07:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ndw8I+0Rl2gqHgORiHopVlytR94xTgJJoxNES21UmI=;
 b=jmqABeqGMwkQYLUrKv2BtLscci9sdGXtnmaXl5/vbtWlbzCFHrKbpsypBVbZly4HnW
 vXNzAdTmdWHl5iK56Ckagvq5w6YCt6vNlYHj8dxB8yVp77lY5pU29JWpl2jkHT+4BgSj
 BmDobHkz7r/r1fudxtvoz3cW/l1Wxt2+fZp3LB92yJFK3whsU0qe1KaSFZeKeaRh13NP
 YmdPgwHcaFXYBdnEaNIzXVsisvD0LKnkSLss9r2emcLglKcLW+6c+/F0cAGjgxmwbnVc
 iiJICw7zV/p7wIA2B+MFj94K9k4y1XlZffKQMAE2wnaguiGsP9Itgey1cD6sSam3dmDY
 yQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ndw8I+0Rl2gqHgORiHopVlytR94xTgJJoxNES21UmI=;
 b=SbazplOGd41QOKcj8djVyB47NU4bpd2gzxxVaN6fMxRg9Kz/82bcWFoofaaUrITYS0
 6QhdLo+1MjaCx4uh3r21w7NpLtcNjhwOIOlK9Reo0z+9+XvepF6PawE9y8YR8KqWoKDi
 59naHTv/j86ZlZABuLDsgIqMeT1n1sP+lXXTIisvYQeMIDqnlArUY21D2myGg8Aln8kd
 94f60F/YFGRtC2D2m51MgeItF0cu4vpCdmCA3zlUYm+qzEreyPJynRJYGr1xW1j3vmey
 rSUP7tatZ3iscnVsFeSXdRjGUTMKJkWSUnvrqLDg3Xn4TXlnWno82PBOSLJf8/OTwSF7
 JSIQ==
X-Gm-Message-State: AO0yUKVGdfXPe2tv6zJz12gMJzYAXFk10+TpLLTvdPci7qihcfKjiB4o
 /YbS3C5NK3A5PxljAXokx/Gq3A==
X-Google-Smtp-Source: AK7set/CqND6M+x6lFOHQcAHxpJYFQYh96L0OwBZnu9ng100qQDpxVfgEqZZEh0c+SRSatzMrv3b8A==
X-Received: by 2002:a05:600c:2e8a:b0:3e0:114:62ee with SMTP id
 p10-20020a05600c2e8a00b003e0011462eemr71901wmn.8.1675696230676; 
 Mon, 06 Feb 2023 07:10:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003e00c9888besm240057wmo.30.2023.02.06.07.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 07:10:29 -0800 (PST)
Message-ID: <672e6576-4fbd-2a17-a855-642ad80427dc@linaro.org>
Date: Mon, 6 Feb 2023 16:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v11 2/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
References: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
 <20230206140022.2748401-3-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206140022.2748401-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Mon, 06 Feb 2023 15:10:37 -0000

On 6/2/23 15:00, Daniel Henrique Barboza wrote:
> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> the same steps when '-kernel' is used:
> 
> - execute load_kernel()
> - load init_rd()
> - write kernel_cmdline
> 
> Let's fold everything inside riscv_load_kernel() to avoid code
> repetition. To not change the behavior of boards that aren't calling
> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> allow these boards to opt out from initrd loading.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 11 +++++++++++
>   hw/riscv/microchip_pfsoc.c | 11 +----------
>   hw/riscv/opentitan.c       |  3 ++-
>   hw/riscv/sifive_e.c        |  3 ++-
>   hw/riscv/sifive_u.c        | 11 +----------
>   hw/riscv/spike.c           | 11 +----------
>   hw/riscv/virt.c            | 11 +----------
>   include/hw/riscv/boot.h    |  1 +
>   8 files changed, 20 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


