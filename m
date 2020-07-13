Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jv1W6-0004Ce-UR
	for mharc-qemu-riscv@gnu.org; Mon, 13 Jul 2020 12:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jv1W4-0004AL-KD
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2020 12:41:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jv1W3-0005WA-3h
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2020 12:41:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id k5so98891pjg.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2020 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lpX0AbqcBURc8xbBOflNMdSbD0ML95iYY0Txo4Ucl80=;
 b=itnsTCn/TKnST9iqLHQuSwLEF3cPqH5n3/IwoZYh8iayZy3OBm8bGrmFeSd83Qtkku
 OvXQnYwxAivKQByCXxdtP9nYhIrWMg84GpcyetIX0vCoqMwykuRnnM/Qq3hlzWOOnZyN
 fWEutFVHbpR+ZlcLqWqyIFV9u4NgJ5Wnqyy61nC/Z13iJCN0RAV6AG23FcBJYkOcp4El
 zAy/T7bhiR3MdksLDngCrbSkGfmIO5rHP8H2ugMzk+ojtXijA5Ok3kW2uV1lyGGdQiub
 53bkT68z1r/wsbW8s/utms4cqZX0wEALoeyNGv8T1rSYodzeSARV6mPiZspAzqDfWPKm
 Uqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lpX0AbqcBURc8xbBOflNMdSbD0ML95iYY0Txo4Ucl80=;
 b=ih+4mTfGCHTAt1JxAboK8CW8/P7UPC0zqTi8dsYReM0H5NbyM5DjnmGHLEOUTZbIRp
 2AOvMyMcmSgY3iQUaRYHfTVxAXjAZrYJdr8qZaCxpRVNEUlff4PiYb8+5MgB/gkSOFuL
 rETanz53XUhF/p/zjt0bN3MSCEPbnK2Hc+HAmWa/4CHl9uRrQ58IcqohBX4FEtQ0cQwJ
 aNY2o6Sggm3PWJiVlSnR5zGvFo9rNFghj76K/3CNZcTDMpub4/KolvU30ZhqCcCLHonZ
 ZgLWnp7FNHXVaapTzR0DEhC/0pXMu5NZe11lJMNlE1uX5EA/SxL5M6Zp3FJB2nhXVqri
 jpsQ==
X-Gm-Message-State: AOAM531zqbij5zys9J3IsHTSAqWo/Wu4TsaMynYfJeSK4HWUUOaoUqp+
 e03V7xJFPdg/Fl4MVPkl8cbBhQ==
X-Google-Smtp-Source: ABdhPJzFuLCAUDk2cU76pNoK/i9ys9dYseB38v7NiuhTpJ6FbnRtF78kxeErJtP/BiCJhUaqIjo9Zw==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id
 na15mr229899pjb.33.1594658477664; 
 Mon, 13 Jul 2020 09:41:17 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h9sm14807310pfk.155.2020.07.13.09.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 09:41:16 -0700 (PDT)
Subject: Re: [RFC 00/65] target/riscv: support vector extension v0.9
To: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <CAKmqyKPtKtD=G+tXcd2Y-TM2go1TWbETHK2e3vdN-ehHyHU9-w@mail.gmail.com>
 <CAE_xrPhEW_VSRQVkthwu0NmBQYBZ11phLRgSbFqqFc9wZZ38Xg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a5140da-eda6-a40a-c803-5094a0d5abea@linaro.org>
Date: Mon, 13 Jul 2020 09:41:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPhEW_VSRQVkthwu0NmBQYBZ11phLRgSbFqqFc9wZZ38Xg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 13 Jul 2020 16:41:20 -0000

On 7/12/20 7:02 PM, Frank Chang wrote:
> Does decodetree support any feature for multi-version opcodes?
> Or if it can use something like C macros to compile with the opcodes by the vspec
> user assigned? If there's any good way to keep both versions, then I can try to
> rearrange
> my codes to support both vspecs.

There is a way, using { } to indicate where overlap is allowed.  The trans_*
functions checks the ISA version, and return false.  Which causes the next
matching overlapping pattern to be used, etc.  Have a look at some of the ARM
decodetree files.

But since Alisair is happy dropping 0.7.1 support, we should do that.  It will
be cleaner not to have to retain the backward compatibility.


r~

