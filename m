Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUVKn-00033h-QI
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 10:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUVKi-000321-8i; Sun, 26 Sep 2021 10:40:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUVKg-0005Sv-RS; Sun, 26 Sep 2021 10:40:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id t8so43989097wrq.4;
 Sun, 26 Sep 2021 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L0UDpYMuYqd61BMBBF5TdlVrKPFkBRFM9HhEyo3+K8g=;
 b=F406oe1X5I2PiU3uZzDjJhXmB7nUcvLKWALSs3G7fkgReH8J55CgGfykojExPl9Lka
 fBbjudsTxew7E6bOpqmBndJnNfPQ/zQHuxGYv5JMUGHTvvCLeR5OLzQSYoVvyk0hRhya
 uwMH7yf7S0yjU/aLhJCt48goE32idqVG9KpWZ+GuXkUwZ/nR+RiTpc4+bPDT/ETcp5oV
 84G3kLCG4DG2tiCLYIkHpzhrpuNQc/mdvb6poHtOaMcsgTb+rU+vTG3s7ZfKGYLrNcU7
 DD1uAkzQDO4dCHbHREuRBsTWCSQp8jov4yxOrjHKbz4pOx/+bMyRGBxgxabAjINpWYbK
 J8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L0UDpYMuYqd61BMBBF5TdlVrKPFkBRFM9HhEyo3+K8g=;
 b=NEp87q7LT71PLw3lriM80JHpWi/rzWi1YNJ+ZaTx9avMzJRDnOeS6stoc3N6b5ujiC
 5Zaj5EWOAQFmEosiKSnbKB79Sl6ZfHAZ9oIpQD85X4cuP0tbp5wMJmfnwdF2tJjW3Sp5
 2UJxqUnyrk5WeSe7IQh5AzHRpADdtnGM5mlOGfouP+ms+tL197V4NoctvqRvkYOFQSYh
 M/u4EL1aZfqZCClTzl4DHTs5itGog3er5rSfHoc/nHh7mE4/3u3VhyUo30eFzttUXM9P
 zeYYnoM0zPVRTLnujXVcbNzun3rKqQ9WILlmZQ8+sbkngJ5EStkIa8gkLijubVBtk4zN
 +zjw==
X-Gm-Message-State: AOAM533CeBMZplHQSBrGCUlQVOSuQoaiCnvEKSvrkNL4Fskuiz8gIHSe
 LuLoy5I9hPL17L+M/12xDBmFXdcLWUA=
X-Google-Smtp-Source: ABdhPJy9caL9rzcRYmviirUffLNTRfGuKc9ThMLn+eeDydTjS7B84CMLumB9CluVT2dul9Qoz8Vydw==
X-Received: by 2002:a5d:514e:: with SMTP id u14mr13465893wrt.32.1632667245368; 
 Sun, 26 Sep 2021 07:40:45 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c4sm14147763wrt.23.2021.09.26.07.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 07:40:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <69c5dc06-bfed-d016-21b2-50755ef3cf2c@amsat.org>
Date: Sun, 26 Sep 2021 16:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] hw/char: sifive_uart: Register device in 'input'
 category
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
 <20210926105003.2716-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210926105003.2716-3-bmeng.cn@gmail.com>
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
X-List-Received-Date: Sun, 26 Sep 2021 14:40:49 -0000

On 9/26/21 12:50, Bin Meng wrote:
> The category of sifive_uart device is not set. Put it into the
> 'input' category.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/char/sifive_uart.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

