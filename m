Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPZOv-0003vc-9O
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 20:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1pPZ5L-0007Wb-Sn; Tue, 07 Feb 2023 20:17:19 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1pPZ5J-0002kR-Ik; Tue, 07 Feb 2023 20:17:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 hv11-20020a17090ae40b00b002307b580d7eso646536pjb.3; 
 Tue, 07 Feb 2023 17:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DSLzNJuWkg7tvG4FkRF1XFIRdaFYWhWj/f0U2sJ8ERs=;
 b=PqF7cco9za+AKQPtlWSnxrC0P1jINmxBUmXZjl6Zd+5ZnoCzEzQwstQQObxOLUj6sR
 m7InSc1a+7dOokGQtkyY/qycLecITvENOO9sWZ7n2IA7dxqw9o7ZKrqFAIhW5UNnb4jX
 HkEVgF3oxtBbPuA+jsr+EJRidy8cwSbQnD3sZAOV189EF2kY22lveZNPB0kMPjv4j1vY
 jyq4WrEA7hFidomgqeRreQbcJ6BII5vGWeaGF7nJhuAg1nnDiEQj7m6VcY/yNVDl+R0Q
 B+5EecaDCh8gXtHFFwMy4fZ8oIul+tzERWjs8FhA12G1xPjfGgysxEBXO1JapI8KwRG3
 Uobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DSLzNJuWkg7tvG4FkRF1XFIRdaFYWhWj/f0U2sJ8ERs=;
 b=roWoZaDFcKTgdSOdoEXj/ZrEMobK4e7arqEuUNpoxUdXrbB1CTuqHCCMLloLnTQH31
 ty/jgs7+7JGYEaPZ39RIPNd5bbhzMpY/fxXe4QcsfZiGCmO/Lakrr0BlqFg9RltD0McU
 2UwsZ3EgB4MWb/Ag50YfG5Rfp9f3WZJtHrTRSTc8kjtzFj9UJIIvgTQeASRmSm9tsvo0
 dSKicMVZd3/Yh25bfy9nNDQvdy9qlC16ODG0ErZ3v8MVIaPREoj7lQUS8XbcyFtmi8ap
 3jFYfQDEiWs3jVIldU4BcoxkHnhXTMLsO4KWl662F7EEtWfu7jNkaIUeilsAp7w95/YB
 OLNw==
X-Gm-Message-State: AO0yUKX6BNq+LeUVGegoy9keOtvfJzwimFebsdAbjXFQaoViDE9SnfWz
 dx66Tm8rCIcMbQQNVuQ6Coo=
X-Google-Smtp-Source: AK7set+HqbvPse07obzRlgY40uoGOJD0hRl7t/Hw2r2bAVA3IXGGzdo64vyA6KaE5I0TBnHHxq2HQw==
X-Received: by 2002:a17:902:d2d0:b0:198:a338:b9c5 with SMTP id
 n16-20020a170902d2d000b00198a338b9c5mr6382446plc.2.1675819035463; 
 Tue, 07 Feb 2023 17:17:15 -0800 (PST)
Received: from [30.221.97.79] ([47.246.101.63])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a1709026b4a00b001966eaf7365sm9564492plt.17.2023.02.07.17.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 17:17:15 -0800 (PST)
Message-ID: <c74281b1-99b2-a302-7937-2a096b9c0135@gmail.com>
Date: Wed, 8 Feb 2023 09:16:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] target/riscv: Remove .min_priv_ver restriction from RVV
 CSRs
Content-Language: en-US
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20230207084341.303907-1-frank.chang@sifive.com>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <20230207084341.303907-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=baxiantai@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 07 Feb 2023 20:37:32 -0500
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
X-List-Received-Date: Wed, 08 Feb 2023 01:17:20 -0000


On 2023/2/7 16:43, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
>
> The RVV specification does not require that the core needs to support
> the privileged specification v1.12.0 to support RVV, and there is no
> dependency from ISA level. This commit removes the restriction.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/csr.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fa17d7770c4..1b0a0c1693c 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3980,20 +3980,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
>       [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
>       /* Vector CSRs */
> -    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VL]       = { "vl",       vs,     read_vl,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> +    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
> +    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
> +    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
> +    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
> +    [CSR_VL]       = { "vl",       vs,     read_vl                    },
> +    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
> +    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
>       /* User Timers and Counters */
>       [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
>       [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei


