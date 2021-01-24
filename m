Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3jQH-0003RT-Mv
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jQG-0003Qb-2p; Sun, 24 Jan 2021 12:43:36 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jQE-0002JH-Ff; Sun, 24 Jan 2021 12:43:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id i9so2254681wmq.1;
 Sun, 24 Jan 2021 09:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qQOdXGp4P0Tgv8BTypNRgkV6q6bV9Qlp5Jzmbrc364w=;
 b=Ul/JRPTy33sOIp0MjwS2dTS/8hKCAOejOLKY1nMxUKxuWr4BA/MAyl7WUklcl7KvZ5
 w4FGVm2tOByaR6VGXjU6TL+lFH0U1I/Yu6Z2sTQixeq/edut+8WgIrswAwHp+yqpRMTP
 SRaq+kOdv09sKCkeIQLpwpGxEF6OU2HaQiy+e/jO4vLBlxfE/l+HDGCAnzYPPf/A+eqk
 cNYq4D1m5/f+kIVs/Oxhay32XCkRHHUMcghBdEeZIAnrZAkIYhzVLkHmC8oLXGI7MDYj
 3OWDWSi6J2oVFevgfDHFyLjmzXKG6n918Gbm8BEH2fDFbqUnjzoGbsVSz9CxqFwKFQ93
 ppwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qQOdXGp4P0Tgv8BTypNRgkV6q6bV9Qlp5Jzmbrc364w=;
 b=Ie3AXhTRDLTdL+5L3hBp6ODww4zxgdQovuI89SfhbpxXdBpRTxB0NuvejXsFGjSCe5
 GxmGSsss3KLZXv1z18QAgPROzhGzmbMzflLRruhq2oSGIVqkFR7TR6TNS6TUPqg/g7Rx
 4e2krJ0bQZnnF/Np0SuczG/yc86olm9sjJ08zjfg68QjJu1FvV6QvxTSEi29RcpgECzb
 0HB1a2OKq+XZWVEu75S6cjyZkTnCM5TYpFrB8p59kgFKLSbEWwQXXsL3IgzQ9TCeOh3m
 8K7ZPWwLQ6Nh3Zx5vfaPg7aDh/8iVdb9YFDHEsRowXBi93dlw1mhzAntf2bjaJeCriYy
 tlHg==
X-Gm-Message-State: AOAM533AIXfvBR4Y3GeSGkB3c4CqbkVdFtn91wgMt/77HK3ARxQUI5iY
 mYUQTtcB19WsoCJeU9+TWWg=
X-Google-Smtp-Source: ABdhPJwMs0CwiA3Hx9Z8P6FHgnwFbD6O0xF1iISGjP5MQ/SJxMeEINFbPG9/okplh3wavp8SBurz0g==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr4942687wmh.77.1611510211742; 
 Sun, 24 Jan 2021 09:43:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q2sm18403033wma.6.2021.01.24.09.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:43:31 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 14/25] hw/sd: sd.h: Cosmetic change of using spaces
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-15-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a0c8bf33-a41c-bdbf-8b52-288a5a3726c6@amsat.org>
Date: Sun, 24 Jan 2021 18:43:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-15-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Sun, 24 Jan 2021 17:43:36 -0000

