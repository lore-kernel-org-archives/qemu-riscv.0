Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC5ik-00072X-4x
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 14:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5ii-00072L-V1
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:36:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5ig-0004x9-Qn
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:36:56 -0400
Received: by mail-pj1-x102f.google.com with SMTP id ls14so1008753pjb.3
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 11:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rf28wSybrAI0hplIS6QnqC/KFGhUM93cnTBNSrUtaig=;
 b=wDtk+PIOBvwPgfEHB7FeQjuT5NeIc9rQcg5OO8Etzrq55EU3G/2xNzwjSjTpsbpaqZ
 a3JxZgbgFxti4+41tJptlWgRtaRc/FEj8UhoiHKL5Mj1k/ljZFzuiT5G9UU9td/zb9gp
 6DFZnRrlwcUYHgZI02Q8pQ+yTN9EFhfDae04NqjKuUceY/AMQg9H4zBes/9xRHLU7GrW
 cDO678BZtPeAQ3QYZDKO6d+v9cIOSUHJrgyLWUOPhJ8VIMraIsNOi+yhdmkzqXi/IdU7
 6qCZWu1PYQF82JkA8DRh3SQqXRWWyyhRiRLZyMJbkjTy1WVXCO8Z7O/JhPs8/J4Ne8Eq
 7v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rf28wSybrAI0hplIS6QnqC/KFGhUM93cnTBNSrUtaig=;
 b=aCUuUS9nM/my4I2N0uEhhEDR8TdLURMqj9Fv37E2rSxJJnOuDZH2ESnXPJPKdDoLlX
 nZ7SwFbDu07KCrSuDAIn85we8g6lOMEZg/5X5aEOqYUtF3BcxjoasdjpmnY33C2punH1
 PLhHD3r/b2x9E57HbKGJ22brXENu+gKjKsSqZxZ5718QlsfwOJwbgeJ4W8b6oAJGcASL
 bFE7i6NlsztmWOcki5C4uvXHCZpFNs6lIikF2yiX7babbwQztW4B3t6dsi7Bky9ehaj/
 mA/JMbhOug3U+hXCZh5Z1bMckx2krSL/FIzwC1YlOLL1xwFJGR9MwbvHCCYxoQxWk3PI
 9Ydw==
X-Gm-Message-State: AOAM5314Qql4lW5TIB2n9JITwzX58s4dcB8UZUq5jCS6Nb+K83VTJAix
 7KFVwdH3ugZwplyh9Di9le7uc90qjLa4iQ==
X-Google-Smtp-Source: ABdhPJz02AJKofqdDliL4uN3XpV9n5k1Vet0PnDbXL0RG7y3RPtiQ2nCbeVwseVi5UMqEsJKP6nh+g==
X-Received: by 2002:a17:90a:88:: with SMTP id a8mr3931144pja.196.1598726213320; 
 Sat, 29 Aug 2020 11:36:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y126sm3300806pfy.138.2020.08.29.11.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 11:36:52 -0700 (PDT)
Subject: Re: [RFC v4 21/70] target/riscv: rvv-1.0: fault-only-first unit
 stride load
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-22-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <911cd1de-e22c-3637-fc01-dae6e6f0c21f@linaro.org>
Date: Sat, 29 Aug 2020 11:36:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-22-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 18:36:57 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 27 +++---------
>  target/riscv/insn32.decode              | 14 +++----
>  target/riscv/insn_trans/trans_rvv.inc.c | 31 ++++----------
>  target/riscv/vector_helper.c            | 56 +++++++++----------------
>  4 files changed, 38 insertions(+), 90 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

