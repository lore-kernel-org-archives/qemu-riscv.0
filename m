Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtveR-0001Gw-TA
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 12:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtveP-0001FK-K9
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 12:13:25 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtveN-0004sX-Gy
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 12:13:25 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w17so2432625ply.11
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 09:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fBm5hZgFujUHFULHB1pK8zNcNx27ppuWa0g86R80LDc=;
 b=fOBiryRsDmvMf8LymBJsbbKThdTGEet69mf+0w88SlPrGJ/Od1/+XjU4xvuhFzUEo2
 ch1cR4xXroWQv0j6amg9SnpvsNq4mMw0BNlGdSS+NTR+IzrK0YB9Hl/QwtLBg694uCJn
 h4GweWuiElUrYYVixUGzLA0ygVrBVlsL7fUnAKoYjyFEMf2lOT645cFdR/8KSo8ZHDnm
 q/azds4jKesL7Uxv8F9EGgnpclO2J8NrZvU06fWS6AToYxCH8oKmtgINi329t+LhsPL3
 fivLJDBR8/+KGF5g8UkfNfYfYWonKLP+2H6j+md7EMqzd4gFjWQOalGSxbEkq0Au8jn7
 c3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fBm5hZgFujUHFULHB1pK8zNcNx27ppuWa0g86R80LDc=;
 b=EfcO/+kwDXcEP1TzOeFJTQZ3JILoDNFbZoGUGv6hyNCqPw5+OV6Pg9uGUuIJ9lX46i
 NOCO7ycNxTkP8dtKlLjgn09qo/LW2/JflzF84r27etJyUQQOsCDXSNn7Dc6eKnQBURhz
 gKE/HaJOBr/L31uO/0sl9LI+EUx3DhKK06uohHrFy9Y7kx9YA2GBwnbN70IX+MS5RTa+
 QvoO28Nf5mkV7WFUzNQlqhyeUdoSOAX5p/BOoFV93jXIBTgPl5q3BTGPGzYR+LOo/3XV
 OWCK6cxv0GHIcdTcH9UC+q0eOJoySVtYjJBGYYlMamDLxbAeH1jc142h+YtI5nQJBqWj
 mn/A==
X-Gm-Message-State: AOAM5309TYnI6OeCbRB7283oVad+xmya+8Xzo0wQmW66XHkqA35K8jqR
 r6ORx/87i25D2MTF9c0orK18AQ==
X-Google-Smtp-Source: ABdhPJwFv0WTemwCdTxktHM8F0Uk98VEix6QxR3UTTHA4N0KXy/vStiik+w20OB2OWWaXqkA6rRhag==
X-Received: by 2002:a17:902:ab8e:: with SMTP id
 f14mr61844056plr.80.1594397601411; 
 Fri, 10 Jul 2020 09:13:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id bf11sm6068112pjb.48.2020.07.10.09.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 09:13:20 -0700 (PDT)
Subject: Re: [RFC 02/65] target/riscv: correct the gvec IR called in
 gen_vec_rsub16_i64()
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77653025-0e43-be40-07de-d60a76a25b03@linaro.org>
Date: Fri, 10 Jul 2020 09:13:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 16:13:26 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Alistair, this one should be queued for 5.1 as a bug fix.


r~


