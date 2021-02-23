Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lEcMp-0008DI-Nx
	for mharc-qemu-riscv@gnu.org; Tue, 23 Feb 2021 13:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEcMn-00088y-8j
 for qemu-riscv@nongnu.org; Tue, 23 Feb 2021 13:25:01 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEcMk-0006u9-9G
 for qemu-riscv@nongnu.org; Tue, 23 Feb 2021 13:25:00 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b15so2400336pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Feb 2021 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xblsp+0U5++nmN462knhbrXa6iHsXKROBcjF9UkN4iE=;
 b=uuzKSlujAH7walMlNTcIe2Ps6x8OwJGL8iwKs3ZNT2Lgketh5xKwW3RcK7x3OqmIG9
 Qr0Dtv+7rJ+YRgoL6ziMPZuDR43Et+Wh80EJXPZXFCaKgCRw8YjtCVkte01jLkvs+RPE
 L/+/4uJIfulEGuHzl8HdnRmmGBXkRc/BDwZR31LkgYe3NetSCAb0fLVNYJkmzZfTVrD2
 FmDW/GvN1SOzEZC+kD1mpYXnkwXj75af6CISxn6kmGkQCu48ywtU30FSdPpB/0T25r0d
 6lN2gDfldzwUJltkWTLhDnYsReB+02Iqn/3TmNCygSPWp4ohWnpLWoYGzxSEtGWt7jfK
 NVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xblsp+0U5++nmN462knhbrXa6iHsXKROBcjF9UkN4iE=;
 b=eH7YG4Y3qY2P/B3ds7lwOAoLKYlptzYXFK4vTw67dHt4NyNWaumUvdZ60X+cWxZdST
 jQ6HgFtLSmTzCrqT381oKGwURKfWLntpu7Vz6EvtznGBglX2DK2ngTuFf1MY2K/yWhLX
 /hquaPGxIGaHwFiF2wWFn3dWtt6kc3OtR25RiDOrplTIPk57J/A3FFa9kEUE+ls3+Uok
 6Ts34/+FEcPQ541hcAKZxB3Tk3BWBnFOL9lsUVUDLIadJtosVFwpTAeUuwcFd2tfQuKs
 jp5FFUpD0b6hWKImd6Q02i6LEVs6VSOkzvefiOyvxKiMPhLPZ6sJMwDgJM9Wn/mBwHk8
 Xfzg==
X-Gm-Message-State: AOAM5318Ezl5B+iTkqfZSN6I36Zq0VUSJyrz5p7sMRXW3HRt2C6tymkE
 ra4PNH7RFF5ckw06EgUs1xBqWg==
X-Google-Smtp-Source: ABdhPJwOvF83lkFXgn/sAVAGBr0jq2d6M6Hf2P7XEpW5x97G4ya0XFJYXlLAvwXY/XbF5fKz+yCaRg==
X-Received: by 2002:a17:90a:1616:: with SMTP id
 n22mr80504pja.110.1614104696629; 
 Tue, 23 Feb 2021 10:24:56 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id c8sm4255701pjv.18.2021.02.23.10.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:24:56 -0800 (PST)
Subject: Re: [PATCH v2] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210223081951.20226-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <500b1f4a-1fe8-9e4f-cdee-2c2b35a53edb@linaro.org>
Date: Tue, 23 Feb 2021 10:24:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223081951.20226-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Tue, 23 Feb 2021 18:25:01 -0000

On 2/23/21 12:19 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
> commit: c445593, but other TB_FLAGS bits for rvv and rvh were
> not shift as well so these bits may overlap with each other when
> rvv is enabled.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> -#define TB_FLAGS_MMU_MASK   7
>  #define TB_FLAGS_PRIV_MMU_MASK                3
>  #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>  #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
...
> +FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
> +FIELD(TB_FLAGS, LMUL, 4, 2)
> +FIELD(TB_FLAGS, SEW, 6, 3)
> +FIELD(TB_FLAGS, VILL, 9, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
> -FIELD(TB_FLAGS, HLSX, 9, 1)
> +FIELD(TB_FLAGS, HLSX, 10, 1)

The only other thing that I'd add at this point is a comment about MSTATUS_FS
-- a 2-bit field at bit 13 -- for the benefit of the next person that adds
something to TB_FLAGS.


r~

