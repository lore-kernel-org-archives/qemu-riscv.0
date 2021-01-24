Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3j5A-0001tw-FA
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3j52-0001st-La; Sun, 24 Jan 2021 12:21:41 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3j51-0003Qd-1I; Sun, 24 Jan 2021 12:21:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id c12so9957436wrc.7;
 Sun, 24 Jan 2021 09:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b1leKSgc5o1D6u7Sy9B8NMWINeSLJ94yomcdIpS+XUA=;
 b=c1WJn6Nd41HcwfvpIlrMi//QUpz8vcj7H8Fqf5rvzDndnDmldOueynYUDX3Zam/VCt
 M7ZbyUBdWrYzy89On6NgEA7rCNhO1hM9hKpPKWI0n9xDs2CsDFm3rscQN6Jp/uPReWGQ
 yJYkcIy7lYDc1XzEXCX9355hMMeGJ1HJvRZ3Hz7ErvDXXIR3DqwHY90yDrrFbFVyogNt
 +JYejJScoVKykEzoAgvtpOvDfJBFiu+S5ynoRmiplqfMJOQ+CXSxLg2ROLY20tNpmqtf
 WOqzHrZG7XeWqHzG5agZ45w1EuVYtwQw46auvNQ1chKWeRJtnFG0ZZVB7AZbVh2qZy5V
 mOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b1leKSgc5o1D6u7Sy9B8NMWINeSLJ94yomcdIpS+XUA=;
 b=XrfqAxnyksIMpCjnSmL1IsQlMXqxJBd159lNBBEKw57r6GwLjX/LJ8WQ8tFZ7gpqAr
 WNSLb8w22XuntVf3xjV51gG7Sqb9L6zrmIsEv/1ww9g3uwphRlwRuiq3ibZD3N6Orgcj
 mIzwFe7VGu+W2mVmcLgAOOhPmyqN4XbcFEOTAB+u46LzjonXYMfy2I+EWaufk+oyIGt2
 ASdzBwkWYOSxzgYJ98jutblyBy9NgyCNaAoTqt7CFrOPForA0q7xW4pscDLXC5knDsvw
 pHyC43kuNFyxj2BBjEdL4GeUM7ItwwBL0SzVmciuXzxsYNh+7INe/k/nW4JU6ah02/7L
 uwGg==
X-Gm-Message-State: AOAM532RXzKYq2QEUoNTMShqCnbFlnkIPlmO2OuhP8ApQGAhxy51WPMR
 zagwMfg5XVu81gafClaqWr0=
X-Google-Smtp-Source: ABdhPJyLAkOSGP2SwaFXXDKkBpxlHv+kmWXznMdcM2Udie8hU8BT9pXI91VjsrXgfuuNZpki0Sxh4w==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr1336038wrn.333.1611508896753; 
 Sun, 24 Jan 2021 09:21:36 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s1sm19871640wrv.97.2021.01.24.09.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:21:35 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 04/25] hw/sd: sd: Support CMD59 for SPI mode
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-5-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ae8b23de-77c9-dd34-713e-2ab054a310b4@amsat.org>
Date: Sun, 24 Jan 2021 18:21:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-5-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Sun, 24 Jan 2021 17:21:42 -0000

On 1/23/21 11:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> After the card is put into SPI mode, CRC check for all commands
> including CMD0 will be done according to CMD59 setting. But this
> command is currently unimplemented. Simply allow the decoding of
> CMD59, but the CRC remains unchecked.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
> 
> (no changes since v1)
> 
>  hw/sd/sd.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

