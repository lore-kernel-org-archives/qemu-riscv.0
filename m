Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pADty-0002gL-NW
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 12:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADtu-0002eO-1Y
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 12:38:06 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADtq-0000zz-UY
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 12:38:04 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 v15-20020a9d69cf000000b006709b5a534aso8543521oto.11
 for <qemu-riscv@nongnu.org>; Tue, 27 Dec 2022 09:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UZGBfg2cVunwwYvYvegwS+3PHYe+P8WZqXgALSh4qGg=;
 b=P4h58v6q3B5coNmSD7Bv/QPgJ64EmWTa+u3+7uJj5Ov7mmQiROGPHoX1Ea7jh1Mc92
 hWKVkuDxPG5XH/bATPDiVf7P5xvaiPiB2RIir7BtBJWS5Yx1nOPth/kLC1KrbtNizyE4
 98bMfxcU5NkMvBfkyGIMuh/noTMBZZRWwvGym8MRJ+HUxGpq2Zd0qvw69RqM4oKV0ij9
 9CRvCrXr0opUs6ZZW7lMcUlw82L78vH0NgWDMZREMGqDx9bbVSM4n/gaUDQ/KYbiK271
 H+TkVoIeeBf5KJEzJDL+Mi+i2sKA8Wz55a3dIfQ3DyhOxLd/qhOY4KNOPbrquSzTrU/I
 xzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UZGBfg2cVunwwYvYvegwS+3PHYe+P8WZqXgALSh4qGg=;
 b=YUNyzWTOQuuPyrghD+2y+eUEXzo532hz1hWlrPnMAyJ9DcLiuC+OjyCdK2mDa7/BTC
 RmHLOD/6vpJjPcqrp6vSkx62KEvSOfFyMfYzZPsscW1NIR9C+TAQQbqEpW5//R2peDpI
 yEQUfc4mcIa0WQyH3XPuwyGUXhbpS+I0Wh+1/WZhCeyKHQMoLdUT5trUUJ49Yj3fXl0+
 qWEnmyJjzPstTAY0sVXVmQgolMWnEENKiG5aOSSKYSR6CwbYg8QIxY8Y5yrV21mymhxO
 NJTYCDYMyY8UBryIzjiohhhOwuTAElbWixD9C+GK17Nkl68Do/4+DHVYajCFIsNcxf6K
 GkqQ==
X-Gm-Message-State: AFqh2kqZtW/P4Mu+MG8+q6kLN1WbgBW1xVu90P4SBZcZRo4D8L3nrJXF
 +n5WCnugP++bgYe1jMkV80xMtQ==
X-Google-Smtp-Source: AMrXdXs7s2EcWMCI8bFzOK5Zkb2vRL5/eShjCMkZL03ZQuIeFQvghMrfutVHs8x6ltVH5xVUefy/HA==
X-Received: by 2002:a05:6830:11da:b0:668:60:5903 with SMTP id
 v26-20020a05683011da00b0066800605903mr11129700otq.1.1672162681747; 
 Tue, 27 Dec 2022 09:38:01 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05683026c100b0067c87f23476sm6759562otu.57.2022.12.27.09.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:38:01 -0800 (PST)
Message-ID: <cf4d337e-22f5-02b8-67bc-042e8e2ab7bf@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:37:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 08/12] hw/riscv: spike: Remove the out-of-date comments
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-9-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-9-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Tue, 27 Dec 2022 17:38:06 -0000



On 12/27/22 03:48, Bin Meng wrote:
> Spike machine now supports OpenSBI plain binary bios image, so the
> comments are no longer valid.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   hw/riscv/spike.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 8606331f61..ab0a945f8b 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -256,11 +256,6 @@ static void spike_board_init(MachineState *machine)
>       memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
>                                   mask_rom);
>   
> -    /*
> -     * Not like other RISC-V machines that use plain binary bios images,
> -     * keeping ELF files here was intentional because BIN files don't work
> -     * for the Spike machine as HTIF emulation depends on ELF parsing.
> -     */
>       if (riscv_is_32bit(&s->soc[0])) {
>           firmware_end_addr = riscv_find_and_load_firmware(machine,
>                                       RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,


