Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEmJ-0006AT-5Z
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEmH-00062L-2C
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:23:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEmE-0004do-EH
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:23:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id g18so125325wrc.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qhw7DxCf6SfIVowzbh8yAc2qUc+bl4pVxEleJ2/Dj+A=;
 b=eA86I7WzSViVKS6H0gihDzK5qG7/gzh4NLmvLadT3zm/obXiiHOswktrwCIiRZ033Y
 pgVYkQ3ehgdUCSK3swwv5rqGRQ0uam84y5OTk8SwC8RM3aX7FGDXVVPhPN2q6xv5I+Pg
 xWvSqQkCs72/s5vqzHjyTPT9nBfm4KBz0QZnUv0umk0af5oT/uzrliLEI8gyEVbY6UNx
 kcaT7KHncWPX6FaZ7AD8aWKNFMmz0d89lG1wGRc7NstQmDbyJGGEg7+NcS+U/W4JJOOn
 vVOn5VI4YolCYZUlJ/erz0vBmCEC3b6IBhTzZv9dxqTGSSVyMcFEK9PMCkzGWHjb75rb
 ziaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qhw7DxCf6SfIVowzbh8yAc2qUc+bl4pVxEleJ2/Dj+A=;
 b=NkdQTJ8taxJWwgVN7X2Ow8868Ckqxeva5zoqLvsfVQ4tgGCHWKvFTVxxAraFV1Mrmy
 Opw222yCyfGNheeByBMn6Gs1SuSl3jEhdZCd1gcK1Bwm6Mj3TzVAq81quw4nYzSrJf7G
 UKyDn0gQlx0MhZCuRh2n1QJVtXHykeYqDiWFacWJNYAIzLVn/7P/kmP1hCya1ycNnkU0
 jIFPbL3nn2xisaTY/EKJXURL5L0jeyjnGeaCVqR7T3c3A/l4ahmb7FXRp2qEg7pKXSAm
 /cWzgh57e8JwKmSpdi6o1xyL91dgW8kzHSQ3wFMk9o0mb8710rinaViLmgW9qm4GDONY
 ZRhg==
X-Gm-Message-State: AOAM533H4e8FLU7CmRQF46oMbGAWGxb6FMDk/KlkAFkx6nVF6YjB3Gq1
 bUE5y8bzVhU5xxnbf+hRP144sZfo6ORKVcKMpvU=
X-Google-Smtp-Source: ABdhPJw/m0vOfrzsIU/O9GsoqmuWcikfr1GBudo0rN7Jo1ttLMiNZC+bDKbtKKjj1Nis3DmURWU7oA==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr647806wrw.116.1630696981047; 
 Fri, 03 Sep 2021 12:23:01 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id p4sm200939wmc.11.2021.09.03.12.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:23:00 -0700 (PDT)
Subject: Re: [PATCH 20/24] target/sparc: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Chris Wulff <crwulff@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81dfd498-e661-064a-8323-10ef0eaef4b8@linaro.org>
Date: Fri, 3 Sep 2021 21:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 19:23:05 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/sparc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

