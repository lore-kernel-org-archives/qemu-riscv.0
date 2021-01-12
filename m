Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzCVQ-0006ll-IJ
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 00:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCVM-0006i2-OC
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 00:46:10 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCVK-0004iT-JU
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 00:46:08 -0500
Received: by mail-pl1-x629.google.com with SMTP id 4so811856plk.5
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 21:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=31aCCMq/6UX0Xjhzn8YfdseIxvpvpxE4hQo5xRujZmw=;
 b=Jpz/nXmK4O4/W5EBBKdiKp71ncLQMdbSAiO3gjiGjQhNAKsuKzAJE0kkuTrrHl5YC5
 iiURJvt2zwE3QdQGzB/L8Q57lpOztaS2e/GKR1PgNnIzbRWsk+qmrGfDxFC5idfnoV42
 eBNp/6r7hvYrGAl9FfqMMUUsB0hT/RVUWx9CMuTOvgyKNBrkDy69qGA1pqeKRyMeJDEc
 NJbiy/xe+OmA5Jkkmu8sFyQL7URaN3aOw4K/BjV3uNTNqygR1HTzRhB0pnjHAycK4qZT
 b2pq/y6B3Zwfxuc1eKlko3pRuslQD7XVfQ2UyLr8Gi/7/Lr5/8jKudQt4qfrbPdeOdTT
 Cdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=31aCCMq/6UX0Xjhzn8YfdseIxvpvpxE4hQo5xRujZmw=;
 b=Ra0dNLeHVA2cnNdlyTENVFJvZK07Hgr5CNSxdNgujTScUPskje/8QTho90VlIkjGJp
 FIS+Pc1ggMcM8Dca/URPK8DO9KzpVpK9CUDWgR2Cf2IOEuDbGItweHk9WvPYJawiFpaz
 oYXbzAZ/DWBQufzAAr1NQnzHc76Sw73+grjdiu210WCwpHrC95aAJh1kTJl7nm3Q/p8l
 B9Z/KVogVhN6pGQyR6cKhSvnqOP3Jj5gsoFfcWKBwjb2e9WRC57TxEhv4/qlSEW0SPLE
 r70whn+jcLid8NfhoK5ufx1jlu+6F2ImBaevmMseKkvrogF5XVyoNKVg/TI8Dqsw6Euu
 m+lg==
X-Gm-Message-State: AOAM533NPAVbCiArxjNBdAkKcl3OhIqiIbUC1pmyYhm1DLiupEjYOqeP
 t6x/ISIGjPZfmJXycixG3jfbjw==
X-Google-Smtp-Source: ABdhPJxoUKdtFDOFd57EyUA8cAKK+N0tBczMBbNln1+WnL9ms23Sk2LBZkXfVnDsfwdT7+9wFtp+0Q==
X-Received: by 2002:a17:902:7289:b029:dc:38b7:c57e with SMTP id
 d9-20020a1709027289b02900dc38b7c57emr3124727pll.72.1610430365147; 
 Mon, 11 Jan 2021 21:46:05 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm1435030pfb.196.2021.01.11.21.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 21:46:04 -0800 (PST)
Subject: Re: [RFC v3 04/16] target/riscv: rvb: logic-with-negate
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-5-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9e39e7a-e0b9-9ec4-a2ad-5d0f34b32e28@linaro.org>
Date: Mon, 11 Jan 2021 19:46:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-5-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 05:46:10 -0000

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

