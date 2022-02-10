Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nIHeG-0001OR-Af
	for mharc-qemu-riscv@gnu.org; Thu, 10 Feb 2022 17:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIHeD-0001No-VE
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 17:10:41 -0500
Received: from [2607:f8b0:4864:20::102a] (port=35539
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIHeC-0003Ny-CK
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 17:10:41 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso10124546pjg.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Feb 2022 14:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cCGZrD0xSjFqBkxphTSgpxjrlAEJTOtmMoHbko1mjSs=;
 b=x66dVqmZvDjV9qcK5yudw1AKjIYh/DKUfh3/soJOrjnehQqNarAxWqCczKJxslwV7K
 GPXVUT8j+7+am+IbOh58wCIH0c2b2CKb8b6/I0fn+o0JRD7pNCGnZgMFhBCVVwoSr/oh
 Fi1Tys/zztDl1oEd69pVFvCqs6oolfBBwrnI1iByRVZQLZFC8ix7ryJUboHCqB3Uo0WY
 Bx2YWhv2ro875D4DZlJGLtJ9r4MwxifPScda3qyA+91gS3cFdINv8M4OerMkP1+TQ0co
 rtSzKTF6sFQP2ajEsJRzmHzsY5vmGbtQJRq+7Dw2tDxRzIzMHRdUeDfLTfG7hAYE2DRV
 6Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cCGZrD0xSjFqBkxphTSgpxjrlAEJTOtmMoHbko1mjSs=;
 b=kV1cBCt5YrQYyL6Met68f2GhJPiJPh0EwBLOkHEUEEf/veYC2UnCjysy6BQmTfwUzi
 DMKG2OM4Dq+4MU4f+JcKXX/up4ZT7MySV+rxBh8wy7nRcYJOlwoNE5uTO8iQocPLLnhi
 E9Ek8EQO0/BE7TzhBnY4XMhHlsZKfx2dXNEiwvpnQLEDiCIVFN1q3CFaLa+aSsc/R/a+
 iSeLqNfvIwChi5AqROPtqW+8qndcy6O5v+kuy9revzt1L3/JJw2omSFP9eFU7RkIQiJ0
 bPj6z4KfhZNDfVUNXmD5gqbWVpglwUnS3fRHBBnRdeuS89/nyupDNGblGbxyN83tzpcI
 SLGQ==
X-Gm-Message-State: AOAM531XqN3mQztmmSAO64u7minjnBj4t1Mf1rMDi+g+HCnqdvzRQSCU
 DbGh1teVKSyQ5rPFAZJGJkI28g==
X-Google-Smtp-Source: ABdhPJw6x3HxDs7kJtoOsnzIchBcrjhbZECAvuD161F0YpTOP+sgrFYsJzeXXH8P+ZoU88M9tOMVmQ==
X-Received: by 2002:a17:902:ba98:: with SMTP id
 k24mr9425031pls.44.1644531036258; 
 Thu, 10 Feb 2022 14:10:36 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id c11sm17012508pgl.92.2022.02.10.14.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 14:10:35 -0800 (PST)
Message-ID: <313aec1f-5c19-a4a8-ef9d-ee4214e9bcd8@linaro.org>
Date: Fri, 11 Feb 2022 09:10:24 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] target/riscv: Enable Zicbo[m,z,p] instructions
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christoph Muellner <cmuellner@linux.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Weiwei Li <liweiwei@iscas.ac.cn>
References: <20220210163449.3859905-1-cmuellner@linux.com>
 <CAAeLtUAf-mXKupWuQR6vK3ZfEtyD57sStEDO6VCUS=4LnzGB5A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAAeLtUAf-mXKupWuQR6vK3ZfEtyD57sStEDO6VCUS=4LnzGB5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Feb 2022 22:10:42 -0000

On 2/11/22 03:48, Philipp Tomsich wrote:
>     -lq       ............   ..... 010 ..... 0001111 @i
>     +{
>     +  [
>     +    # *** RV32 Zicbom Standard Extension ***
>     +    cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
>     +    cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
>     +    cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
>     +
>     +    # *** RV32 Zicboz Standard Extension ***
>     +    cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
>     +  ]
>     +
>     +  # *** RVI128 lq ***
>     +  lq       ............   ..... 010 ..... 0001111 @i
>     +}

...
>     +#define REQUIRE_ZICBOM(ctx) do {               \
>     +    if (!RISCV_CPU(ctx->cs)->cfg.ext_icbom) {  \
>     +        return false;                          \
>     +    }                                          \
>     +} while (0)
> 
> 
> The exception semantics seem to be broken here: if Zicbom is not implemented, but the 
> requirements for lq (i.e. rv128) are satisfied, then this needs to be passed on to lq: "lq 
> zero, 0(rs1)" is still expected to raise exceptions based on the permissions for the 
> address at 0(rs1).
> 
> There are multiple ways to do this, including:
> 1) perform a tail-call to trans_lq, in case Zicbom is not enabled (instead of just 
> returning false);
> 2) use the table-based dispatch (added for XVentanaCondOps) and hook a Zicbom 
> disptacher before the RVI dispatcher: if Zicbom then falls through, the RVI dispatcher 
> would drop into trans_lq;

No, returning false will cause the next pattern in the { } group to be matched.  No need 
for other workarounds.


r~

