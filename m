Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlEgd-0003fR-OQ
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 13:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlEgb-0003cg-C7
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 13:20:33 -0500
Received: from [2a00:1450:4864:20::329] (port=44887
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlEgV-0006Mi-Vu
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 13:20:31 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso5023918wme.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 10:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1tYp4wNbFy1JNCYWhvVDQsU8ZeYyK5TCLfJGrhjreis=;
 b=uNMXXFJpNNltNztb8JZRkHonnqJ/3pmiSiqVvUUYW6IS5wu9pKvMv69UFFy4T5j25z
 zu3jZQJT0IkOD6OVyKfXge471w4jUnR0ad+QV0/GaUZhyZJxEMgcd9P7gXv4zabKFA49
 JFMxSR4W86D8k8EwR0cBqbPJZvGvPNeNW+cxGiEqFRNYWIm3LxJobTvbUA0gcBoUQETH
 ORPaZIqz6yPtkOqy6ySBEtbHF5El6cBAvqbX5F0lMHl7JlIbH9//aXz6caM2bt6DB1T3
 V7p6GhEMjYqjvp/eaAGjnl5BpNG7Z6tu6TngQ5ASf6Iq1RBO9iSv1/yMTFPkiIg/VXkA
 J6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1tYp4wNbFy1JNCYWhvVDQsU8ZeYyK5TCLfJGrhjreis=;
 b=IYbv698e0hW5csdCbsU0KB1saMjysW41O1rrUJ4Hqt/hPcs5OmLeOEc44A8h6KscFJ
 YIydGNtbeQw53l/jTjooUptQy19QSciapNa1p5Zk+Dekgo9vrhyudo/HqxTw7A23MMYK
 6pc81Tiaje3rSFppkgFQn5NTj/BoSof0tk8Cq3m826AcT9FDZ/88BjlkUOlvlQzw524i
 I/4/YdwlvWsjzciOQV2+x0Q0kYbXOvjlyb+yv2x5U+jMZM5Ihmkg7/AOwrSfc9Z/Ejtp
 LoftdAQm5zzmiHAVnSjisPVKgANzm0xlnQnYvUFI07/Vv8qwNUUI37weeTjhxxK8AhHj
 AkjA==
X-Gm-Message-State: AOAM532pdNlZNojNGdAq65G+0/vy3hP8fIuzcTx3pqWTaGJueFKyL7Cw
 5ExjYTOzeoUUKzL+2WruUCnIPg==
X-Google-Smtp-Source: ABdhPJzfU0J1JJt2XmaGlkTGverLei1ux8sfEJw+cV88LDHsLYZzv2Tqw9wVjCptfr3MeRBJEOuRRw==
X-Received: by 2002:a1c:183:: with SMTP id 125mr10722946wmb.0.1636654825786;
 Thu, 11 Nov 2021 10:20:25 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id 10sm4456033wrb.75.2021.11.11.10.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 10:20:25 -0800 (PST)
Subject: Re: [PATCH v3 20/20] target/riscv: Enable uxl field write
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-21-zhiwei_liu@c-sky.com>
 <663dcab0-3370-7716-2abb-187893de6103@linaro.org>
 <00e67460-09de-7b19-3e16-a2f9af3546ae@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7cb12d8b-3439-ad5d-c36f-9b68e4754680@linaro.org>
Date: Thu, 11 Nov 2021 19:20:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <00e67460-09de-7b19-3e16-a2f9af3546ae@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 18:20:33 -0000

On 11/11/21 4:18 PM, Frédéric Pétrot wrote:
>> Still missing the update for write_sstatus, which I think is simply an update to 
>> sstatus_v1_10_mask.
> 
>    I take the liberty to jump in as I face the issue of updating that mask in the
>    128-bit patches: sstatus_v1_10_mask is a target_ulong, and when compiling for
>    32-bit hosts, we can't just or it with MSTATUS64_S/UXL that lie above the
>    32-bit limits.

Surely (target_ulong)MSTATUS64_UXL will properly produce 0 when oring into 
sstatus_v1_10_mask?  Which is correct for an RV32-only build.


r~

