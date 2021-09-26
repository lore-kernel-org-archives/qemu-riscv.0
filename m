Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUVKW-0002zz-7D
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 10:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUVKU-0002xg-BK; Sun, 26 Sep 2021 10:40:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUVKS-0005Hm-QB; Sun, 26 Sep 2021 10:40:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id w29so43795555wra.8;
 Sun, 26 Sep 2021 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HKE07AjzbWV25+htOdJVTV7TKwetBtKEJRrLbRsgb7Q=;
 b=L2TuYPC2qS6aATXFJexInkQRk7rIe4eRsXdM+zicaZA3IxD0me2cAUZlENb2HLQIsJ
 AONk/G4Eulxcbb6QnDKE4QO0DfXxvZ7zzEiOc+1/UNrdKa/qsw7ZYYOJe3nbvtMoprWt
 Yj+uUWe7auglVG3/baMl5vKaKpDtsh3DFPGq6oX5+vrZHgewNi8aE6xBe8zZRkeEkhwi
 xf0c/6LoR4Pz0yttTNwyk61RywUGHZ0t315CMnTGNIod2NLV9pHte4c+Qw65rbiRdX9r
 G4IXBi6nuZdc782cso9BPhbIFeVIuvBaV8f2ZoUmoOGtSQ57lJwvO4PGQr46TV8KSe2R
 qi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HKE07AjzbWV25+htOdJVTV7TKwetBtKEJRrLbRsgb7Q=;
 b=K5d6Goi+65ekev+Jg0ASQ8/e5dK/aiQ2TwcHJ2x6iGhp1zGVVZfSdtpDNNjaCHc/cf
 K3B4vBXYwe3Y0iplsprA95ov3I7JxkenVJMBdQXaO+BadNQMFqHDbrpbUoZdr2dHyBJC
 /c2l9tq8vRigqWqabLJrr4h+3Hfidl0CagLQGCbAOlzwgI9df2kYkMjnqWfCY3ES8V7N
 fItHn1L80sIMzxclSrlW4V3q5svLx5iKvhEEriEUPtzSH1RrrjSrN2TQWoyfpxUfyO4h
 bDYVpWQatqh8z+4hmLfu+Ab5JsMgJ/gh3zLtR7NG/O5UtxHYLgmwQfc/wYdriW7ktlHv
 VL+w==
X-Gm-Message-State: AOAM532OboFcmhQc7eN/T9Cmw/GIlEn5IoPGP4qV6lUTdxjCbeeRmxxV
 ldRhAkJPDFfgnOzWI1SwvJw=
X-Google-Smtp-Source: ABdhPJynRqBgBPSV5NyV6kV0YZ7oAp0M9n/VY90a3fpaUDDU/C8GIax1OykqP5drTEuh7xukUFcNNg==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr22649854wry.305.1632667230997; 
 Sun, 26 Sep 2021 07:40:30 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id a3sm13931624wrt.28.2021.09.26.07.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 07:40:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <2dd79681-12b2-9d7e-f723-3a36cb1bed0a@amsat.org>
Date: Sun, 26 Sep 2021 16:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/3] hw/char: shakti_uart: Register device in 'input'
 category
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
 <20210926105003.2716-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210926105003.2716-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Sun, 26 Sep 2021 14:40:34 -0000

On 9/26/21 12:50, Bin Meng wrote:
> The category of shakti_uart device is not set. Put it into the
> 'input' category.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/char/shakti_uart.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

