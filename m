Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lihCt-0003UR-FH
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 13:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lihCj-0003SQ-W0
 for qemu-riscv@nongnu.org; Mon, 17 May 2021 13:38:59 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:46660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lihCe-00073Y-32
 for qemu-riscv@nongnu.org; Mon, 17 May 2021 13:38:57 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso6220696otb.13
 for <qemu-riscv@nongnu.org>; Mon, 17 May 2021 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ldhso26GEs3DEBzaPURX8lnxkqjDJonKIn1L7JZZPg0=;
 b=kxWMK5E9RuqSJ6DTcy3uI5iOLKYlywpuG3PRrS+vAom0oTj3esHyTBAvSOgo5XoSp4
 n8m2bXe1WeMKz+I1nAEGQYeUsRXklC6OPDpLD+LfhOIjYWUze3jrszUj7+tdjtZa2JdX
 rKnD2aoemBEkDk0dLvM7TjrHc/4/p19yGXEvwpYsO5/Dzs1qJ93uZ9pbPhVDYh/Nzwqh
 zouIUHr4JdOp9YXGpTEy5U5RfWakXYJcdvma9nSYRjUuY6UcOviFD+o0wlTDKhinggHh
 oOzR1g4peyH6xhOJj+d2302FWr0lshtqD0W8saODrtNIvd0q45ZFoCSsYhnREwzS/W7u
 qYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ldhso26GEs3DEBzaPURX8lnxkqjDJonKIn1L7JZZPg0=;
 b=KfAcC99dvUT6qCXLLV9rOxFtvTJ7fUrf3auWpuv1+PrayTE1h0W1Mg/tZm8bcBY4wC
 Gh66PEA4JUVh++oKURHoGtkhsfOfLW9xn6FbD791cLpSYue2oW9AcvLamwv4GUavOm6l
 9p53A6D7f7DD7JH2I5frY+fkvqmrkqkme1Ys1u7GAI8fFTGsm4z1cuT2sSUuybt2r8qU
 3SDG0DdpNIPKc4E8weGLvECeDR/AprGkU4oykfeN52xT6IWYvhM3jtiavaNoa5rXPPOT
 f/qo6KiRm8h/8CVwpX/cqcnRF62qxfUq4OAXRhElQrQNGgg5w5KY2PP6XaBWZ66UZGi0
 w6og==
X-Gm-Message-State: AOAM532RuzmJqB69vAmxgAxERMAisx/4d/TzEDZVO6rTJvs++g0uaq1z
 wD+rAw9JOZLvsZ14oGHa5orzPg==
X-Google-Smtp-Source: ABdhPJzcOEFxyI94wB2oqMolsLZpnNa1TYn7NLpi16ja1wRhZx36V13S5l9ph/Q3mjez4hQa+diVng==
X-Received: by 2002:a9d:c24:: with SMTP id 33mr550970otr.289.1621273129223;
 Mon, 17 May 2021 10:38:49 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id v22sm2873258oic.37.2021.05.17.10.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 10:38:49 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Remove obsolete 'CPU unmigratable' comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-trivial@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210517070851.857841-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <797d7a56-1e29-8d5b-0f3b-4cfdbcb1869d@linaro.org>
Date: Mon, 17 May 2021 12:38:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517070851.857841-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 17 May 2021 17:38:59 -0000

On 5/17/21 2:08 AM, Philippe Mathieu-Daudé wrote:
> The RISCV CPU is migratable since commit f7697f0e629
> ("target/riscv: Add basic vmstate description of CPU"),
> so remove an obsolete comment which is now incorrect.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/riscv/cpu.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

