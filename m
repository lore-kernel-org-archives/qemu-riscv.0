Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1YTQ-0008TQ-H1
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 13:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YTM-0008SZ-NV
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:05:32 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YTJ-0004y1-Oi
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:05:32 -0400
Received: by mail-pl1-x633.google.com with SMTP id o1so17754333plk.1
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AolTBA6M4oIIOZ6Ux3+wZLzORQvKME0Ssg6A7cfe4Ys=;
 b=Gs/ZHg37gAbmnuXfw3jvbLCzWb23JnC2m4uQlSY9wxDUDZ5kLih18Of4PlGP1oUmNc
 q2z3FAOQdX95RgXMYxjdyGWCyoTfKuLZ398bcRqTsnssCuwv6ahh+VFV8HfOIXWnRwgs
 dE62HpV6Xp2wKDY03E4+eFOiwheFx4le8G0RlF1qzaGfuq+//Je02adc8aZ1mppLm0o1
 8QKOCXdQ0FFZNq7Df3BxqbQU9vbiDI6wc9phk4EizRwPBnY2ulRaO1ir/xNbkoYjFpOR
 MWmgiV5yEVG8xVAbx2cwJMaqY1YNdye+rEfUDuCSFdh46jqTisdcZn9gHfLqJhjB5q8a
 YujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AolTBA6M4oIIOZ6Ux3+wZLzORQvKME0Ssg6A7cfe4Ys=;
 b=L0TWOi12hEJQnTXqPiVQYeREAp3iDc+qpP810i9qy7mWkk8+TsM2jBYHFitdVxPzyH
 zwcrtkeILvSF5ThrEcKqRB1EoycpN/P+13ZX9Elq7ZNvJVEfYkcIfbBbS/ALZvSjO0oS
 Zno9wWqrQFArOVeeFszy0bR4PMhXQDFe0v681dLvDdEQlPe16CN1lckVaP5zmjbEC74l
 aKZM/aD8dF7QH+dQ3AeKRzQGE0yYmcX3lZm+uZl3++fan5uBg/aootovNUUv5w3StN56
 sKs0WDbtoBvTvPfS9UIO7vK2jGnxaLCgbXrQXM6FN5VEwcGEkjS8WhOzG81T+SkShAs3
 bLYg==
X-Gm-Message-State: AOAM5334hdtXgbum+LI1twqZEBg3FBzw+WkhbTWhsTkKzW13N/FvyT9n
 HKpDzv9o1Ogqx/WhTxlaPEqZHQ==
X-Google-Smtp-Source: ABdhPJwXnRinfFTBCgInEJFADjkU7D2pqzL/qhyjdEU6IhrD5NM8ROrjqh5c6Mpm8gRg59tdJ52eYw==
X-Received: by 2002:a17:90b:124c:: with SMTP id
 gx12mr5119002pjb.191.1596215128094; 
 Fri, 31 Jul 2020 10:05:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e125sm5376980pfh.69.2020.07.31.10.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:05:27 -0700 (PDT)
Subject: Re: [RFC v2 67/76] target/riscv: rvv-0.9: remove integer extract
 instruction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-68-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74776653-55a3-6ffb-c765-3a5382c1a6c5@linaro.org>
Date: Fri, 31 Jul 2020 10:05:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-68-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Fri, 31 Jul 2020 17:05:32 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              |  1 -
>  target/riscv/insn_trans/trans_rvv.inc.c | 23 -----------------------
>  2 files changed, 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


