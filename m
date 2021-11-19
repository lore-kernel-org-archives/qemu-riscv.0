Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3IZ-0007SC-2T
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 07:47:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3IR-0007O2-P6; Fri, 19 Nov 2021 07:47:18 -0500
Received: from [2607:f8b0:4864:20::134] (port=44546
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3IP-0004xv-Ec; Fri, 19 Nov 2021 07:47:15 -0500
Received: by mail-il1-x134.google.com with SMTP id m5so1697487ilh.11;
 Fri, 19 Nov 2021 04:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Dw4MMMwcIh1hzrBxmipHZQB3X1UmtVKTgjzAlQeDCE=;
 b=VwjWAifZ1kvm1bxnZTg2tqJ2MQWI7e9iDD5ccreLCbKCjWrc4d/sA4OLQn0OWJfS5v
 I9mGY6jEIfO89mb6luvBtYqRmaZyQmRChZxgCelp0KBWPYoZ//IdLARV4fRkS3IV9yGY
 PggnyyUZi0WVPxyJm2vg6nXpXzMz12qRnBkcYl6QIIpG8qUbwE8dC2YKl7MEggziaLxd
 vvCXorzZTNNlByTmL2YpvIjebeTmBtJcAACObniirKRWUnhboz0tQiaPAeJA6IvBTsHc
 XZLHh3rLxSGcTk+ipurnyDPY9qnXmgtjZfj4gy9GZo5soVuVO2Qv7cHR++E6k6Hn5Q9X
 l88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Dw4MMMwcIh1hzrBxmipHZQB3X1UmtVKTgjzAlQeDCE=;
 b=68frXA0bvNzPLho0Yec4CjHjLWohuc81vFzX3m+0uLDMJ2cOAl8V5fb6gX9T22sUo1
 8A1jUYoTc9oJJ9oI7FcnsQGVimgj0xkrZ+lnZ3JufVIRsYLiTd/wromc75nLmOxCJbz/
 IekI5FP/qszelxdQd0II1lTgppX0KJMHoH4cWY5MqUj+uw5daIlwlWAcDlGHdT/7iZY9
 ujaxc27IR/IDllIPd+N6xfOLhVsNBXZFhM0TtDqAlFZqLf4mHf3LXeHssJEv/WBDXx7o
 alDTQ7EGxGnh584293iRRSsTiuWANiHrlCF+24OyKCuS2Ee4bk5TXT+QEXjSj3gz/8md
 5hVQ==
X-Gm-Message-State: AOAM532GLjSVrueyCwDmIz9ILVugDfumH5hn/FvcPz6OJUj6pgt1qHiJ
 Ihf7VmOeL/zEm01CBl4gS78b+w6wgAhvg3Konkg=
X-Google-Smtp-Source: ABdhPJxrn7yWRcw6pPw8Jf/n2JtYGiqeXGo38qHgjz7YQQ/sPYVb/enitEWQ2vZFpnwgp2R7fCVlKZ+r4BNLb/rQ7G8=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr4599870ilo.208.1637326031893; 
 Fri, 19 Nov 2021 04:47:11 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-19-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-19-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 22:46:44 +1000
Message-ID: <CAKmqyKMBJF+ojP3eHLqtMgySoEGt9Sov7KwwgntESAz=dqhXeA@mail.gmail.com>
Subject: Re: [PATCH v4 18/20] target/riscv: Adjust vector address with mask
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 12:47:19 -0000

On Fri, Nov 12, 2021 at 2:10 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> The mask comes from the pointer masking extension, or the max value
> corresponding to XLEN bits.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 4cd6476b82..d8083dd3a4 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -115,6 +115,11 @@ static inline uint32_t vext_maxsz(uint32_t desc)
>      return simd_maxsz(desc) << vext_lmul(desc);
>  }
>
> +static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
> +{
> +    return (addr & env->cur_pmmask) | env->cur_pmbase;
> +}
> +
>  /*
>   * This function checks watchpoint before real load operation.
>   *
> @@ -132,12 +137,12 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
>      target_ulong pagelen = -(addr | TARGET_PAGE_MASK);
>      target_ulong curlen = MIN(pagelen, len);
>
> -    probe_access(env, addr, curlen, access_type,
> +    probe_access(env, adjust_addr(env, addr), curlen, access_type,
>                   cpu_mmu_index(env, false), ra);
>      if (len > curlen) {
>          addr += curlen;
>          curlen = len - curlen;
> -        probe_access(env, addr, curlen, access_type,
> +        probe_access(env, adjust_addr(env, addr), curlen, access_type,
>                       cpu_mmu_index(env, false), ra);
>      }
>  }
> @@ -298,7 +303,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>          }
>          while (k < nf) {
>              target_ulong addr = base + stride * i + k * msz;
> -            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
>              k++;
>          }
>      }
> @@ -391,7 +396,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>          k = 0;
>          while (k < nf) {
>              target_ulong addr = base + (i * nf + k) * msz;
> -            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
>              k++;
>          }
>      }
> @@ -528,7 +533,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>          }
>          while (k < nf) {
>              abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
> -            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
>              k++;
>          }
>      }
> @@ -618,7 +623,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>          if (!vm && !vext_elem_mask(v0, mlen, i)) {
>              continue;
>          }
> -        addr = base + nf * i * msz;
> +        addr = adjust_addr(env, base + nf * i * msz);
>          if (i == 0) {
>              probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
>          } else {
> @@ -645,7 +650,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>                      break;
>                  }
>                  remain -= offset;
> -                addr += offset;
> +                addr = adjust_addr(env, addr + offset);
>              }
>          }
>      }
> @@ -661,7 +666,7 @@ ProbeSuccess:
>          }
>          while (k < nf) {
>              target_ulong addr = base + (i * nf + k) * msz;
> -            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
>              k++;
>          }
>      }
> @@ -800,7 +805,7 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
>              continue;
>          }
>          addr = get_index_addr(base, i, vs2);
> -        noatomic_op(vs3, addr, wd, i, env, ra);
> +        noatomic_op(vs3, adjust_addr(env, addr), wd, i, env, ra);
>      }
>      clear_elem(vs3, env->vl, env->vl * esz, vlmax * esz);
>  }
> --
> 2.25.1
>
>

