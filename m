Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbMb-0001yz-49
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbMX-0001y3-Kg
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 13:17:21 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbMV-00087p-5u
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 13:17:21 -0500
Received: by mail-oi1-x230.google.com with SMTP id 9so21411184oiq.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 10:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iboqR0JaPJP45sAncPXuHIElZaKRfos8itZu0T6CBvA=;
 b=WrrQ8tj18Nv7B9Xc/GWTud6bHAn5FMjcWSCVX79phHDQ8XUlKYcMm/sIQsFpfzttAC
 wGqTj734ZgSf0n7yQX2iiZnRioROq8Mee+dlvlsiAHWsCM0+rRNDfzBreXKPxATNCKaM
 EWJkdZrBhOzn3TIYFdLaV0OfUibebC9O/BwJCoJlOYXD5axs3JEu/F81+sRXNisLx4aB
 uVzyP+jNVF6GQG0qUaAmlx7wCaMsLzSbptwR/QNSnnVX9RX42fnH4TWqgUzw/9cHvEsi
 BbAt23PEFzTum8IvxCPTeAq3xE0MEbsQjWAY9gITKz+T5IFYACBDxovgkXCKYNGtgSnj
 vVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iboqR0JaPJP45sAncPXuHIElZaKRfos8itZu0T6CBvA=;
 b=nqf6NKPhBnZBfi8eZwjqUZOBP0VLlqbOnDvnbXklNXHl77sgNP8mfJ6bwCKUAP2Fh3
 wux8NriW+ZriS8up/2PNAS/tBbED9nATH2OaoUrTXpIVKiJgioK/OYEskYSy2KaxJD70
 wL6wWSlgOfEIcM0Hgyv2HZFS03EKXIGSR8qoyHJtSFidvLiVbNlvkv72dMSVj3Xk0uIE
 BKNCFAZbIsxZ9AQjanj4P5dFf7ku+5hkLwXKoUNafjEd8dn8gddwM46X05liZYPIRLvn
 AI1FGjhzQUR2Z5H5WRowr0/3Vo6MrIP1dyVAqbWKQXmzlX10JurfA+ePz8tZYfONTCbC
 oHtQ==
X-Gm-Message-State: AOAM532A4fmjdgx6suDbganJtZOfeNJT3ZnFYEkrYeMU6pl3t2BROXp1
 ES7wWQrXNaPDZHQEdkYBzGCifw==
X-Google-Smtp-Source: ABdhPJwM85Z+ltoEPp2eFfC729jPPKd60VskZHaoLkcsjmhw0KBDEJsZbl95roST6+YVI913HV/1MA==
X-Received: by 2002:aca:f44f:: with SMTP id s76mr2814799oih.120.1608142636442; 
 Wed, 16 Dec 2020 10:17:16 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c6sm553794oif.48.2020.12.16.10.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:17:15 -0800 (PST)
Subject: Re: [RFC v2 13/15] target/riscv: rvb: address calculation
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-14-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3adee95-25a8-adfa-dc35-22b3aed5d9c5@linaro.org>
Date: Wed, 16 Dec 2020 12:17:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-14-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 18:17:22 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  3 +++
>  target/riscv/insn32.decode              |  3 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 23 ++++++++++++++++++
>  target/riscv/translate.c                | 32 +++++++++++++++++++++++++
>  4 files changed, 61 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

