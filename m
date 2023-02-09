Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQGY3-0006sx-JN
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 18:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pQGY1-0006sR-Ju; Thu, 09 Feb 2023 18:41:49 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pQGY0-00007B-1H; Thu, 09 Feb 2023 18:41:49 -0500
Received: by mail-ua1-x92f.google.com with SMTP id r12so664226uan.12;
 Thu, 09 Feb 2023 15:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wCtcVf0tIwR14HKBOOQRiVUTYh3j0a29RLHMVsEWsLs=;
 b=bwRS2mk79RcZh4NT7IcT/jYDug1Jd6IG0MnE6aIZYYvfocCeabw+Ps8oQvlrzXizyF
 cFOmJ8Q3uk8Qd6xZCzN609Iaft+H723P1nUTUAYu1tORZtszIG8iP6OES/dy8pjGuHIf
 m89iU0kHUuayuoqZAzatcGJrZmDFTSfbKuBDtqm5GiT+4yqTctNLtXL4CwTQX5Q6Qz4T
 MTQhGeTUpbK95EQV66+0S6bkwf5sIEhOLZC0E6T4Fgl9asdQyelvwPYkEgI/kZeQzI9g
 5CS+kIT9mr30u3Co2c1/fZ9pbf6nDIATrU/1MIfGgSSR1QaLENKkUplG/kTOx9Y9EQWA
 MZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wCtcVf0tIwR14HKBOOQRiVUTYh3j0a29RLHMVsEWsLs=;
 b=Ve8iMMEHVyHPkSCa7Jvv6Au5vYBglumhYc7pvylrQRdQahWkOK1FsBQwgBFrfphB8k
 SXGmEAi7cnQRnhio7H/8dPn+QWfBDvNNTM+vEHcf39Y5dywJ2XlP55iwFl2u0vjSYwCJ
 yEB6ATv7X8E1ljaE1ZvlOH0XjibhzfwMGx405ECZxk1JKhB7sd6zyvJ0IbukISVQoTa3
 E1cR6Get8G0Sadl4DnZd2Ds3yh3hkHnqwaiw7jFzpdyyuul7ivDWyA8YT6C9327su3MR
 +0UM4RxqtWWs6MdeDjS4uKMYDzQJmfb15pe7VUSWVU1lMyaqr1H1R3NPgYmiVn7QBrfa
 P5Bg==
X-Gm-Message-State: AO0yUKU9eLSh75r8Esmz19+Q6dLV6nlg+/Lo+0NyaGe8/SLrk+k6orL1
 lIFfcYVqq7br+s1K7DzZxYe7QnNjk8tcsHg16b2B3WwxrGtrbg==
X-Google-Smtp-Source: AK7set9Nl/f5TIqv1Mpz+T6QaQl/b+C/yOu1edUgRsIfRL70pOxNDNv0tScAgQZ/zPXMbfgSR2v05qj12uj19/oDEc0=
X-Received: by 2002:ab0:2401:0:b0:683:8d8f:2671 with SMTP id
 f1-20020ab02401000000b006838d8f2671mr3144127uan.24.1675986106192; Thu, 09 Feb
 2023 15:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20230208063209.27279-1-frank.chang@sifive.com>
In-Reply-To: <20230208063209.27279-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Feb 2023 09:41:20 +1000
Message-ID: <CAKmqyKO6m9pvQZb-1F75fZdvJJEpB_2aJ5Hv7822AHDb63ybfg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Remove privileged spec version
 restriction for RVV
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Bin Meng <bmeng@tinylab.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Feb 2023 23:41:50 -0000

On Wed, Feb 8, 2023 at 4:32 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> The RVV specification does not require that the core needs to support
> the privileged specification v1.12.0 to support RVV, and there is no
> dependency from ISA level.
>
> This commit removes the restriction from both RVV CSRs and extension CPU
> ISA string.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c |  2 +-
>  target/riscv/csr.c | 21 +++++++--------------
>  2 files changed, 8 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dd2f0c753..93b52b826c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -73,7 +73,7 @@ struct isa_ext_data {
>   */
>  static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
> -    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
> +    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
>      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
>      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fa17d7770c..1b0a0c1693 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3980,20 +3980,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
>      [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
>      /* Vector CSRs */
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
>      /* User Timers and Counters */
>      [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
>      [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
> --
> 2.36.1
>
>

