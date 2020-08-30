Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCCu0-0008Nx-Am
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 22:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCCty-0008Ni-Ea
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 22:17:02 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCCtw-00019c-P5
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 22:17:02 -0400
Received: by mail-pg1-x52e.google.com with SMTP id g29so2379822pgl.2
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 19:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RauguQR3pk3b6pQKo4JV/Q6ZSIAXKh1a0agR88oj0NU=;
 b=db1sQQhF0+AVYZ9GBPav24kKwX5hNe5BD0j1QKhswPmBME9bd/RS2sd+AM6tWtrAjc
 Zluh65YY4rBYR2vLy8e6RykzNoexE8SUF+V4nFwiZxnj1tpLI3xsE2RsZoBmDQ6oA5Iq
 zFshXzTLPs19ETXsWxXtjeRem5KSYW1k2oElJCpCmPV6ISSNthPISsdKnMgF9nyyCtWT
 Edoz+59bfbzll2gPw6K1QDljwXkjTdyGr66cU6LD1txOtM2QwdUaw7w08r1XDQs8xNXX
 pj2McM43qLGWb63BQgZt9hybWH/4eLbdfr4HNsUNldaoesUWsdqZ59ibF/5oH0QSVYi9
 1d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RauguQR3pk3b6pQKo4JV/Q6ZSIAXKh1a0agR88oj0NU=;
 b=slxAxTFwkCq/rGnhkpsYIdyEL6n9uFMQHc4LMgbhRrPLH8i4b50bDYmJcyEfjvO3mC
 Y6X3uqOHXJNpPtFvuvS6oHAlLHcfvpmQOeP8CwXpjVZG64fWd0eBXgYzURswBiiy1LCI
 yyi9XROsT8rl+yZfn3UIwqADVjnFPZdgKCkRPNl62HSEDNxyDJDd7xdC6Qp7zDG9n4Le
 sjL8DTcdzQ4+w9Oz7M8jEIl65mVyswaZmYkPWA47xvDL4jKB0vzN+I3NQyAeBNF4gfna
 DZba681g229wOhIJpoUQMqPw9Kz6f6ZxnoDHZEbyb0AQZO5TjBVOpkoWj7OthtSd+7fi
 SMEg==
X-Gm-Message-State: AOAM5333h8zmm7grGHWVkWtSxyKJtAWwPDVJKt4LKiQ/x465Tf8EYr+3
 XhYNfRKBZUmOq7GGWfSSmtUi0A==
X-Google-Smtp-Source: ABdhPJw8DgIUUnwqllXbeSiW3qPbK9BNwiKFdmW+VkZ+IObb+w1TTCAAtNK1rD1edc24AUTjtdxnJA==
X-Received: by 2002:a62:5a87:: with SMTP id o129mr4683942pfb.204.1598753818958; 
 Sat, 29 Aug 2020 19:16:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i17sm3843308pfo.150.2020.08.29.19.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 19:16:58 -0700 (PDT)
Subject: Re: [RFC v4 68/70] target/riscv: gdb: modify gdb csr xml file to
 align with csr register map
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hsiangkai Wang <kai.wang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-69-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb75a628-b94e-8c17-0bb0-55085bb96c04@linaro.org>
Date: Sat, 29 Aug 2020 19:16:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-69-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Sun, 30 Aug 2020 02:17:02 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Hsiangkai Wang <kai.wang@sifive.com>
> 
> Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  gdb-xml/riscv-32bit-csr.xml | 11 ++++++-----
>  gdb-xml/riscv-64bit-csr.xml | 11 ++++++-----
>  target/riscv/gdbstub.c      |  4 ++--
>  3 files changed, 14 insertions(+), 12 deletions(-)

Looks ok, from a quick glance.

I do think that this could stand to be auto-generated as well, from an extended
csr_ops table.  Extended in that you'd want to include the name and the isa bit
to which the register applies.

I'll let Alistair weigh in on this.  But either way,
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

