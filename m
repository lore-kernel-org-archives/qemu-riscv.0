Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQtGp-0007mn-PU
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 12:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQtGm-0007gm-W9
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 12:30:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQtGj-0001hx-6r
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 12:30:20 -0400
Received: by mail-pg1-x534.google.com with SMTP id s206so15493310pgs.3
 for <qemu-riscv@nongnu.org>; Wed, 24 Aug 2022 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=eqHefAtabyN/xmMnihPcG7vaV9X1MljFH2589Q3AX4k=;
 b=tMhjjoyJWJsPxyWskMrKsoTDOdXLYT4LYbgh8CHAst4H6kYNyZaVoceYJinjE9hunw
 lTdtycGPLnD99qpaUAR2fl78dKNIuMGb0jBO2RCNX4637MsKe0cgKZVqXks7YNBbjlpe
 0229QhoxnJpGCQZR71UubKLlkRXrtypVIt75xhTCsZ4ZgsdRdRcROKQBSQeCnc5y/AUU
 iB+PJ5lo8skI1d4rwCzZwNhgJby3jw87qCYS9OVS1aVdI8KKrKbixnDk3xGB7rbyU7BH
 uYYQZkUmC/1z+voqMysnTIUyyjznFBSIJgfcdQdjPko9k14VgC0YV/l6Kb2wIKCix18K
 ThEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=eqHefAtabyN/xmMnihPcG7vaV9X1MljFH2589Q3AX4k=;
 b=iXRt76X49XrahMsNX3lEX/r3jk6Y/pKDCeIp/+cIbIjIdZv8dXH73ee/VMETrC/kZT
 X3ZgfxNV82hzrNh7gSFSveaKTxHamAU3zh0qBwmJzIlcezbDhJILCYhV9FLTQd1XDoUq
 4sIBnTHBqiy4YwXrJoP0TZb4pfDxx5eRW5x3A2z/jN7mOelkLULiK9AGWRWqXpeihaNT
 tq6RNcJ55il4vTOP7j+JpS/YUFAhtd+SjVn0AfRwX1dZh1cShW2li+zdHtA7e9smEzuR
 0QXa33Om++iOy6fHk9ew9+CxfE1rRkpBVvMkGBvmAlJMRVN6vr8r/gk+XuIObbKPDLY1
 QDaQ==
X-Gm-Message-State: ACgBeo1QWrPp4ojtrqP0DELTsJfEVH4f33Q9nzdhrqDv9y3L55hK5i+x
 7/CbMQgdibHwmVP9G4LYumkQRQ==
X-Google-Smtp-Source: AA6agR4ZKWfhRJqEn0UnajwKFiQlhhltG88XPK0peHxaITVlm0E8E4j2GWF/ZR7n5sakJBYnevZbFQ==
X-Received: by 2002:a05:6a00:804:b0:52f:43f9:b634 with SMTP id
 m4-20020a056a00080400b0052f43f9b634mr30656496pfk.62.1661358615550; 
 Wed, 24 Aug 2022 09:30:15 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 e29-20020aa7981d000000b0052dce4edceesm8939304pfl.169.2022.08.24.09.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 09:30:14 -0700 (PDT)
Message-ID: <3440bcf4-e7d6-a0c4-0606-76754aad6986@linaro.org>
Date: Wed, 24 Aug 2022 09:30:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 1/4] target/riscv: Use xl instead of mxl for
 disassemble
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
 <20220824130331.21315-2-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824130331.21315-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 24 Aug 2022 16:30:21 -0000

On 8/24/22 06:03, LIU Zhiwei wrote:
> Disassemble function(plugin_disas, target_disas, monitor_disas) will
> always call set_disas_info before disassembling instructions.
> 
> plugin_disas  and target_disas will always be called under a TB, which
> has the same XLEN.
> 
> We can't ensure that monitor_disas will always be called under a TB,
> but current XLEN will still be a better choice, thus we can ensure at
> least the disassemble of the nearest one TB is right.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

