Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k18aK-00044j-3R
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 09:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18aI-000424-G9
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:26:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18aG-0006RC-0V
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:26:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id e4so966195pjd.0
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 06:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tBsjl6/gQnF1iVF+wRYhQbaM0PKMnO5JfqHNvXOGtYQ=;
 b=z4wltwzg7csOYWXYzHi9YOjka1/s+nI/Cgws5xTuDdYh9c0PZGG2JJ62aCTLSfC+wv
 hrl7VzKkiNGh6/NNL6bhDa1rGPV2kDkB5Agfdz0unKdhsZ/xQcgi9j5+xIeig/xfVwVf
 V913SD6TRRw/KOOTLS6RnCTDsO4cLZtN5OGsEpXRD+D7zTjMu4pw5CD9/rcihdLKmJ2X
 JDaFws8vsyGPl4wVDa3EDWIs6osP7T+PqjiULhG3ZGhT6t6vYim1xplXNrbmrhMkdrHf
 5OQgGUoFqMO4mqiR4J8iibIDgTbWbHZB+4UDCVVgp0DCOq9WB6y7JcqdJrUZtTEXZg1D
 Oj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tBsjl6/gQnF1iVF+wRYhQbaM0PKMnO5JfqHNvXOGtYQ=;
 b=jYBZ+00oZcFVCzEdZulEoKBRjKuEZFBdk5RJ3RC5ipaei0nIX0R9ZtPnuTD2rVqHQp
 DvcUM9fwyVDobgSL5iblAwZiIshTWDNnAF6OKWyIJ+SjI+zeSIkqrahwpRGrl7dZK67q
 +hrJA6A7qv/tQW0170rbd2rP4GUNa9iZog6Q6R0reZksVwB/nuxc+OGDRc1bpaveEQAo
 q5m4OYQZpinamNaRivqEsEiYbIUVH+Q9bjQUP3wL+/xESWtKccHFXrAPKz82Px2aFJQw
 /rT3+e6EGFUUo+Br3MAz0jdvXzenrgX+yXvWVDFQUppJzoPZ30zNeAAVKWwMmRFmK80j
 aPhw==
X-Gm-Message-State: AOAM5312Wcc08oEdELsoe8gFYCcZ2zKOSblgwcjdH4x14v8tpEZ/Y3GR
 gR5Ch8x6yUS2WlJXKIFIf1B4XQ==
X-Google-Smtp-Source: ABdhPJzM56fae09YHhVKFyhW9Nwnap9/BH7aTprAyfhfbM7jPGMtp/EC8G7/Nphwb2xEWGk/rX83CQ==
X-Received: by 2002:a17:902:50d:: with SMTP id
 13mr4517722plf.311.1596115614198; 
 Thu, 30 Jul 2020 06:26:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y18sm6138485pff.10.2020.07.30.06.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:26:53 -0700 (PDT)
Subject: Re: [RFC v2 34/76] target/riscv: rvv-0.9: set-X-first mask bit
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-35-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01f30ac7-30fa-701d-c824-2395d317f5e6@linaro.org>
Date: Thu, 30 Jul 2020 06:26:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-35-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Thu, 30 Jul 2020 13:26:58 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              | 6 +++---
>  target/riscv/insn_trans/trans_rvv.inc.c | 5 ++++-
>  target/riscv/vector_helper.c            | 4 ----
>  3 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

