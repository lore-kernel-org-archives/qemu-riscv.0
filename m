Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzi1c-0008Of-UR
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 10:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzi1Z-0008LV-4T; Wed, 13 Jan 2021 10:25:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzi1X-00054T-AJ; Wed, 13 Jan 2021 10:25:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t16so2545315wra.3;
 Wed, 13 Jan 2021 07:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5rWxAeownMudbjh3CcVSYu0Z8YPxhgj9UkyNzmUJkhc=;
 b=M4Fnz4v2HXR1N743FJRHCAyh3+Vs29dQdXNWY0YkNAneL3KiqhVorGrbACu6H5nPy3
 oMQEJq0yTp/lTpqgFE4Gv1KoAM5eekwz2/r23FbORV6okNSmiBEaGvVI00l9fuXHR0xd
 cODAJINp1ArF1Tp2973omlyeiSJG0XAvycwpQNFIBFNR48r48fry9yjEBQQMWCzjOb3e
 YXgb+PVIWuiG0RcNTaI8b8DWEOC/5KV5tZ1i7boBID8ZEHeq0+SHetmvJCVB8lyH01pd
 59TWXVuLgn8XYijQJzrq9ZRPIvrNdpPMQ6Ebc1FZfcQiU5is8c0SK2Ya0DJdL80Yr214
 KdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5rWxAeownMudbjh3CcVSYu0Z8YPxhgj9UkyNzmUJkhc=;
 b=r0sqRG6k6cJfImgc9wpBbKy1C2FXV7gOykAPEFBCwQD0H1mZDJj8V8CBYfaWH7T9ZZ
 5OYtgdIbW3l/dHiX9fct3PqAN4tLpYMvdwnLANa4hQtS+hKSZ3etaA0QhMBpebhfVQgg
 /wLedG5FN6ToXFnbI7FNzbGr7Dd1jisZ2+RhMVwi+tEcJNDmhxAAvsycD8iNwW0RTN5w
 shkgLjNkqIdHdGb7cKyHk2xYOev+hJh2JpLH5S6/iwePmcnAU6U1MG1XLSEc9XGZtuRJ
 tJ5HKfAI8VwsPA59Z2ewb69R/NvDEbPJS0wEPfE7LUrVOPh/wzpXx2YeVngkI3BZunyw
 mt8Q==
X-Gm-Message-State: AOAM533Yr66rvbtp8cCbihpyD79gYmJrjUvqk/Z9+7EoxCci8Bc3cAXY
 UABSLCvfI48R5ZG299Y2MGQ=
X-Google-Smtp-Source: ABdhPJx9SY0B1tRzFySR7PtYXwTWL2LjA4n3sCCLoQSdXGs1Lw7sQX6zqoibImlv66++aeSNe/JbQw==
X-Received: by 2002:a5d:4fcf:: with SMTP id h15mr3082800wrw.323.1610551524339; 
 Wed, 13 Jan 2021 07:25:24 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b132sm3659535wmh.21.2021.01.13.07.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 07:25:23 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 2/5] tcg/ppc: Hoist common argument loads in tcg_out_op()
To: Richard Henderson <richard.henderson@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210111150114.1415930-1-f4bug@amsat.org>
 <20210111150114.1415930-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fa4c5ea6-3ca6-6aa4-6dea-5b400bc7ccd1@amsat.org>
Date: Wed, 13 Jan 2021 16:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111150114.1415930-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 13 Jan 2021 15:25:31 -0000

On 1/11/21 4:01 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 294 ++++++++++++++++++---------------------
>  1 file changed, 138 insertions(+), 156 deletions(-)
...

> @@ -2818,10 +2805,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>      case INDEX_op_bswap32_i32:
>      case INDEX_op_bswap32_i64:
>          /* Stolen from gcc's builtin_bswap32 */
> -        a1 = args[1];
> -        a0 = args[0] == a1 ? TCG_REG_R0 : args[0];
> +        a0 = a0 == a1 ? TCG_REG_R0 : a0;

Oops... Here is probably the regression reported by Miroslav,
I shouldn't have changed this line, simply remove the a1
assignment:

  -        a1 = args[1];
           a0 = args[0] == a1 ? TCG_REG_R0 : args[0];

>  
> -        /* a1 = args[1] # abcd */
> +        /* a1 = a1 # abcd */
>          /* a0 = rotate_left (a1, 8) # bcda */
>          tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
>          /* a0 = (a0 & ~0xff000000) | ((a1 r<< 24) & 0xff000000) # dcda */
...

