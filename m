Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCHXE-0002Tk-FO
	for mharc-qemu-riscv@gnu.org; Sat, 07 Aug 2021 04:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHXD-0002Rc-4K; Sat, 07 Aug 2021 04:18:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHXB-0001K8-H0; Sat, 07 Aug 2021 04:18:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso10562755wms.0; 
 Sat, 07 Aug 2021 01:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=chtnsDrUYWQoi3JFBBDEckHm2ghEOSS1H9kUB8WGpG8=;
 b=Ao2YEMcJT1jr0fvUwTgnY1jJJa8la19ea72mWkbW9xbVnkPDFdKdF+RA243uqU6JWC
 M2hQYPIKO8BT29PlrqD0TXf0twEvoP0TQIRsudR4nOD/HXYE2kd1KERfTDbnFoHxgXEq
 qPdAQ9Yl0tvcmtBgsSwJ3sXB3Hbum3bp4rkdJRpZm+mUJmwh6iDkGV/1n00D7oLa1FWe
 CBhFOi3aZfXBztwPmEvN+Jseg60g5UO8XJ15lt53EidZx5n5V3MclWzJkprzGWhPgfZs
 kHI2UeOJPuUpMDYQcING6t3f3Q3exc96Vb+iAGWVGXoWtFMLvCFW0ZwAct9+ysnQLRYy
 rANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=chtnsDrUYWQoi3JFBBDEckHm2ghEOSS1H9kUB8WGpG8=;
 b=P3HA1O+cBHcJ4PTeC4eWCU/i9ANimT3y+pDKGe7TsEUN74lojHikKxbFT+11TEnnQj
 heAv+s2+BD+k34uh5MigCvvIqJ5+D1VSElo4q0JmZlkADt4q142ifmhAJ+7KTyzVW2tM
 zK0iiE9klk8C4KERoQ9XpDNkr0otha7lww9kOGf1IeM2LC5goPV2UYbrFZo8CFhSuDvG
 zYeokHhogKaNnwkmhIykPB0MaVK0Sh8MEBlh4rPYqiJWw6gZFeBy57KHVGAvTKIIcxsI
 MjVUulToJVgshePRwVERe1P9YIyLPsxab+FQ4DllDqOrUNK3v4ZfaIsQ7I+McG55W328
 kj7Q==
X-Gm-Message-State: AOAM533C/ERAUuTkEDUIVjATXsmx0Udr49zb/YdnnKZxxjZ6hiNwrCC0
 59TbDjUgSExrQS2NloN66hUbgbntiNJqOnCcB8w=
X-Google-Smtp-Source: ABdhPJw55jiIblatAdbGrTNNY5TSgmIoSZxK8yK3CQwpVpdEU24CvhpiEaf3nyujynZG5YD3n6F6qQ==
X-Received: by 2002:a05:600c:3648:: with SMTP id
 y8mr23891920wmq.144.1628324299528; 
 Sat, 07 Aug 2021 01:18:19 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n8sm11887795wrx.46.2021.08.07.01.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:18:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Move flash node to root
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210807035641.22449-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee756720-7abd-a89f-420a-f1cae77269f5@amsat.org>
Date: Sat, 7 Aug 2021 10:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807035641.22449-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
X-List-Received-Date: Sat, 07 Aug 2021 08:18:23 -0000

On 8/7/21 5:56 AM, Bin Meng wrote:
> The flash is not inside the SoC, so it's inappropriate to put it
> under the /soc node. Move it to root instead.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a3cd2599a..89fb607c47 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -455,7 +455,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
>      g_free(name);
>  
> -    name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
> +    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
>      qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

