Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j71B6-0003Sq-T8
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 13:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j71B4-0003Mb-2W
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 13:12:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j71B2-0000ma-UE
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 13:12:57 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35725)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j71B0-0000iT-8v; Wed, 26 Feb 2020 13:12:54 -0500
Received: by mail-lj1-x243.google.com with SMTP id q8so145119ljb.2;
 Wed, 26 Feb 2020 10:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sut3B69Gr8gmy8T2vubZY/jzcqTF52GVYnmkZIvPhvo=;
 b=K3+rYhsq5kCjqfvlm49btupgwUGZidu+XG6J510LsikQFNAnMEGJPdierLAIoYuP2O
 SrmXgumoZPqLEWiOfp07lV96JMxDlFMaq5IWrL9cXwbKsGzr/5uYhlxo/FkNL+/qBPP1
 MwsM4mcHJkyO/FePz1jggC+YeZvgqZ4ufpyDLQXOa5Rcbfvy1g6zKQ+Ukx0z1i8KdWP5
 xr7pFvguroQm2FCdcTP5h6cB5ovevO+BWceeDOKJ+dvcmXb+BBXD8dQE6GrQI0riF0+Q
 rHjI0oZq8SfaWYzJfdA+XCkxyf3+7usxsmwkkMo3oJ/Yd2yJ5kIa1BtQpqb092iHNtLu
 l1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sut3B69Gr8gmy8T2vubZY/jzcqTF52GVYnmkZIvPhvo=;
 b=iZL5tLZLSdUcbO+xE6dB5Uha7dLl+Fk7S7X3NNJTEePXhaLw0LPnpAwr4tXhmHHgD2
 nBHDWNcSDn1PiJ3Q6ix2gH4uloMRc6JH54Dw4sKVnBKcYVcA1qxnV9R5NA2coW9xupBz
 rBPkd9ABkctc0ih8Xj7gqFe44odZ6P8aMCj9DHYbSuII6ErZEoHh7mituKkX7SB2QeZO
 1DDnjxCnGGpequclhZTFsSfhU35heP0NmBx32EW+VQhBpnYbMLhWz7CAp5o5B+jTRM1H
 Gqq1P7ycrrRo8r+4ydeHGN6+r75l9r2lYJNGcNAUtwixxdcU2Cp3IFhMFxTK73jlrNdL
 Sm+g==
X-Gm-Message-State: ANhLgQ1r2ziBC4IobM5wPu9ENSb05w8vT2o/EjLqV0SsOvMchSaJO4Zh
 5aKPat5MopOgJeCW38vjgdF0b7LjcaL2QLeq9IQ=
X-Google-Smtp-Source: ADFU+vu4UyGUYzr1XUwVqZXVtjTjxmypgQXaF2eAAAVTWxLH1GhYtIbZsziqkpcZvLdfmV1Wm57cIGklr1ZdeyH0Zeg=
X-Received: by 2002:a2e:a36a:: with SMTP id i10mr117252ljn.107.1582740772829; 
 Wed, 26 Feb 2020 10:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
 <20200221094531.61894-3-zhiwei_liu@c-sky.com>
In-Reply-To: <20200221094531.61894-3-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Feb 2020 10:05:15 -0800
Message-ID: <CAKmqyKM10H9yjQmzWhDHo2sLxKo6bq2QxV0pdpgUq5nD+qqanQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] target/riscv: implementation-defined constant
 parameters
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
X-List-Received-Date: Wed, 26 Feb 2020 18:12:59 -0000

On Fri, Feb 21, 2020 at 1:45 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> vlen is the vector register length in bits.
> elen is the max element size in bits.
> vext_spec is the vector specification version, default value is v0.7.1.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 7 +++++++
>  target/riscv/cpu.h | 5 +++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8c86ebc109..6900714432 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -98,6 +98,11 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
>      env->priv_ver = priv_ver;
>  }
>
> +static void set_vext_version(CPURISCVState *env, int vext_ver)
> +{
> +    env->vext_ver = vext_ver;
> +}
> +
>  static void set_feature(CPURISCVState *env, int feature)
>  {
>      env->features |= (1ULL << feature);
> @@ -320,6 +325,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      int priv_version = PRIV_VERSION_1_11_0;
> +    int vext_version = VEXT_VERSION_0_07_1;
>      target_ulong target_misa = 0;
>      Error *local_err = NULL;
>
> @@ -345,6 +351,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>
>      set_priv_version(env, priv_version);
> +    set_vext_version(env, vext_version);
>      set_resetvec(env, DEFAULT_RSTVEC);
>
>      if (cpu->cfg.mmu) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 2e8d01c155..748bd557f9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -83,6 +83,8 @@ enum {
>  #define PRIV_VERSION_1_10_0 0x00011000
>  #define PRIV_VERSION_1_11_0 0x00011100
>
> +#define VEXT_VERSION_0_07_1 0x00000701
> +
>  #define TRANSLATE_PMP_FAIL 2
>  #define TRANSLATE_FAIL 1
>  #define TRANSLATE_SUCCESS 0
> @@ -117,6 +119,7 @@ struct CPURISCVState {
>      target_ulong badaddr;
>
>      target_ulong priv_ver;
> +    target_ulong vext_ver;
>      target_ulong misa;
>      target_ulong misa_mask;
>
> @@ -231,6 +234,8 @@ typedef struct RISCVCPU {
>
>          char *priv_spec;
>          char *user_spec;
> +        uint16_t vlen;
> +        uint16_t elen;
>          bool mmu;
>          bool pmp;
>      } cfg;
> --
> 2.23.0
>

