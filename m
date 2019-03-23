Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h7hT9-0005wg-Ag
	for mharc-qemu-riscv@gnu.org; Sat, 23 Mar 2019 10:17:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1h7gZ0-0006gc-HU
	for qemu-riscv@nongnu.org; Sat, 23 Mar 2019 09:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1h7gYz-0003xv-F2
	for qemu-riscv@nongnu.org; Sat, 23 Mar 2019 09:19:54 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37148)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1h7gYz-0003tY-0g
	for qemu-riscv@nongnu.org; Sat, 23 Mar 2019 09:19:53 -0400
Received: by mail-wr1-x444.google.com with SMTP id w10so5217187wrm.4
	for <qemu-riscv@nongnu.org>; Sat, 23 Mar 2019 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=eBjerWjcceCTqYOSq6ESPmUzeK5aTMYNH1KQlAk4Phg=;
	b=hGguzJud7VsGH9rnbwIlNxMKx/9ko9M+hEC0wIzUhoinnLzzpedt7WA+LY0ud0JkZK
	C3hJhgpT8N5cX21Q9QCYbKfWBARdYFZ/u9D6229CoDu3AebHuJz87gClAIXgUZGbi41f
	jV8LFsv2eV+SSM9928YCWHIXjBPwQR/Ss9ceyhvYm2hjfXWiWYPrVAJw7PpnOG7A6yPf
	pUQiW8XggasCvD9JJEfco8GxfwC0iF1JyjqOUkSarMv/Y8ccrIDG1lKcbsjR0qzEuCoT
	bzZyWbiAT2SHA905c2we9xxZVNbUN5P4TlhvjECZhfnIhQLdOr0Br8St+KXPU+vES0j5
	G4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=eBjerWjcceCTqYOSq6ESPmUzeK5aTMYNH1KQlAk4Phg=;
	b=kEYp4NaPBq1OPLjz7X0J6qvBn8Cj8EpiNNvAqlYAc+50UBe7GOrtc7CdyAKDZFVho+
	49L0Fqm8SlhY6cEFbjufL1aKzASY6MqW/wgawERjxR9BdC8cnqAO5f29yo2BoXcCDuHC
	TSRZaEHDYYQgmAFmSLjsWwqnTPsJfQWW9gNh1+hQx9CaS2m7YTWAkC6C/vBmwr/a/AKM
	qCakWUYPu8JvZxY1BKcoFpdEOq2s9e7fU+GThBDiHrwvRVJwMyvVENk86+r42A7G3OPP
	kcgg3zO9NQo5bIqQoxoLKaaM1Yb6qOoEkwCkw1qipsqPsp38WgdoYtt3m4aSrYtgdF7B
	YSoQ==
X-Gm-Message-State: APjAAAURFUamRsycpRjRgoIwU8ic2cEqwtZSgBEJ/BHdi3hIGhldnQ8g
	G6LXgiDUR8/OTceLNHX0qiXfbw==
X-Google-Smtp-Source: APXvYqxkxMmsuBxNF3gGz7sU4DIXWvgvtlDHzk0OKVKQtkh2bUWDmXOCDoh9u8ELoF0Onez7yuHe/Q==
X-Received: by 2002:a5d:63c4:: with SMTP id c4mr9553265wrw.307.1553347191414; 
	Sat, 23 Mar 2019 06:19:51 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id 3sm14014265wrk.68.2019.03.23.06.19.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Mar 2019 06:19:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 39B021FF87;
	Sat, 23 Mar 2019 13:19:50 +0000 (UTC)
References: <20190322204320.17777-1-cota@braap.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	Kito Cheng <kito.cheng@gmail.com>, qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>
In-reply-to: <20190322204320.17777-1-cota@braap.org>
Date: Sat, 23 Mar 2019 13:19:50 +0000
Message-ID: <874l7tvibt.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
X-Mailman-Approved-At: Sat, 23 Mar 2019 10:17:53 -0400
Subject: Re: [Qemu-riscv] [PATCH v2 for-4.0] hardfloat: fix float32/64 fused
 multiply-add
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
X-List-Received-Date: Sat, 23 Mar 2019 13:19:55 -0000


Emilio G. Cota <cota@braap.org> writes:

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

Queued to for-4.0/testing-and-fpu-fixes, thanks.

>
> - $prec =3D single:
>   - before:
>     101.71 MFlops
>     102.18 MFlops
>     100.96 MFlops
>   - after:
>     103.63 MFlops
>     103.05 MFlops
>     102.96 MFlops
>
> - $prec =3D double:
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
> ---
>  fpu/softfloat.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 4610738ab1..2ba36ec370 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -1596,6 +1596,9 @@ float32_muladd(float32 xa, float32 xb, float32 xc, =
int flags, float_status *s)
>          }
>          ur.h =3D up.h + uc.h;
>      } else {
> +        union_float32 ua_orig =3D ua;
> +        union_float32 uc_orig =3D uc;
> +
>          if (flags & float_muladd_negate_product) {
>              ua.h =3D -ua.h;
>          }
> @@ -1608,6 +1611,8 @@ float32_muladd(float32 xa, float32 xb, float32 xc, =
int flags, float_status *s)
>          if (unlikely(f32_is_inf(ur))) {
>              s->float_exception_flags |=3D float_flag_overflow;
>          } else if (unlikely(fabsf(ur.h) <=3D FLT_MIN)) {
> +            ua =3D ua_orig;
> +            uc =3D uc_orig;
>              goto soft;
>          }
>      }
> @@ -1662,6 +1667,9 @@ float64_muladd(float64 xa, float64 xb, float64 xc, =
int flags, float_status *s)
>          }
>          ur.h =3D up.h + uc.h;
>      } else {
> +        union_float64 ua_orig =3D ua;
> +        union_float64 uc_orig =3D uc;
> +
>          if (flags & float_muladd_negate_product) {
>              ua.h =3D -ua.h;
>          }
> @@ -1674,6 +1682,8 @@ float64_muladd(float64 xa, float64 xb, float64 xc, =
int flags, float_status *s)
>          if (unlikely(f64_is_inf(ur))) {
>              s->float_exception_flags |=3D float_flag_overflow;
>          } else if (unlikely(fabs(ur.h) <=3D FLT_MIN)) {
> +            ua =3D ua_orig;
> +            uc =3D uc_orig;
>              goto soft;
>          }
>      }


--
Alex Benn=C3=A9e

