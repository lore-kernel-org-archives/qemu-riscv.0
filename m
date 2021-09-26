Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUVKH-0002dZ-Es
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 10:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUVKG-0002dN-Bs; Sun, 26 Sep 2021 10:40:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUVKE-00055l-Sa; Sun, 26 Sep 2021 10:40:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id t18so43978760wrb.0;
 Sun, 26 Sep 2021 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=dj5PeCFUPeThAN+XNacCvV5PXoyU1XIaLoSWqlHCpb0=;
 b=KZxOPoL+4pxhrTRW0Ka/sSOM37Sl4mN4tTfny7pbOnWE1ZGjAzf6A1MwjLJAguSjB9
 gAFMHFNb2JITMyG3G/ftAloX4qyn7cpkaHPn+79GWq9T6321Ft4kNzOntWEo++zm5qAX
 1JoD2lYp+JYP3f1NODGJi+8YyQZs4mNJ9a5REpcTJkzKI0z/eIB2ZY1n1R9B4Q2KVvbi
 p3mwinCOtDbyzwfrMdruXUu8ihOdwvjjVWkDDNfFxRD5p53oSSyls21R38pr+ZI7Ppzv
 JqIfzCgV+xgWzuMSLhQ0VionNpXQZGQiX8WI1tnVxwVY0JawYr27e5DJTthijLib89h/
 MRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=dj5PeCFUPeThAN+XNacCvV5PXoyU1XIaLoSWqlHCpb0=;
 b=GPHuJLN5/hoV1FGB+MH1RTAfPWqtRVRWxOnUBcTIvEcsTLftwk7bO8h0K1a2geTF4+
 EN1C4FuqQPYvO5lXvntOxcunJ9gKSVQ0ZCfDtW3LQEiVMOxhO2F9Z/cQMbD83PxwmIHX
 BKhjhc9ORKAQcBpVT9WPRLS7ilaz2xz3v3kSVtHGhIdnUmhK7Y96Oq5zYpycb3Il8ukg
 Y52j4SifP10IpnDa9RaImj8e1rS6VqhnguPNUOvEjbLOt6xdJ1REzAcuXa+TlQsmRNIZ
 wmGTcgEb8rKex4YQC+2vNW/8VJRvnS3FgMlwIWF73xrDvPS8bDN6+x/qpG8IXE1XCJUf
 A2yA==
X-Gm-Message-State: AOAM533ZC1+2YyynGwpcGfNK+M8RLMaKDo1bjzGkdYbVPI6335GrbPR8
 lzy8HNbDFP9R1iIJpa2NXqc=
X-Google-Smtp-Source: ABdhPJyUr94XJtC8fOAixRWE9nNyfP/wiwUcO5X3eI+BhvbeL57wqgqnAr7X0kz17WbdYDJwZcx4Jg==
X-Received: by 2002:adf:a10f:: with SMTP id o15mr23144330wro.286.1632667216030; 
 Sun, 26 Sep 2021 07:40:16 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k17sm20065923wmj.0.2021.09.26.07.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 07:40:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <929bffcf-e0cd-8ade-ad9f-e2d58b6ba3d1@amsat.org>
Date: Sun, 26 Sep 2021 16:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] hw/char: ibex_uart: Register device in 'input'
 category
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210926105003.2716-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.478,
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
X-List-Received-Date: Sun, 26 Sep 2021 14:40:20 -0000

On 9/26/21 12:50, Bin Meng wrote:
> The category of ibex_uart device is not set. Put it into the
> 'input' category.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/char/ibex_uart.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index 9b0a817713..e58181fcf4 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -550,6 +550,7 @@ static void ibex_uart_class_init(ObjectClass *klass, void *data)
>      dc->realize = ibex_uart_realize;
>      dc->vmsd = &vmstate_ibex_uart;
>      device_class_set_props(dc, ibex_uart_properties);
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }

A bit orthogonal but I wonder if ADC (to the extent sensors)
and touch devices should be categorized as "input" ones.

Maybe we deserve a DEVICE_CATEGORY_SENSOR category?

Back to this patch:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

But it would be nice to have a generic way to avoid adding
uncategorized user-creatable devices.

