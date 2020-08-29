Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCAff-0006FC-Ik
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 19:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAfe-0006Ev-CA
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 19:54:06 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAfc-00040Y-RL
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 19:54:06 -0400
Received: by mail-pj1-x1034.google.com with SMTP id ds1so1243553pjb.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 16:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CiaxJxS+dj7qTHULHZ7R5ZEWiK+hnbrSJ8DBCb3h2Sc=;
 b=Uq83snBIU0b9XfMFeFIaeepfLJspCbRP8LovD3vmjRQPgnTMdXXFcWLsnsrqHbY7hM
 1IFUsCUKrgqZnIGQdcW07ATMkUIo3UFKOpeqG5j4shB3O+njBnPgzWC6h7uokL/WJcur
 YZ64yCmX1bYiMmL43Yt//UvVpb9V2Y1OLhTuQQyDjIOUJk6v/0hm6+V2zGtHO+vnIqhg
 ak67ON/TRp30VLzj/NGdP/9CKGV7UVNpFL4wKiJvIZu1SfDO4JCXBFsfjGzzn5tNpA6L
 cnAsBkIFI+UD0MZVyqu8oqZZw1mLomVd5i1F942nBgBykQX6uhZNPzjavoy/Fd/l6glo
 MDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CiaxJxS+dj7qTHULHZ7R5ZEWiK+hnbrSJ8DBCb3h2Sc=;
 b=N0cwLK+A9WGP0+XbGjxiZbIKCku5X77dHgIA+8NJhe9/8DGaoB/opc28eQ3QOOccCz
 RrllGzXPLGJUZs6n6STAmxHBtTMSlHDtSl5uV06Yd1+iJQ9JXXZZrErrKRDMa1oY1SMd
 PXVy16LWeWP174gS6xnPUT8W+0ZFmC70+F8mJGwDIR7eEzyeHSDTifU56kvDLJqehwYT
 6BWJh7orqmdsp8XuXGaiLVadB9DW8iHJWd3ZvuQduqwkOud66c3MgyIP0e9BgcZFMsim
 M1pitbQTZpBg9ZBMxPmY/ibx+PN7MqlVk9v2D4izCmhVNVOyWqynXMFvVf9aXauKj7KM
 EqEw==
X-Gm-Message-State: AOAM5337OpHXkZitRY2AoK9Q6TjN8BPGtQ3BGr9uGJ6sX30DNLh/g6AJ
 EhplRuUzK9+Mj4RUKXMgiw/2ULJdERSutQ==
X-Google-Smtp-Source: ABdhPJwu1gZk8msUfEw6e9D1KaiPBqye2phLoyl9frAi+y7uFy3BHfXVVONQwXDeTrHV8aQQ90ykGw==
X-Received: by 2002:a17:902:9349:: with SMTP id
 g9mr4065539plp.313.1598745243452; 
 Sat, 29 Aug 2020 16:54:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u22sm3298147pgi.85.2020.08.29.16.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 16:54:02 -0700 (PDT)
Subject: Re: [RFC v4 57/70] target/riscv: rvv-1.0: single-width scaling shift
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-58-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09e3e0ca-f83e-9ee0-4700-19c17491ffc2@linaro.org>
Date: Sat, 29 Aug 2020 16:54:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-58-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 23:54:06 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> log(SEW) truncate vssra.vi immediate value.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

