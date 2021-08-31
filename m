Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKtXl-0007NQ-5c
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 22:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKtXh-0007Mx-IW
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 22:30:30 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKtXc-00029p-6I
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 22:30:26 -0400
Received: by mail-pl1-x62e.google.com with SMTP id m17so9703272plc.6
 for <qemu-riscv@nongnu.org>; Mon, 30 Aug 2021 19:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+a7/rxWEoFpRCgIH6mG5XywX4d6JvReTMXdaGMtp4Sg=;
 b=YyByOtG4p3cauVErNTMYDljlD2e5TPi/7Cj8JU0KBdmsVyzUE5wSUwodNr9JUj5WD0
 VOkozjkVFeCio08hgL2Avg7s2ytzSt+CuDgF54Qxrm0RL5YAlW8Os7ViO/zjRln4AgXN
 fVKua2rhYxuhtv1BUXTOHKxNSetJ6v20b3JGo+uBFOnqxHtXeJLaZjBUeSBP1n1m38qy
 OPhNfi3dmnsQ4DUYQwxJb1zJidHrx+ZXUZPNjAw6i2+MUf5quyEYtVAv7L57LsarsvNB
 5mw/wHwX4CBPrEctgsN93GqZ/AmPCO3+zsckJQpGkzHknCf3HY3SrzX0AbPgrcMfFWPt
 94aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+a7/rxWEoFpRCgIH6mG5XywX4d6JvReTMXdaGMtp4Sg=;
 b=KchBTR8KQkwbl2MRb+0NJ8rNFBe2YrOO8gusWerJaBT6eN1Q0bEEmgyI+s3UaWpFOK
 PMt0FXWSaL8u8tKXLxvGvdGaAaolZww3Q/d4zwGAxW1f0x1ncQFYFAH2iOiXYx645EM8
 9bMQCPrT5olrxQhHi7Oa3574WgLMWMozR4vAjnpwQcb7IPmE7vUKz31j4c47Ll6beTEi
 oMi6oXm02GT6S1sifEcR6qQcHlxci9xup7gqovSwRNle/aHMgKZL9eoicjURxMVd4j1p
 cZ5kfJwgOeuw948fH5GIfxsI1HQWKklZ9uGWC9E8CamK1sufmXw6vO7Sc/d8VEwxB9qQ
 OhqA==
X-Gm-Message-State: AOAM533DLT8qSAjgum+xGWHev6jdF7Ajd847Yp+/jmYKrGo+tZc0PuMS
 iXxtB5lmbxWnmcU0QVPgQKiHNA==
X-Google-Smtp-Source: ABdhPJwPRJUgHBmURo4GlS47nGBaj2lb0vVEI5t5woZvW62ijVErNiv+HSKTNEMVAblbSsyBcMUn4Q==
X-Received: by 2002:a17:90a:8b95:: with SMTP id
 z21mr2351935pjn.131.1630377022070; 
 Mon, 30 Aug 2021 19:30:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o10sm15423089pfk.212.2021.08.30.19.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 19:30:21 -0700 (PDT)
Subject: Re: [PATCH 3/8] target/riscv: Addition of 128-bit ldu, lq and sq
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d2b1d73-184c-8ad6-80be-20ed14cd7d5e@linaro.org>
Date: Mon, 30 Aug 2021 19:30:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
X-List-Received-Date: Tue, 31 Aug 2021 02:30:31 -0000

On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
> +void tcg_gen_ext_i64_i128(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
> +{
> +    tcg_gen_mov_i64(lo, arg);
> +    tcg_gen_sari_i64(hi, arg, 63);
> +}

No, don't add this until we add TCGv_i128.
Just use sari as needed in target/riscv when dealing with TCGv_i64.


r~

