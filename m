Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCvO3-0001Ps-3j
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 21:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvO0-0001Ph-Na
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvNz-0000jR-Kk
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:14:44 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCvNy-0000dX-SC
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:14:43 -0400
Received: by mail-pg1-x541.google.com with SMTP id b22so20338pgb.6
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 18:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kj10wAiQN54knhz52NrqN83UQ+U53gbi2GtsyNThp0Y=;
 b=AtLXhXyxcZsr3QfREdZN0rqFiDGgBpj2EvZK1JUR6eIcapYl+dBk6xPNB1zYayrJBH
 3xk52gwiaZhJV/kfQHMzUQ0wkxjHzrw0ZfQBKVoZcHXBcxbgCLOIH3FqTSvydgpt9InA
 TQ1VvGChTt9Pnh8m4pgzfHnGkW+krlDaxKm2RLnj/kcyVKnXOGPXemiJv5AiPLrgGZPi
 kIkNJ9dsIGRBgbOat6dzOAFsVKqsz+LaIPYYr5b/vXgN3WVHFDhOJFrsAJ3uMQFWzOw1
 MjFPS0Y8U3f/3YFpFHihoLDM6AXdqcmQTWdzzteAIP2xerhPkLI5YDL4MuTd4W4DuURC
 Kgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kj10wAiQN54knhz52NrqN83UQ+U53gbi2GtsyNThp0Y=;
 b=ctNygtz0QV2em/o2Bf7m22uPovQ/jJUYdAy6Tltbmzr6NkP0T8NjvqQ2CSZjHZrzpO
 Nh0zdia68qet6ryr0GX6ymekypEtM9Iae86zrxKW2G7f6QtnC66EyQv6S56YM9Xho0q4
 L1RETllgF+8GVymLGMu+0bzdnE8sN+iB9gYli9lWes9IsFJu8F7evhoC93ChzE49YR9A
 vo+TbYXY/pR7a+ddsS19qjkvx9ZlBPAbNaG4zW0ELYbEDQ1W8UlHjbntwnkVNyX9vvNp
 upyUi5DY3fyk9oxPrB7gRyFFVdWnLb6MwpCy41qtLle96IqsHEAaYKX1IC4aQ0AFtcWs
 /qXA==
X-Gm-Message-State: ANhLgQ27G123+Q9O/44PeR1F55vRwhWjrs/vCDPQQw7EKu+vg+FaHWDG
 Mb4sYCVnf/HNmgdGnHJbWoIrezNXJTE=
X-Google-Smtp-Source: ADFU+vsDdHZqotyCkdEg1zqRU4GbRJC5oIow62gJK6qYjLxO1Rv9FDs/PX6wVFq1Sa7zgYrv8kc/Mg==
X-Received: by 2002:a62:68c2:: with SMTP id d185mr4594351pfc.16.1584148481235; 
 Fri, 13 Mar 2020 18:14:41 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ci14sm2124730pjb.37.2020.03.13.18.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 18:14:40 -0700 (PDT)
Subject: Re: [PATCH v5 04/60] target/riscv: add vector configure instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13770c17-b7cc-eee0-205d-e04544a23312@linaro.org>
Date: Fri, 13 Mar 2020 18:14:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Sat, 14 Mar 2020 01:14:45 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl * a)
> +{
> +    TCGv s1, s2, dst;
> +    s2 = tcg_temp_new();
> +    dst = tcg_temp_new();
> +
> +    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
> +    if (a->rs1 == 0) {
> +        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
> +        s1 = tcg_const_tl(RV_VLEN_MAX);
> +    } else {
> +        s1 = tcg_temp_new();
> +        gen_get_gpr(s1, a->rs1);
> +    }
> +    gen_get_gpr(s2, a->rs2);
> +    gen_helper_vsetvl(dst, cpu_env, s1, s2);
> +    gen_set_gpr(a->rd, dst);
> +    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> +    exit_tb(ctx);

You can use lookup_and_goto_ptr here.  But either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


