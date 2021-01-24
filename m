Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3jGh-00068K-W6
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jGg-000683-Qz; Sun, 24 Jan 2021 12:33:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jGf-0007JG-9Q; Sun, 24 Jan 2021 12:33:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m2so8609149wmm.1;
 Sun, 24 Jan 2021 09:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VXXEoq8glsTuIQXe3JPXI4lzpRpCSaipkGTsq7SJFvI=;
 b=pgvpqyAHj/dh4U9EsVqAnj7oqg60YwY+WWHDDJa2FQQaAaTAkszyf1F7ckQeK6MhJB
 r4yxJxa65NVaZzt/PlHjq1tQwgd5szbvAabfp5Ru3jtanFCzu58dTd+kH9hvru93Uxuk
 Tru7VNLTUoj9BfQmfIN46Q45gObsbOjG8qSPk0pzzwjuzhADztK5ni+UR3McN2Yrr1qp
 5Tol34hZm3dE5hyRz3sEyRXaCbkgdAT4ScyuS5Wdv31Yz2Hgkz8yPMwhL8EDwZMYmxDP
 di6tQc+dMQA2drFkeN4dLCfSXcTQpAVU1JOLneZ2gA4vTZuWJei/lKkQM2cvxVUWxbCE
 K8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VXXEoq8glsTuIQXe3JPXI4lzpRpCSaipkGTsq7SJFvI=;
 b=sKFNZFUcvfgpMEDQxgqpqyiWAT/5iHkoX2TrjCqhUtmW4FNk9b64rvm7tPiffzTYpd
 1vnqDcCgpZUaIrW2MAx7If1RAlEHZmFlIWyHe38uQJRoQipyCIbxe6WHnelnX8zxARhJ
 1RbX10VaMMjIK2dVCyGz3sVH8CVnlawH716SVPZxPQ2+1ZCjLwp0xC6gTqXvEk9VdAOG
 Bht5ETaUK5e7gCh5CBi/h0Fa0EPNoGYNaYBX+DHqeGN+WQKoZmXCxWfcv9Jil06Z1w8Q
 c3Hup6kTfy/FqTSzYXWq4bOpB8yjlsh0N54SmlqdlVYXICLRrriz0fr7XZthkKAPCUl9
 w8Iw==
X-Gm-Message-State: AOAM530PAEbDck6F7S+71FeEAfkaAGAfGvEBFurFGvEEtVc00eoYiRML
 8Fl8EFnnf7jhNr/Jzz5FpU0=
X-Google-Smtp-Source: ABdhPJwXTNHfDwGFFD+5enGrsdj6I1jIfr95H3nhXRBwCoYe9NNvZsKhEXaGy6Hy8WkAXcB2RxHCAg==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr3611612wmb.135.1611509618861; 
 Sun, 24 Jan 2021 09:33:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w20sm1511133wmm.12.2021.01.24.09.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:33:37 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 09/25] hw/sd: ssi-sd: Fix the wrong command index for
 STOP_TRANSMISSION
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-10-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13bab35c-4e0a-e92a-24a5-558f33087061@amsat.org>
Date: Sun, 24 Jan 2021 18:33:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-10-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Sun, 24 Jan 2021 17:33:43 -0000

On 1/23/21 11:40 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This fixes the wrong command index for STOP_TRANSMISSION, the
> required command to interrupt the multiple block read command,
> in the old codes. It should be CMD12 (0x4c), not CMD13 (0x4d).
> 
> Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - Make this fix a separate patch from the CMD18 support
> 
>  hw/sd/ssi-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 5763afeba0..9e2f13374a 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -83,7 +83,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>      ssi_sd_state *s = SSI_SD(dev);
>  
>      /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
> -    if (s->mode == SSI_SD_DATA_READ && val == 0x4d) {
> +    if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {

Patch is correct, but I wonder if we couldn't improve using instead:

     if (s->mode == SSI_SD_DATA_READ && ((val & 0x3f) == 12)) {

>          s->mode = SSI_SD_CMD;
>          /* There must be at least one byte delay before the card responds.  */
>          s->stopping = 1;
> 

