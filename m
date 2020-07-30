Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k183X-0003lN-Ui
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 08:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k183W-0003jQ-6E
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 08:53:06 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k183U-00018b-47
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 08:53:05 -0400
Received: by mail-pl1-x629.google.com with SMTP id t10so8691700plz.10
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gmKrgMtQHadv1YxK5nuclZtAf0KcbltmnzqFTwLu2hE=;
 b=jCB03aqTzSbwGe4ym8Vk+bmdznuL8S/BoubvTQuuC6Wb4ff+l0i7Ry0YRoOxT056B0
 ABQHZbcYc9yOjmEOTiWp1To9FizaBfhfgBMY/i9omOUDLDsykIwZE8oYUbiJgVIL5nTR
 A7lFlI7vRTgp2MOHHzd1U53p+q4SVYBlMqy7Sr7xb/Xl6sNcFx7Y5rKtYp8JEwz2v4Eu
 O4SJrr07g5AlUr1laTYTJW1hixSj8Te4nhwWZwP9T8LtV+GihNeH8yWaix6k8EEH+VdG
 pWjADy1JmHqykLLvEhlodSb506+QeUvrc6bz9Nd98JM/T4Tu/zFpJtJfjtm6nubvNfju
 eXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gmKrgMtQHadv1YxK5nuclZtAf0KcbltmnzqFTwLu2hE=;
 b=LMH3ZOjkQ0EEYvtg5KeXfyT7v2sGLab8dLCW7t+w9Z3K+FoWOljz44o6GDf6GlYm5/
 hX0Rq2gLGeF4YplrKPC6Cpjasx1XajjUK9/cJ8UI42micleUzE8wJU/KpN4hauVOSv5n
 WGXuMKQmrNAMxYxAyScsv3OWoDzsHG1VP+l9MGNZxGZusLIfO4l9s4pg7lKHiEvGwD5Y
 //Z9nEcE9tZAhNc1MgsfLJW5+ywgBOGEegN7R1KywzWtsRJrU4sno+ArMCX2ym094cce
 exUNXYwu7FFrfrZwJAE1L7PqpwS9yG5JDL1Qf++dbdQJhkdGtLwyfxShfgM/Nrsg/j7M
 7TxQ==
X-Gm-Message-State: AOAM532M7TokQeSUeO+z0+3/IB771N2P/gtzXkhSQUigSXYOFhqP2pci
 xZJiYQHA5YzE62vHuHTdVvwPXA==
X-Google-Smtp-Source: ABdhPJzULxmUI8/tOLxQMawIKduXlo7uo88DMZ0NmetdLSS219+W1JJkfgAyQ1itcYyIx/72DkpG3w==
X-Received: by 2002:a63:d30a:: with SMTP id b10mr33732357pgg.430.1596113581078; 
 Thu, 30 Jul 2020 05:53:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z20sm5138165pjr.43.2020.07.30.05.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 05:53:00 -0700 (PDT)
Subject: Re: [RFC v2 29/76] target/riscv: rvv-0.9: take fractional LMUL into
 vector max elements calculation
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-30-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2cae719-8441-efe6-b6ea-3acf07194f30@linaro.org>
Date: Thu, 30 Jul 2020 05:52:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-30-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 30 Jul 2020 12:53:06 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> -/*
> - * A simplification for VLMAX
> - * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
> - * = (VLEN << LMUL) / (8 << SEW)
> - * = (VLEN << LMUL) >> (SEW + 3)
> - * = VLEN >> (SEW + 3 - LMUL)
> - */
>  static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>  {
>      uint8_t sew, lmul;
> -
>      sew = FIELD_EX64(vtype, VTYPE, VSEW);
> -    lmul = FIELD_EX64(vtype, VTYPE, VLMUL);
> -    return cpu->cfg.vlen >> (sew + 3 - lmul);
> +    lmul = (FIELD_EX64(vtype, VTYPE, VFLMUL) << 2)
> +            | FIELD_EX64(vtype, VTYPE, VLMUL);
> +    float flmul = flmul_table[lmul];
> +    return cpu->cfg.vlen * flmul / (1 << (sew + 3));
>  }

I think if you encode lmul differently, the original formulation can still work.

E.g. LMUL = 1   -> lmul = 0
     LMUL = 2   -> lmul = 1
     LMUL = 1/2 -> lmul = -1

so that, for SEW=8 and LMUL=1/2 we get

  cfg.vlen >> (0 + 3 - (-1))
= cfg.vlen >> (0 + 3 + 1)
= cfg.vlen >> 4

Which neatly avoids the floating-point calculation that I don't like.


r~

