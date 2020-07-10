Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtxYi-0000CQ-QH
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 14:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtxYg-0000AH-Lc
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 14:15:38 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtxYe-0004Ba-9B
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 14:15:38 -0400
Received: by mail-pg1-x52c.google.com with SMTP id d4so2873524pgk.4
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 11:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=whVeT42wRXTpzJNWOVvJaKOIZq0iTJhITxhcz8Zntv4=;
 b=hZrPguzQZw0bh29Jm8ptcnowu1/BY2+1fpEGKjQ5Wv9UBwyG8Z5nrVMCMWog3ip7an
 mUI8nN8qZKNDK1iFOL3ESQdtsbCBSrD0MV+HphTS2g1W1CsXdTfCjEtuQFPW+P2ohThV
 7xxkuNQ2A7KUo41lnEPI/2UskmsNVlwo1OqlxNWskkpU/U61OAnVaaDnSqf/OPIdGCDi
 9JcYlNulsK1vBYqPjNP0xLk1hvSSn1Gv0Vcpi+TeFD27HXHIAu2NqXJu0IEn1ov0lkJ6
 H0hrgmzqcGjHn4vfR5c2KhHnt8QZU0W3iCnSZ0ehQ15WH3UrYWX0lIKvEeC3cr5RbfRV
 pkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=whVeT42wRXTpzJNWOVvJaKOIZq0iTJhITxhcz8Zntv4=;
 b=WCt4brbEG47eNA0a0ylB3XNTu0wk7wEVSV63aGqK7HWzLcQZKsNEpZJJKGNHwUdp7x
 KCazAcia3OyouXQYay+0D9/3GHCZ4xNcutCxfnvXUzbhyDToN8HqjhQeb/oBeq/ZYI8T
 QFJca9nVhlqwaDOaR4YfvAKs1s6xNlNEr337tQKpBKMhIkP38Ev3VYyNXuLiBrdncqx/
 8KNrpaouAbADQRIJGdMbfthec18ofNGN8i9ymzKy2h6vqmJhyNxH01/2JqWOL4G/C99h
 jdR1GFofm+bzVIuwvo4P+mYCofvI13kuLI3wwWQdQghFNqhmgLusD7PZn9CyabnKdG9B
 RcQg==
X-Gm-Message-State: AOAM5307RcbePR9Z1aZGEgebBU7J17P4iLqkFl5RKC3iFLB4RlRb26oz
 pD5wP3ruleYFlbgWnc1Qt2LCEg==
X-Google-Smtp-Source: ABdhPJx/Ms73ovz36oeiSFtJOm3lwqC1VblrvPXpMTI0QyBvWhMovnVedfr33MPMvTmvx0CAsW4B2Q==
X-Received: by 2002:a63:778c:: with SMTP id
 s134mr57276224pgc.273.1594404933895; 
 Fri, 10 Jul 2020 11:15:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id r204sm6913827pfc.134.2020.07.10.11.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 11:15:32 -0700 (PDT)
Subject: Re: [RFC 14/65] target/riscv: rvv-0.9: stride load and store
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-15-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0dc40d00-a89d-9818-9fd3-2bce4141eca7@linaro.org>
Date: Fri, 10 Jul 2020 11:15:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-15-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 18:15:39 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
>  # *** Vector loads and stores are encoded within LOADFP/STORE-FP ***
> -vlb_v      ... 100 . 00000 ..... 000 ..... 0000111 @r2_nfvm
> -vlh_v      ... 100 . 00000 ..... 101 ..... 0000111 @r2_nfvm
> -vlw_v      ... 100 . 00000 ..... 110 ..... 0000111 @r2_nfvm

Again, something you can't do until 0.7.1 is not supported.

If you don't want to simultaneously support 0.7.1 and 0.9/1.0, then you should
simply remove 0.7.1 in the first patch, so that there's no confusion.

Is the rest of it mostly renaming?  You should definitely expand on what you're
doing within each patch description.  A description of what has changed in the
spec since 0.7.1 will help the reviewer validate that you've gotten all of the
corner cases.

I am going to stop reviewing this patch series now, as I expect that most of
the remaining patches will have similar comments.


r~

