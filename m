Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTZTG-0006OV-8u
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 19:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZTF-0006NZ-DZ
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:49:13 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZTE-0007lH-1Q
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:49:13 -0400
Received: by mail-pj1-x1043.google.com with SMTP id gv6so2338186pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2020 16:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4lQ6WBBIyDAhkbiuynrgQyIpW3MC2noTeG/qZKigPys=;
 b=SmvA2ixJGq273NoqDfss6GKr6yTuR4/EDiMucacjlTGScEwjgpG2HbnOrtZlwGSaC5
 SnbTWQ2iemR3v/u4rYGtbc6JE1LuTwh+DaCRjgu90TsAffuSDvEEkcvXec5UWc+JyoRT
 G8bTRzzlgyvbzBpqBd8zpyBvu4q69MuBqSu5X9HhG9KidobS7JQegNHxMgNiUDNv4D4l
 tCqFkLcrOWI8C80CBUNQMnD/3wc50UTjgRBCfqoA+AP+qAys5lVd93TNKBF9+CTi55VR
 nr0NqYjOorSHOqtABc5bpeJSQhPqH3HnKd/V7aVHTj41ulJ5292TVf9Rdg0/X6blGNec
 gnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4lQ6WBBIyDAhkbiuynrgQyIpW3MC2noTeG/qZKigPys=;
 b=RppW2cmJ7dvFR0wGCDkpNPNhpodyAxZVdr3i5z/nxxSZpuofeMUJmGL21TNnQncY7D
 ofRz8t7qv9wI8MF0JB5kAXs+ErXqF7SjqDCH4dY6E5yJO4s2LI9rLWDLhazYspxM3d8H
 raiHhe85zN9kTUA7FXLV7KgBUCEUAtp8OcYVcP++4mxVUIWV6VaaK3dLuAtGuGF6DKxD
 m8DInzoUP5kQeNi5e7fZNNEx7jPhvmUkkuB9WNIPbH64zw8YdhSjdtDVlx4IOEGapE3B
 YOkLmgpW//Ql4JrOeUJsosMwU3RP38/ZWl69qFoM3snfzt4wRIQJqrwJGe0z3epXFtfp
 JX1w==
X-Gm-Message-State: AOAM531iJMIjUbnSEy938R5C14A6kJmI81osQ+ZkShAIbfqaHj9JrPCH
 p1jxqtqHL+717N0zL3zq0RGwh5i3FYClDA==
X-Google-Smtp-Source: ABdhPJwHfDjHP70yiY/dRUhX4B8FAiHhebq2IXnyi/9qosc+lxrqVJ/UYeEPa8ZDxGrqthr4lwnCgA==
X-Received: by 2002:a17:90a:cb92:: with SMTP id
 a18mr6346915pju.136.1602892150038; 
 Fri, 16 Oct 2020 16:49:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q24sm3666472pgb.12.2020.10.16.16.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 16:49:09 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201016221138.10371-1-space.monkey.delivers@gmail.com>
 <20201016221138.10371-5-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03c43a23-8418-a7af-fca2-2860f5433ee8@linaro.org>
Date: Fri, 16 Oct 2020 16:49:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016221138.10371-5-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 NICE_REPLY_A=-0.253, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 16 Oct 2020 23:49:13 -0000

On 10/16/20 3:11 PM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/insn_trans/trans_rva.c.inc |  3 +++
>  target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
>  target/riscv/translate.c                | 14 ++++++++++++++
>  5 files changed, 23 insertions(+)

This will need changes for RVV, but let's omit that for now, so as not to race
with the in-flight update to rvv-1.0.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


