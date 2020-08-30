Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCB64-0008C8-T9
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 20:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCB63-0008Ao-4c
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 20:21:23 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCB60-00072C-GH
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 20:21:22 -0400
Received: by mail-pg1-x52b.google.com with SMTP id i10so2307105pgk.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 17:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A6BgnbRA18vSipqCY1DV5sZr4jMt6bV5kGzEujduOq8=;
 b=bxMEdMctn9mOWkPtwwHykgdKtqQzVTeYO7i2UEeTxKWxXNESugkuLgLPECacOUnZjk
 DtbriCr2YDjICfmeBn3tAca6TNWQ1OGx0NFN6V7nDai26TVHM21u5jTmoYw6hRlp0FG7
 YK8uHDGwPyFkFSveVWcak3hmSOQZCVuHJshpd/uTk2u5uvPom+4D28luc6TO2l3XSoWo
 cdfjwqxhKqDWDBp2zUv/quOQ4Sy1rG8AeS/a2jL86Zkili2zIeAc53LyUHIrPe5rWyX0
 8pwUZlUdKdDhwWzXtOYRQoY/Qq8j2KfzX1l4sTKxUTQGGmoLcn8F1P2EJh/rrZB8lh0W
 5QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6BgnbRA18vSipqCY1DV5sZr4jMt6bV5kGzEujduOq8=;
 b=MmulPROt+d2xZbpUxmg9RSqVEaxMRdu0xTIQJmn12wrKm3gJZkrfGpbIAlFriYXhI0
 +7zmB2j1+JRVi78gaCt8CLpg9fFHw1Zdff8pwior/LFQyJTUdA+sBw1ckU6rYisy+E1F
 T7SkaJ8RFi7EVSuuGFSZ7QXerjgu7zQUj3sBi2XpApTqMbxq/ZPq6bA1nwPR0GGR7au4
 Jkaqya0rBIQZFPe0Edlsqq6fsXr82iEGsnvsqZ6DX8ANba0BRpsprxC/KhP/QZBjlkBr
 BllVyvR3bxXOLYKiuR9d+kSavUHo1UNevIFJHVGh7aRDi8nA7P/KSBhenUyUlrRNo0g1
 ZSeQ==
X-Gm-Message-State: AOAM532Cpk4JWKf0eG4dQzUjVOVo0LN8ALWiUlLmWf9UaLtbP306qrzK
 FYOxqzytJhaLIXIZYrsH+kpFEg==
X-Google-Smtp-Source: ABdhPJwqgecP7V83yziwpHMydnflL+GkoWkJdb9poz5w8uTZWWPPwgd4rjFi1ChBc73N3tIXWXi4vw==
X-Received: by 2002:a63:2bd1:: with SMTP id r200mr3819095pgr.20.1598746878847; 
 Sat, 29 Aug 2020 17:21:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s8sm3817897pfc.167.2020.08.29.17.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 17:21:18 -0700 (PDT)
Subject: Re: [RFC v4 66/70] target/riscv: rvv-1.0: narrowing
 floating-point/integer type-convert
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-67-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2de75c0-67ab-3079-4ef9-459c2e0a04ab@linaro.org>
Date: Sat, 29 Aug 2020 17:21:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-67-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Sun, 30 Aug 2020 00:21:23 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> +DEF_HELPER_5(vfncvt_rod_f_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rod_f_f_w_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_xu_f_w_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_xu_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_xu_f_w_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_x_f_w_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_x_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_x_f_w_w, void, ptr, ptr, ptr, env, i32)

These helpers are redundant with the ones that don't specify rounding mode,
because you already handled that in the translator.


r~

