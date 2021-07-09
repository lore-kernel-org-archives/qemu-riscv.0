Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1tEg-0006Cc-I9
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 12:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1tEU-00064J-AU; Fri, 09 Jul 2021 12:20:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1tET-0005XW-1O; Fri, 09 Jul 2021 12:20:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id f17so12883063wrt.6;
 Fri, 09 Jul 2021 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i4tvGWDHQsxkgiqVpJVqbnKSmRvljcs/LmO6NLB5diM=;
 b=rR0zAnnsQx69BC2obV9c/7UGydDJMIfjEd+s5i4uhHQxW5IDPvhEbckeqnAmFE7cXU
 F0uwCXknogd8DXERSIozBNPBR/QosytISHq0x0g63XyW4tDaPaGqzJuEdDOPs3CmWkd6
 qJewFgty0hdBXms9qGWBdAQpFjUwRWm23nM2Cx6H39uo0WiOqfVUagB9CZzr5g8lRO1B
 YHcIWlrDp18LgFQ2Yjm5MfT4uijXrAu1NRAy64c/3Gaotc0GZGS/fAYKwP44I1IpMKt1
 ZTjYdUmSmcp8UXKPYaQQgR/x/1gTf1Bh2DLMZGgJW50smWr3JKhY4B20ggps5Jpleclt
 yRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i4tvGWDHQsxkgiqVpJVqbnKSmRvljcs/LmO6NLB5diM=;
 b=majRJSg0VR1vofCgvVBK5p6eT8tExW0Dow5MiAACVTY50diWXAstxT/my1XP9G7Sjj
 YPxsjKI2xsIZ3/JzgjknJQpmzH/aCmj2RgD1yvqDXHU9XK4ve4RqKpJiOI8/v/8l+lyK
 eNP2TNosh5R2dIgAlDJBomcEm0LYZ+AHPkNDLdwb4N1ZPTlUM8tHOF+58xFEdsfMXNfF
 Dpeu3O+M+llw/GeItEBkKmYRcn+oakt9VtB97Buhxoki/j0ALOLmkM5jOnrhWZk2bUih
 jNn5Yr7ixFJHNdgBb1wSL7t/kfGqTwphAIO9bZoo3RkahdmujYyAsNKTNG8wy8i8pU8N
 LMow==
X-Gm-Message-State: AOAM5321VTCqOj1mnw2evPVWwxCAE39HNswjFAKZG865b/cRyN/aJ22/
 iDvnSC22vqIADI3/oUm0bz+qLFQrHp4=
X-Google-Smtp-Source: ABdhPJy1qm4nkxO6+DORlbehcNVKVJjc1cE8dgT3afX9kdKgM5C/LR1tc7T+Xqy846ZGv87JhTQcCQ==
X-Received: by 2002:a5d:4392:: with SMTP id i18mr22294736wrq.231.1625847602940; 
 Fri, 09 Jul 2021 09:20:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k20sm4042286wrd.70.2021.07.09.09.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:20:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 01/17] target/riscv: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e256e49-9540-ebfc-ea3b-1a27db801743@amsat.org>
Date: Fri, 9 Jul 2021 18:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709042608.883256-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 09 Jul 2021 16:20:12 -0000

On 7/9/21 6:25 AM, Richard Henderson wrote:
> Replace uses of tcg_const_* with the allocate and free close together.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 36 ++++----------
>  target/riscv/insn_trans/trans_rvf.c.inc |  3 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 65 +++++++++----------------
>  3 files changed, 34 insertions(+), 70 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

