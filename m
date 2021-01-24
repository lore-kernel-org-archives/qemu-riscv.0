Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3jU7-0004rJ-Vx
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jTu-0004pb-6G; Sun, 24 Jan 2021 12:47:28 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jTk-0003Zh-5s; Sun, 24 Jan 2021 12:47:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c127so8764394wmf.5;
 Sun, 24 Jan 2021 09:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6jMksSRS7fg8bvONgPil6ukP9HvDaDkxmhuVb7zD7GY=;
 b=ilFxKSpNLBFkTQvcJxPAGCstBEx1hZKuqaj40DEmFkGK3+1Aiyc4jBFuETQ/Sxuc1D
 KSF2cT+ywFM4nDyaNjlCIX66AW7J9Ma4krAe/1tqkiWqWOjBJYel5vN2kkvzMUL8R3MC
 CjERiE8579xj35BFyfCMoxYfhfG6ihg+Dpx//H0J5GYu/o9pAIowGd2YNqt9wCS4c7hd
 /DFJZUSMvbyok9vD9XGd4wzMDvLBg803XdGyvIU32YiCH8JyJoTyzUnxjD2dSYq7jTQW
 inUn/esvVTAXA4eWtRvjx6XxedNjbkqkq5w9F2Xmlzabjk7hn+ZgUevibqQ93l8zHcKz
 dtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6jMksSRS7fg8bvONgPil6ukP9HvDaDkxmhuVb7zD7GY=;
 b=GB7FASNpL4lU1TAI7UxKUJpXCYILsOSra0PJnbuFA1dmxWf/ezrF3OjBxi02FZs+6l
 nA7WuNJxMh2VBxE6l6zYM+tDfmA9XovHQU4H8+4CmslMK/n36zbYFDbb+rrUmtp7Vxr0
 TpKSfJMkgMqkzunhlfBIZR8R+v/2F8ki+X0FPU9fNB10W1S85utTG4Y4pxKlad3Gp6EQ
 E+HDArY2w2bn9OxrvoPmOmmQhT5Gebp3c/9fb3sQeWLXS4Jd5J937fKvMa/Hw0jG6HIT
 E+95c2NgS0AMPKhYE6SldnioEajc3e6qUv70CQYKPYBcTjziONKWSTk6r/iFIxnYdYSK
 lwVg==
X-Gm-Message-State: AOAM533AhuoD0BNF94hmId6dYl2SPEQKApcyIGRCWDMQ3h6amjjynthh
 tyFXcBlvPSKwMECQ1k2eFcU=
X-Google-Smtp-Source: ABdhPJxFfvGkRKTkG+PvzX8UoMeHBSOC3/ey3Zau72sEOAKDMZ0fysM4iZroNz0iVa8gHiSPkdfLdg==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr2941033wma.76.1611510427891; 
 Sun, 24 Jan 2021 09:47:07 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s19sm22227826wrf.72.2021.01.24.09.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:47:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 08/25] hw/sd: ssi-sd: Add a state representing Nac
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-9-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d1d4a9c9-e877-ec46-fc55-145560d8b6fb@amsat.org>
Date: Sun, 24 Jan 2021 18:47:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-9-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Sun, 24 Jan 2021 17:47:31 -0000

On 1/23/21 11:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per the "Physical Layer Specification Version 8.00" chapter 7.5.2,
> "Data Read", there is a minimum 8 clock cycles (Nac) after the card
> response and before data block shows up on the data out line. This
> applies to both single and multiple block read operations.
> 
> Current implementation of single block read already satisfies the
> timing requirement as in the RESPONSE state after all responses are
> transferred the state remains unchanged. In the next 8 clock cycles
> it jumps to DATA_START state if data is ready.
> 
> However we need an explicit state when expanding our support to
> multiple block read in the future. Let's add a new state PREP_DATA
> explicitly in the ssi-sd state machine to represent Nac.
> 
> Note we don't change the single block read state machine to let it
> jump from RESPONSE state to DATA_START state as that effectively
> generates a 16 clock cycles Nac, which might not be safe. As the
> spec says the maximum Nac shall be calculated from several fields
> encoded in the CSD register, we don't want to bother updating CSD
> to ensure our Nac is within range to complicate things.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - new patch: add a state representing Nac
> 
>  hw/sd/ssi-sd.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 8bccedfab2..5763afeba0 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -39,6 +39,7 @@ typedef enum {
>      SSI_SD_CMDARG,
>      SSI_SD_PREP_RESP,
>      SSI_SD_RESPONSE,
> +    SSI_SD_PREP_DATA,

Hmm yet another change breaking migration.

>      SSI_SD_DATA_START,
>      SSI_SD_DATA_READ,
>      SSI_SD_DATA_CRC16,

