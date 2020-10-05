Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPHYF-0003kk-CT
	for mharc-qemu-riscv@gnu.org; Sun, 04 Oct 2020 23:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPHYB-0003kA-Nq
 for qemu-riscv@nongnu.org; Sun, 04 Oct 2020 23:52:36 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPHY8-0005cZ-K6
 for qemu-riscv@nongnu.org; Sun, 04 Oct 2020 23:52:34 -0400
Received: by mail-ot1-x32b.google.com with SMTP id m12so7364348otr.0
 for <qemu-riscv@nongnu.org>; Sun, 04 Oct 2020 20:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RdwZautFo4IZE9/3fCv6rlFTphFGHq0Ixj0Ce6aKnwM=;
 b=nRqcJmWgiqVMpqTuFxIErUv5bCDCFlBq7r6Lu9joPKRLdushKb2zvjV0j3b6nNnwwl
 lU2lbFHFpItSbDlSADA2ft/5q9jR2AjNbWtpVELo7SdAe10bHVzRF0NW9/jEMRP4qTzk
 jv9NjGNyUaYMhKKW7LyxCutSmWtLlBTD8furlNrSWYtztsMDVgaNWqNan3kyB8SYKvPt
 dKmFQY6UL+6QdvJfDnt94rtqkfoGNhFGhD8cgo9Hl310QxuTulL1ciSVcmM+EqG1kgTq
 8cMNnrk0YF7mybMjet+bWS3NN+OThgXXa2SQ/+1VUi1rCOqwjLl8PuCa/2Jnd6l60+wI
 /rVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RdwZautFo4IZE9/3fCv6rlFTphFGHq0Ixj0Ce6aKnwM=;
 b=H30POe8GB2r8bbaGOA7bUGeKFksOl346WrZSM1ogIZi32FrFGWsS8Uw7EGb7w89ZZw
 49SdZPafH+WdDLivuk+t/2mfIrzcGt9j+YD4BENCjpz0q2DAemcPboxYmbI4KkGmD2LA
 Ko0LBfazcmVzLI6Nwfs6LvD4gSO7dtZOZGx9krX6be91+KGEfXFGFZ7UvQyX5AP7FN6x
 cVJIrUiwLIkY34WlXtSdA2/ZESVHcy0yr9p/ZGwYFihzW4J9wj3sHP6H9FqqSyc0tHgy
 p9fYiZlr+n28uJa9S5L4aCtkgcRUDYlpBslg1IPSX6bCOuiX0pptGAj5SqHEQTwHh2RA
 J2Lg==
X-Gm-Message-State: AOAM5327N9J93KC5pYIakSr7S6Bpe9zHRAytouFB8d90YLyNde5s0M21
 LROEC5MpBY0UbGReeoaVoyH9iA==
X-Google-Smtp-Source: ABdhPJxw0uqHKRFSts93W8W5QBBwuXPYT8+ynTjfJoiYKH9ARPWv8RQGaichGwsnkTjJHppWcpvsQA==
X-Received: by 2002:a9d:6e1:: with SMTP id 88mr9400010otx.279.1601869945761;
 Sun, 04 Oct 2020 20:52:25 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h5sm1675802otb.11.2020.10.04.20.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2020 20:52:25 -0700 (PDT)
Subject: Re: Pointer Masking prototype for RISC-V QEMU
To: Alexey Baturo <baturo.alexey@gmail.com>, qemu-riscv@nongnu.org
Cc: Dave Smith <kupokupokupopo@gmail.com>
References: <CAFukJ-Cra_MELxo6Xr=g2S90UvpNg=m6XLjNWQs1hF4iK3mmYA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4b32e0e-04d5-58fa-3afc-b429b2b3f3dd@linaro.org>
Date: Sun, 4 Oct 2020 22:52:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFukJ-Cra_MELxo6Xr=g2S90UvpNg=m6XLjNWQs1hF4iK3mmYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 05 Oct 2020 03:52:37 -0000

On 10/4/20 12:50 PM, Alexey Baturo wrote:
> Hi folks,
> 
> I've implemented support for RISC-V Pointer Masking proposal developed by J-ext
> workgroup. The initial prototype was for QEMU 4.1 and later I moved it to the
> current vesrsion(5.1).
> Could you please help me to clarify some things:
> - I'd like to commit this functionality to the QEMU(mainline or separate
> branch), do you think it's possible at this stage?
> - Could you please describe the proper process of commiting such new
> functionality to QEMU?

See https://wiki.qemu.org/Contribute/SubmitAPatch

> - What are the requirements for test coverage of this new functionality and
> what test infra should be used to measure it?

It can be tricky for these kind, because often "proper" use of the
functionality is quite a lot of code going into another project, e.g. asan.

But for acceptance of experimental features, a small "smoke test" is
sufficient.  Leastwise, that's all I've written for ARMv8.5-MTE. ;-)

> - If this functionality is deemed to be acceptable for QEMU, how does the
> review process looks like?

Well, hopefully the risc-v maintainers will have a look.  I will often look at
stuff based on TCG maintainership.

> - Also it's possible to implement Memory Tagging extension similarly as ARMv8.5
> has: it would reuse a lot of part from Pointer Masking. I've done initial
> prototype of such extension, does it make sence to try to push such experimetal
> features to qemu? If yes, what are the prerequisites?

Experimental features (i.e. non-ratified isa extensions) are acceptable, but
they need to be off by default, and enabled by a cpu property that begins with
"x-", so that it's clear to users that it's experimental.  So, currently, the
vector extension is enabled via "-cpu max,x-v=on".


r~

