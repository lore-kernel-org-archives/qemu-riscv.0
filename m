Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k09Cj-0005lo-0o
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jul 2020 15:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1k09Cg-0005h9-Uu
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2020 15:54:30 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1k09Ce-000535-Nh
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2020 15:54:30 -0400
Received: by mail-pl1-x644.google.com with SMTP id t10so3381418plz.10
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2020 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LkjO/cjzcpkQefychi/w6VxjU4c8kjVAzD/aJw8Q+/s=;
 b=0ebWBQ8CrEJEv+3AU9F+gwV5ASCNGDTjEyy8UH6BwT+3RTJ12oqrngq/IDOC4HHe73
 XJM7mqREguQczb6nBIOaM+6uyNtO0GVHrIhHi/5WODpKsUvwXd1bzkSPuMZMs+FeN2n/
 zW3GdiZ5NTeVq/4UFlAJAdB5zZmsT3QvCugsBGDfx3KcEPVzwypbaQD8tXJjNvWO/iOG
 KN5e+BQym6pSzl8OPa1rScqquRz6e6jL+UL5MLtdPlafhdgnPHfi5oujSffRJbXJTwaS
 NCe+OpMvZlXUgYfMIgjeeXCsRJ7g6mh8ihZ7qkjO9kcCzSMlgfFdJ7KqVbU7RQqF/+MK
 skJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LkjO/cjzcpkQefychi/w6VxjU4c8kjVAzD/aJw8Q+/s=;
 b=EZStT54sLJg1aIq2rD87jMjNl1ogaKAb25PrWq5KRBOaBrq4C4+3BkEagDHt+/TTXX
 B/prhzq1o+onNUyT1aHAYag4Gm36ERC0O01GvpHrBjdRaKnEBNV3Q2yUmuF012l60d+4
 1gmf74o3aEj43ZQOgBbcs8hrkk74K5eFmb+8D5+fO9/hkZpT0+LNQ1M/V2wUSVYdHUqv
 0zjIIYq1lFwdXlm3nLJAY1GRGg9Cy1yOGTp3353Kel10FRmO82magr/Xh3e563JvapKV
 ac8TJys+xzqy0i1LsTy9YW7y0RiVParbX5qC+ZiXvHwl1J6OGweV8UMg+udLBDbE3oHr
 VkHw==
X-Gm-Message-State: AOAM532g8sPbSdvMVmOfTF4rC9J/Xf/1K1XLt4RlgmI70sCk1ktZNcM9
 zIOckso1fLwwOsO60+zq4qEMoQ==
X-Google-Smtp-Source: ABdhPJxgTTbvZE8Wp/dt2l6REXpwmTzE6pFDEptPRql5UlglDSH0S10INxL3cNTLR4Bsyg7e0+SCmQ==
X-Received: by 2002:a17:902:8491:: with SMTP id
 c17mr19902118plo.262.1595879666701; 
 Mon, 27 Jul 2020 12:54:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h7sm16483082pfq.15.2020.07.27.12.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 12:54:26 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:54:26 -0700 (PDT)
X-Google-Original-Date: Mon, 27 Jul 2020 12:49:51 PDT (-0700)
Subject: Re: [RFC v2 01/76] target/riscv: drop vector 0.7.1 support
In-Reply-To: <20200722091641.8834-2-frank.chang@sifive.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: frank.chang@sifive.com
Message-ID: <mhng-0246b27e-f392-45a9-806e-9998bb5ede5e@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Jul 2020 19:54:31 -0000

On Wed, 22 Jul 2020 02:15:24 PDT (-0700), frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.c | 24 ++++++------------------
>  target/riscv/cpu.h |  2 --
>  2 files changed, 6 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 228b9bdb5d..2800953e6c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -106,11 +106,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
>      env->priv_ver = priv_ver;
>  }
>
> -static void set_vext_version(CPURISCVState *env, int vext_ver)
> -{
> -    env->vext_ver = vext_ver;
> -}
> -
>  static void set_feature(CPURISCVState *env, int feature)
>  {
>      env->features |= (1ULL << feature);
> @@ -339,7 +334,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      int priv_version = PRIV_VERSION_1_11_0;
> -    int vext_version = VEXT_VERSION_0_07_1;
>      target_ulong target_misa = 0;
>      Error *local_err = NULL;
>
> @@ -363,7 +357,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>
>      set_priv_version(env, priv_version);
> -    set_vext_version(env, vext_version);
>
>      if (cpu->cfg.mmu) {
>          set_feature(env, RISCV_FEATURE_MMU);
> @@ -455,19 +448,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>                  return;
>              }
>              if (cpu->cfg.vext_spec) {
> -                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
> -                    vext_version = VEXT_VERSION_0_07_1;
> -                } else {
> -                    error_setg(errp,
> -                           "Unsupported vector spec version '%s'",
> -                           cpu->cfg.vext_spec);
> -                    return;
> -                }
> +                error_setg(errp,
> +                       "Unsupported vector spec version '%s'",
> +                       cpu->cfg.vext_spec);
> +                return;
>              } else {
> -                qemu_log("vector verison is not specified, "
> -                        "use the default value v0.7.1\n");
> +                qemu_log("vector version is not specified\n");
> +                return;
>              }
> -            set_vext_version(env, vext_version);
>          }
>
>          set_misa(env, RVXLEN | target_misa);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index eef20ca6e5..6766dcd914 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -79,8 +79,6 @@ enum {
>  #define PRIV_VERSION_1_10_0 0x00011000
>  #define PRIV_VERSION_1_11_0 0x00011100
>
> -#define VEXT_VERSION_0_07_1 0x00000701
> -
>  #define TRANSLATE_PMP_FAIL 2
>  #define TRANSLATE_FAIL 1
>  #define TRANSLATE_SUCCESS 0

If I'm reading things correctly, 5.0 did not have the V extension.  This means
that we can technically drop 0.7.1 from QEMU, as it's never been released.
That said, I'd still prefer to avoid dropping 0.7.1 so late in the release
cycle (it's already soft freeze, right?).  Given the extended length of the V
extension development process it seems likely that 0.7.1 is going to end up in
some silicon, which means it would be quite useful to have it in QEMU.

I understand it's a lot more work to maintain multiple vector extensions, but
it was very useful to have multiple privileged extensions supported in QEMU
while that was all getting sorted out and as the vector drafts has massive
differences it'll probably be even more useful.

