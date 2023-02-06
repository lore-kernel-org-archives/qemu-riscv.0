Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOxfk-0002tj-M7
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 04:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOxfi-0002rc-Ti
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 04:20:23 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOxfZ-0007qF-1U
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 04:20:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id h3so1855743wrp.10
 for <qemu-riscv@nongnu.org>; Mon, 06 Feb 2023 01:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fGqdE+3KwLKtPmhzyHHh5LIzl/ziJDYhK3nMq9ftjqo=;
 b=zaKvzXtHlpmVIk8lk+gmIAIpw2Y/GuyI+QJsC9wbcR93oqbAh7//3U1G9y0hXJLbgl
 s1sXRyqAl1m7Nj3PTjFuEgGyFFNWajI88/Qkrj9SRlyjPIDNciBbgEb+Xc0aO/NZjgaf
 jwrio2xDTunOP3h16x756BL9mQgnaZBpXWW87hsSWM3zJwPf/wztIz6EW+J9pqCyv6f8
 0YYprPN8Ly2XSq51v9jIa/67mGcpN/797efUwjZak/LL+HVBsRP17qWGVdR1Rph3WEyi
 FA/NyZGffdKsxH1RN4Yv6zsW7YWVvhV4ZgGEJ5hB1POXJ+Qhb3JTFocJsGMR1iF3pXML
 4lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGqdE+3KwLKtPmhzyHHh5LIzl/ziJDYhK3nMq9ftjqo=;
 b=aq4slcAqKBj4oQvbI0j4pqAqVuUFW4C/pigA13k0xhQOWkMBpZG3jsOgvevX9F/LuN
 AZEztPJ05iL1HNiszAKAcEbSS7F74Jbe68cB1NDkSve6uXyP+fWjdLxVjaj49CFOAerS
 +KsnuzwnyFxRDaOhBgtY30wTX3O36qCqZK6FCvl0qhdAKNg4gnvrDZxdDrJBZNwHbS0v
 oDw2R4E2rPSisPWOIJ6L9zXZlFuDsUOd+AcbX3hkYj2UxdBh/hUITrziuAVXZcMlJ8Js
 M6+PD1adbKIBT7YNLUNVahE1UvlvPDlN+bKMaF6MpzRivD5aB95Y1koRYbCioRNTvSd+
 ptJA==
X-Gm-Message-State: AO0yUKX4u6mAbQ7k4iF9y4Wf3cT8lRA7vrSMUFgv7jwjcq3lkPv5ZvXJ
 a3vCnBBrqBeRflG8P3F1op8wow==
X-Google-Smtp-Source: AK7set9HW756wmsNXNvLwyeOvZHrRmTmR5svmoQd6MtALGXDgcce5lto/CSukFDIUe5YIG56/3ONlw==
X-Received: by 2002:a5d:5c01:0:b0:2bf:ea34:dfe4 with SMTP id
 cc1-20020a5d5c01000000b002bfea34dfe4mr18989097wrb.42.1675675209838; 
 Mon, 06 Feb 2023 01:20:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b002c3efca57e1sm383655wrt.110.2023.02.06.01.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 01:20:08 -0800 (PST)
Message-ID: <a441ba3c-a454-8680-bf52-9d71a0f9df7a@linaro.org>
Date: Mon, 6 Feb 2023 10:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/riscv: virt: Simplify virt_{get,set}_aclint()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20230206085007.3618715-1-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206085007.3618715-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 06 Feb 2023 09:20:23 -0000

On 6/2/23 09:50, Bin Meng wrote:
> There is no need to declare an intermediate "MachineState *ms".
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>   hw/riscv/virt.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



