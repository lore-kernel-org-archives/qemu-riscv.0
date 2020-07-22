Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyKuk-0004VD-7o
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 16:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyKui-0004Uh-Aj
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 16:00:28 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyKug-0001hZ-KM
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 16:00:27 -0400
Received: by mail-pg1-x530.google.com with SMTP id t6so1878863pgq.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 13:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5yY29WyUtcGMg3JYJpZWK5m4IoAUzfnBRUjC+PL25w4=;
 b=OsJF43BpX6CJtaQ59W5l7TqJMMYOB02EXB1rcNNQyPrkGWHpzN/y8Bc86uz65TO4uJ
 eAXcNVGC/C1AijGSlud7/4I2YE1K3Yp6LERTlZK8Rx6jv6C0/0xOhjcdtaDTadIienF7
 AEXTeeLnmVHxyZQr7p66XqfZ1eA1skt8KVFau7kiMT8Hh97C5G7lvtNd1u92kofqbB/l
 mWk0NESHpVOU8LPCk4x0hrzHtYo5rmEzQX3h3FuD9Yg4HD4mERoErcO4TLY3nulAOgMy
 ELW9cOb4Ok7xLG23Q6X3U7+iYDRHLEPlm7Zkwe38riUldVXB+h2HjdlMtWHB8cVhjOp3
 MGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5yY29WyUtcGMg3JYJpZWK5m4IoAUzfnBRUjC+PL25w4=;
 b=ORM4JCgm3QxYfwYYb5ZcQN0eX5R8OnVTkft9L4m16HYvwFEn4AdjvSp+Qm1R2H/6AK
 kEiFj8pm98eGeGy1x16n5ttB4hgo2x9jAaHw/0NkIv5sjNH2ZZazYhQ8cXQwOCGUXF17
 dCLzw4rt/s/ush44w397k3ltIbHtmTSlMQuWQ0yX0jIjtfKFd1mED+6soN8nykuTOayP
 /9H6poXV0jSIpQ9NHt5mTXD7BySYrqzmxn68CbGLjR9NN1zP577julpA65BDHlY239mS
 oU4tYJbAD4WMuRcp32RW/IEl3P/inhDdkmeDBDIxlQoSCH50/AoPkXFmfp5zv1j+dYW+
 O9Dg==
X-Gm-Message-State: AOAM530jCsOF/H/JFBG4zlvELFdiIbKtzYblWZsRuA6miRdvxftVsVZR
 1MDa9VpKj0WQu3hSQrfTp0tm+g==
X-Google-Smtp-Source: ABdhPJz/jpxoDW5biKBULRnhl/SVGUvJyfblsaFRwa7tLJS0Uw2k7atU78iLwZusSnfGkhSu+V2K1Q==
X-Received: by 2002:aa7:9708:: with SMTP id a8mr1117991pfg.234.1595448024880; 
 Wed, 22 Jul 2020 13:00:24 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 p5sm383662pgi.83.2020.07.22.13.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 13:00:24 -0700 (PDT)
Subject: Re: [RFC v2 21/76] target/riscv: rvv-0.9: configure instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-22-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a1f78bf-a844-06df-e76d-56a113464727@linaro.org>
Date: Wed, 22 Jul 2020 13:00:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-22-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 22 Jul 2020 20:00:28 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> +    float vflmul = flmul_table[lmul];
> +
> +    if ((sew > cpu->cfg.elen)
> +        || vill
> +        || vflmul < ((float)sew / cpu->cfg.elen)

Hmm.  I suppose this is fairly compact.

Expanding this to integer code would take something like

    if (vflmul & 4) {
        /* Fractional LMUL. */
        if (vflmul == 4 ||
            cpu->cfg.elen >> (8 - vflmul) < sew) {
            vill = 1;
        }
    }


r~

