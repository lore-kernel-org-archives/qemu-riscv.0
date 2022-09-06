Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVYh4-0001Ri-1O
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 09:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYgv-0001OL-Dj; Tue, 06 Sep 2022 09:32:37 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYgt-0000YG-9g; Tue, 06 Sep 2022 09:32:36 -0400
Received: by mail-pl1-x636.google.com with SMTP id u22so11272292plq.12;
 Tue, 06 Sep 2022 06:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=QjFr6GbZ7kTsR6HRrvoRK1F0cvlFKgJhPmOuVj/gWPM=;
 b=Ez7FtG78iC32oIVbxbd/q3G+ZRPm87q9Kltuv61iZF8v2i62QLZRNIprsWqUX49RmE
 ZjGF0fz2Ax0ZBsqDFar/YAGbztfqbaDG12G9FJWiEVjLvb7AybY2ExFL0Qa/YO7keSwf
 xgTuaCONT8+u1w8n2Jx/t4W2Y68o8C5/zaVzkXPafis6UAzRbYotujlTeQ2xoZGh1sJL
 rRUzsufX5ni4AJyCM1yBbNMAuyfvsCNICzGc0IfHwRZZC1ikJ/eJUyTJdcHMj/VJbeNe
 378dWJtesKTkuPVThoew2mzcmj7kHC63LZ+lYANs9wkrePUI2vhxODMq2wuQim6l8q3K
 +kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=QjFr6GbZ7kTsR6HRrvoRK1F0cvlFKgJhPmOuVj/gWPM=;
 b=FuLf3Jsfsn92wEFnnEB7ISLviaA7I+BsYgW2MGIt1is5MThLzdVicFOOYGdmwnwsZh
 3cOodRls+bqu5hxAo8YNWfcjI6ON6u+yyvMyG6cRyECjbeaFwBI87UqpsPgGEKyOs+as
 z+WYEIfFiYvKP7EaUw7DMIfMc/M7ZgqItAsITtJjod7+U/RMp3YS1C0qeCn+6SH783VK
 ll0PZchpCPHNu59OGxf2FXXqLRa3OU/hjCDnj93MhzrtGvpky37m2FVrMrVyh9WxEig8
 7WW6hhNgCfkEQRqKmTbxesVvZiSWxO/FIxQli1zvAyr4GTXYxah8Uoa7GGmCrrdqE00o
 WX4Q==
X-Gm-Message-State: ACgBeo1drsyKpDHBr4JAWpCNOSmCgrDrsEDIX2ZVqiFGRKTyEeFCQasf
 spHXuZtK4QRg8QhFAv5MyhE=
X-Google-Smtp-Source: AA6agR4EP8MqlQno4ULOgrPQkRnlMZYVfMBtc+gBO3dks9H0NwAtAklE6OvvvoCw3ySr0Ujiyru88A==
X-Received: by 2002:a17:90b:384b:b0:200:71b8:ae00 with SMTP id
 nl11-20020a17090b384b00b0020071b8ae00mr9183493pjb.125.1662471153404; 
 Tue, 06 Sep 2022 06:32:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a17090ab29000b002000d577cc3sm7054494pjr.55.2022.09.06.06.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 06:32:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <89505f6f-a223-449b-3e89-ee8d59072d4e@amsat.org>
Date: Tue, 6 Sep 2022 15:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH V4 1/3] hw/arm,loongarch: Move load_image_to_fw_cfg() to
 common location
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906090219.412517-2-sunilvl@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220906090219.412517-2-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
X-List-Received-Date: Tue, 06 Sep 2022 13:32:41 -0000

On 6/9/22 11:02, Sunil V L wrote:
> load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> function will be required by riscv too. So, it's time to refactor and
> move this function to a common path.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   hw/arm/boot.c             | 49 ---------------------------------------
>   hw/loongarch/virt.c       | 33 --------------------------
>   hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
>   include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
>   4 files changed, 53 insertions(+), 82 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


