Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD2sa-0006jA-QY
	for mharc-qemu-riscv@gnu.org; Tue, 01 Sep 2020 05:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD2sZ-0006fV-Bq; Tue, 01 Sep 2020 05:47:03 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD2sW-0002e0-Px; Tue, 01 Sep 2020 05:47:02 -0400
Received: by mail-wm1-x343.google.com with SMTP id a65so489169wme.5;
 Tue, 01 Sep 2020 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pMHxOd1xmexKs5hKKnIg6aoAiTlQCCuJV5AAWGMAY/4=;
 b=C685N7n5s//4oDC3bUiXd+EiYrSQaW/V8j9gyXsIfXAX2KoZumEQ3AVGLsFGN0u664
 fuY5L/iMUw171bCqq3uJ2+yAgD+KeEF5F37sFz+swr7q+qlhrpUyp78356oqd2umfp4P
 24Hzyag3bG4mtM4LImJYvpyVZSjjbb3ch8SAy/ObwlMl7mL8IaZOfS0LImn4kn+/7jPh
 VHEpIIPa4R+sn+uGDLwbc06lqJQqMX9zemhHlPm7ACukXagCIs+Uaoz8wZbCFs/alvBE
 G2Q1cqXJaadk0IzZMysUy7HLg1eElSJrKiJM1RXjV4t4fUoBN/ytk8ohS3FhBYwkZpmu
 wRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pMHxOd1xmexKs5hKKnIg6aoAiTlQCCuJV5AAWGMAY/4=;
 b=TOYCZ1/FniJJxLER0YPTvXs7imgJVHNyNeyxPW1rlEcbDYKmKHSTQO7WwDjTEr3V6K
 ItzcNA727CjAJ8g44PtiCme+gOA4RJNGucq39seyPPcrgOX2rZfeVKYM/x1Gcm2fPJRj
 FFfTgPHAKSBsPSfpHq9F2KLc9h6o7Uiq41NPBmtPFSeBipuLcAhAsWPIyh/2BbXHi0lZ
 Hh1fGGAvwA+fZPYs0AYS7hgR/WyT9x8aTZJkk3gcpSNccA/EHrgGB3y0ddsXSskMJaTs
 hG4fOODPDJ+sOSMjLsinFhvDK9Kqu0+smuxUwVMjHJkDAco7F5H6bjZxSiDMsiXdDPRO
 W3lw==
X-Gm-Message-State: AOAM533imD2cE90+wcgg+rqULNIizacw+WaBiwEi1N55phNF8e3c9/Ms
 hLjhLK4s4IxEL5kqHDN+V3Q=
X-Google-Smtp-Source: ABdhPJzEh8NeHpY6Ec+Vl87vK9bdLEp9C4l4dQ7Mwxlo7einF6AwCfUmpXC5lL2H080st9yYuS6B5Q==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr933972wmj.17.1598953618870;
 Tue, 01 Sep 2020 02:46:58 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id m8sm1335593wro.75.2020.09.01.02.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 02:46:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 13/16] hw/riscv: microchip_pfsoc: Connect 2 Cadence GEMs
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
 <1598924352-89526-14-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b29eb839-30ee-ef0f-4241-540f16295e45@amsat.org>
Date: Tue, 1 Sep 2020 11:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598924352-89526-14-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 01 Sep 2020 09:47:03 -0000

On 9/1/20 3:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Microchip PolarFire SoC integrates 2 Candence GEMs to provide
> IEEE 802.3 standard-compliant 10/100/1000 Mbps ethernet interface.
> 
> On the Icicle Kit board, GEM0 connects to a PHY at address 8 while
> GEM1 connects to a PHY at address 9.
> 
> The 2nd stage bootloader (U-Boot) is using GEM1 by default, so we
> must specify 2 '-nic' options from the command line in order to get
> a working ethernet.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>  include/hw/riscv/microchip_pfsoc.h |  7 +++++++
>  hw/riscv/microchip_pfsoc.c         | 39 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

