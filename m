Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7N4-0007yg-SI
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7N3-0007wz-LK
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:22:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7N2-0007tZ-3H
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:22:41 -0400
Received: by mail-pl1-x62f.google.com with SMTP id a8so1232508plm.2
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cTCBFiJGE64/Bepjg/IelyhjWfEhq9WhnnrEDVwNVCg=;
 b=SyA7ea8CF+vlogRbeyEh8+xu06zJpoQZTFRVGXfkFqkrhr3XDte+Kry75ySijvzeW2
 sel9Ui5QQgeNWzQzXjSK/lEMIjbGtc6px7gEv5YrHB/hecOMNa2XHSba3v4WBfUfY6L/
 zEiKnZpKvUlIfrowLey7AOWihGkkIy9sddRv9bZ3pg7LnS2tR8M9yTfKTnj+0EOCU0+p
 PE76bmMTBI+TQfAN6GgjlEnf4WsfTWuLIl1bJkwnF33DzGc7LK1ZB51FxeeGVHS1qNxK
 zXMmTCT1qdiPtZX/lCyzGAv68Kig12AAEXPd4y/NAaBt0tzNppsge6svfcN9VDzLBjh2
 aoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cTCBFiJGE64/Bepjg/IelyhjWfEhq9WhnnrEDVwNVCg=;
 b=FYuDRXvO72Ne6CtSlTU/qIFPRfhEJPBzNHLsKOncoI2Du/H/WVLF6OooZVywKuhpBm
 Ywg2bCIHBQjC8ZHy7Ycuh0azOqIdIU/3CFRWuZH1ux+evAnxnfRF7PuGiJSDq/aKZN54
 bD5SJIfpaacI13sIAF72gfrLZuAtSezJ8tgaHfoTolbiYSpujXqLn5IhBJmV85Vol57h
 S5pMNEkBXo1q/bgMzqW2M0Oz0TWvkbC6PCI/KlDIO2gWn593Ee73CP3chlSCojMGjEuC
 89rxjZWflgs4RigTYCi3xeqKW0LS236NzYzeHCgxxDIZ+ansRGHhiA1/PC3g+1oY4nIV
 dbwg==
X-Gm-Message-State: AOAM531ax9VIri6G7b7NJghaA8DLoq6Lu5tV0/VJ/9l2WYYN1aru+jdd
 B6iVfasXuI1KHrS8LxPzy24nyw==
X-Google-Smtp-Source: ABdhPJzKxU0UzmsRCcYNnmVF/25ESgMKQinGf8dpZje8zQ1/CO1yMj+/zwSZS0Zxl+tiX5Lr+sPGvw==
X-Received: by 2002:a17:902:788e:: with SMTP id
 q14mr3712810pll.140.1598732555528; 
 Sat, 29 Aug 2020 13:22:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u22sm3067391pgi.85.2020.08.29.13.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:22:34 -0700 (PDT)
Subject: Re: [RFC v4 46/70] target/riscv: rvv-1.0: quad-widening integer
 multiply-add instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-47-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6c3e083-dca6-9d33-78e6-bbb2f3b107af@linaro.org>
Date: Sat, 29 Aug 2020 13:22:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-47-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Sat, 29 Aug 2020 20:22:41 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the following instructions:
> 
> * vqmaccu.vv
> * vqmaccu.vx
> * vqmacc.vv
> * vqmacc.vx
> * vqmaccsu.vv
> * vqmaccsu.vx
> * vqmaccus.vx
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   |  15 ++++
>  target/riscv/insn32.decode              |   7 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 109 ++++++++++++++++++++++++
>  target/riscv/vector_helper.c            |  40 +++++++++
>  4 files changed, 171 insertions(+)

As mentioned, let's table this one for now.


r~

