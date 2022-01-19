Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA8yh-00018D-BE
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 06:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nA8ya-00015q-Fd; Wed, 19 Jan 2022 06:18:04 -0500
Received: from [2607:f8b0:4864:20::62e] (port=38616
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nA8yU-00027f-Tj; Wed, 19 Jan 2022 06:18:00 -0500
Received: by mail-pl1-x62e.google.com with SMTP id c3so1843846pls.5;
 Wed, 19 Jan 2022 03:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=58J9h7WKd0SwNY013BhozY7oNdnjKjDnKp/3MOw1eFY=;
 b=pVzbGj3h346LJyOyck+LQ7ARlpxKCwEj7eyVCKm92AJGw4ggke2KU0S6tTr16l93xX
 38WXGsC/BkCY0+Go11a3ZImyqLeGgkTTB1s3ki+YXyMWnIYgd/3cx1Jw+bdPDh8zvS3q
 80+qKDolxXnHWLxQLfRlThyzCzHAN3c6vKu9GEUbv4EfW4joOCF3tO52bMhajgqFbMOk
 vFr2MUDkj5iacVDcBAlRVmYypou+XUeYz8RLpFGqZ4h6gbErOQQswCEHfxwklS3crwJ2
 eL6MqFxWUclI+rMdc009eXHhDnPnRnEXfKBYwg+HsFGZKtiTqe2o6o69sQjjIDMMuqcO
 hLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=58J9h7WKd0SwNY013BhozY7oNdnjKjDnKp/3MOw1eFY=;
 b=11rtcXaWKjPtnzhJyFK5548jcIzbCYOhkc6/WjM96tbRFfQA/IcR8NE4WBEwfFwRjj
 Fk+QVc3xV2RyprtjnEipotIK8bkg38z1oKLNaX91JPl3RGHh4ZM629wANcm+WeCzgd+U
 7aE/BmTqs9q6djfiilk3/HvfHocm1DzFF7rbXW1W2s1qL/2piMTWy1lBoXnFltZ0Upfp
 DL3/TfpGubUu8uB0i1QpP+V6790S4yFNtnYDvgYAYPrvtz4Zzzm0jV4kT6qKPbOAA8yC
 BI8Sj6JrDsJ3GebmXk5c3Rh2sClo96+yun51nzDR63jMmSSGET1ClV74Ngtd5wYh3dyt
 hCKA==
X-Gm-Message-State: AOAM531pHMMDSk79MGVk6gAeI37az+X27YmGe7V9S7sO1zj71pazR8OK
 hkJJMBkAG0anOH/Zz9wg7wU=
X-Google-Smtp-Source: ABdhPJy67H1zDj9S+eCdPrPruS0BcF5EHR1iOpli6o7hJrWOXyszlxZ+eoP8a5LmyFev97hv/lZ/uw==
X-Received: by 2002:a17:90a:a40d:: with SMTP id
 y13mr3808756pjp.23.1642591074632; 
 Wed, 19 Jan 2022 03:17:54 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s40sm21589782pfg.144.2022.01.19.03.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:17:54 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <d237abed-fe8c-fb29-3ec0-27a0504eeffc@amsat.org>
Date: Wed, 19 Jan 2022 12:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] target/riscv: Add XVentanaCondOps custom extension
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Greg Favor <gfavor@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 11:18:05 -0000

On 13/1/22 21:20, Philipp Tomsich wrote:
> This adds the decoder and translation for the XVentanaCondOps custom
> extension (vendor-defined by Ventana Micro Systems), which is
> documented at https://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
> 
> This commit then also adds a guard-function (has_XVentanaCondOps_p)
> and the decoder function to the table of decoders, enabling the
> support for the XVentanaCondOps extension.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> 
> ---
> 
> Changes in v2:
> - Split off decode table into XVentanaCondOps.decode
> - Wire up XVentanaCondOps in the decoder-table

>   static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>   {
> @@ -862,6 +874,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           bool (*decode_func)(DisasContext *, uint32_t);
>       } decoders[] = {
>           { always_true_p,  decode_insn32 },

"always_true" is the first entry,

> +        { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },

so is that ever called?

>       };
>   
>       /* Check for compressed insn */


