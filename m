Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU75a-0006w0-Ni
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 08:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lU75Y-0006tf-PZ; Wed, 07 Apr 2021 08:15:16 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lU75X-0002Yh-7y; Wed, 07 Apr 2021 08:15:16 -0400
Received: by mail-ej1-x633.google.com with SMTP id w3so27284464ejc.4;
 Wed, 07 Apr 2021 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mg6tSTSa9/1fVvAJzVuw1qYpElpuw3kReNDOFrLamWc=;
 b=WavwiXRFNIVm8HqIF2tqzlRmdbP3PSYRyFzn5Wd65EvAQyx7guF1Xtvf3QixVXNUuG
 83pJnjnJtcas3OEXliDPgIB8WMBQFRqLxDunvPKmu3LBkbWpvy7S7NeGmpatVXStl9cc
 3vBMoienEkXw7ECPd/SUj90+fRsiB8bOsVezVJo0vPt4d+TDueGoCjL6xkuXfeXdId2f
 gDOf+xSPKUnvsLs9z01bowXjesdxbFQozpeJW66gHbRtXOJ5g3TpQ6teitggDg2S/PnP
 F1ue2xH5wA+S4+aCyKlbFkpbDu+9QbSN0E7RE0WLTnoDuHtHMNvPQ8rXVAKURIw2xmt/
 7bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mg6tSTSa9/1fVvAJzVuw1qYpElpuw3kReNDOFrLamWc=;
 b=MXjhgWZvKbec/JtFZ6ko4beC+hZVV1/QNQjypbjxNbIqPgskEXm+abgndFqjSsXMUq
 kqm0H71+UNg4DE0aidXxpTD4SksrfLnPhUULfodT93l3pP0NJPCHaQ0SZiGZhp67E4OI
 q8Fe2IjXF+iR1ejLlq+Pl1vyBXexoxbjUrjNuYN6plLpq7zBOuzstP1Qj8/NscoJbtwq
 N+XM6WcUeev0ktg6tJP2oj4dzf6Y4VFNfksNlQLT3HZs2VKY3fE120UAQm3X2Bifvgp2
 fSPL01/xetBb6cHJq6nAezPMcAAEWSH+oG1yzhzi4/7DgVX2mZnufO8oJD/4C97nF397
 iVGg==
X-Gm-Message-State: AOAM533hUtwKES5HT6bZAi6MTeFYvjwc5atelV+YmrbF56X4zES8W11M
 cvcCie9xdEepxXhRo2cSCFg=
X-Google-Smtp-Source: ABdhPJwEFlosE1r7KRVb8Bvin+UuNNMMm2xSoID1OhII2yY5DWxnmN3uHaSFOwjjZNqBmr1N3/vK4w==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr3395314ejh.4.1617797712697; 
 Wed, 07 Apr 2021 05:15:12 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r26sm4194091edc.43.2021.04.07.05.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 05:15:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Update the RISC-V CPU Maintainers
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 alistair23@gmail.com, palmer@dabbelt.com, bmeng.cn@gmail.com
References: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2bee9999-d0ba-3b7d-ca59-c6e17021ac1e@amsat.org>
Date: Wed, 7 Apr 2021 14:15:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 12:15:17 -0000

On 4/7/21 12:48 AM, Alistair Francis wrote:
> Update the RISC-V maintainers by removing Sagar and Bastian who haven't
> been involved recently.
> 
> Also add Bin who has been helping with reviews.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> I have run this by all of the people involved and they are all ok with
> the change.
> 
>  MAINTAINERS | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

FWIW
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

