Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3jtv-0006yy-J4
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 13:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jtu-0006xe-0X; Sun, 24 Jan 2021 13:14:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jts-0004UB-C3; Sun, 24 Jan 2021 13:14:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id o10so9350359wmc.1;
 Sun, 24 Jan 2021 10:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GuE4rkdJrEItNyVu+uDM3WvcKz/yroteEnKQDYeqjew=;
 b=tt7Wqa+jNkIIlT2zH/GeFL0MCP8NAVFylMp8jf62Jh0J1SviIBVlW+XRuKUwJ+fyfh
 qwkbN80yOGmMHpAyU8qj7V0eYlOG0BG+rkAF6Phd7w2331golXpienYk+cunRHV3IO60
 C5IXqIap3mmnZGd2B0wlLhTyZvfVaKobZC5MiETONS51h9QqJ059GCx1e7uM8Y6bPuAU
 8sVfqX4QadjOWKwjnU+ePXXjouFBe5Bu4XifNV069k2qU/ix7dpzlzPLdC1vRjC8wmrw
 OCcVny9QEZf7OfkrbUGqtyT7YqB1sNpO6eSYi+P6hm4ZbErouDSPpKrRuEvk8Y6tW4IY
 6crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GuE4rkdJrEItNyVu+uDM3WvcKz/yroteEnKQDYeqjew=;
 b=qodjBMrLG6qDTc7WUR4Om28fNblUa9Mx1IdKE+ftVsO1KsNMfOlTFHWab2L+4/tRNG
 juj4bQhpkbnAlTWIKbq/D83jV2PdRLXt5jvV2LAetocaGh4ad2EjgZH8qUzrjcL5+fDG
 Bc7aXTyz8JoEI+BHClqgq4linKwnDaKJefA5z/KkOWMQKtt0dxVwM9YCkKuZuVx8nPty
 vGX/bqcJyZ5LgDx1IKjDerrW36WoTMFFZuEgJMrfUh1LfE68X1M4GekfE8AF9D8r45eH
 UBppvQ4Od2kODQb5Nz1Y7Oc/NsLDakCG7o//Ky9Bd7Ob9feMyoEE2CKCK97+RASBbhY0
 Wwxw==
X-Gm-Message-State: AOAM5315m+b+i5x4hpxJ3/QHA6NbjYeYx2akxZbAj4o1Afqsou/dEnjd
 S6QJCG+gWoSZ7IAIok8u8Jg=
X-Google-Smtp-Source: ABdhPJxRE917GB0WHrW0TRr+ss9XEirEUmufltN7FEAPdhawUX0HwT6+PfMA9JCbTqTRQtu86t/JwQ==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr12268457wmh.131.1611512050341; 
 Sun, 24 Jan 2021 10:14:10 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d5sm17730477wrs.21.2021.01.24.10.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 10:14:09 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 05/25] hw/sd: sd: Drop sd_crc16()
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-6-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <578fb847-0c7b-aa32-571b-0cf3b1cf5bba@amsat.org>
Date: Sun, 24 Jan 2021 19:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-6-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 24 Jan 2021 18:14:14 -0000

On 1/23/21 11:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> commit f6fb1f9b319f ("sdcard: Correct CRC16 offset in sd_function_switch()")
> changed the 16-bit CRC to be stored at offset 64. In fact, this CRC
> calculation is completely wrong. From the original codes, it wants
> to calculate the CRC16 of the first 64 bytes of sd->data[], however
> passing 64 as the `width` to sd_crc16() actually counts 256 bytes
> starting from the `message` for the CRC16 calculation, which is not
> what we want.
> 
> Besides that, it seems existing sd_crc16() algorithm does not match
> the SD spec, which says CRC16 is the CCITT one but the calculation
> does not produce expected result. It turns out the CRC16 was never
> transferred outside the sd core, as in sd_read_byte() we see:
> 
>     if (sd->data_offset >= 64)
>         sd->state = sd_transfer_state;
> 
> Given above reasons, let's drop it.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> 
> ---
> 
> Changes in v2:
> - Fix several typos in the commit message
> 
>  hw/sd/sd.c | 18 ------------------
>  1 file changed, 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

