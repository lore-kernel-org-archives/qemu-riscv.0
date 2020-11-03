Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ka2uN-0006Mx-8l
	for mharc-qemu-riscv@gnu.org; Tue, 03 Nov 2020 15:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2uL-0006Mj-VW
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 15:27:57 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2uJ-0005fy-RH
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 15:27:57 -0500
Received: by mail-pf1-x441.google.com with SMTP id o129so15307352pfb.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2020 12:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Om639Ofi/g0Iof/mRVhbue/JWW1RecH90mH5vKA2w8A=;
 b=F69s7tEML+b9O5dEQJoWJH+ChD2/yA8pqaJ8LMbPm0F0UFGlocd/v0Au/vYbCGynmV
 BGZaIqx8O0R+qMdtlbN9g9AaP7+npf27RUOt3t2QVMyYlawb0VLdsxxMQxjYDh/3xhAK
 TPv+aTDRLS6yZ1JvHgOox2Bofg+f4Y0x4r7cNwR+MY4AKJXIZm/088AAYPzyZ6UZ0fx9
 P1AH/1fLqVvIM5mpv9KM0xudoF6eMvxY+o4oEzyderW7kZBTUUIPlBLgWVgcfVckHxh4
 L1RF17dDIYcYgdVVzqKWI8+J0RxR+ig3558nCWzIkQz3w7teRLGSAfs2C28+Dnnp5UCw
 buvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Om639Ofi/g0Iof/mRVhbue/JWW1RecH90mH5vKA2w8A=;
 b=K7ZzoC9JKP2GSaNr8VFoeBdThJHZShLIRDwva8HUFqEG5OPfpXnwtkArwOBWpOYZN1
 omZkrxvnbFUZmsmQQ1RViUjUyujuYmPi7Y6/azKHSVPKhqrliEY2OD1PqNIY70xf6/VD
 35I4EeneAjtIFsxE+SlCkrXNdj5oRGTrEvQzdzYwOnotz55zT8tgD/N/P68EXCADMNXz
 7iwvEFva7FtFqajkxnEg42qMSLOAbR6V9GFo21IGIc+9Gp+c/G0ImXCg5VkOBJm4ygD+
 tSSr7rLrdFB7QYl0KewB7m3x1aPEmyuEPD9RvyLrevJd46NYnE2N6SrMTPtBO8kYW65s
 XtJw==
X-Gm-Message-State: AOAM531KC2/TPIVHB6KpnP4HAYwn4FqmD96dEkgjtOmGa6n7OAECfWpL
 yKCPEX4+sapDUzX46YQOF/4ic+vLNJwscA==
X-Google-Smtp-Source: ABdhPJzW91EXGVFamSmiMPlFAho5pQM1eyw6FKrpfE1D3huEg3Djyvf5aYffmzHQKJKf4iUdLlTxkQ==
X-Received: by 2002:a62:38c1:0:b029:18a:d50f:255f with SMTP id
 f184-20020a6238c10000b029018ad50f255fmr13946890pfa.22.1604435274698; 
 Tue, 03 Nov 2020 12:27:54 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id v24sm12179pjh.19.2020.11.03.12.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 12:27:54 -0800 (PST)
Subject: Re: [PATCH v3 7/7] target/riscv: Split the Hypervisor execute load
 helpers
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1604432950.git.alistair.francis@wdc.com>
 <078c49d9759ef845affe35ee690cb4242e511429.1604432950.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1edecb8-f2e7-3c38-b671-f7efde7623b6@linaro.org>
Date: Tue, 3 Nov 2020 12:27:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <078c49d9759ef845affe35ee690cb4242e511429.1604432950.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Tue, 03 Nov 2020 20:27:58 -0000

On 11/3/20 11:51 AM, Alistair Francis wrote:
> Split the hypervisor execute load functions into two seperate functions.
> This avoids us having to pass the memop to the C helper functions.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/helper.h                   |  3 +-
>  target/riscv/op_helper.c                | 36 ++++++-----------------
>  target/riscv/insn_trans/trans_rvh.c.inc | 38 ++++++++++++++++---------
>  3 files changed, 35 insertions(+), 42 deletions(-)

Modulo the access check, which should be shared,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


