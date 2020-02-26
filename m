Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j719s-0000wl-El
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 13:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41289)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j719p-0000rO-O4
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 13:11:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j719o-0007fZ-KW
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 13:11:41 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:33094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j719l-0007ap-Ux; Wed, 26 Feb 2020 13:11:38 -0500
Received: by mail-lf1-x144.google.com with SMTP id n25so60543lfl.0;
 Wed, 26 Feb 2020 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c351DyWQ+Gmtx+Bf4ryed4Khj6jAP6+d4gMwETGlGiI=;
 b=D7XolxHsOxfl9ub+vMKmZIGpTkM9g6Yz4f+9Ou/gRqw4HfHk9JQUff2/Ue1ugoMEzk
 15lKH2Ik9XRLX9hv7owlqn2PpiFHUhGEP5n+uqDzQPDbSgK5OTm00fOD/VACArp1k/hH
 QAzUVI8OpTAYtxR+qJKfh5JEDM9t+tRgPCSNxDsJzkaCvGm1li53mWSeHdgYkfFVSpAo
 2+yUkMrV83f5uZ0DTq6z/whLEpY1hK63m+y9x6K5xVyQTNzejR/qt1574ScJt0GfqX5q
 90U+T4wEEu6DUoWfwwhSVuQC/MqmA3o2ZMQWTXFfczETv5Mpznk6Mxce5Z8o7pzToaC9
 l2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c351DyWQ+Gmtx+Bf4ryed4Khj6jAP6+d4gMwETGlGiI=;
 b=Pd9QmDfMeK4jUsLf3BQ1m0z7v5XByUjXgfsy9QQI9QmKCqUejGHQxL4bc2xstbEYxP
 ZmY5CQ38wzS9HFDXNaeycU/Xlc2hsnyRF8ZsMQVCzijw9v5MvHRjH2nZHUsT6/KfBZoF
 pbAPteIpxMK3BbZMX4mNse7oeqj84J0LpqtbMCDoYiCAUgFf+VR8NZ5CuKsIoomOZVIr
 xxCgBxTElENi6/zrPc7V8xbt3nODqZRlpnghAuhUJeTwp0SgSvIAbFnZ8ldmuqnSZNgR
 ZUr32odSU/2EwNrXz0XpROWS+gbyWpMWwXcBpfqo9R4y+uZTzKVvD6jWYL+Fj75P/qV3
 x2sA==
X-Gm-Message-State: APjAAAUBIwPCkM6TOupuzHeQ9jntrPde9zk0YdRhFx3RfZ1QF5KPZf6j
 /nMWx1xH4/4UEFOxe1WnHMQk7N4U5aDC/p5ip6o=
X-Google-Smtp-Source: APXvYqyskLVV7uP/IY30dsz9s4lD1EyYtTp24ZR2KREBubh05vX1rJCg60NjP53IaUzHuHRZ+oAU64Hs3w9B3VJmd60=
X-Received: by 2002:a19:4a:: with SMTP id 71mr3239678lfa.50.1582740696293;
 Wed, 26 Feb 2020 10:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
 <20200221094531.61894-2-zhiwei_liu@c-sky.com>
In-Reply-To: <20200221094531.61894-2-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Feb 2020 10:03:58 -0800
Message-ID: <CAKmqyKMGp_MdJuRZHDNHxAD2wR6xet8DQ6Umt-NO7uT-cr_P6w@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] target/riscv: add vector extension field in
 CPURISCVState
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
X-Received-From: 2a00:1450:4864:20::144
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
X-List-Received-Date: Wed, 26 Feb 2020 18:11:43 -0000

On Fri, Feb 21, 2020 at 1:45 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> The 32 vector registers will be viewed as a continuous memory block.
> It avoids the convension between element index and (regno, offset).
> Thus elements can be directly accessed by offset from the first vector
> base address.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de0a8d893a..2e8d01c155 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -64,6 +64,7 @@
>  #define RVA RV('A')
>  #define RVF RV('F')
>  #define RVD RV('D')
> +#define RVV RV('V')
>  #define RVC RV('C')
>  #define RVS RV('S')
>  #define RVU RV('U')
> @@ -93,9 +94,20 @@ typedef struct CPURISCVState CPURISCVState;
>
>  #include "pmp.h"
>
> +#define RV_VLEN_MAX 512
> +
>  struct CPURISCVState {
>      target_ulong gpr[32];
>      uint64_t fpr[32]; /* assume both F and D extensions */
> +
> +    /* vector coprocessor state. */
> +    uint64_t vreg[32 * RV_VLEN_MAX / 64] QEMU_ALIGNED(16);
> +    target_ulong vxrm;
> +    target_ulong vxsat;
> +    target_ulong vl;
> +    target_ulong vstart;
> +    target_ulong vtype;
> +
>      target_ulong pc;
>      target_ulong load_res;
>      target_ulong load_val;
> --
> 2.23.0
>

