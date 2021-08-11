Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDsT6-000086-4z
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 13:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDsT4-00007o-UU
 for qemu-riscv@nongnu.org; Wed, 11 Aug 2021 13:56:42 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDsT3-0001Gw-7M
 for qemu-riscv@nongnu.org; Wed, 11 Aug 2021 13:56:42 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so6326084pjl.4
 for <qemu-riscv@nongnu.org>; Wed, 11 Aug 2021 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sd275UudlJh/yTNdYqfp4jI6iZzjUwOym27lPZaPAnM=;
 b=RnaT7E9b4MOyMqD1gyR31fcWV57wd3SpsjAS3HCxrGgck1aw/cLlInKHlXeQVvp78K
 lBgBScZ1od9ePeu3fzKopB7i3i/Nvv64dhPSfvyzFEyhwQLXlZFgr7IPQvBqe+DNmi3F
 qGMhC+yHC7SbFvR/SUB8Q4nJrRSh1M0AoH4UNt+4NGjsqTvjpDIyypoQXAr7LxXU0X2O
 JRJuElEYLsERlyNOA55m5CkrcCPgvDITwAHKONmce/oJ12qCQsZtR/dMSCJ97u28WOW6
 LValr6JjW5jLHZB5OCW425ApqMA2EIesKvFzm9ZkkhN1cMz69XtMblAAmkGdEWzjBtcL
 UcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sd275UudlJh/yTNdYqfp4jI6iZzjUwOym27lPZaPAnM=;
 b=e7f1j9PW5suGwelBsj04+ZTut9NThfiyt+sns5FC1tARn1Er6F8eQXresygpiKRmca
 0PIcMKVf9e2b8XpB9r2Z+9orJnH7Qy04fU7dDmEET99yKWruqdOEz2Rf0pufNA+rQq8w
 bTqTlbFmLn/2mnw6G47mZXHBuBktbwMhLyhUKtVDDoCuuHPprATshof191ZVjvCe2ekj
 1Q3pKtfmtukDCK0pkOwHp2NLXU40a7bML07S88JHqbtkl9tDVSJy2JQZj++LVvEstqEX
 nMt8pWksLQAJ3xr7KpoEzsuXNCoAQolHOVTOJrK9x5l3ruVoZl5ORiOXvSRFibtkM3dc
 pagg==
X-Gm-Message-State: AOAM531TRNgTbEZZzIVXay04K1Z3wuz4xpn9NaFVno1mp8Y3jCOolosb
 /cAeDwCFmyt+FoYqmKwdk2qYdg==
X-Google-Smtp-Source: ABdhPJzR/jK9eMyLJfNPKgdCmEFrJ8Tn4QDFbVMMUoo5ax94YCGDOTRlTJy4E0BjMQI/Q0IG6rItqg==
X-Received: by 2002:a17:90b:a12:: with SMTP id
 gg18mr11456387pjb.78.1628704598961; 
 Wed, 11 Aug 2021 10:56:38 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id t26sm156408pfq.75.2021.08.11.10.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 10:56:37 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
 <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
 <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
Date: Wed, 11 Aug 2021 07:56:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Wed, 11 Aug 2021 17:56:43 -0000

On 8/11/21 4:57 AM, LIU Zhiwei wrote:
> I  still don't know why the value written sign-extended.  If that's the the rule of final 
> specification, I will try to obey it although our Linux will not depend on the high part.

The text that I'm looking at is

https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMFDQC-and-Priv-v1.11/riscv-privileged-20190608.pdf

3.1.6.2 Base ISA Control in mstatus Register

In the fifth paragraph, the requirement for sign-extension is detailed.


r~

