Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbU1s-0005S9-Ou
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 16:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbU1r-0005Po-7y
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 16:42:11 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbU1o-0000kT-Px
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 16:42:10 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so10163865pjc.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r18EO4fPyyz0pUIc5NBJ/o1T00Oaz14Tl981lU+wcbk=;
 b=vRwo2SiDZf6abCrWLkuNag7/5VATqoZEx3xns+FpSWrTaF4Y22Jt2fK3U/i91jd/bB
 Bx88733cbfouJNjcshncfhLjubUD8BPr1h3QkcfOBiTNgxYcVfY4kLV1XEZyNhIpXM5u
 jVdICSGFR+2GdBCmS4dLEpb0Kc48xCN+VdJ9mnBQ4t8XrJWEG9JJ52h2T3YI5Imnm52Y
 /uiBW+s38CYbkk2Z49lBw1D/bePA4bk/kzAP/BBQtxESRTI7HK6lhZu8OmbyxqIF7xNt
 e70UNiS/UebApNSOBSFWsz1O/oCC38I1BdvYRJpemsPB3t9XCTwFXilYXi1CycAVXsUm
 Q6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r18EO4fPyyz0pUIc5NBJ/o1T00Oaz14Tl981lU+wcbk=;
 b=fwtg3fpa09b6kwzpcvi9ssYXn2yEC1bYz6nvMmvhKv9xvf5fXMSheyrW9IuaKAAj6G
 Rwu8AerziqRMRKkh3rGpnDrNpllifw3xFzZKYdEl3TNCgFdKRGmn2DlllsSY2nDosCuU
 sQwcX7zEml9fmL4tcy2MTHDwUHOZr+1NrP4VO4Efelg4NdO9yZ3XX2hi66WCnYngIXoO
 MMssZ+H7LyA7Un6jqkHkhtRQq0xcmTIdyKFM17Ssi00ZWbOCEPGopXbo43r1AlusD3LD
 temYPOY7DuGey6T10AdpvEBC4ovLLYyY+v0iaS7B3FYjZ/0+NC1uMIzIUQ9zNXjFQIg0
 d0vw==
X-Gm-Message-State: AOAM532lzmzu3w6JCeLLFjrCxHsursGt5o6P0ntZaruc6wYXxTGZsXU7
 kWhJ4xOlMm7KNnpJHFy46OrPKA==
X-Google-Smtp-Source: ABdhPJyOBB3x8wSo71poIXdRpN3PAjK3Zw9G5DRDHp8j/T71GhwxgTgslk6WKZYtcl2h7rTRFREbGQ==
X-Received: by 2002:a17:902:e80c:b0:13f:1140:8ab2 with SMTP id
 u12-20020a170902e80c00b0013f11408ab2mr13023717plg.27.1634330527083; 
 Fri, 15 Oct 2021 13:42:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k22sm5510344pfi.149.2021.10.15.13.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 13:42:06 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] target/riscv: zfh: half-precision computational
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Chih-Min Chao
 <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6cd34eee-5bbf-5487-ce70-ae07b9b6d368@linaro.org>
Date: Fri, 15 Oct 2021 13:42:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 20:42:11 -0000

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng<kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng<kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/fpu_helper.c                 |  82 ++++++++++++++
>   target/riscv/helper.h                     |  13 +++
>   target/riscv/insn32.decode                |  11 ++
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 129 ++++++++++++++++++++++
>   target/riscv/internals.h                  |  16 +++
>   5 files changed, 251 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

