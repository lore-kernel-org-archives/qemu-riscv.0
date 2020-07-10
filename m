Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtvsM-0003o4-Dr
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 12:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtvsK-0003k6-Lw
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 12:27:48 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtvsI-0006wt-FV
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 12:27:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id k5so2833785pjg.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 09:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CYS9TLyYkHg1F2blr6tDCqhey8HUKUq7La1KlDpHz8k=;
 b=b4S5gQWEmeRUXSw1LPYVFF2h9xp+Ew4iv9DDRyleCx/HMg8nLCeoQxTzpWbUUoeaZL
 /UOQlihvkVXi/87FNPtY/5EOs/rOLupVdvnFxOKvQ2MI6HwZVSZKQg16s9t2NtbzBo6X
 4NJLALFdMZMawQZC+sPMQwQExEaKTvgaARgi1TMsz0g0fh2Z/aCJz3XCVni/Qhqwxqrg
 kzW1q8QZmkTk/Ofr6O97S8AM4ymzlgaotQrzjn1QjALB23N/GmAyzEcKKqPcxBhGsvA/
 ktoXb8pSkvQdgsufNXK1NF6+xFUzo51veZkzhhi32sXKl9oEE3zQI8RuxvCgzSok9NH+
 vmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CYS9TLyYkHg1F2blr6tDCqhey8HUKUq7La1KlDpHz8k=;
 b=A1piVhBS8y1oBQQfkVo07t9DUrRs4Fe5kNliJXvZ6b87nrG+wVTESoLrh8hy4mR8W4
 tA001CfnDLfVKS+uFJH48vaSw0KEyQ7iEAEBG90zywHvTElJoXGhXEV1srCt/weErDRe
 Xz8MezOlu3Ne38Sawh/qbTRDhQbWkMUclLB83j24yFCuk/R54qkPpdxRfs5999rx3a4N
 dLmfA/QXXsH7il/i5eZ2hYQX8K8YiHjOzeIhSOZb4oLvjTEDWl5zcY2hzg6P20L/JkHj
 G0f0zJSfU8jGNGGGecj0HaLMREf90VMTGhRDGNBg0xdyxiEDL7EX7p7eGPH/2LaUq4JT
 hD8g==
X-Gm-Message-State: AOAM532Djghlm46FHBnoSLyVx8e+Bg0eNNoef0qFtML02sLLh6W92Zoq
 va5kDTSNmee5RJSEANVxUyfNpw==
X-Google-Smtp-Source: ABdhPJzN+X7DCHttvgPvNeovPz1niVw7u+tNAOzvoA0AxISFI/W9plhWXjdfiLed4lZs1PdL+YFXyg==
X-Received: by 2002:a17:902:326:: with SMTP id
 35mr60162464pld.301.1594398464793; 
 Fri, 10 Jul 2020 09:27:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 129sm6648788pfv.161.2020.07.10.09.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 09:27:43 -0700 (PDT)
Subject: Re: [RFC 05/65] target/riscv: remove vsll.vi, vsrl.vi, vsra.vi insns
 from using gvec
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-6-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <452e8bc7-4622-77c2-ec81-9aa6f25705fc@linaro.org>
Date: Fri, 10 Jul 2020 09:27:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-6-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jul 2020 16:27:49 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> vsll.vi, vsrl.vi, vsra.vi cannot use shli gvec as it requires the
> shift immediate value to be within the range: [0.. SEW bits].
> Otherwise, it will hit the assertion:
> tcg_debug_assert(shift >= 0 && shift < (8 << vece));
> 
> However, RVV spec does not have such constraint, therefore we have to
> use helper functions instead.

Why do you say that?  It does have such a constraint:

# Only the low lg2(SEW) bits are read to obtain the shift amount from a
register value.

While that only talks about the register value, I sincerely doubt that the same
truncation does not actually apply to immediates.

And if the entire immediate value does apply, the manual should certainly
specify what should happen in that case.  And at present it doesn't.

It seems to me the bug is the bare use of GEN_OPIVI_GVEC_TRANS and thence
do_opivi_gvec.  The ZX parameter should be extended to more than just "zero vs
sign-extend", it should have an option for truncating the immediate to s->sew.


r~

