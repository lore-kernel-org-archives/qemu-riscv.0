Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn1wR-0007wu-9V
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 11:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1wP-0007v8-1A
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 11:03:46 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1wI-0004mC-3I
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 11:03:44 -0500
Received: by mail-ot1-x344.google.com with SMTP id d8so1830530otq.6
 for <qemu-riscv@nongnu.org>; Wed, 09 Dec 2020 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xrrXmL6DhBPWYqcqCoOLGGRbhRQf0Nz0mTDUdbUup/A=;
 b=nqQuDA8A42ndkgiXaJDmbrIeVs6E9xErZ2NSbFehAMAYJth9MK+sKqF76ojxgYsezW
 5kJMJoAqUkSxyIEuQZSa2YpG3cAEVJAc/8zOK1JLc0Jv8Ju0BTCnBr5MEghVjsbTTnsH
 E1n/BOIq4Txkdr0yxME+b4VoPvxW++yQvLS3mjiir6poq9mlzwYmHAt9NnT+89BGKAhZ
 JGd2nKJwsxtwO2QIz5+pTRWxPCHvPTHSbD1m4YQFUPNKeH6jH/lOPDycUzrzapFPmkhj
 G3kggpS0NQ0DIA0hC89maxJtvgWluCQaQ6RWJsh5e/bXnKe/cr5qx68fpgxrqo/G9M04
 UfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xrrXmL6DhBPWYqcqCoOLGGRbhRQf0Nz0mTDUdbUup/A=;
 b=UnVr5ipPgImf3QFECArVOXKViNeW2txShvwBoc7e62b6xSO0NtfkcXJ7XKLhf13hmx
 hchGOmeheAIss9PsvGuuGIYBqUi2vsjblD8RAlHONuOxgKKhPTBB6bgcn4zyVhehRwyR
 ioywefnUl16v19Va8XqW8Go7Y6qPQ3iBCttCMAbuxNDlZxXkopw8VX//08g0mNh6DbJC
 7+us2pOvFhoOCaNOdyk4+ynnnancI0QwHtNOzhlrmVLp6jYrvoLd8xERkONAOeLze6/I
 Vj4rT1CRvuq+MblvPz8xnfL02BcF8uQJkdvcX6qY38avHLIfMaJr1dKO+EIeacDFVH0P
 zhEw==
X-Gm-Message-State: AOAM532s5QJ5261M5pql53frttyYdu0YBMur0ATGHq2IcHs7H3cwHcA6
 3QN9O6esxt8GEhY+LfSZthTc3A==
X-Google-Smtp-Source: ABdhPJxEVmsHLUWqjftT2I5sV8Lv1ClMnHJ90mVBZXjg4/gwSrxT2xSTjethzN3+pBABzWpBeeGnPA==
X-Received: by 2002:a05:6830:1352:: with SMTP id
 r18mr2269045otq.73.1607529815572; 
 Wed, 09 Dec 2020 08:03:35 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h7sm463602otq.21.2020.12.09.08.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 08:03:34 -0800 (PST)
Subject: Re: [PATCH v2 12/15] target/riscv: cpu: Remove compile time XLEN
 checks
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <eb21fe949282cdc06e07fa7347eb5e4f26b08eb4.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3b79ced8-09ec-19f9-48ed-80183c43c9ac@linaro.org>
Date: Wed, 9 Dec 2020 10:03:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eb21fe949282cdc06e07fa7347eb5e4f26b08eb4.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
X-List-Received-Date: Wed, 09 Dec 2020 16:03:46 -0000

On 12/8/20 4:56 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> ---
>  target/riscv/cpu.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

