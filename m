Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nvhTv-0003TN-Gq
	for mharc-qemu-riscv@gnu.org; Mon, 30 May 2022 11:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvhTt-0003Qk-6n; Mon, 30 May 2022 11:38:57 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvhTr-0002aN-Ko; Mon, 30 May 2022 11:38:56 -0400
Received: by mail-pg1-x530.google.com with SMTP id 129so6164847pgc.2;
 Mon, 30 May 2022 08:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nsQr7paZ4+ABfpJ5g+YTTOZjCMP6VmacVjzhsOv8WOA=;
 b=YH17kO9qicy2pUuItThi1dSuluyOwbrQ/aM4VbuLWKRYHF8dbkgCDqU9gfl2nUaEDD
 kXgckaFMAeojgtOhdjuciIJmVdF4sdYjc+XRRGSok20DKYosSY66dPR+65inhgQCf574
 jpnZAV/VPBlcDdzldVaY1Z2TQnVKO04OKNHFCS4QzA4C7lakSIZKf5v41wmzj3a5GXP5
 1tPvhlO+ZZFAU5FzqYibpnl107nnnRmj3Ew+cGPqrDT8ZX4nFR5cNNQVgaqwWHIJfpnu
 jJGrs9zB9zNrPYZUuSq/QU0iVQ/ib/u3ckODBzPExqTNxsnVmvDi2MOGxjdn2ZF3rAxm
 ZnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nsQr7paZ4+ABfpJ5g+YTTOZjCMP6VmacVjzhsOv8WOA=;
 b=y6NdfCK+YCUDAMnrTuszwVCt/AGNmLkGZh9A4nYoF8Wi4MJ8wEXvgPSza+2jHjx1qm
 EyrP+RtQlK7tz45LZ2kUlsWxOnkRSKd+7dCLGoGjlLtUMcqDJQX2G9fmZ8ci+ZnRVJAN
 3FCRy6mrB1TeC/PegoNF02lM/0aLqa28T72feC0NgTMKsQIGx2rq4nteoJy//sxla8Gr
 Q5lK8wTVpc2UrhDiVHpUmNP1CsysTG5gDZW0t3/SLpzZGLaL29VvqHQ91Z3Xr1haaMKj
 wSzm/tNKgunAyxBOv48BmBV1h27xW4HtBnxocLADtsGnGSEVLifS6dcIyMRS4y4Sx5gK
 b4Cg==
X-Gm-Message-State: AOAM531Eti8AFGR4bcWKhfse3+lZRG/kCFfvN5XWx5ZSgZWhX7jXNr23
 uicIE2uiECI89zTy59OHbkw=
X-Google-Smtp-Source: ABdhPJwf2qsmzX+TMRcGtYTf9KNDsACrF0pv+Z0LXrpxpieGa35Syh2q8defsvLpLConkLq67IhYkg==
X-Received: by 2002:a63:6a87:0:b0:3f9:c829:796d with SMTP id
 f129-20020a636a87000000b003f9c829796dmr42121178pgc.232.1653925133588; 
 Mon, 30 May 2022 08:38:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050dc762818csm8946702pfn.102.2022.05.30.08.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 08:38:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <e8feb9d9-b9da-c1d7-a978-5966a6bd30f8@amsat.org>
Date: Mon, 30 May 2022 17:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] MAINTAINERS: Add myself as hw/core/uboot_image.h
 maintainer
Content-Language: en-US
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, bmeng.cn@gmail.com
References: <20220509091339.26016-1-alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220509091339.26016-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 30 May 2022 15:38:58 -0000

On 9/5/22 11:13, Alistair Francis via wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 662ec47246..9ba30cec8a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2173,6 +2173,7 @@ Generic Loader
>   M: Alistair Francis <alistair@alistair23.me>
>   S: Maintained
>   F: hw/core/generic-loader.c
> +F: hw/core/uboot_image.h
>   F: include/hw/core/generic-loader.h
>   F: docs/system/generic-loader.rst
>   

Alternative patch subject:

"MAINTAINERS: Cover hw/core/uboot_image.h within Generic Loader section"

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

