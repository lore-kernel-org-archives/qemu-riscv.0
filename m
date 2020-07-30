Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k18co-00068W-Ls
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 09:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18cm-00066I-He
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:29:32 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18ck-0006eu-RP
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:29:32 -0400
Received: by mail-pl1-x635.google.com with SMTP id o1so14135050plk.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=le664zblahR5fuUIfa3M+DjSp8cBWGcGv1nGdRoW6x0=;
 b=zI79pJkyof8VS/FSM1hv3l4JCTLgNKxqMG/O64jiCtfLDnC++fbeXZOVRlMh2k8MDP
 UvokmYM32T7snYEmeARsrZHKmMRvOpxM5YX8MDonND5UUPljhwWK4ortCRkS6ICKsUHA
 2ZY/O2HdmmkdIvsOEzMlhUyHTrXc3u9WRPV3aJrvp/XfLHsPAMiC5hdUuPzSEuwE3Dj8
 k+TGArBPHUxvuLhAGuJY1nFJp5aEuoXXvItvunqg2TsJbX4w3dhvE+7AmAIrqM0wTfPP
 EF8Goh4iIP4XyNbCiwXwsoAWDnDKOxmyeYl3m+SFS1ogucQQVZj3tZegnzspxgn01XVB
 62Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=le664zblahR5fuUIfa3M+DjSp8cBWGcGv1nGdRoW6x0=;
 b=kiVqm5csLBSa6HyqiBb7tmfB+CW7PKurLx9ymVB+ZTOzVNAx06mtzyhap4XoQ+3aWM
 vohBeBT9htyPTwPGxBfl68K58sIUWElqkxcKQa2zQm3yPZioE39rUbq07Jue9WnvbMK5
 e4LCELUEgy826VHHKdvLcjZ7ybj7BirTyboZ+nIKv5kVKYWc1th6KcRVx4oFYJYG8TTd
 Wkj8aUvgwQofzXQYjzXP13jweUAOXKhXn2qsR8QdTKrotILcaqy8EG4jc1y9GG/QJ6tD
 wMENUshdM/4ZsJy0ENNh95kV9gMWj2jLB0bXLI2meS94SU+cBClenvxTlLsCOGtUZg3Z
 gjaQ==
X-Gm-Message-State: AOAM531CPJSp+DVU7qAVUUehqrbwBsQ5PuOYSfcuRem9loXSR02fZOT9
 02Zn9A1F22RQXbHZvfIhXTmck5TeW9k=
X-Google-Smtp-Source: ABdhPJwKFfkpKd8JJYtyUTtev1XCN5CKgv79Cx+Zk+cEndbTuySOgVsTwcaDB4hltMLAStsdxc3SvQ==
X-Received: by 2002:a17:90a:db03:: with SMTP id
 g3mr14105573pjv.99.1596115769416; 
 Thu, 30 Jul 2020 06:29:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k98sm5536076pjb.42.2020.07.30.06.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:29:28 -0700 (PDT)
Subject: Re: [RFC v2 35/76] target/riscv: rvv-0.9: iota instruction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-36-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3743a6c-8334-1e4e-03ef-6a0008deb7dd@linaro.org>
Date: Thu, 30 Jul 2020 06:29:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-36-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Thu, 30 Jul 2020 13:29:32 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode   | 2 +-
>  target/riscv/vector_helper.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