On 1/23/21 11:40 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> QEMU coding convention prefers spaces over tabs.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> ---
> 
> Changes in v2:
> - Correct the "coding" typo in the commit message
> 
>  include/hw/sd/sd.h | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 59d108d453..05ef9b73e5 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -33,27 +33,27 @@
>  #include "hw/qdev-core.h"
>  #include "qom/object.h"
>  
> -#define OUT_OF_RANGE		(1 << 31)
> -#define ADDRESS_ERROR		(1 << 30)
> -#define BLOCK_LEN_ERROR		(1 << 29)
> -#define ERASE_SEQ_ERROR		(1 << 28)
> -#define ERASE_PARAM		(1 << 27)
> -#define WP_VIOLATION		(1 << 26)
> -#define CARD_IS_LOCKED		(1 << 25)
> -#define LOCK_UNLOCK_FAILED	(1 << 24)
> -#define COM_CRC_ERROR		(1 << 23)
> -#define ILLEGAL_COMMAND		(1 << 22)
> -#define CARD_ECC_FAILED		(1 << 21)
> -#define CC_ERROR		(1 << 20)
> -#define SD_ERROR		(1 << 19)
> -#define CID_CSD_OVERWRITE	(1 << 16)
> -#define WP_ERASE_SKIP		(1 << 15)
> -#define CARD_ECC_DISABLED	(1 << 14)
> -#define ERASE_RESET		(1 << 13)
> -#define CURRENT_STATE		(7 << 9)
> -#define READY_FOR_DATA		(1 << 8)
> -#define APP_CMD			(1 << 5)
> -#define AKE_SEQ_ERROR		(1 << 3)
> +#define OUT_OF_RANGE            (1 << 31)
> +#define ADDRESS_ERROR           (1 << 30)
> +#define BLOCK_LEN_ERROR         (1 << 29)
> +#define ERASE_SEQ_ERROR         (1 << 28)
> +#define ERASE_PARAM             (1 << 27)
> +#define WP_VIOLATION            (1 << 26)
> +#define CARD_IS_LOCKED          (1 << 25)
> +#define LOCK_UNLOCK_FAILED      (1 << 24)
> +#define COM_CRC_ERROR           (1 << 23)
> +#define ILLEGAL_COMMAND         (1 << 22)
> +#define CARD_ECC_FAILED         (1 << 21)
> +#define CC_ERROR                (1 << 20)
> +#define SD_ERROR                (1 << 19)
> +#define CID_CSD_OVERWRITE       (1 << 16)
> +#define WP_ERASE_SKIP           (1 << 15)
> +#define CARD_ECC_DISABLED       (1 << 14)
> +#define ERASE_RESET             (1 << 13)
> +#define CURRENT_STATE           (7 << 9)
> +#define READY_FOR_DATA          (1 << 8)
> +#define APP_CMD                 (1 << 5)
> +#define AKE_SEQ_ERROR           (1 << 3)

The plan was to use the REGISTERFIELD definitions
we already have in sd.c and simply remove these:

FIELD(CSR, AKE_SEQ_ERROR,               3,  1)
FIELD(CSR, APP_CMD,                     5,  1)
FIELD(CSR, FX_EVENT,                    6,  1)
FIELD(CSR, READY_FOR_DATA,              8,  1)
FIELD(CSR, CURRENT_STATE,               9,  4)
FIELD(CSR, ERASE_RESET,                13,  1)
FIELD(CSR, CARD_ECC_DISABLED,          14,  1)
FIELD(CSR, WP_ERASE_SKIP,              15,  1)
FIELD(CSR, CSD_OVERWRITE,              16,  1)
FIELD(CSR, DEFERRED_RESPONSE,          17,  1)
FIELD(CSR, ERROR,                      19,  1)
FIELD(CSR, CC_ERROR,                   20,  1)
FIELD(CSR, CARD_ECC_FAILED,            21,  1)
FIELD(CSR, ILLEGAL_COMMAND,            22,  1)
FIELD(CSR, COM_CRC_ERROR,              23,  1)
FIELD(CSR, LOCK_UNLOCK_FAILED,         24,  1)
FIELD(CSR, CARD_IS_LOCKED,             25,  1)
FIELD(CSR, WP_VIOLATION,               26,  1)
FIELD(CSR, ERASE_PARAM,                27,  1)
FIELD(CSR, ERASE_SEQ_ERROR,            28,  1)
FIELD(CSR, BLOCK_LEN_ERROR,            29,  1)
FIELD(CSR, ADDRESS_ERROR,              30,  1)
FIELD(CSR, OUT_OF_RANGE,               31,  1)

Anyway, we never got there...
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

