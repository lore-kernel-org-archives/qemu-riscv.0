Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfpv3-0004yI-8Z
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 14:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpv1-0004xk-UM
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:48:36 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpur-0007rv-9X
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:48:32 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 62so5167719pgg.12
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 11:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8/vnUitJQixktGOB5OjyggdicXasxT2Wjam4/pgqxs4=;
 b=V4xvjqbfFo3TWuu7XmCy05ahWo48cQGkBkMBVzAK36ES+EuUniq+ybrD/7DxGG6msx
 A40yAiObZf4pwPtsp4s2xczld2j4/2nEIqUq7asMq+ti4fiKoS7NRPR6yaFn7gNA2toV
 dy7Edhrr2GIxC7zgx/tLYdw9CXeEJktwr+kTXYxDcHRASlNoa4eFJDvR95v1vaU3vCPf
 76h3ElKnWtIFTnnCzJHki8orK3big0/DGl9Q8hc4miJ7oQ6NoMNKK16woDyHtPDqn+dE
 0A87Ggn/GY0O0ah9ugyxhll/vleDmxgCw714UIYzLd88PP2qgQ/qIdiwXq1cFkhQTJoz
 Z0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/vnUitJQixktGOB5OjyggdicXasxT2Wjam4/pgqxs4=;
 b=egye1EGRQcuiejUemvpCRoUOyPCFWJUFFr/UvXDkBw9NL9/B2X5klxjW7cAAxHbBcp
 nERRMxT3RBKeqCuqacvt/trWfJfdBvmPjnBJBOg4zsXxn/RgvV798fMHq5GGMTP5nu2B
 64q0Fcsfg2Oaxd92G9/uJr0suD35AzH7LG5BioQaYeL8s+0w4H0K1AHvFNBiI5T+xN4M
 R4ocw4Ucz65w+YF2Iuyx7CPgKaRafUyk0WtP9ZeekDHkoUc8vt91xVRUHVg/RxRUH/Ig
 BzPUaNIaqLD5UP63mkcP6EvH7D4qc0ahtK+kunbJXiX/BpzYsEHCoVggpGOoblsRtasL
 vm9Q==
X-Gm-Message-State: AOAM533wHIFaSo7uIURQoTBX0uj9fjaYAmzP38EzFV74fvvy4w/KSQCs
 2a/yaSQ8WNZ+kOYCT4UTMuZNjQ==
X-Google-Smtp-Source: ABdhPJwDhPbsDGGr07f4wbS62i2wBAca/ni/cPjw1g9Xa3zwx5b/B2DREV7fdSnCPF6nu8WmaReCIA==
X-Received: by 2002:a17:90a:34c5:: with SMTP id
 m5mr6142381pjf.184.1605815302820; 
 Thu, 19 Nov 2020 11:48:22 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k17sm476727pji.50.2020.11.19.11.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:48:22 -0800 (PST)
Subject: Re: [RFC 02/15] target/riscv: rvb: count leading/trailing zeros
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72fcab50-3dfe-e970-9dc4-098b6ab8f675@linaro.org>
Date: Thu, 19 Nov 2020 11:48:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 19 Nov 2020 19:48:36 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +# *** RV64B Standard Extension (in addition to RV32B) ***
> +clzw       011000000000 ..... 001 ..... 0011011 @r2
> +ctzw       011000000001 ..... 001 ..... 0011011 @r2

Oh, one more thing.  In the draft, the top decode bits are split into two
fields: 7+5.  It would be easier to read all of these if you did the same here.


r~

