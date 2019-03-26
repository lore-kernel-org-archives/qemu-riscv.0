Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8apR-0004Lb-7O
	for mharc-qemu-riscv@gnu.org; Mon, 25 Mar 2019 21:24:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8apL-0004Ke-Gg
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 21:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8apJ-00049l-La
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 21:24:31 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h8apH-00048R-SV
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 21:24:29 -0400
Received: by mail-pg1-x542.google.com with SMTP id y3so7423050pgk.12
	for <qemu-riscv@nongnu.org>; Mon, 25 Mar 2019 18:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=8HCaggxxXBYONpbf+DzeuPS1/OCAZI99m7ku6KK8CRI=;
	b=gVd/8NxOTxBqAV0uN8sH7Gq1Sxl61KfgI2VtOnIPvbxWOD3oztRBNuwm7gRGPK8/lL
	wrZnwltblH7Gy8BwpdFsgBJOUt+exv5Q1Nm5s/jLNCU9plEzXVM1lzuiw1L6nzB3qLWn
	a2a8R4TbQr1X4AXQkwFXXv5KgKg4+21HFnRLuglWagfXMdXgV1mr8n928TdIgSZ2SIn1
	zHjWaAyNvtHI7JIb+1YKnQcnWoLY+YpQF/+9pxALRRgj+JxrN3Z1KZ87LvQti1MmRuiC
	srR5ZZu3693KBAzHrkqdh/ZzMfx326RuaXWfkYcIhdaQvPBm7JSTpSNlVDsPXLW8NHBP
	wd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=8HCaggxxXBYONpbf+DzeuPS1/OCAZI99m7ku6KK8CRI=;
	b=QJx9CXeC5mDbVF0B4dAvn/mdcCTc5IYH3wu3hihgDKB80laZ7krCI1deVPzCVHhOnB
	6dgVEtZ+rST9WccHEcSvR157RF/WaLsHOkFReaLI5x2hlWFAVlzRvt7c8AI9at7cNfv0
	m3YXy5ZJEfUB6oi6uddHi0p5Yn4puZQru2uO14iBWz9q5aIc1mdHJBkTYtJHM4i0TSTv
	7APGDxgSp34aI36J9X1c8jJVjBR3qh4+ljAjmgRugUhWDHm4QyTX1W4mDVHjhwBTp/3K
	qZ9CUB57o2EsTv63fq9GcM3Z119kSvIBf5LhnscmkjmFyZbs0/kftoCeBUG7x52DLVM9
	J2cQ==
X-Gm-Message-State: APjAAAXo4wXQ8k1l2q0E0jZeg+Cj+vGsCUETmZDOvBYNGuN7fA2NEE1y
	dmGY3dOfEGjNWhv+Td5qKGzLrQ==
X-Google-Smtp-Source: APXvYqxaSxAAGMY6rbcZUjkpIn9Azaxd0sq9eBx8YrgECmv03AaFsoDSHjbqoK/Wn0Kn0QllcRdtjQ==
X-Received: by 2002:aa7:8d49:: with SMTP id s9mr26104472pfe.248.1553563465027; 
	Mon, 25 Mar 2019 18:24:25 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
	[2001:b011:7001:1270:b809:36ef:31ed:7980])
	by smtp.gmail.com with ESMTPSA id
	n24sm37894587pfi.123.2019.03.25.18.24.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 18:24:24 -0700 (PDT)
Date: Mon, 25 Mar 2019 18:24:24 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Mar 2019 18:21:18 PDT (-0700)
In-Reply-To: <20190322204320.17777-1-cota@braap.org>
CC: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org, richard.henderson@linaro.org,
	Kito Cheng <kito.cheng@gmail.com>, 
	alex.bennee@linaro.org, aurelien@aurel32.net
From: Palmer Dabbelt <palmer@sifive.com>
To: cota@braap.org
Message-ID: <mhng-9aaa9a70-efb5-439f-9530-31b4be450a49@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 for-4.0] hardfloat: fix
 float32/64 fused multiply-add
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2019 01:24:32 -0000

On Fri, 22 Mar 2019 13:43:20 PDT (-0700), cota@braap.org wrote:
> From: Kito Cheng <kito.cheng@gmail.com>
>
> Before falling back to softfloat FMA, we do not restore the original
> values of inputs A and C. Fix it.
>
> This bug was caught by running gcc's testsuite on RISC-V qemu.
>
> Note that this change gives a small perf increase for fp-bench:
>
>   Host: Intel(R) Core(TM) i7-4790K CPU @ 4.00GHz
>   Command: perf stat -r 3 taskset -c 0 ./fp-bench -o mulAdd -p $prec
>
> - $prec = single:
>   - before:
>     101.71 MFlops
>     102.18 MFlops
>     100.96 MFlops
>   - after:
>     103.63 MFlops
>     103.05 MFlops
>     102.96 MFlops
>
> - $prec = double:
>   - before:
>     173.10 MFlops
>     173.93 MFlops
>     172.11 MFlops
>   - after:
>     178.49 MFlops
>     178.88 MFlops
>     178.66 MFlops
>
> Signed-off-by: Kito Cheng <kito.cheng@gmail.com>
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Tested-by: Palmer Dabbelt <palmer@sifive.com>

Thanks for fixing this!

> ---
>  fpu/softfloat.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 4610738ab1..2ba36ec370 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -1596,6 +1596,9 @@ float32_muladd(float32 xa, float32 xb, float32 xc, int flags, float_status *s)
>          }
>          ur.h = up.h + uc.h;
>      } else {
> +        union_float32 ua_orig = ua;
> +        union_float32 uc_orig = uc;
> +
>          if (flags & float_muladd_negate_product) {
>              ua.h = -ua.h;
>          }
> @@ -1608,6 +1611,8 @@ float32_muladd(float32 xa, float32 xb, float32 xc, int flags, float_status *s)
>          if (unlikely(f32_is_inf(ur))) {
>              s->float_exception_flags |= float_flag_overflow;
>          } else if (unlikely(fabsf(ur.h) <= FLT_MIN)) {
> +            ua = ua_orig;
> +            uc = uc_orig;
>              goto soft;
>          }
>      }
> @@ -1662,6 +1667,9 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
>          }
>          ur.h = up.h + uc.h;
>      } else {
> +        union_float64 ua_orig = ua;
> +        union_float64 uc_orig = uc;
> +
>          if (flags & float_muladd_negate_product) {
>              ua.h = -ua.h;
>          }
> @@ -1674,6 +1682,8 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
>          if (unlikely(f64_is_inf(ur))) {
>              s->float_exception_flags |= float_flag_overflow;
>          } else if (unlikely(fabs(ur.h) <= FLT_MIN)) {
> +            ua = ua_orig;
> +            uc = uc_orig;
>              goto soft;
>          }
>      }

