Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPyHH-0000A8-B5
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 23:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPyHF-00009p-MA; Wed, 08 Feb 2023 23:11:17 -0500
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPyHD-00027A-WC; Wed, 08 Feb 2023 23:11:17 -0500
Received: by mail-vk1-xa29.google.com with SMTP id v81so340730vkv.5;
 Wed, 08 Feb 2023 20:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7IE5u3CF7FHo+qmTBvA4yART64kFGIAhneCLwymihsc=;
 b=ea4yl6EWvNaqeP46PC5nibKvWp8uUX1s3cg0LpV3kvfvf+t+dB8IwTYW36mKB7VMo+
 xf5dXmodMinVXdU0rOl92rDC56W6k9UC8cPkpNUvsNpo6DBWX+o2PV9uaI1qZW5VPID5
 4YAEOkHNQWohLknQoqfWfBktwZSk+BZGX0QoKM19dTK50y5P8t+TjsBtWL29WicDeHxt
 VYyTbsfNpFLp/pE4YZFAboW5LO3jmzIAqQVs+JFGLsOFb3vVoGqQWAbEbHAURpQQpyzO
 GiQJ7q6+aeC4aAy8PL6Xy3EqD12XfiBDvKDt1B/mGg0ydSxLEkYR3GXXPxmjHRcXMFX6
 qbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7IE5u3CF7FHo+qmTBvA4yART64kFGIAhneCLwymihsc=;
 b=y0+Dj12TTs2ceHzJPLOdPKjYUFL2R9uS3qMh2MnDjMSeZUFvt+GjBKIqU33a+9rxuM
 kFTMzH57IwB3XNyDmZyE6HwW4pYevCGg4nSYmyWvW0xD2TY6SUAww/NfA5IeFXu0U+Yv
 HeNXuzL8iiKP16rVhALrv96LL02xZ2wCEUbfXJWdzDeaLZ5BtKgQqBHuZGdW7EC7gXPh
 Zk2/fC9e4lLvhrW87hKOWjycpDBX58/j9LcPVa1rhyawR88BSZiwJOjeZj7bz8S5THC/
 ZSv+Npjn2w5Q0YTgi1ViIQoQ4WMSPuzHOn7vFjjw4PSuawWE+psWzrMxgEykYw1jsZ4N
 T9Kw==
X-Gm-Message-State: AO0yUKUUYz9dlWJTxh+FvVMw+aGDEgFK3l9znINUiVyohWKraDc40dlr
 P0tP/Tyv37eBG/P8gOZQtW2WNEZJv5wLEYDz+IY=
X-Google-Smtp-Source: AK7set+jiTylY88M6QZxqLxLLwNeFnPH1BBQgpEy/mTBK87trmPfcLg+eq3dG/k927zICFpYd1TWXvohh0P9/u/0dlk=
X-Received: by 2002:a1f:2ac9:0:b0:3e5:7064:1bf9 with SMTP id
 q192-20020a1f2ac9000000b003e570641bf9mr2361453vkq.30.1675915874485; Wed, 08
 Feb 2023 20:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20230208063209.27279-1-frank.chang@sifive.com>
In-Reply-To: <20230208063209.27279-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 14:10:48 +1000
Message-ID: <CAKmqyKMTQA6eK+HoSt0hFAf-smxdK1gqAms1dFrgyK5i=yHMJw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Remove privileged spec version
 restriction for RVV
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Bin Meng <bmeng@tinylab.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 04:11:18 -0000

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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

