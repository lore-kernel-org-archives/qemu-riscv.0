Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKouu-0005Yb-Qr
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 17:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKous-0005WJ-13; Mon, 30 Aug 2021 17:34:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKouq-0007K5-GB; Mon, 30 Aug 2021 17:34:05 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so932354wms.4; 
 Mon, 30 Aug 2021 14:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZPCW3kXlJgVewzJ/EGIEmQf162n2sOAU1xoXOS0UgWg=;
 b=OfA+MjJ7kG1u2tsNLIdGx0S9cjFaoVQEaIsCY/uiDaXoSe6QI0MayyfzCLVFUmwBt/
 DD2ioS/ro8otwDFzE39pl31xEdxAIjX+ow2BIjQAvSaZ/0M9ROZcAof6z94LvlyyEmAY
 gjGHuArh82K7pLSsUntAMh6AS+SP5/BXUzZwIRhJedgS5Cbm5N++dc4X/AjRj2ZqPrNT
 10ILV0l7nOxSDfXSksQHqVlRS2I8lrhGJg3OU934ABBpRsesCmR15g4XCQpB3EwBVXqE
 IAAt4eROLzPQPS9ZnrFRpPQRDSymhfOGrHDbIFixpLCdHAJY6VS1VtAV0eQiYYidIipy
 iI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZPCW3kXlJgVewzJ/EGIEmQf162n2sOAU1xoXOS0UgWg=;
 b=lv7eWB3yWRcGzjc9rIPf3hcti/4jee9vqtfvyAa440kJ5+1iGy3BsIpolTpdJEtr25
 PXt/3Y8d96zo/4evXvZL8EJeOsL1+YidDBN9UUnL++Y3CDhfIIr36QxkTEf0PkOAG499
 2Z79zSDNXJEV+B0oNxNdimcBX4EjTl4x3cM3Klh95HhRSeHM7iTwlOGQAk9gOh0X51iT
 d/YCADBp0GNM+N3IeiMWAr3guWUEkWbAjqJQEzPPPYLjgofuimXBUTOooqqbJ7VFmUcK
 gFS486jP7I7NCVnRQVKdM2EGuher0IfISWtRWRBYqvqf30vj7ZgojTnJB48wC3XF+Q2c
 c4FQ==
X-Gm-Message-State: AOAM5311QBJsJW1GgCTWU8ik90gsNqMaY62PhZzEEj8T2jTfJfyR7lTp
 JWF0t96cQLaT5sIAT8UAwms=
X-Google-Smtp-Source: ABdhPJzkbfrPoB1Sp1aHj2a5QaNV50TXKfljY+5b2jHGls/TF6eJpm8GYGCE34CQfoBRPIpwsVNJ/Q==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr964805wmh.188.1630359241730; 
 Mon, 30 Aug 2021 14:34:01 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z19sm16673200wrg.28.2021.08.30.14.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:34:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 2/8] target/riscv: 128-bit registers creation and access
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-2-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0836f659-9705-dfe1-4733-cacf93aee112@amsat.org>
Date: Mon, 30 Aug 2021 23:34:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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
X-List-Received-Date: Mon, 30 Aug 2021 21:34:06 -0000

On 8/30/21 7:16 PM, Frédéric Pétrot wrote:
> Addition of the upper 64 bits of the 128-bit registers, along with
> the setter and getter for them and creation of the corresponding
> global tcg values.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  slirp                    |  2 +-
>  target/riscv/cpu.h       |  3 +++
>  target/riscv/translate.c | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/slirp b/slirp
> index a88d9ace23..8f43a99191 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
> +Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece

Unrelated change...

