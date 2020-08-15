Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6ya5-0004cb-6s
	for mharc-qemu-riscv@gnu.org; Sat, 15 Aug 2020 11:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6ya2-0004bO-SQ; Sat, 15 Aug 2020 11:58:50 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:35583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6ya1-000115-9Z; Sat, 15 Aug 2020 11:58:50 -0400
Received: by mail-ej1-x641.google.com with SMTP id a26so13054299ejc.2;
 Sat, 15 Aug 2020 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=23ClA1zj5xFJ/0MPwFI0Fld8oSCrUIsEogBg4Ief7j4=;
 b=YkTBr86YEckUL1Q6GdC5yh5BlLbjrHsGM3RT4t3K4tzG390qdJBs8YnBfb32JHfash
 yJAmcV14RkNFPxZ5XL9xZzN81TkLZmbxKhWhWbuhvTFqkgo9xsNy6ZC64svjGZunQwst
 xWwCYwrCJSrZT/MOlKpgMaGjJlLWirnLhVT2JJLI/oyqGr0k07NoT+3aNTxqSVnJH2JT
 PUXMy7/UqUHfMuAVUFwArzEZqO8ob4Js2LeO3hmqV2sPscaoEYNAIUFMaryJEDwGJrRl
 vmy6m/+BrYGRcUO4/qVwAv/m8Z7WGQWnzBvsq58+JYiYNKWDiXHRGKInaZxGtQVBlwvx
 2l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=23ClA1zj5xFJ/0MPwFI0Fld8oSCrUIsEogBg4Ief7j4=;
 b=mMOWvA9ZMmnpPqtOEkC482z9QLHaZMZjFMQYJ+pTQuD3JhYwWom1VXB7pM1DZ9/Xqs
 xC8wpFvGNFjMF0Walx5wzY9BwKtILWa6LN6EMrJaNhTlm3GS1O9ZanHoGIefF0HXZkFQ
 NrMte0Kb5plNCaF+sNH+jtz73FsgvLxduVegK8RhTsx/cm0qbMt078rhafGSrQuEm62s
 0FZtcQlucVEm1yJEZemTwF4zt4xkI7tNiIKtuDZ4fsJ0EIU4YG+wxslqZtCPLt8f6d2N
 flwcs5nfTrrXcSWkLpzZVLil7YLw+scTdEUV7HIvqHR2cagvre2menToBRu24kvRqzAh
 BEdA==
X-Gm-Message-State: AOAM532jSA+9epSxCxXIae5lgYyI0SnVYRrV4GNlq7AF630BObGK/hch
 BVxJJ0G2z7to9y5FtlGkj1c6LetlHWU=
X-Google-Smtp-Source: ABdhPJyCh2JMbov66bRCSzNwslYV0cujTQZRClFPFsv/CyvYv17PXy4cYPTjCJPM+yP+oPdO2Gskqg==
X-Received: by 2002:adf:94c3:: with SMTP id 61mr5783672wrr.289.1597480706228; 
 Sat, 15 Aug 2020 01:38:26 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id u204sm20580087wmg.9.2020.08.15.01.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2020 01:38:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 08/18] hw/sd: sd: Correctly set the high capacity bit
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <1597423256-14847-9-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3b8ef426-77ce-d3b2-594b-045cae5ec94f@amsat.org>
Date: Sat, 15 Aug 2020 10:38:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1597423256-14847-9-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 15 Aug 2020 15:58:51 -0000

On 8/14/20 6:40 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per the SD spec, Standard Capacity SD Memory Card (SDSC) supports
> capacity up to and including 2 GiB.
> 

Fixes: 2d7adea4fe ("hw/sd: Support SDHC size cards")

> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/sd/sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 51f5900..5e7fc3f 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -313,7 +313,7 @@ static void sd_ocr_powerup(void *opaque)
>      /* card power-up OK */
>      sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
>  
> -    if (sd->size > 1 * GiB) {
> +    if (sd->size > 2 * GiB) {

But you need to fix sd_set_csd() too, else this is incomplete.

Thanks,

Phil.

>          sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
>      }
>  }
> 


