Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfpaT-0002Dw-3n
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 14:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpaR-0002Di-Hc
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:27:19 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpaP-0007zu-Uh
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:27:19 -0500
Received: by mail-pg1-x52f.google.com with SMTP id v21so5143819pgi.2
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 11:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nwjVNvX2DQT1RMWRMJmIfnKwYhrNqOENfnFyrbtHHro=;
 b=x973mK7p1Diy+MEbw5gdP1tmeAdIUQkzpFUsNlmqvvuFbHM6FcXE6uWR1+lgVluwSX
 xbGhhayNr8UP0C+xnVNI16YglvTir5oMmp6pyttyv0xafkc4Yq5ns1kkNbWE3D6Wdt1C
 /D7WN+bcC2RVWJdu/RbM4QIRvWEqYbgsAUMq3SP7gCP5D7ceYUJg1khyDQ5VPdhvmHK7
 uIgz689Kxco0Pu4xBvM7dcyuOL6nl5ubz2F57HayZ2V4FAPvzlaF7YgqMLorBTIq088V
 mJME5dpriLVvVKiWFIaHjKmb0sHJjsuBWoXhKm8/S/vs59dft0WdggvdA6nr8L0vDJ4o
 hv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nwjVNvX2DQT1RMWRMJmIfnKwYhrNqOENfnFyrbtHHro=;
 b=N7Cye0KXb2ift4LFfvYMSj6B5lcYOO9TSVD+1yqT5dibaIKerNEZqaEDqY9Hy4S61l
 5R9ess+gkW5tD2Xkyg/U4oe3xYcnNSh/8s6+74s33Tq/1+VtQML81Je8HeOE6FYmR65w
 kXn5I/HnBe9B5W7iGmVgBHkAYj3aRYHCmUNak/0gsfoKdgHTIRKAYmH2z28EpGPud6qj
 mdnbTWa9tsRDGuIgoG/cH27n7mvNXNG+slMzAVF0T4oCiGta0xKSlD1oKsFGuwVeGTWm
 o7f+HAfzT4dyaaG1oaBJZu3O4FSBybwnbf8rpkv9Ay8kprmwFZaJ1iS76MFQNtnyP4EO
 Yz3A==
X-Gm-Message-State: AOAM530PSAUcc/aFZvrSHyqlDgDN8kvl4CV3UNNy7WoX0Y8s32Wx0xm6
 RJoymlB8ozIUheXj3l23jStMeQ==
X-Google-Smtp-Source: ABdhPJwDirWDOMZoDp5w4gLJ0sCufVnzFDN1VuoHQztRB5SZrhR4qZ0bBvGoNDGC99sRv++D/F7uQw==
X-Received: by 2002:a17:90a:dd46:: with SMTP id
 u6mr6188053pjv.162.1605814036758; 
 Thu, 19 Nov 2020 11:27:16 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t9sm497843pjo.4.2020.11.19.11.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:27:16 -0800 (PST)
Subject: Re: [RFC 03/15] target/riscv: rvb: count bits set
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-4-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <637b3a91-ba90-5d6f-d42e-f6b742da8f18@linaro.org>
Date: Thu, 19 Nov 2020 11:27:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 19:27:19 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  1 +
>  target/riscv/insn32.decode              |  1 +
>  target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
>  target/riscv/translate.c                | 21 +++++++++++++++++++++
>  4 files changed, 35 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

